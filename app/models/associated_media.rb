# frozen_string_literal: true

# Embedded model for Audubon Core or IIIF metdadata.
# http://rs.tdwg.org/dwc/terms/associatedMedia
# An action that occurs at some location during some time.
class AssociatedMedia
  include Mongoid::Document
  include RDFTransformable
  extend Mappable
  # include Mongoid::Attributes::Dynamic

  self.rdf_class_term = AUDUBON['Multimedia']

  embedded_in :collection_object
  # An arbitrary code that is unique for the resource, with the resource being
  # either a provider, collection, or media item.
  field :identifier,
        as: :dc_identifier,
        label: RDF::Vocab::DC['identifier'],
        type: String

  # dc:type may take as value any type term from the DCMI Type Vocabulary.
  # Recommended terms are Collection, StillImage, Sound, MovingImage,
  # InteractiveResource, Text. Values may be used either in their literal form,
  # or with a full namespace (e. g. http://purl.org/dc/dcmitype/StillImage) from
  # a controlled vocabulary, but the best practice is to use the literal form
  # when using dc:type and use dcterms:type when you can supply the URI from a
  # controlled vocabulary and implementers may require this practice.
  # At least one of dc:type and dcterms:type must be supplied but, when
  #feasible, supplying both may make the metadata more widely useful. The values
  # of each should designate the same type, but in case of ambiguity
  # dcterms:type prevails.
  field :type,
        as: :dce_type,
        label:  RDF::Vocab::DC11['type'],
        type: String

  # A full URI preferably from among the type URIs specified in the DCMI Type
  # Vocabulary (http://dublincore.org/documents/dcmi-type-vocabulary/#H7).
  # Recommended terms are those URIs whose labels are Collection, StillImage,
  # Sound, MovingImage, InteractiveResource, or Text (e.g.
  # http://purl.org/dc/dcmitype/Collection). Also recommended are the full URIs
  # of ac:PanAndZoomImage, ac:3DStillImage, and ac: 3DMovingImage. Values MUST
  # NOT be a string, but a URI with full namespace from a controlled vocabulary.
  field :type_uri,
        as: :dc_type,
        label: RDF::Vocab::DC['type'],
        type: String

  # The subtype should provide more specialization than the type. Possible
  # values are community-defined. For examples see the non-normative page
  # https://terms.tdwg.org/wiki/AC_Subtype_Examples.
  field :subtype_literal,
        as: :ac_subtype_literal,
        label: AUDUBON['subtypeLiteral'],
        type: String

  # Any URI may be used that provides for more specialization than the type.
  # Possible values are community-defined. For exmamples see the non-normative page
  # https://terms.tdwg.org/wiki/AC_Subtype_Examples.
  field :subtype,
        as: :ac_subtype,
        label: AUDUBON['subtype'],
        type: String

  # Concise title, name, or brief descriptive label of institution, resource
  # collection, or individual resource. This field should include the complete
  # title with all the subtitles, if any.
  field :title,
        as: :dc_title,
        label: RDF::Vocab::DC['title'],
        type: String

  # Date that the media resource was altered. The date and time must comply with
  # the World Wide Web Consortium (W3C) datetime practice, which requires that
  # date and time representation correspond to ISO 8601:1998, but with year
  # fields always comprising 4 digits.
  field :modfied,
        as: :dc_modified,
        label: RDF::Vocab::DC['modified'],
        type: DateTime

  # Point in time recording when the last modification to metadata (not
  # necessarily the media object itself) occurred. The date and time must comply
  # with the World Wide Web Consortium (W3C) datetime practice, which requires
  # that date and time representation correspond to ISO 8601:1998, but with year
  # fields always comprising 4 digits.
  field :metadata_date,
        as: :xmp_metadata_date,
        label: XMP['MetadataDate'],
        type: DateTime

  # Language of description and other metadata (but not necessarily of the image
  # itself) represented as an ISO639-2 three letter language code.
  field :metadata_language_literal,
        as: :ac_metadata_language_literal,
        label: AUDUBON['metadataLanguageLiteral'],
        type: String

  # URI from http://id.loc.gov/vocabulary/iso639-2
  field :metadata_language,
        as: :ac_metadata_language,
        label: AUDUBON['metadataLanguage'],
        type: String

  # CSPP :webscaledImageLink
  # An identifier (publication, global unique identifier, URI) of media
  # associated with the Occurrence.
  field :webscaled_image_link,
         as: :dwc_associated_media,
         label: RDF::Vocab::DWC['associatedMedia'],
         type: String

  # ...
  # ...
  # ...
  # ...
  # ...
  # ...
  # ...
  # ...
  # ...
  # ...
  # ...
  # ...
  # ...
  # ...
  # ...
  # ...
  # ...
  # ...
  # ...
  # ...
  # ...
  # ...
  # ...
  # ...

  #
  field :access_uri,
        as: :ac_access_uri,
        label: AUDUBON['accessURI'],
        type: String

  # A string describing the technical format of the resource (file format or
  # physical medium).
  field :dc_format,
        as: :dc_format,
        label: RDF::Vocab::DC['format'],
        type: String

  # A list of the names of the owners of the copyright. 'Unknown' is an
  # acceptable value, but 'Public Domain' is not.
  field :owner,
        as: :xmp_owner,
        label: XMP['Owner'],
        type: String

  # A URI pointing to structured information about rights held in and over the
  # resource. At least one of dcterms:rights and dc:rights must be supplied but,
  # when feasible, supplying both may make the metadata more widely useful. They
  # must specify the same rights. In case of ambiguity, dcterms:rights prevails.
  field :rights_uri,
        as: :dc_rights,
        label: RDF::Vocab::DC['rights'],
        type: String

  # A URL providing access to a logo that symbolizes the License.
  field :license_logo,
        as: :ac_license_logo_url,
        label: AUDUBON['licenseLogoURL'],
        type: String

  # IPTC terms have URIs that are not resolvable. Instead, visit IPTC Standard
  # Photo Metadata (July 2010) for further documentation. AC follows the URI
  # namespace of the Adobe XMP implementation of IPTC terms. This term is one of
  # several with XMP namespace http://ns.adobe.com/photoshop/1.0/ (recommended
  # prefix "photoshop".)
  field :credit,
        as: :iptc_credit,
        label: IPTC['Credit'],
        type: String

  # Information about rights held in and over the resource. A full-text,
  # readable copyright statement, as required by the national legislation of the
  # copyright holder. On collections, this applies to all contained objects,
  # unless the object itself has a different statement.
  # Do not place just the name of the copyright holder(s) here! That belongs in
  # a list in the xmpRights:Owner field, which should be supplied if dc:rights
  # is not 'Public Domain', which is appropriate only if the resource is known
  # to be not under copyright. See also the entry for dcterms:rights in this
  # document and see the DCMI FAQ on DC and DCTERMS Namespaces for discussion of
  # the rationale for terms in two namespaces. Normal practice is to use the
  # same Label if both are provided. Labels have no effect on information
  # discovery and are only suggestions.
  field :rights,
        as: :dce_rights,
        label: RDF::Vocab::DC11['rights'],
        type: String
end
