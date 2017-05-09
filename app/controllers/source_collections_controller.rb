class SourceCollectionsController < ApplicationController
  def index
    @collections = SourceCollection.all
  end

  def show
  end
end
