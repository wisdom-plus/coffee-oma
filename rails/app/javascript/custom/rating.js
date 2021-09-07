$(document).on("turbolinks:load", function () {
  // レート星のscript
  $("#rating").rating({
    maxRating: 5,
    onRate: function (rating) {
      $("#review_rate").val(rating);
    },
  });
  $(".form_rating").rating({
    maxRating: 5,
    onRate: function (rating) {
      var form = $(this).data("taste");
      $("#bean_review_" + form).val(rating);
    },
  });
  $(".read").rating("disable");
  if ($("#star").length) {
    let rate_averge = $("#star").data("rating");
    $("#star").raty({
      size: 36,
      starOff: "/star-off.png",
      starOn: "/star-on.png",
      starHalf: "/star-half.png",
      score: rate_averge,
      half: true,
      readOnly: true,
    });
  }
});
