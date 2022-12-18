import $ from "jquery";

$(document).on("turbolinks:load", function () {
  $(".ui.accordion").accordion();
  $(".right.menu.toc").on("click", function () {
    $(".ui.sidebar").sidebar("toggle");
  });
  $(".menu .item.tab").tab();
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
