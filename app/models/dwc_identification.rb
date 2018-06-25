# frozen_string_literal: true

# Embedded model for DwC Identification.
# http://rs.tdwg.org/dwc/terms/Identification
# A taxonomic determination.
class DwcIdentification
  include Mongoid::Document

  embedded_in :collection_object

  # http://rs.tdwg.org/dwc/terms/identificationID
  # An identifier for the Identification (the body of information associated
  # with the assignment of a scientific name). May be a global unique identifier
  # or an identifier specific to the data set.
  field :identification_id, as: :dwc_identification_id, type: String

  # http://rs.tdwg.org/dwc/terms/identificationQualifier
  # A brief phrase or a standard term ("cf.", "aff.") to express the
  # determiner's doubts about the Identification.
  field :identification_qualifier, as: :dwc_identification_qualifier,
                                   type: String

  # http://rs.tdwg.org/dwc/terms/typeStatus
  # A list (concatenated and separated) of nomenclatural types (type status,
  # typified scientific name, publication) applied to the subject.
  field :type_status, as: :dwc_type_status, type: String

  # http://rs.tdwg.org/dwc/terms/identifiedBy
  # A list (concatenated and separated) of names of people, groups, or
  # organizations who assigned the Taxon to the subject.
  field :identified_by, as: :dwc_identified_by, type: String

  # http://rs.tdwg.org/dwc/terms/dateIdentified
  # The date on which the subject was identified as representing the Taxon.
  field :date_identified, as: :dwc_date_identified, type: Date

  # http://rs.tdwg.org/dwc/terms/identificationReferences
  # A list (concatenated and separated) of references (publication, global
  # unique identifier, URI) used in the Identification.
  field :references, as: :dwc_identification_references, type: String

  # http://rs.tdwg.org/dwc/terms/identificationVerificationStatus
  # A categorical indicator of the extent to which the taxonomic identification
  # has been verified to be correct. Recommended best practice is to use a
  # controlled vocabulary such as that used in HISPID/ABCD.
  field :verification_status, as: :dwc_identification_verification_status,
                              type: String

  # http://rs.tdwg.org/dwc/terms/identificationRemarks
  # Comments or notes about the Identification.
  field :remarks, as: :dwc_identification_remarks, type: String
end
