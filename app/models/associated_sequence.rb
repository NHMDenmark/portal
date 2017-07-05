class AssociatedSequence
  include Mongoid::Document

  embedded_in :collection_object

  field :identifier, type: String
end
