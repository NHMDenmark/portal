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
