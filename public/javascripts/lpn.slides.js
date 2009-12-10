
(function() {
    var displayed = -1;

    $(document).ready(function(){
        $(window).bind('hashchange', function(e) {
            show(getCurrent());
        });

        var imageCount = $("#slides .slide").size();

        $("#slidePrev").click(function() {
            var current = getCurrent();
            if (current > 1) {
                triggerImage(current -1);
            }
            return false;
        });

        $("#slideNext").click(function() {
            var current = getCurrent();
            if (current < imageCount) {
                triggerImage(current + 1);
            }
            return false;
        });

        $(window).trigger('hashchange');
    });


    function getCurrent() {
        var link = $.param.fragment();
        var number = 1;
        if (link.match(/^\/imagen=\d+/)) {
            number = parseInt(link.substring(8));
        }
        return number;
    }

    function triggerImage(number) {
        $.bbq.pushState("#/imagen=" + number);
    }

    function show (number) {
        if (number == displayed) return;
        $("#showImage" + displayed).removeClass('selected');
        $("#slideImage" + displayed).hide();
        var text_box = $("#slide_text");
        text_box.hide();

        displayed = number;

        var image = $("#slideImage"+ number);
        var comment = image.attr('alt');
        if (!comment) comment = '';
        text_box.text(comment);
        var w = image.width();
        text_box.width(w);
        var margin = (415 - w) / 2;
        text_box.css('margin-left', margin);
        image.fadeIn("slow");

        $('#number_control').text(number);

        text_box.fadeIn("slow");
        $("#showImage" + number).addClass('selected');
    }

})(jQuery);