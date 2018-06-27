# frozen_string_literal: true

# Embedded model for DwC Identification.
# http://rs.tdwg.org/dwc/terms/Identification
# A taxonomic determination.
class DwcIdentification
  include Mongoid::Document
  include RDFTransformable
  extend Mappable

  embedded_in :collection_object

  # An identifier for the Identification (the body of information associated
  # with the assignment of a scientific name). May be a global unique identifier
  # or an identifier specific to the data set.
  field :identification_id,
        as: :dwc_identification_id,
        label: RDF::Vocab::DWC['identificationID'],
        type: String

  # A brief phrase or a standard term ("cf.", "aff.") to express the
  # determiner's doubts about the Identification.
  field :identification_qualifier,
        as: :dwc_identification_qualifier,
        label: RDF::Vocab::DWC['identificationQualifier'],
        type: String

  # A list (concatenated and separated) of nomenclatural types (type status,
  # typified scientific name, publication) applied to the subject.
  field :type_status,
        as: :dwc_type_status,
        label: RDF::Vocab::DWC['typeStatus'],
        type: String

  # A list (concatenated and separated) of names of people, groups, or
  # organizations who assigned the Taxon to the subject.
  field :identified_by,
        as: :dwc_identified_by,
        label: RDF::Vocab::DWC['identifiedBy'],
        type: String

  # The date on which the subject was identified as representing the Taxon.
  field :date_identified,
        as: :dwc_date_identified,
        label: RDF::Vocab::DWC['dateIdentified'],
        type: Date

  # A list (concatenated and separated) of references (publication, global
  # unique identifier, URI) used in the Identification.
  field :references,
        as: :dwc_identification_references,
        label: RDF::Vocab::DWC['identificationReferences'],
        type: String

  # A categorical indicator of the extent to which the taxonomic identification
  # has been verified to be correct. Recommended best practice is to use a
  # controlled vocabulary such as that used in HISPID/ABCD.
  field :verification_status,
        as: :dwc_identification_verification_status,
        label: RDF::Vocab::DWC['identificationVerificationStatus'],
        type: String

  # Comments or notes about the Identification.
  field :remarks,
        as: :dwc_identification_remarks,
        label: RDF::Vocab::DWC['identificationRemarks'],
        type: String
end
