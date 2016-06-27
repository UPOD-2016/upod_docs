function loaded() {
    var curve = document.getElementById("curve");
    var vi = document.getElementById("vi").textContent;
    var LaunchAngle = document.getElementById("LaunchAngle").textContent;
    var Heighti = document.getElementById("InitialHeight").textContent;
    var test = document.getElementById("test");
    var DistanceOut = document.getElementById("DistanceOut");
    var HeightOut = document.getElementById("HeightOut");
    var TimeOut = document.getElementById("TimeOut");
    var EndText = document.getElementById("EndText");
    var mid = document.getElementById("mid");
    var end = document.getElementById("end");
    var EndText = document.getElementById("EndText");

    var theta = LaunchAngle*Math.PI/180;    
    
    var MaxHeight = Math.sin(theta)*Math.sin(theta)*vi*vi/(2*9.8);
    var TimeOfFlight = 2*Math.sin(theta)*vi/9.8;
    var Distance = vi*vi*Math.sin(2*theta)/9.8;
    

    var X1 = ((Distance.toFixed(0)/2)+100);
    var X2 = ((Distance.toFixed(0)/1)+100);
    var Y  = (500-2*MaxHeight.toFixed(0));
    var path = "M 100 500 Q " + X1+" "+Y+" "+X2+" 500";
    
    TimeOut.textContent = TimeOfFlight.toFixed(2);
    DistanceOut.textContent = Distance.toFixed(2);
    HeightOut.textContent = MaxHeight.toFixed(2);
    EndText.textContent = Distance.toFixed(2);

    curve.setAttribute("d", path);
    mid.setAttribute("cx", X1);
    mid.setAttribute("cy", (500-MaxHeight.toFixed(0)));
    end.setAttribute("cx", X2);
    EndText.setAttribute("x", X2);

};
