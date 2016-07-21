var Addition = document.getElementById("Addition");
var Subtraction = document.getElementById("Subtraction");
var Vector2 = document.getElementById("Vector2");
var NegVector2 = document.getElementById("-Vector2");


function loaded(){
    Addition.setAttribute("opacity","0");
    Subtraction.setAttribute("opacity","0");
    NegVector2.setAttribute("opacity","0");
};

function Add(){
    Vector2.setAttribute("opacity","1");
    Addition.setAttribute("opacity","1");
    Subtraction.setAttribute("opacity","0");
    NegVector2.setAttribute("opacity","0");
};

function Subtract(){
    Vector2.setAttribute("opacity","0");
    Addition.setAttribute("opacity","0");
    Subtraction.setAttribute("opacity","1");
    NegVector2.setAttribute("opacity","1");
};
