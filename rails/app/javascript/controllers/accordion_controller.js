import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

// Connects to data-controller="accordion"
export default class extends Controller {
  static targets = ["accordion"];
  connect() {
    $(this.accordionTarget).accordion();
  }
}
