<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="baseURL" value="${fn:replace(req.requestURL, fn:substring(req.requestURI, 0, fn:length(req.requestURI)), req.contextPath)}" />
<c:set var="pathUrl" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" /> 
<c:set var="excelUrl" value="/${fn:split( pathUrl ,'/')[0]}/${fn:split( pathUrl ,'/')[1]}/excel" /> 

<!DOCTYPE html>
<html lang="ko">

<style>
	.banner{ display:none; }
	.hmlogout{ display:none; }
	.mo_my_info_login{ display:none; }
	.mo_mypeople{ display:none; }
	.w20{width: 20px;}
	.payTable {margin: auto;}
	.payTable td:not(.total){ font-size: 19px; }
	td.total{
		text-align: center;
		margin0-top: 25px;
	    margin-bottom: 20px;
	    color: #27f1d5;
	    font-size: 20px;
	    font-weight: 700;
	}
	.mb10{ height: 10px; }
</style>

<head>
  <meta charset="utf-8"/>
  <title>피플메이드</title>
  
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, user-scalable=no" />
	<meta http-equiv="X-UA-Compatible" content="IE=10" />
	<link rel="shortcut icon" type="image/x-icon" href="/resources/assets/images/ico/peoplemade_favicon.ico" />
	
	<meta name="format-detection" content="telephone=no"/>
	<meta name="naver-site-verification" content="bf91e717d6fba07cec6ee668bce6943d9d6f0251"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0"/>
<!-- 	<meta name="google-signin-client_id" content="29882695424-nkp55onmr849eop3av67qernr2fapc1n.apps.googleusercontent.com"> -->
  
	<c:if test="${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] eq 'payment' }">
		<meta http-equiv="Cache-Control" content="no-cache"> 
		<meta http-equiv="Pragma" content="no-cache"> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	</c:if>
  
  <!--Basic Scripts-->
<!--   <script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script> -->
<script type="text/javascript" src="/resources/assets/js/jquery-1.12.4.min.js"></script>
  <script type="text/javascript"  src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>

  <!-- UNIT -->
   <script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
    <link href="/resources/css/font-awesome.min.css" rel="stylesheet" />
  <script type="text/javascript" src="https://kit.fontawesome.com/35f90b3902.js"></script>
  <script type="text/javascript" src="/resources/js/jquery.slimscroll.min.js"></script> 
  <script type="text/javascript" src="${root}/unit.iwonsoft.com/base.js?uid=${uid}"></script>
  
  <!-- JS -->
  <script type="text/javascript" src="/resources/assets/js/common.js"></script>
  <script type="text/javascript" src="/resources/assets/js/slick.min.js"></script>
  <script type="text/javascript" src="/resources/assets/js/jquery.waypoints.min.js"></script>
  <script src="/resources/js/common.js"></script>
  
  <!--CSS   -->
  <link href="/resources/assets/css/slick.css" rel="stylesheet" type="text/css" />
  <link href="/resources/assets/css/base.css" rel="stylesheet" type="text/css" />
  <link href="/resources/assets/css/common.css" rel="stylesheet" type="text/css" />
  <link href="/resources/assets/css/main.css" rel="stylesheet" type="text/css" />
  <link href="/resources/assets/css/sub.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" href="/resources/assets/css/tablets.css">
  <link rel="stylesheet" href="/resources/assets/css/phones.css">

<!--   카카오 api -->
  <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!--   구글 api -->
  <script src="https://apis.google.com/js/api:client.js"></script>
<!--   네이버 api -->
  <script type="text/javascript" src="/resources/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
  
<!-- 	  피플메이드 css -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet"><!-- font-family: 'Noto Sans KR', sans-serif; -->
    <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@600&display=swap" rel="stylesheet"><!-- font-family: 'Titillium Web', sans-serif; -->
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
  
<!-- 썸머노트 -->
<!-- 	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> -->
<!-- 	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> -->
<!-- 	<script type="text/javascript" src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script> -->
  
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-84NRC0X9LL"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag(){dataLayer.push(arguments);}
	gtag('js', new Date());
	gtag('config', 'G-84NRC0X9LL');
</script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<!-- <script async src="https://www.googletagmanager.com/gtag/js?id=G-KYED742V4E"></script> -->
<script>
//   window.dataLayer = window.dataLayer || [];
//   function gtag(){dataLayer.push(arguments);}
//   gtag('js', new Date());

//   gtag('config', 'G-KYED742V4E');
</script>

</head>
<body >
	<div id="now_loading" style="width: 100%; height: 100%; position: fixed;background-color: black; z-index: 999999;">
	<img src="/resources/assets/images/common/loading_img.gif" 
	style="position: absolute;
    top: calc(50% - 64px);
    left: calc(50% - 64px);
    width: auto;
    height: auto;"
     alt="the loading" title="now loading">
    </div>
	<div id="screenCover"></div>
	<div id="wrap">
   	<div class="topbar"></div>
    <div class="section_inner">
        <span class="topbar_text">
            <button type="button" class="topbar_close"></button>
        </span>
    </div>

    <div id="header" class="header">
        <div class="section_inner">
            <div class="header_top">
                <h1 class="header_logo"><a href="/front/main/index">PEOPLEMADE</a></h1>
                
	            <div class="header_mypeople hmlogin" style="display:none;">
	                <!-- 로그아웃 시  -->
	                <a href="/front/account/login" class="hm_title">로그인</a>
	                <a href="/front/account/register_select" class="hm_title">회원가입</a>
	            </div>
	            
                <div class="header_mypeople hmlogout">
                    <a href="/front/mypeoplemade/network">
                        <span class="hm_title">마이피플</span>
                    </a>
                    <div class="hm_box">
                        <span class="hm_name">
                            <span></span>님
                        </span>
                        <span class="hm_thumb" style="background-image: url(/resources/assets/images/sub/profile_default_img.png);">
                            <span class="hm_arrow"></span>
                        </span>
                    </div>
                    <div class="hm_dropdown">
                        <ul class="hm_list">
                            <li><a href="/front/mypeoplemade/network">마이피플</a></li>
                            <li><a href="/front/mypage/payment">주문내역</a></li>
                            <li><a href="/front/mypage/cart">장바구니</a></li>
                       <li> <a onclick="fn_BtnLogout();" style="cursor: pointer;">로그아웃	</a></li>
                        </ul>
                    </div>
                </div>
                
            </div>
            <div class="header_gnb_box">
                <button type="button" class="mo_gnb_btn"></button>
                <div class="mo_gnb_box">
                    <div class="mo_gnb_layer"></div>
                    <div class="mo_gnb tablets_mo_gnb">
                        <button type="button" class="mo_gnb_btn_close"></button>
                        <div class="mo_gnb_top">
                            <div class="mo_gnb_header">
                                <h1 class="mo_header_logo"><a href="/front/main/index">PEOPLEMADE</a></h1>
                                <a href="/front/mypeoplemade/network" class="mo_mypeople">마이피플</a>
                            </div>
                            <div class="mo_my_info mo_my_info_login">
                                <div class="mmi_cell">
                                    <span class="mmi_thumb" style="background-image: url(/resources/assets/images/icon/icon_logout.png);"></span>
                                </div>
                                <div class="mmi_cell mmi_info">
                                    <span class="mmi_name"><b></b>님</span>
                                    <span class="mmi_email"></span>
                                    <a onclick="fn_BtnLogout();" style="cursor: pointer;"><button type="button" class="mmi_logout">로그아웃</button></a>
                                </div>
                                <div class="mmi_cell">
                                    <a href="/front/mypeoplemade/myinfo" class="mmi_edit"></a>
                                </div>
                            </div>
                            <div class="mo_my_info mo_my_info_logout">
                                <div class="mmi_cell">
                                    <!-- .logout -->
                                    <span class="mmi_thumb logout"></span>
                                </div>
                                <div class="mmi_cell mmi_login">
                                    <a href="/front/account/login" class="login_link">로그인해주세요</a>
                                </div>
                            </div>
                        </div>
                        
                        <div class="mo_gnb_over_box">
                            <div class="mo_gnb_list_box">
                                <ul class="mo_gnb_list">
                                    <li><a href="/front/guide/guider"  class="top">서비스 소개</a></li>
                                    <li><a href="javascript:;" onclick='fn_BtnPrdtLink( "VOD" );' class="bottom">VOD</a></li>
                                    <li><a href="javascript:;" onclick='fn_BtnPrdtLink( "1:1 코칭" ); ' class="bottom">1:1 코칭</a></li>
                                </ul>
                                <ul class="mo_gnb_list">
                                    <li><a href="javascript:;" onclick='fn_BtnPrdtLink( "LIVE CLASS" );' class="top">LIVE CLASS</a></li>
                                    <li><a href="/front/mypage/payment" class="bottom">주문내역</a></li>
                                    <li><a href="/front/mypage/cart" class="bottom">장바구니</a></li>
                                    <li><a href="/front/faq/faq" class="bottom">FAQ</a></li>
                                </ul>
                                <ul class="mo_gnb_list">
                                    <li><a href="/front/service/inquiry" class="top">1:1 문의</a></li>
                                    <li><a href="/front/service/event" class="bottom">이벤트</a></li>
                                    <li><a href="/front/service/notice" class="bottom">공지사항</a></li>
                                </ul>
                                <ul class="mo_gnb_list">
                                    <li><a href="/front/service/notice_paper" class="top">언론보도</a></li>
                                    <li><a href="/front/master_apply/door" class="bottom">마스터 지원</a></li>
                                </ul>
                            </div>
        
                            <div class="mo_sns_box">
                                <ul class="mo_sns">
                                    <li><a onclick="alert('준비중입니다.')" class="face">Facebook</a></li>
                                    <li><a onclick="alert('준비중입니다.')" class="youtube">Youtube</a></li>
                                    <li><a  onclick="alert('준비중입니다.')" class="insta">Instagram</a></li>
<!--                                     <li><a href="#" target="_blank" class="face">Facebook</a></li> -->
<!--                                     <li><a href="#" target="_blank" class="youtube">Youtube</a></li> -->
<!--                                     <li><a href="#" target="_blank" class="insta">Instagram</a></li> -->
                                </ul>
                            </div>
                        </div>
                    </div>
                </div><!-- //.mo_gnb_box -->
                
                <ul class="header_gnb">
                    <li><a name="header_gnb_list" href="javascript:;" onclick='fn_BtnPrdtLink( "VOD" );' >VOD</a></li>
                    <li><a name="header_gnb_list" href="javascript:;" onclick='fn_BtnPrdtLink( "1:1 코칭" ); ' >1:1 코칭</a></li>
                    <li><a name="header_gnb_list" href="javascript:;" onclick='fn_BtnPrdtLink( "LIVE CLASS" ); ' >LIVE CLASS</a></li>
                </ul>
                <div class="header_fc">
                    <button type="button" class="mo_header_fc_btn"></button>
                    <div class="header_search">
                        <input type="text" name="keyword" placeholder="키워드 검색" value="${param.keyword}" onkeypress="javascript:if (event.keyCode == 13) btnSearchKeyWord( this.value );" class="header_search_input">
                        <a style="cursor: pointer;" class="header_submit" onclick="btnSearchKeyWord( document.getElementsByName('keyword')[0].value );"></a>
                        <button type="button" class="mo_header_fc_btn_close"></button>
                    </div>
                    <a href="/front/guide/guider" class="header_service">서비스 소개</a>
                </div>
            </div>
        </div>
    </div><!-- // #header -->