import { Controller } from "@hotwired/stimulus";
import InfiniteScroll from "infinite-scroll";

// Connects to data-controller="scroll"
export default class extends Controller {
  connect() {
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
  }
}
