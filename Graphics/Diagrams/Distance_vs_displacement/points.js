var $element = $("#line1");
var $element2 = $("#line2");
var $element3 = $("#line3");
var $point1 = $("#p1");
var $point2 = $("#p2");
var $point3 = $("#p3");

var tracker=0;

var two=document.getElementById("two");
var four=document.getElementById("four");
var line1=document.getElementById("line1");
var line2=document.getElementById("line2");
var line3=document.getElementById("line3");
var point1=document.getElementById("p1");
var point2=document.getElementById("p2");
var point3=document.getElementById("p3");
var two2=document.getElementById("two2");
var plus=document.getElementById("plus");
var four2=document.getElementById("four2");
var equals=document.getElementById("equal");
var text1=document.getElementById("disttext");
var text2=document.getElementById("disttext2");
var title=document.getElementById("disttitle");
var title2=document.getElementById("disptitle");
var eq=document.getElementById("equation");
var text3=document.getElementById("disptext");
var text4=document.getElementById("disptext2");

//Animates the distance from A to B along the sides of the rectangle
function draw_dist() {
	if (tracker==0){
	
		title.setAttribute("opacity","1");
		
		$point3.velocity({
			  r:7
			}, {
			  duration: 300
			});

		setTimeout(function() {
			two.setAttribute("fill", "red");
			two2.setAttribute("opacity","1");
			}, 600);

		setTimeout(function() {
			$element.velocity({
				y2: 80
	
			}, {
				duration: 1000
			});
		}, 200);
		
		setTimeout(function() {
			$element.velocity({
				y2: 80
	
			}, {
				duration: 1000
			});
		}, 200);


		setTimeout(function() {
			plus.setAttribute("opacity","1");
			}, 1000);
			
		setTimeout(function() {
			$point1.velocity({
			  r:7
			}, {
			  duration: 300
			});
		}, 1000);

		setTimeout(function() {
			four.setAttribute("fill", "red");
			four2.setAttribute("opacity","1");
			}, 2300);
	
		setTimeout(function() {
			$element2.velocity({
			  x2:450
			}, {
			  duration: 1700
			});
		}, 1500);

		setTimeout(function() {
			$point2.velocity({
			  r:7
			}, {
			  duration: 300
			});
		}, 3000);
		
		setTimeout(function() {
			equals.setAttribute("opacity","1");
			text1.setAttribute("opacity","1");
			text2.setAttribute("opacity","1");
			}, 3000);
			
		setTimeout(function() {
			tracker=1;
		}, 3300);
	}
}

//Animates the displacement from A to B by drawing a line string from A to B
function draw_disp() {

	if (tracker==0){	
	
		title2.setAttribute("opacity","1");

		$point3.velocity({
			  r:7
			}, {
			  duration: 300
			});


		setTimeout(function() {
			$element3.velocity({
			  x2:450,
			  y2:80
			}, {
			  duration: 2200
			});
		}, 300);
		
		setTimeout(function() {
			eq.setAttribute("opacity","1");
			}, 1400);
			
		setTimeout(function() {
			$point2.velocity({
			  r:7
			}, {
			  duration: 300
			});
		}, 2300);
		
		setTimeout(function() {
			tracker=1;
		}, 2600);

		setTimeout(function() {
			text3.setAttribute("opacity","1");
			text4.setAttribute("opacity","1");
		}, 2600);
	}
}

//Clears all of the text and svg elements that result from the animation in order to run the animation again
function clear() {
	if(tracker==1){
		p1.setAttribute("r","3");
		p2.setAttribute("r","3");
		p3.setAttribute("r","3");
		line1.setAttribute("y2","230");
		line2.setAttribute("x2","150");
		line3.setAttribute("x2","150");
		line3.setAttribute("y2","230");
		two.setAttribute("fill", "black");
		four.setAttribute("fill", "black");
		title.setAttribute("opacity","0");
		two2.setAttribute("opacity","0");
		plus.setAttribute("opacity","0");
		four2.setAttribute("opacity","0");
		equals.setAttribute("opacity","0");
		text1.setAttribute("opacity","0");
		text2.setAttribute("opacity","0");
		text3.setAttribute("opacity","0");
		text4.setAttribute("opacity","0");
		title2.setAttribute("opacity","0");
		eq.setAttribute("opacity","0");

		tracker=0;
	}
}

//When the distance button is pushed this function calls the distance animation function
function distance(){
	draw_dist();
};

//When the displacement button is pushed this function calls the displacement animation function
function displacement(){
	draw_disp();
};

//When the clear button is pushed this function calls the clear function
function reset(){
	clear();
};
