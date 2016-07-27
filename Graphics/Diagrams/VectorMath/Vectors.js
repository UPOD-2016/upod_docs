/*
Name: Vectors.js
Created By: viss3240 - Jordan Visser
WLU ID: 120513240
Date: July 27, 2016

This javascript file is linked with Vectors.svg. The javascript makes the svg elements visible/invisable depending on the button pressed by the user. 
*/


var Addition = document.getElementById("Addition");//This is the element that holds the result for addition
var Subtraction = document.getElementById("Subtraction");//This is the element that holds the result for Subtraction
var Vector2 = document.getElementById("Vector2");//This is the element for Vector2
var NegVector2 = document.getElementById("-Vector2");//This is the element for negative Vector2


function loaded(){//when the page loads set the two result pictures and negative vector two to be negative
    Addition.setAttribute("opacity","0");
    Subtraction.setAttribute("opacity","0");
    NegVector2.setAttribute("opacity","0");
};

function Add(){//when the user presses the addition button show the result for addition make the subtraction elements invisable
    Vector2.setAttribute("opacity","1");
    Addition.setAttribute("opacity","1");
    Subtraction.setAttribute("opacity","0");
    NegVector2.setAttribute("opacity","0");
};

function Subtract(){//when the user presses the subtract button show the result for subtraction make the addition elements invisable
    Vector2.setAttribute("opacity","0");
    Addition.setAttribute("opacity","0");
    Subtraction.setAttribute("opacity","1");
    NegVector2.setAttribute("opacity","1");
};
