$(function () {

    function navbar_affix() {
        var screen_width = $(window).width();
        var navbar_selector = $('.navbar-custom');
        if (screen_width >= 768) {
            navbar_selector.affix({
                offset: {
                    top: $('header').height()
                }
            });
            navbar_selector.children().addClass('navbar-collapse');
            navbar_selector.removeClass('sb-slidebar sb-left');
        } else {
            $(window).off('.affix');
            navbar_selector.removeData('bs.affix').removeClass('affix affix-top affix-bottom');
            navbar_selector.children().removeClass('navbar-collapse');
            navbar_selector.addClass('sb-slidebar sb-left');
        }
    }

    function move_search() {
        var screen_width = $(window).width();
        var search_form = $('#search-form');
        var search_placeholder_xs = $('#block-search-form-xs');
        var search_placeholder_sm = $('#block-search-form-sm');
        if (screen_width >= 768) {
            search_placeholder_xs.hide();
            search_placeholder_sm.show();
            search_form.appendTo(search_placeholder_sm);
        } else {
            search_placeholder_sm.hide();
            search_placeholder_xs.show();
            search_form.appendTo(search_placeholder_xs);
        }
    }

    function toggle_benefits_tooltip() {
      var screen_width = $(window).width();
      var benefit_selector = $('.benefit');

      if (screen_width >= 992) {
        benefit_selector.tooltip('disable');
      } else {
        benefit_selector.tooltip('enable');
      }

    }

    $(document).ready(function () {
        navbar_affix();


        var tooltip_selector = $('*[data-toggle="tooltip"]');
        tooltip_selector.tooltip();
        tooltip_selector.on('shown.bs.tooltip', function () {
            var tooltip_id = jQuery(this).attr('aria-describedby');
            var tooltip_color = jQuery(this).data('tooltip-color');
            $('#' + tooltip_id + '> .tooltip-inner').addClass(tooltip_color);
        });
        $('.block-container-selects').backstretch([
            "images/slider-first.png",
            "images/slider-second.jpg"
        ], {duration: 10000, fade: 750});


        var swipebars = new $.slidebars({
            disableOver: 767,
            hideControlClasses: true,
            siteClose: false
        });

        var html_selector = $('html');

        // Left Swipe
        $(document).on('swipeleft', function (event) {
            if (html_selector.hasClass('sb-active-left')) {
                // The left Slidebar is open, close it.
                swipebars.slidebars.close();
            } else if (html_selector.hasClass('sb-active-right')) {
                // The right Slidebar is open, do nothing.
            } else {
                // No Slidebar is open, open the right.
                swipebars.slidebars.open('right');
            }
        });

        // Right Swipe
        $(document).on('swiperight', function (event) {
            if (html_selector.hasClass('sb-active-left')) {
                // The left Slidebar is open, do nothing.
            } else if (html_selector.hasClass('sb-active-right')) {
                // The right Slidebar is open, close it.
                swipebars.slidebars.close();
            } else {
                // No Slidebar is open, open the right.
                swipebars.slidebars.open('left');
            }
        });

        var closeSlidebars = function (event) {
            if (html_selector.hasClass('sb-active-left') || html_selector.hasClass('sb-active-right')) {
                event.preventDefault();
                event.stopPropagation();
                swipebars.slidebars.close();
            }
        };

        // Click or Tap to Close
        $('.sb-slide').on('click tap', closeSlidebars);

        var benefit_selector = $('.benefit');
        benefit_selector.tooltip({
          placement: 'bottom',
          title: function(){
            return $(this).children('span').text()
          }
        });
        toggle_benefits_tooltip();
    });

    $(window).on('resize', function () {
        navbar_affix();
        toggle_benefits_tooltip();
    });
});
