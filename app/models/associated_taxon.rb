# frozen_string_literal: true

# Embedded model for associated taxa.
# This is a custom model, not present as a class in DwC, where this is a single
# field containing a concatanated and separated literal (String).
class AssociatedTaxon
  include Mongoid::Document
  include RDFTransformable
  extend Mappable

  embedded_in :collection_object

  # A list (concatenated and separated) of identifiers or names of taxa and
  # their associations with the Occurrence.
  field :associated_taxon,
        as: :dwc_associated_taxa,
        label: RDF::Vocab::DWC['associatedTaxa'],
        type: String
end
