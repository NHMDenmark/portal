class CollectionObject
  include Mongoid::Document

  belongs_to :source_collection
  belongs_to :taxon
  belongs_to :location
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
  field :preparations, type: String                     # preparations
  field :disposition, type: String
  field :occurrence_remarks, type: String               # was eventRemarks

  field :type_status, type: String                      # not included in DwC

  field :event_date, type: Date                         # belongs to model event
  field :field_number, type: String                     # belongs to model event

  searchkick
end
