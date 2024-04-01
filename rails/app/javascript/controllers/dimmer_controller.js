import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

// Connects to data-controller="dimmer"
export default class extends Controller {
  connect() {
    this.element[this.identifier] = this;
  }

  toggle() {
    $("#dimmer").dimmer("toggle");
    $("#dimmer-product").dimmer("toggle");
  }

  show() {
    $("#sidebar").dimmer("show");
    $(".ui.action.input").css({
      border: "2px solid rgba(222, 63, 105, 0.7)",
      "border-radius": "6px",
    });
  }

  hide() {
    $("#sidebar").dimmer("hide");
    $(".ui.action.input").css({
      border: "none",
      "border-radius": "0",
    });
  }
}
