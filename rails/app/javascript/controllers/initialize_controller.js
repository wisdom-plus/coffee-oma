import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

// Connects to data-controller="initialize"
export default class extends Controller {
  connect() {
    $(".ui.accordion").accordion();
    $(".menu .item.tab").tab();
    $(".ui.dropdown").dropdown();
    $(".ui.checkbox").checkbox();
    $(".ui.rating").rating();
    $("img.lazyload").visibility({
      type: "image",
      transition: "scale in",
      duration: 300,
      once: false,
    });
    Turbo.setProgressBarDelay(100);
  }
}
