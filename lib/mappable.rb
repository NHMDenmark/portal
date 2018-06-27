# frozen_string_literal: true

# Mixin for Mongoid model mapping to vocabulary terms.
module Mappable
  # Returns the Mongoid field for a RDF Vocabulary term.
  def field_for_term(rdf_vocab_term)
    fields.find { |_name_str, field| field.label == rdf_vocab_term }&.last
  end

  # Returns the Mongoid field for a URI representing a RDF Vocabulary term.
  def field_for_uri(uri)
    fields.find { |_name_str, field| field.label.to_s == uri.to_s }&.last
  end

  # Returns the onotological class term for the model class.
  def rdf_class_term
    @rdf_class_term
  end

  # Sets the ontological class term for the model class to the RDF Vocabulary
  # term passed as argument.
  def rdf_class_term=(rdf_vocab_term)
    @rdf_class_term = rdf_vocab_term
  end

  # Returns the RDF Vocabulary term for a Mongoid field.
  def rdf_term(field_name)
    fields[field_name.to_s]&.label
  end
end
