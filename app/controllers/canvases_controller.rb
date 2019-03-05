class CanvasesController < ApplicationController
  def show
    md = CollectionObject.find(params[:id])
                         .associated_media
                         .find_by(provider_managed_id: params[:name])
    cv = IIIF::Canvas.new(md, request.original_url)
    render json: cv.properties.compact
  end
end
