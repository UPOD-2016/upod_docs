
var $element = $("#example");


function animate() {

$element.velocity({
    cy: "440",
}, {
    duration: 3000,
    easing: "linear"
});


$element.velocity({
    ry: "10",
        cy: "450",
}, {
    duration: 300,
    easing: "linear"
});


$element.velocity({
    ry: "20",
        cy: "440",
}, {
    duration: 300,
    easing: "linear"
});



$element.velocity({
    cy: "50",
}, {
    duration: 3000,
    easing: "linear"
});

}


animate();
var interval = self.setInterval(function(){animate()},6600);
