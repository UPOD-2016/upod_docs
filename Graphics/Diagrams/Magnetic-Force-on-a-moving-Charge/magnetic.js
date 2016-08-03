start();



function start() {
 var kvalue=30;
var speed =3000; 
$("#up").mousedown(function(e){
   kvalue=kvalue+1;
  speed=speed-100;
  $("#kv").text(kvalue);
});
$("#down").mousedown(function(e){
   kvalue=kvalue-1;
    speed=speed+100;
   if (kvalue<20){kvalue=20,speed=2000};
  $("#kv").text(kvalue);
});
  
$("#arrow1")
    .velocity({ y: "+=230"},{duration: 1500})
    .velocity('reverse', {duration: 1});
$("#Field1")
    .velocity({ height: "+=230"},{duration: 1500})
    .velocity('reverse', {duration: 1});
  $("#arrow2")
    .velocity({ y: "+=230"},{duration: 1500})
    .velocity('reverse', {duration: 1});
$("#Field2")
    .velocity({ height: "+=230"},{duration: 1500})
    .velocity('reverse', {duration: 1});
$("#arrow3")
    .velocity({ y: "+=230"},{duration: 1500})
    .velocity('reverse', {duration: 1});
$("#Field3")
    .velocity({ height: "+=230"},{duration: 1500})
    .velocity('reverse', {duration: 1});
 $("#arrow4")
    .velocity({ y: "+=230"},{duration: 1500})
    .velocity('reverse', {duration: 1});
$("#Field4")
    .velocity({ height: "+=230"},{duration: 1500})
    .velocity('reverse', {duration: 1});   
  $("#arrow5")
    .velocity({ y: "+=230"},{duration: 1500})
    .velocity('reverse', {duration: 1});
$("#Field5")
    .velocity({ height: "+=230"},{duration: 1500})
    .velocity('reverse', {duration: 1});
    $("#arrow6")
    .velocity({ y: "+=230"},{duration: 1500})
    .velocity('reverse', {duration: 1});
$("#Field6")
    .velocity({ height: "+=230"},{duration: 1500})
    .velocity('reverse', {duration: 1});
$("#sphere")
    .velocity({ cx: "+=320"},{duration:speed})
    .velocity('reverse', {duration: 1});
  $("#ie")
    .velocity({ x: "+=320"},{duration: speed})
    .velocity('reverse', {duration: 1});
  $("#i-")
    .velocity({ x: "+=320"},{duration: speed})
    .velocity('reverse', {duration: 1});
 repart()
}

 function repart() {
   start();
 }

  
  
    
 
