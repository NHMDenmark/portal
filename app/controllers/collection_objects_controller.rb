class CollectionObjectsController < ApplicationController
  def index
  	@collection_objects = CollectionObject.all
  end
end
