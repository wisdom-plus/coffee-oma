$(document).on("turbolinks:load", function () {
  $(".close").click(function () {
    $(".flash-message").closest(".flash-message").transition("fade");
  });
  $(".ui.accordion").accordion();
  $(".sidebar.icon").on("click", function () {
    $(".ui.sidebar").sidebar("toggle");
  });

  $(".menu .item").tab();
  $("#dimmer-button").on("click", function () {
    $("#dimmer").dimmer("toggle");
    $("#dimmer-product").dimmer("toggle");
  });
  $(".sticky").sticky({
    context: "#sidebar",
  });
  $(".ui.dropdown").dropdown();
  $("img.lazyload").visibility({
    type: "image",
    transition: "scale in",
    duration: 1000,
  });
});
