class RecordLevelTerms
  include Mongoid::Document

  embedded_in :collection_object

  field :dc_type, type: String
  field :dc_modified, type: DateTime
  field :dc_language, type: String
  field :dc_license, type: String
  field :dc_rights_holder, type: String
  field :dc_access_rights, type: String
  field :dc_bibliographic_citation, type: String
  field :dc_references, type: String

  field :dwc_dataset_id, type: String
  field :dwc_dataset_name, type: String
  field :dwc_owner_institution_code, type: String
  field :dwc_basis_of_record, type: String
  field :dwc_information_withheld, type: String
  field :dwc_data_generalizations, type: String
  field :dwc_dynamic_properties, type: String
end
