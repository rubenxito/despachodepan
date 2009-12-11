(function($) {

    $(function() {
        setTimeout("$('.flash').fadeOut(500);", 2000)
        
    })

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