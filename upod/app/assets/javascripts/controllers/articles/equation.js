// Equation block

SirTrevor.Blocks.Equation = (function(){
	
	var text_block;
	var QUEUE = MathJax.Hub.queue;
		
	return SirTrevor.Block.extend({

    type: "Equation",
    title: function() { return 'Block Equation'; },
	icon_name: 'quote',
	pastable: true,
	formatable: false,
	
	
	editorHTML: function() {
      return "<div class='st-text-block' contenteditable='false'></div>";
    },
	
	paste_options: {
      // String; (can use underscore template tags)
      // Defines the HTML for the paste template
      html: "<input type=\"text\" class=\"st-block__paste-input st-paste-block\" placeholder='Enter Equation Here'>"
    },
	
	beforeBlockRender: function(){
	},
	
	addMath: function(target, equation){
		QUEUE.Push(
			function(){ $(target).text("`" + equation + "`"); },
			["Typeset",MathJax.Hub,target]
		);
	},
	
	
	onBlockRender: function(){
		text_block = $(this.getTextBlock());
		text_block.attr("contenteditable",'false');
		
		var this_block = this; 
		
		$(this.el).find(".st-paste-block").on("change",function(){
			//call addMath using the value from the paste-block element as the equation
			this_block.addMath(text_block,$(this).val());
		});
	},
	
	loadData: function(data){
      consoloe.log("loadData says: " + data);
    }
	

  })
})(jQuery);