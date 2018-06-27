# frozen_string_literal: true

# Embedded model for associated sequences.
# This is a custom model, not present as a class in DwC, where this is a single
# field containing a concatanated and separated literal (String).
class AssociatedSequence
  include Mongoid::Document
  include RDFTransformable
  extend Mappable

  embedded_in :collection_object

  # A list (concatenated and separated) of identifiers (publication, global
  # unique identifier, URI) of genetic sequence information associated with the
  # Occurrence.
  field :sequence,
        as: :dwc_associated_sequences,
        label: RDF::Vocab::DWC['associatedSequences'],
        type: String
end
