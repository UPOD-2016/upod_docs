var t=document.getElementById("top");
var b=document.getElementById("bottom");
var a=document.getElementById("arrow");
var distance=document.getElementById("dis");
var potential=document.getElementById("pe");
var k=document.getElementById("sfc");
var position = 278;
var tracker = 0;
var springforceconstant=10;
var ball=document.getElementById("ball");
var mousestatus=false;

//References the functions to be used for different mouse events
document.getElementById("ball").onmousedown = function() {mouseDown()};
document.getElementById("ball").onmouseup = function() {mouseUp()};
document.getElementById("ball").onmousemove = function() {mouseMove()};

//Stretches the bow when the pull button is pushed	
function stretch(){
	if(position<465){
		position=position+1;
		tracker=tracker+1;
	}	
	b.setAttribute("x1", position);
	t.setAttribute("x2", position);
    a.transform.baseVal.getItem(0).setTranslate(tracker, 0);
    ball.setAttribute("cx", position);
    update();
	};
	
	
//Releases the bow when the release button is pushed
function letgo(){
	if(position>278){
		position=position-1;
		tracker=tracker-1;

	}
	b.setAttribute("x1", position);
	t.setAttribute("x2", position);
	a.transform.baseVal.getItem(0).setTranslate(tracker, 0);
	ball.setAttribute("cx", position);
    update();
	};
	
//Updates the distance value
function update(){

    distance.textContent = tracker;
    calculate();
};

//Calculate and update the potential energy value
function calculate(){
    var potential_energy= Math.round((1/2)*tracker*k.textContent*k.textContent);
    potential.textContent = potential_energy;

};
	
//Increases the spring force constant value when the up arrow is pushed
function increase(){
	if(springforceconstant<100){
		springforceconstant=springforceconstant+1;
	}
	k.textContent = springforceconstant;
	update();
};

//Decreases the spring force constant value when the down arrow is pushed
function decrease(){
	if(springforceconstant>=1){
		springforceconstant=springforceconstant-1;
	}
	k.textContent = springforceconstant;
	update();
};

//Changes a variable when the mouse is pushed down
function mouseDown(){
	if (mousestatus == false){
		mousestatus=true;
		}
	
};

//Changes back the variable when the mouse is released
function mouseUp(){
	if (mousestatus == true){
		mousestatus=false;
		}

};

//Moves the bow when the mouse is pushed down and moved
function mouseMove(){
	var x = event.clientX;
	var tester = x-278;
	if(mousestatus == true){
		if (x>=278 && x<=465){
			position = x;
			tracker=tester;
			ball.setAttribute("cx", x);
			b.setAttribute("x1", x);
			t.setAttribute("x2", x);
			a.transform.baseVal.getItem(0).setTranslate(tester, 0);
			update();
		}
		}

};