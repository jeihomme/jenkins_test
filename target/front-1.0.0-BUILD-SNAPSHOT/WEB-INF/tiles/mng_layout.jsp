<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no">
	<title>관리자  | NEWSTARTER</title>

	<!-- Jquery and Bootstap core js files -->	
	<script type="text/javascript" src="/resources/js/jquery.min.js"></script>	
	
	<script type="text/javascript" src="/resources/js/jquery-ui-1.11.4.js"></script>	
	<script type="text/javascript" src="/resources/js/jquery.slimscroll.min.js"></script>	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/35f90b3902.js"></script>
	<script src="/unit.iwonsoft.com/base.js"></script>
	<script src="/resources/js/chart.min.js"></script>
	
	<!-- Custom Scripts  and CSS -->	
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script type="text/javascript" src="/resources/js/common_mng.js"></script>	
	<script type="text/javascript" src="/resources/js/tmp_mng_menu.js"></script>
	<link href="/resources/css/common_mng.css" rel="stylesheet">
	<link href="/resources/css/layout_mng.css" rel="stylesheet">
</head>

<body class="divider_left">
<div class="wrapper">
	<div id="scrollToTop" class="scrollToTop"><i class="fa fa-angle-up"></i></div>	
	<!-- scrollToTop end -->
	
	<div class="header">
		<div class="header_left">
			<a href="/mng/main/dashboard"><img src="/resources/images/mng/mng_logo.png" /></a>
		</div>	
		<div class="header_right">
			<div class="form-inline">							
				<select class="designSelectBox form-control form-control-sm mr10" title="셀렉트박스" >
					<option value="1">관리자님</option>
					<!--
					<option value="2">정보변경</option>
					-->
					<option value="3">로그아웃</option>
				</select>	
<!--				
				<div class="user_onlyicon"><i class="fal fa-question-circle"></i></div>			

				<div class="user_onlyicon" onclick="popupShow('1200','','fullmenu');"><i class="fal fa-align-justify"></i></div>			
-->
			</div>
		</div>
	</div>
	<!-- header end --> 	


	<!-- Page Container -->
	<div class="page_container">
		<div class="page_sidebar" id="sidebar">
			<!-- Sidebar Menu -->
			<ul class="sidebar_menu">
	
				<!--메인 관리-->
				<li>
					<a href="#none"  class="menu-dropdown">
						<i class="menu_icon fal fal fa-desktop"></i>
						<span class="menu_text">메인 관리</span>
						<i class="menu_expand"></i>
					</a>
					<!--메인 관리 > 2차메뉴-->
					<ul class="submenu">
						<li><a href="/mng/main_mngt/eventso_contest"><span class="menu_text">공모전 뉴스타터</span></a></li>
						<li><a href="/mng/main_mngt/eventso_socialissue"><span class="menu_text">사회문제 뉴스타터</span></a></li>
						<li><a href="/mng/main_mngt/main_contest"><span class="menu_text">공모전 노출관리</span></a></li>
					</ul>
				</li>

				<!--배너 관리-->
				<li>
					<a href="#none" class="menu-dropdown">
						<i class="menu_icon far fa-audio-description"></i>
						<span class="menu_text">배너 관리</span>
						<i class="menu_expand"></i>
					</a>
					<!--베너 관리 > 2차메뉴-->
					<ul class="submenu">
						<li><a href="/mng/ad/banner"><span class="menu_text">광고 배너</span></a></li>
						<li><a href="/mng/ad/request"><span class="menu_text">신청 관리</span></a></li>
					</ul>
				</li>
				
				<!--프로젝트 관리-->				
				<li>
					<a href="#none" class="menu-dropdown">
						<i class="menu_icon far fa-ballot-check"></i>
						<span class="menu_text">프로젝트 관리</span>
						<i class="menu_expand"></i>
					</a>
					<!--프로젝트 관리 > 2차메뉴-->
					<ul class="submenu">
						<li><a href="/mng/project/contest"><span class="menu_text">공모전 관리</span></a></li>
						<li><a href="/mng/project/socialissue"><span class="menu_text">사회문제 관리</span></a></li>
					</ul>
				</li>
				
				<!--뉴스타터 팀 관리-->				
				<li>
					<a href="#none" class="menu-dropdown">
						<i class="menu_icon fal fa-list-ul"></i>
						<span class="menu_text">뉴스타터 팀 관리</span>
						<i class="menu_expand"></i>
					</a>
					<!--뉴스타터 관리 > 2차메뉴-->
					<ul class="submenu">
						<li><a href="/mng/team/team_contest"><span class="menu_text">공모전 팀</span></a></li>
						<li><a href="/mng/team/team_socialissue"><span class="menu_text">사회문제 팀</span></a></li>
						<li><a href="/mng/team/evaluation"><span class="menu_text">상호평가관리</span></a></li>
					</ul>
				</li>
				
				<!--고객센터-->
				<li>
					<a href="#none" class="menu-dropdown">
						<i class="menu_icon far fa-comments-alt"></i>
						<span class="menu_text">고객센터</span>
						<i class="menu_expand"></i>
					</a>
					<!--고객지원 > 2차메뉴-->
					<ul class="submenu">
						<li><a href="/mng/customer/notice"><span class="menu_text">공지사항</span></a></li>
						<li><a href="/mng/customer/note"><span class="menu_text">알림 쪽지</span></a></li>
					</ul>
				</li>
				
				<!--회원 관리-->				
				<li>
					<a href="#none" class="menu-dropdown">
						<i class="menu_icon far fa-user-chart"></i>
						<span class="menu_text">회원관리</span>
						<i class="menu_expand"></i>
					</a>
					<!--회원 관리 > 2차메뉴-->
					<ul class="submenu">
						<li><a href="/mng/member/member_list"><span class="menu_text">회원리스트</span></a></li>
					</ul>
				</li>
				
				<!--관리자계정 관리-->
				<li>
					<a href="#none" class="menu-dropdown">
						<i class="menu_icon fal fa-magic"></i>
						<span class="menu_text"> 관리자관리 </span>
						<i class="menu_expand"></i>						
					</a>
					<!--관리자계정 관리 > 2차메뉴-->
					<ul class="submenu">
						<li><a href="/mng/manager/admin_list"><span class="menu_text">관리자 리스트</span></a></li>				
					</ul>
				</li>
			</ul>
			<!-- /Sidebar Menu -->
			
			<div class="footer">
				<div class="copyright">Copyright © eventso<br>All rights reserved.</div>
			</div>			
		</div>

		<!-- Page Content -->
		<div class="page_content">
			<div class="page_breadcrumb">
				<ul class="breadcrumb">
					<li>
						<i class="fa fa-home"></i>
						<a href="#">Home</a>
					</li>
					<li>1depth</li>
					<li class="active">2depth</li>					
				</ul>
			</div>

			<div class="page_header">
				<div class="header_title">2depth</div>
			</div>

			<div class="page_body">					

				<!-- START : Contents -->
				<tiles:insertAttribute name="body" />
				<!-- END : Contents -->
			
			</div>

		</div>
		<!-- /Page Content -->
	</div>
	<!-- /Page Container -->

</div>

<!-- 전체메뉴 -->
<div id="fullmenu" class="popup_wrap">
	<div class="popup_layer">
		<div class="popup_inner">
			<div class="popup_header">	
				<h1 class="title">전체메뉴보기</h1>			
				<button class="btn btn_close_pop" data-action="popup_hide">닫기</button>
			</div>
			<div class="dialog_content">
				<div class="scroll_area">
					<!-- Start 팝업 컨텐츠 -->
					<div class="menu_desktopBG" style="height:400px;">
					

					</div> <!-- menu_desktopBG -->
					<!--// End 팝업 컨텐츠 -->
				</div><!--// End scroll_area -->
			</div><!--// End dialog_content -->
		</div><!--// End popup_inner -->
	</div><!--// End popup_layer -->
</div>

</body>
</html>