# frozen_string_literal: true

# Embedded model for record metadata.
class Metadata
  include Mongoid::Document
  include RDFTransformable
  extend Mappable

  embedded_in :collection_object

  # CSPP :title
  # Concise title, name, or brief descriptive label of institution, resource
  # collection, or individual resource. This field should include the complete
  # title with all the subtitles, if any.
  field :title,
        as: :dc_title,
        label: RDF::Vocab::DC['title'],
        type: String

  # CSPP :sourceLink
  # An entity responsible for making the resource available.
  field :source_link,
        as: :dc_publisher,
        label: RDF::Vocab::DC['publisher'],
        type: String,
        default: -> { 'https://snm.ku.dk' }

  # CSPP :kindOfMaterial
  # The nature or genre of the resource. For Darwin Core, recommended best
  # practice is to use the name of the class that defines the root of the
  # record.
  field :kind_of_material,
        as: :dc_type,
        label: RDF::Vocab::DC['type'],
        type: String,
        default: -> { 'http://rs.tdwg.org/dwc/terms/PreservedSpecimen' }

  # The most recent date-time on which the resource was changed.
  field :modfied,
        as: :dc_modified,
        label: RDF::Vocab::DC['modified'],
        type: DateTime

  # A language of the resource.
  field :language,
        as: :dc_language,
        label: RDF::Vocab::DC['language'],
        type: String,
        default: -> { 'en' }

  # A legal document giving official permission to do something with the
  # resource.
  field :license,
        as: :dc_license,
        label: RDF::Vocab::DC['license'],
        type: String,
        default: -> { 'http://creativecommons.org/licenses/by/4.0/legalcode' }

  # A person or organization owning or managing rights over the resource.
  field :rights_holder,
        as: :dc_rights_holder,
        label: RDF::Vocab::DC['rightsHolder'],
        type: String,
        default: -> { 'Natural History Museum of Denmark' }

  # Information about who can access the resource or an indication of its
  # security status. Access Rights may include information regarding access or
  # restrictions based on privacy, security, or other policies.
  field :access_rights,
        as: :dc_access_rights,
        label: RDF::Vocab::DC['accessRights'],
        type: String

  # A bibliographic reference for the resource as a statement indicating how
  # this record should be cited (attributed) when used. Recommended practice is
  # to include sufficient bibliographic detail to identify the resource as
  # unambiguously as possible.
  field :citation,
        as: :dc_bibliographic_citation,
        label: RDF::Vocab::DC['bibliographicCitation'],
        type: String

  # A related resource that is referenced, cited, or otherwise pointed to by the
  # described resource.
  field :references,
        as: :dc_references,
        label: RDF::Vocab::DC['references'],
        type: String

  # An identifier for the set of data. May be a global unique identifier or an
  # identifier specific to a collection or institution.
  field :dataset_id,
        as: :dwc_dataset_id,
        label: RDF::Vocab::DWC['datasetID'],
        type: String

  # The name identifying the data set from which the record was derived.
  field :dataset_name,
        as: :dwc_dataset_name,
        label: RDF::Vocab::DWC['datasetName'],
        type: String

  # The name (or acronym) in use by the institution having ownership of the
  # object(s) or information referred to in the record.
  field :owner,
        as: :dwc_owner_institution_code,
        label: RDF::Vocab::DWC['ownerInstitutionCode'],
        type: String,
        default: -> { 'NHMD' }

  # The specific nature of the data record.
  field :basis_of_record,
        as: :dwc_basis_of_record,
        label: RDF::Vocab::DWC['basisOfRecord'],
        type: String,
        default: -> { 'http://rs.tdwg.org/dwc/terms/PreservedSpecimen' }

  # Additional information that exists, but that has not been shared in the
  # given record.
  field :information_withheld,
        as: :dwc_information_withheld,
        label: RDF::Vocab::DWC['informationWithheld'],
        type: String

  # Actions taken to make the shared data less specific or complete than in its
  # original form. Suggests that alternative data of higher quality may be
  # available on request.
  field :data_generalization,
        as: :dwc_data_generalizations,
        label: RDF::Vocab::DWC['dataGeneralizations'],
        type: String

  # A list of additional measurements, facts, characteristics, or assertions
  # about the record. Meant to provide a mechanism for structured content.
  field :dynamic_properties,
        as: :dwc_dynamic_properties,
        label: RDF::Vocab::DWC['dynamicProperties'],
        type: String
end
