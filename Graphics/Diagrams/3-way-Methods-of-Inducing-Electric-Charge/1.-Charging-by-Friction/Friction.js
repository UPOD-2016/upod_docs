function start() {
  //begin
$("#Rubber")
    .delay(2000)
    .velocity({ x: "+=200"})
    .velocity({ x: "-=50" })
    .velocity({ x: "+=50" })
    .velocity({ x: "-=50" })
    .velocity({ x: "+=50" })
    .velocity({ x: "-=200" },function() {
  $("#minuse").velocity({ opacity:1})
  $("#pluse").velocity({ opacity:1})
  $("#plusl").velocity({ opacity:1})
  resert();
})
}
start();
//resert all and begin
 function resert() {
 
  $("#minuse")
    .delay(1000)
    .velocity({ opacity:0})
  $("#pluse")
  .delay(1000)
  .velocity({ opacity:0})
  $("#plusl")
    .delay(1000)
    .velocity({ opacity:0})
  start();
}
