class DwcGeologicalContext
  include Mongoid::Document

  embedded_in :collection_object

  field :dwc_geological_context_id, type: String
  field :dwc_earliest_eon_or_lowest_eonothem, type: String
  field :dwc_latest_eon_or_highest_eonothem, type: String
  field :dwc_earliest_era_or_lowest_erathem, type: String
  field :dwc_latest_era_or_highest_erathem, type: String
  field :dwc_earliest_period_or_lowest_system, type: String
  field :dwc_latest_period_or_highest_system, type: String
  field :dwc_earliest_epoch_or_lowest_series, type: String
  field :dwc_latest_epoch_or_highest_series, type: String
  field :dwc_earliest_age_or_lowest_stage, type: String
  field :dwc_latest_age_or_highest_stage, type: String
  field :dwc_lowest_biostratigraphic_zone, type: String
  field :dwc_highest_biostratigraphic_zone, type: String
  field :dwc_lithostratigraphic_terms, type: String
  field :dwc_group, type: String
  field :dwc_formation, type: String
  field :dwc_member, type: String
  field :dwc_bed, type: String
end
