class DwcTaxon
  include Mongoid::Document

  embedded_in :collection_object

  field :dwc_taxon_id, type: String
  field :dwc_scientific_name_id, type: String
  field :dwc_accepted_name_usage_id, type: String
  field :dwc_parent_name_usage_id, type: String
  field :dwc_original_name_usage_id, type: String
  field :dwc_name_according_to_id, type: String
  field :dwc_name_published_in_id, type: String
  field :dwc_taxon_concept_id, type: String
  field :dwc_scientific_name, type: String
  field :dwc_accepted_name_usage, type: String
  field :dwc_parent_name_usage, type: String
  field :dwc_original_name_usage, type: String
  field :dwc_name_according_to, type: String
  field :dwc_name_published_in, type: String
  field :dwc_name_published_in_year, type: Integer
  field :dwc_higher_classification, type: String
  field :dwc_kingdom, type: String
  field :dwc_phylum, type: String
  field :dwc_class, type: String
  field :dwc_order, type: String
  field :dwc_family, type: String
  field :dwc_genus, type: String
  field :dwc_subgenus, type: String
  field :dwc_specific_epithet, type: String
  field :dwc_infraspecific_epithet, type: String
  field :dwc_taxon_rank, type: String
  field :dwc_verbatim_taxon_rank, type: String
  field :dwc_scientific_name_authorship, type: String
  field :dwc_vernacular_name, type: String
  field :dwc_nomenclatural_code, type: String
  field :dwc_taxonomic_status, type: String
  field :dwc_nomenclatural_status, type: String
  field :dwc_taxon_remarks, type: String
end
