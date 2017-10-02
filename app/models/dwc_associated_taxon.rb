class DwcAssociatedTaxon
  include Mongoid::Document

  embedded_in :collection_object

  field :rleationship, type: String
  field :name, type: String
end
