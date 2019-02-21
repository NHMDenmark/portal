# frozen_string_literal: true

class ManifestsController < ApplicationController
  include RDFRenderable

  # iiif manifest

  # TODO: given that all iiif types (manifest, sequence, etc) have the same
  # properties, this should be a generic method that could go into a helper
  def iiif_properties(iiif_type = 'sc:Manifest')
    mnfst = IIIF::Manifest.new(collection_object, request.original_url)
    mnfst.properties.compact
  end

  # type specific (below for manifest)
  def iiif_structural_properties
    {
      sequences: collection_object.associated_media, # required!
      structures: nil # if there are Ranges, they go here
    }
  end

  # TODO: move to service
  def iiif_metadata
    mdt = all_attributes(collection_object, keys: :element)
    mdt.delete(nil) # FIXME: required because all_attributes leaves an id at a
                    # nil key
    mdt.map { |key, value| { key: key, value: value } }
  end

  def show
    render json: iiif_properties
  end

  private

  def collection_object
    CollectionObject.find(params[:id])
  end
end
