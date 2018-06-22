// Navigation Submenu
document.addEventListener("turbolinks:load", function(event) {
  var menuToggle = document.getElementById("submenu-toggle");
  menuToggle.addEventListener("click", function toggleSubmenu(){
  var submenu = document.getElementById("submenu-content");
    if (submenu.classList.contains('show')) {
      submenu.classList.remove('show');
    } else {
      submenu.classList.add('show');
    }
  });
});

// Quick-search Widget
document.addEventListener("turbolinks:load", function(event) {
  var awe = new Awesomplete(document.querySelector("#query"),{})
  var req = new XMLHttpRequest();
  var qry = document.getElementById("query");
  qry.addEventListener("input", function showResult(){
    var str = this.value;
    req.onreadystatechange = function() {
      if(req.readyState === XMLHttpRequest.DONE && req.status === 200) {
      var rsp = JSON.parse(this.response);

      var list = rsp.map(function(item) {
        return [item];
      });
      awe.list = list;
      };
    };
    req.open("GET", "/collection_objects/autocomplete?query=" + str, true);
    req.send();
  });
});
