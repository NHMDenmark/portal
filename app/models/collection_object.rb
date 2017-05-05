class CollectionObject
  include Mongoid::Document
  field :catalog_number, type: String
  field :alt_catalog_number, type: String
end
