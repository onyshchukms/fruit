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