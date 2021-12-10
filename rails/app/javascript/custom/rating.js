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
  if ($(".popup > .poprating").length) {
    $("a.ui.fluid.link.card.post.scale").popup({
      onShow: function () {
        const id = this.data("id");
        const rate_average = $(`#rate-${id}`).data("rating");
        $(`#rate-${id}`).raty({
          size: 36,
          starOff: "/star-off.png",
          starOn: "/star-on.png",
          starHalf: "/star-half.png",
          score: rate_average,
          half: true,
          readOnly: true,
        });
      },
    });
  }
});
