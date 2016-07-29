
$(document).on('turbolinks:load', function() {


    SirTrevor.Blocks.EquationText = (function() {

		var $text_area;
		
        return SirTrevor.Block.extend({

            type: "equation_text",
            title: function() {
                return 'Text';
            },

            icon_name: 'text',
            formatable: false,
            textable: false,
            paste_options: { html: null },
			
			//Extracts and sets data that will be sent to the server
			toData: function(){
				var objData = {};
				objData.text = $text_area.text();
				this.setData(objData);
			},
			
			//Will populate the block/fields with pre-loaded data
			setBlock: function(data){
				$text_area.text(data.text);
			},

            editorHTML: function() {
                return "<div class='equation-text-block' contenteditable='true'></div>";	
            },

            onBlockRender: function() {
				var this_block = this;
				$text_area = $(this.el).find(".equation-text-block");
				

				
				//Registers an equivalent of a "change" event listener to the contenteditable $text_area
				//Code from http://stackoverflow.com/questions/1391278/contenteditable-change-events
				$text_area.on('focus', function() {
					var $this = $(this);
					
					//Display the text entered by the user before it was rendered into math
					this_block.showRawText();
					
					//Store the current text
					$this.data('before', $this.text());
				});
					
				//Events that indicate the contents of a contenteditable element may have changed
				$text_area.on('blur paste', function() {
					var $this = $(this);
					
					//Check that the previously stored text is different after a paste/blur
					if ($this.data('before') !== $this.text()) {
						//update the current text in this element
						$this.data('before', $this.text());
						
						//Update the raw text entered by the user that will be sent to the server before mathjax modifies it
						this_block.toData();
					}
					//Render any delimited equations as mathjax
					this_block.addInlineMath($this);
				});
				
				//Check if data has already been loaded by sir trevor
				var preloaded_data = this.getBlockData();
				if (!jQuery.isEmptyObject(preloaded_data)){
					//add data to inputs and preview area using preloaded_data
					this.setBlock(preloaded_data);
					this_block.addInlineMath($text_area);
				}
				else {
					$text_area.focus();
				}
            },
		
			//Converts the text and equations back into a form that can be edited by the user
			showRawText: function(){
				//Remove all elements from the text_area so that there are no elements that were created by mathjax
				$text_area.empty();
				//Show the raw text entered by the user before it was converted into mathjax
				$text_area.text(this.getBlockData().text);
			},
			
			addInlineMath: function($elements){
				MathJax.Hub.queue.Push(["Typeset",MathJax.Hub,$elements.get()]);
			}
        })
    })(jQuery);
});