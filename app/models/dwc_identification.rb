class DwcIdentification
  include Mongoid::Document

  embedded_in :collection_object

  field :dwc_identification_id, type: String
  field :dwc_identification_qualifier, type: String
  field :dwc_type_status, type: String
  field :dwc_identified_by, type: String
  field :dwc_date_identified, type: Date
  field :dwc_identification_references, type: String        # should be embeds_many
  field :dwc_identification_verification_status, type: String
  field :dwc_identification_remarks, type: String
end
