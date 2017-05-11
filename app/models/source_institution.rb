class SourceInstitution
  include Mongoid::Document
  has_many :source_collections
  field :institution_name, type: String
  field :institution_code, type: String
end
