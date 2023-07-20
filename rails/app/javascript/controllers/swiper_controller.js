import { Controller } from "@hotwired/stimulus";
import Swiper from "swiper";
import { Navigation, Pagination } from "swiper/modules";

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
