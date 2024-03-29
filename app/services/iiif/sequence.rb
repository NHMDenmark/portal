# frozen_string_literal: true

# Service objects for iiif
module IIIF
  # IIIF::PropertySets extract
  class Sequence < Resource
    # The object for which properties are to be extracted
    attr_reader :object

    # FIXME: to remove trainwrecks, pass in a kind of all attributes hash
    # instead of obj
    def initialize(obj, url)
      @type = 'sc:Sequence'
      super
    end

    def attribution
      # FIXME: no trainwrecks!
      object.metadata.rights_holder
    end

    def canvases
      # FIXME: should use base url
      cv_url = "http://localhost:3000/object/iiif/#{object.catalog_number}"\
               "/canvas/"
      object.associated_media.map do |media|
        IIIF::Canvas.new(media,
                         cv_url + media.provider_managed_id).properties.compact
      end
    end

    def description; end

    def label
      "All Images for #{object.catalog_number}"
    end

    def license
      # FIXME: no trainwrecks!
      object.metadata.license
    end

    def logo
      'https://cms.ku.dk/grafik/images/topgrafik/faelles.svg'
    end

    def metadata; end

    def properties
      props = super
      props['canvases'] = canvases
      props
    end

    def related; end

    def rendering; end

    def see_also; end

    def service; end

    def start_canvas
      # TODO: is there a way to automatically designate one?
    end

    def thumbnail
      # TODO: extract first associated media, if present and image
    end

    def viewing_direction; end

    def viewing_hint
      'individuals'
    end

    def within
      # FIXME: should use base url
      "http://localhost:3000/object/iiif/#{object.catalog_number}/manifest"
    end
  end
end
