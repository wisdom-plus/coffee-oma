import { Controller } from "@hotwired/stimulus";
import Cookies from "js-cookie";
import anime from "animejs";

// Connects to data-controller="anime"
export default class extends Controller {
  connect() {
    const flag = Cookies.get("animation-flag");
    if (flag == undefined) {
      $(".ui.page.dimmer").dimmer("show", {
        onShow: setTimeout(function () {
          $(".ui.page.dimmer").dimmer("hide");
        }, 3000),
      });
      anime
        .timeline({ loop: false })
        .add({
          targets: ".ml5 .line",
          opacity: [0.5, 1],
          scaleX: [0, 1],
          easing: "easeInOutExpo",
          duration: 500,
        })
        .add({
          targets: ".ml5 .line",
          duration: 500,
          easing: "easeOutExpo",
          translateY: (el, i) => -0.625 + 0.625 * 2 * i + "em",
        })
        .add({
          targets: ".ml5 .ampersand",
          opacity: [0, 1],
          scaleY: [0.5, 1],
          easing: "easeOutExpo",
          duration: 400,
          offset: "-=300",
        })
        .add({
          targets: ".ml5 .letters-left",
          opacity: [0, 1],
          translateX: ["0.5em", 0],
          easing: "easeOutExpo",
          duration: 500,
          offset: "-=300",
        })
        .add({
          targets: ".ml5 .letters-right",
          opacity: [0, 1],
          translateX: ["-0.5em", 0],
          easing: "easeOutExpo",
          duration: 500,
          offset: "-=600",
        })
        .add({
          targets: ".ml5",
          opacity: 0,
          duration: 900,
          easing: "easeOutExpo",
          delay: 900,
        });
      Cookies.set("animation-flag", "true", { expires: 7 });
    }
  }
}
