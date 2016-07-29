// Variable definitions

var radiusCircle = document.getElementById('radiusCircle').textContent; //text radius of circle (what user sees)
var massProjectile = document.getElementById('massProjectile').textContent; //text mass of projectile (what user sees)
var velocityProjectile = document.getElementById('velocityProjectile').textContent; //text velocity of projectile (what user sees)
var forceProjectile = document.getElementById('centripitalForce').textContent; //text force of projectile (what user sees)
var projectile = document.getElementById('projectile'); //Projectile object
var pathCircle = document.getElementById('pathCircle'); //Path of Projectile
var iteration = 0; //number of interations done in animation
var projectileVelocity = 10; //velocity of the projectile
var animation; //used to start and end interval (animating of projectile)

function increaseRadius() { //increases the radius of the circle
    var tempRadius = parseInt(radiusCircle); //find current radius
    if (tempRadius < 10) {
        tempRadius += 1; //increase radius by one
        document.getElementById('radiusCircle').textContent = tempRadius; //update the text to display new radius
        radiusCircle = tempRadius; //set the new radius internally
        projectileVelocity += 1; //adjust the speed of the projectile
        calculateForce(); //recalculate the force
    }
}

function decreaseRadius() { //decreases the radius of the circle
    var tempRadius = parseInt(radiusCircle); //get current raidus
    if (tempRadius > 3) {
        tempRadius -= 1; //decrease by one
        document.getElementById('radiusCircle').textContent = tempRadius; //update the text to display new radius
        radiusCircle = tempRadius; //set the new radius internally
        projectileVelocity -= 1; //adjust the speed of the projectile
        calculateForce(); //recalculate the force
    }
}

function increaseVelocity() { //increases velocity of projectile
    var tempVelocity = parseInt(velocityProjectile); //get current velocity
    if (tempVelocity < 10) {
        tempVelocity += 1; //increase velocity by one
        document.getElementById('velocityProjectile').textContent = tempVelocity; //update the text to display new velocity
        velocityProjectile = tempVelocity; //set new velocity internally
        projectileVelocity -= 1; //adjust the speed of projectile
        calculateForce(); //recalculate the force
    }
}

function decreaseVelocity() { //decreases velocity of projectile
    var tempVelocity = parseInt(velocityProjectile); //get current velocity
    if (tempVelocity > 3) {
        tempVelocity -= 1; //decrease velocity by one
        document.getElementById('velocityProjectile').textContent = tempVelocity; //update the text to display new velocity
        velocityProjectile = tempVelocity; //set new velocity internally
        projectileVelocity += 1; //adjust the speed of projectile
        calculateForce(); //recalculate the force
    }

}

function increaseMass() { //increase mass of projectile
    var tempMass = parseInt(massProjectile); //get current mass
    if (tempMass < 10) {
        tempMass += 1; //increase mass by one
        document.getElementById('massProjectile').textContent = tempMass; // update the text to display new mass
        massProjectile = tempMass; // set new mass internally
        projectileVelocity += 1; // adjust the speed of projectile
        calculateForce(); //recalculate the force
    }
}

function decreaseMass() { //decreases mass of projectile
    var tempMass = parseInt(massProjectile);
    if (tempMass > 3) {
        tempMass -= 1; //decrease mass by one
        document.getElementById('massProjectile').textContent = tempMass; // update the text to display new mass
        massProjectile = tempMass; // set new mass internally
        projectileVelocity -= 1; // adjust the speed of projectile
        calculateForce(); //recalculate the force
    }
}

function calculateForce() { // calculates force of projectile
    var radius = parseInt(radiusCircle); //get current radius of circle
    var mass = parseInt(massProjectile); //get current mass of circle
    var velocity = parseInt(velocityProjectile); //get current velocity of projectile
    var force = Math.round(mass * velocity * velocity / radius * 100) / 100; //calculate force using formula, round to two decimal places
    document.getElementById('centripitalForce').textContent = force; //update the text to display new force
    modifyPath(pathCircle.getAttribute('d')); //modify path of the projectile for any changes to radius mass or velocity
    clearInterval(animation); //restart stop animation
    animation = setInterval(function() {
        animateProjectile();
    }, projectileVelocity); // restart animation
}

function modifyPath(path) { //modifies path of the circle
    var pathArray = path.split(' '); //split the current path at the spaces
    var radius = parseInt(radiusCircle); //get current radius of the circle
    var newPath = ''; //define new path of the circle
    pathArray[2] = radius * 20 + 300; //set new Y coordinate of where to start the circle path (base coordinate 300, and then adjustment for radius)
    pathArray[4] = radius * 20; //recalculate the radius in pixels
    pathArray[5] = pathArray[4]; //since its a circle need radius twice
    for (i = 0; i < pathArray.length; i++) { //rebuild path string
        newPath += pathArray[i];
        newPath += ' ';
    }
    pathCircle.setAttribute('d', newPath); //set new path circle to the circle
}

function animateProjectile() { //animates projectile
    if (iteration == 1000) { //number of iterations (how many points to plot)
        iteration = 0; //once it reaches 1000 need to restart circle
    }

    iteration += 1; // increase iteration to move to next point
    var length = pathCircle.getTotalLength(); //determine the length of the path
    var increment = length / 1000; //how much to increment by to get to next point
    var pointlength = increment * iteration; //get the new position on the path
    var point = pathCircle.getPointAtLength(pointlength); //get the new point
    projectile.setAttribute('cx', point.x); //set new x coordinate of projectile
    projectile.setAttribute('cy', point.y); //set new y coordinate of projectile
}
