import $ from "jquery";

$(document).on("turbolinks:load", function () {
  // ファイルフォームのscript
  $("#upload-button").on("click", function () {
    $("#file-form").on("click", function () {});
  });

  $(".file-form").on("change", function () {
    $("#dimmer").dimmer("hide");
    $("#dimmer-product").dimmer("hide");
    var file = this.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function () {
      var image = this.result;
      $("#img-prev").attr({ src: image });
    };
  });

  // タグフォームのscript
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
