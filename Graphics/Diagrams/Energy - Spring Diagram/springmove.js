var spring=document.getElementById("spring");
var ball=document.getElementById("ball");
var kvalue=0;
var xvalue=0;
var pevalue=0;
var drag = {
    elem: null,
    x: 0,
    pe:0,
    state: false
};
var delta = {
    x: 0,
    sx: 0
};
//add k
$("#up").mousedown(function(e){
   kvalue=kvalue+1;
    $("#kv").text(kvalue);
});
//minus k
$("#down").mousedown(function(e){
   kvalue=kvalue-1;
   if (kvalue<0){kvalue=0};
    $("#kv").text(kvalue);
});


// change ball and spring set
$("#ball").mousedown(function(e){
 if (!drag.state) {
        drag.state = true;
    }
    return false;
});
   
$(document).mousemove(function(e) {
    if (drag.state) {
        // get mouse position on page
        delta.x= e.clientX;
        
        xvalue=(delta.x-160)/100;
        //calculate the PE
        pevalue=(0.5*kvalue*xvalue*xvalue).toFixed(2);
        
        $("#xv").text(xvalue);
         $("#pev").text(pevalue);
         $("#unsed").text(" ");
         $("#spi").text(" ");
        // change mouse position on page
        ball.setAttribute("cx", delta.x);
        delta.sx=ball.getAttribute("cx")/147;
        //scale the spring
        spring.setAttribute("transform", "scale("+delta.sx +",1)");
        }
});
$(document).mouseup(function() {
    if (drag.state) {
        drag.state = false;
        delta.x= 0;
        xvalue=0;
        pevalue=0;
        kvalue=0;
        $("#kv").text(kvalue);
        $("#xv").text(xvalue);
         $("#pev").text(pevalue);
         $("#unsed").text("unstrectched");
         $("#spi").text("spring");
         ball.setAttribute("cx", 160);
        spring.setAttribute("transform", "scale(1)");
    }
});
