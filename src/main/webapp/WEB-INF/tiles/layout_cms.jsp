<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<!DOCTYPE html>
<html lang="ko"style="margin-right: 0px; overflow-y: auto !important;">
<meta http-equiv="X-UA-Compatible" content="IE=10" />
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no">
	
	<meta name="google-signin-client_id" content="1078107130918-ckfeb3jojuk3ohurnm7peao8lv6hs97c.apps.googleusercontent.com">
  	<meta name="google-signin-scope" content="https://www.googleapis.com/auth/analytics.readonly">
  	<meta name="google-site-verification" content="M12soJUeDp-MhAhDz1fORUcAqzHr1DNdgbYQjVoPl3s" />
  	
  	<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-179155906-1"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag(){dataLayer.push(arguments);}
	gtag('js', new Date());
	
	gtag('config', 'UA-179155906-1');
</script>

	<title>기업회원  | EVENTSO</title>

	<!-- Jquery and Bootstap core js files -->
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script  src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
	
<!-- 	Resizable CDN -->
	<link rel="stylesheet" type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/ui-lightness/jquery-ui.css"/>
	
	 <!--Basic styles-->
 	<script src="/resources/js/bootstrap.min.js"></script>	
    <link href="/resources/css/font-awesome.min.css" rel="stylesheet" />
	<script src="https://kit.fontawesome.com/35f90b3902.js"></script>
	<script src="/resources/js/jquery.slimscroll.min.js"></script> 
	<script src="${root}/unit.iwonsoft.com/base.js?uid=${uid}"></script>
<!-- 	<link rel="stylesheet" type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/ui-lightness/jquery-ui.css"/> -->
<!--     <link href="/resources/css/bootstrap.min.css" rel="stylesheet" /> -->
	
	<!-- Custom Scripts  and CSS -->
	<script src="/resources/js/common_cms.js"></script>
	<script type="text/javascript" src="/resources/js/tmp_cms_menu.js"></script>
	<link href="/resources/css/common_mng.css" rel="stylesheet">
	<link href="/resources/css/layout_mng.css" rel="stylesheet">
<!-- 	<script src="/resources/mng/js/common_mng.js"></script> -->
<!-- 	<link href="/resources/mng/css/common_cms.css" rel="stylesheet">   -->

	<!-- 썸머노트 -->	
	<link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	
	 <!--Beyond styles-->
	<script src="/resources/js/skins.js"></script>	
	<link href="/resources/css/beyond.css" rel="stylesheet">
	
	
	<style>
		.ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year{vertical-align: top}
	</style>
	
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=G-0E7BNFD8F3"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	
	  gtag('config', 'G-0E7BNFD8F3');
	</script>
	

</head>
<!-- /Head -->
<!-- Body -->
<body>

    <!-- Navbar -->
    <div class="navbar">
        <div class="navbar-inner">
            <div class="navbar-container">
                <div class="navbar-header pull-left" style="background: url('/resources/images/logo_footer.png') no-repeat 50% 50%/ 90%;">
                    <a href="/cms/dashboard/dashboard" class="navbar-brand" style="width: 160px;">
<!-- 							<img style="max-height: 100%;" src="/resources/images/logo_footer.png" /> -->
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
                                <a class="login-area dropdown-toggle" data-toggle="dropdown">
                                    <div class="avatar" title="View your public profile" style="border-left:none;">
                                        <img class="avatar" src="/resources/img/avatars/adam-jansen.jpg" style="border-left:none;">
                                    </div>
                                    <section style="position: absolute; display: inline-block;" >
                                        <h2><span class="profile"><span>${sessionScope.cmsLoginNm }</span></span></h2>
                                    </section>
                                </a>
                                <!--Login Area Dropdown-->
                                <ul class="pull-right dropdown-menu dropdown-arrow dropdown-login-area">
                                    <li class="username"><a>${sessionScope.cmsLoginNm }님</a></li>
                                    <li class="email"><a>${cmsLoginId}</a></li>
                                    <li>
                                        <div class="avatar-area">
                                            <img src="/resources/img/avatars/adam-jansen.jpg" class="avatar">
											<input type="hidden" id="imgTag" name="imgTag"/>
                                            <span class="caption">${sessionScope.cmsLoginNm }</span>
                                        </div>
                                    </li>
                                    <li class="dropdown-footer">
                                        <a href="/cms/login/login">
                                            로그아웃
                                        </a>
                                    </li>
                                </ul>
                                <!--/Login Area Dropdown-->
                            </li>
								</ul>
								<!-- /Account Area end-->
                        <!-- Settings end-->
                    </div>
                </div>
                <!-- /Account Area and Settings -->
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
					<!--
                <div class="sidebar-header-wrapper">
                    <input type="text" class="searchinput" />
                    <i class="searchicon fa fa-search"></i>
                    <div class="searchhelper">Search</div>
                </div>
				-->
                <!-- /Page Sidebar Header -->
                <!-- Sidebar Menu -->
                <ul class="nav sidebar-menu">
						<!--메인 관리-->
						<li>
							<a href="javascript:;" class="menu-dropdown" >
								<i class="menu-icon fal fa-check"></i>
								<span class="menu-text"> 공통 </span>
								<i class="menu-expand"></i>						
							</a>
							<!--메인 관리 > 2차메뉴-->
							<ul class="submenu">
								<li><a href="/cms/ntc/list"  id="ntc"><span class="menu-text">공지사항</span></a></li>
								<li><a href="/cms/qna/list"  id="qna"><span class="menu-text">1:1 문의</span></a></li>
							</ul>					
						</li>				
						<!--이벤트 관리-->
						<li>
							<a href="javascript:;" class="menu-dropdown">
								<i class="menu-icon fas fal fa-gift"></i>
								<span class="menu-text">이벤트 </span>
								<i class="menu-expand"></i>						
							</a>
							<!--이벤트 관리 > 2차메뉴-->
							<ul class="submenu">
								<li><a href="/cms/evt/list"  id="evt"><span class="menu-text">이벤트 목록</span></a></li>
								<li><a href="/cms/eqna/list"  id="eqna"><span class="menu-text">이벤트 문의내역</span></a></li>
							</ul>					
						</li>				
						<!--접수내역-->
						<li>
							<a href="javascript:;" class="menu-dropdown">
								<i class="menu-icon fal fa-list"></i>
								<span class="menu-text"> 이벤트 접수 </span>
								<i class="menu-expand"></i>						
							</a>
							<!--접수내역 > 2차메뉴-->
							<ul class="submenu">
								<li><a href="/cms/app/list" id="app"><span class="menu-text">접수 목록</span></a></li>
							</ul>					
						</li>				
						<!--통계-->
						<li>
							<a href="javascript:;" class="menu-dropdown">
								<i class="menu-icon far fa-cog"></i>
								<span class="menu-text"> 통계 </span>
								<i class="menu-expand"></i>						
							</a>
							<!--통계 > 2차메뉴-->
							<ul class="submenu">
								<li><a href="/cms/total/list" id="total"><span class="menu-text">웹분석</span></a></li>
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
							<i class="fa fa-home"></i>
							<a href="javascript:;">Home</a>
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
                            <i class="fa fa-arrows-h"></i>
                        </a>
                        <a class="refresh" id="refresh-toggler" href="">
                            <i class="glyphicon glyphicon-refresh"></i>
                        </a>
                        <a class="fullscreen" id="fullscreen-toggler" href="javascript:;">
                            <i class="glyphicon glyphicon-fullscreen"></i>
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
<script>
setUuid( '${sessionScope.cmsLoginPhoto }' );
imgIdValue="USR_PHOTO_FILE";
unit_fileGet("USR_PHOTO_FILE", "fn_fileUpload");
$(".avatar").attr( 'src', $('#imgTag').val() );


$('.account-area').on('click', function(){
	if( $('.account-area > li').hasClass('open') ) $('.account-area > li').removeClass('open');
	else $('.account-area > li').addClass('open');
});


$('.menu-dropdown').each(function( key, val ){
	
	if( $(this).attr('id') == window.location.pathname.split('/')[2] ) {
		$(this).css('color','black');
	}
});

$('.submenu a').each(function( key, val ){
	if( $(this).attr('id') == window.location.pathname.split('/')[2] ) {
		$(this).parents('ul').css('display', 'block');
		$(this).css('color','black');
	}
});


$('.menu-text').click(function() {
	
	deleteCookie("key1");
	deleteCookie("key2");
	deleteCookie("key3");
	deleteCookie("key4");
	deleteCookie("key5");
	deleteCookie("key6");
	deleteCookie("key7");
	deleteCookie("key8"); 
	deleteCookie("key9");

});

$('.header-left').click(function() {
	
	deleteCookie("key1");
	deleteCookie("key2");
	deleteCookie("key3");
	deleteCookie("key4");
	deleteCookie("key5");
	deleteCookie("key6");
	deleteCookie("key7");
	deleteCookie("key8"); 
	deleteCookie("key9");
	
});



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


</script>
	<!--Beyond Scripts-->	
	<script src="/resources/js/beyond.js"></script>

</body>
</html>
