class CollectionObjectsController < ApplicationController
  def index
    if params[:query].present?
      @collection_objects = CollectionObject.search(params[:query], page: params[:page], per_page: 10)
    else
  	  @collection_objects = CollectionObject.page(params[:page]).per(10)
  	end
  end

  def show
    @collection_object = CollectionObject.find(params[:id])
    embedded_data
  end

  def embedded_data
    @dwc_event = @collection_object.dwc_event
    @dwc_geological_context = @collection_object.dwc_geological_context
    @dwc_identification = @collection_object.dwc_identification
    @dwc_location = @collection_object.dwc_location
    @dwc_organism = @collection_object.dwc_organism
    @dwc_taxon = @collection_object.dwc_taxon
    @record_metadata = @collection_object.record_metadata
  end

  def object
    @collection_object = CollectionObject.find_by(dwc_catalog_number: params[:dwc_catalog_number])
    embedded_data
    render :show
  end

  def namespace(ns)
    case ns
    when 'dc'
      RDF::Vocab::DC
    when 'dwc'
    	RDF::Vocab::DWC
    when 'geo'
      RDF::Vocab::GEO
    when 'dwcc'
      RDF::Vocabulary.new('http://rs.tdwg.org/dwc/curatorial/')
    else
      raise 'unknown namespace'
    end
  end

  def trim(attributes)
    attributes.reject { |_k, v| v.is_a?(BSON::ObjectId) || v.is_a?(Hash) || v.is_a?(Array) }
			        .delete_if { |_k, v| v.blank? }
			        .to_h
  end

  def prepare_terms(hash)
		hash.keys
			  .map { |k| k.split('_') }
			  .map { |k| namespace(k.shift)[k.join('_').camelize(:lower)] } # generate the predicate
        .zip(hash.values)
        .map { |a| RDF::Statement.new(@subj, a[0], a[1]) }
  end

  def rdf
    @subj = RDF::URI.new("http://localhost:3000/data/rdf/#{params[:dwc_catalog_number]}")
    @prefixes = {
      rdf: 'http://www.w3.org/1999/02/22-rdf-syntax-ns#',
      xsi: 'http://www.w3.org/2001/XMLSchema-instance',
      xs: 'http://www.w3.org/2001/XMLSchema',
      dwc: 'http://rs.tdwg.org/dwc/terms/',
      dc: 'http://purl.org/dc/terms/',
      geo: 'http://www.w3.org/2003/01/geo/wgs84_pos#'
    }
  	@collection_object = CollectionObject.find_by(dwc_catalog_number: params[:dwc_catalog_number])
    @co_graph = RDF::Graph.new

#   	occ_oids = @collection_object.other_catalog_numbers
#   	                             .map { |oid| prepare_terms(trim(oid.attributes)) }
#   	                             .flatten
#   	                             .each { |oid| oid[:term] = oid[:term].pluralize }  # refactor


#     occ_oids.each do |field|
# 			@co_graph << [@subj, namespace(field[:ns])[field[:term]], field[:value]]
#     end

  	all_terms = [@collection_object.attributes,
  	             @collection_object.dwc_event&.attributes,
                 @collection_object.dwc_geological_context&.attributes,
                 @collection_object.dwc_identification&.attributes,
                 @collection_object.dwc_location&.attributes,
                 @collection_object.dwc_organism&.attributes,
                 @collection_object.dwc_taxon&.attributes,
                 @collection_object.record_metadata&.attributes
  	            ].compact
  	             .reduce({}, :merge)

    attrs = prepare_terms(trim(all_terms)).each { |f| @co_graph << f }

    case params[:format]
    when 'json'
    	json = RDF::JSON::Writer.buffer(prefixes: @prefixes) do |writer|
		    @co_graph.each_statement { |statement| writer << statement }
		  end
		  render json: json
		when 'ttl'
		  ttl = RDF::Turtle::Writer.buffer(prefixes: @prefixes) do |writer|
		    @co_graph.each_statement { |statement| writer << statement }
		  end
		  render plain: ttl
    else
      xml = RDF::RDFXML::Writer.buffer(prefixes: @prefixes) do |writer|
		    @co_graph.each_statement { |statement| writer << statement }
	    end
      render xml: xml
    end
  end

  def autocomplete
    white = Text::WhiteSimilarity.new
    fields = ['dwc_recorded_by',
              'dwc_identification.dwc_type_status',
              'dwc_taxon.dwc_family',
              'dwc_taxon.dwc_scientific_name',
              'dwc_location.dwc_country',
              'dwc_location.dwc_locality']
    results = CollectionObject.search(params[:query], {
      fields: fields,
      match: :word_start,
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map do |rs|
      fields.map { |f| f.split('.').last.gsub(/^[a-z0-9]+_/, '').humanize }
            .zip( fields.map { |f| eval("rs&.#{f.split('.').join('&.')}") } )
            .select { |e| e[1]}
            .sort { |a, b| white.similarity(b[1], params[:query]) <=> white.similarity(a[1], params[:query]) }
            .take(1).to_h
    end
    render json: results.uniq
  end
end
