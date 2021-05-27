<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<h2 class="hideHeading">컨텐츠</h2>
<div class="mypage_subGnb">
	<ul>
		<li><a href="/front/mypage/profile" title="프로필">프로필</a></li>
		<li class="active"><a href="/front/mypage/bookmark" title="나의 관심 프로젝트">나의 관심 프로젝트</a></li>
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
		<div class="mypage_bookmarkWrap">
			<div class="mypage_bookmark_apply">
				<h3>지원한 프로젝트</h3>
				<ul>
					<li>
						<div class="mypage_bookmark_applyWrap">
							<p class="bookmark_img"><a href="/front/contest/team" title="팀 상세보기"><img src="/resources/images/recruit_img01.png" alt="공모전 이미지"/></a></p>
							<div class="bookmark_txt">
								<p class="bookmark_txt_title"><a href="/front/contest/team" title="팀 상세보기">공모킬러 팀</a></p>
								<span class="bookmark_txt_subTitle"><a href="/front/contest/contest" title="공모전 상세보기">제 6회 산업통상부 마케팅 아이디어 공모전</a></span>
								<p class="bookmark_txt_detail">
									<em><i class="fas fa-map-marker-alt"></i>홍대역 인근</em>
									<em><i class="fas fa-user-plus"></i>5명 지원</em>
									<strong>D-5</strong>
									<b>팀원 모집중</b>
								</p>
							</div>
							<p class="bookmark_cancel"><a href="#none" title="지원취소">지원취소</a></p>
						</div>
					</li>
					<li>
						<div class="mypage_bookmark_applyWrap">
							<p class="bookmark_img"><a href="/front/social/team" title="팀 상세보기"><img src="/resources/images/recruit_img02.png" alt="사회문제 이미지"/></a></p>
							<div class="bookmark_txt">
								<p class="bookmark_txt_title"><a href="/front/social/team" title="팀 상세보기">사회해결 팀</a></p>
								<span class="bookmark_txt_subTitle"><a href="/front/social/team" title="팀 상세보기">서울 노인복지프로그램 개발 프로젝트</a></span>
								<p class="bookmark_txt_detail">
									<em><i class="fas fa-map-marker-alt"></i>홍대역 인근</em>
									<em><i class="fas fa-user-plus"></i>5명 지원</em>
									<strong>D-5</strong>
									<b>팀원 모집중</b>
								</p>
							</div>
							<p class="bookmark_cancel"><a href="#none" title="지원취소">지원취소</a></p>
						</div>
					</li>
				</ul>
			</div>
			<div class="mypage_bookmark_apply">
				<h3>관심있는 공모전</h3>
				<ul>
					<li>
						<div class="mypage_bookmark_applyWrap">
							<a href="/front/contest/contest" title="공모전 상세보기">
								<p class="bookmark_img"><img src="/resources/images/recruit_img03.png" alt="공모전 이미지"/></p>
								<div class="bookmark_txt">
									<p class="bookmark_txt_title">제 6회 산업통상부 마케팅 아이디어 공모전</p>
									<span class="bookmark_txt_subTitle">기획/마케팅</span>
									<p class="bookmark_txt_detail">
										<em>by 산업통상자원부</em>
										<b>500만원</b>
										<strong>D-5</strong>
									</p>
								</div>
								<p class="bookmark_bookmarked"><a href="#none" title="관심"><i class="fas fa-star"></i></a></p>
							</a>
						</div>
						<div class="bookmark_chartArea">
							<h4>도전중인 뉴-스타터</h4>
							<div class="bookmark_chart">
								<div><canvas id="bookmark01"></canvas></div>
								<ul>
									<li><i class="fas fa-heart"></i><span>찜한 사람</span><strong>42명</strong></li>
									<li><i class="fas fa-user-friends"></i><span>도전중인 팀</span><strong>12팀</strong></li>
									<li><i class="fas fa-user"></i><span>도전중인 사람</span><strong>30명</strong></li>
								</ul>
							</div>
						</div>
					</li>
					<li>
						<div class="mypage_bookmark_applyWrap">
							<a href="/front/contest/contest" title="공모전 상세보기">
								<p class="bookmark_img"><img src="/resources/images/recruit_img04.png" alt="공모전 이미지"/></p>
								<div class="bookmark_txt">
									<p class="bookmark_txt_title">제 6회 산업통상부 마케팅 아이디어 공모전</p>
									<span class="bookmark_txt_subTitle">기획/마케팅</span>
									<p class="bookmark_txt_detail">
										<em>by 산업통상자원부</em>
										<b>500만원</b>
										<strong>D-5</strong>
									</p>
								</div>
								<p class="bookmark_bookmarked"><a href="#none" title="관심"><i class="fas fa-star"></i></a></p>
							</a>
						</div>
						<div class="bookmark_chartArea">
							<h4>도전중인 뉴-스타터</h4>
							<div class="bookmark_chart">
								<div><canvas id="bookmark02"></canvas></div>
								<ul>
									<li><i class="fas fa-heart"></i><span>찜한 사람</span><strong>31명</strong></li>
									<li><i class="fas fa-user-friends"></i><span>도전중인 팀</span><strong>10팀</strong></li>
									<li><i class="fas fa-user"></i><span>도전중인 사람</span><strong>21명</strong></li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="m_footerDummy"></div>
<script>

	var ctx = document.getElementById("bookmark01");
	var lineChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: ["5일전", "4일전", "3일전", "2일전", "어제"],
			datasets: [{
				label: "지원자",
				fill: false,
				pointBackgroundColor: "rgba(57, 173, 175,1)",
				borderColor: "rgba(57, 173, 175,1)",
				pointBorderColor: "rgba(57, 173, 175,1)",
				data: [10, 18, 23, 37, 30],
				steppedLine: false,
			}]
		},
		options: {
			layout: {
				padding: {
					top: 20
				}
			},
			legend: {
				display: false
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
						weight: 'normal'
					},
					align: 'center',
					anchor: 'end',
					formatter: function(value, context){
						return Math.round(value) + '명';
					}
				}
			}
		}
	});
	
	var ctx = document.getElementById("bookmark02");
	var lineChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: ["5일전", "4일전", "3일전", "2일전", "어제"],
			datasets: [{
				label: "지원자",
				fill: false,
				pointBackgroundColor: "rgba(57, 173, 175,1)",
				borderColor: "rgba(57, 173, 175,1)",
				pointBorderColor: "rgba(57, 173, 175,1)",
				data: [6, 16, 19, 24, 21],
				steppedLine: false,
			}]
		},
		options: {
			layout: {
				padding: {
					top: 20
				}
			},
			legend: {
				display: false
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
						weight: 'normal'
					},
					align: 'center',
					anchor: 'end',
					formatter: function(value, context){
						return Math.round(value) + '명';
					}
				}
			}
		}
	});
</script>