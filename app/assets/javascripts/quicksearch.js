

function showResult(str) {
  var req = new XMLHttpRequest();
//   var awe = new Awesomplete(document.querySelector("#query"),{})
  req.onreadystatechange = function() {
    console.log(this.response)
//     var list = JSON.parse(this.responseText)
       var list = this.response
       console.log(this.response)
//        awe.list = list
//     new Awesomplete(document.querySelector("#query"),{ list: this.response });
  };
  req.open("GET", "/collection_objects/autocomplete?query=" + str, true);
  req.send();
}




// function showResult(str) {
//   if (str.length==0) { 
// //     document.getElementById("livesearch").innerHTML="";
// //     document.getElementById("livesearch").style.border="0px";
//     return;
//   }
//   xmlhttp = new XMLHttpRequest();
// 
//   xmlhttp.onreadystatechange = function() {
//     if (this.readyState==4 && this.status==200) {
// //       document.getElementById("livesearch").innerHTML=this.responseText;
// //       document.getElementById("livesearch").style.border="1px solid #A5ACB2";
//     }
//   }
//   xmlhttp.open("GET","/collection_objects/autocomplete?query=" + str, true);
//   console.log(xmlhttp.status)
// //   var list = JSON.parse(xmlhttp.responseText)
//   new Awesomplete(document.querySelector("#query"),{ list: xmlhttp.response });
//   xmlhttp.send();
// }




// document.addEventListener("DOMContentLoaded", function(event) { 
//   var awe_user_country=AwesompleteUtil.start('#query', 
//    {}, 
//    {
//     minChars: 1, 
//     maxItems: 7, 
//     data: function(rec, input) { return rec; }
//    }
//   );
// 
//   AwesompleteUtil.ajax('/collection_objects/autocomplete?query=', '', '', 
//     function(e) {
//       var xhr = this, list;
//       if (xhr.status === 200) {
//         list = JSON.parse(xhr.responseText);
//         AwesompleteUtil.load(awe_user_country, list, true);
//       }
//      }
//   );
// });
