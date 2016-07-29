$(document).ready(function(){ 
  $.get("images.html", function(data) {
    $("#images").html(data);
  });
}); 



$(document).ready(function(){ 
  $.get("menu.html", function(data) {
    $("#menu").html(data);
  });
}); 


$(document).ready(function(){ 
  $.get("footer.html", function(data) {
    $("#footer").html(data);
  });
}); 
 