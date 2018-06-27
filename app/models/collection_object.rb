# frozen_string_literal: true

# An existence of an Organism (sensu http://rs.tdwg.org/dwc/terms/Organism)
# at a particular place at a particular time.
class CollectionObject
  include Mongoid::Document
  include RDFTransformable
  extend Mappable

  belongs_to :source_collection
  embeds_many :associated_media
  embeds_many :associated_references
  embeds_many :associated_sequences
  embeds_many :associated_taxa

  # http://rs.tdwg.org/dwc/terms/otherCatalogNumbers
  # Custom model for other catalog numbers.
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
  field :stable_identifier,
        as: :dwc_occurrence_id,
        label: RDF::Vocab::DWC['occurrenceID'],
        type: String

  # An identifier (preferably unique) for the record within the data set or
  # collection.
  field :catalog_number,
        as: :dwc_catalog_number,
        label: RDF::Vocab::DWC['catalogNumber'],
        type: String
  field :_id, type: String, overwrite: true, default: -> { catalog_number }

  # An identifier given to the Occurrence at the time it was recorded.
  # Often serves as a link between field notes and an Occurrence record,
  # such as a specimen collector's number.
  field :field_number,
        as: :dwc_record_number,
        label: RDF::Vocab::DWC['recordNumber'],
        type: String

  # CSPP :collectorName
  # A list (concatenated and separated) of names of people, groups, or
  # organizations responsible for recording the original Occurrence.
  # The primary collector or observer, especially one who applies a personal
  # identifier (recordNumber), should be listed first.
  # TODO: move to embedded model (embeds_many), to allow semantic enrichment.
  field :collector_name,
        as: :dwc_recorded_by,
        label: RDF::Vocab::DWC['recordedBy'],
        type: String

  # The number of individuals represented present at the time of the Occurrence.
  field :individual_count,
        as: :dwc_individual_count,
        label: RDF::Vocab::DWC['individualCount'],
        type: Integer

  # A number or enumeration value for the quantity of organisms.
  field :organism_quantity,
        as: :dwc_organism_quantity,
        label: RDF::Vocab::DWC['organismQuantity'],
        type: Float

  # The type of quantification system used for the quantity of organisms.
  field :organism_quantity_type,
        as: :dwc_organism_quantity_type,
        label: RDF::Vocab::DWC['organismQuantityType'],
        type: String

  # The sex of the biological individual(s) represented in the Occurrence.
  field :sex,
        as: :dwc_sex,
        label: RDF::Vocab::DWC['sex'],
        type: String

  # The age class or life stage of the biological individual(s) at the time the
  # Occurrence was recorded.
  field :life_stage,
        as: :dwc_life_stage,
        label: RDF::Vocab::DWC['lifeStage'],
        type: String

  # The reproductive condition of the biological individual(s) represented in
  # the Occurrence.
  field :reproductive_condition,
        as: :dwc_reproductive_condition,
        label: RDF::Vocab::DWC['reproductiveCondition'],
        type: String

  # A description of the behavior shown by the subject at the time the
  # Occurrence was recorded.
  field :behavior,
        as: :dwc_behavior,
        label: RDF::Vocab::DWC['behavior'],
        type: String

  # The process by which the biological individual(s) represented in the
  # Occurrence became established at the location.
  field :establishment_means,
        as: :dwc_establishment_means,
        label: RDF::Vocab::DWC['establishmentMeans'],
        type: String

  # A statement about the presence or absence of a Taxon at a Location.
  field :occurrence_status,
        as: :dwc_occurrence_status,
        label: RDF::Vocab::DWC['occurrenceStatus'],
        type: String

  # A list (concatenated and separated) of preparations and preservation methods
  # for a specimen.
  # TODO: move to embedded model (embeds_many).
  field :preparations,
        as: :dwc_preparations,
        label: RDF::Vocab::DWC['preparations'],
        type: String

  # The current state of a specimen with respect to the collection identified in
  # collectionCode or collectionID.
  field :disposition,
        as: :dwc_disposition,
        label: RDF::Vocab::DWC['disposition'],
        type: String

  # Comments or notes about the Occurrence.
  field :remarks,
        as: :dwc_occurrence_remarks,
        label: RDF::Vocab::DWC['occurrenceRemarks'],
        type: String

  index({ catalog_number: 1 }, unique: true)

  def self.quicksearch_fields
    ['collector_name', 'dwc_identification.type_status',
     'dwc_taxon.family', 'dwc_taxon.scientific_name_current',
     'dwc_location.country', 'dwc_location.state_or_province',
     'dwc_location.county', 'dwc_location.water_body',
     'dwc_location.island_group', 'dwc_location.island',
     'dwc_location.locality']
  end

  searchkick word_start: quicksearch_fields
end
