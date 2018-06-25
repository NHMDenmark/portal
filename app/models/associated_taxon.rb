# frozen_string_literal: true

# Embedded model for associated taxa.
# This is a custom model, not present as a class in DwC, where this is a single
# field containing a concatanated and separated literal (String).
class AssociatedTaxon
  include Mongoid::Document

  embedded_in :collection_object

  # CUSTOM
  # An identifier or name of a taxon.
  field :name, type: String

  # CUSTOM
  # The association with the Occurrence.
  field :relationship, type: String

  # http://rs.tdwg.org/dwc/terms/associatedTaxa
  # A list (concatenated and separated) of identifiers or names of taxa and
  # their associations with the Occurrence.
  def dwc_associated_taxa
    "#{name}, #{relationship}"
  end
end
