$(function () {
  $(document).on('turbolinks:load', function () {
    $('.ui.accordion').accordion();
    $('#dimmer-button').on('click', function () {
      $('#dimmer').dimmer('toggle');
    });
    $('.file-form').on('change', function () {
      $('#dimmer').dimmer('hide');
      var file = this.files[0];
      var reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function () {
        var image = this.result;
        $('#img_prev').attr({ src: image });
      };
    });
  });
  $('.close').click(function () {
    $('.flash-message').closest('.flash-message').transition('fade');
  });
  $('.sticky')
    .sticky({
      context: '#example1'
    });
  $('.menu .item').tab();
  $('.ui.accordion').accordion();
  $('#dimmer-button').on('click', function () {
    $('#dimmer').dimmer('toggle');
  })
  $('.file-form').on('change', function () {
    $('#dimmer').dimmer('hide');
    var file = this.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function () {
      var image = this.result;
      $('#img_prev').attr({ src: image });
    };
  });
});
