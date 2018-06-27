# frozen_string_literal: true

# Mixin for RDF generation from a Mongoid model.
module RDFTransformable
  # Returns the attributes with RDF Vocabulary terms as keys.
  def rdf_attributes
    attributes.transform_keys{ |field| identity.first.term_for_field(field) }
  end
end
