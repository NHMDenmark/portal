# frozen_string_literal: true

# Controller for iiif Manifests
class ManifestsController < ApplicationController
  def show
    mnfst = IIIF::Manifest.new(CollectionObject.find(params[:id]),
                               request.original_url)

    render json: mnfst.properties.compact
  end
end
