class DwcTaxon
  include Mongoid::Document

  embedded_in :collection_object

  field :taxon_id, type: String
  field :scientific_name_id, type: String
  field :accepted_name_usage_id, type: String
  field :parent_name_usage_id, type: String
  field :original_name_usage_id, type: String
  field :name_according_to_id, type: String
  field :name_published_in_id, type: String
  field :taxon_concept_id, type: String
  field :scientific_name, type: String
  field :accepted_name_usage, type: String
  field :parent_name_usage, type: String
  field :original_name_usage, type: String
  field :name_according_to, type: String
  field :name_published_in, type: String
  field :name_published_in_year, type: Integer
  field :higher_classification, type: String
  field :kingdom, type: String
  field :phylum, type: String
#   field :class, type: String
  field :order, type: String
  field :family, type: String
  field :genus, type: String
  field :subgenus, type: String
  field :specific_epithet, type: String
  field :infraspecific_epithet, type: String
  field :taxon_rank, type: String
  field :verbatim_taxon_rank, type: String
  field :scientific_name_authorship, type: String
  field :vernacular_name, type: String
  field :nomenclatural_code, type: String
  field :taxonomic_status, type: String
  field :nomenclatural_status, type: String
  field :taxon_remarks, type: String
end
