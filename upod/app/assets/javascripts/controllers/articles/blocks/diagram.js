// Diagram Block

$(document).on('turbolinks:load', function() {
    SirTrevor.Blocks.Diagram = (function() {
	
		var inputs, code_area, caption, preview_button;
		var preview_area, preview_frame, preview_caption;
		var block_data = { code: null, caption: null };
	
        return SirTrevor.Block.extend({

            type: "diagram",
            title: function() {
                return 'Diagram';
            },
            icon_name: 'image',
            formatable: false,
			textable: false,


            editorHTML: function() {
			   return "<div class='st-svg-inputs'> \
					<p>Enter javascript, css, and html</p> \
					<textarea class='st-svg-code' contenteditable='true' style='border:solid;'></textarea> \
					<span>Add a caption:</span><input type='text' class='st-svg-caption'> \
				</div> \
				<button type='button' class='st-preview-button'>Preview</button> \
				<div class='st-preview' style='display:none'> \
					<iframe class='st-preview-content' height='580' width='100%'></iframe> \
					<p class='st-preview-caption'></p> \
				</div>";
            },

		  
            onBlockRender: function() {
				var this_block = this;
				
				inputs = $(this.el).find(".st-svg-inputs");
				code_area = $(this.el).find(".st-svg-code");
				caption = $(this.el).find(".st-svg-caption");
				preview_button = $(this.el).find(".st-preview-button");
				
				preview_area = $(this.el).find(".st-preview");
				preview_frame = $(this.el).find(".st-preview-content");
				preview_caption = $(this.el).find(".st-preview-caption");
		
				code_area.on("change",function(){
					this_block.setDiagram($(this).val(),preview_frame[0]);
				});
				
				
				caption.on("change",function(){
					this_block.setCaption($(this).val());
				});
				
				preview_button.on("click",function(e){
					e.preventDefault();
					
					//Show preview of code and hide inputs
					if (preview_area.css("display") == "none"){
						//add the text from the textarea as the html to the preview iframe
						
						//add a caption to the diagram
						this_block.setCaption(caption.val());
						
						//Display the preview button and hide the input fields
						preview_area.css("display","block");
						inputs.css("display","none");
		
						$(this).text("Edit");
					}
					//Hide preview and show inputs
					else {
						preview_area.css("display","none");
						inputs.css("display","block");
						$(this).text("Preview");
					}
				});
				
            },
			
			setDiagram: function(html){
				var doc = preview_frame[0].contentWindow.document;
				doc.open();
				doc.write(html);
				doc.close();
				
				block_data.code = html;
				this.setData(block_data);
			},
			
			setCaption: function(caption_text){
				preview_caption.text(caption_text);
				block_data.caption = caption_text;
				this.setData(block_data);
			}
        })
    })(jQuery);
});