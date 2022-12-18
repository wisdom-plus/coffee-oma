import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="file-form"
export default class extends Controller {
  static targets = ["input"];
  upload() {
    $(this.inputTargets).click();
  }

  set() {
    const file = $(this.inputTargets)[0].files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function () {
      var image = this.result;
      $("#img-prev").attr({ src: image });
    };
    this.element.dimmer.toggle();
  }
}
