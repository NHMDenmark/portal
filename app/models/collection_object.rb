class CollectionObject
  include Mongoid::Document

  belongs_to :source_collection
  embeds_many :associated_media
  embeds_many :associated_references
  embeds_many :associated_sequences
  embeds_many :associated_taxa
  embeds_many :other_catalog_numbers
  embeds_one :record_metadata
#   embeds_one :dynamic_properties

  field :occurrence_id, type: String                    # persistent identifier
  field :catalog_number, type: String
  field :record_number, type: String                    # field number
  field :recorded_by, type: String                      # collectors
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
  field :occurrence_remarks, type: String               # was eventRemarks

  # Organism class terms

  # MaterialSample/LivingSpecimen/PreservedSpecimen/FossilSpecimen class terms

  # Event/HumanObservation/MachineObservation class terms
  field :event_id, type: String
  field :parent_event_id, type: String
  field :field_number, type: String
  field :event_date, type: Date
  field :event_time, type: Time
  field :start_day_of_year, type: Integer
  field :end_day_of_year, type: Integer
  field :year, type: Integer
  field :month, type: Integer
  field :day, type: Integer
  field :verbatim_event_date, type: String
  field :habitat, type: String
  field :sampling_protocol, type: String
  field :sampling_effort, type: String
  field :sample_size_value, type: Float
  field :sample_size_unit, type: String
  field :field_notes, type: String
  field :event_remarks, type: String

  # Location class terms
  field :location_id, type: String
  field :higher_geography_id, type: String
  field :higher_geography, type: String
  field :continent, type: String
  field :water_body, type: String
  field :island_group, type: String
  field :island, type: String
  field :country, type: String
  field :country_code, type: String
  field :state_province, type: String
  field :county, type: String
  field :municipality, type: String
  field :locality, type: String
  field :verbatim_locality, type: String
  field :minimum_elevation_in_meters, type: Float
  field :maximum_elevation_in_meters, type: Float
  field :verbatim_elevation, type: String
  field :minimum_depth_in_meters, type: Float
  field :maximum_depth_in_meters, type: Float
  field :verbatim_depth, type: String
  field :minimum_distance_above_surface_in_meters, type: Float
  field :maximum_distance_above_surface_in_meters, type: Float
  field :location_according_to, type: String
  field :location_remarks, type: String
  field :decimal_latitude, type: Float
  field :decimal_longitude, type: Float
  field :geodetic_datum, type: String
  field :coordinate_uncertainty_in_meters, type: Float
  field :coordinate_precision, type: Float
  field :point_radius_spatial_fit, type: Float
  field :verbatim_coordinates, type: String
  field :verbatim_latitude, type: String
  field :verbatim_longitude, type: String
  field :verbatim_coordinate_system, type: String
  field :verbatim_srs, type: String
  field :footprint_wkt, type: String
  field :footprint_srs, type: String
  field :footprint_spatial_fit, type: Float
  field :georeferenced_by, type: String
  field :georeferenced_date, type: String
  field :georeference_protocol, type: String
  field :georeference_sources, type: String
  field :georeference_verification_status, type: String
  field :georeference_remarks, type: String

  # GeologicalContext class terms

  # Identification class terms
  field :identification_id, type: String
  field :identification_qualifier, type: String
  field :type_status, type: String
  field :identified_by, type: String
  field :date_identified, type: Date
  field :identification_references, type: String        # should be embeds_many
  field :identification_verification_status, type: String
  field :identification_remarks, type: String

  # Taxon class terms
  field :taxon_id, type: String
  field :scientific_name_id, type: String
  field :accepted_name_usage_id, type: String
  field :parent_name_usage_id, type: String
  field :original_name_usage_id, type: String
  field :name_according_to_id, type: String
  field :name_published_in_id, type: String
  field :taxon_concept_id, type: String
  field :scientific_name, type: String
  field :accepted_name_usage, type: String
  field :parent_name_usage, type: String
  field :original_name_usage, type: String
  field :name_according_to, type: String
  field :name_published_in, type: String
  field :name_published_in_year, type: Integer
  field :higher_classification, type: String
  field :kingdom, type: String
  field :phylum, type: String
#   field :class, type: String
  field :order, type: String
  field :family, type: String
  field :genus, type: String
  field :subgenus, type: String
  field :specific_epithet, type: String
  field :infraspecific_epithet, type: String
  field :taxon_rank, type: String
  field :verbatim_taxon_rank, type: String
  field :scientific_name_authorship, type: String
  field :vernacular_name, type: String
  field :nomenclatural_code, type: String
  field :taxonomic_status, type: String
  field :nomenclatural_status, type: String
  field :taxon_remarks, type: String

  searchkick word_start: [:recorded_by, :family, :scientific_name, :country, :locality]
end
