/*
Template Name: Monster Admin
Author: Themedesigner
Email: niravjoshi87@gmail.com
File: js
*/

$(function () {
    "use strict";
    $(function () {
        $(".preloader").fadeOut();
    });
    jQuery(document).on('click', '.mega-dropdown', function (e) {
        e.stopPropagation()
    });
    // ==============================================================
    // This is for the top header part and sidebar part
    // ==============================================================
    var set = function () {
            var width = (window.innerWidth > 0) ? window.innerWidth : this.screen.width;
            var topOffset = 70;
            if (width < 1170) {
                $("body").addClass("mini-sidebar");
                $('.navbar-brand span').hide();
                $('.navbar-brand .icon-logo').show();
                $(".scroll-sidebar, .slimScrollDiv").css("overflow-x", "visible").parent().css("overflow", "visible");
                $(".sidebartoggler i").addClass("ti-menu");
            }
            else {
                $("body").removeClass("mini-sidebar");
                $('.navbar-brand span').show();
                $('.navbar-brand .icon-logo').hide();
                $(".sidebartoggler i").removeClass("ti-menu");
            }

            var height = ((window.innerHeight > 0) ? window.innerHeight : this.screen.height) - 1;
            height = height - topOffset;
            if (height < 1) height = 1;
            if (height > topOffset) {
                $(".page-wrapper").css("min-height", (height) + "px");
            }

    };
    $(window).ready(set);
    $(window).on("resize", set);
    // ==============================================================
    // Theme options
    // ==============================================================
    $(".sidebartoggler").on('click', function () {
        if ($("body").hasClass("mini-sidebar")) {
            $("body").trigger("resize");
            $(".scroll-sidebar, .slimScrollDiv").css("overflow", "hidden").parent().css("overflow", "visible");
            $("body").removeClass("mini-sidebar");
            $('.navbar-brand span').show();
            $('.navbar-brand .icon-logo').hide();
            $(".sidebartoggler i").addClass("ti-menu");
        }
        else {
            $("body").trigger("resize");
            $(".scroll-sidebar, .slimScrollDiv").css("overflow-x", "visible").parent().css("overflow", "visible");
            $("body").addClass("mini-sidebar");
            $('.navbar-brand span').hide();
            $('.navbar-brand .icon-logo').show();
            $(".sidebartoggler i").removeClass("ti-menu");
        }
    });
    // topbar stickey on scroll

    $(".fix-header .topbar").stick_in_parent({

    });


    // this is for close icon when navigation open in mobile view
    $(".nav-toggler").click(function () {
        $("body").toggleClass("show-sidebar");
        $(".nav-toggler i").toggleClass("ti-menu");
        $(".nav-toggler i").addClass("ti-close");
    });
    $(".sidebartoggler").on('click', function () {
        $(".sidebartoggler i").toggleClass("ti-menu");
    });
    // ==============================================================
    // Right sidebar options
    // ==============================================================
    $(".right-side-toggle").click(function () {
        $(".right-sidebar").slideDown(50);
        $(".right-sidebar").toggleClass("shw-rside");

    });

    // ==============================================================
    // Auto select left navbar
    // ==============================================================
    $(function () {
        var url = window.location;
        var element = $('ul#sidebarnav a').filter(function () {
            return this.href == url;
        }).addClass('active').parent().addClass('active');
        while (true) {
            if (element.is('li')) {
                element = element.parent().addClass('in').parent().addClass('active');
            }
            else {
                break;
            }
        }

    });
    // ==============================================================
    //tooltip
    // ==============================================================
    $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
        // ==============================================================
        //Popover
        // ==============================================================
    $(function () {
            $('[data-toggle="popover"]').popover()
        })
        // ==============================================================
        // Sidebarmenu
        // ==============================================================
    $(function () {
        $('#sidebarnav').metisMenu();
    });
    // ==============================================================
    // Slimscrollbars
    // ==============================================================
    $('.scroll-sidebar').slimScroll({
        position: 'left'
        , size: "5px"
        , height: '100%'
        , color: '#dcdcdc'
     });
    $('.message-center').slimScroll({
        position: 'right'
        , size: "5px"

        , color: '#dcdcdc'
     });


    $('.aboutscroll').slimScroll({
        position: 'right'
        , size: "5px"
        , height: '80'
        , color: '#dcdcdc'
     });
    $('.message-scroll').slimScroll({
        position: 'right'
        , size: "5px"
        , height: '570'
        , color: '#dcdcdc'
     });
    $('.chat-box').slimScroll({
        position: 'right'
        , size: "5px"
        , height: '470'
        , color: '#dcdcdc'
     });

    $('.slimscrollright').slimScroll({
        height: '100%'
        , position: 'right'
        , size: "5px"
        , color: '#dcdcdc'
     });

    // ==============================================================
    // Resize all elements
    // ==============================================================
    $("body").trigger("resize");
    // ==============================================================
    // To do list
    // ==============================================================
    $(".list-task li label").click(function () {
        $(this).toggleClass("task-done");
    });

    // ==============================================================
    // Login and Recover Password
    // ==============================================================
    $('#to-recover').on("click", function () {
        $("#loginform").slideUp();
        $("#recoverform").fadeIn();
    });

     // ==============================================================
    // Collapsable cards
    // ==============================================================
    $(document).on("click", ".card-actions a", function(e) {
    if (e.preventDefault(), $(this).hasClass("btn-close")) $(this).parent().parent().parent().fadeOut();
    });

    (function ($, window, document) {
        var panelSelector = '[data-perform="card-collapse"]';
        $(panelSelector).each(function () {
            var $this = $(this)
                , parent = $this.closest('.card')
                , wrapper = parent.find('.card-block')
                , collapseOpts = {
                    toggle: false
                };
            if (!wrapper.length) {
                wrapper = parent.children('.card-heading').nextAll().wrapAll('<div/>').parent().addClass('card-block');
                collapseOpts = {};
            }
            wrapper.collapse(collapseOpts).on('hide.bs.collapse', function () {
                $this.children('i').removeClass('ti-minus').addClass('ti-plus');
            }).on('show.bs.collapse', function () {
                $this.children('i').removeClass('ti-plus').addClass('ti-minus');
            });
        });
        $(document).on('click', panelSelector, function (e) {
            e.preventDefault();
            var parent = $(this).closest('.card');
            var wrapper = parent.find('.card-block');
            wrapper.collapse('toggle');
        });
    }(jQuery, window, document));
});
