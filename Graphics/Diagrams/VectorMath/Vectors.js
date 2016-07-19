var label1 = document.getElementById("label1");
var label2 = document.getElementById("label2");
var V1Stage1 = document.getElementById("V1Stage1");
var V2Stage1 = document.getElementById("V2Stage1");
var V1Stage2 = document.getElementById("V1Stage2");
var V2Stage2 = document.getElementById("V2Stage2");


function loaded(){
    V2Stage2.setAttribute("x", "100");
    sleep(500).then(()=>{
      V2Stage2.setAttribute("x","150");
    }

  );
};
function sleep (time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}
