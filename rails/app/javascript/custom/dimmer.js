import $ from "jquery";

$(document).on("turbolinks:load", function () {
  $("#dimmer-button").on("click", function () {
    $("#dimmer").dimmer("toggle");
    $("#dimmer-product").dimmer("toggle");
  });
  $("#q_itemname_cont").on("focus", function () {
    $("#sidebar").dimmer("show");
    $(".ui.action.input").css(
      "box-shadow",
      "rgba(222, 63, 105, 0.7) 0px 0px 0px 2px"
    );
  });
  $("#q_itemname_cont").on("blur", function () {
    $("#sidebar").dimmer("hide");
    $(".ui.action.input").css("box-shadow", "");
  });
  $("#q_name_cont").on("focus", function () {
    $("#sidebar").dimmer("show");
    $(".ui.action.input").css(
      "box-shadow",
      "rgba(222, 63, 105, 0.7) 0px 0px 0px 2px"
    );
  });
  $("#q_name_cont").on("blur", function () {
    $("#sidebar").dimmer("hide");
    $(".ui.action.input").css("box-shadow", "");
  });
});
