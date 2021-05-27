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
		<li class="active"><a href="/front/mypage/myteam_list" title="나의 팀 관리">나의 팀 관리</a></li>
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
		<div class="mypage_myteam">
			<h3>활동중인 팀</h3>
			<ul>
				<li>
					<a class="myteam_myteamBoxWrap" href="/front/mypage/myteam_detail" title="활동중인 팀 이름">
						<p class="myTeam_pic"><img src="/resources/images/team_sample.png" alt="팀 대표사진"/></p>
						<div class="myTeam_txt">
							<strong class="myTeam_name">뉴스타터 팀</strong>
							<div class="myTeam_detail">
								<canvas id="myteam01" height="70"></canvas>
								<p class="myTeam_title">비행청소년 교육 멘토링 공모전</p>
								<p class="mypage_myteamCategory"><i><img src="/resources/images/icon_contest03_active.png" alt="카테고리 아이콘"/></i><span>공학/컴퓨터</span><strong>3명</strong></p>
							</div>
						</div>
					</a>
				</li>
				<li>
					<a class="myteam_myteamBoxWrap" href="/front/mypage/myteam_detail" title="활동중인 팀 이름">
						<p class="myTeam_pic"><img src="/resources/images/team_sample.png" alt="팀 대표사진"/></p>
						<div class="myTeam_txt">
							<strong class="myTeam_name">뉴스타터 팀</strong>
							<div class="myTeam_detail">
								<canvas id="myteam02" height="70"></canvas>
								<p class="myTeam_title">비행청소년 교육 멘토링 공모전</p>
								<p class="mypage_myteamCategory"><i><img src="/resources/images/icon_social02_active.png" alt="카테고리 아이콘"/></i><span>지역문제</span><strong>3명</strong></p>
							</div>
						</div>
					</a>
				</li>
			</ul>
		</div>
		<div class="mypage_myteam">
			<h3>활동이 종료된 팀 모임</h3>
			<ul class="mypage_myteam_closed">
				<li>
					<a class="myteam_myteamBoxWrap" href="#none" title="상호 평가하기" onclick="fn_toExpire();">
						<p class="myTeam_pic"><img src="/resources/images/team_sample.png" alt="팀 대표사진"/></p>
						<div class="myTeam_txt">
							<strong class="myTeam_name">뉴스타터 팀</strong>
							<p class="myTeam_title">비행청소년 교육 멘토링 공모전</p>
							<div class="myTeam_detail">
								<p><i><img src="/resources/images/icon_contest01_active.png" alt="카테고리 아이콘"/></i><span>기획/마케팅</span><strong>3명</strong><b>2019.03.23~2019.05.21</b></p>
							</div>
						</div>
						<p class="myTeam_closed_btn"><button class="btn_fff btn_team_common">상호 평가하기</button></p>
					</a>
				</li>
				<li>
					<a class="myteam_myteamBoxWrap" href="#none" title="평가완료">
						<p class="myTeam_pic"><img src="/resources/images/team_sample.png" alt="팀 대표사진"/></p>
						<div class="myTeam_txt">
							<strong class="myTeam_name">뉴스타터 팀</strong>
							<p class="myTeam_title">비행청소년 교육 멘토링 공모전</p>
							<div class="myTeam_detail">
								<p><i><img src="/resources/images/icon_contest02_active.png" alt="카테고리 아이콘"/></i><span>사진/영상</span><strong>3명</strong><b>2019.03.23~2019.05.21</b></p>
							</div>
						</div>
						<p class="myTeam_closed_btn myTeam_closed_complete"><span>평가완료</span></p>
					</a>
				</li>
			</ul>
		</div>
	</div>
</div>
<div class="m_footerDummy"></div>
<script>
	var ctx = document.getElementById("myteam01");
	var barChart = new Chart(ctx, {
		type: 'horizontalBar',
		data: {
			datasets: [{
				label: "진행률(%)",
				data: [85],
				backgroundColor: "rgba(209, 234, 234, 0.5)",
				borderColor: "rgba(53, 171, 173, 1)",
				borderWidth : 1
			}]
		},
		options: {
			responsive: true,
			maintainAspectRatio: false,
			legend: {
				display: false
			},
			scales: {
				xAxes: [{
					ticks: {
						min: 0,
						max: 100
					}
				}],
				yAxes: [{
					barThickness: 10,
					ticks: {
						beginAtZero: true,
					}
				}]
			},
			plugins: {
				datalabels: {
					backgroundColor: function(context) {
						return context.dataset.borderColor;
					},
					color: 'white',
					padding: 4,
					font: {
						size: 12,
						weight: 'bold'
					},
					align: 'center',
					anchor: 'end',
					formatter: function(value, context){
						return Math.round(value) + '%';
					}
				}
			}
		}
	});
	
	var ctx = document.getElementById("myteam02");
	var barChart = new Chart(ctx, {
		type: 'horizontalBar',
		data: {
			datasets: [{
				label: "진행률(%)",
				data: [54],
				backgroundColor: "rgba(209, 234, 234, 0.5)",
				borderColor: "rgba(53, 171, 173, 1)",
				borderWidth : 1
			}]
		},
		options: {
			responsive: true,
			maintainAspectRatio: false,
			legend: {
				display: false
			},
			scales: {
				xAxes: [{
					ticks: {
						min: 0,
						max: 100
					}
				}],
				yAxes: [{
					barThickness: 10,
					ticks: {
						beginAtZero: true,
					}
				}]
			},
			plugins: {
				datalabels: {
					backgroundColor: function(context) {
						return context.dataset.borderColor;
					},
					color: 'white',
					padding: 4,
					font: {
						size: 12,
						weight: 'bold'
					},
					align: 'center',
					anchor: 'end',
					formatter: function(value, context){
						return Math.round(value) + '%';
					}
				}
			}
		}
	});
</script>