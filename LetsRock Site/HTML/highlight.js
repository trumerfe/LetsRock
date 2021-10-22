window.addEventListener('DOMContentLoaded',init,false);
            
function init() {
    alert('The page loaded!');
    var buttons = document.getElementsByTagName("button")
    buttons[0].addEventListener('click',highlight,false)
}

function highlight() {
alert ('its working roobs!');
var td = document.getElementsByTagName('h2')    
   for (var i = 0, length = td.length; i < length; i++) {
        td[i].style.backgroundColor = "pink";
    }  
}
