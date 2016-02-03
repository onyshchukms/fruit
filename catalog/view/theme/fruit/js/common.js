function getURLVar(key) {
    var value = [];

    var query = String(document.location).split('?');

    if (query[1]) {
        var part = query[1].split('&');

        for (var i = 0; i < part.length; i++) {
            var data = part[i].split('=');

            if (data[0] && data[1]) {
                value[data[0]] = data[1];
            }
        }

        if (value[key]) {
            return value[key];
        } else {
            return '';
        }
    } else {        // Изменения для seo_url от Русской сборки OpenCart 2x
        query = String(document.location.pathname).split('/');
        if (query[query.length - 1] == 'cart') value['route'] = 'checkout/cart';
        if (query[query.length - 1] == 'checkout') value['route'] = 'checkout/checkout';

        if (value[key]) {
            return value[key];
        } else {
            return '';
        }
    }
}

$(function () {

    $(window).scroll(function () {
        var scroll = $(window).scrollTop();
        if (scroll > 15) {
            $(".scroll-menu").addClass('show');
        } else {
            $(".scroll-menu").removeClass('show');
        }

        if (scroll < 15) {
            $('.drop-down.basket').removeClass('active');
        } else if (scroll > 15) {
            $('header .drop-down.basket').removeClass('active');
        }

    });

    $(window).resize(function () {
        var width = $(window).width();
        if (width > 1100) {
            $('.scroll-menu nav').show();
        } else if (width < 1100) {
            $('.scroll-menu nav').hide();
            $('.nav-button').removeClass('active');
        }
    });

    $(".nav-button").click(function () {
        $(this).toggleClass('active');
        $('.scroll-menu nav').slideToggle();
    });

    $(".scroll-menu nav a").click(function () {
        if ($(window).width() < 1100) {
            $('.scroll-menu nav').slideUp();
            $('.nav-button').removeClass('active');
        }
    });

    /* FORMS */
    $(".basket-btn").click(function () {
        $(this).parent().find('.basket').toggleClass("active");
    });

    $(".basket.drop-down .line input[type='text'], .input-wrap input").each(function () {
        $(this).val();

        $(this).bind("change keyup input click", function () {
            if (this.value.match(/[^0-9]/g)) {
                this.value = this.value.replace(/[^0-9]/g, '');
            }
        });

        $(this).on('blur', function () {
            var val = $(this).val();

            if (val === '' || val == 0) {
                $(this).val(1);
            }
        });
    });

    $('.input-wrap .minus').click(function () {
        var $input = $(this).parent().find('input');
        var count = parseInt($input.val()) - 1;
        count = count < 1 ? 1 : count;
        $input.val(count);
        $input.change();
        return false;
    });

    $('.input-wrap .plus').click(function () {
        var $input = $(this).parent().find('input');
        $input.val(parseInt($input.val()) + 1);
        $input.change();
        return false;
    });

    $(".index-title .link").hover(
        function () {
            var link = $(this).attr('data-link');

            $(this).addClass("active");
            $('.index-title').find('.link-bg.' + link).addClass('show');
        },
        function () {
            $(this).removeClass("active");
            $('.index-title .link-bg').removeClass('show');
        }
    );

    $(".scroll-to").mPageScroll2id({
        offset: function () {
            return 70;
        }
    });

});

// Cart add remove functions
var cart = {
    'add': function(product_id, quantity) {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
            dataType: 'json',
            success: function(json) {

                if (json['redirect']) {
                    location = json['redirect'];
                }

                if (json['success']) {
                    //$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    // Need to set timeout otherwise it wont update the total
                    setTimeout(function () {
                        $('.header-cart > .basket-btn').html('<i></i>' + json['total']);
                    }, 100);

                    //$('html, body').animate({ scrollTop: 0 }, 'slow');

                    $('.header-cart > .basket').load('index.php?route=common/cart/info .basket > div');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    },
    'update': function(key, quantity) {
        $.ajax({
            url: 'index.php?route=checkout/cart/edit',
            type: 'post',
            data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
            dataType: 'json',
            beforeSend: function() {
                //$('#cart > button').button('loading');
            },
            complete: function() {
                //$('#cart > button').button('reset');
            },
            success: function(json) {
                // Need to set timeout otherwise it wont update the total
                setTimeout(function () {
                    $('.header-cart > .basket-btn').html('<i></i>' + json['total']);
                }, 100);

                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    $('.header-cart > .basket').load('index.php?route=common/cart/info .basket > div');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    },
    'remove': function(key) {
        $.ajax({
            url: 'index.php?route=checkout/cart/remove',
            type: 'post',
            data: 'key=' + key,
            dataType: 'json',
            beforeSend: function() {
                //$('#cart > button').button('loading');
            },
            complete: function() {
                //$('#cart > button').button('reset');
            },
            success: function(json) {
                // Need to set timeout otherwise it wont update the total
                setTimeout(function () {
                    $('.header-cart > .basket-btn').html('<i></i>' + json['total']);
                }, 100);

                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    $('.header-cart > .basket').load('index.php?route=common/cart/info .basket > div');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }
};