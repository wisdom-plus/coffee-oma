$(function () {
  $(document).on('turbolinks:load', function () {
    $('.ui.accordion').accordion();
    $('#dimmer-button').on('click', function () {
      $('#dimmer').dimmer('toggle');
      $('#dimmer-product').dimmer('toggle');
    });
    $('.sticky').sticky({
      context: '#sidebar'
    });
    $('.file-form').on('change', function () {
      $('#dimmer').dimmer('hide');
      $('#dimmer-product').dimmer('hide');
      var file = this.files[0];
      var reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function () {
        var image = this.result;
        $('#img-prev').attr({ src: image });
      };
    });
    var InfiniteScroll = require('infinite-scroll');
    var infScroll = new InfiniteScroll('.scroll', {
      path: ".page_next",
      append: ".post",
      history: false,
      prefill: true,
      hideNav: '.pagination'
    });
  });
  $('.close').click(function () {
    $('.flash-message').closest('.flash-message').transition('fade');
  });
  $('.sticky')
    .sticky({
      context: '#sidebar'
    });
  $('.menu .item').tab();
  $('.ui.accordion').accordion();
  $('#dimmer-button').on('click', function () {
    $('#dimmer').dimmer('toggle');
    $('#dimmer-product').dimmer('toggle');
  });
  $('.file-form').on('change', function () {
    $('#dimmer').dimmer('hide');
    $('#dimmer-product').dimmer('hide');
    var file = this.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function () {
      var image = this.result;
      $('#img-prev').attr({ src: image });
    };
  });
  var InfiniteScroll = require('infinite-scroll');
  var infScroll = new InfiniteScroll('.scroll', {
    path: ".page_next",
    append: ".post",
    history: false,
    prefill: true,
    hideNav: ".pagination"
  });
});
