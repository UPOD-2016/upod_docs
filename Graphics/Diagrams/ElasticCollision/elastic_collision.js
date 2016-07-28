var v_a = document.getElementById("vel_1i").textContent; 
var v_b = document.getElementById("vel_2i").textContent;
var m_1 = document.getElementById("mass1").textContent;
var m_2 = document.getElementById("mass2").textContent;
var vf_a = document.getElementById("vel_1f"); 
var vf_b = document.getElementById("vel_2f");

function reset(){

}
function launch () {
    
}
function get_final_velocities(){
   var v1i = parseInt(v_a);
   var v2i = parseInt(v_b);
   var m1 = parseInt(m_1);
   var m2 = parseInt(m_2);
   var v_final_1 = (v1i*((m1-m2))/(m1+m2))+(v2i*((2*m2)/(m1+m2)));
   var v_final_2 = (v1i*((2*m1)/(m1+m2)))+(v2i*((m2-m1)/(m1+m2)));
   vf_a.textContent = v_final_1.toFixed(2);
   vf_b.textContent = v_final_2.toFixed(2);
    
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
    if(m1 > 0 && m1 < 50){
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
    if(m2 > 0 && m2 < 50){
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
    if(m1 > 1 && m1 < 51){
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
    if(m2 > 1 && m2 < 51){
	m2 -= 1;
	document.getElementById("mass2").textContent = m2;
	m_2 = m2;
	get_final_velocities();
	}
    else{
	document.getElementById("mass2").textContent = m2;
	}
}

