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
  embeds_one :record_metadata

  field :mapping_id, type: Integer # created by the Specify Exporter

  field :occurrence_id, type: String                    # persistent identifier
  field :material_sample_id, type: String               # is normally part of DwC class of its own
  field :catalog_number, type: String
  field :record_number, type: String
  field :recorded_by, type: String
  field :individual_count, type: Integer
  field :organism_quantity, type: Float
  field :organism_quantity_type, type: String
  field :sex, type: String
  field :life_stage, type: String
  field :reproductive_condition, type: String
  field :behavior, type: String
  field :establishment_means, type: String
  field :occurrence_status, type: String
  field :preparations, type: String                     # should be embeds_many
  field :disposition, type: String
  field :occurrence_remarks, type: String

  # Organism class terms

  # MaterialSample/LivingSpecimen/PreservedSpecimen/FossilSpecimen class terms

  searchkick word_start: [:recorded_by,
                          'dwc_identification.dwc_type_status',
                          'dwc_taxon.dwc_family',
                          'dwc_taxon.dwc_scientific_name',
                          'dwc_location.dwc_country',
                          'dwc_location.dwc_locality']
end
