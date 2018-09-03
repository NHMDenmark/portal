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

  # Returns the Mongoid::Association::Embedded::EmbeddedIn instance by which
  # the model is embedded into another model
  # FIXME: should have optional model arg to define which model
  def embedded_relation
    return nil unless embedded?
    relations.find do |_name, relation|
      relation.class == Mongoid::Association::Embedded::EmbeddedIn
    end&.last
  end

  # Returns the name of the inverse relation
  def embedded_as
    embedded_relation&.inverse
  end

  # Returns the relation type (_:many_ or _:one_) for the association by which
  # the model is embedded into another model.
  def embedded_type
    relation = embedded_relation
    return unless relation
    inverse = relation.inverse_association(relation.relation_class)
    /(Many|One)$/.match(inverse.class.name) { |m| m[0].downcase.to_sym }
  end

  #
  def parent_model
    embedded_relation&.relation_class
  end

  # query_fields
  def template_query_fields
    @template_query_field
  end

  #
  def template_query_field(field, index_type)
    @template_query_field ||= []
    index({ field => 1 }, index_type)
    @template_query_field << field
  end

  # Returns an array of all fields in a model that are declared fields to
  # store data.
  def data_fields
    fields.values.reject do |f|
      f.is_a?(Mongoid::Fields::ForeignKey) ||
        f.options[:type] == BSON::ObjectId
    end
  end

  # Returns a hash of term-field mappings, where keys are the full URLs
  # for ontological terms, values are the corresponding fields defined on
  # the Mongoid model.
  def field_map
    data_fields.each_with_object({}) do |field, map_hash|
      term = field.label
      map_hash[term] = field.name.to_sym if term
      map_hash
    end
  end

  # Returns an array of fields defined on the Mongoid model that could not
  # be mapped to an ontological term.
  def unresolved_fields
    data_fields.select { |field| field.label.nil? }
               .map { |field| field.name.to_sym }
  end

  alias label rdf_class_term
end
