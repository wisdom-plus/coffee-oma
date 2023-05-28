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
      className: {
        label: "ui teal label",
      },
      onAdd: () => {
        $(".menu.transition.visible").empty();
      },
      apiSettings: {
        url: "/api/v1/brands?keyword={query}",
        cache: false,
      },
      message: {
        addResult: "{term}",
        noResults: "登録されてません",
      },
    });
  }
}
