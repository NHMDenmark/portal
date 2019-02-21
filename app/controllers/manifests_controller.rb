class ManifestsController < ApplicationController
  include RDFRenderable

  # iiif manifest

  # TODO: given that all iiif types (manifest, sequence, etc) have the same
  # properties, this should be a generic method that could go into a helper
  def iiif_properties(iiif_type = 'sc:Manifest')
    prps = {
      '@context' => 'http://iiif.io/api/presentation/2/context.json',
      '@type' => iiif_type,
      '@id' => request.original_url
    }
    prps.merge(iiif_descriptive_and_rights_properties)
        .merge(iiif_technical_properties)
        .merge(iiif_linking_properties)
        .compact
  end

  # non @type specific; all fields present in manifest, sequence, canvas, etc.
  def iiif_descriptive_and_rights_properties
    {
      label: collection_object.metadata.title,
      metadata: iiif_metadata,
      description: iiif_description,
      thumbnail: iiif_thumbnail,
      attribution: collection_object.metadata.rights_holder,
      license: collection_object.metadata.license,
      logo: iiif_logo
    }
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

  # Returns a string with a description of the manifest
  def iiif_description
    # FIXME: should really be a human readable description
    "#{collection_object.metadata.kind_of_material}"
  end

  #
  def iiif_logo
    'https://cms.ku.dk/grafik/images/topgrafik/faelles.svg'
  end

  # TODO: move to helper
  def iiif_metadata
    mdt = all_attributes(collection_object, keys: :element)
    mdt.delete(nil) # FIXME: required because all_attributes leaves an id at a
                    # nil key
    mdt.map { |key, value| { key: key, value: value } }
  end

  def iiif_thumbnail
    # should generate thumbnail from first associated media
    nil
  end

  def manifest
    render json: iiif_properties
  end

  private

  def collection_object
    CollectionObject.find(params[:id])
  end
end
