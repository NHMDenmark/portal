# frozen_string_literal: true

# Embedded model for Audubon Core or IIIF metdadata.
# http://rs.tdwg.org/dwc/terms/associatedMedia
# An action that occurs at some location during some time.
class AssociatedMedia
  include Mongoid::Document
  include RDFTransformable
  extend Mappable
  # include Mongoid::Attributes::Dynamic

  embedded_in :collection_object

  field :title,
        as: :dc_title,
        label: RDF::Vocab::DC['title'],
        type: String

  # CSPP :webscaledImageLink
  # An identifier (publication, global unique identifier, URI) of media
  # associated with the Occurrence.
  field :webscaled_image_link,
         as: :dwc_associated_media,
         label: RDF::Vocab::DWC['associatedMedia'],
         type: String

  # An arbitrary code that is unique for the resource, with the resource being
  # either a provider, collection, or media item.
  field :identifier,
        as: :dc_identifier,
        label: RDF::Vocab::DC['identifier'],
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
