# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

engine = new Bloodhound(
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace,
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote:
    url: '/collection_objects/autocomplete?query=%QUERY',
    wildcard: '%QUERY'
)
engine.initialize

$(document).ready ->
  $(".collection_object_search").typeahead { highlight: true },
    { name: 'engine', source: engine.ttAdapter() }