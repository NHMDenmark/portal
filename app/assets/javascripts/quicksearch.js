
document.addEventListener("DOMContentLoaded", function(event) { 
  var awe = new Awesomplete(document.querySelector("#query"),{})
  var req = new XMLHttpRequest();
  var qry = document.getElementById("query");
  qry.addEventListener("input", function showResult(){
    var str = this.value;
    req.onreadystatechange = function() {
      if(req.readyState === XMLHttpRequest.DONE && req.status === 200) {
      var rsp = JSON.parse(this.response);
      console.log(rsp);
      var list = rsp.map(function(item) {
        return item['Locality'];
      });
      awe.list = list;
      };
    };
    req.open("GET", "/collection_objects/autocomplete?query=" + str, true);
    req.send();
  });
});
