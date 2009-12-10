
(function() {
    $(document).ready(function(){
        Scroll.prepare();
    });

  

    Scroll = {
        btnDown : null,
        btnUp : null,
        max : null,

        prepare : function () {
            var height = $("#text_flow").height();
            Scroll.max = $("#main_text").height();
            Scroll.btnDown = $("#scroll_down");
            Scroll.btnUp = $("#scroll_up");

            if (height > Scroll.max) {
                Scroll.max -= 20;
                Scroll.btnDown.show();
                $("#main_text").animate({
                    scrollTop: 0
                }, 0);

                $("#scroll_up").click(function() {
                    Scroll.up();
                });
                $("#scroll_down").click(function() {
                    Scroll.down();
                });
            }
        },

        up : function () {
            Scroll.scroll(-1);
        },

        down : function () {
            Scroll.scroll(1);
        },

        scroll : function(factor) {
            Scroll.btnDown.hide();
            Scroll.btnUp.hide();

            // calculate new offset
            var offset = $("#main_text").offset().top - $("#text_flow").offset().top;
            offset += factor * Scroll.max;
            if (offset < 0) offset = 0;


            $("#main_text").animate({
                scrollTop: offset
            }, 2000, "swing", function() {
                if (offset > 0) Scroll.btnUp.show();

                var newOffset = $("#main_text").offset().top - $("#text_flow").offset().top;
                if (newOffset == offset) {
                    Scroll.btnDown.show();
                }
            });
        }
    }

})(jQuery);