class LocalitiesController < ApplicationController
  def index
  end

  def show
    @location = Location.find(params[:id])
  end
end
