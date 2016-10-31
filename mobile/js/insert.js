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


// $(document).ready(function(){ 
//   $.get("facebook.html", function(data) {
//     $("#afacehtml").html(data);
//   });
// }); 
// 
// 


function home(){
	
	  $.get("home.html", function(data) {
    $("#maincontent").html(data);
  });
}

function sundaymorning(){
		
			$.get("sundaymorninginsert.html", function(data){
				$("#maincontent").html(data)});
}


function directions(){
		
			$.get("directions3.html", function(data){
				$("#maincontent").html(data)});
}

function missions(){
		
			$.get("missions2.html", function(data){
				$("#maincontent").html(data)});
}



function calendar(){
		
			$.get("calendar.html", function(data){
				$("#maincontent").html(data)});
}

function contact(){
		
			$.get("contact.html", function(data){
				$("#maincontent").html(data)});
}
function whoweare(){
		
			$.get("sundaymorninginsert.html", function(data){
				$("#maincontent").html(data)});
}



function staff(){
		
			$.get("sundaymorninginsert.html", function(data){
				$("#maincontent").html(data)});
}

function history(){
		
			$.get("sundaymorninginsert.html", function(data){
				$("#maincontent").html(data)});
}

function playschool(){
		
			$.get("sundaymorninginsert.html", function(data){
				$("#maincontent").html(data)});
}

function unitedMethodistWomen(){
		
			$.get("sundaymorninginsert.html", function(data){
				$("#maincontent").html(data)});
}

 