$(document).on("turbolinks:load", function () {
  // Action textを変更
  var Trix = require("trix");
  require("@rails/actiontext");
  Trix.config.blockAttributes.default = {
    tagName: "p",
  };
  Trix.config.blockAttributes.heading2 = {
    tagName: "h2",
  };
  Trix.config.blockAttributes.heading3 = {
    tagName: "h3",
  };
  addEventListener("trix-initialize", function (event) {
    var buttonHTML =
      '<button class="trix-button" type="button" data-trix-attribute="heading2">h2</button>';
    var buttonHTML3 =
      '<button class="trix-button" type="button" data-trix-attribute="heading3">h3</button>';
    event.target.toolbarElement
      .querySelector(".trix-button--icon-heading-1")
      .insertAdjacentHTML("afterend", buttonHTML3);
    event.target.toolbarElement
      .querySelector(".trix-button--icon-heading-1")
      .insertAdjacentHTML("afterend", buttonHTML);
  });
});
