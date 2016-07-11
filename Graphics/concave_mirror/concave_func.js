
    
    var bMouseDragging = false;
    var nMouseOffsetX = 0;
    var nMouseOffsetY = 0;
    var background = document.getElementById("background");
           
			var lineObj=document.getElementById("PathObject");
			var line_C=document.getElementById("Path_C");
			var lineImage=document.getElementById("PathImage");
			var image=document.getElementById("image");
			var imageline_Flash=document.getElementById("imageline_Flash");
			var objline_Flash=document.getElementById("objline_Flash");
			var ground2=document.getElementById("ground2");
    
	function mouseDown(evt) { 
        bMouseDragging = true;
        
        var object = document.getElementById("object");
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
			var pole=3430;
			var h0=800;
			var y_Obj=200;
			var Hground=1000;    //the height from top of the page to the ground
			var FPointX=pole-Fpoint.getAttribute("cx");  //x coordinate of focal point
			
			//console.log(FPoint);
            if(object) {
        
                var m = object.getScreenCTM();
                p = p.matrixTransform(m.inverse());
                //ball.setAttribute("x", p.x - nMouseOffsetX);
				var n =  p.x - nMouseOffsetX;
				var d0=pole-n;
				var di=1/((1/FPointX)-(1/d0));
				var s=pole-di;                             //the distance of the image from the vertical line passing point(0,0)
			    var NewRatio=di/d0;                        //the new ratio of the height of them image to the height of the object
				
				var hi=NewRatio*h0; //the height of the image
				
				var y = image.getAttribute("y");
				 
				if(n<3420){
					cont=true;
				}
				else{
					cont=false;
					init();
				}
				
				
				if (cont){
					
					
				lineImage.setAttribute("y1",Hground+(2500*hi/(di-925))); 
				lineImage.setAttribute("y2", y_Obj);
				lineImage.setAttribute("x1",15 );
				
				lineObj.setAttribute("x1",n);
				lineObj.setAttribute("x2", pole);
				lineObj.setAttribute("y2",Hground+hi);
				line_C.setAttribute("y2", 1000+(1830*(hi)/(1830-di)));
				
				line_C.setAttribute("x1", n);
				line_C.setAttribute("x2", pole);
				ground2.setAttribute("y1",((Hground)+h0*NewRatio));
				ground2.setAttribute("y2",((Hground)+h0*NewRatio));
				
				
				trans = "translate(" + n + ")";
				
				
				object.setAttribute("x", n);
				
                var x = image.getAttribute("x");
				 
				
                
                image.setAttribute("transform", "scale(" + NewRatio+ ")");          //scale the image by the ratio
				
				
				var y = image.getAttribute("y");
				var lineImage_x1=lineImage.getAttribute("x1") ;
				var y_img=Hground+NewRatio*h0                                       //y of image from the point (0,0)
				var Im_x=(s)/NewRatio;
				image.setAttribute("x", (Im_x));
				
				imageline_Flash.setAttribute("y",y_img)
			
				
				var k=Hground/NewRatio ;                       //to make the image moving on a ground line, since after using scale its position changes as well as its size
				
				image.setAttribute("y", k);	
					
				//ball.setAttribute("cx",evt.clientX);
				
				
				//objline_Flash.setAttribute("x",500);
				
				
				var x1 = lineImage.getAttribute("x1");
				
				
				var lineImage_y1=lineImage.getAttribute("y1") ;
				
				
				
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
			 line_C=document.getElementById("Path_C");
			 lineImage=document.getElementById("PathImage");
			 image=document.getElementById("image");
			 imageline_Flash=document.getElementById("imageline_Flash");
			 objline_Flash=document.getElementById("objline_Flash");
			 Fpoint=document.getElementById("Focalpoint");
			 ground2=document.getElementById("ground2");

             if(object) {
            object.addEventListener("mousedown", mouseDown, false);
            object.addEventListener("mouseup", mouseUp, false);
            object.addEventListener("mousemove", mouseMove, false);
        }
        
    }