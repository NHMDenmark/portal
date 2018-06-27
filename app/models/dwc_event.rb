# frozen_string_literal: true

# Embedded model for DwC Event.
# http://rs.tdwg.org/dwc/terms/Event
# An action that occurs at some location during some time.
class DwcEvent
  include Mongoid::Document
  include RDFTransformable
  extend Mappable

  embedded_in :collection_object

  # An identifier for the set of information associated with an Event (something
  # that occurs at a place and time). May be a global unique identifier or an
  # identifier specific to the data set.
  field :event_id,
        as: :dwc_event_id,
        label: RDF::Vocab::DWC['eventID'],
        type: String

  # An identifier for the broader Event that groups this and potentially other
  # Events.
  # TODO: should be collecting trips
  field :parent_event_id,
        as: :dwc_parent_event_id,
        label: RDF::Vocab::DWC['parentEventID'],
        type: String

  # CSPP :collectorNumber
  # An identifier given to the event in the field. Often serves as a link
  # between field notes and the Event.
  # TODO: resolve amiguity with CollectionObject.field_number
  field :collector_number,
        as: :dwc_field_number,
        label: RDF::Vocab::DWC['fieldNumber'],
        type: String

  # CSPP :collectionDate
  # The date-time or interval during which an Event occurred. For occurrences,
  # this is the date-time when the event was recorded. Not suitable for a time
  # in a geological context.
  field :collection_date,
        as: :dwc_event_date,
        label: RDF::Vocab::DWC['eventDate'],
        type: Date

  # The time or interval during which an Event occurred.
  field :collection_time,
        as: :dwc_event_time,
        label: RDF::Vocab::DWC['eventTime'],
        type: Time

  # The earliest ordinal day of the year on which the Event occurred (1 for
  # January 1, 365 for December 31, except in a leap year, in which case it is
  # 366).
  field :start_day_of_year,
        as: :dwc_start_day_of_year,
        label: RDF::Vocab::DWC['startDayOfYear'],
        type: Integer

  # The latest ordinal day of the year on which the Event occurred (1 for
  # January 1, 365 for December 31, except in a leap year, in which case it is
  # 366).
  field :end_day_of_year,
        as: :dwc_end_day_of_year,
        label: RDF::Vocab::DWC['endDayOfYear'],
        type: Integer

  # The four-digit year in which the Event occurred, according to the Common Era
  # Calendar.
  field :year,
        as: :dwc_year,
        label: RDF::Vocab::DWC['year'],
        type: Integer

  # The ordinal month in which the Event occurred.
  field :month,
        as: :dwc_month,
        label: RDF::Vocab::DWC['month'],
        type: Integer

  # The integer day of the month on which the Event occurred.
  field :day,
        as: :dwc_day,
        label: RDF::Vocab::DWC['day'],
        type: Integer

  # The verbatim original representation of the date and time information for an
  # Event.
  field :verbatim_date,
        as: :dwc_verbatim_event_date,
        label: RDF::Vocab::DWC['verbatimEventDate'],
        type: String

  # A category or description of the habitat in which the Event occurred.
  field :habitat,
        as: :dwc_habitat,
        label: RDF::Vocab::DWC['habitat'],
        type: String

  # The name of, reference to, or description of the method or protocol used
  # during an Event.
  field :collecting_method,
        as: :dwc_sampling_protocol,
        label: RDF::Vocab::DWC['samplingProtocol'],
        type: String

  # The amount of effort expended during an Event.
  field :collecting_effort,
        as: :dwc_sampling_effort,
        label: RDF::Vocab::DWC['samplingEffort'],
        type: String

  # A numeric value for a measurement of the size (time duration, length, area,
  # or volume) of a sample in a sampling event.
  field :sample_size,
        as: :dwc_sample_size_value,
        label: RDF::Vocab::DWC['sampleSizeValue'],
        type: Float

  # The unit of measurement of the size (time duration, length, area, or volume)
  # of a sample in a sampling event.
  field :sample_size_unit,
        as: :dwc_sample_size_unit,
        label: RDF::Vocab::DWC['sampleSizeUnit'],
        type: String

  # One of a) an indicator of the existence of, b) a reference to (publication,
  # URI), or c) the text of notes taken in the field about the Event.
  field :field_notes,
        as: :dwc_field_notes,
        label: RDF::Vocab::DWC['fieldNotes'],
        type: String

  # Comments or notes about the Event.
  field :remarks,
        as: :dwc_event_remarks,
        label: RDF::Vocab::DWC['eventRemarks'],
        type: String
end
