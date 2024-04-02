import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="transition"
export default class extends Controller {
  connect() {
    $(".post.scale").transition({
      animation: "scale in",
      duration: 500,
      interval: 200,
      onComplete: function () {
        $(this).removeClass("scale");
        $(this).find(".reveal").addClass("active");
        if ($("img.lazyload-post").length) {
          $("img.lazyload-post", this).visibility({
            type: "image",
            transition: "scale in",
            duration: 300,
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
  }
}
