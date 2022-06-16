let items = document.querySelectorAll('.carousel .carousel-item')


$(document).ready(function () {



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

    $('.slider').slick({
        slidesToShow: 4,
        autoplay: true,
        autoplaySpeed: 2000,
        infinite: true,
        arrows: false,
        swipeToSlide: true,
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


    let getUrlParameter = function getUrlParameter(sParam) {
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
    };

    let status = getUrlParameter('status');
    let message = getUrlParameter('message');

    if (status == "success" && message != undefined) {
//        console.log(status + message);
        $("#alert-register-modal").addClass("alert-success");
        $("#alert-register-modal").text(message);
        $("#alert-register-modal").show();
        $("#register-tab").tab('show');
        $('#staticBackdrop').modal('show');

    }

});
