$(document).one("turbolinks:load", function () {
  const Cookies = require("js-cookie");
  const flag = Cookies.get("animation-flag");
  if ($("#top-image").length && flag == undefined) {
    $(".ui.page.dimmer").dimmer("show", {
      onShow: setTimeout(function () {
        $(".ui.page.dimmer").dimmer("hide");
      }, 3800),
    });
    anime
      .timeline({ loop: false })
      .add({
        targets: ".ml5 .line",
        opacity: [0.5, 1],
        scaleX: [0, 1],
        easing: "easeInOutExpo",
        duration: 1000,
      })
      .add({
        targets: ".ml5 .line",
        duration: 600,
        easing: "easeOutExpo",
        translateY: (el, i) => -0.625 + 0.625 * 2 * i + "em",
      })
      .add({
        targets: ".ml5 .ampersand",
        opacity: [0, 1],
        scaleY: [0.5, 1],
        easing: "easeOutExpo",
        duration: 600,
        offset: "-=300",
      })
      .add({
        targets: ".ml5 .letters-left",
        opacity: [0, 1],
        translateX: ["0.5em", 0],
        easing: "easeOutExpo",
        duration: 600,
        offset: "-=300",
      })
      .add({
        targets: ".ml5 .letters-right",
        opacity: [0, 1],
        translateX: ["-0.5em", 0],
        easing: "easeOutExpo",
        duration: 600,
        offset: "-=600",
      })
      .add({
        targets: ".ml5",
        opacity: 0,
        duration: 1000,
        easing: "easeOutExpo",
        delay: 1000,
      });
    Cookies.set("animation-flag", "true", { expires: 7 });
  }
});
