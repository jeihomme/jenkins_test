<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="data" value="${out.profile.data[0]}" />
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
		<div class="mypage_profileWrap">
		<!--
			<div class="mypage_search">
				<input type="text" title="검색" name="검색" placeholder="사용자의 아이디 또는 별명으로 검색"/>
			</div>
		-->
			<div class="mypage_layout mypage_myInfo">
				<p class="myInfo_pic">
					<a id="modifyFormProfileImg" href="#none" title="프로필 사진">
						<img src="/resources/images/profile_picture.png" alt="프로필 사진"/>
					</a>
					<input id="modifyFormProfileImgDummy" type="file" name="modifyFormProfileImgDummy" title="프로필 사진" hidden="hidden"/>
				</p>
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
			<div class="mypage_layout mypage_chart">
				<canvas id="profile_radar"></canvas>
				<div class="mypage_chart_avg">
					<span>평균</span>
					<strong id="EVAL_AVG"></strong>
				</div>
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
		</div>
		<div id="mypage_profile_contestRecord" class="mypage_table">
			<h3><i><img src="/resources/images/icon_profile_title01.png" alt="공모전 참여 기록"/></i>공모전 참여 기록</h3>
			<p class="mypage_table_desc">최근 3년간 뉴-스타터를 통해 도전하신 공모전의 기록입니다. <span>(최근 총 4회)</span></p>
			<table class="mypage_table_common">
				<tbody>
					<tr>
						<td><b>2019</b></td>
						<td class="tdwidth70"><span>미세먼지 속에 빈부격차 해결 아이디어 공모전</span></td>
						<td class="collapseCol"><strong>2019.03.27</strong></td>
					</tr>
					<tr>
						<td><b>2019</b></td>
						<td class="tdwidth70"><span>부산시 공공 디자인 공모전</span></td>
						<td class="collapseCol"><strong>2019.03.01</strong></td>
					</tr>
					<tr>
						<td><b>2019</b></td>
						<td class="tdwidth70"><span>빅데이터 마케팅 활용 공모전</span></td>
						<td class="collapseCol"><strong>2019.02.25</strong></td>
					</tr>
					<tr>
						<td><b>2019</b></td>
						<td class="tdwidth70"><span>이니스프리 화장품 신제품 아이디어 공모전</span></td>
						<td class="collapseCol"><strong>2019.01.25</strong></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="mypage_profile_teamRecord" class="mypage_table">
			<h3><i><img src="/resources/images/icon_profile_title02.png" alt="팀 활동 기록"/></i>팀 활동 기록</h3>
			<p class="mypage_table_desc">최근 3년간 뉴-스타터를 통해 도전하신 공모전 팀 활동 기록입니다. <span>(최근 총 2회)</span></p>
			<table class="mypage_table_common">
				<tbody>
					<tr>
						<th>연도</th>
						<th>팀명</th>
						<th class="tdwidth30 collapseCol">과제명</th>
						<th class="collapseCol">인원</th>
						<th>평점</th>
						<th class="collapseCol">리뷰확인</th>
					</tr>
					<tr>
						<td><b>2019</b></td>
						<td>홍철없는홍철팀</td>
						<td class="tdwidth30 collapseCol"><span>부산시 공공 디자인 공모전</span></td>
						<td class="collapseCol">3</td>
						<td>
							<strong class="mypage_table_reviewRating">4.0</strong>
							<i class="mypage_table_reviewRating_star"><img src="/resources/images/profile_score40.png" alt="4점"/></i>
						</td>
						<td class="collapseCol mypage_table_reviewIcon"><a class="fn_profileReviewPopup" href="#none" title="리뷰확인"><i><img src="/resources/images/btn_profile01.png" alt="리뷰확인"/></i></a></td>
					</tr>
					<tr>
						<td><b>2019</b></td>
						<td>박명수팀</td>
						<td class="tdwidth30 collapseCol"><span>빅데이터 마케팅 활용 공모전</span></td>
						<td class="collapseCol">4</td>
						<td>
							<strong class="mypage_table_reviewRating">3.0</strong>
							<i class="mypage_table_reviewRating_star"><img src="/resources/images/profile_score30.png" alt="3점"/></i>
						</td>
						<td class="collapseCol mypage_table_reviewIcon"><a class="fn_profileReviewPopup" href="#none" title="리뷰확인"><i><img src="/resources/images/btn_profile01.png" alt="리뷰확인"/></i></a></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="mypage_profile_awardsRecord" class="mypage_table">
			<h3><i><img src="/resources/images/icon_profile_title03.png" alt="수상 및 자격증 인증 기록"/></i>수상 및 자격증 인증 기록</h3>
			<p class="mypage_table_desc">최근 3년간 뉴-스타터에 인증을 완료한 수상 및 자격증 기록입니다. <span>(최근 총 2회)</span></p>
			<table class="mypage_table_common" id='mypage_table_common'>
				<tbody>
					<tr>
						<th>연도</th>
						<th class="tdwidth30">대회명</th>
						<th class="collapseCol">주최</th>
						<th>실적</th>
						<th class="collapseCol">인증확인</th>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div class="m_footerDummy"></div>
<div id="modal_profileReview" class="modal_team_view">
	<p class="modal_guide_banner_close"><a href="#none" title="닫기"><img src="/resources/images/info_guide_close.png" alt="닫기"/></a></p>
	<div class="modal_team_viewWrap">
		<h3>리뷰 확인</h3>
		<div class="modal_team_viewContents">
			<div class="modal_viewReview_list">
				<div class="modal_viewReview_title">
					<h3>
						하나왕 님
						<strong>in 경기-좋다 팀</strong>
					</h3>
					<h4>
						총평
						<strong>4.0</strong>
					</h4>
					<i><img src="/resources/images/expire_score40.png" alt="별점"/></i>
				</div>
				<div class="modal_viewReview_detail">
					<h4>세부 평가</h4>
					<ul class="modal_viewReview_detail_list">
						<li class="active"><a href="#none" title="역할 성실도"><span>역할 성실도</span></a><i><img src="/resources/images/profile_score40.png" alt="별점"/></i></li>
						<li><a href="#none" title="시간 약속"><span>시간 약속</span></a><i><img src="/resources/images/profile_score40.png" alt="별점"/></i></li>
						<li><a href="#none" title="배려심"><span>배려심</span></a><i><img src="/resources/images/profile_score50.png" alt="별점"/></i></li>
						<li><a href="#none" title="전문성"><span>전문성</span></a><i><img src="/resources/images/profile_score40.png" alt="별점"/></i></li>
						<li><a href="#none" title="창의력"><span>창의력</span></a><i><img src="/resources/images/profile_score40.png" alt="별점"/></i></li>
					</ul>
				</div>
			</div>
			<div class="modal_viewReview_contents">
				<ul class="modal_viewReview_contents_list">
					<li class="active">
						<h4>역할 성실도</h4>
						<strong>4.0</strong>
						<i><img src="/resources/images/profile_score40.png" alt="별점"/></i>
						<p class="modal_viewReview_contents_list_content">맡은 일을 잘 처리해주십니다. 알바 때문에 조금 늦을 때가 있어서 조금은 아쉽습니다.</p>
						<p>역할에 충실하게 해주어서 고마워요. 다음에도 팀으로 만나서 함께 프로젝트 해도 좋을거 같아요.</p>
					</li>
					<li>
						<h4>시간 약속</h4>
						<strong>4.0</strong>
						<i><img src="/resources/images/profile_score40.png" alt="별점"/></i>
						<p class="modal_viewReview_contents_list_content">내용이 들어갑니다.</p>
						<p>리뷰가 들어갑니다.</p>
					</li>
					<li>
						<h4>배려심</h4>
						<strong>5.0</strong>
						<i><img src="/resources/images/profile_score40.png" alt="별점"/></i>
						<p class="modal_viewReview_contents_list_content">내용이 들어갑니다.</p>
						<p>리뷰가 들어갑니다.</p>
					</li>
					<li>
						<h4>전문성</h4>
						<strong>4.0</strong>
						<i><img src="/resources/images/profile_score40.png" alt="별점"/></i>
						<p class="modal_viewReview_contents_list_content">내용이 들어갑니다.</p>
						<p>리뷰가 들어갑니다.</p>
					</li>
					<li>
						<h4>창의력</h4>
						<strong>4.0</strong>
						<i><img src="/resources/images/profile_score40.png" alt="별점"/></i>
						<p class="modal_viewReview_contents_list_content">내용이 들어갑니다.</p>
						<p>리뷰가 들어갑니다.</p>
					</li>
				</ul>
			</div>
		</div>
		<p class="modal_submit_button">
			<a class="fn_modalSubmitCancel" href="#none" title="닫기">닫기</a>
			<a class="fn_modalSubmitCancel" href="#none" title="확인">확인</a>
		</p>
	</div>
</div>
<div id="modal_profileAward" class="modal_team_view">
	<p class="modal_guide_banner_close"><a href="#none" title="닫기"><img src="/resources/images/info_guide_close.png" alt="닫기"/></a></p>
	<div class="modal_team_viewWrap">
		<h3>수상 인증 확인</h3>
		<div class="modal_team_viewContents">
			<div class="modal_profileAward_imgWrap">
				<img src="/resources/images/award_sample.png" alt="상장"/>
			</div>
		</div>
		<p class="modal_submit_button">
			<a class="fn_modalSubmitCancel" href="#none" title="닫기">닫기</a>
			<a class="fn_modalSubmitCancel" href="#none" title="확인">확인</a>
		</p>
	</div>
</div>
<script>
	$(document).ready(function(){
		fn_EvalList();	
		fn_RewardList();
	});
	
	var ctx = document.getElementById("profile_radar");
	var userEval = [];
	var userName = '';
	
	/* 모달팝업_프로필_리뷰확인 */
	$(".fn_profileReviewPopup").click(function(){
		$("#screenCover").show(0);
		$("#modal_profileReview").show(0);
		
		$(".fn_modalSubmitCancel").click(function(){
			$("#modal_profileReview").hide(0);
			$("#screenCover").hide(0);
		});
	});
	$(".modal_viewReview_detail_list li").click(function(){
		$(".modal_viewReview_detail_list li").removeClass("active");
		$(this).addClass("active");
	});
	$(".modal_viewReview_detail_list li:eq(0)").click(function(){
		$(".modal_viewReview_contents_list li").removeClass("active");
		$(".modal_viewReview_contents_list li:eq(0)").addClass("active");
	});
	$(".modal_viewReview_detail_list li:eq(1)").click(function(){
		$(".modal_viewReview_contents_list li").removeClass("active");
		$(".modal_viewReview_contents_list li:eq(1)").addClass("active");
	});
	$(".modal_viewReview_detail_list li:eq(2)").click(function(){
		$(".modal_viewReview_contents_list li").removeClass("active");
		$(".modal_viewReview_contents_list li:eq(2)").addClass("active");
	});
	$(".modal_viewReview_detail_list li:eq(3)").click(function(){
		$(".modal_viewReview_contents_list li").removeClass("active");
		$(".modal_viewReview_contents_list li:eq(3)").addClass("active");
	});
	$(".modal_viewReview_detail_list li:eq(4)").click(function(){
		$(".modal_viewReview_contents_list li").removeClass("active");
		$(".modal_viewReview_contents_list li:eq(4)").addClass("active");
	});
	
	/* 모달팝업_프로필_수상인증 */
	$(".fn_profileAwardPopup").click(function(){
		$("#screenCover").show(0);
		$("#modal_profileAward").show(0);
		
		$(".fn_modalSubmitCancel").click(function(){
			$("#modal_profileAward").hide(0);
			$("#screenCover").hide(0);
		});
	});
	
	//평점 등룍
	function fn_EvalList() {

		//  1. 유효성 검사를 위한 파라미터값
		var params = new Object();
		params.status = 'EVAL';

		//	2. 유효성 검사 서비스로 이동
		var result = ${unit.ajax("profile", "params")};

		if ( unit_isComplete(result) ){
		    var jsonDetail = result.out.list.data;
			$.each( jsonDetail, function( key, val) {
				$('#EVAL_AVG').text(val.EVAL_AVG + "점");
				userEval[0] = val.EVAL_ACT_SINC;
				userEval[1] = val.EVAL_TIME_APP;
				userEval[2] = val.EVAL_PROFESSIONAL;
				userEval[3] = val.EVAL_CONSIDERATION;
				userEval[4] = val.EVAL_CREATIVITY;
				userName = val.EVAL_NAME;
				userEvalChart();
			});
			
		}
	}
	
	function userEvalChart() {	
		var myChart = new Chart(ctx, {
			type : "radar",
			data : {
				labels: ["역할 성실도", "전문성", "창의력", "배려심", "시간약속"],
				datasets: [{
					label: userName
					, data: userEval
					, backgroundColor: "rgba(209, 234, 234, 0.5)"
					, borderColor: "rgba(53, 171, 173, 1)"
					, borderWidth : 1
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
				layout: {
					padding: {
						top: 60
					}
				},
				legend: {
					display: false
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
	}
	//수상경력 리스트
	function fn_RewardList() {
		//  1. 유효성 검사를 위한 파라미터값
		var params = new Object();
		params.status = 'REWARD';

		//	2. 유효성 검사 서비스로 이동
		var inTag = '';
		var result = ${unit.ajax("profile", "params")};
		if ( unit_isComplete(result) ){
		    var jsonDetail = result.out.Rlist.data;
			var inTag = '';
			if(jsonDetail[0] == null){
				inTag += '<tr>';
				inTag += '<td colspan="5">최근 3년간 수상 및 자격증 인증 기록이 없습니다.</td>';
				inTag += '</tr>';
			}
		    $.each( jsonDetail, function( key, val) {
				inTag += '<tr>';
				inTag += '<td><b>'+val.RWD_AWRD_YEAR+'</b></td>';
				inTag += '<td class="tdwidth30"><span>'+ val.COMP_NM+'</span></td>';
				inTag += '<td class="collapseCol">'+val.RWD_HOST+'</td>';
				inTag += '<td>'+val.RWD_PREFORMANCE+'</td>';
				inTag += '<td class="collapseCol mypage_table_reviewIcon"><a class="fn_profileAwardPopup" href="#none" title="인증확인"><i><img src="/resources/images/btn_profile02.png" alt="인증확인"/></i></a></td>';
				inTag += '</tr>';

			});
		    $('#mypage_table_common').append( inTag );
		}
	}

	
</script>