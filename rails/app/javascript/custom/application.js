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
  $("#rating").rating({
    maxRating: 5,
    onRate: function (rating) {
      $("#review_rate").val(rating);
    },
  });
  $(".formrating").rating({
    maxRating: 5,
    onRate: function (rating) {
      var form = $(this).data("taste");
      $("#bean_review_" + form).val(rating);
    },
  });
  $(".read").rating("disable");
  if ($("#star").length) {
    $("#star").raty({
      size: 36,
      starOff: "/star-off.png",
      starOn: "/star-on.png",
      starHalf: "/star-half.png",
      score: gon.rate_average,
      half: true,
      readOnly: true,
    });
  }
  if ($("#chart").length) {
    var ctx = document.getElementById("chart").getContext("2d");
    var myChart = new Chart(ctx, {
      type: "radar",
      data: {
        labels: ["酸味", "苦味", "甘み", "コク", "香り"],
        datasets: [
          {
            label: "",
            data: gon.evaluation,
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
      url: gon.tag_form_url,
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
});
