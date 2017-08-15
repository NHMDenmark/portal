
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
        return [item.join(": "), item[1]];
      });
      awe.list = list;
      };
    };
    req.open("GET", "/collection_objects/autocomplete?query=" + str, true);
    req.send();
  });
});
