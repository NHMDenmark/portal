module IIIF
  # IIIF::Contents wrap
  class Content < Resource
    attr_reader :variants
    attr_reader :base

    def initialize(obj, url, motivation)
      @type = 'oa:Annotation'
      @motivation = case motivation
                    when :image
                      'sc:painting'
                    when :annotation
                      'oa:commenting'
                    when :link
                      'oa:linking'
                    end
      super(obj, url)

      # FIXME: duplication, occurs also in canvas.rb
      @variants = object.ac_service_access_points
      @base = variants.find_by!(variant_description: 'iiif_image_api_2.1')
    end

    # FIXME: duplication, occurs also in canvas.rb
    def attribution
      object.credit || object.owner
    end

    # FIXME: duplication, occurs also in canvas.rb
    def description
      object.description
    end

    # FIXME: duplication, occurs also in canvas.rb
    def height
      base.height
    end

    # FIXME: duplication, occurs also in canvas.rb
    def label
      object.title
    end

    # FIXME: duplication, occurs also in canvas.rb
    def license
      object.rights_uri
    end

    # FIXME: duplication, occurs also in canvas.rb
    def logo
      object.attribution_logo
    end

    def metadata; end

    def properties
      props = super

      # FIXME: should be passed in to Resource initializer as params to create ad hoc resource
      props['resource'] = {
        '@id' => base&.access_uri,
        '@type' => 'dctypes:Image',
        'format' => base&.format,
        'service' => {
          '@context' => 'http://iiif.io/api/image/2/context.json',
          '@id' => base&.access_uri,
          'profile' => 'http://iiif.io/api/image/2/level2.json'
        },
        'width' => base.width,
        'height' => base.height
      }
      props
    end

    def related; end

    def rendering; end

    def see_also; end

    def service; end

    # FIXME: duplication, occurs also in canvas.rb
    def thumbnail
      tn = variants.find_by('variant' => AUDUBON['Thumbnail'])
      {
        '@id' => tn&.access_uri,
        '@type' => 'dctypes:Image',
        'width': tn.width,
        'height': tn.height,
      }
    end

    # FIXME: duplication, occurs also in canvas.rb
    def width
      base.width
    end

    def within
      # FIXME: should use base url
      "http://localhost:3000/object/iiif/"\
      "#{object.collection_object.catalog_number}/canvas/"\
      "#{object.provider_managed_id}"
    end
  end
end
