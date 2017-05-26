class SourceCollection
  include Mongoid::Document
  has_many :collection_objects
  field :collection_id, type: String
  field :collection_code, type: String
  field :institution_name, type: String
  field :institution_code, type: String
end
