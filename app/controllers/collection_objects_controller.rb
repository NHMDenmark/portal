class CollectionObjectsController < ApplicationController
  include RDFRenderable

  def index
    if params[:query].present?
      @collection_objects = CollectionObject.search(params[:query],
                                                    page: params[:page],
                                                    per_page: 10)
    else
      @collection_objects = CollectionObject.page(params[:page]).per(10)
    end
  end

  def show
    @collection_object = CollectionObject.find(params[:id])
    record_details
  end

  def record_details
    @co = @collection_object.attributes
    @source_collection = @collection_object.source_collection
    @co.delete_if { |_k, v| v.is_a?(BSON::ObjectId) }
    @catalog_number = @co.delete :dwc_catalog_number
    @other_catalog_numbers = @co.delete :other_catalog_numbers
    @metadata = @co.delete :metadata
    @record_details = []
    @co.keys.each do |key|
      if @co[key].is_a?(BSON::Document)
        section = key.split('_')[1..-1].join('_')
        value = @co.delete(key)
        leaflet = value[:dwc_decimal_latitude] && value[:dwc_decimal_longitude] ? true : false
        @record_details << { section: section, record_details: value, leaflet: leaflet }
      end
    end
  end

  def breadcrumbs
    case action_name
    when 'object', 'show'
      [
        [@source_collection[:dwc_collection_id], @collection_object.source_collection],
        [@catalog_number, object_path(dwc_catalog_number: @catalog_number)]
      ]
    when 'index'
      []
    else
      ["define #{controller_name}#{action_name} breadcrumbs", '#']
    end
  end

  def autocomplete
    white = Text::WhiteSimilarity.new
    fields = ['dwc_recorded_by',
              'dwc_identification.dwc_type_status',
              'dwc_taxon.dwc_family',
              'dwc_taxon.dwc_scientific_name',
              'dwc_location.dwc_country',
              'dwc_location.dwc_locality']
    results = CollectionObject.search(params[:query], {
      fields: fields,
      match: :word_start,
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map do |rs|
      fields.map { |f| f.split('.').last.gsub(/^[a-z0-9]+_/, '').humanize }
            .zip( fields.map { |f| eval("rs&.#{f.split('.').join('&.')}") } )
            .select { |e| e[1]}
            .sort { |a, b| white.similarity(b[1], params[:query]) <=> white.similarity(a[1], params[:query]) }
            .take(1).flatten
    end
    render json: results.uniq
  end

  # Renders the RDF in the requested format.
  def rdf
    @collection_object = CollectionObject.find(params[:id])
    co_graph = load_graph subject(params[:dwc_catalog_number]),
                          all_attributes(@collection_object)
    render doc_type(params[:format]) => rdf_document(co_graph, params[:format])
  end
end
