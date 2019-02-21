# frozen_string_literal: true

# Service objects for iiif
module IIIF
  # IIIF::PropertySets extract
  class Manifest < Resource
    # The object for which properties are to be extracted
    attr_reader :object

    # FIXME: to remove trainwrecks, pass in a kind of all attributes hash
    # instead of obj
    def initialize(obj, url)
      @type = 'sc:Manifest'
      super
    end

    def attribution
      # FIXME: no trainwrecks!
      object.metadata.rights_holder
    end

    def description
     # iiif_description
     "#{object.dwc_taxon.vernacular_name || object.dwc_taxon.scientific_name_current}"\
     " from #{object.dwc_location.higher_geography}"
    end

    def label
      # FIXME: no trainwrecks!
      object.metadata.title || raise('label is mandatory')
    end

    def license
      # FIXME: no trainwrecks!
      object.metadata.license
    end

    def logo
      'https://cms.ku.dk/grafik/images/topgrafik/faelles.svg'
    end

    def metadata
      # TODO: extract metadata
    end

    def nav_date
      # FIXME: no trainwrecks!
      object.dwc_event.collection_date.to_time
    end

    def thumbnail
      # TODO: extract first associated media, if present and image
    end

    def viewing_direction; end

    def viewing_hint
      'individuals'
    end
  end
end
