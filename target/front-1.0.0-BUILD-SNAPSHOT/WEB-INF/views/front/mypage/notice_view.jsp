<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<h2 class="hideHeading">컨텐츠</h2>
<div class="mypage_subGnb">
	<ul>
		<li><a href="/front/mypage/profile" title="프로필">프로필</a></li>
		<li><a href="/front/mypage/bookmark" title="나의 관심 프로젝트">나의 관심 프로젝트</a></li>
		<li><a href="/front/mypage/team_contest" title="팀 만들기">팀 만들기</a></li>
		<li><a href="/front/mypage/myteam_list" title="나의 팀 관리">나의 팀 관리</a></li>
		<li><a href="/front/mypage/awards" title="수상인증">수상인증</a></li>
<c:choose>
				<c:when test="${sessionScope.loginStat eq 'K'}">
					<li><a href="/front/membership/kakaomodify" title="정보 수정">정보수정</a></li>
				</c:when>
				<c:otherwise>
			 <li><a class="fn_profileEditAccess" href="#none" title="정보 수정">정보수정</a></li>
				</c:otherwise>
</c:choose>
		<li class="active"><a href="/front/mypage/notice" title="공지사항">공지사항</a></li>
	</ul>
</div>
<div class="mypage_wrap">
	<div class="sectionWrap">
		<div class="mypage_notice">
			<h2>공지사항</h2>
			<div class="mypage_notice_view">
				<div class="notice_view_titleWrap">
					<h3>
						<strong>[전체공지] 뉴-스타터 이용 방법에 대한 공지</strong><b>2019.04.21</b>
					</h3>
				</div>
				<div class="notice_view_contentWrap">
					<div class="notice_view_content">
						뉴-스타터 이용 방법에 대한 공지 내용입니다.
					</div>
				</div>
			</div>
			<div class="mypage_notice_view_btn">
				<button class="btn_blk btn_team_common" onclick="fn_toNotice();">목록</button>
			</div>
		</div>
	</div>
</div>
<div class="m_footerDummy"></div>