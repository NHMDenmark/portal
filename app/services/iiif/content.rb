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

    def related; end

    def rendering; end

    def see_also; end

    def service; end

    # FIXME: duplication, occurs also in canvas.rb
    def thumbnail
      variants.find_by('variant' => AUDUBON['Thumbnail'])
              &.access_uri
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
