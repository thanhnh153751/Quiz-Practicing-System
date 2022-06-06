// var myModal = document.getElementById('myModal');
// myModal.addEventListener('shown.bs.modal', function () {
//     myModal.show();
// })

// $(document).ready(function () {
//   $("#nav-login").click(function () {
//     $('#staticBackdrop').modal('show');
//   });

//   $("#redirect-forgot").click(function () {
//     $('#staticBackdrop').modal('hide');
//     $("#forgot-modal").modal('show');
//   })
// });

$(document).ready(function () {
   $.ajax({
      url: "/Online_Quiz/test", method: "POST", success: function (result) {
         //  $('#staticBackdrop').modal('show');
         //  $("#modal-body").append(result.message);
         console.log(result);
      }
   });

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

});

