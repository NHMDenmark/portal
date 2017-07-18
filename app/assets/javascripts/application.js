// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require leaflet
//= require typeahead.bundle
//= require_tree .

var engine = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace,
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: {
    url: '/collection_objects/autocomplete?query=%QUERY',
    wildcard: '%QUERY'
  }
});

engine.initialize();

$(document).on('turbolinks:load', function() {
  $(".quicksearch").typeahead({
    highlight: true
    },
    {
      name: 'engine',
      limit: 10,
      source: engine.ttAdapter()
    }
  )
});