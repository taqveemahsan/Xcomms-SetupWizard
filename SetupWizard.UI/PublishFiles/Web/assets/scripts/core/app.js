var App = function () {
    var isRTL = false; var isIE8 = false; var isIE9 = false; var isIE10 = false; var sidebarWidth = 225; var sidebarCollapsedWidth = 35; var responsiveHandlers = []; var layoutColorCodes = { 'blue': '#4b8df8', 'red': '#e02222', 'green': '#35aa47', 'purple': '#852b99', 'grey': '#555555', 'light-grey': '#fafafa', 'yellow': '#ffb848' }; var _getViewPort = function () {
        var e = window, a = 'inner'; if (!('innerWidth' in window)) { a = 'client'; e = document.documentElement || document.body; }
        return { width: e[a + 'Width'], height: e[a + 'Height'] }
    }
    var handleInit = function () {
        if ($('body').css('direction') === 'rtl') { isRTL = true; }
        isIE8 = !!navigator.userAgent.match(/MSIE 8.0/); isIE9 = !!navigator.userAgent.match(/MSIE 9.0/); isIE10 = !!navigator.userAgent.match(/MSIE 10.0/); if (isIE10) { jQuery('html').addClass('ie10'); }
        if (isIE10 || isIE9 || isIE8) { jQuery('html').addClass('ie'); }
        var deviceAgent = navigator.userAgent.toLowerCase(); if (deviceAgent.match(/(iphone|ipod|ipad)/)) { $(document).on('focus', 'input, textarea', function () { $('.page-header').hide(); $('.page-footer').hide(); }); $(document).on('blur', 'input, textarea', function () { $('.page-header').show(); $('.page-footer').show(); }); }
    }
    var handleSidebarState = function () { var viewport = _getViewPort(); if (viewport.width < 992) { $('body').removeClass("page-sidebar-closed"); } }
    var runResponsiveHandlers = function () { for (var i = 0; i < responsiveHandlers.length; i++) { var each = responsiveHandlers[i]; each.call(); } }
    var handleResponsive = function () { handleSidebarState(); handleSidebarAndContentHeight(); handleFixedSidebar(); runResponsiveHandlers(); }
    var handleResponsiveOnInit = function () { handleSidebarState(); handleSidebarAndContentHeight(); }
    var handleResponsiveOnResize = function () {
        var resize; if (isIE8) {
            var currheight; $(window).resize(function () {
                if (currheight == document.documentElement.clientHeight) { return; }
                if (resize) { clearTimeout(resize); }
                resize = setTimeout(function () { handleResponsive(); }, 50); currheight = document.documentElement.clientHeight;
            });
        } else {
            $(window).resize(function () {
                if (resize) { clearTimeout(resize); }
                resize = setTimeout(function () { handleResponsive(); }, 50);
            });
        }
    }
    var handleSidebarAndContentHeight = function () {
        var content = $('.page-content'); var sidebar = $('.page-sidebar'); var body = $('body'); var height; if (body.hasClass("page-footer-fixed") === true && body.hasClass("page-sidebar-fixed") === false) { var available_height = $(window).height() - $('.footer').outerHeight() - $('.header').outerHeight(); if (content.height() < available_height) { content.attr('style', 'min-height:' + available_height + 'px !important'); } } else {
            if (body.hasClass('page-sidebar-fixed')) { height = _calculateFixedSidebarViewportHeight(); } else { height = sidebar.height() + 20; var headerHeight = $('.header').outerHeight(); var footerHeight = $('.footer').outerHeight(); if ($(window).width() > 1024 && (height + headerHeight + footerHeight) < $(window).height()) { height = $(window).height() - headerHeight - footerHeight; } }
            if (height >= content.height()) { content.attr('style', 'min-height:' + height + 'px !important'); }
        }
    }
    var handleSidebarMenu = function () {
        jQuery('.page-sidebar').on('click', 'li > a', function (e) {
            if ($(this).next().hasClass('sub-menu') == false) {
                if ($('.btn-navbar').hasClass('collapsed') == false) { $('.btn-navbar').click(); }
                return;
            }
            if ($(this).next().hasClass('sub-menu always-open')) { return; }
            var parent = $(this).parent().parent(); var the = $(this); var menu = $('.page-sidebar-menu'); var sub = jQuery(this).next(); var autoScroll = menu.data("auto-scroll") ? menu.data("auto-scroll") : true; var slideSpeed = menu.data("slide-speed") ? parseInt(menu.data("slide-speed")) : 200; parent.children('li.open').children('a').children('.arrow').removeClass('open'); parent.children('li.open').children('.sub-menu:not(.always-open)').slideUp(200); parent.children('li.open').removeClass('open'); var slideOffeset = -200; if (sub.is(":visible")) {
                jQuery('.arrow', jQuery(this)).removeClass("open"); jQuery(this).parent().removeClass("open"); sub.slideUp(slideSpeed, function () {
                    if (autoScroll == true && $('body').hasClass('page-sidebar-closed') == false) { if ($('body').hasClass('page-sidebar-fixed')) { menu.slimScroll({ 'scrollTo': (the.position()).top }); } else { App.scrollTo(the, slideOffeset); } }
                    handleSidebarAndContentHeight();
                });
            } else {
                jQuery('.arrow', jQuery(this)).addClass("open"); jQuery(this).parent().addClass("open"); sub.slideDown(slideSpeed, function () {
                    if (autoScroll == true && $('body').hasClass('page-sidebar-closed') == false) { if ($('body').hasClass('page-sidebar-fixed')) { menu.slimScroll({ 'scrollTo': (the.position()).top }); } else { App.scrollTo(the, slideOffeset); } }
                    handleSidebarAndContentHeight();
                });
            }
            e.preventDefault();
        }); jQuery('.page-sidebar').on('click', ' li > a.ajaxify', function (e) {
            e.preventDefault(); App.scrollTop(); var url = $(this).attr("href"); var menuContainer = jQuery('.page-sidebar ul'); var pageContent = $('.page-content'); var pageContentBody = $('.page-content .page-content-body'); menuContainer.children('li.active').removeClass('active'); menuContainer.children('arrow.open').removeClass('open'); $(this).parents('li').each(function () { $(this).addClass('active'); $(this).children('a > span.arrow').addClass('open'); }); $(this).parents('li').addClass('active'); App.startPageLoading(); if ($(window).width() <= 991 && $('.page-sidebar').hasClass("in")) { $('.navbar-toggle').click(); }
            $.ajax({ type: "GET", cache: false, url: url, dataType: "html", success: function (res) { App.stopPageLoading(); pageContentBody.html(res); App.fixContentHeight(); App.initAjax(); }, error: function (xhr, ajaxOptions, thrownError) { pageContentBody.html('<h4>Could not load the requested content.</h4>'); App.stopPageLoading(); } });
        }); jQuery('.page-content').on('click', '.ajaxify', function (e) {
            e.preventDefault(); App.scrollTop(); var url = $(this).attr("href"); var pageContent = $('.page-content'); var pageContentBody = $('.page-content .page-content-body'); App.startPageLoading(); if ($(window).width() <= 991 && $('.page-sidebar').hasClass("in")) { $('.navbar-toggle').click(); }
            $.ajax({ type: "GET", cache: false, url: url, dataType: "html", success: function (res) { App.stopPageLoading(); pageContentBody.html(res); App.fixContentHeight(); App.initAjax(); }, error: function (xhr, ajaxOptions, thrownError) { pageContentBody.html('<h4>Could not load the requested content.</h4>'); App.stopPageLoading(); } });
        });
    }
    var _calculateFixedSidebarViewportHeight = function () {
        var sidebarHeight = $(window).height() - $('.header').height() + 1; if ($('body').hasClass("page-footer-fixed")) { sidebarHeight = sidebarHeight - $('.footer').outerHeight(); }
        return sidebarHeight;
    }
    var handleFixedSidebar = function () {
        var menu = $('.page-sidebar-menu'); if (menu.parent('.slimScrollDiv').size() === 1) { menu.slimScroll({ destroy: true }); menu.removeAttr('style'); $('.page-sidebar').removeAttr('style'); }
        if ($('.page-sidebar-fixed').size() === 0) { handleSidebarAndContentHeight(); return; }
        var viewport = _getViewPort(); if (viewport.width >= 992) { var sidebarHeight = _calculateFixedSidebarViewportHeight(); menu.slimScroll({ size: '7px', color: '#a1b2bd', opacity: .3, position: isRTL ? 'left' : 'right', height: sidebarHeight, allowPageScroll: false, disableFadeOut: false }); handleSidebarAndContentHeight(); }
    }
    var handleFixedSidebarHoverable = function () {
        if ($('body').hasClass('page-sidebar-fixed') === false) { return; }
        $('.page-sidebar').off('mouseenter').on('mouseenter', function () {
            var body = $('body'); if ((body.hasClass('page-sidebar-closed') === false || body.hasClass('page-sidebar-fixed') === false) || $(this).hasClass('page-sidebar-hovering')) { return; }
            body.removeClass('page-sidebar-closed').addClass('page-sidebar-hover-on'); if (body.hasClass("page-sidebar-reversed")) { $(this).width(sidebarWidth); } else { $(this).addClass('page-sidebar-hovering'); $(this).animate({ width: sidebarWidth }, 400, '', function () { $(this).removeClass('page-sidebar-hovering'); }); }
        }); $('.page-sidebar').off('mouseleave').on('mouseleave', function () {
            var body = $('body'); if ((body.hasClass('page-sidebar-hover-on') === false || body.hasClass('page-sidebar-fixed') === false) || $(this).hasClass('page-sidebar-hovering')) { return; }
            if (body.hasClass("page-sidebar-reversed")) { $('body').addClass('page-sidebar-closed').removeClass('page-sidebar-hover-on'); $(this).width(sidebarCollapsedWidth); } else { $(this).addClass('page-sidebar-hovering'); $(this).animate({ width: sidebarCollapsedWidth }, 400, '', function () { $('body').addClass('page-sidebar-closed').removeClass('page-sidebar-hover-on'); $(this).removeClass('page-sidebar-hovering'); }); }
        });
    }
    var handleSidebarToggler = function () {
        var viewport = _getViewPort(); if ($.cookie && $.cookie('sidebar_closed') === '1' && viewport.width >= 992) { $('body').addClass('page-sidebar-closed'); }
        $('.page-sidebar, .header').on('click', '.sidebar-toggler', function (e) {
            var body = $('body'); var sidebar = $('.page-sidebar'); if ((body.hasClass("page-sidebar-hover-on") && body.hasClass('page-sidebar-fixed')) || sidebar.hasClass('page-sidebar-hovering')) {
                body.removeClass('page-sidebar-hover-on'); sidebar.css('width', '').hide().show(); handleSidebarAndContentHeight(); if ($.cookie) { $.cookie('sidebar_closed', '0'); }
                e.stopPropagation(); runResponsiveHandlers(); return;
            }
            $(".sidebar-search", sidebar).removeClass("open"); if (body.hasClass("page-sidebar-closed")) {
                body.removeClass("page-sidebar-closed"); if (body.hasClass('page-sidebar-fixed')) { sidebar.css('width', ''); }
                if ($.cookie) { $.cookie('sidebar_closed', '0'); }
            } else { body.addClass("page-sidebar-closed"); if ($.cookie) { $.cookie('sidebar_closed', '1'); } }
            handleSidebarAndContentHeight(); runResponsiveHandlers();
        }); $('.page-sidebar').on('click', '.sidebar-search .remove', function (e) { e.preventDefault(); $('.sidebar-search').removeClass("open"); }); $('.page-sidebar .sidebar-search').on('keypress', 'input.form-control', function (e) { if (e.which == 13) { $('.sidebar-search').submit(); return false; } }); $('.sidebar-search .submit').on('click', function (e) {
            e.preventDefault(); if ($('body').hasClass("page-sidebar-closed")) {
                if ($('.sidebar-search').hasClass('open') == false) {
                    if ($('.page-sidebar-fixed').size() === 1) { $('.page-sidebar .sidebar-toggler').click(); }
                    $('.sidebar-search').addClass("open");
                } else { $('.sidebar-search').submit(); }
            } else { $('.sidebar-search').submit(); }
        }); $('.header .search-form').on('keypress', 'input.form-control', function (e) { if (e.which == 13) { $('.sidebar-search').submit(); return false; } }); $('.header .search-form .submit').on('click', function (e) { e.preventDefault(); $('.header .search-form').submit(); });
    }
    var handleHorizontalMenu = function () {
        $('.header').on('click', '.hor-menu .hor-menu-search-form-toggler', function (e) {
            if ($(this).hasClass('off')) { $(this).removeClass('off'); $('.header .hor-menu .search-form').hide(); } else { $(this).addClass('off'); $('.header .hor-menu .search-form').show(); }
            e.preventDefault();
        }); $('.header').on('click', '.hor-menu a[data-toggle="tab"]', function (e) { e.preventDefault(); var nav = $(".hor-menu .nav"); var active_link = nav.find('li.current'); $('li.active', active_link).removeClass("active"); $('.selected', active_link).remove(); var new_link = $(this).parents('li').last(); new_link.addClass("current"); new_link.find("a:first").append('<span class="selected"></span>'); }); $('.header').on('click', '.hor-menu .search-form .btn', function (e) { $('.form-search').submit(); e.preventDefault(); }); $('.header').on('keypress', '.hor-menu .search-form input', function (e) { if (e.which == 13) { $('.form-search').submit(); return false; } });
    }
    var handleGoTop = function () { jQuery('.footer').on('click', '.go-top', function (e) { App.scrollTo(); e.preventDefault(); }); }
    var handlePortletTools = function () {
        jQuery('body').on('click', '.portlet > .portlet-title > .tools > a.remove', function (e) { e.preventDefault(); jQuery(this).closest(".portlet").remove(); }); jQuery('body').on('click', '.portlet > .portlet-title > .tools > a.reload', function (e) {
            e.preventDefault(); var el = jQuery(this).closest(".portlet").children(".portlet-body"); var url = jQuery(this).attr("data-url"); var error = $(this).attr("data-error-display"); if (url) {
                App.blockUI({ target: el, iconOnly: true }); $.ajax({
                    type: "GET", cache: false, url: url, dataType: "html", success: function (res)
                    { App.unblockUI(el); el.html(res); }, error: function (xhr, ajaxOptions, thrownError)
                    { App.unblockUI(el); var msg = 'Error on reloading the content. Please check your connection and try again.'; if (error == "toastr" && toastr) { toastr.error(msg); } else if (error == "notific8" && $.notific8) { $.notific8('zindex', 11500); $.notific8(msg, { theme: 'ruby', life: 3000 }); } else { alert(msg); } }
                });
            } else { App.blockUI({ target: el, iconOnly: true }); window.setTimeout(function () { App.unblockUI(el); }, 1000); }
        }); $('.portlet .portlet-title a.reload[data-load="true"]').click(); jQuery('body').on('click', '.portlet > .portlet-title > .tools > .collapse, .portlet .portlet-title > .tools > .expand', function (e) { e.preventDefault(); var el = jQuery(this).closest(".portlet").children(".portlet-body"); if (jQuery(this).hasClass("collapse")) { jQuery(this).removeClass("collapse").addClass("expand"); el.slideUp(200); } else { jQuery(this).removeClass("expand").addClass("collapse"); el.slideDown(200); } });
    }
    var handleUniform = function () {
        if (!jQuery().uniform) { return; }
        var test = $("input[type=checkbox]:not(.toggle, .make-switch), input[type=radio]:not(.toggle, .star, .make-switch)"); if (test.size() > 0) { test.each(function () { if ($(this).parents(".checker").size() == 0) { $(this).show(); $(this).uniform(); } }); }
    }
    var handleBootstrapSwitch = function () {
        if (!jQuery().bootstrapSwitch) { return; }
        $('.make-switch').bootstrapSwitch();
    }
    var handleAccordions = function () { jQuery('body').on('shown.bs.collapse', '.accordion.scrollable', function (e) { App.scrollTo($(e.target)); }); }
    var handleTabs = function () { $('body').on('shown.bs.tab', '.nav.nav-tabs', function () { handleSidebarAndContentHeight(); }); if (location.hash) { var tabid = location.hash.substr(1); $('a[href="#' + tabid + '"]').parents('.tab-pane:hidden').each(function () { var tabid = $(this).attr("id"); $('a[href="#' + tabid + '"]').click(); }); $('a[href="#' + tabid + '"]').click(); } }
    var handleModals = function () { $('body').on('hide.bs.modal', function () { if ($('.modal:visible').size() > 1 && $('html').hasClass('modal-open') == false) { $('html').addClass('modal-open'); } else if ($('.modal:visible').size() <= 1) { $('html').removeClass('modal-open'); } }); $('body').on('show.bs.modal', '.modal', function () { if ($(this).hasClass("modal-scroll")) { $('body').addClass("modal-open-noscroll"); } }); $('body').on('hide.bs.modal', '.modal', function () { $('body').removeClass("modal-open-noscroll"); }); }
    var handleTooltips = function () { jQuery('.tooltips').tooltip(); }
    var handleDropdowns = function () { $('body').on('click', '.dropdown-menu.hold-on-click', function (e) { e.stopPropagation(); }); }
    var handleDropdownHover = function () { $('[data-hover="dropdown"]').dropdownHover(); }
    var handleAlerts = function () { $('body').on('click', '[data-close="alert"]', function (e) { $(this).parent('.alert').hide(); e.preventDefault(); }); }
    var lastPopedPopover; var handlePopovers = function () { jQuery('.popovers').popover(); $(document).on('click.bs.popover.data-api', function (e) { if (lastPopedPopover) { lastPopedPopover.popover('hide'); } }); }
    var handleScrollers = function () {
        $('.scroller').each(function () {
            var height; if ($(this).attr("data-height")) { height = $(this).attr("data-height"); } else { height = $(this).css('height'); }
            $(this).slimScroll({ allowPageScroll: true, size: '7px', color: ($(this).attr("data-handle-color") ? $(this).attr("data-handle-color") : '#bbb'), railColor: ($(this).attr("data-rail-color") ? $(this).attr("data-rail-color") : '#eaeaea'), position: isRTL ? 'left' : 'right', height: height, alwaysVisible: ($(this).attr("data-always-visible") == "1" ? true : false), railVisible: ($(this).attr("data-rail-visible") == "1" ? true : false), disableFadeOut: true });
        });
    }
    var handleFancybox = function () {
        if (!jQuery.fancybox) { return; }
        if (jQuery(".fancybox-button").size() > 0) { jQuery(".fancybox-button").fancybox({ groupAttr: 'data-rel', prevEffect: 'none', nextEffect: 'none', closeBtn: true, helpers: { title: { type: 'inside' } } }); }
    }
    var handleFixInputPlaceholderForIE = function () {
        if (isIE8 || isIE9) {
            jQuery('input[placeholder]:not(.placeholder-no-fix), textarea[placeholder]:not(.placeholder-no-fix)').each(function () {
                var input = jQuery(this); if (input.val() == '' && input.attr("placeholder") != '') { input.addClass("placeholder").val(input.attr('placeholder')); }
                input.focus(function () { if (input.val() == input.attr('placeholder')) { input.val(''); } }); input.blur(function () { if (input.val() == '' || input.val() == input.attr('placeholder')) { input.val(input.attr('placeholder')); } });
            });
        }
    }
    var handleFullScreenMode = function () {
        function toggleFullScreen() { if (!document.fullscreenElement && !document.mozFullScreenElement && !document.webkitFullscreenElement) { if (document.documentElement.requestFullscreen) { document.documentElement.requestFullscreen(); } else if (document.documentElement.mozRequestFullScreen) { document.documentElement.mozRequestFullScreen(); } else if (document.documentElement.webkitRequestFullscreen) { document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT); } } else { if (document.cancelFullScreen) { document.cancelFullScreen(); } else if (document.mozCancelFullScreen) { document.mozCancelFullScreen(); } else if (document.webkitCancelFullScreen) { document.webkitCancelFullScreen(); } } }
        $('#trigger_fullscreen').click(function () { toggleFullScreen(); });
    }
    var handleSelect2 = function () { if (jQuery().select2) { $('.select2me').select2({ placeholder: "Select", allowClear: true }); } }
    var handleTheme = function () {
        var panel = $('.theme-panel'); if ($('body').hasClass('page-boxed') == false) { $('.layout-option', panel).val("fluid"); }
        $('.sidebar-option', panel).val("default"); $('.header-option', panel).val("fixed"); $('.footer-option', panel).val("default"); if ($('.sidebar-pos-option').attr("disabled") === false) { $('.sidebar-pos-option', panel).val(App.isRTL() ? 'right' : 'left'); }
        var resetLayout = function () {
            $("body").removeClass("page-boxed").removeClass("page-footer-fixed").removeClass("page-sidebar-fixed").removeClass("page-header-fixed").removeClass("page-sidebar-reversed"); $('.header > .header-inner').removeClass("container"); if ($('.page-container').parent(".container").size() === 1) { $('.page-container').insertAfter('body > .clearfix'); }
            if ($('.footer > .container').size() === 1) { $('.footer').html($('.footer > .container').html()); } else if ($('.footer').parent(".container").size() === 1) { $('.footer').insertAfter('.page-container'); }
            $('body > .container').remove();
        }
        var lastSelectedLayout = ''; var setLayout = function () {
            var layoutOption = $('.layout-option', panel).val(); var sidebarOption = $('.sidebar-option', panel).val(); var headerOption = $('.header-option', panel).val(); var footerOption = $('.footer-option', panel).val(); var sidebarPosOption = $('.sidebar-pos-option', panel).val(); if (sidebarOption == "fixed" && headerOption == "default") { alert('Default Header with Fixed Sidebar option is not supported. Proceed with Fixed Header with Fixed Sidebar.'); $('.header-option', panel).val("fixed"); $('.sidebar-option', panel).val("fixed"); sidebarOption = 'fixed'; headerOption = 'fixed'; }
            resetLayout(); if (layoutOption === "boxed") { $("body").addClass("page-boxed"); $('.header > .header-inner').addClass("container"); var cont = $('body > .clearfix').after('<div class="container"></div>'); $('.page-container').appendTo('body > .container'); if (footerOption === 'fixed') { $('.footer').html('<div class="container">' + $('.footer').html() + '</div>'); } else { $('.footer').appendTo('body > .container'); } }
            if (lastSelectedLayout != layoutOption) { runResponsiveHandlers(); }
            lastSelectedLayout = layoutOption; if (headerOption === 'fixed') { $("body").addClass("page-header-fixed"); $(".header").removeClass("navbar-static-top").addClass("navbar-fixed-top"); } else { $("body").removeClass("page-header-fixed"); $(".header").removeClass("navbar-fixed-top").addClass("navbar-static-top"); }
            if ($('body').hasClass('page-full-width') === false) { if (sidebarOption === 'fixed') { $("body").addClass("page-sidebar-fixed"); } else { $("body").removeClass("page-sidebar-fixed"); } }
            if (footerOption === 'fixed') { $("body").addClass("page-footer-fixed"); } else { $("body").removeClass("page-footer-fixed"); }
            if (App.isRTL()) { if (sidebarPosOption === 'left') { $("body").addClass("page-sidebar-reversed"); $('#frontend-link').tooltip('destroy').tooltip({ placement: 'right' }); } else { $("body").removeClass("page-sidebar-reversed"); $('#frontend-link').tooltip('destroy').tooltip({ placement: 'left' }); } } else { if (sidebarPosOption === 'right') { $("body").addClass("page-sidebar-reversed"); $('#frontend-link').tooltip('destroy').tooltip({ placement: 'left' }); } else { $("body").removeClass("page-sidebar-reversed"); $('#frontend-link').tooltip('destroy').tooltip({ placement: 'right' }); } }
            handleSidebarAndContentHeight(); handleFixedSidebar(); handleFixedSidebarHoverable();
        }
        var setColor = function (color) { var color_ = (App.isRTL() ? color + '-rtl' : color); $('#style_color').attr("href", "assets/css/themes/" + color_ + ".css"); if ($.cookie) { $.cookie('style_color', color); } }
        $('.toggler', panel).click(function () { $('.toggler').hide(); $('.toggler-close').show(); $('.theme-panel > .theme-options').show(); }); $('.toggler-close', panel).click(function () { $('.toggler').show(); $('.toggler-close').hide(); $('.theme-panel > .theme-options').hide(); }); $('.theme-colors > ul > li', panel).click(function () { var color = $(this).attr("data-style"); setColor(color); $('ul > li', panel).removeClass("current"); $(this).addClass("current"); }); $('.layout-option, .header-option, .sidebar-option, .footer-option, .sidebar-pos-option', panel).change(setLayout); if ($.cookie && $.cookie('style_color')) { setColor($.cookie('style_color')); }
    }
    return {
        init: function () {
            handleInit(); handleResponsiveOnResize(); handleUniform(); handleBootstrapSwitch(); handleScrollers(); handleResponsiveOnInit(); handleFixedSidebar(); handleFixedSidebarHoverable(); handleSidebarMenu(); handleHorizontalMenu(); handleSidebarToggler(); handleFixInputPlaceholderForIE(); handleGoTop(); handleTheme(); handleFancybox()
            handleSelect2(); handlePortletTools(); handleAlerts(); handleDropdowns(); handleTabs(); handleTooltips(); handlePopovers(); handleAccordions(); handleModals(); handleFullScreenMode();
        }, initAjax: function () { handleScrollers(); handleSelect2(); handleDropdowns(); handleTooltips(); handlePopovers(); handleAccordions(); handleUniform(); handleBootstrapSwitch(); handleDropdownHover() }, fixContentHeight: function () { handleSidebarAndContentHeight(); }, setLastPopedPopover: function (el) { lastPopedPopover = el; }, addResponsiveHandler: function (func) { responsiveHandlers.push(func); }, setEqualHeight: function (els) { var tallestEl = 0; els = jQuery(els); els.each(function () { var currentHeight = $(this).height(); if (currentHeight > tallestEl) { tallestColumn = currentHeight; } }); els.height(tallestEl); }, scrollTo: function (el, offeset) {
            var pos = (el && el.size() > 0) ? el.offset().top : 0; if (el) {
                if ($('body').hasClass('page-header-fixed')) { pos = pos - $('.header').height(); }
                pos = pos + (offeset ? offeset : -1 * el.height());
            }
            jQuery('html,body').animate({ scrollTop: pos }, 'slow');
        }, scrollTop: function () { App.scrollTo(); }, blockUI: function (options) {
            var options = $.extend(true, {}, options); var html = ''; if (options.iconOnly) { html = '<div class="loading-message ' + (options.boxed ? 'loading-message-boxed' : '') + '"><img style="" src="' + DomainName + '/assets/img/loading-spinner-grey.gif" align=""></div>'; } else if (options.textOnly) { html = '<div class="loading-message ' + (options.boxed ? 'loading-message-boxed' : '') + '"><span>&nbsp;&nbsp;' + (options.message ? options.message : 'LOADING...') + '</span></div>'; } else { html = '<div class="loading-message ' + (options.boxed ? 'loading-message-boxed' : '') + '"><img style="" src="' + DomainName + '/assets/img/loading-spinner-grey.gif" align=""><span>&nbsp;&nbsp;' + (options.message ? options.message : 'LOADING...') + '</span></div>'; }
            if (options.target) {
                var el = jQuery(options.target); if (el.height() <= ($(window).height())) { options.cenrerY = true; }
                el.block({ message: html, baseZ: options.zIndex ? options.zIndex : 1000, centerY: options.cenrerY != undefined ? options.cenrerY : false, css: { top: '10%', border: '0', padding: '0', backgroundColor: 'none' }, overlayCSS: { backgroundColor: options.overlayColor ? options.overlayColor : '#000', opacity: options.boxed ? 0.05 : 0.1, cursor: 'wait' } });
            } else { $.blockUI({ message: html, baseZ: options.zIndex ? options.zIndex : 1000, css: { border: '0', padding: '0', backgroundColor: 'none' }, overlayCSS: { backgroundColor: options.overlayColor ? options.overlayColor : '#000', opacity: options.boxed ? 0.05 : 0.1, cursor: 'wait' } }); }
        }, unblockUI: function (target) { if (target) { jQuery(target).unblock({ onUnblock: function () { jQuery(target).css('position', ''); jQuery(target).css('zoom', ''); } }); } else { $.unblockUI(); } }, startPageLoading: function (message) { $('.page-loading').remove(); $('body').append('<div class="page-loading"><img src="assets/img/loading-spinner-grey.gif"/>&nbsp;&nbsp;<span>' + (message ? message : 'Loading...') + '</span></div>'); }, stopPageLoading: function () { $('.page-loading').remove(); }, initUniform: function (els) { if (els) { jQuery(els).each(function () { if ($(this).parents(".checker").size() == 0) { $(this).show(); $(this).uniform(); } }); } else { handleUniform(); } }, updateUniform: function (els) { $.uniform.update(els); }, initFancybox: function () { handleFancybox(); }, getActualVal: function (el) {
            var el = jQuery(el); if (el.val() === el.attr("placeholder")) { return ""; }
            return el.val();
        }, getURLParameter: function (paramName) {
            var searchString = window.location.search.substring(1), i, val, params = searchString.split("&"); for (i = 0; i < params.length; i++) { val = params[i].split("="); if (val[0] == paramName) { return unescape(val[1]); } }
            return null;
        }, isTouchDevice: function () { try { document.createEvent("TouchEvent"); return true; } catch (e) { return false; } }, getUniqueID: function (prefix) { return 'prefix_' + Math.floor(Math.random() * (new Date()).getTime()); }, alert: function (options) {
            options = $.extend(true, { container: "", place: "append", type: 'success', message: "", close: true, reset: true, focus: true, closeInSeconds: 0, icon: "" }, options); var id = App.getUniqueID("app_alert"); var html = '<div id="' + id + '" class="app-alerts alert alert-' + options.type + ' fade in">' + (options.close ? '<button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>' : '') + (options.icon != "" ? '<i class="fa-lg fa fa-' + options.icon + '"></i>  ' : '') + options.message + '</div>'
            if (options.reset) {
                0
                $('.app-alerts').remove();
            }
            if (!options.container) { $('.page-breadcrumb').after(html); } else { if (options.place == "append") { $(options.container).append(html); } else { $(options.container).prepend(html); } }
            if (options.focus) { App.scrollTo($('#' + id)); }
            if (options.closeInSeconds > 0) { setTimeout(function () { $('#' + id).remove(); }, options.closeInSeconds * 1000); }
        }, isIE8: function () { return isIE8; }, isIE9: function () { return isIE9; }, isRTL: function () { return isRTL; }, getLayoutColorCode: function (name) { if (layoutColorCodes[name]) { return layoutColorCodes[name]; } else { return ''; } }
    };
}();