import Swiper, { Pagination } from "swiper";
import $ from "jquery";

$(document).on("turbolinks:load", function () {
  const swiper = new Swiper(".image-swiper", {
    autoHeight: true,
    modules: [Pagination],
    pagination: {
      el: ".swiper-pagination",
    },
  });
});
