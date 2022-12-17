import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

// Connects to data-controller="dimmer"
export default class extends Controller {
  toggle() {
    $("#dimmer").dimmer("toggle");
    $("#dimmer-product").dimmer("toggle");
  }

  show() {
    $("#sidebar").dimmer("show");
    $(".ui.action.input").css(
      "box-shadow",
      "rgba(222, 63, 105, 0.7) 0px 0px 0px 2px"
    );
  }

  hide() {
    $("#sidebar").dimmer("hide");
    $(".ui.action.input").css("box-shadow", "");
  }
}
