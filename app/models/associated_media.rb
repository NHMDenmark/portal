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
  # The iiif @id property
  field :identifier,
        as: :dc_identifier,
        label: RDF::Vocab::DC['identifier'],
        type: String

  # CSPP :webscaledImageLink
  # An identifier (publication, global unique identifier, URI) of media
  # associated with the Occurrence.
  # This is the endpoint of an actual viewable image, viewable without a IIIF
  # or other viewer.
  field :webscaled_image_link,
        as: :dwc_associated_media,
        label: RDF::Vocab::DWC['associatedMedia'],
        type: String

  # dc:type may take as value any type term from the DCMI Type Vocabulary.
  # Recommended terms are Collection, StillImage, Sound, MovingImage,
  # InteractiveResource, Text. Values may be used either in their literal form,
  # or with a full namespace (e. g. http://purl.org/dc/dcmitype/StillImage) from
  # a controlled vocabulary, but the best practice is to use the literal form
  # when using dc:type and use dcterms:type when you can supply the URI from a
  # controlled vocabulary and implementers may require this practice.
  # At least one of dc:type and dcterms:type must be supplied but, when
  # feasible, supplying both may make the metadata more widely useful. The
  # values of each should designate the same type, but in case of ambiguity
  # dcterms:type prevails.
  field :type,
        as: :dce_type,
        label: RDF::Vocab::DC11['type'],
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

  # Skipping
  # - http://rs.tdwg.org/ac/terms/subtypeLiteral
  # - http://rs.tdwg.org/ac/terms/subtype
  # neither may be applied to collection objects

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

  # Skipping http://ns.adobe.com/xap/1.0/MetadataDate
  # is collection_object.metadata.modified

  # Language of description and other metadata (but not necessarily of the image
  # itself) represented as an ISO639-2 three letter language code.
  field :metadata_language_literal,
        as: :ac_metadata_language_literal,
        label: AUDUBON['metadataLanguageLiteral'],
        type: String,
        default: -> { 'eng' }

  # URI from http://id.loc.gov/vocabulary/iso639-2
  field :metadata_language,
        as: :ac_metadata_language,
        label: AUDUBON['metadataLanguage'],
        type: String,
        default: -> { "#{IDLOC}#{metadata_language_literal}.html" }

  # A free-form identifier (a simple number, an alphanumeric code, a URL, etc.)
  # that is unique and meaningful primarily for the data provider.
  field :provider_managed_id,
        as: :ac_provider_managed_id,
        label: AUDUBON['providerManagedID'],
        type: String
  # FIXME: clarify iiif @id or Stable Identifier

  # A rating of the media resources, provided by record originators or editors,
  # with -1 defining 'rejected', '0' defining 'unrated', and '1' (worst) to '5'
  # (best).
  field :rating,
        as: :xmp_rating,
        label: XMP['Rating'],
        type: Integer

  # A name or the literal "anonymous" (= anonymously commented).
  field :commenter_literal,
        as: :ac_commenter_literal,
        label: AUDUBON['commenterLiteral'],
        type: String
  # FIXME: repeatable; should be embedded doc `Annotation`. -> IIIF annotations
  # Should have type (reviewer yes/no)

  # A URI denoting a person, using some controlled vocabulary such as FOAF.
  field :commenter,
        as: :ac_commenter,
        label: AUDUBON['commenter'],
        type: String
  # FIXME: repeatable; should be embedded doc `Annotation`. -> IIIF annotations
  # Should have type (reviewer yes/no)

  # Any comment provided on the media resource, as free-form text. Best practice
  # would also identify the commenter.
  field :comments,
        as: :ac_comments,
        label: AUDUBON['comments'],
        type: String
  # FIXME: repeatable; should be embedded doc `Annotation`. -> IIIF annotations
  # Should have type (reviewer yes/no)

  # String providing the name of a reviewer. If present, then resource is peer-
  # reviewed, even if Reviewer Comments is absent or empty. Its presence tells
  # whether an expert in the subject featured in the media has reviewed the
  # media item or collection and approved its metadata description; must display
  # a name or the literal "anonymous" (= anonymously reviewed).
  field :reviewer_literal,
        as: :ac_reviewer_literal,
        label: AUDUBON['reviewerLiteral'],
        type: String
  # FIXME: repeatable; should be embedded doc `Annotation`. -> IIIF annotations
  # Should have type (reviewer yes/no)

  # URI for a reviewer. If present, then resource is peer-reviewed, even if
  # there are Reviewer Comments is absent or empty. Its presence tells whether
  # an expert in the subject featured in the media has reviewed the media item
  # or collection and approved its metadata description; must display a name or
  # the literal "anonymous" (= anonymously reviewed).
  field :reviewer,
        as: :ac_reviewer,
        label: AUDUBON['reviewer'],
        type: String
  # FIXME: repeatable; should be embedded doc `Annotation`. -> IIIF annotations
  # Should have type (reviewer yes/no)

  # Any comment provided by a reviewer with expertise in the subject, as free-
  # form text.
  field :reviewer_comments,
        as: :ac_reviewer_comments,
        label: AUDUBON['reviewerComments'],
        type: String
  # FIXME: repeatable; should be embedded doc `Annotation`. -> IIIF annotations
  # Should have type (reviewer yes/no)

  # The date (often a range) that the resource became or will become available.
  field :available,
        as: :ac_available,
        label: AUDUBON['available'],
        type: DateTime

  # In a chosen serialization (RDF, XML Schema, etc.) the potentially multiple
  # service access points (e.g., for different resolutions of an image) might be
  # provided in a referenced or in a nested object. This property identifies one
  # such access point.
  field :has_service_access_point,
        as: :ac_has_service_access_point,
        label: AUDUBON['hasServiceAccessPoint']

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
        type: String,
        default: -> { 'Available under Creative Commons BY 4.0 license' }

  # A URI pointing to structured information about rights held in and over the
  # resource. At least one of +rights_uri+ and +rights+ must be supplied but,
  # when feasible, supplying both may make the metadata more widely useful. They
  # must specify the same rights. In case of ambiguity, +rights_uri+ prevails.
  field :rights_uri,
        as: :dc_rights,
        label: RDF::Vocab::DC['rights'],
        type: String,
        default: -> { 'https://creativecommons.org/licenses/by/4.0/legalcode' }

  # A list of the names of the owners of the copyright. 'Unknown' is an
  # acceptable value, but 'Public Domain' is not.
  field :owner,
        as: :xmp_owner,
        label: XMP['rights/Owner'],
        type: String

  # The license statement defining how resources may be used. Information on a
  # collection applies to all contained objects unless the object has a
  # different statement.
  field :usage_terms,
        as: :xmp_usage_terms,
        label: XMP['rights/UsageTerms'],
        type: String,
        default: -> { 'Available under Creative Commons BY 4.0 license' }

  # A URL defining or further elaborating on the license statement
  # (e. g., a web page explaining the precise terms of use).
  field :web_statement,
        as: :xmp_web_statement,
        label: XMP['rights/WebStatement'],
        type: String,
        default: -> { 'https://creativecommons.org/licenses/by/4.0/' }

  # A URL providing access to a logo that symbolizes the License.
  field :license_logo,
        as: :ac_license_logo_url,
        label: AUDUBON['licenseLogoURL'],
        type: String,
        default: -> { 'https://licensebuttons.net/l/by/4.0/88x31.png' }

  # IPTC terms have URIs that are not resolvable. Instead, visit IPTC Standard
  # Photo Metadata (July 2010) for further documentation. AC follows the URI
  # namespace of the Adobe XMP implementation of IPTC terms. This term is one of
  # several with XMP namespace http://ns.adobe.com/photoshop/1.0/ (recommended
  # prefix "photoshop".)
  field :credit,
        as: :iptc_credit,
        label: IPTC['Credit'],
        type: String

  # The URL of the icon or logo image to appear in source attribution.
  field :attribution_logo,
        as: :ac_attribution_logo_url,
        label: AUDUBON['attributionLogoURL'],
        type: String

  # The URL where information about ownership, attribution, etc. of the resource
  # may be found.
  field :attribution_link,
        as: :ac_attribution_link_url,
        label: AUDUBON['attributionLinkURL'],
        type: String

  # Organizations or individuals who funded the creation of the resource.
  field :funding_attribution,
        as: :ac_funding_attribution,
        label: AUDUBON['fundingAttribution'],
        type: String

  # A string providing an identifiable source from which the described resources
  # was derived.
  field :source,
        as: :dce_source,
        label: RDF::Vocab::DC11['source'],
        type: String
  # FIXME: questionable relevance

  # URI for an identifiable source from which the described resources was
  # derived.
  field :source_url,
        as: :dc_source,
        label: RDF::Vocab::DC['source'],
        type: String
  # FIXME: questionable relevance

  # The person or organization responsible for creating the media resource.
  field :creator,
        as: :dce_creator,
        label: RDF::Vocab::DC11['creator'],
        type: String,
        default: -> { 'Natural History Museum of Denmark' }

  # A URI representing the person or organization responsible for creating the
  # media resource.
  field :creator_url,
        as: :dc_creator,
        label: RDF::Vocab::DC['creator'],
        type: String,
        default: -> { 'https://www.wikidata.org/wiki/Q978464' }

  # Person or organization responsible for presenting the media resource. If no
  # separate Metadata Provider is given, this also attributes the metadata.
  field :provider_literal,
        as: :ac_provider_literal,
        label: AUDUBON['providerLiteral'],
        type: String,
        default: -> { 'Natural History Museum of Denmark' }

  # URI for person or organization responsible for presenting the media
  # resource. If no separate Metadata Provider is given, this also attributes
  # the metadata.
  field :provider,
        as: :ac_provider,
        label: AUDUBON['provider'],
        type: String,
        default: -> { 'https://www.wikidata.org/wiki/Q978464' }

  # skipping:
  # - http://rs.tdwg.org/ac/terms/metadataCreatorLiteral
  # - http://rs.tdwg.org/ac/terms/metadataCreator
  # - http://rs.tdwg.org/ac/terms/metadataProviderLiteral
  # - http://rs.tdwg.org/ac/terms/metadataProvider
  # all can be inferred from parent CollectionObject document.

  # Description of collection or individual resource, containing the Who, What,
  # When, Where and Why as free-form text.
  field :description,
        as: :dc_description,
        label: RDF::Vocab::DC['description'],
        type: String
  # TODO: if possible default should be lambda that builds string from
  # parent CollectionObject document

  # As alternative or in addition to description, a caption is free-form text to
  # be displayed together with (rather than instead of) a resource that is
  # suitable for captions (especially images).
  field :caption,
        as: :ac_caption,
        label: AUDUBON['caption'],
        type: String

  # Language(s) of resource itself represented in the ISO639-2 three-letter
  # language code.
  field :language,
        as: :dce_language,
        label: RDF::Vocab::DC11['language'],
        type: String,
        default: -> { 'zxx' }

  # URI from the ISO639-2 list of URIs for ISO 3-letter language codes
  # http://id.loc.gov/vocabulary/iso639-2
  field :language_url,
        as: :dc_language,
        label: RDF::Vocab::DC['language'],
        type: String,
        default: -> { "#{IDLOC}#{language}.html" }

  # The setting of the content represented in media such as images, sounds, and
  # movies if the provider deems them relevant. Constrained vocabulary of:
  # - "Natural" = Object in its natural setting of the object
  # - "Artificial" = Object in an artificial environment
  # - "Edited" = Human media editing of a natural setting or media acquisition
  #     with a separate media background such as a photographic backdrop.
  field :physical_setting,
        as: :ac_physical_setting,
        label: AUDUBON['physicalSetting'],
        type: String

  # Skipping:
  # - +subject_category+ (http://iptc.org/std/Iptc4xmpExt/2008-02-29/CVterm)
  # - +subject_category_vocabulary+
  #   (http://rs.tdwg.org/ac/terms/subjectCategoryVocabulary)
  # should be derived from other metadata

  # General keywords or tags.
  field :tag,
        as: :ac_tag,
        label: AUDUBON['tag'],
        type: String
  # FIXME: should be repeatable (embeds many)

  # skipping Geography Vocabulary
  # should be inferred from parent CollectionObject document.

  # skipping http://purl.org/dc/terms/temporal (inferrable from DwcEvent)

  # The date of the creation of the original resource from which the digital
  # media was derived or created.
  field :create_date,
        as: :xmp_create_date,
        label: XMP['CreateDate'],
        type: DateTime

  # skipping http://rs.tdwg.org/ac/terms/timeOfDay (inferrable from DwcEvent)

  # skipping Taxonomic Coverage Vocabulary
  # should be inferred from parent CollectionObject document.
  # except:
  # - http://rs.tdwg.org/ac/terms/subjectOrientation (below)
  # - http://rs.tdwg.org/ac/terms/subjectPart (below)

  # The portion or product of organism morphology, behaviour, environment, etc.
  # that is either predominantly shown or particularly well exemplified by the
  # media resource.
  field :subject_part,
        as: :ac_subject_part,
        label: AUDUBON['subjectPart'],
        type: String

  # Specific orientation (= direction, view angle) of the subject represented in
  # the media resource with respect to the acquisition device.
  field :subject_orientation,
        as: :ac_subject_orientation,
        label: AUDUBON['subjectOrientation'],
        type: String

  # The location at which the media recording instrument was placed when the
  # media was created.
  field :location_created,
        as: :iptc_location_created,
        label: IPTC['LocationCreated'],
        type: String

  # Date the first digital version was created, if different from +create_date+.
  field :digitization_date,
        as: :ac_digitization_date,
        label: AUDUBON['digitizationDate'],
        type: DateTime

  # Free form text describing the device or devices used to create the resource.
  field :capture_device,
        as: :ac_capture_device,
        label: AUDUBON['captureDevice'],
        type: String

  # Information about technical aspects of the creation and digitization process
  # of the resource. This includes modification steps ("retouching") after the
  # initial resource capture.
  field :creation_technique,
        as: :ac_resource_creation_technique,
        label: AUDUBON['resourceCreationTechnique'],
        type: String

  # skipping:
  # - http://rs.tdwg.org/ac/terms/providerID
  # - http://rs.tdwg.org/ac/terms/derivedFrom
  # - http://rs.tdwg.org/ac/terms/associatedSpecimenReference
  # - http://rs.tdwg.org/ac/terms/associatedObservationReference
  # should be inferred from parent CollectionObject document.

  # maybe implement in the future
  # - http://rs.tdwg.org/ac/terms/IDofContainingCollection
  # - http://rs.tdwg.org/ac/terms/relatedResourceID
  # relatedResourceID is repeatable, should be embeds_many
  # could be useful for iiif features

  # FIXME: All of the below refers to variants (different resolutions) and
  # shold be inserted as a nested doc if used and inserted into
  # +has_service_access_point+
  # is handled by IIIF

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
