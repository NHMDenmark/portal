class Taxon
  include Mongoid::Document
  field :order, type: String
  field :family, type: String
  field :genus, type: String
  field :specific_epithet, type: String
  field :infraspecific_epithet, type: String
  field :scientific_name, type: String
end
