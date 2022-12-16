import $ from "jquery";

$(document).on("turbolinks:load", function () {
  $("#modal-button").on("click", function () {
    $(".small.modal").modal("show");
  });
  $(".report-modal-button").on("click", function () {
    const id = $(this).data("reviewid");
    const reviewclass = $(this).data("class");
    const url = $("#report-modal-link").attr("href").split("?");
    const newurl = url[1];
    const changeurl = $("#report-modal-link")
      .attr("href")
      .replace(newurl, `review_id=${id}&type=${reviewclass}`);
    $("#report-modal-link").attr("href", changeurl);
    $(".report-modal").modal("show");
  });
});
