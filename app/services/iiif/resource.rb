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
        'viewingHint' => viewing_hint,
        'navDate' => nav_date,
        'seeAlso' => see_also,
        'service' => service,
        'related' => related,
        'rendering' => rendering,
        'within' => within,
        'startCanvas' => start_canvas,
        'contentLayer' => content_layer,
        'first' => first,
        'last' => last,
        'total' => total,
        'next' => next_resource,
        'previous' => previous_resource,
        'startIndex' => start_index
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

    # Linking Properties

    # A link to an external resource intended to be displayed directly to the
    # user, and is related to the resource that has the related property.
    # https://iiif.io/api/presentation/2.1/#related
    def related; end

    # A link to an external resource intended for display or download by a human
    # user.
    # https://iiif.io/api/presentation/2.1/#rendering
    def rendering; end

    # A link to a service that makes more functionality available for the
    # resource, such as from an image to the base URI of an associated IIIF
    # Image API service.
    # https://iiif.io/api/presentation/2.1/#service
    def service; end

    # A link to a machine readable document that semantically describes the
    # resource with the seeAlso property, such as an XML or RDF description.
    # https://iiif.io/api/presentation/2.1/#seealso
    def see_also; end

    # A link to a resource that contains the current resource, such as
    # annotation lists within a layer.
    # https://iiif.io/api/presentation/2.1/#within
    def within; end

    # A link from a sequence or range to a canvas that is contained within the
    # sequence.
    # https://iiif.io/api/presentation/2.1/#startcanvas
    def start_canvas; end

    # A link from a range to a layer that includes the annotations of content
    # resources for that range.
    # https://iiif.io/api/presentation/2.1/#contentlayer
    def content_layer; end

    # Paging Properties

    # A link from a resource with pages, such as a collection or layer, to its
    # first page resource, another collection or an annotation list
    # respectively.
    # https://iiif.io/api/presentation/2.1/#first
    def first; end

    # A link from a resource with pages to its last page resource.
    # https://iiif.io/api/presentation/2.1/#last
    def last; end

    # The total number of leaf resources, such as annotations within a layer,
    # within a list of pages.
    # https://iiif.io/api/presentation/2.1/#total
    def total; end

    # A link from a page resource to the next page resource that follows it in
    # order.
    # https://iiif.io/api/presentation/2.1/#next
    def next_resource; end

    # A link from a page resource to the previous page resource that precedes it
    # in order.
    # https://iiif.io/api/presentation/2.1/#prev
    def previous_resource; end

    # The 0 based index of the first included resource in the current page,
    # relative to the parent paged resource.
    # https://iiif.io/api/presentation/2.1/#startindex
    def start_index; end
  end
end
