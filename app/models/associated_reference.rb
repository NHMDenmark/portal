# frozen_string_literal: true

# Embedded model for associated references.
# This is a custom model, not present as a class in DwC, where this is a single
# field containing a concatanated and separated literal (String).
class AssociatedReference
  include Mongoid::Document

  embedded_in :collection_object

  # http://rs.tdwg.org/dwc/terms/associatedReferences
  # A list (concatenated and separated) of identifiers (publication,
  # bibliographic reference, global unique identifier, URI) of literature
  # associated with the Occurrence.
  field :reference,
        as: :dwc_associated_references,
        label: RDF::Vocab::DWC['associatedReferences'],
        type: String
end
