var engine = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace,
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: {
    url: '/collection_objects/autocomplete?query=%QUERY',
    wildcard: '%QUERY'
  }
});

engine.initialize();

$(document).ready(function() {
  $(".collection_object_search").typeahead({
    highlight: true
    },
    {
      name: 'engine',
      limit: 10,
      source: engine.ttAdapter()
    }
  )
});