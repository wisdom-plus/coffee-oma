import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="flash"
export default class extends Controller {
  close() {
    $(".flash-message").closest(".flash-container").transition("fade");
  }
}
