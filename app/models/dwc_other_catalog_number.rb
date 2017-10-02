class DwcOtherCatalogNumber
  include Mongoid::Document

  embedded_in :collection_object

  field :dwc_other_catalog_numbers, type: String
end
