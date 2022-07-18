/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function openNav() {
    // document.getElementById("nav-controller").classList.remove("fixed-bottom");
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
    
}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0, and the background color of body to white */
function closeNav() {
    // document.getElementById("nav-controller").classList.add("fixed-bottom");
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft = "0";
}

// Lấy các phần tử có class là menu
let x = document.getElementsByClassName("menu");

// Lặp qua các phần tử có class là menu
for (let i = 0; i < x.length; i++) {
    
    // Lắng nghe sự kiện click
    // và đổi màu chữ thành màu đỏ
    x[i].onclick = function() {
        this.style.color = "red";
    };
}
