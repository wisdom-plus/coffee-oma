$(function () {
  $('.close').click(function () {
    $('.flash-message').closest('.flash-message').transition('fade');
  })
  $('.sticky')
    .sticky({
      context: '#example1'
    })
    ;
  $('.menu .item').tab();
});
