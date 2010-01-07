(function($) {

    $(function() {
        setTimeout("$('.flash').fadeOut(500);", 2000)
    });

    $(function(){
        $("#tag_selector a").click(function() {
            $(this).toggleClass("selected");
            return false;
        });

        $("form.edit_card").submit(function(e) {
            calc_selected_tags();
        });

    });


    function calc_selected_tags() {
        var selectedString = "";
        $("#tag_selector a.selected").each(function() {
            selectedString += this.id;
        });
        $("#selected").val(selectedString);
    }


    $.fn.update = function(name, params) {
        return this.each(function() {
            var self = $(this);
            var url = self.attr('href');
            self.click(function() {
                var form = $('<form action="' + url + '" method="post"><input type="hidden" value="put" name="_method"/></form>');
                form.append($('<input name="authenticity_token" type="hidden" value="'+token+'" />'))
                $.each(params, function(key, value) {
                    var paramName = name + '[' + key + ']'
                    form.append($('<input type="hidden" name="' + paramName +'" value="'+ value +'" />'));
                });
                console.debug(form);
                form.appendTo('body').submit();
                return false;
            });
        });
    };
})(jQuery);