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


$(document).ready(function(){
	document.getElementById("menu").getElementById("sundaymorning").onclick = function(){
			alert("Sunady");
			$.get("sundaymorninginsert.html", function(data){
				$("#maincontent").html(data)});
	
	};

	$(".home").click(function() {
		alert("home");
	$.get("home.html", function(data){
		$("#maincontent").html(data);
		});

	});

$(".sundaymorning").click(function() {
	alert("Sunady");
	$.get("sundaymorninginsert.html", function(data){
		$("#maincontent").html(data);
	});
});

$("#sundaymorning")

$(".directions").click(function() {
	alert("directions");
	$.get("directions3.html", function(data){
		$("#maincontent").html(data);
	});
});

});



 