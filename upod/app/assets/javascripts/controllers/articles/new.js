//= require underscore
//= require includes/eventable
//= require includes/sir-trevor

$(function(){
  new SirTrevor.Editor({
    el: $(".js-sir-trevor-instance"),
    blockTypes: ["Text", "List", "Video", "Quote", "Iframe"]
  });
});