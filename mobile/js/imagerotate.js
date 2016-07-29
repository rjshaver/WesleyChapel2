 var MAXPICS = 83;


    var howOften = 5; //number often in seconds to rotate
    var current = 0; //start the counter at 0

    var ns6 = document.getElementById && !document.all; //detect netscape 6
    // place your images, text, etc in the array elements here
    



    var pics = new Array();
    //var imagerow= document.getElementById("imagesrow");
    //alert(imagerow.clientHeight);
    //var imrowheight = document.getElementById("imagesrow").clientHeight;
      //  <!--               height='193px' width='291px'  height='469px' width='707px'       -->
    var items = new Array();
    items[0] = "<img alt='church (18K)' src='images/1-church.jpg' border='0' class='img-responsive'>"; //a linked image
    //"<a href='link.htm'><img alt='church (18K)' src='images/church.jpg' border='0' /><\/a>"; //a linked image



    function loadpics(){
        getfiles();
        rotater();
    }

    //  This puts in the names of the files in images/rotate/image??.jpg into the items to be displayed
    function getfiles() {
        var curfilename = "";
        for (var i=1;i<= MAXPICS;i++) {
            curfilename = "image"+i.toString();
            
            pics.push(curfilename);
        }
        
        var itemhtml = "";
        for (var k = 0;k<MAXPICS;k++){
            //itemhtml = "<a href='link.htm' ><img alt='" + pics[k-1] + " (9K)' src='images/rotate/" + pics[k-1] + ".jpg'  border='0' /><\/a>";
            itemhtml = "<img alt='" + pics[k] + " (9K)' src='images/rotate/" + pics[k] + ".jpg' border='0' class='img-responsive'>";
            //  height='193px' width='291px'
            items.push(itemhtml);
        }

        //  for files that are narrow, put in their numbers here so that they will not be stretched
        //  
        /*
        //  
        var narrownums = [18,40,47,48, 65,68,69,73];
        for (l=0, len= narrownums.length;l<len;l++){
            var m = narrownums[l];

             items[m] = items[m].replace("width='291px","width='127px");

        }*/
    }

    function rotater() {
        // setopacity("placeholderlayer",0);
        setopacity("placeholderdiv",0);
        // if (document.layers) {
        //     document.placeholderlayer.document.write(items[current]);
        //     document.placeholderlayer.document.close();
        // }
        // if (ns6)
         document.getElementById("placeholderdiv").innerHTML = items[current];
        // if (document.all)
        //     placeholderdiv.innerHTML = items[current];
        // for (ktime=1;ktime<=10;ktime++){
        //     setTimeout("setopacity('placeholderlayer',0.1*ktime)",ktime*100);
        // }
        // 
        // 
   
        for (utime=0.1;utime<=1.0;utime+=0.1){
            
            setTimeout("setopacity('placeholderdiv',"+utime+")",utime*1000);
        }

         for (utime=1.0;utime>=0.0;utime-=0.1){
            
            setTimeout("setopacity('placeholderdiv',"+utime+")",(howOften-utime)*1000);
        }



        // setTimeout("setopacity('placeholderlayer',0.1)",100);
        // setTimeout("setopacity('placeholderdiv',0.1)",100);
        // setTimeout("setopacity('placeholderlayer',0.2)",200);
        // setTimeout("setopacity('placeholderdiv',0.2)",200);
        // setTimeout("setopacity('placeholderlayer',0.3)",300);
        // setTimeout("setopacity('placeholderdiv',0.3)",300);
        // setTimeout("setopacity('placeholderlayer',0.4)",400);
        // setTimeout("setopacity('placeholderdiv',0.4)",400);
        // setTimeout("setopacity('placeholderlayer',0.5)",500);
        // setTimeout("setopacity('placeholderdiv',0.5)",500);
        // setTimeout("setopacity('placeholderlayer',0.6)",600);
        // setTimeout("setopacity('placeholderdiv',0.6)",600);
        // setTimeout("setopacity('placeholderlayer',0.7)",700);
        // setTimeout("setopacity('placeholderdiv',0.7)",700);
        // setTimeout("setopacity('placeholderlayer',0.8)",800);
        // setTimeout("setopacity('placeholderdiv',0.8)",800);
        // setTimeout("setopacity('placeholderlayer',0.9)",900);
        // setTimeout("setopacity('placeholderdiv',0.9)",900);
        // setTimeout("setopacity('placeholderlayer',1)",1000);
        // setTimeout("setopacity('placeholderdiv',1)",1000);
        // setTimeout("setopacity('placeholderlayer',0.9)",howOften * 1000 -900);
        // setTimeout("setopacity('placeholderdiv',0.9)",howOften * 1000 -900);
        // setTimeout("setopacity('placeholderlayer',0.8)",howOften * 1000 -800);
        // setTimeout("setopacity('placeholderdiv',0.8)",howOften * 1000 -800);
        // setTimeout("setopacity('placeholderlayer',0.7)",howOften * 1000 -700);
        // setTimeout("setopacity('placeholderdiv',0.7)",howOften * 1000 -700);
        // setTimeout("setopacity('placeholderlayer',0.6)",howOften * 1000 -600);
        // setTimeout("setopacity('placeholderdiv',0.6)",howOften * 1000 -600);
        // setTimeout("setopacity('placeholderlayer',0.5)",howOften * 1000 -500);
        // setTimeout("setopacity('placeholderdiv',0.5)",howOften * 1000 -500);
        // setTimeout("setopacity('placeholderlayer',0.4)",howOften * 1000 -400);
        // setTimeout("setopacity('placeholderdiv',0.4)",howOften * 1000 -400);
        // setTimeout("setopacity('placeholderlayer',0.3)",howOften * 1000 -300);
        // setTimeout("setopacity('placeholderdiv',0.3)",howOften * 1000 -300);
        // setTimeout("setopacity('placeholderlayer',0.2)",howOften * 1000 -200);
        // setTimeout("setopacity('placeholderdiv',0.2)",howOften * 1000 -200);
        // setTimeout("setopacity('placeholderlayer',0.1)",howOften * 1000 -100);
        // setTimeout("setopacity('placeholderdiv',0.1)",howOften * 1000 -100);
        current = (current == items.length - 1) ? 0 : current + 1; //increment or reset
        setTimeout("rotater()", howOften * 1000);
    }

    function setopacity(id,level){
        document.getElementById(id).style.opacity = level;
        document.getElementById(id).style.MozOpacity = level;
        document.getElementById(id).style.KhtmlOpacity = level;
        document.getElementById(id).style.filter = "alpha(opacity=" + (level*100) + ")";
    }
