  
    var bMouseDragging = false;
    var nMouseOffsetX = 0;
    var nMouseOffsetY = 0;
			var di_pos = document.getElementById("di_pos");
            var d0_pos = document.getElementById("d0_pos");
			var PathObj1=document.getElementById("PathObject1");
			var PathObj2=document.getElementById("PathObject2");
			var imageroof=document.getElementById("imageroof");
			var contimageroof=document.getElementById("contimageroof");
			var imageroof_Flash=document.getElementById("imageroofFlash");
			var di_line=document.getElementById("di_line");
			var di_right_flash=document.getElementById("di_right_flash");
			var d0_line=document.getElementById("d0_line");
			var d0_left_flash=document.getElementById("d0_left_flash");
			var image=document.getElementById("image");
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
		var cont;
        
        if(bMouseDragging) {
			
			var r=0;
			var pole=1500;
			var h0=800;
			var y_Obj=200;
			var Hground=1000;    //the height from top of the page to the ground
			var FPointX=pole-Fpoint.getAttribute("cx");  //x coordinate of focal point
			     
			    if(object) {
        
                var m = object.getScreenCTM();
                p = p.matrixTransform(m.inverse());
                //ball.setAttribute("x", p.x - nMouseOffsetX);
				var n =  p.x - nMouseOffsetX;
				var d0=pole-n;
				var di=1/((1/FPointX)-(1/d0));
				var s=pole+Math.abs(di);                             //the distance of the image from the vertical line passing point(0,0)
			    var NewRatio=Math.abs(di/d0);                        //the new ratio of the height of them image to the height of the object
			   
		         console.log("di "+di);
				
				console.log("d0: "+d0);
			
				 
				if(n<=1500){
					cont=true;
				}
				else{
					cont=false;
					init();
				}
				
				
				if (cont){
					
					
					
					
                di_pos.firstChild.nodeValue = di;         //write di on the background
                d0_pos.firstChild.nodeValue = d0;		  //write d0 on the background
      
				
				var hi=NewRatio*h0;                       //the height of the image
				
				
				trans = "translate(" + n + ")";
				
				
				object.setAttribute("x", n);
				
               
				 
				
                
                image.setAttribute("transform", "scale(" + NewRatio+ ")");          //scale the image by the ratio
				
				var k=(y_Obj+h0-(NewRatio*h0))/NewRatio                      //to make the image moving on a ground line, since after using scale its position changes as well as its size
				image.setAttribute("y", k);	
				var Im_x=(s/NewRatio);
				
				
				image.setAttribute("x", Im_x);
				imageroof.setAttribute("y1",y_Obj+h0-(NewRatio*h0));
				imageroof.setAttribute("y2",y_Obj+h0-(NewRatio*h0));
				imageroof_Flash.setAttribute("y",h0-(NewRatio*h0)-400);
				contimageroof.setAttribute("y1",y_Obj+h0-(NewRatio*h0));
				contimageroof.setAttribute("y2",y_Obj+h0-(NewRatio*h0));
				di_line.setAttribute("x1",s );
				di_right_flash.setAttribute("x",s);
				d0_line.setAttribute("x1",n );
				d0_left_flash.setAttribute("x",n);
				
			
					
				//ball.setAttribute("cx",evt.clientX);
				
				PathObj1.setAttribute("x1",n);
				
				
				
				}
				
				
				
				
			}
		}
    }
    function mouseUp(evt) { 
        bMouseDragging = false;
		
		
    }
    
    
    
    
    function init() {
		
             object = document.getElementById("object");
			 PathObj1=document.getElementById("PathObject1");
			 PathObj2=document.getElementById("PathObject2");
			 di_line=document.getElementById("di_line");
			 di_right_flash=document.getElementById("di_right_flash");
			 d0_line=document.getElementById("d0_line");
			 d0_left_flash=document.getElementById("d0_left_flash");
			 image=document.getElementById("image");
			 imageroof=document.getElementById("imageroof");
			 contimageroof=document.getElementById("contimageroof");
			 imageroof_Flash=document.getElementById("imageroofFlash");
			 Fpoint=document.getElementById("Focalpoint");
			 di_pos = document.getElementById("di_pos");
			 d0_pos = document.getElementById("d0_pos");
             if(object) {
            object.addEventListener("mousedown", mouseDown, false);
            object.addEventListener("mouseup", mouseUp, false);
            object.addEventListener("mousemove", mouseMove, false);
        }
        
    }