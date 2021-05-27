<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<h2 class="hideHeading">컨텐츠</h2>
<div class="mypage_subGnb">
	<ul>
		<li class="active"><a href="/front/mypage/profile" title="프로필">프로필</a></li>
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
		<div class="mypage_profileWrap" style="padding-bottom: 100px">
			<div class="mypage_layout mypage_myInfo">
				<p class="myInfo_pic"><a href="#none" title="프로필 사진"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></a></p>
				<p class="myInfo_content">
					<strong>도널드</strong>
					<span>donald@naver.com</span>
					<span>일반 성인</span>
				</p>
			</div>
			<div class="mypage_layout mypage_chart">
				<canvas id="profile_other_radar"></canvas>
				<div class="mypage_chart_avg">
					<span>평균</span>
					<strong>3점</strong>
				</div>
			</div>
			<div class="mypage_layout mypage_myActive">
				<h3>활동 이력</h3>
				<ul>
					<!-- <li>
						<a class="myActive_wrap" href="#none" onclick="fn_toProfileContest();" title="참여한 공모전 보기">
							<p class="myActive_img"><i><img src="/resources/images/icon_profile01.png" alt="공모전 참여"/></i></p>
							<p class="myActive_txt">
								<strong>공모전 참여</strong>
								<span>19회</span>
							</p>
						</a>
					</li>
					<li>
						<a class="myActive_wrap" href="#none" onclick="fn_toProfileTeam();" title="참여한 팀 활동 보기">
							<p class="myActive_img"><i><img src="/resources/images/icon_profile02.png" alt="팀 활동"/></i></p>
							<p class="myActive_txt">
								<strong>팀 활동</strong>
								<span>17회</span>
							</p>
						</a>
					</li>
					<li>
						<a class="myActive_wrap" href="#none" onclick="fn_toProfileAwards();" title="수상 경력 보기">
							<p class="myActive_img"><i><img src="/resources/images/icon_profile03.png" alt="수상경력"/></i></p>
							<p class="myActive_txt">
								<strong>수상경력</strong>
								<span>33회</span>
							</p>
						</a>
					</li> -->
					<li>
						<p class="myActive_img"><i><img src="/resources/images/icon_profile01.png" alt="공모전 참여"/></i></p>
						<p class="myActive_txt">
							<strong>공모전 참여</strong>
							<span>19회</span>
						</p>
					</li>
					<li>
						<p class="myActive_img"><i><img src="/resources/images/icon_profile02.png" alt="팀 활동"/></i></p>
						<p class="myActive_txt">
							<strong>팀 활동</strong>
							<span>17회</span>
						</p>
					</li>
					<li>
						<p class="myActive_img"><i><img src="/resources/images/icon_profile03.png" alt="수상경력"/></i></p>
						<p class="myActive_txt">
							<strong>수상경력</strong>
							<span>33회</span>
						</p>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="m_footerDummy"></div>
<script>
	var ctx = document.getElementById("profile_other_radar");
	var myChart = new Chart(ctx, {
		type : "radar",
		data : {
			labels: ["역할 성실도", "전문성", "창의력", "배려심", "시간약속"],
			datasets: [{
				label: "도널드",
				data: [3, 5, 4, 5, 3],
				backgroundColor: "rgba(209, 234, 234, 0.5)",
				borderColor: "rgba(53, 171, 173, 1)",
				borderWidth : 1
			}]
		},
		options : {
			scale : {
				ticks : {
					beginAtZero : true,
					max: 5,
					min: 0,
					stepSize: 1
				}
			},
			legend: {
				display: false
			},
			layout: {
				padding: {
					top: 60
				}
			},
			tooltips: {
				enabled: true,
				callbacks: {
					label: function(tooltipItem, data) {
						return data.datasets[tooltipItem.datasetIndex].label + ' : ' + data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
					}
				}
			},
			plugins: {
				datalabels: {
					backgroundColor: function(context) {
						return context.dataset.borderColor;
					},
					color: 'white',
					padding: 4,
					font: {
						size: 10,
						weight: 'bold'
					},
					anchor: 'start'
				}
			}
		}
	});
</script>