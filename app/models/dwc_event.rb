class DwcEvent
  include Mongoid::Document

  embedded_in :collection_object

  field :dwc_event_id, type: String
  field :dwc_parent_event_id, type: String
  field :dwc_field_number, type: String
  field :dwc_event_date, type: Date
  field :dwc_event_time, type: Time
  field :dwc_start_day_of_year, type: Integer
  field :dwc_end_day_of_year, type: Integer
  field :dwc_year, type: Integer
  field :dwc_month, type: Integer
  field :dwc_day, type: Integer
  field :dwc_verbatim_event_date, type: String
  field :dwc_habitat, type: String
  field :dwc_sampling_protocol, type: String
  field :dwc_sampling_effort, type: String
  field :dwc_sample_size_value, type: Float
  field :dwc_sample_size_unit, type: String
  field :dwc_field_notes, type: String
  field :dwc_event_remarks, type: String
end
