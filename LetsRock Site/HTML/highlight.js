window.addEventListener('DOMContentLoaded',init,false);
            
function init() {
    alert('The page loaded!');
    var buttons = document.getElementsByTagName("button")
    buttons[0].addEventListener('click',highlight,false)
}



function changeColor() {
var p1 = document.getElementById("zato") 
{p1.style.backgroundColor = "skyblue";}
/* here, style is a *property*: the CSS styling of an element: you can add a CSS property after invoking style. */
}

function highlight() {
var highlight = document.getElementsByClassName('zato')
    for (var i = 0, length = highlight.length; i < length; i++) 
    {highlight[i].style.backgroundColor = "magenta"}
}