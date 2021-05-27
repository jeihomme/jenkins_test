<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="baseURL" value="${fn:replace(req.requestURL, fn:substring(req.requestURI, 0, fn:length(req.requestURI)), req.contextPath)}" />
<c:set var="pathUrl" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'index', 'ajax')}" /> 
<c:set var="excelUrl" value="/${fn:split( pathUrl ,'/')[0]}/${fn:split( pathUrl ,'/')[1]}/excel" /> 

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>관리자  | PeopleMade</title>
		
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="shortcut icon" href="/resources/images/favicon.ico" type="image/x-icon" />

	<!--Basic Scripts-->
<!-- 	<script type="text/javascript" src="//code.jquery.com/jquery-latest.min.js"></script> -->
	<script type="text/javascript" src="/resources/assets/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"  src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
	
	<!-- UNIT -->
 	<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>	
    <link href="/resources/css/font-awesome.min.css" rel="stylesheet" />
	<script type="text/javascript" src="https://kit.fontawesome.com/35f90b3902.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.slimscroll.min.js"></script> 
	<script type="text/javascript" src="${root}/unit.iwonsoft.com/base.js?uid=${uid}"></script>
	
	<!-- JS -->
	<script type="text/javascript" src="/resources/js/common_mng.js"></script>
	<script type="text/javascript" src="/resources/js/tmp_mng_menu.js"></script>
	<script type="text/javascript" src="/resources/js/skins.js"></script>
	<script type="text/javascript" src="/resources/js/beyond.js?1"></script>
		
	<!--CSS	 -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
	<link href="/resources/css/common_mng.css" rel="stylesheet">
	<link href="/resources/css/layout_mng.css" rel="stylesheet">
	<link href="/resources/css/beyond.css" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/tablets.css">
	<link rel="stylesheet" href="/resources/css/phones.css">
	
	
	<!-- 썸머노트 -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script type="text/javascript" src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script>
	
	<!-- Global site tag (gtag.js) - Google Analytics -->
<!-- 	<script async src="https://www.googletagmanager.com/gtag/js?id=G-0E7BNFD8F3"></script> -->
	<script>
// 	  window.dataLayer = window.dataLayer || [];
// 	  function gtag(){dataLayer.push(arguments);}
// 	  gtag('js', new Date());
	
// 	  gtag('config', 'G-0E7BNFD8F3');
	</script>
	
	<script async src="https://www.googletagmanager.com/gtag/js?id=G-84NRC0X9LL"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());
		gtag('config', 'G-84NRC0X9LL');
	</script>

	<style>
	.checkbox.sn-checkbox-open-in-new-window input, .checkbox.sn-checkbox-use-protocol input{
		height: auto;
	    position: unset;
	    margin: 0;
	
	}
	.tbl_view , .tbl_list {
	overflow:auto;
    -ms-overflow-style: none; /* IE and Edge */
    scrollbar-width: none; /* Firefox */
	}
	.tbl_view::-webkit-scrollbar, .tbl_list::-webkit-scrollbar {
	    display: none; /* Chrome, Safari, Opera*/
	}
	.sidebar-menu-li .submenu{ z-index: 1000!important; }
	.menu-dropdown{ z-index: 1001!important; }
	.loadingbar{position: absolute; background-color: black; z-index: 999999;top: 35%;left: 40%;}
	.now_loading{    width: 100%;height: 100%;position: absolute;top: 45px;/* left: 220px; */background-color: white;z-index: 999999;}
</style>
</head>
<!-- /Head -->
<!-- Body -->
<body>
	<div class="now_loading tablets_now_loading phones_now_loading" >
		<img class="loadingbar phones_loadingbar" src="/resources/images/loadingbar.gif"/> 
	</div>
	<script>
	setTimeout(function(){
		$('.now_loading').hide();
	}, 1500);
	</script>
    <!-- Navbar -->
    <div class="navbar">
        <div class="navbar-inner">
            <div class="navbar-container">
                <div class="navbar-header pull-left" > <!-- style="background: url('/resources/images/header_logo.png') no-repeat 50% 50% ;" -->
                    <a href="/mng/main/index" class="navbar-brand" style="width: 160px;">
						<img style="max-height: 70%;    margin-top: 5px;" src="/resources/images/header_logo.png" />
					</a>
                </div>
                <div class="sidebar-collapse" id="sidebar-collapse">
                    <i class="collapse-icon fa fa-bars"></i>
                </div>

                <!-- Account Area and Settings --->
                <div class="navbar-header pull-right">
                    <div class="navbar-account">
                        <ul class="account-area">
                            <li>
                                <a href="http://sms.gabia.com/" target="_blank" class="login-area dropdown-toggle" style="    text-align: -webkit-center;"> <!-- width: auto !important; -->
                                	<span class="profile" >[문자발송]</span>
                                </a>
                                <!--Login Area Dropdown-->
                                <ul class="pull-right dropdown-menu dropdown-arrow dropdown-login-area">
                                    <li class="username"><a></a></li>
                                </ul><!--/Login Area Dropdown-->
                            </li>
                            <li>
                                <a class="login-area dropdown-toggle" data-toggle="dropdown" style="    text-align: -webkit-center;"> <!-- width: auto !important; -->
                                	<span class="profile" id="mngLoginNm"></span><span class="profile" id="mngLoginType"></span>
<!--                                     <div class="avatar" title="View your public profile"> -->
<!--                                     	<img src="/resources/images/sub/admin.png"> -->
<!--                                     </div> -->
                                </a>
                                <!--Login Area Dropdown-->
                                <ul class="pull-right dropdown-menu dropdown-arrow dropdown-login-area">
                                    <li class="username"><a></a></li>
<!--                                     <li class="email"><a></a></li> -->
<!--                                     <li> -->
<!--                                         <div class="avatar-area"> -->
<!--                                             <img src="/resources/images/avatars/adam-jansen.jpg" class="avatar"> -->
<!-- 											<img src="/resources/images/sub/admin_big.png" class="avatar"> -->
<!--                                             <span class="caption"></span> -->
<!--                                         </div> -->
<!--                                     </li> -->
                                    <li class="dropdown-footer">
                                        <a href="javascript:;" onclick="fn_BtnLogout();">
                                            로그아웃
                                        </a>
                                    </li>
                                </ul><!--/Login Area Dropdown-->
                            </li>
						</ul><!-- /Account Area end-->
                    </div>
                </div><!-- /Account Area and Settings -->
            </div>
        </div>
    </div>
    <!-- /Navbar -->
    <!-- Main Container -->
    <div class="main-container ">
        <!-- Page Container -->
        <div class="page-container">
            <!-- Page Sidebar -->
            <div class="page-sidebar" id="sidebar">
                <!-- Page Sidebar Header-->
<!--                 <div class="sidebar-header-wrapper"> -->
<!--                     <input type="text" class="searchinput" /> -->
<!--                     <i class="searchicon fa fa-search"></i> -->
<!--                     <div class="searchhelper">Search</div> -->
<!--                 </div> -->
                <!-- /Page Sidebar Header -->
                <!-- Sidebar Menu -->
                <ul class="nav sidebar-menu">
						<!--강좌관리-->
						<li class="sidebar-menu-li">
							<a class="menu-dropdown" >
							<div class="icon1">
								<span class="menu-text icon"> 회원관리 </span></div>
								<div class="menu-expand"><img src="/resources/images/sub/admin_next_btn.png"></div>						
							</a>
							<!--강좌관리 > 2차메뉴-->
							<ul class="submenu" >
								<li class="ppm_key_background_color" ><a id="member" href="/mng/member/index" ><span class="menu-text ">회원정보</span></a></li>
							</ul>					
						</li>
						<li class="sidebar-menu-li">
							<a class="menu-dropdown" >
						<div class="icon0">
								<span class="menu-text icon "> 마스터관리 </span></div>
								<div class="menu-expand"><img src="/resources/images/sub/admin_next_btn.png"></div>						
							</a>
							<!--강좌관리 > 2차메뉴-->
							<ul class="submenu" >
								<li class="ppm_key_background_color" ><a id="masterinfo" href="/mng/masterinfo/index" ><span class="menu-text">마스터정보</span></a></li>
								<li class="ppm_key_background_color" ><a id="masteropen" href="/mng/masteropen/index" ><span class="menu-text">마스터노출정보</span></a></li>
								<li class="ppm_key_background_color" ><a id="masterappl" href="/mng/masterappl/index" ><span class="menu-text">마스터신청관리</span></a></li>
								<li class="ppm_key_background_color" ><a id="masterfaq" href="/mng/masterfaq/index" ><span class="menu-text">마스터FAQ관리(X)</span></a></li>
								<li class="ppm_key_background_color" ><a id="revi" href="/mng/revi/index" ><span class="menu-text">후기관리</span></a></li>
							</ul>
						</li>
						<li class="sidebar-menu-li">
							<a class="menu-dropdown" >
								<div class="icon2">
								<span class="menu-text icon"> 상품관리 </span></div>
								<div class="menu-expand"><img src="/resources/images/sub/admin_next_btn.png"></div>					
							</a>
							<!--강좌관리 > 2차메뉴-->
							<ul class="submenu" >
								<li class="ppm_key_background_color" ><a id="vod" href="/mng/vod/index" ><span class="menu-text">강의등록</span></a></li> 
								<li class="ppm_key_background_color" ><a id="lect" href="/mng/lect/index" ><span class="menu-text">VOD강좌</span></a></li> 
								<li class="ppm_key_background_color" ><a id="live" href="/mng/live/index" ><span class="menu-text">라이브클래스</span></a></li> 
								<li class="ppm_key_background_color" ><a id="face" href="/mng/face/index" ><span class="menu-text">1:1화상상담</span></a></li> 
								<li class="ppm_key_background_color" ><a id="chat" href="/mng/chat/index" ><span class="menu-text">1:1채팅상담</span></a></li> 
								<li class="ppm_key_background_color" ><a id="mail" href="/mng/mail/index" ><span class="menu-text">1:1이메일상담</span></a></li> 
								<li class="ppm_key_background_color" ><a id="coup" href="/mng/coup/index" ><span class="menu-text">쿠폰관리</span></a></li> 
								<li class="ppm_key_background_color" ><a id="stor" href="/mng/stor/index" onclick="alert('준비중입니다.'); return false;"><span class="menu-text">스토어상품</span></a></li> 
								<li class="ppm_key_background_color" ><a id="prdtopen" href="/mng/prdtopen/index" ><span class="menu-text">상품상세노출관리</span></a></li> 
							</ul>					
						</li>
						<li class="sidebar-menu-li">
							<a class="menu-dropdown" >
							<div class="icon3">
								<span class="menu-text icon"> 상담관리 </span></div>
								<div class="menu-expand"><img src="/resources/images/sub/admin_next_btn.png"></div>						
							</a>
							<!--강좌관리 > 2차메뉴-->
							<ul class="submenu" >
								<li class="ppm_key_background_color" ><a id="wait" href="/mng/wait/index" ><span class="menu-text">대기중인상담</span></a></li>
								<li class="ppm_key_background_color" ><a id="past" href="/mng/past/index" ><span class="menu-text">지난상담</span></a></li>
							</ul>					
						</li>
						<li class="sidebar-menu-li">
							<a class="menu-dropdown" >
								<div class="icon4">
								<span class="menu-text icon"> 주문/배송관리 </span></div>
								<div class="menu-expand"><img src="/resources/images/sub/admin_next_btn.png"></div>						
							</a>
							<!--강좌관리 > 2차메뉴-->
							<ul class="submenu" >
								<li class="ppm_key_background_color" ><a id="orde" href="/mng/orde/index" onclick="alert('준비중입니다.'); return false"><span class="menu-text">주문관리</span></a></li>
								<li class="ppm_key_background_color" ><a id="deli" href="/mng/deli/index" onclick="alert('준비중입니다.'); return false"><span class="menu-text">상품준비/발송관리</span></a></li>
								<li class="ppm_key_background_color" ><a id="pay" href="/mng/pay/index" ><span class="menu-text">결제내역</span></a></li>
								<li class="ppm_key_background_color" ><a id="refu" href="/mng/refu/index" ><span class="menu-text">취소/환불내역</span></a></li>
								<li class="ppm_key_background_color" ><a id="cuse" href="/mng/cuse/index" ><span class="menu-text">쿠폰사용내역</span></a></li>
							</ul>					
						</li>
						<li class="sidebar-menu-li">
							<a class="menu-dropdown" >
							<div class="icon5">
								<span class="menu-text icon"> 사이트관리 </span></div>
								<div class="menu-expand"><img src="/resources/images/sub/admin_next_btn.png"></div>					
							</a>
							<!--강좌관리 > 2차메뉴-->
							<ul class="submenu" >
								<li class="ppm_key_background_color" ><a id="bann" href="/mng/bann/index" ><span class="menu-text">메인페이지배너관리</span></a></li>
								<li class="ppm_key_background_color" ><a id="faq" href="/mng/faq/index" ><span class="menu-text">FAQ관리</span></a></li>
								<li class="ppm_key_background_color" ><a id="qna" href="/mng/qna/index" ><span class="menu-text">1:1문의관리</span></a></li>
								<li class="ppm_key_background_color" ><a id="noti" href="/mng/noti/index" ><span class="menu-text">공지사항관리</span></a></li>
								<li class="ppm_key_background_color" ><a id="bannprdt" href="/mng/bannprdt/index" ><span class="menu-text">상품배너관리</span></a></li>
								<li class="ppm_key_background_color" ><a id="cate" href="/mng/cate/index" ><span class="menu-text">카테고리관리</span></a></li>
								<li class="ppm_key_background_color" ><a id="mainopen" href="/mng/mainopen/index" ><span class="menu-text">메인마스터노출관리</span></a></li>
								<li class="ppm_key_background_color" ><a id="mdpick" href="/mng/mdpick/index" ><span class="menu-text">MD's Pick관리</span></a></li>
								<li class="ppm_key_background_color" ><a id="timedeal" href="/mng/timedeal/index" ><span class="menu-text">타임딜관리</span></a></li>
							</ul>					
						</li>
						<li class="sidebar-menu-li">
							<a class="menu-dropdown" >
								<div class="icon6">
								<span class="menu-text icon"> 통계 </span></div>
								<div class="menu-expand"><img src="/resources/images/sub/admin_next_btn.png"></div>					
							</a>
							<!--강좌관리 > 2차메뉴-->
							<ul class="submenu" >
								<li class="ppm_key_background_color" ><a id="join" href="/mng/join/index" ><span class="menu-text">가입</span></a></li>
								<li class="ppm_key_background_color" ><a id="sale" href="/mng/sale/index" ><span class="menu-text">매출</span></a></li>
								<li class="ppm_key_background_color" ><a id="prdt" href="/mng/prdt/index" ><span class="menu-text">상품별현황관리</span></a></li>
							</ul>					
						</li>		
						<li class="sidebar-menu-li">
							<a class="menu-dropdown" >
								<div class="icon7">
								<span class="menu-text icon"> 기본설정 </span></div>
								<div class="menu-expand"><img src="/resources/images/sub/admin_next_btn.png"></div>					
							</a>
							<!--강좌관리 > 2차메뉴-->
							<ul class="submenu" >
								<li class="ppm_key_background_color" ><a id="admin" href="/mng/admin/index" ><span class="menu-text">관리자관리</span></a></li>
								<li class="ppm_key_background_color" ><a id="prev" href="/mng/prev/index" ><span class="menu-text">권한관리</span></a></li>
<!-- 								<li><a id="yoyo" href="/mng/yoyo/index" ><span class="menu-text">요술지팡이 재생목록 테스트</span></a></li> -->
							</ul>
						</li>
					</ul>
					<!-- /Sidebar Menu -->
            </div>
            
            <!-- /Page Sidebar -->

            <!-- Page Content -->
            <div class="page-content">
                <div class="page-breadcrumbs">
					<ul class="breadcrumb">
						<li>
						
							<a href="javascript:;"><img src="/resources/images/sub/home.png" style="margin-top:-4px;"></a>
						</li>
						<li>1depth</li>
						<li class="active">2depth</li>		
					</ul>
                </div>
                <!-- Page Header -->
                <div class="page-header position-relative">
					<div class="page-header">
						<div class="header-title">2depth</div>
					</div>
                    <!--Header Buttons-->
                    <div class="header-buttons">
                        <a class="sidebar-toggler" href="javascript:;">
                            <div class="size_btn"></div>
                        </a>
                        <a class="refresh" id="refresh-toggler" href="">
                           <div class="size_btn2"></div>
                        </a>
                        <a class="fullscreen" id="fullscreen-toggler" href="javascript:;">
                            <div class="size_btn3"></div>
                        </a>
                    </div>
                    <!--Header Buttons End-->
                </div>
                <!-- /Page Header -->
                <!-- Page Body -->
                <div class="page-body">
					<!-- START : Contents -->
					<tiles:insertAttribute name="body" />
					<!-- END : Contents -->
					
                </div>
                <!-- /Page Body -->
            </div>
            <!-- /Page Content -->
        </div>
        <!-- /Page Container -->
        <!-- Main Container -->
    </div>    
    
<input type="hidden" id="imgTag" name="imgTag"/>
    
<script>

var keyColor = '#1eccb4';

if( localStorage.getItem("mngLoginIdx") == null ) location.href = '/mng';
	
$('.collapse-icon.fa.fa-bars').click(function(){
	if( $('#sidebar').attr('class').indexOf('menu-compact') > -1 ) {
		//메뉴 최대화했을때
		$('span.menu-text.icon').css('background-color','none');
		$('span.menu-text.icon').css('display','inline-block');
		$('.submenu').css('display','none');
		
	} else {
		//메뉴 최소화했을때
		$('.submenu').css('display','none'); 
		$('span.menu-text.icon').css('display','none');
	}
});

$('li.sidebar-menu-li a.menu-dropdown').on('click',function(){
	
	$('.icon0').css({background : "url(/resources/images/sub/master.png) no-repeat left top",  color : "#fff" });
	$('.icon1').css({background : "url(/resources/images/sub/admin.png) no-repeat left top",  color : "#fff"});
	$('.icon2').css({background : "url(/resources/images/sub/pre.png) no-repeat left top",  color : "#fff"});
	$('.icon3').css({background : "url(/resources/images/sub/peo.png) no-repeat left top",  color : "#fff"});
	$('.icon4').css({background : "url(/resources/images/sub/bag.png) no-repeat left top",  color : "#fff"});
	$('.icon5').css({background : "url(/resources/images/sub/tv.png) no-repeat left top",  color : "#fff"});
	$('.icon6').css({background : "url(/resources/images/sub/graf.png) no-repeat left top",  color : "#fff"});
	$('.icon7').css({background : "url(/resources/images/sub/nomal.png) no-repeat left top",  color : "#fff"});
	$('div.menu-expand > img').attr('src','/resources/images/sub/admin_next_btn.png');

	
	var keyTag = $(this).children('div'); 
	if( $('#sidebar').attr('class').indexOf('menu-compact') > -1 ) { 
		$('.submenu').css('display','none');
		$('span.menu-text.icon').css('display','none');
	}
	
	var keyNumber = keyTag.attr('class').replace('icon', '')*1;//n번째
	if( keyNumber == 0 ) $('.icon0').css({background : "url(/resources/images/sub/master_foc.png) no-repeat left top",  color : keyColor});
	if( keyNumber == 1 ) $('.icon1').css({background : "url(/resources/images/sub/admin_foc.png) no-repeat left top",  color : keyColor});
	if( keyNumber == 2 ) $('.icon2').css({background : "url(/resources/images/sub/pre_foc.png) no-repeat left top",  color : keyColor});
	if( keyNumber == 3 ) $('.icon3').css({background : "url(/resources/images/sub/peo_foc.png) no-repeat left top",  color : keyColor});
	if( keyNumber == 4 ) $('.icon4').css({background : "url(/resources/images/sub/bag_foc.png) no-repeat left top",  color : keyColor});
	if( keyNumber == 5 ) $('.icon5').css({background : "url(/resources/images/sub/tv_foc.png) no-repeat left top",  color : keyColor});
	if( keyNumber == 6 ) $('.icon6').css({background : "url(/resources/images/sub/graf_foc.png) no-repeat left top",  color : keyColor });
	if( keyNumber == 7 ) $('.icon7').css({background : "url(/resources/images/sub/nomal_foc.png) no-repeat left top",  color : keyColor,  });

	
	//화살표 호버
	var key = $(this).children('div').children('img').attr('src');
	$(this).children('div').children('img').attr('src','/resources/images/sub/admin_next_btn_foc.png');
	
});

$('[class^=size_btn]').click(function(){ 
	$('.size_btn3').css({background : "url(/resources/images/sub/size0.png) no-repeat left top"});
	$('.size_btn2').css({background : "url(/resources/images/sub/sizeup0.png) no-repeat left top"});
	$('.size_btn').css({background : "url(/resources/images/sub/sizedown0.png) no-repeat left top"});
	
	
	var classVal = $(this).attr('class');
	if( classVal == 'size_btn3')  $('.size_btn3').css({background : "url(/resources/images/sub/size.png) no-repeat left top"});
	else if( classVal == 'size_btn2')  $('.size_btn2').css({background : "url(/resources/images/sub/sizeup.png) no-repeat left top"});
	else if( classVal == 'size_btn')  $('.size_btn').css({background : "url(/resources/images/sub/sizedown.png) no-repeat left top"});
});


$(function(){
// 	마스터/관리자 메뉴출력
	if( localStorage.getItem("mngLoginIdx") == null || localStorage.getItem("mngLoginIdx") == undefined ) location.href = "/mng/login/login";
	$('#mngLoginNm').text( localStorage.getItem("mngLoginNm") );
	if( localStorage.getItem("mngUserType") == 'A' ) $('#mngLoginType').text( ' 관리자' );
	else $('#mngLoginType').text( ' 마스터' );
	
	var pathnameCnt = 0;
 	let prevList = localStorage.getItem("mngPrevCd");
	$('.submenu a').each(function(k){
			
		if( !prevList.includes('/'+this.href.split('/')[4]+'/') ) $(this).closest('li').hide();
		if( prevList.includes( window.location.pathname.split('/')[2] ) ) pathnameCnt++;
// 			console.log( prevList + ', ' + window.location.pathname.split('/')[2]+ ', ' + pathnameCnt );
	});
	if( window.location.pathname != '/mng/main/index' ) if( ! pathnameCnt ) location.href='/mng/login/login';
	
	$('.submenu').each(function(){
		let liLength = $(this).find('li').length;
		let liCnt = 0;
		$(this).find('li').each(function(k){
			if( $(this).css('display') == "none"  ) liCnt++;
		});
		if ( liLength == liCnt ) $(this).closest('li.sidebar-menu-li').remove();
	});
	
	
	
});

$(window).load(function(){
	var txt2 = $(".breadcrumb li").eq(2).text();
	
	if( '${out.params.pageCd }' == 'view' ) txt2 = txt2.replace('목록','상세');
	else if( '${out.params.pageCd }' == 'write' ) txt2 = txt2.replace('목록','등록');
	else if( '${out.params.pageCd }' == 'edit' ) txt2 = txt2.replace('목록','수정');
	
	$(".breadcrumb li").eq(2).text(txt2);
	$(".page-header .header-title").text(txt2);
});

$('.account-area').on('click', function(){
	if( $(".account-area li ui").css("display") == "none") $(".account-area li ui").show();
	else $(".account-area li ui").hide();
});

$('.menu-dropdown').each(function( key, val ){
	if( $(this).attr('id') == window.location.pathname.split('/')[2] ) $(this).css('color','black');
});

// 열어둔 메뉴 출력
$('.submenu a').each(function( key, val ){
	if( $(this).attr('id') == window.location.pathname.split('/')[2] ) {
		$(this).parents('ul').css('display', 'block');
		$(this).css('color','black');
	}
});



InitiateSideMenu();
InitiateSettings();

function fn_BtnLogout() {
	
	localStorage.removeItem("mngLoginIdx");
	localStorage.removeItem("mngUserType");
	localStorage.removeItem("mngLoginNm");
	localStorage.removeItem("mngPrevCd");
	
	location.href = '/mng/login/login';
}


//2. 유효성 검사 서비스로 이동
var path = window.location.pathname;
path = path.split('/');
path = '/'+path[1]+'/'+path[2]+'/ajax.json';

//PARENT_CODE : 부모코드
//CODE : 찾는코드
//OBJECT_ID : 태그ID
function fn_SelectOption( PARENT_CODE, CODE, OBJECT_ID, seqTarget ) {
	var params = new Object();
	params.status = "CODE";
	params.parentCode = PARENT_CODE;
	params.code = CODE;
	params.query = "selectCode";
	
	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var jsonData = result.out.detail.data;
// 	$('#'+OBJECT_ID+'').empty();
// 	$('#'+OBJECT_ID+'').append('<option value="">선택해주세요</option>');
	if ( seqTarget ) {
// 		console.log('undefined??');
		seqTarget.find('[name='+OBJECT_ID+']').empty();
		seqTarget.find('[name='+OBJECT_ID+']').append('<option value="">선택해주세요</option>');
		if ( PARENT_CODE == "PARANT" ) {
			seqTarget.find('[name='+OBJECT_ID+']').append('<option value="ALL">전체</option>');
		}
	}else{
		$('[name='+OBJECT_ID+']').empty();
		$('[name='+OBJECT_ID+']').append('<option value="">선택해주세요</option>');
		if ( PARENT_CODE == "PARANT" ) {
			$('[name='+OBJECT_ID+']').append('<option value="ALL">전체</option>');
		}
	}
	
	$.each(jsonData,function(key1, val1) {
		var name = '';
		var value = '';
		
    	$.each(val1,function(key, val) {
    		if( key.indexOf('ID') > -1 ) value = val;
    		else if( key.indexOf('NM') > -1 ) name = val;
			});
// 		$('#'+OBJECT_ID+'').append('<option value="'+value+'">'+name+'</option>');
		$('[name='+OBJECT_ID+']').append('<option value="'+value+'">'+name+'</option>');
	});
	
	return jsonData;
}

function fn_SelectAllOption(  CODE, OBJECT_ID ) {
	var params = new Object();
	params.status = "CODE";
	params.code = CODE;
	params.query = "selectAllCode";
	
	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var jsonData = result.out.detail.data;
	$('[name='+OBJECT_ID+']').empty();
	$('[name='+OBJECT_ID+']').append('<option value="">선택해주세요</option>');
	$('[name='+OBJECT_ID+']').append('<option value="ALL">전체</option>');
	
	$.each(jsonData,function(key1, val1) {
		var name = '';
		var value = '';
		
    	$.each(val1,function(key, val) {
    		if( key.indexOf('ID') > -1 ) value = val;
    		else if( key.indexOf('NM') > -1 ) name = val;
			});
		$('[name='+OBJECT_ID+']').append('<option value="'+value+'">'+name+'</option>');
	});
	
	return jsonData;
}

//특정 데이터 셀렉트 박스에 옵션으로 자동 뿌려주기
//OBJECT_ID : 태그ID
function fn_SelectOptionNotCode( query, OBJECT_ID, CODE_ID ) {
	var params = new Object();
	params.status = "CODE";
	params.query = query;
	if( CODE_ID != null ) params.CODE_ID = CODE_ID;
	
	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var jsonData = result.out.detail.data;
// 	$('#'+OBJECT_ID+'').empty();
// 	$('#'+OBJECT_ID+'').append('<option value="">선택해주세요</option>');
	$('[name='+OBJECT_ID+']').empty();
	$('[name='+OBJECT_ID+']').append('<option value="">선택해주세요</option>');
	
	$.each(jsonData,function(key1, val1) {
		var name = '';
		var value = '';
		
	  	$.each(val1,function(key, val) {
	  		if( key.indexOf('ID') > -1 ) value = val;
	  		else if( key.indexOf('NM') > -1 ) name = val;
		});
// 		$('#'+OBJECT_ID+'').append('<option value="'+value+'">'+name+'</option>');
		$('[name='+OBJECT_ID+']').append('<option value="'+value+'">'+name+'</option>');
	});
}




function fn_DataDetail( PARAMS, SOURCE_CHK_YN ) {
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result.out.detail.data;
	
	if( SOURCE_CHK_YN == null ) jsonData = ConvertHtmltoSystemSource( jsonData );
	
	if( jsonData.length > 0 ) {
		$.each(jsonData ,function(key1, val1) {
			$.each(val1,function(key, val) {
				console.log( result.pageCd );
				if( result.pageCd == 'index' || result.pageCd == 'view' || result.pageCd == 'tab' ) {
					if( key.indexOf("UUID") > -1 ) {
						//첨부된 사진 데이터 출력
						$('[name='+key+']').val(val);
						setUuid( $('[name='+key+']').val() );
						imgIdValue = key+"_FILE";
						unit_fileGet( imgIdValue, "fn_fileUpload");
					} else if( key.indexOf('YN') > -1 ) {
						//체크박스 출력
						if( val == 'Y') $('input:checkbox[name='+key+']').prop('checked',true);
						else $('input:checkbox[name='+key+']').prop('checked',false);
						$('#'+key+'').html(val);
					} else {
						//일반 데이터 출력
						if( key.indexOf("IDX") > -1 ) $('#'+key+'').val(val);
						else $('#'+key+'').html(val);
					}
				} else if( result.pageCd == 'edit' || result.pageCd == 'write' ) {
					if( key.indexOf('YN') > -1 ) {
						$('input:radio[name='+key+']:radio[value='+val+']').prop('checked',true);
						if( val == 'Y') $('input:checkbox[name='+key+']').prop('checked',true);
						else $('input:checkbox[name='+key+']').prop('checked',false);
					} else {
						//일반 데이터 출력
						$('[name='+key+']').val(val);
						if( key.indexOf("UUID") > -1 ) {
							//첨부된 사진 데이터 출력
							setUuid( $('[name='+key+']').val() );
							imgIdValue = key+"_FILE";
							unit_fileGet( imgIdValue, "fn_fileUpload");
						}
					}
				} else {
					console.log( key + "< " + val );
					$('#'+key+'').text(val);
				}
			});
		});
		return jsonData;
	}
}


$('a').click(function(){
	var aTagVal = $(this).attr('onclick')+'';
	aTagVal = aTagVal.replace('undefined','');
	if( aTagVal.length > 0 ) {
		if( $(this).attr('onclick').indexOf('fn_BtnRegist') > -1 ) {
			var tag = $(this);
//	 		$(this).hide();
			$(this).prop('disabled',true);
			
			setTimeout(function(){
//	 			tag.show();
				tag.prop('disabled',true);
			}, 1000);
		}
	}
});


function fn_DataAjax2( PARAMS, NO_CONVERT ) {
	if ( NO_CONVERT == 'RECOMMEND' ) {
	}else{
		PARAMS = ConvertSystemSourcetoHtml( PARAMS );
	}
	var returnVal = 0;
	var alertVal = '';
	var alertKey = '';
	var url = window.location.pathname;
		
	return ${unit.ajax( ajaxUrl, "ajax", "PARAMS")}; 
}

function fn_DataAjax( PARAMS, CHECK_PARAMS ) {
	
	PARAMS = ConvertSystemSourcetoHtml( PARAMS );
	if( fn_paramsNameTagTest( PARAMS ) != '' ) return alert( fn_paramsNameTagTest( PARAMS ) );
	
	var returnVal = 0;
	var alertVal = '';
	var alertKey = '';
	var url = window.location.pathname;
	if( PARAMS.status != 'WRITE' && PARAMS.status != 'EDIT' ) {
		${unit.ajax( ajaxUrl, "ajax", "PARAMS")}
		return 1; 
	} else {
		if( CHECK_PARAMS != 'N' ) {
			$.each(PARAMS, function(key, val){
				if( returnVal == 0 ) {
					if( '${pathUrl}'.indexOf('lect') > -1 || '${pathUrl}'.indexOf('live') > -1 || '${pathUrl}'.indexOf('face') > -1 || '${pathUrl}'.indexOf('chat') > -1 || '${pathUrl}'.indexOf('mail') > -1 ) {
						if( key.indexOf('UUID') > -1 ) {
//	 						if( $('[name="'+key+'"]').is(':visible') ) {
								if( val == '' || val == null ) {
									returnVal = 1;
									alertKey = key;
									alertVal = $('[name="'+key+'"]').parents('tr').children('th').text() + '을/를 입력해주세요';
								}
//	 						}
						} else {
							if( $('[name="'+key+'"]').is(':visible') ) {
								if( val == '' || val == null ) {
									returnVal = 1;
									alertKey = key;
									alertVal = $('[name="'+key+'"]').parents('tr').children('th').text() + '을/를 입력해주세요';
								}
							}
							
						}
					} else {
						if( $('[name="'+key+'"]').is(':visible') ) {
							if( key.indexOf('UUID') < 0 ) {
								if( $('[name="'+key+'"]').is(':visible') ) {
									if( val == '' || val == null ) {
										var tagStr = $('[name="'+key+'"]').attr('class');
										if( tagStr.indexOf('NOT_CHK') < 0 ) {
											returnVal = 1;
											alertKey = key;
											alertVal = $('[name="'+key+'"]').parents('tr').children('th').text() + '을/를 입력해주세요';
										}
									}
								}
							}
						}
					}
				}
			});
			if( alertVal != '' ) {
				$('[name='+alertKey+']').focus();
				alert( alertVal );
				return 0; 
			} else {
				${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
				return 1; 
			}
		} else {
			${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
			return 1; 
		}
	}
}




function fn_BtnSearch(){
	var params = unit_getParams("searchArea");
	${unit.setValue( pathUrl, "params"  )};
}

function fn_makeSummerNote( id ){
	
	$('#'+id).summernote({ 
// 			width: 912,
			height: 300,                 // 에디터 높이
			minHeight: null,             // 최소 높이
			maxHeight: null,             // 최대 높이
			focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			lang: "ko-KR",					// 한글 설정
			placeholder: '내용을 입력해주세요.',	//placeholder 설정
			defaultFontName: '돋음체',
			toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['height', ['height']],
			    
			    ['insert',['picture','link','video']],
			    
	 		    ['view', ['codeview','fullscreen', 'help']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['table', ['table']],
				],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		});
}

//크로스사이트스크립트 문자 치환기능
function ConvertSystemSourcetoHtml( PARAMS ){
	$.each(PARAMS, function(key, val){
		if( key.indexOf('TITL') > 0 ) {
			if( val != null ) {
				val = val.replace(/&/g,"&amp;");
				val = val.replace(/</g,"&lt;");   
				val = val.replace(/>/g,"&gt;");   
				val = val.replace(/\"/g,"&quot;");
				val = val.replace(/\'/g,"&#39;"); 
				val = val.replace(/\n/g,"<br />");
				PARAMS[key] = val.replace(/[?]/g,"&#63;");
			}
		}
	});
	
	return PARAMS;
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


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//페이징 한 페이지에 출력되는 게시물의 개수를 조절
var listCnt = '${out.params.listCnt}';
if( listCnt == "" ) $('#selectListCnt').val(10);
else $('#selectListCnt').val( listCnt );


$('#selectListCnt').change(function(){
var params = new Object();
params.listCnt = $(this).val();

${unit.setValue( pathUrl , "params")};
});

function excelDownload(){
	if( $('.list_tbl01 tbody tr td').text().indexOf('등록된 내용이 없습니다.') > -1 ) {
		alert('검색결과가 없습니다.');
	} else {
		var params = new unit_getParams("searchArea");
		params.query = 'selectMng'+'${fn:toUpperCase( fn:substring( fn:split(pathUrl, "/" )[1], 0,1 ) )}${fn:substring( fn:split(pathUrl, "/" )[1], 1 ,fn:length(fn:split(pathUrl, "/" )[1]))}'+'List';
		params.rowSize = $('#selectListCnt').val();
		${unit.setValue( excelUrl , 'params' )};
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// $(document).on('click', '.submenu a', prevChk);
// function prevChk(){
// 	console.log( localStorage.getItem("mngPrevCd").includes('/'+this.href.split('/')[4]+'/') );
// 	if ( localStorage.getItem("mngPrevCd").includes('/'+this.href.split('/')[4]+'/') ) {
// 		alert('해당 메뉴에 권한이 없습니다.');
// 		return true;		
// 	}else{
// 		return false;
// 	}
// }

$('#sale').on('click',function(){
	var params = new Object();
	params.status = "TODAY_SALE";
	params.query = "updateFrontTodayStatSaleData";
	fn_DataAjax2(params);
});
$('#prdt').on('click',function(){
	var params = new Object();
	params.status = "TODAY_PRDT";
	fn_DataAjax2(params);
});

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


</script>

</body>
</html>
