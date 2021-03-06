

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
			changeMonth: true, // ?????? ????????? ?????? ????????? ????????? ????????????.
			changeYear: true, // ?????? ?????? ??? ?????? ????????? ????????? ????????????.
			isRTL: true,
			language: 'ko',
			dayNamesMin: ['???', '???', '???', '???', '???', '???', '???'],
			monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
			dateFormat: "yy-mm-dd",
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
//			onSelect: function(dateText, inst) {
//				
//		    },
			onChangeMonthYear: changeYearButtons,
			
		});
		
//		inputDate.datepicker('setDate', 'today');
	});
	
}

$(function(){
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
					// 30??? ???????????? 1??? ???????????? ????????? ??????
//					bodyScrollcontroll.css({ 'margin-right': '16px', 'overflow-y': 'hidden' });
				}
			};
			var Position = function (){ // ???????????? ??????
				selfClass.css({ 'margin-left': -( selfClass.width()/2 ), 'margin-top': -( selfClass.height()/2 ) });
			};
			init();
		}

		// ????????????
		if ( o.action == 'hide' || o.action == 'remove') {
			bodyScrollcontroll.css({ 'margin-right': '0px', 'overflow-y': 'auto' });
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

var imgIdValue = '';
function fn_fileUpload(data){
	var img = '';
	
	if( data.FLD_NAME == "" ) return ;
	if ( data.FILES.length > 0 ) $("#"+imgIdValue+"List").show();
	else $("#"+imgIdValue+"List").hide();

	$("#"+imgIdValue+"List").children().remove();

	$.each(data.FILES, function(key, val){

		var $obj = $("#"+imgIdValue+"ListClone").children().clone(true);		
		$obj.find(".fileName").text( val.FILE_NAME );
		if ( val.FILE_EXISTS == "Y" ){
			$obj.find(".fileName").attr("onclick", "unit_fileDown('"+ val.FILE_UUID +"');$('[id^=\"unit_download\"]').hide()" );
		} else {
			$obj.find(".fileName").attr("onclick", "alert('????????? ???????????? ????????????.');" );
		}	
		$obj.find(".fileSize").text( cvMbyte(val.FILE_SIZE, 1) ) ;	
		$obj.find(".close").attr(
				"onclick",
				"imgIdValue='"+imgIdValue+"';" +
				"unit_fileDel('"+ val.FILE_UUID +"', 'fn_fileUpload', '"+ val.FILE_UUID +"');"
		);

		$("#"+imgIdValue+"List").append( $obj );
		$("#"+imgIdValue.replace('_FILE','')).val(val.UNIT_UUID);
		img = unit_fileImage( val.FILE_UUID );
		
		$('#imgTag').val( img );
		
	});
	
	$('[id^="unit_download"]').hide();
}

function copyToClipboard( val ) {
	
  var t = document.createElement("textarea");
  document.body.appendChild(t);
  t.value = val;
  t.select();
  document.execCommand('copy');
  document.body.removeChild(t);
  alert('????????? ??????????????? ?????????????????????.');
}



function inputDateSplit(obj) {
	
    var dateArray = obj.split("-");
    return dateArray[0] + dateArray[1] + dateArray[2];
}

function inputDateComparison(obj, OBJECT_STR_ID, OBJECT_END_ID ) {

    var startDate = inputDateSplit(document.getElementById( OBJECT_STR_ID ).value);    // ?????????
    var endDate = inputDateSplit(document.getElementById( OBJECT_END_ID ).value);        // ?????????
    var objDate = inputDateSplit(obj.value);    // ????????? ??????????????? ??????
    
    if(startDate == objDate && startDate > endDate) {
        alert("???????????? ??????????????? ?????? ???????????????.\n?????? ???????????? ????????? ????????????.");
        obj.value = document.getElementById(OBJECT_END_ID).value;
        obj.focus();
    } else if(endDate == objDate && endDate < startDate) {
        alert("???????????? ??????????????? ?????? ???????????????.\n?????? ???????????? ????????? ????????????.");
        obj.value = document.getElementById(OBJECT_STR_ID).value;
        obj.focus();
    } else {
        return false;
    }
}



function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}


//????????? ????????? ??????
function fn_emailTest( testEmail ) {
	var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	if ( !regEmail.test( testEmail.val() ) ) return 1;
	else return 0;
}


//???????????? ????????? ??????
function fn_paramsNameTagTest( params ) {
	var tagArr = [];
	
	$.each(params, function(key, val) {
		if( key != '' && key != null ) {
			var str = $('[name='+key+']').parent('td').prev('th').text();
//	 		if( tagArr.indexOf( str ) < 0 ) 
			tagArr.push( str );
		}
	});
	
	var a = 0;
	var str = '';
	// ????????? ??????
	$.each( params, function( key, val ) {
		if(  a < 13 ) {
//			console.log( key + ', ' + val );
			if( $('[name="'+tagArr[a]+'"]').is(':visible') ) {
				if ( val == '' || val == null ) {
					str = tagArr[a] + '???/??? ??????????????????.';
					a = 99;
				}
			}
		}
// 		console.log ( tagArr[a++] + " : " + key + " : " + val );
		a++;
	});
	
	return str;
}

//???????????? ????????? ??????, ??????+?????? 8??? ??????
function fn_pwTest( Pw ) {
	var pattern1 = /[0-9]/;	// ?????? 
	var pattern2 = /[a-zA-Z]/;	// ??????

	if(!pattern1.test( Pw ) || !pattern2.test( Pw ) || Pw.length < 8 ) return 1;
	else return 0;
}

// faq ???????????? ?????? ??????
function updateUseYn( idx, yn, query ){
	var params = new Object();
	idx = idx+'';
	if( idx.indexOf('useYn') > -1 ) {
		params.idx = idx.replace('useYn','').trim();
		if (yn) params.useYn = 'Y';
		else params.useYn = 'N';
	} else if( idx.indexOf('readYn') > -1 ) {
		params.idx = idx.replace('readYn','').trim();
		if (yn) params.readYn = 'Y';
		else params.readYn = 'N';
	} else {
		params.idx = idx;
		if (yn) params.useYn = 'Y';
		else params.useYn = 'N';
	}
	
	params.status = "EDIT";
	params.query = query;
	params.mngLoginIdx = sessionStorage.getItem("mngLoginIdx");
	
	fn_DataAjax( params );
	
}


var idIsc = false;
function fn_BtnDupl( dupleId ) {
	var params = new Object();
	params.status = "CHECK";
	params.query = "selectMngAdminIdDuple";
	params.dupleId = dupleId;
	
	var result = fn_DataAjax2( params );
	if (result.out.detail.data[0].CNT > 0){
		$('#checkIdResult').css('color','red');
		$('#checkIdResult').text('????????? ??? ?????? ??????????????????.');
		idIsc = false;
	}
	else{
		$('#checkIdResult').css('color','black');
		$('#checkIdResult').text('????????? ??? ?????? ??????????????????.');
		idIsc = true;
	}
}



//????????? ???, ?????? ??????????????? ?????? UUID ????????????
function fn_GetUuid() {
	var today = new Date();
	var uuid = '';
	for( var a = 0; a < 8; a++ ) {
		uuid += ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
	}
	var sysDateVal = today.getFullYear()+''+(today.getMonth()+1)+''+today.getDate()+''+today.getHours()+''+today.getMinutes()+''+today.getSeconds()+''+uuid;
	return sysDateVal;
}

//	????????? ??????????????? ????????? ??????
function fn_SelectTime( MIN, OBJ_ID ) {
	MIN*=1;
	var min = 0;
	var inHtml = '';
	var idArr = OBJ_ID.split(',');
	
	$.each(idArr, function(key, val){
		for( ; min < 60; min+=MIN*1 ) {
			var minStr = min+'';
			if( minStr.length == 1 ) minStr = '0'+ minStr+'';
			inHtml += '<option value="'+minStr+'">'+minStr+'</option>';
		}
		$('#'+val+'').append( inHtml );
	});
}




// 'PDF, ZIP, JPG, PNG, GIF ??? ?????????????????? ?????? onchange??? ????????????
function checkFileType(filePath) {
    var fileFormat = filePath.toLowerCase().split(".");
    if (fileFormat.indexOf("pdf") > -1 || fileFormat.indexOf("zip") > -1 || fileFormat.indexOf("jpg") > -1 || fileFormat.indexOf("png") > -1 || fileFormat.indexOf("jpeg") > -1 || fileFormat.indexOf("gif") > -1 ) {
    	var isc = true;
    } else {
    	var isc = false;
    }
    
    if (!isc) {
    	alert("PDF, ZIP, JPG, JPEG, PNG, GIF ????????? ????????? ???????????????.");
    	event.stopPropagation();
		event.stopImmediatePropagation(); // ?????? ????????? ?????????
		return ;
	}else{
		
		return ;
	}    

}

// ???????????? ?????????????????? ??????
function checkFileTypeImg(filePath) {
	var fileFormat = filePath.toLowerCase().split(".");
	if ( fileFormat.indexOf("jpg") > -1 || fileFormat.indexOf("png") > -1 || fileFormat.indexOf("jpeg") > -1 || fileFormat.indexOf("gif") > -1 ) {
		var isc = true;
	} else {
		var isc = false;
	}
	
	if (!isc) {
		alert("????????? ????????? ????????? ???????????????.");
		event.stopPropagation();
		event.stopImmediatePropagation(); // ?????? ????????? ?????????
		return ;
	}else{
		
		return ;
	}    
	
}

// ???????????? ?????????????????? ??????
function checkFileTypeExcel(filePath) {
	var fileFormat = filePath.toLowerCase().split(".");
	if ( fileFormat.indexOf("xlsx") > -1 || fileFormat.indexOf("xls") > -1 ) {
		var isc = true;
	} else {
		var isc = false;
	}
	
	if (!isc) {
		alert("?????? ????????? ????????? ???????????????.");
		event.stopPropagation();
		event.stopImmediatePropagation(); // ?????? ????????? ?????????
		return ;
	}else{
		
		return ;
	}    
	
}

//?????? UUID ???????????????
function uuidv4() {
	  return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
	    (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
	  );
}

// ????????? ????????? ??????????????????
$(document).on('click', '.gnb_list li > a' , function(){
	$('.gnb_list li').removeClass('active');
	$(this).parent().addClass('active');
});


function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month ???????????? ??????
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day ???????????? ??????
    return  year + '-' + month + '-' + day;       //'-' ???????????? yyyy-mm-dd ?????? ?????? ??????
}

//url?????????
function checkDetailUrl(strUrl) {
    var expUrl = /^(http|https):\/\/?((\w+)[.])(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/g;
    return expUrl.test(strUrl);
}

function getYojiiFileInfo( filename ){
	var url = 'https://www.kaster.co.kr/api/get_fileinfo.php?owner=peoplemade&filepath=' + filename;
	var json;
	$.get( url , function(data){ json = data; }, "json");
	return json;
}

function getRunn( URL ){
	var json = getYojiiFileInfo( URL );
	
	function isEmpty(obj) {
		  for (let key in obj) {
		    // if the loop has started, there is a property
		    return false;
		  }
		  return true;
	}	
	
	if ( isEmpty(json) ) 
		return '0';
	else
		return json.playtime;
}

function fn_LegnthOver( TITLE, LENGTH ){
	if ( TITLE.length > LENGTH ) TITLE = TITLE.substring(0,LENGTH-3) + '...';
	return TITLE;
}


//????????? ???????????? ..... ??????
function is_too_long_word(TITLE1, TITLE2, LENGTH, BR_YN) {
	// 	console.log( title1 );
	// 	console.log( title2 );
	if (TITLE1.length > LENGTH)
		TITLE1 = TITLE1.substring(0, LENGTH) + '...';
	if (TITLE2.length > LENGTH)
		TITLE2 = TITLE2.substring(0, LENGTH) + '...';
	if (BR_YN == 'Y')
		return TITLE1 + '<br>' + TITLE2;
	else
		return TITLE1 + ' ' + TITLE2;
}

function isMobile() {
	  return navigator.userAgent.indexOf('Mobi') > -1;
//	if(navigator.userAgent.match(/Android/i)){
//		
//	}else if(navigator.userAgent.match(/iPhone|iPad|iPod/i)){
//		
//	}else{
//		//PC
//		return false;
//	}
//	return true;
}

//?????? ??????????????? , ???????????? ?????????
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}





	
	
	
	
