/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



$("#nav-login").click(function () {
    $('#staticBackdrop').modal('show');
    // $("#register-tab").tab('show');

});

$("#redirect-forgot").click(function () {
    $('#staticBackdrop').modal('hide');
    $("#forgot-modal").modal('show');
});

$("#changepass-nav").click(function () {
//        $('#staticBackdrop').modal('hide');
    $("#changepass-modal").modal('show');
});

$("#login-btn").click(function () {
    $.ajax({
        url: "/Online_Quiz/common/login",
        method: "POST",
        data: {
            email: $("#login-email").val(),
            password: $("#login-pwd").val(),
        },
        success: function (result) {
            if (result != undefined && result.status === "danger") {
                $("#alert-login-modal").addClass("alert-danger");
                $("#alert-login-modal").text(result.mess);
                $("#alert-login-modal").show();
            } else {
                window.location.replace("/Online_Quiz/public/home");
            }

        }
    });
});

$("#changepass-btn").click(function () {
    $.ajax({
        url: "/Online_Quiz/common/changepass",
        method: "POST",
        data: {
            password: $("#pass").val(),
            newpassword: $("#new-pass").val(),
            connewpassword: $("#con-pass").val(),

        },
        success: function (result) {
            if (result != undefined && result.status === "danger") {
//                    $("#register").modal('show');
                $("#alert-changepass-modal").addClass("alert-danger");
                $("#alert-changepass-modal").text(result.mess);
                $("#alert-changepass-modal").show();
            } else if (result != undefined && result.status === "success") {
//                    $("#register").modal('show');
                $("#alert-changepass-modal").addClass("alert-success");
                $("#alert-changepass-modal").text(result.mess);
                $("#alert-changepass-modal").show();
            }

        }
    });
});

$("#register-btn").click(function () {
    $.ajax({
        url: "/Online_Quiz/common/register",
        method: "POST",
        data: {
            fullname: $("#name").val(),
            gender: $("#gender").val(),
            email: $("#register-email").val(),
            phone: $("#phone").val(),
            password: $("#register-pass").val(),

        },
        success: function (result) {
            if (result != undefined && result.status === "danger") {
//                    $("#register").modal('show');
                $("#alert-register-modal").addClass("alert-danger");
                $("#alert-register-modal").text(result.mess);
                $("#alert-register-modal").show();
            } else if (result != undefined && result.status === "success") {
//                    $("#register").modal('show');
                $("#alert-register-modal").addClass("alert-success");
                $("#alert-register-modal").text(result.mess);
                $("#alert-register-modal").show();
            }

        }
    });
});

$('#staticBackdrop').on('hidden.bs.modal', function (e) {
    $(this).find("input,textarea,select").val('').end()
            .find("input[type=checkbox], input[type=radio]")
            .prop("checked", "")
            .end();
});

$('#forgot-modal').on('hidden.bs.modal', function (e) {
    $(this).find("input,textarea,select").val('').end()
            .find("input[type=checkbox], input[type=radio]")
            .prop("checked", "")
            .end();
});

$('#changepass-modal').on('hidden.bs.modal', function (e) {
    $(this).find("input,textarea,select").val('').end()
            .find("input[type=checkbox], input[type=radio]")
            .prop("checked", "")
            .end();
});


function findGetParameter(parameterName) {
    var result = null,
            tmp = [];
    location.search
            .substr(1)
            .split("&")
            .forEach(function (item) {
                tmp = item.split("=");
                if (tmp[0] === parameterName)
                    result = decodeURIComponent(tmp[1]);
            });
    return result;
}

let status = findGetParameter('status');
let message = findGetParameter('message');
let type = findGetParameter('type');

function openNav() {
    document.getElementById("nav-controller").classList.remove("fixed-bottom");
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";

}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0, and the background color of body to white */
function closeNav() {
    document.getElementById("nav-controller").classList.add("fixed-bottom");
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft = "0";
}


if (status === "success" && message !== undefined && type === "signin") {
//        console.log(status + message);
    $("#alert-login-modal").addClass("alert-success");
    $("#alert-login-modal").text(message);
    $("#alert-login-modal").show();
    $('#staticBackdrop').modal('show');
} else if (status === "success" && message !== undefined && type === "register") {
    $("#alert-login-modal").addClass("alert-success");
    $("#alert-login-modal").text(message);
    $("#alert-login-modal").show();
    $('#staticBackdrop').modal('show');

}