var radiusCircle = document.getElementById('radiusCircle').textContent;
var mainCircle = document.getElementById('mainCircle');
var projectile = document.getElementById('projectile');
var massProjectile = document.getElementById('massProjectile').textContent;
var velocityProjectile = document.getElementById('velocityProjectile').textContent;
var forceProjectile = document.getElementById('centripitalForce').textContent;
var pathCircle = document.getElementById('pathCircle');
var debugText = document.getElementById('debug').textContent;

function increaseRadius() {
  var tempRadius = parseInt(radiusCircle);
  tempRadius += 1;
  document.getElementById('radiusCircle').textContent = tempRadius;
  radiusCircle = tempRadius;
  transformShape(tempRadius);
  calculateForce();
}

function decreaseRadius() {
  var tempRadius = parseInt(radiusCircle);
  tempRadius -= 1;
  document.getElementById('radiusCircle').textContent = tempRadius;
  radiusCircle = tempRadius;
  transformShape(tempRadius);
  calculateForce();
}

function increaseVelocity() {
  var tempVelocity = parseInt(velocityProjectile);
  tempVelocity += 1;
  document.getElementById('velocityProjectile').textContent = tempVelocity;
  velocityProjectile = tempVelocity;
  calculateForce();
}

function decreaseVelocity() {
  var tempVelocity = parseInt(velocityProjectile);
  tempVelocity -= 1;
  document.getElementById('velocityProjectile').textContent = tempVelocity;
  velocityProjectile = tempVelocity;
  calculateForce();
}

function increaseMass() {
  var tempMass = parseInt(massProjectile);
  tempMass += 1;
  document.getElementById('massProjectile').textContent = tempMass;
  massProjectile = tempMass;
  calculateForce();
}

function decreaseMass() {
  var tempMass = parseInt(massProjectile);
  tempMass -= 1;
  document.getElementById('massProjectile').textContent = tempMass;
  massProjectile = tempMass;
  calculateForce();
}

function transformShape(radius) {
  var realRadius = realRadiusCalculate(radius);
  mainCircle.setAttribute('r', realRadius);

  // projectile.setAttribute('cy', mainCircle.getAttribute('cy') - realRadius);
  // projectile.setAttribute('cx', mainCircle.getAttribute('cx'));
}

function realRadiusCalculate(radius) {
  var realRadius = radius * 20;
  return realRadius;
}

function calculateForce() {
  var radius = parseInt(radiusCircle);
  var mass = parseInt(massProjectile);
  var velocity = parseInt(velocityProjectile);
  var force = Math.round(mass * velocity * velocity / radius * 100) / 100;
  document.getElementById('centripitalForce').textContent = force;
  // parseString(pathCircle.getAttribute('d'));
}

function parseString(string) {
  var stringArray = string.split(' ');
  var radius = parseInt(radiusCircle);
  var newString = '';

  stringArray[1] = 15 * radius - 5;
  stringArray[2] = 5 * radius + 5;
  stringArray[4] = realRadiusCalculate(radius);
  stringArray[5] = stringArray[4];
  for (i = 0; i < stringArray.length; i++) {
    newString += stringArray[i];
    newString += ' ';
  }

  pathCircle.setAttribute('d', newString);
  document.getElementById('debug').textContent = pathCircle.getAttribute('d');
}
