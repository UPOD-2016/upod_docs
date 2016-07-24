var $element = $("#car");
var $element2 = $("#car2");
var $element3 = $("#car3");
var $light1 = $("#l1");
var $light2 = $("#l2");
var $light3 = $("#l3");
var light1=document.getElementById("l1");
var light2=document.getElementById("l2");
var light3=document.getElementById("l3");


var tracker=0;

//animates the lights
function lights() {

$light1.velocity({
    opacity: 1
    
}, {
    duration: 1000
});

setTimeout(function() {
    $light2.velocity({
      opacity: 1
    }, {
      queue: false,
      duration: 1000
    });
}, 1000);


setTimeout(function() {
    $light3.velocity({
      opacity: 1
    }, {
      queue: false,
      duration: 1000
    });
}, 2000);

}


//animates the three cars with different rates of acceleration
function animate() {

setTimeout(function() {
	$element.velocity({
		translateX: "90000px"
	
	}, {
		duration: 1000,
		easing: "easeInSine",
	});
}, 2500);	

setTimeout(function() {
	$element2.velocity({
		translateX: "90000px"
	
	}, {
		duration: 1000,
		easing: "linear",
	});
}, 2500);	

setTimeout(function() {
	$element3.velocity({
		translateX: "90000px"
	
	}, {
		duration: 1000,
		easing: "easeOutSine",
	});
}, 2500);	

}

//sets the cars in their starting positions
function redo() {


$element.velocity({
    scaleX: "0.01000",
	scaleY: "-0.01000",
	translateX: "7000px",
	translateY: "-8000px"
    
}, {
    duration: 0,
    easing: "linear"
    
});

$element2.velocity({
    scaleX: "0.01000",
	scaleY: "-0.01000",
	translateX: "7000px",
	translateY: "-15000px"
    
}, {
    duration: 0,
    easing: "linear"
    
});

$element3.velocity({
    scaleX: "0.01000",
	scaleY: "-0.01000",
	translateX: "7000px",
	translateY: "-22000px"
    
}, {
    duration: 0,
    easing: "linear"
    
});

}


//calls the functions to animate the cars when the start race button is pushed
function start(){
	if(tracker==0){
		lights();
		redo();
		animate();
	}
	tracker=1;
};

//calls the function to reset the cars when the reset button is pushed
function reset(){
	tracker=0;
	redo();
	light1.style.opacity = "0.0";
	light2.style.opacity = "0.0";
	light3.style.opacity = "0.0";
};