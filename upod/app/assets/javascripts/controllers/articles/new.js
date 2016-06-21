 //= require showdown
$(document).ready(function() {
  var $editor = $('.editor'), $preview = $('.preview');
  var converter = new Showdown.converter()
  $editor.on('keyup', function() {
    var html = converter.makeHtml($(this).val());
    $preview.html(html);
  });
});