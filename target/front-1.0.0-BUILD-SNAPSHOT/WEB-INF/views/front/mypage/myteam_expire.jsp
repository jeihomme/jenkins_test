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
<div class="sectionWrap">
	<div class="mypage_expireInfo">
		<h3>상호평가</h3>
		<ul>
			<li>
				<p class="expire_img"><img src="/resources/images/icon_expire01.png" alt="역할성실도"/></p>
				<p class="expire_txt"><strong>역할성실도</strong>자신이 맡은 일에 대해서 얼마나 성실하게 수행 했는지를 평가해주세요.</p>
			</li>
			<li>
				<p class="expire_img"><img src="/resources/images/icon_expire02.png" alt="시간약속"/></p>
				<p class="expire_txt"><strong>시간약속</strong>회의 시간 및 모임시간 등의 시간약속을 얼마나 잘 이행했는지 평가해주세요.</p>
			</li>
			<li>
				<p class="expire_img"><img src="/resources/images/icon_expire03.png" alt="배려심"/></p>
				<p class="expire_txt"><strong>배려심</strong>프로젝트를 진행하며, 상호간의 예의와 매너를 얼마나 잘 지켰는지를 평가해주세요.</p>
			</li>
			<li>
				<p class="expire_img"><img src="/resources/images/icon_expire04.png" alt="창의력"/></p>
				<p class="expire_txt"><strong>창의력</strong>프로젝트를 하며 어떤 반짝이는 아이디어를 제시했는지, 팀원의 창의력을 평가해주세요.</p>
			</li>
			<li>
				<p class="expire_img"><img src="/resources/images/icon_expire05.png" alt="전문성"/></p>
				<p class="expire_txt"><strong>전문성</strong>개인의 능력을 평가하여 팀원이 얼마나 많은 역량을 가지고 있는 지를 평가해주세요.</p>
			</li>
		</ul>
	</div>
</div>
<div class="mypage_wrap">
	<div class="sectionWrap">
		<div class="mypage_myteam">
			<ul class="mypage_myteam_closed mypage_expire">
				<li>
					<h3>팀 정보</h3>
					<p class="myTeam_pic"><img src="/resources/images/team_sample.png" alt="팀 대표사진"/></p>
					<div class="myTeam_txt">
						<strong class="myTeam_name">뉴스타터 팀</strong>
						<p class="myTeam_title">비행청소년 교육 멘토링 공모전</p>
						<div class="myTeam_detail">
							<p><i><img src="/resources/images/icon_social01_active.png" alt="카테고리 아이콘"/></i><span>기획/마케팅</span><strong>3명</strong><b>2019.03.23~2019.05.21</b></p>
						</div>
					</div>
				</li>
				<li>
					<h3>평가할 팀원 선택</h3>
					<div class="swiper-container expire_teammates_swiper">
						<div class="swiper-wrapper">
							<div class="swiper-slide expire_teammates expire_teammmate01">
								<a href="#none" title="평가할 팀원 선택">
									<p class="expire_teammates_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
									<p class="expire_teammates_txt"><strong>도널드</strong><span>진행상태 0%</span></p>
								</a>
							</div>
							<div class="swiper-slide expire_teammates expire_teammmate02">
								<a href="#none" title="평가할 팀원 선택">
									<p class="expire_teammates_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
									<p class="expire_teammates_txt"><strong>트럼프</strong><span>진행상태 0%</span></p>
								</a>
							</div>
							<div class="swiper-slide expire_teammates expire_teammmate02">
								<a href="#none" title="평가할 팀원 선택">
									<p class="expire_teammates_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
									<p class="expire_teammates_txt"><strong>트럼프</strong><span>진행상태 0%</span></p>
								</a>
							</div>
							<div class="swiper-slide expire_teammates expire_teammmate02">
								<a href="#none" title="평가할 팀원 선택">
									<p class="expire_teammates_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
									<p class="expire_teammates_txt"><strong>트럼프</strong><span>진행상태 0%</span></p>
								</a>
							</div>
							<div class="swiper-slide expire_teammates expire_teammmate02">
								<a href="#none" title="평가할 팀원 선택">
									<p class="expire_teammates_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
									<p class="expire_teammates_txt"><strong>트럼프</strong><span>진행상태 0%</span></p>
								</a>
							</div>
							<div class="swiper-slide expire_teammates expire_teammmate02">
								<a href="#none" title="평가할 팀원 선택">
									<p class="expire_teammates_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
									<p class="expire_teammates_txt"><strong>트럼프</strong><span>진행상태 0%</span></p>
								</a>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<div class="mypage_expireScore">
			<div class="mypage_expireScorepanel expire_scorepanel01 swiper-container">
				<ul class="swiper-wrapper">
					<li class="swiper-slide">
						<h3>자신이 맡은 일에 대해서 얼마나 성실하게 수행 했는지를 평가해주세요.</h3>
						<div class="expire_scoreProfile">
							<p class="expire_scoreProfile_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
							<p class="expire_scoreProfile_txt"><b>도널드</b>님에 대한 평가 (<strong>1</strong>/5)</p>
						</div>
						<div class="expire_scoreRating">
							<p class="expire_scoreRating_img"><img src="/resources/images/icon_expire01.png" alt="역할성실도"/></p>
							<p class="expire_scoreRating_txt">
								<strong>역할성실도</strong>
								<span><input type="text" class="expire_scoreInput_scoreA1" value="0"/><label for="expire_scoreInput_scoreA1"></label></span>
								<i><img src="/resources/images/expire_score50.png" alt="별점"/></i>
							</p>
						</div>
						<div class="expire_scoreComment">
							<p>도널드님의 역할성실도는 어땠나요?</p>
							<p class="member_infoContent"><textarea></textarea></p>
						</div>
					</li>
					<li class="swiper-slide">
						<h3>회의 시간 및 모임시간 등의 시간약속을 얼마나 잘 이행했는지 평가해주세요.</h3>
						<div class="expire_scoreProfile">
							<p class="expire_scoreProfile_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
							<p class="expire_scoreProfile_txt"><b>도널드</b>님에 대한 평가 (<strong>2</strong>/5)</p>
						</div>
						<div class="expire_scoreRating">
							<p class="expire_scoreRating_img"><img src="/resources/images/icon_expire02.png" alt="시간약속"/></p>
							<p class="expire_scoreRating_txt">
								<strong>시간약속</strong>
								<span><input type="text" class="expire_scoreInput_scoreA2" value="0"/><label for="expire_scoreInput_scoreA2"></label></span>
								<i><img src="/resources/images/expire_score40.png" alt="별점"/></i>
							</p>
						</div>
						<div class="expire_scoreComment">
							<p>도널드님의 시간약속은 어땠나요?</p>
							<p class="member_infoContent"><textarea></textarea></p>
						</div>
					</li>
					<li class="swiper-slide">
						<h3>프로젝트를 진행하며, 상호간의 예의와 매너를 얼마나 잘 지켰는지를 평가해주세요.</h3>
						<div class="expire_scoreProfile">
							<p class="expire_scoreProfile_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
							<p class="expire_scoreProfile_txt"><b>도널드</b>님에 대한 평가 (<strong>3</strong>/5)</p>
						</div>
						<div class="expire_scoreRating">
							<p class="expire_scoreRating_img"><img src="/resources/images/icon_expire03.png" alt="배려심"/></p>
							<p class="expire_scoreRating_txt">
								<strong>배려심</strong>
								<span><input type="text" class="expire_scoreInput_scoreA3" value="0"/><label for="expire_scoreInput_scoreA3"></label></span>
								<i><img src="/resources/images/expire_score25.png" alt="별점"/></i>
							</p>
						</div>
						<div class="expire_scoreComment">
							<p>도널드님의 배려심은 어땠나요?</p>
							<p class="member_infoContent"><textarea></textarea></p>
						</div>
					</li>
					<li class="swiper-slide">
						<h3>프로젝트를 하며 어떤 반짝이는 아이디어를 제시했는지, 팀원의 창의력을 평가해주세요.</h3>
						<div class="expire_scoreProfile">
							<p class="expire_scoreProfile_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
							<p class="expire_scoreProfile_txt"><b>도널드</b>님에 대한 평가 (<strong>4</strong>/5)</p>
						</div>
						<div class="expire_scoreRating">
							<p class="expire_scoreRating_img"><img src="/resources/images/icon_expire04.png" alt="창의력"/></p>
							<p class="expire_scoreRating_txt">
								<strong>창의력</strong>
								<span><input type="text" class="expire_scoreInput_scoreA4" value="0"/><label for="expire_scoreInput_scoreA4"></label></span>
								<i><img src="/resources/images/expire_score45.png" alt="별점"/></i>
							</p>
						</div>
						<div class="expire_scoreComment">
							<p>도널드님의 창의력은 어땠나요?</p>
							<p class="member_infoContent"><textarea></textarea></p>
						</div>
					</li>
					<li class="swiper-slide">
						<h3>개인의 능력을 평가하여 팀원이 얼마나 많은 역량을 가지고 있는 지를 평가해주세요.</h3>
						<div class="expire_scoreProfile">
							<p class="expire_scoreProfile_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
							<p class="expire_scoreProfile_txt"><b>도널드</b>님에 대한 평가 (<strong>5</strong>/5)</p>
						</div>
						<div class="expire_scoreRating">
							<p class="expire_scoreRating_img"><img src="/resources/images/icon_expire05.png" alt="전문성"/></p>
							<p class="expire_scoreRating_txt">
								<strong>전문성</strong>
								<span><input type="text" class="expire_scoreInput_scoreA5" value="0"/><label for="expire_scoreInput_scoreA5"></label></span>
								<i><img src="/resources/images/expire_score20.png" alt="별점"/></i>
							</p>
						</div>
						<div class="expire_scoreComment">
							<p>도널드님의 전문성은 어땠나요?</p>
							<p class="member_infoContent"><textarea></textarea></p>
						</div>
					</li>
				</ul>
				<!-- Add Arrows -->
				<div class="myteam_expire_movePrev swiper-button-prev">이전</div>
				<div class="myteam_expire_moveNext swiper-button-next">다음</div>
			</div>
			<div class="mypage_expireScorepanel expire_scorepanel02 swiper-container">
				<ul class="swiper-wrapper">
					<li class="swiper-slide">
						<h3>자신이 맡은 일에 대해서 얼마나 성실하게 수행 했는지를 평가해주세요.</h3>
						<div class="expire_scoreProfile">
							<p class="expire_scoreProfile_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
							<p class="expire_scoreProfile_txt"><b>트럼프</b>님에 대한 평가 (<strong>1</strong>/5)</p>
						</div>
						<div class="expire_scoreRating">
							<p class="expire_scoreRating_img"><img src="/resources/images/icon_expire01.png" alt="역할성실도"/></p>
							<p class="expire_scoreRating_txt">
								<strong>역할성실도</strong>
								<span><input type="text" class="expire_scoreInput_scoreB1" value="0"/><label for="expire_scoreInput_scoreB1"></label></span>
								<i><img src="/resources/images/expire_score50.png" alt="별점"/></i>
							</p>
						</div>
						<div class="expire_scoreComment">
							<p>트럼프님의 역할성실도는 어땠나요?</p>
							<p class="member_infoContent"><textarea></textarea></p>
						</div>
					</li>
					<li class="swiper-slide">
						<h3>회의 시간 및 모임시간 등의 시간약속을 얼마나 잘 이행했는지 평가해주세요.</h3>
						<div class="expire_scoreProfile">
							<p class="expire_scoreProfile_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
							<p class="expire_scoreProfile_txt"><b>트럼프</b>님에 대한 평가 (<strong>2</strong>/5)</p>
						</div>
						<div class="expire_scoreRating">
							<p class="expire_scoreRating_img"><img src="/resources/images/icon_expire02.png" alt="시간약속"/></p>
							<p class="expire_scoreRating_txt">
								<strong>시간약속</strong>
								<span><input type="text" class="expire_scoreInput_scoreB2" value="0"/><label for="expire_scoreInput_scoreB2"></label></span>
								<i><img src="/resources/images/expire_score40.png" alt="별점"/></i>
							</p>
						</div>
						<div class="expire_scoreComment">
							<p>트럼프님의 시간약속은 어땠나요?</p>
							<p class="member_infoContent"><textarea></textarea></p>
						</div>
					</li>
					<li class="swiper-slide">
						<h3>프로젝트를 진행하며, 상호간의 예의와 매너를 얼마나 잘 지켰는지를 평가해주세요.</h3>
						<div class="expire_scoreProfile">
							<p class="expire_scoreProfile_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
							<p class="expire_scoreProfile_txt"><b>트럼프</b>님에 대한 평가 (<strong>3</strong>/5)</p>
						</div>
						<div class="expire_scoreRating">
							<p class="expire_scoreRating_img"><img src="/resources/images/icon_expire03.png" alt="배려심"/></p>
							<p class="expire_scoreRating_txt">
								<strong>배려심</strong>
								<span><input type="text" class="expire_scoreInput_scoreB3" value="0"/><label for="expire_scoreInput_scoreB3"></label></span>
								<i><img src="/resources/images/expire_score25.png" alt="별점"/></i>
							</p>
						</div>
						<div class="expire_scoreComment">
							<p>트럼프님의 배려심은 어땠나요?</p>
							<p class="member_infoContent"><textarea></textarea></p>
						</div>
					</li>
					<li class="swiper-slide">
						<h3>프로젝트를 하며 어떤 반짝이는 아이디어를 제시했는지, 팀원의 창의력을 평가해주세요.</h3>
						<div class="expire_scoreProfile">
							<p class="expire_scoreProfile_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
							<p class="expire_scoreProfile_txt"><b>트럼프</b>님에 대한 평가 (<strong>4</strong>/5)</p>
						</div>
						<div class="expire_scoreRating">
							<p class="expire_scoreRating_img"><img src="/resources/images/icon_expire04.png" alt="창의력"/></p>
							<p class="expire_scoreRating_txt">
								<strong>창의력</strong>
								<span><input type="text" class="expire_scoreInput_scoreB4" value="0"/><label for="expire_scoreInput_scoreB4"></label></span>
								<i><img src="/resources/images/expire_score45.png" alt="별점"/></i>
							</p>
						</div>
						<div class="expire_scoreComment">
							<p>트럼프님의 창의력은 어땠나요?</p>
							<p class="member_infoContent"><textarea></textarea></p>
						</div>
					</li>
					<li class="swiper-slide">
						<h3>개인의 능력을 평가하여 팀원이 얼마나 많은 역량을 가지고 있는 지를 평가해주세요.</h3>
						<div class="expire_scoreProfile">
							<p class="expire_scoreProfile_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
							<p class="expire_scoreProfile_txt"><b>트럼프</b>님에 대한 평가 (<strong>5</strong>/5)</p>
						</div>
						<div class="expire_scoreRating">
							<p class="expire_scoreRating_img"><img src="/resources/images/icon_expire05.png" alt="전문성"/></p>
							<p class="expire_scoreRating_txt">
								<strong>전문성</strong>
								<span><input type="text" class="expire_scoreInput_scoreB5" value="0"/><label for="expire_scoreInput_scoreB5"></label></span>
								<i><img src="/resources/images/expire_score20.png" alt="별점"/></i>
							</p>
						</div>
						<div class="expire_scoreComment">
							<p>트럼프님의 전문성은 어땠나요?</p>
							<p class="member_infoContent"><textarea></textarea></p>
						</div>
					</li>
				</ul>
				<!-- Add Arrows -->
				<div class="myteam_expire_movePrev swiper-button-prev">이전</div>
				<div class="myteam_expire_moveNext swiper-button-next">다음</div>
			</div>
			<div class="mypage_expireSubmit team_submitWrap">
				<button class="btn_grn btn_team_common btn_team_expire_submit">평가 제출</button>
			</div>
		</div>
	</div>
</div>
<div class="m_footerDummy"></div>
<div id="modal_expire">
	<p class="modal_expire_desc">
		<span>
			한번 작성한 평가는 수정/삭제할 수 없습니다.
			해당 평가를 제출하시겠습니까?
		</span>
	</p>
	<p class="modal_submit_button">
		<a class="fn_modalSubmitCancel" href="#none" title="취소">취소</a>
		<a class="fn_modalExpireSubmit" href="#none" title="제출">제출</a>
	</p>
</div>
<script>
	$(document).ready(function(){
		//swiper init
		var swiper1 = new Swiper('.expire_scorepanel01', {
			loop : false,
			navigation: {
				nextEl: '.myteam_expire_moveNext',
				prevEl: '.myteam_expire_movePrev',
			},
		});
		
		//swiper init
		var swiper2 = new Swiper('.expire_scorepanel02', {
			loop : false,
			navigation: {
				nextEl: '.myteam_expire_moveNext',
				prevEl: '.myteam_expire_movePrev',
			},
		});
		
		//swiper init
		var swiperSub = new Swiper('.expire_teammates_swiper', {
			slidesPerView: 5
		});
		
		/* 모달팝업_상호평가 */
		$("#modal_expire").hide(0);
		$(".btn_team_expire_submit").click(function(){
			$("#screenCover").show(0);
			$("#modal_expire").show(0);
			$(".fn_modalSubmitCancel").click(function(){
				$("#modal_expire").hide(0);
				$("#screenCover").hide(0);
			});
			$(".fn_modalExpireSubmit").click(function(){
				alert("평가가 완료되었습니다.");
				window.location.href="/front/mypage/myteam_expire";
			});
		});
		//상호평가 점수판
		$(".expire_teammates").click(function(){
			$(".expire_teammates").removeClass("expire_teammates_active");
			$(this).addClass("expire_teammates_active");
		});
		$(".mypage_expireScorepanel").css("height", "0.1px");
		$(".mypage_expireSubmit").css("height", "0.1px");
		$(".expire_teammmate01").click(function(){
			$(".mypage_expireScorepanel").css("height", "0.1px");
			$(".expire_scorepanel01").css("height", "620px");
			$(".mypage_expireSubmit").css("height", "120px");
		});
		$(".expire_teammmate02").click(function(){
			$(".mypage_expireScorepanel").css("height", "0.1px");
			$(".expire_scorepanel02").css("height", "620px");
			$(".mypage_expireSubmit").css("height", "120px");
		});
		
		
		//점수 매기기 spinner
		$(".expire_scoreInput_scoreA1").spinner({step: 0.5, min: 0, max: 5, numberFormat: "n"});
		$(".expire_scoreInput_scoreA2").spinner({step: 0.5, min: 0, max: 5, numberFormat: "n"});
		$(".expire_scoreInput_scoreA3").spinner({step: 0.5, min: 0, max: 5, numberFormat: "n"});
		$(".expire_scoreInput_scoreA4").spinner({step: 0.5, min: 0, max: 5, numberFormat: "n"});
		$(".expire_scoreInput_scoreA5").spinner({step: 0.5, min: 0, max: 5, numberFormat: "n"});
		$(".expire_scoreInput_scoreB1").spinner({step: 0.5, min: 0, max: 5, numberFormat: "n"});
		$(".expire_scoreInput_scoreB2").spinner({step: 0.5, min: 0, max: 5, numberFormat: "n"});
		$(".expire_scoreInput_scoreB3").spinner({step: 0.5, min: 0, max: 5, numberFormat: "n"});
		$(".expire_scoreInput_scoreB4").spinner({step: 0.5, min: 0, max: 5, numberFormat: "n"});
		$(".expire_scoreInput_scoreB5").spinner({step: 0.5, min: 0, max: 5, numberFormat: "n"});
	});
</script>