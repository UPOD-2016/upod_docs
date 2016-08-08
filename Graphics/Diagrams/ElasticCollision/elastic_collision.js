
var v_a = document.getElementById("vel_1i").textContent; 
var vi_a = document.getElementById("vel_1i"); 
var vi_b = document.getElementById("vel_2i");
var v_b = document.getElementById("vel_2i").textContent;
var m_1 = document.getElementById("mass1").textContent;
var m_2 = document.getElementById("mass2").textContent;
var vf_a = document.getElementById("vel_1f"); 
var vf_b = document.getElementById("vel_2f");
var ball_1 = document.getElementById("ball1");
var ball_2 = document.getElementById("ball2");
var incr1_init;
var incr2_init;
var incr1_rev;
var incr2_rev;
var ball_1_x = parseInt(ball_1.getAttribute("cx"));	// location of 	ball1
var ball_2_x = parseInt(ball_2.getAttribute("cx"));	// location of ball2 
var movement;
var direction = 0;





function get_final_velocities(){
	var v1i = parseInt(v_a);
	var v2i = parseInt(v_b);
	var m1 = parseInt(m_1);
	var m2 = parseInt(m_2);
	
	var v_final_1 = (v1i*((m1-m2))/(m1+m2))+(v2i*((2*m2)/(m1+m2)));
	var v_final_2 = (v1i*((2*m1)/(m1+m2)))+(v2i*((m2-m1)/(m1+m2)));
	
	vf_a.textContent = v_final_1.toFixed(2);
	vf_b.textContent = v_final_2.toFixed(2);

	incr1_init = parseInt(vi_a.textContent);
	incr2_init = parseInt(vi_b.textContent);
	
	incr1_rev = parseFloat(vf_a.textContent);
	incr2_rev = parseFloat(vf_b.textContent);
}

function reset(){
	clearInterval(movement);
	ball_1.setAttribute("cx", 100);
	ball_2.setAttribute("cx", 1000);
	get_final_velocities();	

}


function launch () {

	var TIME = 10;

	
	var movement = setInterval(
		function() {
			if (Math.abs((ball_1_x + 20) - (ball_2_x - 20)) > 5 && direction === 0) {
				// before contact
				ball_1_x += incr1_init;
				ball_2_x += incr2_init;

				ball_1.setAttribute("cx", ball_1_x);
				ball_2.setAttribute("cx", ball_2_x);
			} else if (direction == 1 && ball_1_x > 50 && ball_2_x < 1050) { 
				// after contact
				
				ball_1_x += incr1_rev;
				ball_2_x += incr2_rev;

				ball_1.setAttribute("cx", ball_1_x);
				ball_2.setAttribute("cx", ball_2_x);
			} else {
				
				direction = 1;
			}
		}
	, TIME);

	setInterval(
		function() {
			if ((~~ball_1_x == 50 || ~~ball_2_x === 1050) && direction == 1) {
				clearInterval(movement);
			}
		}
	, TIME);
	
}

function increase_vi_1(){
	var v1i = parseInt(v_a);
	
	if(v1i >= 0 && v1i < 10){
		v1i += 1;
		document.getElementById("vel_1i").textContent = v1i;
        v_a = v1i;
        get_final_velocities();
        
	}
	else{
		document.getElementById("vel_1i").textContent = v1i;
	}
}

function increase_vi_2(){
	//v2 is always in negative direction, subtract to increase magnitude of velocity
	var v2i = parseInt(v_b);
	if(v2i < 0 && v2i > -10 ){
		v2i -= 1;
		document.getElementById("vel_2i").textContent = v2i;
        v_b = v2i;
        get_final_velocities();
	}
	else{
		document.getElementById("vel_2i").textContent = v2i;
	}
}

function increase_m_1(){
	var m1 = parseInt(m_1);
	if(m1 > 0 && m1 < 10){
		m1 += 1;
		document.getElementById("mass1").textContent = m1;
		m_1 = m1;
		get_final_velocities();
	}
	else{
		document.getElementById("mass1").textContent = m1;
	}
}

function increase_m_2(){
	var m2 = parseInt(m_2);
	if(m2 > 0 && m2 < 10){
		m2 += 1;
		document.getElementById("mass2").textContent = m2;
		m_2 = m2;
		get_final_velocities();
	}
	else{
		document.getElementById("mass2").textContent = m2;
	}
}

function decrease_vi_1(){
	var v1i = parseInt(v_a);
	if(v1i > 1 && v1i < 11 ){
		v1i -= 1;
		document.getElementById("vel_1i").textContent = v1i;
        v_a = v1i;
        get_final_velocities();
	}
	else{
		document.getElementById("vel_1i").textContent = v1i;

	}
}

function decrease_vi_2(){
	//v2 is always in negative direction, add to decrease magnitude of velocity
	var v2i = parseInt(v_b);
	if(v2i < -1 && v2i > -11 ){
		v2i += 1;
		document.getElementById("vel_2i").textContent = v2i;
        v_b = v2i;
        get_final_velocities();
	}
	else{
		document.getElementById("vel_2i").textContent = v2i;
		
	}
}

function decrease_m_1(){
	var m1 = parseInt(m_1);
	if(m1 > 1 && m1 < 11){
		m1 -= 1;
		document.getElementById("mass1").textContent = m1;
		m_1 = m1;
		get_final_velocities();
	}
	else{
		document.getElementById("mass1").textContent = m1;
	}
}

function decrease_m_2(){
	var m2 = parseInt(m_2);
	if(m2 > 1 && m2 < 11){
		m2 -= 1;
		document.getElementById("mass2").textContent = m2;
		m_2 = m2;
		get_final_velocities();
	}
	else{
		document.getElementById("mass2").textContent = m2;
	}
}


