$(document).on("turbolinks:load", function () {
  $("#top-button").click(function () {
    window.scroll({ top: 0, behavior: "smooth" });
  });
  $(".flash-message > .close").click(function () {
    $(".flash-message").closest(".ui.container.top-padding").transition("fade");
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
  $(".ui.checkbox").checkbox();
  $("#q_itemname_cont").focus(function () {
    $(".segment").dimmer("show");
    this.style.border = "solid 2px #DE3F69";
  });
  $("#q_itemname_cont").blur(function () {
    $(".segment").dimmer("hide");
    this.style.border = "";
  });
  $("img.lazyload").visibility({
    type: "image",
    transition: "scale in",
    duration: 1000,
    once: false,
  });
  $(".post.scale").transition({
    animation: "scale in",
    duration: 800,
    interval: 200,
    onComplete: function () {
      $(this).removeClass("scale");
      $(this).find(".reveal").addClass("active");
      if ("img.lazyload-post") {
        $("img.lazyload-post", this).visibility({
          type: "image",
          transition: "scale in",
          duration: 500,
          once: false,
        });
      }
      $(".placeholder").remove();
      $(".display_none").removeClass("display_none");
    },
  });
  Turbolinks.setProgressBarDelay(100);
});
