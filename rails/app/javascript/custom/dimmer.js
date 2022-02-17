$(document).on("turbolinks:load", function () {
  $("#dimmer-button").on("click", function () {
    $("#dimmer").dimmer("toggle");
    $("#dimmer-product").dimmer("toggle");
  });
  $("#q_itemname_cont").on("focus", function () {
    $("#sidebar").dimmer("show");
    $(".ui.action.input").style.border = "solid 2px #DE3F69";
  });
  $("#q_itemname_cont").on("blur", function () {
    $("#sidebar").dimmer("hide");
    $(".ui.action.input").style.border = "";
  });
  $("#q_name_cont").on("focus", function () {
    $("#sidebar").dimmer("show");
    $(".ui.action.input").style.border = "solid 2px #DE3F69";
  });
  $("#q_name_cont").on("blur", function () {
    $("#sidebar").dimmer("hide");
    $(".ui.action.input").style.border = "";
  });
});
