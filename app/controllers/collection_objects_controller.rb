class CollectionObjectsController < ApplicationController
  def index
  	@collection_objects = CollectionObject.all
  end

  def show
    if params[:id] =~ /^NHMD-/
  	  @collection_object = CollectionObject.find_by(catalog_number: params[:id])
    else
      @collection_object = CollectionObject.find(params[:id])
    end
  end
end
