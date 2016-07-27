/*
Name: ProjectileMotion.js
Created By: viss3240 - Jordan Visser
WLU ID: 120513240
Date: July 27, 2016

This diagram simulates basic projectile motion. 
*/
var curve = document.getElementById("curve");//The path the projectile will follow
var vi = document.getElementById("vi").textContent;//initial velocity of the projectile
var LaunchAngle = document.getElementById("LaunchAngle").textContent;//launch angle of the projectile
var DistanceOut = document.getElementById("DistanceOut");//how far horizontally the projectile goes
var HeightOut = document.getElementById("HeightOut");//how high the projectile goes
var TimeOut = document.getElementById("TimeOut");//the total time it takes to reach the destination
var start = document.getElementById("start");//starting dot
var mid = document.getElementById("mid");//dot at the max height
var end = document.getElementById("end");//dot at the ending position
var ball = document.getElementById("ball");//the projectile that will follow the curve
var MaxHeight = 0;//the maximum height that the projectile reaches
var iteration = 0;//rerun the animation function 1000 times, this counts the number of times
var animation;//used to start and end the interval

function reset() {//reset all values to the original state
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

function launch() {//launches the projectile
    clearInterval(animation);//clear any previous interval
    iteration=0;
    curve.setAttribute("opacity", "1");
    start.setAttribute("opacity", "1");
    mid.setAttribute("opacity", "1");
    end.setAttribute("opacity", "1");
    ball.setAttribute("opacity","1");
    animation = setInterval(function(){animate()}, 5);//start a fresh interval at 0

};

function calculate() {//does all the calculations for the projectile based on the inputs
    var theta = LaunchAngle * Math.PI / 180;//convert the angle to radians
    MaxHeight = Math.sin(theta) * Math.sin(theta) * vi * vi / (2 * 9.8);//calculate max height using the projectilemotion formula
    var TimeOfFlight = 2 * Math.sin(theta) * vi / 9.8;//calculate time of flight using the projectilemotion formula
    var Distance = vi * vi * Math.sin(2 * theta) / 9.8;//calculate horizontal distance using the projectilemotion formula

	//calculate the path definition for the projectile motion curve
    var X1 = ((Distance.toFixed(0) / 2) + 100);
    var X2 = ((Distance.toFixed(0) / 1) + 100);
    var Y = (500 - 2 * MaxHeight.toFixed(0));
    var path = "M 100 500 Q " + X1 + " " + Y + " " + X2 + " 500";

	//output all of the numbers
    TimeOut.textContent = TimeOfFlight.toFixed(2);
    DistanceOut.textContent = Distance.toFixed(2);
    HeightOut.textContent = MaxHeight.toFixed(2);
	
	//set the curve start max height and end points to the new vaules
    curve.setAttribute("d", path);
    mid.setAttribute("cx", X1);
    mid.setAttribute("cy", (500 - MaxHeight.toFixed(0)));
    end.setAttribute("cx", X2);
};

function animate(){//launches the projectile along the path
   iteration+=1;
   if(iteration==1000){
       clearInterval(animation);//only go 1000 times
   }
   
   var length = curve.getTotalLength();//determine the length of the path 
   var increment = length/1000;
   var pointlength = increment*iteration;//get the new position on the path
   var point = curve.getPointAtLength(pointlength);//get the new point
   //move the ball
   ball.setAttribute("cx",point.x);
   ball.setAttribute("cy",point.y);
};

function checkHeight() {//ensures that the path cannot leave the grid area
    if (MaxHeight > 300)
        return "false";
    else {
        return "true"
    }
};

function IncreaseAngle() {//increase the launch angle by 5
    var angle = parseInt(LaunchAngle);
    reset();
    if (angle < 85) {//make 85 the max launch angle
        angle += 5;
        document.getElementById("LaunchAngle").textContent = angle;
        LaunchAngle = angle;
        calculate();//calculate the new values for output
        var bool = checkHeight();//check and see if the new curve is out of the grid
        if (bool == "false") {//if yes reset the initial velocity
          angle -= 5;
          document.getElementById("LaunchAngle").textContent = angle;
          LaunchAngle = angle;
          calculate();
        }
    }
};

function DecreaseAngle() {//decrease the launch angle by 5
    var angle = parseInt(LaunchAngle);
    reset();
    if (angle > 15) {//make 15 the lowest launch angle
        angle -= 5;
        document.getElementById("LaunchAngle").textContent = angle;
        LaunchAngle = angle;
        calculate();//calculate the new values for output
    }
};

function IncreaseVelocity() {//Increase the initial velocity by 5
    var velocity = parseInt(vi);
    reset();
    if (velocity < 100) {//make 100 the max initial velocity
        velocity += 5;
        document.getElementById("vi").textContent = velocity;
        vi = velocity;
        calculate();//calculate the new values for output
        var bool = checkHeight();//check and see if the new curve is out of the grid
        if (bool == "false") {//if yes reset the initial velocity
          velocity -= 5;
          document.getElementById("vi").textContent = velocity;
          vi = velocity;
          calculate();
        }
    }
};

function DecreaseVelocity() {//Decrease the initial velocity by 5
    var velocity = parseInt(vi);
    reset();
    if (velocity > 20) {//make 20 the lowest initial velocity
        velocity -= 5;
        document.getElementById("vi").textContent = velocity;
        vi = velocity;
        calculate();//calculate the new values for output
    }
};

