class OtherCatalogNumber
  include Mongoid::Document

  embedded_in :collection_object

  field :other_catalog_number, type: String
end
