# frozen_string_literal: true

# Mixin for RDF generation from a controller.
module RDFRenderable
  # Returns all RDF attributes for a document, including attributes from related
  # documents.
  def all_attributes(document, keys: :uri)
    related_attributes(document,
                       keys: keys).prepend(document.rdf_attributes(keys: keys))
                                  .flatten
                                  .compact
                                  .reduce({}, :merge)
  end

  # Returns a symbol for the format to be rendered.
  def doc_type(rdf_format)
    %w[json xml].include?(rdf_format) ? rdf_format.to_sym : :plain
  end

  # Returns the appropriate RDF Writer class for document generation
  def doc_writer(rdf_format)
    case rdf_format
    when 'json'
      RDF::JSON::Writer
    when 'ttl'
      RDF::Turtle::Writer
    when 'xml'
      RDF::RDFXML::Writer
    else
      raise ArgumentError, "Invalid format #{params[:format]}"
    end
  end

  # Returns a formatted date if the valus is a date.
  def format_dates(value)
    return value unless value.is_a? Time
    value.to_date
  end

  # Appends all _atributes_ as RDF::Statement instances to _graph_.
  def load_graph(subject, attributes)
    graph = RDF::Graph.new
    attributes.each do |predicate, val|
      next if val.blank?
      next if val.is_a?(BSON::ObjectId) || val.is_a?(Hash) || val.is_a?(Array)
      graph << RDF::Statement.new(subject, predicate, format_dates(val))
    end
    graph
  end

  # Returns a Hash of prefixes and URIs, to be used by RDF::JSON::Writer,
  # RDF::Turtle::Writer, and RDF::RDFXML::Writer, respectively.
  def prefixes
    {
      rdf: 'http://www.w3.org/1999/02/22-rdf-syntax-ns#',
      xsi: 'http://www.w3.org/2001/XMLSchema-instance',
      xs: 'http://www.w3.org/2001/XMLSchema',
      RDF::Vocab::DWC.__prefix__ => RDF::Vocab::DWC.to_s,
      RDF::Vocab::DC.__prefix__ => RDF::Vocab::DC.to_s,
      geo: 'http://www.w3.org/2003/01/geo/wgs84_pos#'
    }
  end

  # Returns an RDF document from the _graph_ in the requested
  # <em>rdf_format</em>.
  def rdf_document(graph, rdf_format)
    doc_writer(rdf_format).buffer(prefixes: prefixes) do |writer|
      graph.each_statement { |statement| writer << statement }
    end
  end

  # Returns an Array with all related RDF attributes for a document.
  def related_attributes(document, keys: :uri)
    document.relations.keys.map do |relation|
      related_document = document.public_send(relation)
      next unless related_document
      if related_document.is_a? Array
        related_document.map { |doc| doc.rdf_attributes(keys: keys) }
      else
        related_document.rdf_attributes(keys: keys)
      end
    end
  end

  # Returns the URI for the RDF subject.
  def subject(field_val)
    RDF::URI.new("#{request.base_url}/data/rdf/#{field_val}")
  end
end
