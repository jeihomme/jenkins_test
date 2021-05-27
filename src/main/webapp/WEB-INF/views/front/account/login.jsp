<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<style>

#naverIdLogin_loginButton img{display:none;}
#naverIdLogin_loginButton { line-height: 62px !important;position: absolute; left: 120px;}


@media screen and (max-width: 1250px){
	.login_box2 {padding-top: 40px !important;}
	.naver_btn{text-align: center;    line-height: 43px;}
}

</style>
    <div id="container">
        <div class="account_container section_inner">
            <div class="sub_nav_box">
                <ul class="sub_nav">
                    <li><a href="/front/main/index" class="home"></a></li>
                    <li><a href="#">계정</a></li>
                    <li><a href="#" class="current">로그인</a></li>
                </ul>
            </div>

            <div class="account_box login_box">
                <div class="account_form">
                    <p class="account_item">
                        <input type="email" id="USER_EMAIL" name="USER_EMAIL" class="account_input" placeholder="이메일 주소" onkeypress="if(event.keyCode==13){fn_BtnLogin();}">
                    </p>
                    <p class="account_item">
                        <input type="password" id="USER_PW" name="USER_PW" class="account_input" placeholder="비밀번호" onkeypress="if(event.keyCode==13){fn_BtnLogin();}" >
                    </p>
                    <p class="account_item_double">
                        <button type="button" onclick="fn_BtnLogin();" class="account_btn">로그인</button>
                    </p> 
                    <p class="account_item">
                    
                    <label for="terms1" class="form_check">
                                        <input type="checkbox" id="terms1" name="terms">
                                        <span class="form_check_mark"></span>
                                  <label for="keepLoginCheck" class="custom_sq_text">로그인 상태 유지</label>
                                    </label>
<!--                         <span class="account_left2"> -->
<!--                             <input type="checkbox" id="keepLoginCheck" class="custom_sq_check"> -->
<!--                             <label for="keepLoginCheck" class="custom_sq_label"></label> -->
<!--                             <label for="keepLoginCheck" class="custom_sq_text">로그인 상태 유지</label> -->
<!--                         </span> -->
                        <span class="account_right">
                        <!-- ${unit.move( 'tab',  out.params.cateIdx, 'cate' , 'viewSale' ) } -->
                            <a href="/front/account/find_account" class="find_link">아이디(이메일), 비밀번호 찾기</a>
<!--                             <a href="/front/account/find_account" class="find_link">아이디(이메일), 비밀번호 찾기</a> -->
                        </span>
                    </p>
                </div>

                <div class="account_bd_box">
                    <button id="create-kakao-login-btn" type="button" class="sns_btn kakao_btn">카카오계정으로 로그인</button>
                    <div id="naverIdLogin" class="sns_btn naver_btn tablets_naver_btn">네이버계정으로 로그인</div>
<!--                     <button type="button" class="sns_btn naver_btn">네이버계정으로 로그인</button> -->
                    <button id="googleLoginBtn" type="button" class="sns_btn google_btn tablets_google_btn phones_google_btn" onclick="startApp();">구글계정으로 로그인</button>
                </div>

                <div class="register_link_box">
                    <span class="rl_text">
                        아직 피플메이드에 가입하지 않으셨다면?
                    </span>
                    <a href="/front/account/register_select" class="account_btn account_btn_border">회원가입</a>
                </div>
            </div><!-- //.account_box  -->
        </div>
    </div><!-- // #container -->

 
<script src="//cdn.rawgit.com/placemarker/jQuery-MD5/master/jquery.md5.js"></script>
<script>

$(function(){
	 
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("key");
    $("#USER_EMAIL").val(key);
     
    if($("#USER_EMAIL").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#terms1").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#terms1").change(function(){ // 체크박스에 변화가 있다면,
        if($("#terms1").is(":checked")){ // ID 저장하기 체크했을 때,
            setCookie("key", $("#USER_EMAIL").val(), 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#USER_EMAIL").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#keepLoginCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            setCookie("key", $("#USER_EMAIL").val(), 7); // 7일 동안 쿠키 보관
        }
    });
    
    $( '#now_loading' ).hide();
    
});

function fn_BtnLogin() {
// 	1. 유효성 검사를 위한 파라미터값
	var params = new Object();
	params.userEmail = $('[name=USER_EMAIL]').val();
	params.userPw =  $.md5( $('[name=USER_PW]').val() );
	params.status = "CHECK";
	params.query = "selectFrontLoginCheck";
	
//	2. 유효성 검사 서비스로 이동
	var result = fn_DataAjax2( params );
	if ( unit_isComplete(result) ){
		
		var jsonDetail = result.out.detail.data;
		if( !jsonDetail.length ){
			params.query = "selectFrontUserData";
			params.status = "DETAIL";
			
			var userData = fn_DataAjax2( params );
			
			userData = userData.out.detail.data;
			
			if ( userData.length ) {
				// 있을때
				if( userData.USER_USE_YN != 'Y' ){
					return alert('탈퇴 된 회원입니다. \n30일 동안 동일한 아이디로 재가입이 불가합니다.');
				}
			}else{
				//  data 없을때
				return alert("아이디 혹은 비밀번호를 입력해주세요.");
			}
		}
		
// INFO |---------|---------------------|----------|--------|----------|--------------|----------|----------------------|-------------|-----------------------------------------------| 
// INFO |USER_IDX |USER_EMAIL           |USER_NICK |USER_NM |USER_INFO |USER_SNS_TYPE |USER_TYPE |USER_LONG_NON_CONN_YN |USER_REST_YN |USER_UUID                                      | 
// INFO |---------|---------------------|----------|--------|----------|--------------|----------|----------------------|-------------|-----------------------------------------------| 
// INFO |4        |user1@bluelime.co.kr |아이폰SE2    |김블루     |블루라임 김블루  |[null]        |U         |[null]                |N            |20201217133227d9badbf5e58446878bbfc14eccea0b79 | 
// INFO |---------|---------------------|----------|--------|----------|--------------|----------|----------------------|-------------|-----------------------------------------------| 
		 
		localStorage.setItem("frontLoginIdx", jsonDetail[0].USER_IDX ); 
		localStorage.setItem("frontLoginId", jsonDetail[0].USER_EMAIL ); 
		localStorage.setItem("frontUserInfo", jsonDetail[0].USER_INFO ); 
		localStorage.setItem("frontUserType", jsonDetail[0].USER_TYPE ); 
		localStorage.setItem("frontUserPhone", jsonDetail[0].USER_PHONE ); 
		localStorage.setItem("frontUserSnsType", jsonDetail[0].USER_SNS_TYPE ); 
		localStorage.setItem("frontLoginNm", jsonDetail[0].USER_NM ); 
		localStorage.setItem("frontLoginNick", jsonDetail[0].USER_NICK ); 
		localStorage.setItem("frontLoginUuid", jsonDetail[0].USER_UUID );
		sessionStorage.setItem("isLogin", "Y");
		localStorage.setItem("frontLoginOn", 'Y' );
		
		if( $("#terms1").is(":checked") ) localStorage.setItem("frontLoginPcOn", 'Y' );
		else localStorage.setItem("frontLoginPcOn", 'N' );
		
		if( jsonDetail[0].USER_REST_YN == 'Y' ) alert('휴면상태가 해제되었습니다.');
		
		if('${header.referer}'.indexOf('/front/mypeoplemade') > -1) location.replace('${header.referer}');
		else if('${header.referer}'.indexOf('/front/master') > -1) location.replace('${header.referer}');
		else if('${header.referer}'.indexOf('/front/prdt') > -1) location.replace('${header.referer}');
		else location.replace('/front/main/index');
	} else {
		return alert("아이디 혹은 비밀번호를 입력해주세요.");
	}
}



</script>

