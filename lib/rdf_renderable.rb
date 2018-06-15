module RDFRenderable
  # Returns all attributes for a document, including attributes from related
  # documents.
  def all_attributes(document)
    related_attributes(document).prepend(document.attributes)
                      .flatten
                      .compact
                      .reduce({}, :merge)
  end

  # Returns an Array with all related attributes for a document.
  def related_attributes(document)
    document.relations.keys.map do |rel|
      rel_attrs = document.public_send(rel)
      next unless rel_attrs
      if rel_attrs.is_a? Array
        rel_attrs.map(&:attributes)
      else
        rel_attrs.attributes
      end
    end
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
    attributes.each do |field, val|
      next if val.blank?
      next if val.is_a?(BSON::ObjectId) || val.is_a?(Hash) || val.is_a?(Array)
      predicate = predicate_from_field field
      next unless predicate
      graph << RDF::Statement.new(subject, predicate, format_dates(val))
    end
    graph
  end

  # Returns the namespace for the attribute prefix.
  def namespace(attr_prefix)
    case attr_prefix
    when 'dc'
      RDF::Vocab::DC
    when 'dwc'
    	RDF::Vocab::DWC
    when 'geo'
      RDF::Vocab::GEO
    when 'dwcc'
      RDF::Vocabulary.new('http://rs.tdwg.org/dwc/curatorial/')
    else
      nil
    end
  end

  # Returns the RDF predicate.
  def predicate_from_field(field)
      words = field.split('_')
      field_prefix = words.shift
      ns = namespace(field_prefix)
      return unless ns
      ns[words.join('_').camelize(:lower)]
  end

  # Returns a Hash of prefixes and URIs, to be used by RDF::JSON::Writer,
  # RDF::Turtle::Writer, and RDF::RDFXML::Writer, respectively.
  def prefixes
    {
      rdf: 'http://www.w3.org/1999/02/22-rdf-syntax-ns#',
      xsi: 'http://www.w3.org/2001/XMLSchema-instance',
      xs: 'http://www.w3.org/2001/XMLSchema',
      dwc: 'http://rs.tdwg.org/dwc/terms/', # RDF::Vocab::DWC.to_s
      dc: 'http://purl.org/dc/terms/',
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

  # Returns the URI for the RDF subject.
  def subject(field_val)
    RDF::URI.new("#{request.base_url}/data/rdf/#{field_val}")
  end
end
