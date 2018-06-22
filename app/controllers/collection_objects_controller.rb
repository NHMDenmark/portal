# frozen_string_literal: true

# Controller for CollectionObject
class CollectionObjectsController < ApplicationController
  include RDFRenderable

  def index
    if params[:query].present?
      @collection_objects = CollectionObject.search(params[:query],
                                                    page: params[:page],
                                                    per_page: 10)
    else
      @collection_objects = CollectionObject.page(params[:page]).per(10)
    end
  end

  # Detail page

  def show
    @source_collection = collection_object.source_collection
    prepare(collection_object.attributes)
  end

  def prepare(document)
    @document = document
    @document.delete('_id')
    @catalog_number = @document.delete :dwc_catalog_number
    @other_catalog_numbers = @document.delete :other_catalog_numbers
    @metadata = @document.delete :metadata
    @sections = []
    filter_sections! @document
  end

  # Removes embedded documents from _document_, adds them to @record_details.
  # To be displayed as HTML <section> elements.
  def filter_sections!(document)
    document.delete_if do |key, value|
      next unless document[key].is_a?(BSON::Document)
      @sections << { header: section_header(key),
                     section: value,
                     leaflet: coordinates?(value) }
    end
  end

  # Returns true if _document_ has coordinate fields.
  def coordinates?(document)
    !document[:dwc_decimal_latitude].blank? &&
      !document[:dwc_decimal_longitude].blank?
  end

  # Returns a section header for an embedded document from <em>field_name</em>.
  def section_header(field_name)
    field_name.split('_')[1..-1].join('_')
  end

  # Navigation

  def breadcrumbs
    case action_name
    when 'object', 'show'
      [
        [@source_collection[:dwc_collection_id], @source_collection],
        [@catalog_number, object_path(dwc_catalog_number: @catalog_number)]
      ]
    when 'index'
      []
    else
      ["define #{controller_name}#{action_name} breadcrumbs", '#']
    end
  end

  def autocomplete
    results = suggest(params[:query],
                      'dwc_recorded_by',
                      'dwc_identification.dwc_type_status',
                      'dwc_taxon.dwc_family',
                      'dwc_taxon.dwc_scientific_name',
                      'dwc_location.dwc_country',
                      'dwc_location.dwc_locality')
    render json: results.uniq
  end

  # Returns two dimensional array
  def search_elastic(str, *fields)
    CollectionObject.search(str, fields: fields,
                                 match: :word_start,
                                 limit: 10,
                                 load: false, # remove when suggest works
                                 misspellings: { below: 5 },
                                 suggest: true)
  end

  # extracts the value for (nested) fields from the results returned by
  # searchkick
  def field_value(field_path, hash_wrapper)
    current_field = field_path.shift
    val = hash_wrapper[current_field]
    return val unless val.respond_to? :key?
    field_value(field_path, val)
  end

  # performs elastic search search, returns suggestions
  def suggest(str, *fields)
    # search_elastic(str, *fields).suggestions
    search_elastic(str, *fields).inject([]) do |arr, rs|
      arr << results(fields, rs).min { |a, b| white_compare(a, b, str) }
    end
  end

  # returns two dimensional array of results for all fields in record
  # not only those with match
  def results(fields, hash_wrapper)
    fields.map { |f| field_value f.split('.'), hash_wrapper }.compact
  end

  # compares text by White similarity
  def white_compare(str1, str2, ref_str)
    w = Text::WhiteSimilarity.new
    w.similarity(str2, ref_str) <=> w.similarity(str1, ref_str)
  end

  # Renders the RDF in the requested format.
  def rdf
    co_graph = load_graph subject(params[:dwc_catalog_number]),
                          all_attributes(collection_object)
    render doc_type(params[:format]) => rdf_document(co_graph, params[:format])
  end

  private

  def collection_object
    CollectionObject.find(params[:id])
  end
end
