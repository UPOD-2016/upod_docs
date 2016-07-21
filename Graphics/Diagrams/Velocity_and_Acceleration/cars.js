var $element = $("#car");


function animate() {


$element.velocity({
    scaleX: "0.01000",
	scaleY: "-0.01000",
	translateX: "7000px",
	translateY: "-8000px"
    
}, {
    duration: 0,
    easing: "linear"
    
});

$element.velocity({
    translateX: "90000px"
    
}, {
    duration: 1000,
    easing: "easeInSine",
});


}


animate();
