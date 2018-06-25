# frozen_string_literal: true

# Embedded model for associated sequences.
# This is a custom model, not present as a class in DwC, where this is a single
# field containing a concatanated and separated literal (String).
class AssociatedSequence
  include Mongoid::Document

  embedded_in :collection_object

  # http://rs.tdwg.org/dwc/terms/associatedSequences
  # A list (concatenated and separated) of identifiers (publication, global
  # unique identifier, URI) of genetic sequence information associated with the
  # Occurrence.
  field :identifier, type: String
end
