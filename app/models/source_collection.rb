class SourceCollection
  include Mongoid::Document
  has_many :collection_objects
  field :institution_id, type: String
  field :institution_code, type: String
  field :collection_id, type: String
  field :collection_code, type: String
end
