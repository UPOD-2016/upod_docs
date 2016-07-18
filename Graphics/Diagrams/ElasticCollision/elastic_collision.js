
var v_a = document.getElementById("vel_1i"); 
var v_b = document.getElementById("vel_2i");
var m_1 = document.getElementById("mass1");
var m_2 = document.getElementById("mass2");
var vf_a = document.getElementById("vel_1f"); 
var vf_b = document.getElementById("vel_2f");

function reset(){

};
function launch () {
	
};
function get_final_velocities(){
		
		vf_a = (v_a* ((m_1 - m_2))/(m_1 + m_2)) + (v_b*((2*m_2)/(m_1+m_2)))

		vf_b = (v_a*((2*m_1)/(m_1 + m_2))) + (v_b*((m_2 - m_1) / (m_1 + m_2)) )
};
function increase_vi_1(){
	var v1i = parseInt(v_a);
	if(v1i > 1 && v1i < 11 ){
		v1i += 1;
		document.getElementById("vel_1i").textContent = v1i;
        v_a = v1i;
        get_final_velocities();
	}
};

function increase_vi_2(){
	//v2 is always in negative direction, subtract to increase magnitude of velocity
	var v2i = parseInt(v_b);
	if(v2i < -1 && v1i > -11 ){
		v21 -= 1;
		document.getElementById("vel_2i").textContent = v2i;
        v_b = v2i;
        get_final_velocities();
	}
};

function increase_m_1(){
	var m1 = parseInt(m_1);
	if(m1 > 1 && m1 < 51){
		m1 += 1;
		document.getElementById("mass1").textContent = m1;
		m_1 = m1;
		get_final_velocities();
	}
};

function increase_m_2(){
	var m2 = parseInt(m_2);
	if(m2 > 1 && m2 < 51){
		m2 += 1;
		document.getElementById("mass2").textContent = m1;
		m_2 = m2;
		get_final_velocities();
	}
};

function decrease_vi_1(){
	var v1i = parseInt(v_a);
	if(v1i > 1 && v1i < 11 ){
		v1i -= 1;
		document.getElementById("vel_1i").textContent = v1i;
        v_a = v1i;
        get_final_velocities();
	}
};

function decrease_vi_2(){
	//v2 is always in negative direction, add to decrease magnitude of velocity
	var v2i = parseInt(v_b);
	if(v2i < -1 && v1i > -11 ){
		v21 += 1;
		document.getElementById("vel_2i").textContent = v2i;
        v_b = v2i;
        get_final_velocities();
	}
};

function decrease_m_1(){
	var m1 = parseInt(m_1);
	if(m1 > 1 && m1 < 51){
		m1 -= 1;
		document.getElementById("mass1").textContent = m1;
		m_1 = m1;
		get_final_velocities();
	}
};

function decrease_m_2(){
	var m2 = parseInt(m_2);
	if(m2 > 1 && m2 < 51){
		m2 -= 1;
		document.getElementById("mass2").textContent = m1;
		m_2 = m2;
		get_final_velocities();
	}
};


