import Swiper, { Pagination } from "swiper";

$(document).on("turbolinks:load", function () {
  const swiper = new Swiper(".image-swiper", {
    autoHeight: true,
    modules: [Pagination],
    pagination: {
      el: ".swiper-pagination",
    },
  });
});
