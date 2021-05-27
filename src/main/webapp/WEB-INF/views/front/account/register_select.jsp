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
                    <li><a href="#" class="current">회원가입</a></li>
                </ul>
            </div>

            <div class="account_box login_box">
                <div class="register_select_box">
                    <a href="/front/account/register" class="account_btn">이메일로 가입하기</a>

                    <hr class="account_sepa">

                    <button id="create-kakao-login-btn" type="button" class="sns_btn kakao_btn" >카카오계정으로 로그인</button>
<!--                     <button type="button" class="sns_btn naver_btn">네이버계정으로 간편가입</button> -->
                    <div id="naverIdLogin" class="sns_btn naver_btn">네이버 아이디로 로그인</div>
<!--                     <div class="g-signin2" data-onsuccess="onSignIn"></div> -->
                    <button id="googleLoginBtn" type="button" class="sns_btn google_btn tablets_google_btn phones_google_btn" onclick="startApp();">구글계정으로 로그인</button>
                </div>

                <div class="account_bd_box">
                    <span class="regi_login_text">이미 계정이 있으신가요?</span>
                    <a href="/front/account/login" class="regi_login_link">기존 계정으로 로그인하기</a>
                </div>
            </div><!-- //.account_box  -->
        </div>
    </div><!-- // #container -->

 
<script>


// $('#create-kakao-login-btn').text('카카오계정으로 로그인');
// $('#naverIdLogin').text('네이버 아이디로 로그인');
var joinType = "";
var USER_SNS_TYPE = "";

var USR_NICK = "";
var USR_AGE = "";
var USR_BIRTHDAY = "";
var USR_GENDER = "";
$( '#now_loading' ).hide();

</script>

