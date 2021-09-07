$(document).on("turbolinks:load", function () {
  $("#modal-button").on("click", function () {
    $(".small.modal").modal("show");
  });
});
