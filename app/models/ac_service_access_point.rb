class AcServiceAccessPoint
  include Mongoid::Document
  extend Mappable

  # FIXME: This is not a class term
  self.rdf_class_term = AUDUBON['hasServiceAccessPoint']

  embedded_in :associated_media

  # A URI that uniquely identifies a service that provides a representation of
  # the underlying resource. If this resource can be acquired by an http
  # request, its http URL should be given. If not, but it has some URI in
  # another URI scheme, that may be given here.
  # Same as +identifier+?
  field :access_uri,
        as: :ac_access_uri,
        label: AUDUBON['accessURI'],
        type: String

  # A string describing the technical format of the resource (file format or
  # physical medium).
  field :format,
        as: :dce_format,
        label: RDF::Vocab::DC11['format'],
        type: String

  # URI referencing the technical format of the resource (file format or
  # physical medium).
  field :format_URI,
        as: :dc_format,
        label: RDF::Vocab::DC['format'],
        type: String

  # Text that describes this Service Access Point variant.
  field :variant_literal,
        as: :ac_variant_literal,
        label: AUDUBON['variantLiteral'],
        type: String

  # A URI designating what this Service Access Point provides. Some suggested
  # values are ac:Thumbnail, ac:Trailer, ac:LowerQuality, ac:MediumQuality,
  # ac:GoodQuality, ac:BestQuality, and ac:Offline.
  field :variant,
        as: :ac_variant,
        label: AUDUBON['variant'],
        type: String

  # Text that describes this Service Access Point variant.
  field :variant_description,
        as: :ac_variant_description,
        label: AUDUBON['variantDescription'],
        type: String

  # The URL of a Web site that provides additional information about the version
  # of the media resource that is provided by the Service Access Point.
  field :further_information,
        as: :ac_further_information_url,
        label: AUDUBON['furtherInformationURL'],
        type: String

  # The licensing statement for this variant of the media resource if different
  # from that given in the License Statement property of the resource.
  field :licensing_exception,
        as: :ac_licensing_exception,
        label: AUDUBON['licensingException'],
        type: String

  # A term that describes what service expectations users may have of the
  # +access_uri+. Recommended terms include
  # - +online+ (denotes that the URL is expected to deliver the resource)
  # - +authenticate+ (denotes that the URL delivers a login or other
  #   authentication interface requiring completion before delivery of the
  #   resource)
  # - +published(non digital)+ (denotes that the URL is the identifier of a non-
  #   digital published work, for example a doi.)
  field :service_expectation,
        as: :ac_service_expectation,
        label: AUDUBON['serviceExpectation'],
        type: String

  # The cryptographic hash function used to compute the value given in the Hash
  # Value.
  field :hash_function,
        as: :ac_hash_function,
        label: AUDUBON['hashFunction'],
        type: String

  # The value computed by a hash function applied to the media that will be
  # delivered at the access point.
  field :hash_value,
        as: :ac_hash_value,
        label: AUDUBON['hashValue'],
        type: String

  # The width in pixels of the media specified by the access point.
  field :width,
        as: :exif_pixel_x_dimension,
        label: EXIF['PixelXDimension'],
        type: Integer

  # The height in pixels of the media specified by the access point.
  field :height,
        as: :exif_pixel_y_dimension,
        label: EXIF['PixelYDimension'],
        type: Integer
end
