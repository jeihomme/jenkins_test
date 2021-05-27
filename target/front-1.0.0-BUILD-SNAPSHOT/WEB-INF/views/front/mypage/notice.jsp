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
			<ul class="mypage_notice_category">
				<li class="mypage_notice_active"><a href="#none" title="전체">전체</a></li>
				<li><a href="#none" title="공지">공지</a></li>
				<li><a href="#none" title="이벤트">이벤트</a></li>
				<li><a href="#none" title="보도자료">보도자료</a></li>
			</ul>
			<div class="mypage_notice_listWrap">
				<ul class="mypage_notice_list notice_list_all">
					<li>
						<strong>[전체공지]</strong>
						<span><a href="/front/mypage/notice_view" title="공지사항 제목">뉴-스타터 이용 방법에 대한 공지</a></span>
						<b>2019.04.21</b>
					</li>
					<li>
						<strong>[이벤트]</strong>
						<span><a href="/front/mypage/notice_view" title="공지사항 제목">뉴-스타터 이용 방법에 대한 공지</a></span>
						<b>2019.04.21</b>
					</li>
					<li>
						<strong>[보도자료]</strong>
						<span><a href="/front/mypage/notice_view" title="공지사항 제목">뉴-스타터 이용 방법에 대한 공지</a></span>
						<b>2019.04.21</b>
					</li>
					<li>
						<strong>[공지]</strong>
						<span><a href="/front/mypage/notice_view" title="공지사항 제목">뉴-스타터 이용 방법에 대한 공지</a></span>
						<b>2019.04.21</b>
					</li>
				</ul>
				<ul class="mypage_notice_list notice_list_notice">
					<li>
						<strong>[공지]</strong>
						<span><a href="/front/mypage/notice_view" title="공지사항 제목">뉴-스타터 이용 방법에 대한 공지</a></span>
						<b>2019.04.21</b>
					</li>
					<li>
						<strong>[공지]</strong>
						<span><a href="/front/mypage/notice_view" title="공지사항 제목">뉴-스타터 이용 방법에 대한 공지</a></span>
						<b>2019.04.21</b>
					</li>
					<li>
						<strong>[공지]</strong>
						<span><a href="/front/mypage/notice_view" title="공지사항 제목">뉴-스타터 이용 방법에 대한 공지</a></span>
						<b>2019.04.21</b>
					</li>
					<li>
						<strong>[공지]</strong>
						<span><a href="/front/mypage/notice_view" title="공지사항 제목">뉴-스타터 이용 방법에 대한 공지</a></span>
						<b>2019.04.21</b>
					</li>
				</ul>
				<ul class="mypage_notice_list notice_list_event">
					<li>
						<strong>[이벤트]</strong>
						<span><a href="/front/mypage/notice_event_view" title="공지사항 제목">뉴-스타터 이용 방법에 대한 공지</a></span>
						<b>2019.04.21</b>
					</li>
					<li>
						<strong>[이벤트]</strong>
						<span><a href="/front/mypage/notice_event_view" title="공지사항 제목">뉴-스타터 이용 방법에 대한 공지</a></span>
						<b>2019.04.21</b>
					</li>
					<li>
						<strong>[이벤트]</strong>
						<span><a href="/front/mypage/notice_event_view" title="공지사항 제목">뉴-스타터 이용 방법에 대한 공지</a></span>
						<b>2019.04.21</b>
					</li>
					<li>
						<strong>[이벤트]</strong>
						<span><a href="/front/mypage/notice_event_view" title="공지사항 제목">뉴-스타터 이용 방법에 대한 공지</a></span>
						<b>2019.04.21</b>
					</li>
				</ul>
				<ul class="mypage_notice_list notice_list_news">
					<li>
						<strong>[보도자료]</strong>
						<span><a href="/front/mypage/notice_view" title="공지사항 제목">뉴-스타터 이용 방법에 대한 공지</a></span>
						<b>2019.04.21</b>
					</li>
					<li>
						<strong>[보도자료]</strong>
						<span><a href="/front/mypage/notice_view" title="공지사항 제목">뉴-스타터 이용 방법에 대한 공지</a></span>
						<b>2019.04.21</b>
					</li>
					<li>
						<strong>[보도자료]</strong>
						<span><a href="/front/mypage/notice_view" title="공지사항 제목">뉴-스타터 이용 방법에 대한 공지</a></span>
						<b>2019.04.21</b>
					</li>
					<li>
						<strong>[보도자료]</strong>
						<span><a href="/front/mypage/notice_view" title="공지사항 제목">뉴-스타터 이용 방법에 대한 공지</a></span>
						<b>2019.04.21</b>
					</li>
				</ul>
				<ul class="recruit_paging">
					<li class="chev"><a href="#none" title="left"><i class="far fa-chevron-left"></i></a></li>
					<li class="paging_active"><a href="#none" title="1">1</a></li>
					<li><a href="#none" title="2">2</a></li>
					<li><a href="#none" title="3">3</a></li>
					<li><a href="#none" title="4">4</a></li>
					<li><a href="#none" title="5">5</a></li>
					<li class="chev"><a href="#none" title="right"><i class="far fa-chevron-right"></i></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="m_footerDummy"></div>