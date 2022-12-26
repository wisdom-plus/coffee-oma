import { Controller } from "@hotwired/stimulus";
import $ from "jquery";
// Connects to data-controller="modal"
export default class extends Controller {
  connect() {}

  open() {
    $(".small.modal").modal("show");
  }

  report({ params: { id, reviewclass } }) {
    const url = $("#report-modal-link").attr("href").split("?");
    const newurl = url[1];
    const changeurl = $("#report-modal-link")
      .attr("href")
      .replace(newurl, `review_id=${id}&type=${reviewclass}`);
    $("#report-modal-link").attr("href", changeurl);
    $(".report-modal").modal("show");
  }
}
