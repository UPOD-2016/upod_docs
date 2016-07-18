
    
    var bMouseDragging = false;
    var nMouseOffsetX = 0;
    var nMouseOffsetY = 0;
           
			var lineObj=document.getElementById("PathObject");             //line from the object to the image
			var lineObj2=document.getElementById("PathObject2");           //line from the object to the pole(middle of the mirror)
			var lineImage=document.getElementById("PathImage");            //line from pole to the image
			var image=document.getElementById("image");                    //image
			var ground2=document.getElementById("ground2");                //line on the top of the image
			var  imageFlash=document.getElementById("imageFlash");
			
	function mouseDown(evt) { 
        bMouseDragging = true;
        
        var object = document.getElementById("object");                     //object
        if(object) {
           var p = document.documentElement.createSVGPoint();
            p.x = evt.clientX;
           // p.y = evt.clientY;
        
            var m = object.getScreenCTM();
            p = p.matrixTransform(m.inverse());
            nMouseOffsetX = p.x - parseInt(object.getAttribute("x"));
            //nMouseOffsetY = p.y - parseInt(ball.getAttribute("cy"));
        }
    }
    function mouseMove(evt) { 

        var p = document.documentElement.createSVGPoint();
        p.x = evt.clientX;
        //p.y = evt.clientY;
        var bClient = true;
		var trans = "";
		
        
        if(bMouseDragging) {
			
			var r=0;
			var pole=2000;
			var h0=800;
			var y_Obj=200;
			var Hground=1000;    //the height from top of the page to the ground
			var FPointX=pole-Fpoint.getAttribute("cx");  //x coordinate of focal point
			
			console.log(FPointX);
            if(object) {
        
                var m = object.getScreenCTM();
                p = p.matrixTransform(m.inverse());
                //ball.setAttribute("x", p.x - nMouseOffsetX);
				var n =  p.x - nMouseOffsetX;
				var d0=pole-n;
				console.log("d0 "+d0);
				var di=1/((1/FPointX)-(1/d0));
				console.log("di "+di);
				var s=pole+di;                             //the distance of the image from the vertical line passing point(0,0)
			   console.log("s "+(di+pole));
			   var NewRatio=di/d0;                        //the new ratio of the height of them image to the height of the object
				
				var hi=NewRatio*h0; //the height of the image
				
				var y = image.getAttribute("y");
				 
				if(n<1800){
					cont=true;
				}
				else{
					cont=false;
					init();
				}
				
				
				if (cont){
					
			
				
				
				trans = "translate(" + n + ")";
				
				
				object.setAttribute("x", n);
				
                var x = image.getAttribute("x");
				 
				
                
                image.setAttribute("transform", "scale(" + NewRatio+ ")");          //scale the image by the ratio
				
				lineObj.setAttribute("x1",n );
				lineObj.setAttribute("x2",s);
				lineObj.setAttribute("y2", Hground+NewRatio*h0);
				
				lineObj2.setAttribute("x1",n );
				lineObj2.setAttribute("y2",Hground+NewRatio*h0);
				ground2.setAttribute("y1",((Hground)+h0*NewRatio));
				ground2.setAttribute("y2",((Hground)+h0*NewRatio));
				imageFlash.setAttribute("y", Hground+NewRatio*h0);
				
				lineImage.setAttribute("x2",s);
				lineImage.setAttribute("y2",Hground+NewRatio*h0);
				
			
				var y = image.getAttribute("y");
				
				var y_img=Hground+NewRatio*h0                                       //y of image from the point (0,0)
				var Im_x=(s)/NewRatio;
				image.setAttribute("x", Im_x);
				
				//imageline_Flash.setAttribute("y",y_img)
			
				
				var k=Hground/NewRatio ;                       //to make the image moving on a ground line, since after using scale its position changes as well as its size
				
				image.setAttribute("y", k);	
					
				//ball.setAttribute("cx",evt.clientX);
				
				
				
				
				
				
				
				
				}
				
				
			}
		}
    }
    function mouseUp(evt) { 
        bMouseDragging = false;
		
		
    }
    
    
    
    
    function init() {
		
             object = document.getElementById("object");
			 lineObj=document.getElementById("PathObject");
			 lineObj2=document.getElementById("PathObject2");
			 lineImage=document.getElementById("PathImage");
			 image=document.getElementById("image");
			 imageFlash=document.getElementById("imageFlash");
			
			 Fpoint=document.getElementById("Focalpoint");
			 ground2=document.getElementById("ground2");

             if(object) {
            object.addEventListener("mousedown", mouseDown, false);
            object.addEventListener("mouseup", mouseUp, false);
            object.addEventListener("mousemove", mouseMove, false);
        }
        
    }