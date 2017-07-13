class CollectionObjectsController < ApplicationController
  def index
    if params[:query].present?
      @collection_objects = CollectionObject.search(params[:query], page: params[:page], per_page: 10)
    else
  	  @collection_objects = CollectionObject.page(params[:page]).per(10)
  	end
  end

  def show
    if params[:id] =~ /^NHMD-/
  	  @collection_object = CollectionObject.find_by(catalog_number: params[:id])
    else
      @collection_object = CollectionObject.find(params[:id])
    end
    @dwc_event = @collection_object.dwc_event
    @dwc_identification = @collection_object.dwc_identification
    @dwc_location = @collection_object.dwc_location
    @dwc_taxon = @collection_object.dwc_taxon
    @record_metadata = @collection_object.record_metadata
  end

  def rdf
    @dc = RDF::Vocab::DC11
    @dwc = RDF::Vocab::DWC
    @geo = RDF::Vocab::GEO
    @dwcc = RDF::Vocabulary.new('http://rs.tdwg.org/dwc/curatorial/')
    @prefixes = {
      rdf: 'http://www.w3.org/1999/02/22-rdf-syntax-ns#',
      xsi: 'http://www.w3.org/2001/XMLSchema-instance',
      xs: 'http://www.w3.org/2001/XMLSchema',
      dwc: 'http://rs.tdwg.org/dwc/terms/',
      dc: 'http://purl.org/dc/terms/',
      geo: 'http://www.w3.org/2003/01/geo/wgs84_pos#'
    }
    if params[:id] =~ /^NHMD-/
  	  @collection_object = CollectionObject.find_by(catalog_number: params[:id])
    else
      @collection_object = CollectionObject.find(params[:id])
    end
    @collection_object.attributes.map do |field|
			[@dwc[field.first.camelize(:lower)], field.last]
		end
  end

  def autocomplete
    white = Text::WhiteSimilarity.new
    fields = ['recorded_by',
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
