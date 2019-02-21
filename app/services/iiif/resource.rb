# frozen_string_literal: true

# Service objects for iiif
module IIIF
  # IIIF::PropertySets extract
  class Resource
    #
    attr_reader :context

    # The URI that identifies the resource.
    # https://iiif.io/api/presentation/2.1/#id
    attr_reader :id

    # The object for which properties are to be extracted
    attr_reader :object

    # The type of the resource (manifest, sequence, canvas, content, range...).
    # https://iiif.io/api/presentation/2.1/#type
    attr_reader :type

    def initialize(obj, url)
      @context = 'http://iiif.io/api/presentation/2/context.json'
      @id = url
      @object = obj
    end

    def properties
      {
        '@context' => context,
        '@id' => id,
        '@type' => type,
        'label' => label,
        'metadata' => metadata,
        'description' => description,
        'thumbnail' => thumbnail,
        'attribution' => attribution,
        'license' => license,
        'logo' => logo,
        'format' => mime_format,
        'height' => height,
        'width' => width,
        'viewingDirection' => viewing_direction,
        'viewingHint' => viewing_hint
      }
    end

    # Descriptive Properties

    # A longer-form prose description of the object or resource.
    # https://iiif.io/api/presentation/2.1/#description
    def description; end

    # A human readable label, name or title for the resource.
    # https://iiif.io/api/presentation/2.1/#label
    def label; end

    # A list of short descriptive entries, given as pairs of human readable
    # label and value to be displayed to the user.
    # https://iiif.io/api/presentation/2.1/#metadata
    def metadata; end

    # A small image that depicts or pictorially represents the resource.
    # https://iiif.io/api/presentation/2.1/#thumbnail
    def thumbnail; end

    # Rights Properties

    # Copyright or ownership statements, or simply an acknowledgement of the
    # owning and/or publishing institution.
    # https://iiif.io/api/presentation/2.1/#attribution
    def attribution; end

    # A link to an external resource that describes the license or rights
    # statement under which the resource may be used.
    # https://iiif.io/api/presentation/2.1/#license
    def license; end

    # A small image that represents an individual or organization associated
    # with the resource it is attached to.
    # https://iiif.io/api/presentation/2.1/#logo
    def logo; end

    # Technical Properties

    # The specific media type (MIME type) of a content resource.
    # https://iiif.io/api/presentation/2.1/#format
    def mime_format; end

    # The height of a canvas or image resource.
    # https://iiif.io/api/presentation/2.1/#height
    def height; end

    # The width of a canvas or image resource.
    # https://iiif.io/api/presentation/2.1/#width
    def width; end

    # The direction that a sequence of canvases should be displayed to the user.
    # https://iiif.io/api/presentation/2.1/#viewingdirection
    def viewing_direction; end

    # A hint to the client as to the most appropriate method of displaying the
    # resource.
    # https://iiif.io/api/presentation/2.1/#viewinghint
    def viewing_hint; end

    # A date that the client can use for navigation purposes when presenting the
    # resource to the user in a time-based user interface, such as a calendar or
    # timeline.
    # https://iiif.io/api/presentation/2.1/#navdate
    def nav_date; end
  end
end
