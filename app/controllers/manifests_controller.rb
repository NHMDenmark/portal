# frozen_string_literal: true

class ManifestsController < ApplicationController
  include RDFRenderable

  # iiif manifest

  # TODO: given that all iiif types (manifest, sequence, etc) have the same
  # properties, this should be a generic method that could go into a helper
  def iiif_properties(iiif_type = 'sc:Manifest')
    mnfst = IIIF::Manifest.new(collection_object, request.original_url)
    mnfst.properties.merge(iiif_technical_properties)
                    .merge(iiif_linking_properties)
                    .compact
  end

  # type specific (below for manifest)
  # FIXME: get the route for seeAlso properly
  def iiif_linking_properties
    {
      'seeAlso' => "http://localhost:3000/data/rdf/#{collection_object.catalog_number}",
      'service' => nil,
      'related' => nil,
      'rendering' => nil,
      'within' => nil
    }
  end

  # type specific (NONE in manifest)
  def iiif_paging_properties
    {
    }
  end

  # type specific (below for manifest)
  def iiif_structural_properties
    {
      sequences: collection_object.associated_media, # required!
      structures: nil # if there are Ranges, they go here
    }
  end

  # type specific (below for manifest)
  def iiif_technical_properties
    {
      'viewingDirection' => nil,
      'viewingHint' => 'individuals',
      'navDate' => collection_object.dwc_event.collection_date.to_time
    }
  end

  # TODO: moved to service; delete
  def iiif_logo
    'https://cms.ku.dk/grafik/images/topgrafik/faelles.svg'
  end

  # TODO: move to service
  def iiif_metadata
    mdt = all_attributes(collection_object, keys: :element)
    mdt.delete(nil) # FIXME: required because all_attributes leaves an id at a
                    # nil key
    mdt.map { |key, value| { key: key, value: value } }
  end

  def manifest
    render json: iiif_properties
  end

  private

  def collection_object
    CollectionObject.find(params[:id])
  end
end
