class DwcOrganism
  include Mongoid::Document

  embedded_in :collection_object

  field :dwc_organism_id, type: String
  field :dwc_organism_name, type: String
  field :dwc_organism_scope, type: String
  field :dwc_associated_occurrences, type: String
  field :dwc_associated_organisms, type: String
  field :dwc_previous_identifications, type: String
  field :dwc_organism_remarks, type: String
end
