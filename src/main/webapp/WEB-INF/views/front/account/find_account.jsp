<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

    <div id="container">
        <div class="account_container section_inner">
            <div class="sub_nav_box">
                <ul class="sub_nav">
                    <li><a href="/front/main/index" class="home"></a></li>
                    <li><a href="#">계정</a></li>
                    <li><a href="#" class="current">아이디/비밀번호 찾기</a></li>
                </ul>
            </div>

            <div class="account_box">
                <div class="find_item">
                    <h3 class="find_title id_find">아이디(이메일)찾기</h3>
                    <!-- <p class="find_text">
                        가입시 입력하신 이름과 핸드폰번호를 입력해 주세요.
                    </p> -->
                    <div class="account_form">
                        <p class="account_item">
                            <input type="text" name="ID_USER_NM" class="account_input" placeholder="이름">
                        </p>
                        <p class="account_item">
                            <input type="text" name="ID_USER_PHONE" class="account_input" placeholder="핸드폰번호" maxlength="11" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                        </p>
                        <p class="account_item">
                            <button type="button" class="account_btn" onclick="fn_BtnFindId();">확인</button>
                        </p>
                        <div id="childRegisterPop" class="popup_wrap">
	                        <div id="popup-alert0" class="popup-alert phones_popup-alert">
		                        <div class="popup-alert-inn">
			                        <div class="popup-alert-text-area">
			                        </div>
			                    </div>
		                        <div class="popup-alert-btn-area type1">
			                        <button type="button" class="btn-confirm-popup-alert  btnclosemail">확인</button>
			                        <button type="button" class="btn-cancel-popup-alert btnclosemail">취소</button>
		                        </div>
	                        </div>
                        </div>
                    </div>
                </div>
                <div class="find_item account_bd_box">
                    <h3 class="find_title pw_find">비밀번호 찾기</h3>
                    <!-- <p class="find_text">
                        가입시 입력하신 이름과 아이디(이메일)와 핸드폰번호를 입력해 주세요.<br class="pc_show"> 
                    </p> -->

                    <div class="account_form">
                        <p class="account_item">
                            <input type="text" name="PW_USER_NM" class="account_input" placeholder="이름">
                        </p>
                        <p class="account_item">
                            <input type="email" name="PW_USER_EMAIL" class="account_input" placeholder="계정 ( 이메일 )">
                        </p>
                        <p class="account_item">
                            <input type="text" name="PW_USER_PHONE" class="account_input" placeholder="핸드폰번호" maxlength="11" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                        </p>
                        <p class="account_item">
                            <button type="button" class="account_btn" onclick="fn_BtnFindPw();">확인</button>
                        </p>
                        <div id="childRegisterPop2" class="popup_wrap">
                        <div id="popup-alert0" class="popup-alert">
                        <div class="popup-alert-inn">
                        <div class="popup-alert-text-area">
                        <p class="popup-alert-text">임시비밀번호를 회원가입시 등록하신 이메일로 발송하였습니다.</p>
                        </div>
                        </div>
                        <div class="popup-alert-btn-area type1">
                        <button type="button" class="btn-confirm-popup-alert  btnclosemail2">확인</button>
                        <button type="button" class="btn-cancel-popup-alert btnclosemail2">취소</button>
                        </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div><!-- //.account_box  -->
        </div>
    </div><!-- // #container -->


<!-- <script type="text/javascript" src="/resources/assets/js/jquery-1.12.4.min.js"></script> -->
<!-- <script type="text/javascript" src="/resources/assets/js/slick.min.js"></script> -->
<!-- <script type="text/javascript" src="/resources/assets/js/jquery.waypoints.min.js"></script> -->
<!-- <script type="text/javascript" src="/resources/assets/js/common.js"></script> -->

<script src="//cdn.rawgit.com/placemarker/jQuery-MD5/master/jquery.md5.js"></script>
<script>

$( '#now_loading' ).hide();

$('.btnclosemail').click(function(){
	$('#childRegisterPop').hide();
	location.reload();
});

$('.btnclosemail2').click(function(){
	$('#childRegisterPop2').hide();
	location.reload();
});

function fn_BtnFindId(){
	if( $('[NAME=ID_USER_NM]').val() == '' || $('[NAME=ID_USER_PHONE]').val() == '' ) {
		return alert('이름/핸드폰번호를 입력해주세요.');
	}
	
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectFrontAccountFindId";
	params.ID_USER_NM = $('[NAME=ID_USER_NM]').val();
	params.ID_USER_PHONE = $('[NAME=ID_USER_PHONE]').val();
	
	var result = fn_DataAjax2( params);
	
	$('#childRegisterPop .popup-alert-text-area').empty();
	
	if ( result.out.detail.data.length == 0 ) {
		
		$('#childRegisterPop .popup-alert-text-area').append('<p class="popup-alert-text">가입하신 이메일 주소가 없습니다.</p>');
		$('.popup_wrap').hide();
		$('#childRegisterPop').show();
	}else{
		if (result.out.detail.data[0].USER_USE_YN == 'Y' ) {
			var mail = result.out.detail.data[0].USER_EMAIL.split('@');
			
			var mailfront = mail[0].substring( 0 , Math.floor( mail[0].length/2 ) );
			for (var i = 0; i < mail[0].length - Math.floor( mail[0].length/2 ); i++) {
				mailfront += '*';
			}
			
			$('#childRegisterPop .popup-alert-text-area').append( '<p class="popup-alert-text">가입하신 이메일 주소는<br>'+mailfront+'@'+mail[1]+'<br>입니다.</p>' );
			$('#childRegisterPop p').text();
			$('.popup_wrap').hide();
			$('#childRegisterPop').show();
			
		}else{
			$('#childRegisterPop .popup-alert-text-area').append( '<p class="popup-alert-text">탈퇴된 계정입니다.</p>' );			
			$('.popup_wrap').hide();
			$('#childRegisterPop').show();
		}
	}
	
}

function fn_BtnFindPw() {
	if( $('[NAME=PW_USER_NM]').val() == '' || $('[NAME=PW_USER_EMAIL]').val() == '' || $('[NAME=PW_USER_PHONE]').val() == '' ) {
		return alert('이름/계정/핸드폰번호를 입력해주세요.');
	}
	
	var USER_PW = fn_GetUuid().substr(14,6);
	var params = new Object();
	params.USER_PW = USER_PW;
	params.USER_PW_MD5 = $.md5( USER_PW );
	params.PW_USER_NM = $('[NAME=PW_USER_NM]').val();
	params.PW_USER_EMAIL = $('[NAME=PW_USER_EMAIL]').val();
	params.PW_USER_PHONE = $('[NAME=PW_USER_PHONE]').val();
	params.status = "DETAIL";
	params.query = "selectFrontAccountData";
	var result = fn_DataAjax2( params );
	console.log(result);
	
	if( result.out.detail.data.length > 0 ){
		result = result.out.detail.data[0];
		if ( result.USER_USE_YN == 'N' ) {
			$('#childRegisterPop .popup-alert-text-area').append( '<p class="popup-alert-text">탈퇴된 계정입니다.</p>' );			
			$('.popup_wrap').hide();
			$('#childRegisterPop').show();
		}else{
			params.status = "EDIT_MAIL";
			params.query = "updateFrontAccountData";
			params.LINK_URL = window.location.href.replace('find_account', 'login');
			params.HIST_SUBJECT = "[피플메이드] 임시비밀번호입니다.";
		// 	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
			
			var result = fn_DataAjax( params, 'N' );
			location.href='${unit.move("index", "" )}';
			$('#childRegisterPop2').show();
		}
		
	}else{
		$('#childRegisterPop .popup-alert-text-area').append( '<p class="popup-alert-text">일치하는 계정이 없습니다</p>' );			
		$('.popup_wrap').hide();
		$('#childRegisterPop').show();
	}
	
	
}

</script>








