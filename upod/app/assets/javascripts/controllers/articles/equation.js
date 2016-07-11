// Equation block

SirTrevor.Blocks.Equation = (function() {

    var textBlock;
    var QUEUE = MathJax.Hub.queue;

    return SirTrevor.Block.extend({

        type: "Equation",
        title: function() {
            return 'Equation';
        },
        icon_name: 'equation',
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

        beforeBlockRender: function() {},

        addMath: function(target, equation) {
            QUEUE.Push(
                function() {
                    $(target).text("`" + equation + "`");
                }, ["Typeset", MathJax.Hub, target]
            );
        },


        onBlockRender: function() {
            textBlock = $(this.getTextBlock());
            textBlock.attr("contenteditable", 'false');

            var that = this;

            $(this.el).find(".st-paste-block").on("change", function() {
                //call addMath using the value from the paste-block element as the equation
                that.addMath(textBlock, $(this).val());
            });
        },

        loadData: function(data) {
            consoloe.log("loadData says: " + data);
        }


    })
})(jQuery);