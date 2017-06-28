class CollectionObjectsController < ApplicationController
  def index
  	@collection_objects = CollectionObject.page(params[:page]).per(10)
  end

  def show
    if params[:id] =~ /^NHMD-/
  	  @collection_object = CollectionObject.find_by(catalog_number: params[:id])
    else
      @collection_object = CollectionObject.find(params[:id])
    end
    @co_data = @collection_object.attributes.reject { |_k, v| v.is_a? BSON::ObjectId }
    @taxonomy = @collection_object.taxon_name
                                  .attributes
                                  .reject { |_k, v| v.is_a? BSON::ObjectId }
                                  .delete_if { |_k, v| v.blank? }
    @geography = @collection_object.locality
                                  .attributes
                                  .reject { |_k, v| v.is_a? BSON::ObjectId }
                                  .delete_if { |_k, v| v.blank? }
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
