# frozen_string_literal: true

# Embedded model for record metadata.
class Metadata
  include Mongoid::Document

  embedded_in :collection_object

  # CSPP :title
  # http://purl.org/dc/terms/title
  # Concise title, name, or brief descriptive label of institution, resource
  # collection, or individual resource. This field should include the complete
  # title with all the subtitles, if any.
  # TODO: conflicts with associated_media where this also would occur
  #       needs to be resolved in DwCR Feeder
  field :title, as: :dc_title, type: String

  # CSPP :sourceLink
  # http://purl.org/dc/terms/publisher
  # TODO: conflicts with associated_media where this also would occur
  #       needs to be resolved in DwCR Feeder
  field :source_link, as: :dc_publisher, type: String

  # CSPP :kindOfMaterial
  # http://purl.org/dc/terms/type
  # The nature or genre of the resource. For Darwin Core, recommended best
  # practice is to use the name of the class that defines the root of the
  # record.
  field :kind_of_material, as: :dc_type, type: String

  # http://purl.org/dc/terms/modified
  # The most recent date-time on which the resource was changed.
  field :modfied, as: :dc_modified, type: DateTime

  # http://purl.org/dc/terms/language
  # A language of the resource.
  field :language, as: :dc_language, type: String

  # http://purl.org/dc/terms/license
  # A legal document giving official permission to do something with the
  # resource.
  field :license, as: :dc_license, type: String

  # http://purl.org/dc/terms/rightsHolder
  # A person or organization owning or managing rights over the resource.
  field :rights_holder, as: :dc_rights_holder, type: String

  # http://purl.org/dc/terms/accessRights
  # Information about who can access the resource or an indication of its
  # security status. Access Rights may include information regarding access or
  # restrictions based on privacy, security, or other policies.
  field :access_rights, as: :dc_access_rights, type: String

  # http://purl.org/dc/terms/bibliographicCitation
  # A bibliographic reference for the resource as a statement indicating how
  # this record should be cited (attributed) when used. Recommended practice is
  # to include sufficient bibliographic detail to identify the resource as
  # unambiguously as possible.
  field :citation, as: :dc_bibliographic_citation, type: String

  # http://purl.org/dc/terms/references
  # A related resource that is referenced, cited, or otherwise pointed to by the
  # described resource.
  field :references, as: :dc_references, type: String

  # http://rs.tdwg.org/dwc/terms/datasetID
  # An identifier for the set of data. May be a global unique identifier or an
  # identifier specific to a collection or institution.
  field :dataset_id, as: :dwc_dataset_id, type: String

  # http://rs.tdwg.org/dwc/terms/datasetName
  # The name identifying the data set from which the record was derived.
  field :dataset_name, as: :dwc_dataset_name, type: String

  # http://rs.tdwg.org/dwc/terms/ownerInstitutionCode
  # The name (or acronym) in use by the institution having ownership of the
  # object(s) or information referred to in the record.
  field :owner, as: :dwc_owner_institution_code, type: String

  # http://rs.tdwg.org/dwc/terms/basisOfRecord
  # The specific nature of the data record.
  field :basis_of_record, as: :dwc_basis_of_record, type: String

  # http://rs.tdwg.org/dwc/terms/informationWithheld
  # Additional information that exists, but that has not been shared in the
  # given record.
  field :information_withheld, as: :dwc_information_withheld, type: String

  # http://rs.tdwg.org/dwc/terms/dataGeneralizations
  # Actions taken to make the shared data less specific or complete than in its
  # original form. Suggests that alternative data of higher quality may be
  # available on request.
  field :data_generalization, as: :dwc_data_generalizations, type: String

  # http://rs.tdwg.org/dwc/terms/dynamicProperties
  # A list of additional measurements, facts, characteristics, or assertions
  # about the record. Meant to provide a mechanism for structured content.
  field :dynamic_properties, as: :dwc_dynamic_properties, type: String
end
