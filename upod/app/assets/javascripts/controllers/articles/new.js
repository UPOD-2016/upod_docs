//= require underscore
//= require includes/eventable
//= require includes/sir-trevor

$(function(){
  new SirTrevor.Editor({
    el: $(".js-sir-trevor-instance"),
    blockTypes: ["Text", "List","Link"]
  });
});


  SirTrevor.Blocks.Link = (function(){

    return SirTrevor.Block.extend({

      // more providers at https://gist.github.com/jeffling/a9629ae28e076785a14f
      providers: {
        youtube: {
          regex: /(?:http[s]?:\/\/)?(?:www.)?(?:(?:youtube.com\/watch\?(?:.*)(?:v=))|(?:youtu.be\/))([^&].+)/,
          html: "<iframe src=\"{{protocol}}//www.youtube.com/embed/{{remote_id}}\" width=\"580\" height=\"320\" frameborder=\"0\" allowfullscreen></iframe>"
        }
      },

      type: 'link',
      title: function() { return "Youtube"; },

      pastable: true,

      icon_name: 'video',

      loadData: function(data){
        if (!this.providers.hasOwnProperty(data.source)) { return; }

        if (this.providers[data.source].square) {
          this.$editor.addClass('st-block__editor--with-square-media');
        } else {
          this.$editor.addClass('st-block__editor--with-sixteen-by-nine-media');
        }

        var embed_string = this.providers[data.source].html
          .replace('{{protocol}}', window.location.protocol)
          .replace('{{remote_id}}', data.remote_id)
          .replace('{{width}}', this.$editor.width()); // for videos that can't resize automatically like vine

        this.$editor.html(embed_string);
      },

      onContentPasted: function(event){
        this.handlePaste($(event.target).val());
      },

      handlePaste: function(url){
        if(!_.isURI(url)) {
          return;
        }

        var match, data;

        _.each(this.providers, function(provider, index) {
          match = provider.regex.exec(url);

          if(match !== null && !_.isUndefined(match[1])) {
            data = {
			  url: url,
              source: index,
              video_id: match[1]
            };

            this.setAndLoadData(data);
          }
        }, this);
      }
    });

  })();
 