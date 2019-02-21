# frozen_string_literal: true

# Controller for CollectionObject
class CollectionObjectsController < ApplicationController
  include Autocompletable
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
    @catalog_number = @document.delete :catalog_number
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
    !document[:latitude].blank? &&
      !document[:longitude].blank?
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

  # Autocomplete for quick search
  def autocomplete
    results = typeahead(params[:query],
                        *CollectionObject.quicksearch_fields) do |str, fields|
                          CollectionObject.search(str,
                                                  fields: fields,
                                                  match: :word_start,
                                                  limit: 10,
                                                  load: false,
                                                  misspellings: { below: 5 })
                        end
    render json: results
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
