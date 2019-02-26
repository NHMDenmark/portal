# frozen_string_literal: true

# Controller for iiif Manifests
class ManifestsController < ApplicationController
  def show
    mnfst = IIIF::Manifest.new(CollectionObject.find(params[:id]),
                               request.original_url)

    render json: mnfst.properties.compact
  end
end

#   def iiif_structural_properties
#     {
#       sequences: collection_object.associated_media, # required!
#       structures: nil # if there are Ranges, they go here
#     }
#   end
