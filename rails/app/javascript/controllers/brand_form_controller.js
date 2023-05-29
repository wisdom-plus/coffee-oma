import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="brand-form"
export default class extends Controller {
  static targets = ["form"];

  connect() {
    $(this.formTarget).dropdown({
      allowAdditions: false,
      forceSelection: false,
      saveRemoteData: false,
      hideAdditions: false,
      allowTab: false,
      showOnFocus: false,
      prepareHTML: false,
      apiSettings: {
        url: "/api/v1/brands",
        cache: false,
      },
      message: {
        addResult: "{term}",
        noResults: "登録されてません",
      },
    });
  }
}
