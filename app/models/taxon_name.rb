class TaxonName
  include Mongoid::Document
  has_many :collection_objects
  field :order, type: String
  field :family, type: String
  field :genus, type: String
  field :specific_epithet, type: String
  field :infraspecific_epithet, type: String
  field :scientific_name, type: String
end
