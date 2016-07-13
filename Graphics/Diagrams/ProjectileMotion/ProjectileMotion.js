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
var MaxHeight = 0;

function reset() {
    curve.setAttribute("opacity", "0.2");
    start.setAttribute("opacity", "0");
    mid.setAttribute("opacity", "0");
    end.setAttribute("opacity", "0");
};

function launch() {
    curve.setAttribute("opacity", "1");
    start.setAttribute("opacity", "1");
    mid.setAttribute("opacity", "1");
    end.setAttribute("opacity", "1");
    //animate();
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
    //curve.style.stroke-dasharray = curve.getTotalLength();

    TimeOut.textContent = TimeOfFlight.toFixed(2);
    //TimeOut.textContent = curve.getTotalLength();

    DistanceOut.textContent = Distance.toFixed(2);
    HeightOut.textContent = MaxHeight.toFixed(2);
    EndText.textContent = Distance.toFixed(2);

    curve.setAttribute("d", path);
    mid.setAttribute("cx", X1);
    mid.setAttribute("cy", (500 - MaxHeight.toFixed(0)));
    end.setAttribute("cx", X2);
    EndText.setAttribute("x", X2);
};

//function animate(){
//    example.setAttribute("Stroke","Black");
//    $ball.velocity({cy: "200",}, {duration: 300,easing: "linear"});
//};
//
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
