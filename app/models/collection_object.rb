class CollectionObject
  include Mongoid::Document

  belongs_to :source_collection
  embeds_many :dwc_associated_media
  embeds_many :dwc_associated_references
  embeds_many :dwc_associated_sequences
  embeds_many :dwc_associated_taxa
  embeds_many :dwc_other_catalog_numbers
  embeds_one :dwc_event
  embeds_one :dwc_geological_context
  embeds_one :dwc_identification
  embeds_one :dwc_location
  embeds_one :dwc_organism
  embeds_one :dwc_taxon
  embeds_one :record_level_terms

  field :mapping_id, type: Integer # created by the Specify Exporter

  field :dwc_occurrence_id, type: String                    # persistent identifier
  field :dwc_material_sample_id, type: String               # is normally part of DwC class of its own
  field :dwc_catalog_number, type: String
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

  # Organism class terms

  # MaterialSample/LivingSpecimen/PreservedSpecimen/FossilSpecimen class terms

  searchkick word_start: [:dwc_recorded_by,
                          'dwc_identification.dwc_type_status',
                          'dwc_taxon.dwc_family',
                          'dwc_taxon.dwc_scientific_name',
                          'dwc_location.dwc_country',
                          'dwc_location.dwc_locality']
end
