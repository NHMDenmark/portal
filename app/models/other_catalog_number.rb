class OtherCatalogNumber
  include Mongoid::Document
  field :catalog_number, type: String
  embedded_in :collection_object
end
