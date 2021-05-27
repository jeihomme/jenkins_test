$(function(){
    // header
    function headerAction(){
        var $headerItem = $('.hs_cate_btn'),
            $sub = $('.header_sitemap'),
            $close = $('.header_sitemap .hst_btn');
        
        $headerItem.on( 'click', function(){
            $sub.toggle();
        });

        $close.on('click', function () {
            $sub.hide();
        });

        var $cB = $('.hs_link_wifi'),
            $consulting = $('.hs_consulting');

        $cB.on( 'click', function(e){
            e.preventDefault();
            $consulting.toggle();

            if ( $(window).width() < 1310 ) {
                $('.hs_search').hide();
            }
        });
    }
    // header mobile
    function headerActionMo() {
        var $sB = $('.hs_search_btn_mo'),
            $search = $('.hs_search');

        $sB.on( 'click', function(){
            $(this).toggleClass('active');
            $search.toggle();

            $('.hs_consulting').hide();
        });

        // gnb
        var $title = $('.sl_title');

        $title.on( 'click', function(e){
            e.preventDefault();

            $(this).toggleClass('active');
            $(this).siblings('.sl_list').toggle();
        });

        // footer gnb
        var $fTitle = $('.fg_title');

        $fTitle.on( 'click', function(e){
            e.preventDefault();

            $(this).toggleClass('active');
            $(this).siblings('.fg_list').toggle();
        });
    }

    headerAction();

    if ( $(window).width() < 1310 ) {
        headerActionMo();
    }
    
    // scroll
    $(window).scroll(function(){
        var nowScroll = $(window).scrollTop();

        if ( nowScroll > 250 ) {
            $('#header').addClass('sticky');
        } else {
            $('#header').removeClass('sticky');
        }
    });

    // top btn
    $('#top_btn').click(function () {
        $('html, body').animate({
            scrollTop: 0
        }, 400);
        return false;
    });
});

//$(document).click(function(event) {
//	console.log( event.target.id );
//	$('#'+event.target.id).css('border','none !important');
//	$('#'+event.target.id).blur();
//	console.log( $('#'+event.target.id).css('border') );
//});

//$('textArea').focus(function(){
//	console.log( $(this).attr('name') );
//});

$(document).ready(function(){
	/* 모달팝업 */
	$(".menuMobileWrap").children("ul").children("li").click(function(){
		$(".menuMobileWrap").children("ul").children("li").removeClass("mobileActive");
		$(this).addClass("mobileActive");
	});
	
	
	/* 모달팝업 숨기기 기능들 */
	$("#screenCover").hide(0);
	$("#menuSearch").hide(0);
	$("#menuMobile").hide(0);
	$("#modal_guide_banner").hide(0);
	$("#modal_leaveQuestion").hide(0);
	$("#modal_leaveAnswer").hide(0);
	$("#modal_teamApply").hide(0);
	$("#modal_teamAdd").hide(0);
	$("#modal_contestAdd").hide(0);
	$("#modal_addTodoList").hide(0);
	$("#modal_addMemo").hide(0);
	$("#modal_addSchedule").hide(0);
	$("#modal_showPolicy").hide(0);
	$("#modal_showPrivacy").hide(0);
	$("#modal_profileEditAccess").hide(0);
	$("#modal_profileReview").hide(0);
	$("#modal_profileAward").hide(0);
	$("#modal_estimate").hide(0);
	$("#modal_findEmail").hide(0);
	$("#modal_contestReport").hide(0);
	$("#modal_contestPoster").hide(0);
	$("#modal_awardReg").hide(0);
	$("#modal_shareTo").hide(0);
	$("#modal_recListMore").hide(0);
	$("#modal_mngQuestion").hide(0);
	$("#modal_evtQuestion").hide(0);
	$("#modal_FAQ").hide(0);
	$("#modal_findId").hide(0);
	
	
	/* 스크린 눌렀을때 숨김 */
	/*
	$("#screenCover").click(function(){
		$(this).hide(0);
		$("#menuMobile").hide(0);
		$("#menuSearch").hide(0);
		$("#modal_expire").hide(0);
		$("#modal_guide_banner").hide(0);
		$("#modal_leaveQuestion").hide(0);
		$("#modal_leaveAnswer").hide(0);
		$("#modal_teamApply").hide(0);
		$("#modal_teamAdd").hide(0);
		$("#modal_contestAdd").hide(0);
		$("#modal_addTodoList").hide(0);
		$("#modal_addMemo").hide(0);
		$("#modal_addSchedule").hide(0);
		$("#modal_showPolicy").hide(0);
		$("#modal_showPrivacy").hide(0);
		$("#modal_profileEditAccess").hide(0);
		$("#modal_profileReview").hide(0);
		$("#modal_profileAward").hide(0);
		$("#modal_estimate").hide(0);
		$("#modal_findEmail").hide(0);
		$("#modal_contestReport").hide(0);
		$("#modal_contestPoster").hide(0);
		$("#modal_awardReg").hide(0);
		$("#modal_shareTo").hide(0);
		$("#modal_findId").hide(0);
	});
	*/
	/* 모달팝업_X버튼 */
	$(".modal_guide_banner_close").click(function(){
		$("#screenCover").hide(0);
		$("#modal_guide_banner").hide(0);
		$("#modal_leaveQuestion").hide(0);
		$("#modal_leaveAnswer").hide(0);
		$("#modal_teamApply").hide(0);
		$("#modal_teamAdd").hide(0);
		$("#modal_contestAdd").hide(0);
		$("#modal_addTodoList").hide(0);
		$("#modal_addMemo").hide(0);
		$("#modal_addSchedule").hide(0);
		$("#modal_showPolicy").hide(0);
		$("#modal_showPrivacy").hide(0);
		$("#modal_profileEditAccess").hide(0);
		$("#modal_profileReview").hide(0);
		$("#modal_profileAward").hide(0);
		$("#modal_estimate").hide(0);
		$("#modal_findEmail").hide(0);
		$("#modal_contestReport").hide(0);
		$("#modal_contestPoster").hide(0);
		$("#modal_awardReg").hide(0);
		$("#modal_shareTo").hide(0);
		$("#menuSearch").hide(0);
		$("#menuMobile").hide(0);
		$("#modal_recListMore").hide(0);
		$("#modal_profileData").hide(0);
		$("#modal_mngQuestion").hide(0);
		$("#modal_evtQuestion").hide(0);
		$("#modal_FAQ").hide(0);
		$("#modal_findId").hide(0);
	});
	$(".modal_guide_banner_close_m").click(function(){
		$("#screenCover").hide(0);
		$("#modal_guide_banner").hide(0);
		$("#modal_leaveQuestion").hide(0);
		$("#modal_leaveAnswer").hide(0);
		$("#modal_teamApply").hide(0);
		$("#modal_teamAdd").hide(0);
		$("#modal_contestAdd").hide(0);
		$("#modal_addTodoList").hide(0);
		$("#modal_addMemo").hide(0);
		$("#modal_addSchedule").hide(0);
		$("#modal_showPolicy").hide(0);
		$("#modal_showPrivacy").hide(0);
		$("#modal_profileEditAccess").hide(0);
		$("#modal_profileReview").hide(0);
		$("#modal_profileAward").hide(0);
		$("#modal_estimate").hide(0);
		$("#modal_findEmail").hide(0);
		$("#modal_contestReport").hide(0);
		$("#modal_contestPoster").hide(0);
		$("#modal_awardReg").hide(0);
		$("#modal_shareTo").hide(0);
		$("#menuSearch").hide(0);
		$("#menuMobile").hide(0);
		$("#modal_recListMore").hide(0);
		$("#modal_profileData").hide(0);
		$("#modal_mngQuestion").hide(0);
		$("#modal_evtQuestion").hide(0);
		$("#modal_FAQ").hide(0);
		$("#modal_findId").hide(0);
	});
	
	$("#screenCover").click(function(){
		$("#screenCover").hide(0);
		$("#modal_guide_banner").hide(0);
		$("#modal_leaveQuestion").hide(0);
		$("#modal_leaveAnswer").hide(0);
		$("#modal_teamApply").hide(0);
		$("#modal_teamAdd").hide(0);
		$("#modal_contestAdd").hide(0);
		$("#modal_addTodoList").hide(0);
		$("#modal_addMemo").hide(0);
		$("#modal_addSchedule").hide(0);
		$("#modal_showPolicy").hide(0);
		$("#modal_showPrivacy").hide(0);
		$("#modal_profileEditAccess").hide(0);
		$("#modal_profileReview").hide(0);
		$("#modal_profileAward").hide(0);
		$("#modal_estimate").hide(0);
		$("#modal_findEmail").hide(0);
		$("#modal_contestReport").hide(0);
		$("#modal_contestPoster").hide(0);
		$("#modal_awardReg").hide(0);
		$("#modal_shareTo").hide(0);
		$("#menuSearch").hide(0);
		$("#menuMobile").hide(0);
		$("#modal_recListMore").hide(0);
		$("#modal_profileData").hide(0);
		$("#modal_mngQuestion").hide(0);
		$("#modal_evtQuestion").hide(0);
		$("#modal_FAQ").hide(0);
		$("#modal_findId").hide(0);
	});
	
	$(".fn_openSearch").click(function(){
		$("#screenCover").show(0);
		$("#menuSearch").show(0);
	});
	$(".fn_openMenu").click(function(){
		$("#screenCover").show(0);
		$("#menuMobile").show(0);
	});
	
	/* 모달팝업_팀원추가 */
	$(".fn_teamAdd").click(function(){
		$("#screenCover").show(0);
		$("#modal_teamAdd").show(0);
		
		$(".fn_modalSubmitCancel").click(function(){
			$("#modal_teamAdd").hide(0);
			$("#screenCover").hide(0);
		});
	});
	/* 모달팝업_프로필_정보수정 클릭시 비밀번호 확인 */
//	$(".fn_profileEditAccess").click(function(){
//		$("#screenCover").show(0);
//		$("#modal_profileEditAccess").show(0);
//		
//		$(".fn_modalSubmitCancel").click(function(){
//			$("#modal_profileEditAccess").hide(0);
//			$("#screenCover").hide(0);
//		});
//	});
	/* 모달팝업_qna 등록신청 클릭시 */
	$(".fn_mngQuestion").click(function(){
		$("#screenCover").show(0);
		$("#modal_mngQuestion").show(0);
		
		$(".fn_modalSubmitCancel").click(function(){
			$("#modal_mngQuestion").hide(0);
			$("#screenCover").hide(0);
		});
	});
	/* 모달팝업_FAQ 클릭시 */
	$(".fn_FAQ").click(function(){
		$("#screenCover").show(0);
		$("#modal_FAQ").show(0);
		
		$(".fn_modalSubmitCancel").click(function(){
			$("#modal_FAQ").hide(0);
			$("#screenCover").hide(0);
		});
	});
	/* 모달팝업_프로젝트 등록신청 클릭시 */
	$(".fn_evtQuestion").click(function(){
		$("#screenCover").show(0);
		$("#modal_evtQuestion").show(0);
		
		$(".fn_modalSubmitCancel").click(function(){
			$("#modal_evtQuestion").hide(0);
			$("#screenCover").hide(0);
		});
	});
	//담당자 선택
	$(".teamAdd_list li").click(function(){
		$(this).toggleClass("teamAdd_list_active");
	});
	
	
	/* 팀 모집하기_리스트 추가 */
	//삭제기능
	$(".member_eventDelete").click(function(){
		$(this).parent("li").remove(); 
	});
	$(".member_infoDelete").click(function(){
		$(this).parent("li").remove();
	});
	/*//행사일정
	$(".fn_addSchedule").click(function(){
		$(".member_event").append("<li><p><input type='text' name='schduleDate' title='행사 날짜' placeholder='행사 날짜를 입력하세요.'/></p><p><input type='text' name='schduleMemo' title='행사 일정' placeholder='결과발표 등 주요 일정을 입력하세요.'/></p><a href='javascript:;' title='삭제'><img src='/resources/images/icon_member_delete.png' alt='삭제'/></a></li>");
		$(".member_event li:last-child").attr("class", "member_eventCreated");
		$(".member_event li:last-child p:eq(0)").attr("class", "member_eventDate");
		$(".member_event li:last-child p:eq(1)").attr("class", "member_eventInput");
		$(".member_event li:last-child a").attr("class", "member_eventDelete");
		
		$(".member_eventDelete").click(function(){
			$(this).parent("li").remove();
		});
	});*/
	//팀소개
	$(".fn_addTeamInfo").click(function(){
		$(".member_info").append("<li><p><input type='text' placeholder='제목을 입력하세요.' name='memberTeamTitle' /></p><p><textarea placeholder='내용을 입력하세요.' name='memberTeamCont'></textarea></p><a href='javascript:;' title='삭제'><img src='/resources/images/icon_member_delete.png' alt='삭제'/></a></li>")
		$(".member_info li:last-child").attr("class", "member_infoCreated");
		$(".member_info li:last-child p:eq(0)").attr("class", "member_infoTitle");
		$(".member_info li:last-child p:eq(1)").attr("class", "member_infoContent");
		$(".member_info li:last-child a").attr("class", "member_infoDelete");
		
		$(".member_infoDelete").click(function(){
			$(this).parent("li").remove();
		});
	});
	
	/* 모달팝업_이용약관 */
	$(".fn_showPolicy").click(function(){
		$("#screenCover").show(0);
		$("#modal_showPolicy").show(0);
		
		$(".fn_modalSubmitCancel").click(function(){
			$("#modal_showPolicy").hide(0);
			$("#screenCover").hide(0);
		});
	});
	
	/* 모달팝업_개인정보취급방침 */
	$(".fn_showPrivacy").click(function(){
		$("#screenCover").show(0);
		$("#modal_showPrivacy").show(0);
		
		$(".fn_modalSubmitCancel").click(function(){
			$("#modal_showPrivacy").hide(0);
			$("#screenCover").hide(0);
		});
	});
	$(".fn_modalPolPrivClose").click(function(){
		$("#modal_showPolicy").hide(0);
		$("#modal_showPrivacy").hide(0);
		$("#screenCover").hide(0);
	});
		
		
	/* 모달팝업_견적서 받기 */
	$(".fn_estimatePopup").click(function(){
		$("#screenCover").show(0);
		$("#modal_estimate").show(0);
		
		$(".fn_modalSubmitCancel").click(function(){
			$("#modal_estimate").hide(0);
			$("#screenCover").hide(0);
		});
	});
	
	/* mypage_team_social */
	$(".team_socialCategory li a").click(function(){
		$(".team_socialCategory li").removeClass("team_socialCategory_active");
		$(this).parent("li").addClass("team_socialCategory_active");
	});
	$(".team_socialOnCategoryA li a").click(function(){
		$(".team_socialOnCategoryA li").removeClass("team_socialOnCategory_active");
		$(this).parent("li").addClass("team_socialOnCategory_active");
	});
	
	/* mypage_team_member */
	$(".team_memberCategory li").click(function(){
		if( $(this).hasClass("team_memberCategory_active") ){
			$(this).removeClass("team_memberCategory_active");
		}
		else if( $(this).is(":last-child") ){
			$(".team_memberCategory li").removeClass("team_memberCategory_active");
			$(this).addClass("team_memberCategory_active");
		}
		else if(  $(this).is(":nth-child(1)") ){
			$(this).addClass("team_memberCategory_active");
			$(this).siblings().last().removeClass("team_memberCategory_active");
		}
		else if(  $(this).is(":nth-child(2)") ){
			$(this).addClass("team_memberCategory_active");
			$(this).siblings().last().removeClass("team_memberCategory_active");
		}
		else if(  $(this).is(":nth-child(3)") ){
			$(this).addClass("team_memberCategory_active");
			$(this).siblings().last().removeClass("team_memberCategory_active");
		}
		else if(  $(this).is(":nth-child(4)") ){
			$(this).addClass("team_memberCategory_active");
			$(this).siblings().last().removeClass("team_memberCategory_active");
		}
		else if(  $(this).is(":nth-child(5)") ){
			$(this).addClass("team_memberCategory_active");
			$(this).siblings().last().removeClass("team_memberCategory_active");
		}
		else{
			$(this).addClass("team_memberCategory_active");
		}
	});

	
	/* 로그인 임시 */
	$(".member_icon").mouseover(function(){
		$(".member_list").css("opacity", "1");
		$(".member_icon_function i").css("opacity", "1");
	});
	$(".member_icon").mouseout(function(){
		$(".member_list").css("opacity", "0");
		$(".member_icon_function i").css("opacity", "0");
	});
	
	/* gnb 글씨 색상변경 */
	$("#gnb ul li").click(function(){
		$("#gnb ul li").removeClass("active");
		$(this).addClass("active");
	});
	

});


//url 이동 함수
function jump( tagId ){
	
    var top = $( "#"+ tagId ).offset().top;
    window.scrollTo(0, top);
    
}

//파일 업로드

var paymentCnt = 0;
var imgIdValue = '';
var bannerType = '';
function fn_fileUpload(data){
//	$('.mpt_thumb_img').css({'background-image': 'url(/resources/assets/images/sub/profile_default_img.png)'});
//	$('.myinfo_thumb_label').css({'background-image': 'url(/resources/assets/images/sub/profile_default_img.png)'});
//	$('.hm_my_btn').css({'background-image': 'url(/resources/assets/images/sub/profile_default_img.png)'});
//	$('.mnc_btn.me.grayJin').css({'background-image': 'url(/resources/assets/images/sub/profile_default_img.png)'});
	
	var img = '';
	if( data.FLD_NAME == "" ) return ;
	if ( data.FILES.length > 0 ) $("#"+imgIdValue+"List").show();
	else $("#"+imgIdValue+"List").hide();
	
	$('#imgTag').val( '' );

	$("#"+imgIdValue+"List").children().remove(); 

	$.each(data.FILES, function(key, val){
		var $obj = $("#"+imgIdValue+"ListClone").children().clone(true);		
		$obj.find(".fileName").text( val.FILE_NAME );
		if ( val.FILE_EXISTS == "Y" ){
			$obj.find(".fileName").attr("onclick", "unit_fileDown('"+ val.FILE_UUID +"')" );
		} else {
			$obj.find(".fileName").attr("onclick", "alert('파일이 존재하지 않습니다.');" );
		}	
		$obj.find(".fileSize").text( cvMbyte(val.FILE_SIZE, 1) ) ;	
		$obj.find(".close").attr(
				"onclick",
				"imgIdValue='"+imgIdValue+"';" +
				"unit_fileDel('"+ val.FILE_UUID +"', 'fn_fileUpload', '"+ val.FILE_UUID +"');" +
				"$('#"+imgIdValue.replace('_FILE','')+"').val('');"
		);

		var exUrl = window.location.pathname;
		
		if( exUrl.indexOf('_solution') > -1 && imgIdValue != 'USER_UUID_FILE' ) {
			$("#"+imgIdValue+"List").append( $obj );
			$("#"+imgIdValue.replace('_FILE','')).val(val.UNIT_UUID);
		} else if( exUrl.indexOf('_solution') < 0 ) {
			$("#"+imgIdValue+"List").append( $obj );
			$("#"+imgIdValue.replace('_FILE','')).val(val.UNIT_UUID);
		} 
		
		img = unit_fileImage( val.FILE_UUID );
		$('#imgTag').val( img );
		
		if( val.FLD_NAME == 'EMOTION_FILE' ){ fileArr.push( unit_fileImage( val.FILE_UUID ) ); fileExistsArr.push( val.FILE_EXISTS ); }
		if( val.FLD_NAME == 'REVI_UUID_FILE' ){ fileArr.push( unit_fileImage( val.FILE_UUID ) ); fileExistsArr.push( val.FILE_EXISTS ); }
		
		if( imgIdValue.indexOf('DATA_UUID') > -1 ){ if( val.FLD_NAME == imgIdValue ) fileArr.push( val.FILE_UUID ); fileExistsArr.push( val.FILE_EXISTS ); }
//		console.log( key+ ', ' + fileArr + ', ' + val.FILE_UUID );
		
//		1:1문의 첨부파일 다운로드
		if (val.FLD_NAME == 'QNA_USER_UUID_FILE') {
			console.log( val.FILE_NAME );
			if ( val.FILE_EXISTS == "Y" ) $('#inQuiryUFile > p.file').append( '<a href="javascript:;" class="board_detail_file_link" onclick="unit_fileDown(\''+val.FILE_UUID+'\');">'+ val.FILE_NAME +'</a>' );
			else $('#inQuiryUFile > p.file').append( '<a href="javascript:;" class="board_detail_file_link" onclick="alert(\'파일이 존재하지 않습니다.\');">'+ val.FILE_NAME +'</a>' );
//			$('p.file > a').text( val.FILE_NAME );
		}else if (val.FLD_NAME == 'QNA_MNG_UUID_FILE') {
			if ( val.FILE_EXISTS == "Y" ) $('#inQuiryMFile > p.file').append( '<a href="javascript:;" class="board_detail_file_link" onclick="unit_fileDown(\''+val.FILE_UUID+'\');">'+ val.FILE_NAME +'</a>' );
			else $('#inQuiryMFile > p.file').append( '<a href="javascript:;" class="board_detail_file_link" onclick="alert(\'파일이 존재하지 않습니다.\');">'+ val.FILE_NAME +'</a>' );
//			$('p.file > a').text( val.FILE_NAME );
		}
		
	});
	
	$('[id^="unit_download"]').hide();
}


function setCookie(cName, cValue, cDay){
    var expire = new Date();
    expire.setDate(expire.getDate() + cDay);
    cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
    if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
    document.cookie = cookies;
}	

function getCookie(cName) {
    cName = cName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cName);
    var cValue = '';
    if(start != -1){
        start += cName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cValue = cookieData.substring(start, end);
    }
    return unescape(cValue);
}

function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
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



//기간 선택 기능 중, 앞의 날짜와 뒤에 날짜의 유효성 검사
function inputDateSplit(obj) {
  var dateArray = obj.split("-");
  return dateArray[0] + dateArray[1] + dateArray[2];
}



//이메일 유효성 검사
function fn_emailTest( testEmail ) {
	var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	if ( !regEmail.test( testEmail ) ) return 1;
	else return 0;
}

//  폰번호 유효성 검사
function fn_isCelluar( asValue ) {

	var regExp = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;

	if ( !regExp.test( asValue )  ) return 1; // 형식에 맞는 경우 0 리턴
	else return 0;

}

//숫자 세자리마다 , 찍어주는 정규식
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
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
//		console.log ( tagArr[a++] + " : " + key + " : " + val );
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

//faq 노출여부 버튼 변경
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
	params.frontLoginIdx = sessionStorage.getItem("frontLoginIdx");
	
	fn_DataAjax( params );
}


var idIsc = false;
function fn_BtnDupl( dupleId, division ) {
	var params = new Object();
	params.status = "CHECK";
	params.query = "selectFrontAccountIdDuple";
	params.dupleId = dupleId;
	params.division = division;
	
	var result = fn_DataAjax2( params );
	if (result.out.detail.data[0].CNT > 0){
		idIsc = false;
	}
	else{
		idIsc = true;
	}
	return result.out.detail.data[0].SNS_TYPE;
}
var snsIsc = false;
function fn_BtnSNSDupl( dupleId, sns ) {
	var params = new Object();
	params.status = "CHECK";
	params.query = "selectFrontAccountIdDuple";
	params.dupleId = dupleId;
	params.division = 'SNS';
	params.snsType = sns;
	
	var result = fn_DataAjax2( params );
	if (result.out.detail.data[0].CNT > 0){
		snsIsc = false;
	}
	else{
		snsIsc = true;
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




//'PDF, ZIP, JPG, PNG, GIF 만 허용시켜주는 함수 onchange로 넣어야함
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

//이미지만 허용시켜주는 함수
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

//엑셀만만 허용시켜주는 함수
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
//	  return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
//	    (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
//	  );
	// IE에서 람다식을 인식하지 못하여 대체
	return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, function(c){
		var r = (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
		return r;
	});
}

//탑메뉴 누르면 색바꿔주눈거
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

/******************************************************
	date Picker function
******************************************************/
function datePickerSet(sDate, eDate) {
    var monthNames = [ '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12' ];
    var dayNamesMin =  ['일', '월', '화', '수', '목', '금', '토'];
    var dateFormat = "yy-mm-dd";

    var startDate = null;
    var endDate = null;
    var selectDaylist = [];
    
    function getDaysArray(start, end) {
        for(var arr=[], dt=new Date(start); dt<=end; dt.setDate(dt.getDate()+1)){
            arr.push(new Date(dt).toISOString().slice(0,10));
        }
        return arr;
    };
    
    var dates = eDate.add(sDate).datepicker({
        inline: true,
        showOtherMonths: true,
        showMonthAfterYear: true,
        selectOtherMonth:true,
        monthNames: monthNames,
        dayNamesMin: dayNamesMin,
        dateFormat: dateFormat,
        beforeShowDay: changeDatas,
    }).datepicker('setDate', new Date(new Date()))
     
    startDate = sDate.val();
    endDate = sDate.val();
    
    sDate.datepicker("option", "onSelect", function (selectedDate){
        startDate = selectedDate;
        eDate.datepicker( "option", "minDate", selectedDate );
        if(selectDaylist){
            selectDaylist = getDaysArray(new Date(startDate),new Date(endDate));
        }
        setTimeout (function () {eDate.focus();}, 0 ); 
    });
    eDate.datepicker("option", "onSelect", function (selectedDate){
        endDate = selectedDate;
        selectDaylist = getDaysArray(new Date(startDate),new Date(endDate));
    });
    
    function changeDatas(d){
        var string = jQuery.datepicker.formatDate('yy-mm-dd', d);

        if($.inArray(string, selectDaylist) == -1){
            return [true,''];
        }else{
            if(string == selectDaylist[0] || string == selectDaylist[selectDaylist.length - 1]){
                return [true,"style_range custom_style_range"];
            }else{
                return [true,"style_range"];
            }
        }
    }
}

$(function(){
	if( $("#startDate").html() != null ) datePickerSet( $("#startDate"), $("#endDate") );
});

// 상담 전체횟수 / 상담 남은 횟수 *100
var calcProgress = function ( maxCnt, haveCnt ){
	return Math.round(haveCnt/maxCnt *100);
}




//회원 이미지 출력
function fn_setUserUuid( UUID, UUID_FILE ) {
	if( UUID != 'undefined' ) {
		imgIdValue = UUID_FILE;
		setUuid( UUID );
		unit_fileGet( imgIdValue, "fn_fileUpload");
	}
}


function isMobile() {
		if(navigator.userAgent.match(/Android/i)){
			
		}else if(navigator.userAgent.match(/iPhone|iPad|iPod/i)){
			
		}else{
			//PC
			return false;
		}
		return true;
}



function ConvertHtmltoSystemSource( PARAMS ){
	$.each(PARAMS[0], function(key, val){
		if( key.indexOf('TITL') > 0 ) {
			if( val != null ) {
				val = val.replace(/&amp;/g,"&");
				val = val.replace(/&lt;/g,"<");   
				val = val.replace(/&gt;/g,">");   
				val = val.replace(/&quot;/g,'"');
				val = val.replace(/&#39;/g,"'"); 
				val = val.replace(/<br \/>/g,"\n");
				PARAMS[0][key] = val.replace(/&#63;/g,"?");
			}
		}
	});
	return PARAMS;
}

function convertBr( html ){
	return html.replace(/\n/g,"<br>").replace(/</g,"&lt;");
}

function replaceVod( code ){
																																		// html 문자 치환
																											//	code = code.replace( '&#63;','?' );
	return code.replace('https://www.youtube.com/embed/', '').replace('https://www.youtube.com/watch&#63;v=','').replace('https://youtu.be/','');
}


function getYojiiFileInfo( filename ){
	var url = 'https://www.kaster.co.kr/api/get_fileinfo.php?owner=peoplemade&filepath=' + filename;
	var json;
	$.get( url , function(data){ json = data; }, "json");
	return json;
}







