class SequencesController < ApplicationController

  def show
    manifest_object = CollectionObject.find(params[:id])
    hsh = { id: params[:id], name: params[:name] }
    render json: hsh
  end
end
