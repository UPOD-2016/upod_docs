
    
    var bMouseDragging = false;
    var nMouseOffsetX = 0;
    var nMouseOffsetY = 0;
    var background = document.getElementById("background");
           
			var lineObj=document.getElementById("PathObject");;
			var lineImage=document.getElementById("PathImage");
			var circle=document.getElementById("image");
			
    
	function mouseDown(evt) { 
        bMouseDragging = true;
        
        var ball = document.getElementById("ball");
        if(ball) {
           var p = document.documentElement.createSVGPoint();
            p.x = evt.clientX;
           // p.y = evt.clientY;
        
            var m = ball.getScreenCTM();
            p = p.matrixTransform(m.inverse());
            nMouseOffsetX = p.x - parseInt(ball.getAttribute("x"));
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
			var hi=800;
			//var d0=2500;
			var FPoint=pole-point.getAttribute("cx"); //1000
			
			//console.log(FPoint);
            if(ball) {
        
                var m = ball.getScreenCTM();
                p = p.matrixTransform(m.inverse());
                //ball.setAttribute("x", p.x - nMouseOffsetX);
				var n =  p.x - nMouseOffsetX;
				var d0=pole-n;
				var di=1/((1/FPoint)-(1/d0));
				var s=pole-di;
			    var NewRatio=di/d0;   //the new ratio of the height of them image to the height of the object
				//console.log(NewRatio);
				var y = circle.getAttribute("y");
				//console.log(y-1000);
				//var y2 = ball.getAttribute("y");
				//y2 = ball.getAttribute("y");
				//console.log(y2);
				
				//var OldRatio=y/800;  //the previous ratio of the height of them image to the height of the object
				//var SetRatio=NewRatio/OldRatio;  //the ratio of the new ratio to the old one, since scale set the scale to the previous image height and not the object height
						
				//console.log(y-1100);
				trans = "translate(" + n + ")";
				
				//console.log(trans); 
				ball.setAttribute("x", n);
				
                var x = circle.getAttribute("x");
				 
				
                var q = x / 1500;
				//console.log(q);
                circle.setAttribute("transform", "scale(" + q+ ")");
				//circle.setAttribute("transform", "scale(" + NewRatio+ ")");
				
				//y = circle.getAttribute("y");
				//console.log(y-1000);
				
				
				circle.setAttribute("x", s);
				var k=1000/q ;
				//var k=1000/NewRatio;
				circle.setAttribute("y", k);	
					
				//ball.setAttribute("cx",evt.clientX);
				
				lineObj.setAttribute("x1",n);
				lineImage.setAttribute("x1",s);
				//lineImage.setAttribute("y1",k);
				
				//circle.setAttribute("r",r+(p.x - nMouseOffsetX));
				
			}
		}
    }
    function mouseUp(evt) { 
        bMouseDragging = false;
		
		
    }
    
    
    
    
    function init() {
		
             ball = document.getElementById("ball");
			 lineObj=document.getElementById("PathObject");
			 lineImage=document.getElementById("PathImage");
			 circle=document.getElementById("image");
			 point=document.getElementById("point");

             if(ball) {
            ball.addEventListener("mousedown", mouseDown, false);
            ball.addEventListener("mouseup", mouseUp, false);
            ball.addEventListener("mousemove", mouseMove, false);
        }
        
    }