# frozen_string_literal: true

# An existence of an Organism (sensu http://rs.tdwg.org/dwc/terms/Organism)
# at a particular place at a particular time.
class CollectionObject
  include Mongoid::Document

  belongs_to :source_collection
  embeds_many :associated_media
  embeds_many :associated_references
  embeds_many :associated_sequences
  embeds_many :associated_taxa
  embeds_many :other_catalog_numbers
  embeds_one :dwc_event
  embeds_one :dwc_geological_context
  embeds_one :dwc_identification
  embeds_one :dwc_location
  embeds_one :dwc_organism
  embeds_one :dwc_taxon
  embeds_one :metadata

  # An identifier for the Occurrence (as opposed to a particular digital record
  # of the occurrence).
  # The PURL.
  field :dwc_occurrence_id, type: String

  # An identifier (preferably unique) for the record within the data set or
  # collection.
  field :dwc_catalog_number, type: String
  field :_id, type: String, overwrite: true, default: -> { dwc_catalog_number }

  # An identifier given to the Occurrence at the time it was recorded.
  # Often serves as a link between field notes and an Occurrence record,
  # such as a specimen collector's number.
  field :dwc_record_number, type: String

  # A list (concatenated and separated) of names of people, groups, or
  # organizations responsible for recording the original Occurrence.
  # The primary collector or observer, especially one who applies a personal
  # identifier (recordNumber), should be listed first.
  # TODO: move to embedded model (embeds_many), to allow semantic enrichment.
  field :dwc_recorded_by, as: :collector_name, type: String

  # The number of individuals represented present at the time of the Occurrence.
  field :dwc_individual_count, type: Integer

  # A number or enumeration value for the quantity of organisms.
  field :dwc_organism_quantity, type: Float

  # The type of quantification system used for the quantity of organisms.
  field :dwc_organism_quantity_type, type: String

  # The sex of the biological individual(s) represented in the Occurrence.
  field :dwc_sex, type: String

  # The age class or life stage of the biological individual(s) at the time the
  # Occurrence was recorded.
  field :dwc_life_stage, type: String

  # The reproductive condition of the biological individual(s) represented in
  # the Occurrence.
  field :dwc_reproductive_condition, type: String

  # A description of the behavior shown by the subject at the time the
  # Occurrence was recorded.
  field :dwc_behavior, type: String

  # The process by which the biological individual(s) represented in the
  # Occurrence became established at the location.
  field :dwc_establishment_means, type: String

  # A statement about the presence or absence of a Taxon at a Location.
  field :dwc_occurrence_status, type: String

  # A list (concatenated and separated) of preparations and preservation methods
  # for a specimen.
  # TODO: move to embedded model (embeds_many).
  field :dwc_preparations, type: String

  # The current state of a specimen with respect to the collection identified in
  # collectionCode or collectionID.
  field :dwc_disposition, type: String

  # Comments or notes about the Occurrence.
  field :dwc_occurrence_remarks, type: String

  index({ dwc_catalog_number: 1 }, unique: true)

  def self.quicksearch_fields
    ['dwc_recorded_by', 'dwc_identification.dwc_type_status',
     'dwc_taxon.dwc_family', 'dwc_taxon.dwc_scientific_name',
     'dwc_location.dwc_country', 'dwc_location.dwc_state_province',
     'dwc_location.dwc_county', 'dwc_location.dwc_water_body',
     'dwc_location.dwc_island_group', 'dwc_location.dwc_island',
     'dwc_location.dwc_locality']
  end

  searchkick word_start: quicksearch_fields
end
