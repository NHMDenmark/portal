class AnnotationsController < ApplicationController
  def show
    md = CollectionObject.find(params[:id])
                         .associated_media
                         .find_by(identifier: params[:name])
    an = IIIF::Content.new(md, request.original_url, :image)
    render json: an.properties.compact
  end
end
