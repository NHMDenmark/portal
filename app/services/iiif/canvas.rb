# frozen_string_literal: true

# Service objects for iiif
module IIIF
  # IIIF::PropertySets extract
  class Canvas < Resource
    # The object for which properties are to be extracted
    attr_reader :object

    # FIXME: to remove trainwrecks, pass in a kind of all attributes hash
    # instead of obj
    def initialize(obj, url)
      @type = 'sc:Canvas'
      super
    end
  end
end
