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
  Turbolinks.setProgressBarDelay(100);
});
