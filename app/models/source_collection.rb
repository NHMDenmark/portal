class SourceCollection
  include Mongoid::Document
  belongs_to :source_institution
  has_many :collection_objects
  field :collection_id, type: String
  field :collection_code, type: String
end
