// Equation block

$(document).on('turbolinks:load', function() {
    SirTrevor.Blocks.Equation = (function() {

        var equation_area, equation_paste, label_area, label_paste;
        var block_data = {
            equation: null,
            label: null
        }

        var QUEUE = MathJax.Hub.queue;

        return SirTrevor.Block.extend({

            type: "equation",
            title: function() {
                return 'Equation';
            },
			//icon_name: 'equation',
            icon_name: 'quote',
            pastable: true,
            formatable: false,
            textable: false,


            editorHTML: function() {
                return "<div class='st-equation-block' contenteditable='false' style='text-align:center'>" + "<div class='equation'></div>" + "<p class='equation-label'></p>" + "</div>";
            },

            paste_options: {
                // String; (can use underscore template tags)
                // Defines the HTML for the paste template
                html: "<input type=\"text\" class=\"st-paste-block st-label-paste\" placeholder='Equation Label'>" + "<input type=\"text\" class=\"st-paste-block st-equation-paste\" placeholder='Enter Equation Here'>"
            },


            onBlockRender: function() {
                var this_block = this;

                equation_area = $(this.el).find(".equation");
                equation_area.removeAttr("contenteditable");

                equation_paste = $(this.el).find(".st-equation-paste");
                equation_paste.on("change", function() {
                    this_block.addMath(equation_area[0], equation_paste.val());
                });


                label_area = $(this.el).find(".equation-label");
                label_paste = $(this.el).find(".st-label-paste");
                label_paste.on("change", function() {
                    this_block.addLabel(label_area[0], label_paste.val());
                });

            },

            addMath: function(elem, equation) {
                //create element which indicates that mathjax knows contains math
                var math_script = $("<script type='math/asciimath'>").text(equation);

                //Queue these functions to be called when mathjax is ready
                QUEUE.Push(
                    function() {
                        $(elem).html(math_script);
                    },
                    function() {
                        $(elem).css("visibility", "hidden");
                    }, ["Typeset", MathJax.Hub, elem],
                    function() {
                        $(elem).css("visibility", "visible");
                    }
                );

                //update the data to be sent to the server
                block_data.equation = equation;
                this.setData(block_data);
            },


            addLabel: function(elem, text) {
                $(elem).text(text);

                //update the data to be sent to the server
                block_data.label = text;
                this.setData(block_data);
            },


            onContentPasted: function() {
                //this should trigger the "change" event for whichever element they pasted in
                $(this.el).find(".st-paste-block").blur();
            }

        })
    })(jQuery);
});