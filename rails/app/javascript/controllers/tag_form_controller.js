import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

// Connects to data-controller="tag-form"
export default class extends Controller {
  static targets = ["form"];

  connect() {
    $(this.formTarget).dropdown({
      allowAdditions: true,
      forceSelection: false,
      saveRemoteData: false,
      hideAdditions: false,
      allowTab: false,
      showOnFocus: false,
      prepareHTML: false,
      className: {
        label: "ui teal label",
      },
      onAdd: () => {
        $(".menu.transition.visible").empty();
      },
      apiSettings: {
        url: gon.global.tag_form_url,
        cache: false,
      },
      message: {
        addResult: "{term} (0)",
        noResults: "登録されてません",
      },
    });
  }
}
