
(function() {
    $(document).ready(function(){
        Scroll.prepare();

        Slide.first = first_image;
        Slide.last = last_image;
        Slide.show(show_image);
    });

    indice = function () {
        var h = window.history;
        if ( h.length ) { // if there is a history
            h.back();     // equivalent to clicking back button
        } else {
            window.location.href = "/";
        }
    }


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

	

    Slide = {
        current : -1,

        show : function (number) {
            if (Slide.current == number) return;
            $("#showImage" + Slide.current).removeClass('selected');
            $("#slideImage" + Slide.current).hide();
            var text_box = $("#slide_text");
            text_box.hide();
	
            Slide.current = number;
            var image = $("#slideImage"+ number);
            var comment = image.attr('alt');
            if (!comment) comment = '';
            text_box.text(comment);
            var w = image.width();
            text_box.width(w);
            var margin = (415 - w) / 2;
            text_box.css('margin-left', margin);
            image.fadeIn("slow");
		
            $('#number_control').text($('#slideNumber' + number).text());
		
            text_box.fadeIn("slow");
            $("#showImage" + number).addClass('selected');
        },
	
        goNext : function() {
            if (Slide.current != Slide.last) {
                var nextDiv = $("#slideImage" + Slide.current).next();
                var nextId = nextDiv.attr('id').substring(10);
                Slide.show(parseInt(nextId));
            }	else {
                Slide.goFirst();
            }
        },
	
        goPrev : function () {
            if (Slide.current != Slide.first) {
                var prevDiv = $("#slideImage" + Slide.current).prev();
                var nextId = prevDiv.attr('id').substring(10);
                Slide.show(parseInt(nextId));
            } else {
                Slide.goLast();
            }
        },
	
        goFirst : function () {
            Slide.show(Slide.first);
        },
	
        goLast : function () {
            Slide.show(Slide.last);
        },
	
        // remove
        exists : function(number) {
            return $("#slideImage" + number).size() == 1;
        }
    }

})(jQuery);