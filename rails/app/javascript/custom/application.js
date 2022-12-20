import $ from "jquery";

$(document).on("turbolinks:load", function () {
  $(".ui.accordion").accordion();
  $(".menu .item.tab").tab();
  $(".ui.dropdown").dropdown();
  $(".ui.checkbox").checkbox();
  $(".ui.rating").rating();
  $("img.lazyload").visibility({
    type: "image",
    transition: "scale in",
    duration: 1000,
    once: false,
  });
  Turbolinks.setProgressBarDelay(100);

  if ($("#tag_form").length) {
    $("#tag_form").dropdown({
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
});
