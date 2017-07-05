class AssociatedMedia
  include Mongoid::Document

  embedded_in :collection_object

  field :uri, type: String
end
