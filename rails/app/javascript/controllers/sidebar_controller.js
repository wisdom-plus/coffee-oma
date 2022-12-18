import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="sidebar"
export default class extends Controller {
  connect() {
    $(".sticky").sticky({
      context: "#sidebar",
    });
  }
  top() {
    window.scroll({ top: 0, behavior: "smooth" });
  }
}
