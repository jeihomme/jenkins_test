<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="data" value="${out.index.data[0]}" />
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
		<li><a href="/front/mypage/notice" title="공지사항">공지사항</a></li>
	</ul>
</div>
<div class="mypage_wrap">
	<div class="sectionWrap">
		<div class="mypage_layout mypage_myInfo">
			<p class="myInfo_pic"><a href="/front/mypage/profile" title="내 프로필 보기"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></a></p>
			<p class="myInfo_content">
				<strong>${sessionScope.loginNick}</strong>
				<span>${sessionScope.loginEmail}</span>
				<span><c:if test="${sessionScope.loginJob eq 'M'}">중학생</c:if>
				<c:if test="${sessionScope.loginJob eq 'H'}">고등학생</c:if>
				<c:if test="${sessionScope.loginJob eq 'U'}">대학생</c:if>
				<c:if test="${sessionScope.loginJob eq 'G'}">대학원생</c:if>
				<c:if test="${sessionScope.loginJob eq 'A'}">일반인</c:if></span>
			</p>
		<c:choose>
				<c:when test="${sessionScope.loginStat eq 'K'}">
						<p class="myInfo_edit"><a href="/front/membership/kakaomodify" title="정보수정"><i class="fas fa-cog"></i></a></p>
				</c:when>
				<c:otherwise>
			 			<p class="myInfo_edit"><a class="fn_profileEditAccess" href="#none" title="정보수정"><i class="fas fa-cog"></i></a></p>
				</c:otherwise>
		</c:choose>
		</div>
		<div class="mypage_layout mypage_myActive">
			<h3>활동 이력</h3>
			<ul>
				<li>
					<a class="myActive_wrap" href="#none" onclick="fn_toProfileContest();" title="참여한 공모전 보기">
						<p class="myActive_img"><i><img src="/resources/images/icon_profile01.png" alt="공모전 참여"/></i></p>
						<p class="myActive_txt">
							<strong>공모전 참여</strong>
							<span>${data.CONTEST_CNT}회</span>
						</p>
					</a>
				</li>
				<li>
					<a class="myActive_wrap" href="#none" onclick="fn_toProfileTeam();" title="참여한 팀 활동 보기">
						<p class="myActive_img"><i><img src="/resources/images/icon_profile02.png" alt="팀 활동"/></i></p>
						<p class="myActive_txt">
							<strong>팀 활동</strong>
							<span>${data.TOTAL_T_CONTEST_CNT}회</span>
						</p>
					</a>
				</li>
				<li>
					<a class="myActive_wrap" href="#none" onclick="fn_toProfileAwards();" title="수상 경력 보기">
						<p class="myActive_img"><i><img src="/resources/images/icon_profile03.png" alt="수상경력"/></i></p>
						<p class="myActive_txt">
							<strong>수상경력</strong>
							<span>${data.REWARD_CNT}회</span>
						</p>
					</a>
				</li>
			</ul>
		</div>
		<div class="mypage_layout mypage_alarm">
			<h3>최근 알림</h3>
			<ul id="mypage_alarm">
			</ul>
		</div>
		<div class="mypage_layout mypage_etc">
			<ul>
				<li>
					<a href="/front/mypage/bookmark" title="찜한 공모전">
					  <i><img src="/resources/images/icon_mypage_01.png" alt="찜한 공모전"/></i>
					  <span>찜한 공모전</span>
					</a>
				  </li>
				  <li>
					<a href="/front/mypage/team_contest" title="팀 만들기">
					   <i><img src="/resources/images/icon_mypage_02.png" alt="팀 만들기"/></i>
					  <span>팀 만들기</span>
					</a>
				  </li>
				  <li>
					<a href="/front/mypage/myteam_list" title="팀 관리">
					  <i class="far fa-users-cog"></i>
					  <span>팀 관리</span>
					</a>
				  </li>
				  <li>
					<a href="/front/mypage/awards" title="수상 인증">
					   <i><img src="/resources/images/icon_mypage_04.png" alt="수상 인증"/></i>
					  <span>수상 인증</span>
					</a>
				  </li>
				  <li>
		<c:choose>
				<c:when test="${sessionScope.loginStat eq 'K'}">
						<a href="/front/membership/kakaomodify" title="정보수정">	
				</c:when>
				<c:otherwise>
			 			<a class="fn_profileEditAccess" href="#none" title="정보수정">
				</c:otherwise>
		</c:choose>
					   <i><img src="/resources/images/icon_mypage_05.png" alt="정보 수정"/></i>
					  <span>정보 수정</span>
					</a>
				  </li>
				  <li>
					<a href="/front/mypage/notice" title="공지사항">
					   <i><img src="/resources/images/icon_mypage_06.png" alt="공지사항"/></i>
					  <span>공지사항</span>
					</a>
				</li>
			</ul>
		</div>
		<p class="mypage_logout"><a href="/front/membership/logout" title="로그아웃">로그아웃</a></p>
	</div>
</div>
<div class="sub_swiper swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide">
			<div class="sub_slide">
				<p>사회문제를 함께 할 여러분을 찾습니다!</p>
				<span>여러분을 기다리고 있어요. 지금 바로 만나보세요!!</span>
				<button class="btn_transp" onclick="fn_toSocial();">사회문제 도전하기</button>
			</div>
		</div>
		<div class="swiper-slide">
			<div class="sub_slide">
				<p>사회문제를 함께 할 여러분을 찾습니다!</p>
				<span>여러분을 기다리고 있어요. 지금 바로 만나보세요!!</span>
				<button class="btn_transp" onclick="fn_toSocial();">사회문제 도전하기</button>
			</div>
		</div>
		<div class="swiper-slide">
			<div class="sub_slide">
				<p>사회문제를 함께 할 여러분을 찾습니다!</p>
				<span>여러분을 기다리고 있어요. 지금 바로 만나보세요!!</span>
				<button class="btn_transp" onclick="fn_toSocial();">사회문제 도전하기</button>
			</div>
		</div>
	</div>

	<!-- Add Arrows -->
	<div class="sub_swiperNext swiper-button-next"></div>
	<div class="sub_swiperPrev swiper-button-prev"></div>
</div>

<script>

	$(document).ready(function(){
		fn_AlarmList();
		var swiper2 = new Swiper('.sub_swiper', {
			loop : true,
			navigation: {
				nextEl: '.sub_swiperNext',
				prevEl: '.sub_swiperPrev',
			},
		});
		
	});
	
	
	function fn_AlarmList() {

		//  1. 유효성 검사를 위한 파라미터값
		var params = new Object();
		params.status = 'AlarmList';

		//	2. 유효성 검사 서비스로 이동
		var result = ${unit.ajax("index", "params")};

		if ( unit_isComplete(result) ){
			
			$('#mypage_alarm li').remove();
			
			var jsonDetail = result.out.list.data;
			var inTag = '';
			if(jsonDetail[0] == null){
				inTag += '<li>';
				inTag += '<p class="alarm_txt"> 최근에 온 알림이 없습니다.</p>';
				inTag += '</li>';
			}
			
			$.each( jsonDetail, function( key, val) {
				inTag += '<li>';
				inTag += '<p class="alarm_pic"><img src="/resources/images/team_sample.png" alt="팀 사진"/></p>';
				inTag += '<p class="alarm_txt"><a href="'+ val.ALRM_RCV_LINK +'" title="나의 팀 보기">'+val.ALRM_RCV_DTL+'</a></p>';
				inTag += '</li>';
			});

			$('#mypage_alarm').append( inTag );
		}
	}
</script>