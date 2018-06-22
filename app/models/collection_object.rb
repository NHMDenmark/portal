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

  field :mapping_id, type: Integer # created by the Specify Exporter

  field :dwc_occurrence_id, type: String                    # persistent identifier
  field :dwc_material_sample_id, type: String               # is normally part of DwC class of its own

  field :dwc_catalog_number, type: String
  field :_id, type: String, overwrite: true, default: ->{ dwc_catalog_number } # maybe use the occurrence_id;  overwrite => true suppresses the mongo overwrite warning

  field :dwc_record_number, type: String
  field :dwc_recorded_by, type: String
  field :dwc_individual_count, type: Integer
  field :dwc_organism_quantity, type: Float
  field :dwc_organism_quantity_type, type: String
  field :dwc_sex, type: String
  field :dwc_life_stage, type: String
  field :dwc_reproductive_condition, type: String
  field :dwc_behavior, type: String
  field :dwc_establishment_means, type: String
  field :dwc_occurrence_status, type: String
  field :dwc_preparations, type: String                     # should be embeds_many
  field :dwc_disposition, type: String
  field :dwc_occurrence_remarks, type: String

  index({ dwc_catalog_number: 1 }, { unique: true })

  # Organism class terms

  # MaterialSample/LivingSpecimen/PreservedSpecimen/FossilSpecimen class terms

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
