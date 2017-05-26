class LocalitiesController < ApplicationController
  def index
  end

  def show
    @locality = Locality.find(params[:id])
  end
end
