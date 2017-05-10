class SourceCollectionsController < ApplicationController
  def index
    @collections = SourceCollection.all
  end

  def show
    @collection = SourceCollection.find params[:id]
  end
end
