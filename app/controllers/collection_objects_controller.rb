class CollectionObjectsController < ApplicationController
  def index
    if params[:query].present?
      @collection_objects = CollectionObject.search(params[:query], page: params[:page])
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
    @taxon = @collection_object.taxon
    @location = @collection_object.location
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
end
