//
//
$(document).ready(function () {
    $('#slider_1').slick({
        slidesToShow: 1,
        autoplay: true,
        autoplaySpeed: 2000,
        infinite: true,
        arrows: true, //nut <>
        swipeToSlide: true,
        prevArrow: '<i class="bi bi-caret-right-fill slider-next"></i>',
        nextArrow: '<i class="bi bi-caret-left-fill slider-previous"></i>'
    });

    $('.slider_2').slick({
        slidesToShow: 3,
        autoplay: false,
        autoplaySpeed: 2000,
        infinite: true,
        arrows: true,
        swipeToSlide: true,
        prevArrow: '<i class="bi bi-caret-right-fill slider-next"></i>',
        nextArrow: '<i class="bi bi-caret-left-fill slider-previous"></i>'
    });


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

    function getUrlParameter(sParam) {
        var sPageURL = window.location.search.substring(1),
                sURLVariables = sPageURL.split('&'),
                sParameterName,
                i;
        for (i = 0; i < sURLVariables.length; i++) {
            sParameterName = sURLVariables[i].split('=');
            if (sParameterName[0] === sParam) {
                return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
            }
        }
        return false;
    }
    ;

    let status = getUrlParameter('status');
    let message = getUrlParameter('message');
    if (status == "success" && message != undefined) {
//        console.log(status + message);
        $("#alert-login-modal").addClass("alert-success");
        $("#alert-login-modal").text(message);
        $("#alert-login-modal").show();
        $('#staticBackdrop').modal('show');

    }

    
})

document.querySelectorAll('div[data-type="tagline"]').forEach(c => {
        var content = c.innerHTML;
        var x = content.split("|");

        c.innerHTML = "";
        x.forEach(a => {
            c.innerHTML += '<a href="searchboxsubjectlist?name=' + a + '" class="btn btn-primary rounded-pill px-2 py-0 mb-2">' + a + '</a>';
            
        })
    });


//    let url = window.location.href;!
//    if (url == "http://localhost:8080/Online_Quiz/common/register") {
//        $.ajax({
//            url: "/Online_Quiz/common/register",
//            method: "GET",
//            success: function (result) {
//                if (result != undefined && result.status == "success") {
//                    window.location.replace = "/Online_Quiz/public/home";
//                    $("#alert-login-modal").addClass("alert-success");
//                    $("#alert-login-modal").text(result.mess);
//                    $("#alert-login-modal").show();
//                    $('#staticBackdrop').modal('show');
//                }
//            }
//        });
//    }





