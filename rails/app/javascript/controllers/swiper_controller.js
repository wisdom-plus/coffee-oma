import { Controller } from "@hotwired/stimulus";
import Swiper, { Pagination, Navigation } from "swiper";

// Connects to data-controller="swiper"
export default class extends Controller {
  connect() {
    const swiper = new Swiper(".image-swiper", {
      autoHeight: true,
      modules: [Pagination, Navigation],
      pagination: {
        el: ".swiper-pagination",
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
  }
}
