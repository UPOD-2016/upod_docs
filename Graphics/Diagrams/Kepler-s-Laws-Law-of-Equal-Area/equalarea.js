var projectile = document.getElementById('projectile'); 
var pathCircle = document.getElementById('pathCircle');
var iteration = 0
var projectileVelocity = 10; 

var one = 1;
var onehalf = 1.5;
var two = 2;
var twohalf = 2.5;
var three = 3;


var animation; 

function calculateForce() {   
    clearInterval(animation); 
    animation = setInterval(function() {
        animateProjectile();
    }); 
}



function animateProjectile() { //animates projectile
    if (iteration >2000) { //number of iterations (how many points to plot)
        iteration = 0; //once it reaches 1000 need to restart circle
    }
     
   if (iteration <500) { 
        iteration += 2; }
   if (iteration <1000) { 
       iteration += 1.5; }
  if (iteration <1500) { 
        iteration += 0.5; }
  if ( 1000 <iteration <1998) { 
        iteration += 3; 
    }
     iteration += 0.5; 
    var length = pathCircle.getTotalLength(); 
    var increment = length / 2000; 
    var pointlength = increment * iteration; 
    var point = pathCircle.getPointAtLength(pointlength); 
    projectile.setAttribute('cx', point.x); 
    projectile.setAttribute('cy', point.y); 
}

  
