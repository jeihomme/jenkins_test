$(function(){
	InitiateSideMenu();	
});

function InitiateSideMenu() {
    $(".sidebar-toggler").on("click", function() {
        return $("#sidebar").toggleClass("hide"), $(".sidebar-toggler").toggleClass("active"), !1
    });
    var n = $("#sidebar").hasClass("menu_compact");
    $("#sidebar_collapse").on("click", function() {
        if ($("#sidebar").is(":visible") || $("#sidebar").toggleClass("hide"), $("#sidebar").toggleClass("menu_compact"), $(".sidebar_collapse").toggleClass("active"), n = $("#sidebar").hasClass("menu_compact"), $(".sidebar_menu").closest("div").hasClass("slimScrollDiv") && ($(".sidebar_menu").slimScroll({
                destroy: !0
            }), $(".sidebar_menu").attr("style", "")), n) $(".open > .submenu").removeClass("open");
        else if ($(".page_sidebar").hasClass("sidebar-fixed")) {
            var t = readCookie("rtl-support") || location.pathname == "/index-rtl-fa.html" || location.pathname == "/index-rtl-ar.html" ? "right" : "left";
            $(".sidebar_menu").slimscroll({
                height: "auto",
                position: t,
                size: "3px",
                color: themeprimary
            })
        }
    });
	 
    $(".sidebar_menu").on("click", function(t) {		
        var i = $(t.target).closest("a"),
            u, r, f;		
        if (i && i.length != 0) {				
            if (!i.hasClass("menu-dropdown")) return n && i.get(0).parentNode.parentNode == this && (u = i.find(".menu_text").get(0), t.target != u && !$.contains(u, t.target)) ? !1 : void 0;
            if (r = i.next().get(0), !$(r).is(":visible")) {								
                if (f = $(r.parentNode).closest("ul"), n && f.hasClass("sidebar_menu")) return;	
                f.find("> .open > .submenu").each(function() {
                    this == r || $(this.parentNode).hasClass("active") || $(this).slideUp(200).parent().removeClass("open")
					         $(this).addClass('active');	
                })				
            }
            return n && $(r.parentNode.parentNode).hasClass("sidebar_menu") ? !1 : ($(r).slideToggle(200).parent().toggleClass("open"), !1)
        }
    });
}

/* table & tab */
$(function(){
	if ( $("[tabId].active").length == 0 ){		
		$("[tabgrp]").each(function(){
			$(this).find("[tabId]").each(function(){
				var tabId = $(this).attr("tabId");
				$("#"+ tabId).hide();
			});	
			$(this).find("[tabId]:first").addClass("active");
			$("#"+ $(this).find("[tabId]:first").attr("tabId")).show();
		});
	}	
	
	$("[tabId]").click(function(){
		$("[tabId]").removeClass("active").removeClass("on");
		$(this).addClass("active");		
		$("[tabgrp]").each(function(){
			$(this).find("[tabId]").each(function(){
				var tabId = $(this).attr("tabId");
				$("#"+ tabId).fadeOut(200);
			});			
		});		
		$("#"+ $(this).attr("tabId")).fadeIn(500);
	});
});

// FAQ function
$(document).on('click', '.faq_list li .title', function(){
	$(this).parent().toggleClass('active');
	$(this).parent().siblings().removeClass('active');
	$(this).siblings().slideToggle(300);
	$(this).parent().siblings().children('.text').slideUp(300);
});

// image over function
$(document).on('mouseover', '.img_over', function(){
	$(this).attr('src', $(this).attr('src').replace('.png', '_on.png'));
});
$(document).on('mouseout', '.img_over', function(){
	$(this).attr('src', $(this).attr('src').replace('_on.png', '.png'));
});

// button toggle ??????
$(document).on('click','div.toggle_wrap[data-ui="UI_toggle"] .btn', function(e) {
	e.preventDefault();
	var _this = $(e.currentTarget);
	_this.addClass('active').siblings().removeClass('active')
});

// file ?????? ??????
$(document).on('click','[data-ui="file_delete"]', function(){
	$(this).parent().remove()
});










/******************************************************
	date Picker function
******************************************************/
var calendar_date = function(){
	var inputDate = $(".datepicker");
	inputDate.each(function(){
		var inputDate = $(this)
		var changeYearButtons = function() {
			setTimeout(function() {
				var widgetHeader = inputDate.datepicker("widget").find(".ui-datepicker-header");
				var prevYrBtn = $('<a class="prevYear" title="prevYear">Prev Year</a>');
				prevYrBtn.on("click", function() {
					$.datepicker._adjustDate(inputDate, -1, 'Y');
				});
				var nextYrBtn = $('<a class="nextYear" title="nextYear">Next year</a>');
				nextYrBtn.on("click", function() {
					$.datepicker._adjustDate(inputDate, +1, 'Y');
				});
				prevYrBtn.appendTo(widgetHeader);
				nextYrBtn.appendTo(widgetHeader);
			}, 1);
		};
		inputDate.datepicker({
			showMonthAfterYear : true,
			dayNamesMin: ['???', '???', '???', '???', '???', '???', '???'],
			monthNames:  [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12" ],
			dateFormat: "yy-mm-dd",
			isRTL: true,
			beforeShow: function(input) {
				changeYearButtons();
				var input_offset= $(input).offset();
				setTimeout(function(){
					inputDate.addClass('focus');
					inputDate.after('<span class="date_arrow"><span class="arrow"></span></span>');
					inputDate.next('span.date_arrow').fadeIn('fast');
				    $('#ui-datepicker-div').css({'top':input_offset.top, 'bottom':''}); 					
				});				
			},
			onClose: function(input) {
				inputDate.removeClass('focus');			
				inputDate.next('.date_arrow').fadeOut('fast');
				inputDate.next('.date_arrow').remove();
			},
	    	onChangeMonthYear: changeYearButtons
		});
	});
}
$(document).ready(function(){
	calendar_date();
});



/******************************************************
	POPUP ALERT event
******************************************************/
/* popup */
var popupShow = function(W, H, ID) { // ??????, ??????, ID???
	// ????????? append, import, hardcoding ??? ?????? ?????? ??????
	var $ID = $('#' + ID);
	$ID.popupCustom({ pType: 'popup', action: 'open', id: ID, width: W, height: H });
}

/* alert */
var alertShow = function(W, H, ID) { // ??????, ??????, ID???
	// ????????? append, import, hardcoding ??? ?????? ?????? ??????
	var $ID = $('#' + ID);
	$ID.popupCustom({ pType: 'alert', action: 'open', id: ID, width: W, height: H	});
}

/******************************************************

	POPUP & ALERT function

	Usage)
	$(selector).popupCustom({ option })
	- pType: popup, alert
	- action: open, hide, remove

******************************************************/
$.fn.popupCustom = function(options) {
	// ????????????
	var defaults = {
		//??????
		pType: 'popup',
		action: 'open',
		id: null,
		width: null,
		height: null,
		TBmargin: 100, // ????????? ????????? ???,????????????
		//???????????????
		dimClass: 'dim', // ??? ?????????
		scrollArea: '.dialog_content', // ????????? ?????????
		btnCloseHide: '[data-action="popup_hide"]', // ????????????
		btnCloseRemove: '[data-action="popup_remove"]', // ????????????		
		p_popupArea: '.popup_wrap',	// ?????? ?????????
		p_commonClass: '.popup_layer', // ???????????? ?????????
		p_headerArea: '.popup_header', // ?????? ???????????????
		a_alertArea: '.alert_wrap', // ????????? ?????????
		a_commonClass: '.alert_layer', // ???????????? ?????????
		a_headerArea: '.alert_header' // ????????? ???????????????
	}
	var o = $.extend( defaults, options ),
		 windowW =  $(window).outerWidth(true),
		 windowH =  $(window).outerHeight(true),
		 documentW =  $(document).outerWidth(true),
		 documentH =  $(document).outerHeight(true),
		 bodyScrollcontroll = $('html'); // ??????????????? ??????

	var $this = $(this),
		 dimClass = $('.' + o.dimClass),
		 scrollArea = $this.find(o.scrollArea),
		 btnCloseHide = $this.find(o.btnCloseHide),
		 btnCloseRemove = $this.find(o.btnCloseRemove),
		 commonClass = $(o.p_commonClass + ',' + o.a_commonClass),
		 popupClass = $(o.p_commonClass),
		 alertClass = $(o.a_commonClass),
		 selfClass = $this.find(o.p_commonClass + ',' + o.a_commonClass),
		 scroll_Add = parseInt(o.width) + 17,
		 Pcount = $this.prevAll(o.p_popupArea).length, // ???????????? ??????
		 Acount = $this.prevAll(o.a_alertArea).length, // ???????????? ??????
		 pHeader = $(o.p_headerArea),
		 aHeader = $(o.a_headerArea);
	if ( o.pType == 'popup') headerArea = $this.find(o.p_headerArea).height();
	if ( o.pType == 'alert') headerArea = $this.find(o.a_headerArea).height();
	var docH = null;

	return this.each(function(){
		// ????????????
		if ( o.action == 'open' ){
			var init = function(){
				$this.show();
				Size();
				Position();
				setTimeout(function(){ Show() }, 10)
			};
			var Show = function (){
				// Default
				$this.addClass('popupactive'); //2017-03-21 ??????
				if( dimClass.length == 0){
					$('body').prepend('<div class="' + o.dimClass + '" style="z-index: 1000"></div>');
				};
				commonClass.css({ 'z-index': '999', 'border': 'solid 1px #ebebeb' });
				if ( o.pType == 'popup') {
					selfClass.css({ 'z-index': '1001', 'border': 'none' });
				} else if ( o.pType == 'alert') {
					selfClass.css({ 'z-index': '2001', 'border': 'none' });
				}
			};
			var Size = function (){ // ????????????
				selfClass.css({ 'width': o.width, 'height': o.height });
				if ( o.pType == 'popup') docH = $this.find(o.scrollArea).height() + headerArea;
				if ( o.pType == 'alert') docH = $this.find(o.scrollArea).height() + headerArea;
				if( (windowH - o.TBmargin) < selfClass.height() ){ // ???????????? ????????? ?????? ??????
					// pHeader.css({ 'margin-right': '48px'});
					selfClass.css({ 'width': (selfClass.width() + 16) + 'px', 'height': windowH - o.TBmargin });
					scrollArea.css({ 'padding-right':'1px', 'overflow-y': 'scroll', 'height': selfClass.height() - headerArea });
					scrollArea.scrollTop(0);
				}
				if ( windowH < documentH ) {
					bodyScrollcontroll.css({ 'margin-right': '16px', 'overflow-y': 'hidden' });
				}
			};
			var Position = function (){ // ???????????? ??????
				selfClass.css({ 'margin-left': -( selfClass.width()/2 ), 'margin-top': -( selfClass.height()/2 ) });
			};
			init();
		}

		// ????????????
		if ( o.action == 'hide' || o.action == 'remove') {
			if( Pcount == 0 && Acount == 0) {
				dimClass.remove();	 // ??????
				bodyScrollcontroll.css({ 'margin-right': '0px', 'overflow-y': 'auto' });
			} else if ( Pcount > 0 || Acount > 0) {
				$this.prev().find(commonClass).css({ 'z-index': '1001', 'border': 'none' });
			};
			selfClass.removeAttr('style');
			scrollArea.removeAttr('style');
			if ( o.action == 'hide') $this.hide();
			if ( o.action == 'remove') $this.remove();
			$this.removeClass('popupactive');
			var activeTrue = $('body').find('.popupactive').length;
			if ( activeTrue == 0 ) {
				dimClass.remove();	 // ??????
			} else {
				$('.popupactive:last').css({ 'z-index': '1001', 'border': 'none' }).find('div').each(function(){
					$(this).css('z-index','1001');
				});				
			}
		}		

		// ??????
		btnCloseHide.click( function(e){ // ??????
			e.preventDefault;
			$this.popupCustom({ action: 'hide',  id: o.id });
		});
		btnCloseRemove.click( function(e){ // ??????
			e.preventDefault;
			//$this.popupCustom({ action: 'remove',  id: o.id });
			$this.popupCustom({ action: 'hide',  id: o.id });
		});		

		// ????????????
		$(window).on('resize', function(){
			var windowH_re = $(window).outerHeight(true);
			selfClass.each(function(){
				mine = $(this)
				if( windowH_re < windowH ) {
					if( ( windowH_re - o.TBmargin) < selfClass.height() ){
						// pHeader.css({ 'margin-right': '48px'});
						mine.css({ 'width': scroll_Add + 'px', 'height': windowH_re - o.TBmargin });
						scrollArea.css({ 'padding-right': '1px', 'overflow-y': 'scroll', 'height': selfClass.height() - headerArea });
					}
				} else {
					mine.css({ 'height': windowH_re - o.TBmargin, 'max-height': docH });
					scrollArea.css({ 'height': selfClass.height() - headerArea });
					if( ( windowH_re - o.TBmargin) > selfClass.height() ){
						// pHeader.css({ 'margin-right': '32px'});
						mine.css({ 'width': o.width + 'px' });
						scrollArea.css({ 'padding-right': '0px', 'overflow-y': 'hidden' });
					}
				}
				mine.css({ 'margin-left': -( selfClass.width()/2 ), 'margin-top': -( selfClass.height()/2 ) });
				setTimeout(function(){ windowH = $(window).outerHeight(true) }, 200)
			});
		});

		return false
	});
};



	
	
	
	
	
	
	
	
	
	
	
	
	
	
