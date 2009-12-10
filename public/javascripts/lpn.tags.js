(function () {
    $(function() {
        $("#tags .tag-link").each(function() {
            var self = $(this);
            self.click(function() {
                var id = $(this).attr('id').substring(4);
                activateTag(id);
                showProjects();
            });
        });
    });

    function activateTag(id) {
        var indicator = $("#ind-" + id);
        indicator.toggleClass('active');
        var color = "white";
        if (indicator.hasClass('active')) {
            color = indicator.css('color');
        }
        indicator.css('background-color', color);
    }

    function showProjects() {
        var active = $("#tags .active");
        if (active.size() == 0) {
            $("#grid .card").fadeIn();
        } else {
            var show = [];
            var hide = cardIDs.slice();
            active.each(function() {
                var id = $(this).attr('id').substring(4);
                var cards = tagToCardIDs[id];
                hide = diffArrays(hide, cards);
                show = show.concat(cards);
            });
            hideCards(hide);
            showCards(show);
        }
    }

    var showCards = function(cardIDs) {
        //console.log("show", cardIDs);
        $.each(cardIDs, function() {
            $(".card" + this).fadeIn();
        });
    }

    var hideCards = function(cardIDs) {
        //console.log("hide", cardIDs);
        $.each(cardIDs, function() {
            $(".card" + this).fadeOut();
        });
    }

    function diffArrays (A, B) {
        var strA = ":" + A.join("::") + ":";
        var strB = ":" +  B.join(":|:") + ":";
        var reg = new RegExp("(" + strB + ")","gi");
        var strDiff = strA.replace(reg,"").replace(/^:/,"").replace(/:$/,"");
        var arrDiff = strDiff.split("::");
        return arrDiff;
    }

})(jQuery);