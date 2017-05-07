class CollectionObjectsController < ApplicationController
  def index
  	@collection_objects = CollectionObject.all
  end

  def show
  	@collection_object = CollectionObject.find_by(catalog_number: params[:id])
  end
end
