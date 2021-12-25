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
    infScroll.on("request", function () {
      $(".ui.sticky").sticky("refresh");
    });
    infScroll.on("append", function () {
      $(".post.scale").transition({
        animation: "scale in",
        duration: 800,
        interval: 200,
        onComplete: function () {
          $(this).removeClass("scale");
          $(this).find(".reveal").addClass("active");
          $(".placeholder").remove();
          $(".display_none").removeClass("display_none");
        },
      });
    });
  }
});
