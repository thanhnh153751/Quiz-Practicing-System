//let items = document.querySelectorAll('.slider .slider-item .card-title')
//
//items.forEach((el) => {
//    const minPerSlide = 4;
//    let next = el.nextElementSibling;
//    for (var i=1; i<minPerSlide; i++) {
//        if (!next) {
//            // wrap carousel by using first child
//        	next = items[0];
//      	}
//        let cloneChild = next.cloneNode(true);
//        el.appendChild(cloneChild.children[0]);
//        next = next.nextElementSibling;
//    }
//});


$(document).ready(function () {
//   $.ajax({
//      url: "/Online_Quiz/test", method: "POST", success: function (result) {
//         //  $('#staticBackdrop').modal('show');
//         //  $("#modal-body").append(result.message);
//         console.log(result);
//      }
//   });

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
