class CollectionObjectsController < ApplicationController
  def index
    if params[:query].present?
      @collection_objects = CollectionObject.search(params[:query], page: params[:page], per_page: 10)
    else
  	  @collection_objects = CollectionObject.page(params[:page]).per(10)
  	end
  end

  def show
    @collection_object = CollectionObject.find(params[:id])
    embedded_data
  end

  def embedded_data
    @dwc_event = @collection_object.dwc_event
    @dwc_geological_context = @collection_object.dwc_geological_context
    @dwc_identification = @collection_object.dwc_identification
    @dwc_location = @collection_object.dwc_location
    @dwc_organism = @collection_object.dwc_organism
    @dwc_taxon = @collection_object.dwc_taxon
    @record_metadata = @collection_object.record_metadata
  end

  def object
    @collection_object = CollectionObject.find_by(dwc_catalog_number: params[:dwc_catalog_number])
    embedded_data
    render :show
  end

  def namespace(ns)
    case ns
    when 'dc'
      RDF::Vocab::DC11
    when 'dwc'
    	RDF::Vocab::DWC
    when 'geo'
      RDF::Vocab::GEO
    when 'dwcc'
      RDF::Vocabulary.new('http://rs.tdwg.org/dwc/curatorial/')
    else
      raise 'unknown namespace'
    end
  end

  def trim(attributes)
    attributes.reject { |_k, v| v.is_a?(BSON::ObjectId) || v.is_a?(Hash) || v.is_a?(Array) }
			        .delete_if { |_k, v| v.blank? }
			        .to_h
  end

  def prepare_terms(hash)
		hash.keys
			  .map { |k| k.split('_') }
			  .map { |k| [k.shift, k.join('_')] }
        .zip(hash.values)
			  .map(&:flatten)
			  .map { |a| { ns: a[0], term: a[1].camelize(:lower), value: a[2] } }
  end

  def rdf
    @subj = RDF::URI.new("http://localhost:3000/data/rdf/#{params[:dwc_catalog_number]}")
    @prefixes = {
      rdf: 'http://www.w3.org/1999/02/22-rdf-syntax-ns#',
      xsi: 'http://www.w3.org/2001/XMLSchema-instance',
      xs: 'http://www.w3.org/2001/XMLSchema',
      dwc: 'http://rs.tdwg.org/dwc/terms/',
      dc: 'http://purl.org/dc/terms/',
      geo: 'http://www.w3.org/2003/01/geo/wgs84_pos#'
    }
  	@collection_object = CollectionObject.find_by(dwc_catalog_number: params[:dwc_catalog_number])

  	co = prepare_terms(trim(@collection_object.attributes))

    @co_graph = RDF::Graph.new

    co.each do |field|
			@co_graph << [@subj, namespace(field[:ns])[field[:term]], field[:value]]
		end

    xml = RDF::RDFXML::Writer.buffer(prefixes: @prefixes) do |writer|
		  @co_graph.each_statement do |statement|
			  writer << statement
		  end
	  end

    render xml: xml

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
      fields.map { |f| eval("rs&.#{f.split('.').join('&.')}") }
        .compact
        .sort { |a, b| white.similarity(b, params[:query]) <=> white.similarity(a, params[:query]) }
        .first
    end
    render json: results.uniq
  end
end
