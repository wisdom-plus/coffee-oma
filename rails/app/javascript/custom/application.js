$(document).on("turbolinks:load", function () {
  $(".close").click(function () {
    $(".flash-message").closest(".flash-message").transition("fade");
  });
  $(".ui.accordion").accordion();
  $(".sidebar.icon").on("click", function () {
    $(".ui.sidebar").sidebar("toggle");
  });
  $(".menu .item").tab();
  $("#dimmer-button").on("click", function () {
    $("#dimmer").dimmer("toggle");
    $("#dimmer-product").dimmer("toggle");
  });
  $(".sticky").sticky({
    context: "#sidebar",
  });
  $(".ui.dropdown").dropdown();
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
  // 無限スクロールのscript
  if ($(".page_next").length && $(".scroll").length) {
    var InfiniteScroll = require("infinite-scroll");
    var infScroll = new InfiniteScroll(".scroll", {
      path: ".page_next",
      append: ".post",
      history: false,
      prefill: true,
      status: ".page-load-status",
      hideNav: ".pagination",
    });
    infScroll.on("request", function (path) {
      $(".ui.sticky").sticky("refresh");
    });
  }
  // レート星のscript
  $("#rating").rating({
    maxRating: 5,
    onRate: function (rating) {
      $("#review_rate").val(rating);
    },
  });
  $(".form_rating").rating({
    maxRating: 5,
    onRate: function (rating) {
      var form = $(this).data("taste");
      $("#bean_review_" + form).val(rating);
    },
  });
  $(".read").rating("disable");
  if ($("#star").length) {
    let rate_averge = $("#star").data("rating");
    $("#star").raty({
      size: 36,
      starOff: "/star-off.png",
      starOn: "/star-on.png",
      starHalf: "/star-half.png",
      score: rate_averge,
      half: true,
      readOnly: true,
    });
  }
  // チャートの表示
  if ($("#chart").length) {
    let evaluations = $("#chart").data("evaluations");
    var ctx = document.getElementById("chart").getContext("2d");
    var myChart = new Chart(ctx, {
      type: "radar",
      data: {
        labels: ["酸味", "苦味", "甘み", "コク", "香り"],
        datasets: [
          {
            label: "",
            data: evaluations,
            backgroundColor: "rgba(123,85,68,0.6)",
          },
        ],
      },
      options: {
        scale: {
          ticks: {
            suggestedMin: 0,
            suggestedMax: 5,
            stepSize: 1,
          },
        },
      },
    });
  }
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
        $(".menu").empty();
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
        $(".menu").empty();
      }
    });
  }
  //  フォームのvalidation設定
  $(".ui.form").form({
    fields: {
      username: "empty",
      password: ["minLength[6]", "empty", "match[password_confirmation]"],
      password_confirmation: "empty",
      email: ["empty", "email"],
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
      emali: "{name}は有効なメールアドレスではありません。",
      url: "{name}は有効なURLではありません。",
      match: "{name}が{ruleValue}は一致しません。",
      minLength: "{name}は少なくとも{ruleValue}文字以上でなければなりません。",
      minCount: "{name}は最低でも{ruleValue}の選択肢を持たなければなりません。",
      number: "{name}は数字で入力してください。",
    },
  });
});
