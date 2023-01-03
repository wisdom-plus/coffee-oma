import { Controller } from "@hotwired/stimulus";
import $ from "jquery";
import "jquery-raty-js";
// Connects to data-controller="rate"
export default class extends Controller {
  static targets = ["review", "bean", "average"];
  static values = { num: String };

  reviewTargetConnected() {
    $(this.reviewTargets).rating({
      maxRating: 5,
      onRate: function (rating) {
        $("#review_rate").val(rating);
      },
    });
  }

  beanTargetConnected() {
    $(".form_rating").rating({
      maxRating: 5,
      onRate: function (rating) {
        var form = $(this).data("taste");
        $("#bean_review_" + form).val(rating);
      },
    });
  }

  averageTargetConnected() {
    const rate_average = $(this.averageTarget).data("rating");
    $(this.averageTarget).raty({
      size: 36,
      starOff: "/star-off.png",
      starOn: "/star-on.png",
      starHalf: "/star-half.png",
      score: rate_average,
      half: true,
      readOnly: true,
    });
  }
}
