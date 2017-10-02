class DwcAssociatedReference
  include Mongoid::Document

  embedded_in :collection_object

  field :reference, type: String
end
