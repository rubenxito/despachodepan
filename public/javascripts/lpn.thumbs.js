(function($) {

    var cache = {};
    var currentId = null;

    function loadImage(id, element) {
        var img = new Image();
        img.onload = function() {
            show(id, element);
        }
        img.src = $('#preview_image').attr('src');
    }

    function load(id, element) {
        var ids = id.split('-');
        var preview = $("#preview");
        preview.load("/thumb/" + ids[1], function(response, status) {
            if(status == 'success') {
                cache[id] = response;
                loadImage(id, element);
            }
        });
    }

    function show(id, element) {
        // you get too late, baby
        if (id != currentId) return;

        var preview = $('#preview');
        var left = parseInt(element.css('left')) + 12;
        var top = parseInt(element.css('top')) - 3;

        if (top > 240) {
            top -= preview.height() - 13;
        }
        preview.css('left', left);
        preview.css('top', top);
        preview.show();
        var image_width = $('#preview_image').width();
        $('.mini_text').width(image_width);
    }

    function hide() {
        $("#preview").hide();
        currentId = null;
    }

    function showCached(id, element) {
        $("#preview").html(cache[id]);
        show(id, element);
    }


    $(function() {
        $(".preview").hover(function() {
            var self = $(this);
            var id = self.attr('id');
            currentId = id;
            if (cache[id] != null) {
                showCached(id, self)
            } else {
                load(id, self);
            }
        }, function() {
            hide();
        });
    });

    $("#content").click(function() {
        hide();
    })
})(jQuery);