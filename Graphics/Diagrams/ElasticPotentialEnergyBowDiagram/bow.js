	var t=document.getElementById("top");
	var b=document.getElementById("bottom");
	var a=document.getElementById("arrow");
    var position = 278;
    var tracker = 0;
	
	
function stretch(){
	if(position<465){
		position=position+10;
		tracker=tracker+10;
	}	
	b.setAttribute("x1", position);
	t.setAttribute("x2", position);
    a.transform.baseVal.getItem(0).setTranslate(tracker, 0);
	};
	
	
function letgo(){
	if(position>278){
		position=position-10;
		tracker=tracker-10;

	}
	b.setAttribute("x1", position);
	t.setAttribute("x2", position);
	a.transform.baseVal.getItem(0).setTranslate(tracker, 0);

	};
	
