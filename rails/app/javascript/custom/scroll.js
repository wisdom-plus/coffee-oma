$(document).on("turbolinks:load", function () {
  // 無限スクロールのscript
  if ($(".page_next").length && $(".scroll").length) {
    var InfiniteScroll = require("infinite-scroll");
    var infScroll = new InfiniteScroll(".scroll", {
      path: ".page_next",
      append: ".post",
      history: false,
      prefill: true,
      status: ".page-load-status",
      hideNav: ".pagination",
    });
    infScroll.on("request", function (path) {
      $(".ui.sticky").sticky("refresh");
    });
  }
});
