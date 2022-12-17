import $ from "jquery";

$(document).on("turbolinks:load", function () {
  $("#top-button").on("click", function () {
    window.scroll({ top: 0, behavior: "smooth" });
  });

  $(".ui.accordion").accordion();
  $(".right.menu.toc").on("click", function () {
    $(".ui.sidebar").sidebar("toggle");
  });
  $(".menu .item.tab").tab();
  $(".sticky").sticky({
    context: "#sidebar",
  });
  $(".ui.dropdown").dropdown();
  $(".ui.checkbox").checkbox();
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
    onStart: function () {
      $(this).find(".reveal").removeClass("display_none");
    },
  });
  Turbolinks.setProgressBarDelay(100);
});
