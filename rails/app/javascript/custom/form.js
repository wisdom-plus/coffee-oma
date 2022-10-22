$(document).on("turbolinks:load", function () {
  //  フォームのvalidation設定
  $(".ui.form").form({
    fields: {
      username: "empty",
      password: ["minLength[6]", "empty", "match[password_confirmation]"],
      password_confirmation: "empty",
      email: ["empty", "email"],
      policy: "checked",
      login_password: "empty",
      name: "empty",
      shopname: "empty",
      price: ["minLength[1]", "empty", "number"],
      url: "url",
      tag: ["empty", "minCount[1]"],
      description: "empty",
      content: "empty",
      review_rate: "empty",
      title: "empty",
      country: "empty",
      bean_review_acidity: "empty",
      bean_review_bitter: "empty",
      bean_review_sweet: "empty",
      bean_review_rich: "empty",
      bean_review_flavor: "empty",
    },
    prompt: {
      empty: "{name}が入力されていません。",
      email: "{name}は有効なメールアドレスではありません。",
      url: "{name}は有効なURLではありません。",
      match: "{name}が一致しません。",
      minLength: "{name}は少なくとも{ruleValue}文字以上でなければなりません。",
      minCount: "{name}は最低でも{ruleValue}の選択肢を持たなければなりません。",
      number: "{name}は数字で入力してください。",
      checked: "利用規約とプライベートポリシーに同意する必要があります。",
    },
  });

  // ファイルフォームのscript
  $("#upload-button").click(function () {
    $("#file-form").click();
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
    $("#tag_form").keyup(function (e) {
      var form_value = $("input.search").val();
      if (form_value == "") {
        $(".menu.transition.visible").empty();
      }
    });
  }
});
