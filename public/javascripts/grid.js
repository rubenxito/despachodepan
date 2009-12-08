
(function ($) {
    $(document).ready(function(){
        Tags.prepare();
        Preview.prepare();
        scroll_grid(function () {
            });
    });

    function scroll_grid(callback) {
        if (scrollTime == 0) {
            document.getElementById('grid').scrollLeft = 1300;
        } else {
            $("#grid").animate({
                scrollLeft: 1000
            }, scrollTime, "swing", callback);
        }
    }

    Preview = {
        cache : {},
	
        prepare : function () {
            $(".element").click(function () {
                ids = Preview.PRIVATE.getIDs($(this));
                if ($(this).attr('id').indexOf('main') == 0) {
                    ids[1] = null;
                }
                if ($(this).is('.blank')) {
                    window.open("/ficha/ver/" + ids[0], "ficha")
                } else {
                    Preview.gotoCard(ids[0], ids[1]);
                }
                return false;
            });
	
            $(".preview").mouseover(function () {
                Preview.show($(this));
            });
            $('.preview').mouseout(function () {
                Preview.hide();
            });
	
            $('#content').click(function () {
                Preview.hide();
            });
        },
	
        gotoCard : function(card_id, slide_id) {
            path = "/ficha/ver/" + card_id;
            if (slide_id != null) {
                path += "?imagen=" + slide_id;
            }
            window.location.href = path;
        },
	
        show : function(element) {
            Preview.active = true;
            var id = $(element).attr('id');
            //		console.log("opening preview of " + id + "...");
            $("#preview").hide();
            Preview.currentId = id;
            if (Preview.cache[id] != null) {
                Preview.PRIVATE.showCached(id, element);
            } else {
                Preview.PRIVATE.load(id, element);
            }
        },
		
        hide : function() {
            //		console.log("Hide!");
            Preview.currentId = null;
            $('#preview').hide();
        },
	
        PRIVATE : {
            getIDs : function (element) {
                var id = element.attr('id');
                line_ndx = id.indexOf('-');
                var card_id = id.substring(line_ndx + 1);
                var dbl_ndx = id.indexOf(':') + 1;
                var slide_id = dbl_ndx > 0 ? id.substring(dbl_ndx, line_ndx) : null;
                return [card_id, slide_id];
            },

            showCached : function(id, element) {
                //			console.log("preview cached! (" + id + ")");
                $('#preview').html(Preview.cache[id]);
                Preview.PRIVATE.show(id, element);
            },
		
            show : function (id, element) {
                //			console.log("Preview.currentId: " + Preview.currentId);
                if (id != Preview.currentId) return;

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
                //			console.log("Image width: " + image_width);
                $('.mini_text').width(image_width);
            },

            getOverlayPosition : function(element) {
                return [left, top];
            },

            loadThumbnail : function(id, element) {
                var objImagePreloader = new Image();
                objImagePreloader.onload = function() {
                    objImagePreloader.onload=function(){};
                    //				console.log("we have the image!");
                    Preview.PRIVATE.show(id, element);
                }
                objImagePreloader.src = $('#preview_image').attr('src');
            //			console.log("wating for image....");
            },

            load : function(id, element) {
                ids = Preview.PRIVATE.getIDs(element);
                console.log("loading... /ver/slide?slide=" + ids[1]);
                var preview = $('#preview');
                preview.load("/ver/slide", {
                    slide: ids[1]
                }, function (responseText, textStatus, XMLHttpRequest) {
                    if(textStatus == 'success') {
                        Preview.cache[id] = responseText;
                        console.log("got it!");
                        $('#loading').hide();
                        Preview.PRIVATE.loadThumbnail(id, element);
                    }
                });
            }
        }
    }

    Tags = {
        count : 0,
        cards : {},
        tags : {},

        prepare : function () {
            var elements = $('.tag');
            elements.each(function (index) {
                id = $(this).attr('id');
                cardIDs = tagIDs[id].split(',');
                Tags.tags[id] = [];
                $.each(cardIDs, function() {
                    cardId = parseInt(this.toString());
                    card = Tags.getCard(cardId);
                    card.tags++;
                    Tags.tags[id].push(card);
                });
                Tags.toggleClass($(this));
                Tags.count++;
            });
	
            var categories = $('#categories');
            var alto = 486 -categories.height() + 5;
            $('#tag_space').height(alto);
            categories.show();
		
            $('.tag').click(function() {
                Tags.toggle($(this));
            });
        },
	
        getCard : function(id) {
            var card = Tags.cards[id];
            if (card == null) {
                card = {}
                card.clazz = ".card" + id;
                card.tags = 0;
                Tags.cards[id] = card;
            }
            return card;
        },
	
        selectAll: function() {
            $('.controls').removeClass('highlight');
            $(".tag").each(function() {
                if (!$(this).is(".selected")) {
                    Tags.toggle($(this));
                }
            });
        },

        selectNone : function() {
            $('.controls').addClass('highlight');
            $(".tag").each(function() {
                if ($(this).is(".selected")) {
                    Tags.toggle($(this));
                }
            });
        },


        toggle : function(element) {
            id = element.attr('id');
		
            var isSelected = Tags.toggleClass(element);
            var sum = isSelected ? 1 : -1;
		
            Tags.count += sum;
            if (Tags.count == 0) {
                $('.controls').addClass('highlight');
            } else if (Tags.count == 1 && isSelected) {
                $('.controls').removeClass('highlight');
			
            }
		
            $.each(Tags.tags[id], function() {
                this.tags += sum;
                if (this.tags == 1 && isSelected) {
                    $(this.clazz).fadeIn();
                } else if (this.tags == 0 && !isSelected) {
                    $(this.clazz).fadeOut();
                }
            });
			
        },
		
        toggleClass : function(element) {
            element.toggleClass('selected');
			
            var refid = "#" + element.attr('id') + "blockref";
            $(refid).toggle();
            var reference = element.children('.reference');
            var isSelected = element.is('.selected');
            if (isSelected) {
                element.css('background-color', reference.css('background-color'));
            } else {
                element.css('background-color', 'white');
            }
            return isSelected;
        }
    }
})(jQuery);







