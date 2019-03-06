# frozen_string_literal: true

# Service objects for iiif
module IIIF
  # IIIF::PropertySets extract
  class Canvas < Resource
    # The object for which properties are to be extracted
    attr_reader :variants
    attr_reader :base

    # FIXME: to remove trainwrecks, pass in a kind of all attributes hash
    # instead of obj
    def initialize(obj, url)
      @type = 'sc:Canvas'
      super

      # FIXME: duplication, occurs also in content.rb
      @variants = object.ac_service_access_points
      @base = variants.find_by!(variant_description: 'iiif_image_api_2.1')
    end

    def attribution
      object.credit || object.owner
    end

    def description
      object.description
    end

    # Required
    def height
      base.height
    end

    def images
      [
        IIIF::Content.new(object,
                          "http://localhost:3000/object/iiif/"\
                          "#{object.collection_object.catalog_number}/"\
                          "annotation/#{object.identifier}",
                          :image).properties.compact
      ]
    end

    # Required
    def label
      object.title
    end

    def license
      object.rights_uri
    end

    def logo
      object.attribution_logo
    end

    def metadata; end

    def other_content
      #
    end

    def properties
      props = super
      props['images'] = images
      props['otherContent'] = other_content
      props
    end

    def related; end

    def rendering; end

    def see_also
      # should render RDF from AudubonCore properties
    end

    def service; end

#     "@id" : "http://example.org/iiif/book1/canvas/p1/thumb.jpg",
    def thumbnail
      tn = variants.find_by('variant' => AUDUBON['Thumbnail'])
      {
        '@id' => tn&.access_uri,
        '@type' => 'dctypes:Image',
        'width': tn.width,
        'height': tn.height,
      }
    end

    def viewing_hint; end

    # Required
    def width
      base.width
    end

    def within
      # FIXME: should use base url
      "http://localhost:3000/object/iiif/"\
      "#{object.collection_object.catalog_number}/sequence/normal"
    end
  end
end
