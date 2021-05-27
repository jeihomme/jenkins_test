

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

// button toggle 메뉴
$(document).on('click','div.toggle_wrap[data-ui="UI_toggle"] .btn', function(e) {
	e.preventDefault();
	var _this = $(e.currentTarget);
	_this.addClass('active').siblings().removeClass('active')
});

// file 삭제 버튼
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
			changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
			changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
			isRTL: true,
			language: 'ko',
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
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
var popupShow = function(W, H, ID) { // 가로, 세로, ID값
	// 팝업을 append, import, hardcoding 후 아래 함수 실행
	var $ID = $('#' + ID);
	$ID.popupCustom({ pType: 'popup', action: 'open', id: ID, width: W, height: H });
}

/* alert */
var alertShow = function(W, H, ID) { // 가로, 세로, ID값
	// 경고을 append, import, hardcoding 후 아래 함수 실행
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
	// 변수선언
	var defaults = {
		//옵션
		pType: 'popup',
		action: 'open',
		id: null,
		width: null,
		height: null,
		TBmargin: 100, // 팝업창 클경우 상,하단여백
		//공통클래스
		dimClass: 'dim', // 딤 클래스
		scrollArea: '.dialog_content', // 스크롤 클래스
		btnCloseHide: '[data-action="popup_hide"]', // 닫기버튼
		btnCloseRemove: '[data-action="popup_remove"]', // 삭제버튼		
		p_popupArea: '.popup_wrap',	// 공통 클래스
		p_commonClass: '.popup_layer', // 자기자신 클래스
		p_headerArea: '.popup_header', // 팝업 헤더클래스
		a_alertArea: '.alert_wrap', // 경고창 클래스
		a_commonClass: '.alert_layer', // 자기자신 클래스
		a_headerArea: '.alert_header' // 경고창 헤더클래스
	}
	var o = $.extend( defaults, options ),
		 windowW =  $(window).outerWidth(true),
		 windowH =  $(window).outerHeight(true),
		 documentW =  $(document).outerWidth(true),
		 documentH =  $(document).outerHeight(true),
		 bodyScrollcontroll = $('html'); // 바디컨트롤 제어

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
		 Pcount = $this.prevAll(o.p_popupArea).length, // 이전팝업 갯수
		 Acount = $this.prevAll(o.a_alertArea).length, // 이전경고 갯수
		 pHeader = $(o.p_headerArea),
		 aHeader = $(o.a_headerArea);
	if ( o.pType == 'popup') headerArea = $this.find(o.p_headerArea).height();
	if ( o.pType == 'alert') headerArea = $this.find(o.a_headerArea).height();
	var docH = null;

	return this.each(function(){
		// 팝업오픈
		if ( o.action == 'open' ){
			var init = function(){
				$this.show();
				Size();
				Position();
				setTimeout(function(){ Show() }, 10)
			};
			var Show = function (){
				// Default
				$this.addClass('popupactive'); //2017-03-21 추가
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
			var Size = function (){ // 크기정의
				selfClass.css({ 'width': o.width, 'height': o.height });
				if ( o.pType == 'popup') docH = $this.find(o.scrollArea).height() + headerArea;
				if ( o.pType == 'alert') docH = $this.find(o.scrollArea).height() + headerArea;
				if( (windowH - o.TBmargin) < selfClass.height() ){ // 스크롤이 생겨야 하는 경우
					// pHeader.css({ 'margin-right': '48px'});
					selfClass.css({ 'width': (selfClass.width() + 16) + 'px', 'height': windowH - o.TBmargin });
					scrollArea.css({ 'padding-right':'1px', 'overflow-y': 'scroll', 'height': selfClass.height() - headerArea });
					scrollArea.scrollTop(0);
				}
				if ( windowH < documentH ) {
					// 30일 수정사항 1번 기본화면 흔들림 수정
//					bodyScrollcontroll.css({ 'margin-right': '16px', 'overflow-y': 'hidden' });
				}
			};
			var Position = function (){ // 팝업위치 지정
				selfClass.css({ 'margin-left': -( selfClass.width()/2 ), 'margin-top': -( selfClass.height()/2 ) });
			};
			init();
		}

		// 팝업닫기
		if ( o.action == 'hide' || o.action == 'remove') {
			bodyScrollcontroll.css({ 'margin-right': '0px', 'overflow-y': 'auto' });
			if( Pcount == 0 && Acount == 0) {
				dimClass.remove();	 // 삭제
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
				dimClass.remove();	 // 삭제
			} else {
				$('.popupactive:last').css({ 'z-index': '1001', 'border': 'none' }).find('div').each(function(){
					$(this).css('z-index','1001');
				});				
			}
		}		

		// 버튼
		btnCloseHide.click( function(e){ // 닫기
			e.preventDefault;
			$this.popupCustom({ action: 'hide',  id: o.id });
		});
		btnCloseRemove.click( function(e){ // 삭제
			e.preventDefault;
			//$this.popupCustom({ action: 'remove',  id: o.id });
			$this.popupCustom({ action: 'hide',  id: o.id });
		});		

		// 리사이즈
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
			$obj.find(".fileName").attr("onclick", "alert('파일이 존재하지 않습니다.');" );
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
  alert('링크가 클립보드에 복사되었습니다.');
}



function inputDateSplit(obj) {
	
    var dateArray = obj.split("-");
    return dateArray[0] + dateArray[1] + dateArray[2];
}

function inputDateComparison(obj, OBJECT_STR_ID, OBJECT_END_ID ) {

    var startDate = inputDateSplit(document.getElementById( OBJECT_STR_ID ).value);    // 시작일
    var endDate = inputDateSplit(document.getElementById( OBJECT_END_ID ).value);        // 종료일
    var objDate = inputDateSplit(obj.value);    // 입력한 엘리먼트의 일자
    
    if(startDate == objDate && startDate > endDate) {
        alert("시작일이 종료일보다 이후 날짜입니다.\n다시 선택하여 주시기 바랍니다.");
        obj.value = document.getElementById(OBJECT_END_ID).value;
        obj.focus();
    } else if(endDate == objDate && endDate < startDate) {
        alert("종료일이 시작일보다 이전 날짜입니다.\n다시 선택하여 주시기 바랍니다.");
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


//이메일 유효성 검사
function fn_emailTest( testEmail ) {
	var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	if ( !regEmail.test( testEmail.val() ) ) return 1;
	else return 0;
}


//파라미터 미기입 검사
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
	// 유효값 검사
	$.each( params, function( key, val ) {
		if(  a < 13 ) {
//			console.log( key + ', ' + val );
			if( $('[name="'+tagArr[a]+'"]').is(':visible') ) {
				if ( val == '' || val == null ) {
					str = tagArr[a] + '을/를 입력해주세요.';
					a = 99;
				}
			}
		}
// 		console.log ( tagArr[a++] + " : " + key + " : " + val );
		a++;
	});
	
	return str;
}

//비밀번호 유효성 검사, 숫자+영문 8자 이상
function fn_pwTest( Pw ) {
	var pattern1 = /[0-9]/;	// 숫자 
	var pattern2 = /[a-zA-Z]/;	// 문자

	if(!pattern1.test( Pw ) || !pattern2.test( Pw ) || Pw.length < 8 ) return 1;
	else return 0;
}

// faq 노출여부 버튼 변경
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
		$('#checkIdResult').text('사용할 수 없는 아이디입니다.');
		idIsc = false;
	}
	else{
		$('#checkIdResult').css('color','black');
		$('#checkIdResult').text('사용할 수 있는 아이디입니다.');
		idIsc = true;
	}
}



//페이지 내, 개별 첨부파일에 대한 UUID 생성함수
function fn_GetUuid() {
	var today = new Date();
	var uuid = '';
	for( var a = 0; a < 8; a++ ) {
		uuid += ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
	}
	var sysDateVal = today.getFullYear()+''+(today.getMonth()+1)+''+today.getDate()+''+today.getHours()+''+today.getMinutes()+''+today.getSeconds()+''+uuid;
	return sysDateVal;
}

//	분단위 셀렉트박스 입력값 생성
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




// 'PDF, ZIP, JPG, PNG, GIF 만 허용시켜주는 함수 onchange로 넣어야함
function checkFileType(filePath) {
    var fileFormat = filePath.toLowerCase().split(".");
    if (fileFormat.indexOf("pdf") > -1 || fileFormat.indexOf("zip") > -1 || fileFormat.indexOf("jpg") > -1 || fileFormat.indexOf("png") > -1 || fileFormat.indexOf("jpeg") > -1 || fileFormat.indexOf("gif") > -1 ) {
    	var isc = true;
    } else {
    	var isc = false;
    }
    
    if (!isc) {
    	alert("PDF, ZIP, JPG, JPEG, PNG, GIF 파일만 업로드 가능합니다.");
    	event.stopPropagation();
		event.stopImmediatePropagation(); // 콜백 실행을 막아줌
		return ;
	}else{
		
		return ;
	}    

}

// 이미지만 허용시켜주는 함수
function checkFileTypeImg(filePath) {
	var fileFormat = filePath.toLowerCase().split(".");
	if ( fileFormat.indexOf("jpg") > -1 || fileFormat.indexOf("png") > -1 || fileFormat.indexOf("jpeg") > -1 || fileFormat.indexOf("gif") > -1 ) {
		var isc = true;
	} else {
		var isc = false;
	}
	
	if (!isc) {
		alert("이미지 파일만 업로드 가능합니다.");
		event.stopPropagation();
		event.stopImmediatePropagation(); // 콜백 실행을 막아줌
		return ;
	}else{
		
		return ;
	}    
	
}

// 엑셀만만 허용시켜주는 함수
function checkFileTypeExcel(filePath) {
	var fileFormat = filePath.toLowerCase().split(".");
	if ( fileFormat.indexOf("xlsx") > -1 || fileFormat.indexOf("xls") > -1 ) {
		var isc = true;
	} else {
		var isc = false;
	}
	
	if (!isc) {
		alert("엑셀 파일만 업로드 가능합니다.");
		event.stopPropagation();
		event.stopImmediatePropagation(); // 콜백 실행을 막아줌
		return ;
	}else{
		
		return ;
	}    
	
}

//랜덤 UUID 만드는함수
function uuidv4() {
	  return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
	    (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
	  );
}

// 탑메뉴 누르면 색바꿔주눈거
$(document).on('click', '.gnb_list li > a' , function(){
	$('.gnb_list li').removeClass('active');
	$(this).parent().addClass('active');
});


function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
}

//url유효성
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


//글자가 너무길면 ..... 처리
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

//숫자 세자리마다 , 찍어주는 정규식
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}





	
	
	
	
