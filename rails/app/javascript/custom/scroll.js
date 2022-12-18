import InfiniteScroll from "infinite-scroll";
import $ from "jquery";

$(document).on("turbolinks:load", function () {
  // 無限スクロールのscript
  if ($(".page_next").length && $(".scroll").length) {
    var infScroll = new InfiniteScroll(".scroll", {
      path: ".page_next",
      append: ".post",
      history: false,
      prefill: true,
      status: ".page-load-status",
      hideNav: ".pagination",
    });
    infScroll.on("append", function () {
      $(".ui.sticky").sticky("refresh");
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
