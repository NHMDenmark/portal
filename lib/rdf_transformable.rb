# frozen_string_literal: true

# Mixin for RDF generation from a Mongoid model.
module RDFTransformable
  # Returns the attributes with RDF Vocabulary terms as keys.
  def rdf_attributes(keys: :uri)
    attributes.transform_keys do |field|
      term = identity.first.rdf_term(field)
      keys == :element ? term&.path&.split('/')&.last : term
    end
  end
end
