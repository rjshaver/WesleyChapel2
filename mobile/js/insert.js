$(document).ready(function(){ 
  $.get("imgs2.html", function(data) {
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
    $("#footr").html(data);
  });
}); 

$(document).ready(function(){ 
  $.get("home.html", function(data) {
    $("#maincontent").html(data);
  });
}); 


 