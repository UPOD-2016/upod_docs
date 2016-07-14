	var t=document.getElementById("top");
	var b=document.getElementById("bottom");
	var a=document.getElementById("arrow");
	var distance=document.getElementById("dis");
	var potential=document.getElementById("pe");
	var k=document.getElementById("sfc");
    var position = 278;
    var tracker = 0;
    var springforceconstant=10;
	
	
function stretch(){
	if(position<465){
		position=position+10;
		tracker=tracker+10;
	}	
	b.setAttribute("x1", position);
	t.setAttribute("x2", position);
    a.transform.baseVal.getItem(0).setTranslate(tracker, 0);
    update();
	};
	
	
function letgo(){
	if(position>278){
		position=position-10;
		tracker=tracker-10;

	}
	b.setAttribute("x1", position);
	t.setAttribute("x2", position);
	a.transform.baseVal.getItem(0).setTranslate(tracker, 0);
    update();
	};
	
function update(){

    distance.textContent = tracker;
    calculate();
};

function calculate(){
    var potential_energy= (1/2)*tracker*k.textContent*k.textContent;
    potential.textContent = potential_energy;

};
	
function increase(){
	if(springforceconstant<100){
		springforceconstant=springforceconstant+1;
	}
	k.textContent = springforceconstant;
	update();
};

function decrease(){
	if(springforceconstant>=1){
		springforceconstant=springforceconstant-1;
	}
	k.textContent = springforceconstant;
	update();
};