import { Controller } from "@hotwired/stimulus";
import $ from "jquery";
import "jquery-raty-js";
// Connects to data-controller="rate"
export default class extends Controller {
  static targets = [
    "reviewForm",
    "review",
    "beanReview",
    "beanForm",
    "average",
  ];
  static values = { num: String };

  reviewTargetConnected() {
    $(this.reviewTargets).rating();
  }

  reviewFormTargetConnected() {
    $(this.reviewFormTargets).rating({
      maxRating: 5,
      onRate: function (rating) {
        $("#review_rate_form").val(rating);
      },
    });
  }

  beanReviewTargetConnected() {
    $(this.beanReviewTargets).children(".ui.rating").rating();
  }

  beanFormTargetConnected() {
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
