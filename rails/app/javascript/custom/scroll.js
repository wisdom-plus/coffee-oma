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
    infScroll.on("append", function (items) {
      console.log(items);
      $("a.post.scale").transition({
        animation: "scale in",
        duration: 800,
        interval: 300,
        onComplete: function () {
          $("img.lazyload-post", this).visibility({
            type: "image",
            transition: "scale in",
            duration: 1000,
          });
          $(this).removeClass("scale");
          $(".placeholder").remove();
          $(".display_none").removeClass("display_none");
        },
      });
    });
  }
});
