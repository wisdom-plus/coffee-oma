import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="sidebar"
export default class extends Controller {
  connect() {
    $(".sticky").sticky({
      offset: 100,
      context: "#sidebar",
      observeChanges: true,
    });
  }
  top() {
    window.scroll({ top: 0, behavior: "smooth" });
  }
  sidemenu() {
    $(".ui.sidebar").sidebar("toggle");
  }
}
