 var slideIndex = 0;
 var x = document.getElementsByClassName("mySlides");

function init_carousel() {
    // var i;
    // x = document.getElementsByClassName("mySlides");
    // for (i = 0; i < x.length; i++) {
    //     x[i].style.display = "none";
    // }
    setTimeout(prime_carousel, 200);
}

function prime_carousel(){
	 // var i;
    x = document.getElementsByClassName("mySlides");
    // for (i = 0; i < x.length; i++) {
    //     x[i].style.display = "none";
    // }
    // 
    x[slideIndex ].style.display = "block";
    setTimeout(carousel, 3800);

}

function carousel() {
    // var i;
    // var x = document.getElementsByClassName("mySlides");
    // var x = document.getElementsByClassName("w3-animate-fading");
    // for (i = 0; i < x.length; i++) {
    //     x[i].style.display = "none";
    // }
    // x[slideIndex ].style.display = "none";
    slideIndex++;
    if (slideIndex > x.length-1) { slideIndex = 0 };
    x[slideIndex ].style.display = "block";
    if (slideIndex > 0) {
    	x[slideIndex -1].style.display = "none";	
    }
    else {
    	x[x.length -1].style.display = "none";	


    }
    
    setTimeout(carousel, 4000); // Change image every 4 seconds
}



$(document).ready(function(){ 
  
   $.get("menu.html", function(data) {
    $("#menu").html(data);
  });
   $.get("imgs2.html", function(data) {
    $("#images").html(data);
  });
   $.get("home.html", function(data) {
    $("#maincontent").html(data);
  });
    $.get("footer.html", function(data) {
    $("#footr").html(data);
  });
  init_carousel();
}); 



// $(document).ready(function(){ 
//   $.get("menu.html", function(data) {
//     $("#menu").html(data);
//   });
// }); 


// $(document).ready(function(){ 
//   $.get("footer.html", function(data) {
//     $("#footr").html(data);
//   });
// }); 

// $(document).ready(function(){ 
//   $.get("home.html", function(data) {
//     $("#maincontent").html(data);
//   });
// }); 


 




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
		
			$.get("whoweare.html", function(data){
				$("#maincontent").html(data)});
}



function staff(){
		
			$.get("staff.html", function(data){
				$("#maincontent").html(data)});
}

function history(){
		
			$.get("history.html", function(data){
				$("#maincontent").html(data)});
}

function playschool(){
		
			$.get("playschool.html", function(data){
				$("#maincontent").html(data)});
}

function unitedMethodistWomen(){
		
			$.get("umwomen.html", function(data){
				$("#maincontent").html(data)});
}

 