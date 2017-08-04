
document.addEventListener("DOMContentLoaded", function(event) { 
  var awe = new Awesomplete(document.querySelector("#query"),{})
  var req = new XMLHttpRequest();
  var qry = document.getElementById("query");
  qry.addEventListener("keyup", function showResult(){
    str = this.value;
    req.onreadystatechange = function() {
      console.log(this.response);
      awe.list = this.response;
    };
    req.open("GET", "/collection_objects/autocomplete?query=" + str, true);
    req.send();
  });
});
