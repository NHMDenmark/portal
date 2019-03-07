document.addEventListener("turbolinks:load", function(event) {
  var sections = document.getElementsByClassName("section-expander");
  for(var i=0; i<sections.length; i++){
    sections[i].addEventListener("click", function(e){
      e.preventDefault();
      this.classList.toggle("section-hidden");
      console.log(this);
    });
  }
});

// function should take args for lat lon
// window.onload = function() {
//   var mymap = L.map('map').setView([51.505, -0.09], 13);
//   L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
//     attribution: 'Map data © <a href="https://openstreetmap.org/copyright">OpenStreetMap</a> contributors, <a href="http://viewfinderpanoramas.org/">SRTM</a> | Map style © <a href="https://opentopomap.org/">OpenTopoMap</a> (<a href="https://creativecommons.org/licenses/by-sa/3.0/">CC-BY-SA</a>)',
//     maxZoom: 18
//   }).addTo(mymap);
// }
