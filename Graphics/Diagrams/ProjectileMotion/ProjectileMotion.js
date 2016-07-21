var curve = document.getElementById("curve");
var vi = document.getElementById("vi").textContent;
var LaunchAngle = document.getElementById("LaunchAngle").textContent;
var DistanceOut = document.getElementById("DistanceOut");
var HeightOut = document.getElementById("HeightOut");
var TimeOut = document.getElementById("TimeOut");
var EndText = document.getElementById("EndText");
var start = document.getElementById("start");
var mid = document.getElementById("mid");
var end = document.getElementById("end");
var EndText = document.getElementById("EndText");
var ball = document.getElementById("ball");
var MaxHeight = 0;
var iteration = 0;
var animation;

function reset() {
    clearInterval(animation);
    curve.setAttribute("opacity", "0.2");
    start.setAttribute("opacity", "0");
    mid.setAttribute("opacity", "0");
    end.setAttribute("opacity", "0");
    ball.setAttribute("opacity","0");
    ball.setAttribute("cx","100");
    ball.setAttribute("cy","500");
    iteration=0;
};

function launch() {
    clearInterval(animation);
    iteration=0;
    curve.setAttribute("opacity", "1");
    start.setAttribute("opacity", "1");
    mid.setAttribute("opacity", "1");
    end.setAttribute("opacity", "1");

    ball.setAttribute("opacity","1");
    animation = setInterval(function(){animate()}, 5);

};

function calculate() {
    var theta = LaunchAngle * Math.PI / 180;
    MaxHeight = Math.sin(theta) * Math.sin(theta) * vi * vi / (2 * 9.8);
    var TimeOfFlight = 2 * Math.sin(theta) * vi / 9.8;
    var Distance = vi * vi * Math.sin(2 * theta) / 9.8;


    var X1 = ((Distance.toFixed(0) / 2) + 100);
    var X2 = ((Distance.toFixed(0) / 1) + 100);
    var Y = (500 - 2 * MaxHeight.toFixed(0));
    var path = "M 100 500 Q " + X1 + " " + Y + " " + X2 + " 500";

    TimeOut.textContent = TimeOfFlight.toFixed(2);

    DistanceOut.textContent = Distance.toFixed(2);
    HeightOut.textContent = MaxHeight.toFixed(2);
    EndText.textContent = Distance.toFixed(2);

    curve.setAttribute("d", path);
    mid.setAttribute("cx", X1);
    mid.setAttribute("cy", (500 - MaxHeight.toFixed(0)));
    end.setAttribute("cx", X2);
    EndText.setAttribute("x", X2);
};

function animate(){
   iteration+=1;
   if(iteration==1000){
       clearInterval(animation);
   }
   var length = curve.getTotalLength();
   var increment = length/1000;
   var pointlength = increment*iteration;
   var point = curve.getPointAtLength(pointlength);
   ball.setAttribute("cx",point.x);
   ball.setAttribute("cy",point.y);
};


function checkHeight() {
    if (MaxHeight > 300)
        return "false";
    else {
        return "true"
    }
};

function IncreaseAngle() {
    var angle = parseInt(LaunchAngle);
    reset();
    if (angle < 85) {
        angle += 5;
        document.getElementById("LaunchAngle").textContent = angle;
        LaunchAngle = angle;
        calculate();
        var bool = checkHeight();
        if (bool == "false") {
          angle -= 5;
          document.getElementById("LaunchAngle").textContent = angle;
          LaunchAngle = angle;
          calculate();
        }
    }
};

function DecreaseAngle() {
    var angle = parseInt(LaunchAngle);
    reset();
    if (angle > 15) {
        angle -= 5;
        document.getElementById("LaunchAngle").textContent = angle;
        LaunchAngle = angle;
        calculate();
    }
};

function IncreaseVelocity() {
    var velocity = parseInt(vi);
    reset();
    if (velocity < 100) {
        velocity += 5;
        document.getElementById("vi").textContent = velocity;
        vi = velocity;
        calculate();
        var bool = checkHeight();
        if (bool == "false") {
          velocity -= 5;
          document.getElementById("vi").textContent = velocity;
          vi = velocity;
          calculate();
        }
    }
};

function DecreaseVelocity() {
    var velocity = parseInt(vi);
    reset();
    if (velocity > 20) {
        velocity -= 5;
        document.getElementById("vi").textContent = velocity;
        vi = velocity;
        calculate();
    }
};
