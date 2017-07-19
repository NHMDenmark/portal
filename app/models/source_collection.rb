class SourceCollection
  include Mongoid::Document

  has_many :collection_objects

  field :dwc_collection_id, type: String
  field :dwc_collection_code, type: String
  field :dwc_institution_id, type: String
  field :dwc_institution_code, type: String
end
