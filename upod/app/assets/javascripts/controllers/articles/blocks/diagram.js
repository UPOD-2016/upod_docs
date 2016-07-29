$(document).on('turbolinks:load', function() {
    SirTrevor.Blocks.Diagram = (function() {
		var $inputs, $code_area, $caption, $preview_button;
		var $preview_area, $preview_frame, $preview_caption;
		var block_data = { code: null, caption: null };
	
        return SirTrevor.Block.extend({

            type: "diagram",
            title: function() {
                return 'Diagram';
            },
            icon_name: 'image',
            formatable: false,
			textable: false,
			validations: ["codeMustNotBeEmpty"],
			
			codeMustNotBeEmpty: function(){
				var code = $code_area[0]; //need to send setError a plain js element
				if (code.value === ""){
					this.setError(code,"Code area cannot be empty");
				}
			},
			
			
			//Updates the object sent to the server
			toData: function(){
				var dataObj = {}
				dataObj.code = $code_area.val();
				dataObj.caption = $caption.val();
				this.setData(dataObj);
			},

            editorHTML: function() {
			   return "<div class='st-svg-inputs'> \
					<p>Enter javascript, css, and html:</p> \
					<textarea class='st-svg-code' contenteditable='true' style='border:solid;width:100%'></textarea> \
					<span>Add a caption:</span><input type='text' class='st-svg-caption'> \
				</div> \
				<button type='button' class='st-preview-button'>Preview</button> \
				<div class='st-preview' style='display:none'> \
					<iframe class='st-preview-content' height='580' width='100%'></iframe> \
					<p class='st-preview-caption'></p> \
				</div>";
            },

		  
			/* DOM elements are stored as variables
			 * Fields are populated with any data passed to the loadData function when this block was initalized by sir trevor
			 * Events are added to inputs to update the preview and data object sent to server
			 * Events added to toggle preview of the diagram
			*/
            onBlockRender: function() {
				var this_block = this;

				//User inputs (code_area and caption)
				$inputs = $(this.el).find(".st-svg-inputs");
				
				//Where user enters the diagram code
				$code_area = $(this.el).find(".st-svg-code");
				
				//Where user enters the caption for diagram
				$caption = $(this.el).find(".st-svg-caption");
				
				//See preview of diagram
				$preview_button = $(this.el).find(".st-preview-button");
				
				//Container for diagram preview
				$preview_area = $(this.el).find(".st-preview");
				
				//Iframe the diagram is inserted into
				$preview_frame = $(this.el).find(".st-preview-content");
				$preview_caption = $(this.el).find(".st-preview-caption");

				//Check if data has been loaded by sir trevor using the loadData method
				var preloaded_data = this.getBlockData();
				if (!jQuery.isEmptyObject(preloaded_data)){
					//add data to inputs and preview area using preloaded_data
					this.setBlock(preloaded_data.code,preloaded_data.caption);
				}
				
				//User inputs diagram code, update the iframe preview
				$code_area.on("change",function(){
					var code = $(this).val();
					this_block.setDiagram(code,$preview_frame[0]);
				});
				
				//User inputs a caption, update the caption in the preview
				$caption.on("change",function(){
					var caption = $(this).val()
					this_block.setCaption(caption);
				});
				
				$preview_button.on("click",function(e){
					e.preventDefault();
					//Show preview of code and hide inputs
					if ($preview_area.css("display") == "none"){						
						//Display the preview button and hide the input fields
						$preview_area.css("display","block");
						$inputs.css("display","none");
						$(this).text("Edit");
					}
					//Hide preview and show inputs
					else {
						$preview_area.css("display","none");
						$inputs.css("display","block");
						$(this).text("Preview");
					}
				});
				
            },
			
			//used to initialize block with preloaded-data
			setBlock: function(code,caption_text){
				$code_area.val(code);
				this.setDiagram(code);
				$caption.val(caption_text);
				this.setCaption(caption_text);
			},
			
			setDiagram: function(html){
				//write the html into the iframe preview
				var doc = $preview_frame[0].contentWindow.document;
				doc.open();
				doc.write(html);
				doc.close();
				
				//Update object sent to server
				this.toData(); 
			},
			
			setCaption: function(caption_text){
				//add a caption below the diagram
				$preview_caption.text(caption_text);
				//Update object sent to server
				this.toData();
			}
        })
    })(jQuery);
});