
    
    var bMouseDragging = false;
    var nMouseOffsetX = 0;
    var nMouseOffsetY = 0;
    var background = document.getElementById("background");
           
			var lineObj=document.getElementById("PathObject");;
			var lineImage=document.getElementById("PathImage");
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
		
        
        if(bMouseDragging) {
			
			var r=0;
			var pole=3000;
			var h0=800;
			//var d0=2500;
			var FPointX=pole-Fpoint.getAttribute("cx"); //1000
			
			//console.log(FPoint);
            if(object) {
        
                var m = object.getScreenCTM();
                p = p.matrixTransform(m.inverse());
                //ball.setAttribute("x", p.x - nMouseOffsetX);
				var n =  p.x - nMouseOffsetX;
				var d0=pole-n;
				var di=1/((1/FPointX)-(1/d0));
				var s=pole-di;
			    var NewRatio=di/d0;   //the new ratio of the height of them image to the height of the object
				
				var hi=NewRatio*h0; //the height of the image
				lineObj.setAttribute("y2",1000+hi);
				lineImage.setAttribute("y2", 200);
				var y = image.getAttribute("y");
				lineImage.setAttribute("y1",((y * NewRatio)+h0*NewRatio));
				ground2.setAttribute("y1",((y * NewRatio)+h0*NewRatio));
				ground2.setAttribute("y2",((y * NewRatio)+h0*NewRatio));
				
				//var y2 = ball.getAttribute("y");
				//y2 = ball.getAttribute("y");
				//console.log(y2);
				
				//var OldRatio=y/800;  //the previous ratio of the height of them image to the height of the object
				//var SetRatio=NewRatio/OldRatio;  //the ratio of the new ratio to the old one, since scale set the scale to the previous image height and not the object height
						
				//console.log(y-1100);
				trans = "translate(" + n + ")";
				
				//console.log(trans); 
				object.setAttribute("x", n);
				
                var x = image.getAttribute("x");
				 
				
                //var q = x / 1500;
				//console.log(q);
                image.setAttribute("transform", "scale(" + NewRatio+ ")");
				//circle.setAttribute("transform", "scale(" + 0.625+ ")");
				
				var y = image.getAttribute("y");
				var lineImage_x1=lineImage.getAttribute("x1") ;
				
				console.log("lineImage_x1: "+lineImage_x1);
				console.log("s: "+s);
				console.log("Ratio: " + NewRatio);
				image.setAttribute("x", ((s/NewRatio)+100));
				console.log("image x: " + image.getAttribute("x"))
				
				var k=1000/NewRatio ;
				//var k=1000/0.625;
				image.setAttribute("y", k);	
					
				//ball.setAttribute("cx",evt.clientX);
				
				lineObj.setAttribute("x1",n);
				//lineObj.setAttribute("y2",((y * q)+800*q));
				
				lineImage.setAttribute("x1",s+100);
				var x1 = lineImage.getAttribute("x1");
				
				//lineImage.setAttribute("y1",((y * NewRatio)+800*NewRatio));
				var lineImage_y1=lineImage.getAttribute("y1") ;
				
				//lineImage.setAttribute("y1",lineImage_y1*0.625) ;
				
				
				//circle.setAttribute("r",r+(p.x - nMouseOffsetX));
				
			}
		}
    }
    function mouseUp(evt) { 
        bMouseDragging = false;
		
		
    }
    
    
    
    
    function init() {
		
             object = document.getElementById("object");
			 lineObj=document.getElementById("PathObject");
			 lineImage=document.getElementById("PathImage");
			 image=document.getElementById("image");
			 Fpoint=document.getElementById("Focalpoint");
			 ground2=document.getElementById("ground2");

             if(object) {
            object.addEventListener("mousedown", mouseDown, false);
            object.addEventListener("mouseup", mouseUp, false);
            object.addEventListener("mousemove", mouseMove, false);
        }
        
    }