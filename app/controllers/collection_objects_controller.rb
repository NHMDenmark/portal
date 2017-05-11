class CollectionObjectsController < ApplicationController
  def index
  	@collection_objects = CollectionObject.all[0...20] # bogus paging
  end

  def show
    if params[:id] =~ /^NHMD-/
  	  @collection_object = CollectionObject.find_by(catalog_number: params[:id])
    else
      @collection_object = CollectionObject.find(params[:id])
    end
    @taxonomy = {
      'Order' => @collection_object.taxon_name[:order],
      'Family' => @collection_object.taxon_name[:family],
      'Genus' => @collection_object.taxon_name[:genus],
      'Specific epithet' => @collection_object.taxon_name[:specific_epithet],
      'Infraspecific epithet' => @collection_object.taxon_name[:infraspecific_epithet]
    }.delete_if { |_k, v| v.nil? }
  end
end
