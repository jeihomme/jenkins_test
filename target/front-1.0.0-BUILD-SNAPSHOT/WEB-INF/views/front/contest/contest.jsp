<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<h2 class="hideHeading">컨텐츠</h2>
<div class="sub_common">
	<div class="sectionWrap">
		<div class="sub_common_left">
			<div class="sub_box sub_common_title sub_common_title_m">
				<h3>제6회 산업통상부 마케팅 아이디어 공모전</h3>
				<p class="social_by">by 산업통상자원부</p>
				<ul>
					<li><i><img src="/resources/images/icon_contest_dday.png" alt="D-Day"/></i>D-30</li>
					<li><i><img src="/resources/images/icon_contest_prize.png" alt="300만원"/></i>300만원</li>
					<li><i><img src="/resources/images/icon_contest01.png" alt="기획/마케팅"/></i>기획/마케팅</li>
					<li><i><img src="/resources/images/icon_team_member01.png" alt="대학생"/></i>대학생</li>
				</ul>
				<p class="sub_common_report"><a href="#none" title="신고하기" onclick="fn_contestReport();"><i class="fas fa-exclamation-triangle"></i>신고하기</a></p>
			</div>
			<p class="sub_share sub_share_m">
				<a href="#none" onclick="fn_contest_share();" title="공유하기"><i class="far fa-share-alt"></i>공유하기</a>
				<a href="#none" onclick="fn_contest_favourite();" title="찜하기"><i class="fal fa-heart"></i>찜하기</a>
				<a href="#none" onclick="fn_contest_toContestSite();" title="공모전사이트"><i class="fal fa-globe"></i>사이트</a>
				<a class="fn_contestPosterPopup" href="#none" title="공모전포스터"><i class="far fa-image"></i>포스터</a>
			</p>
			<div id="social_content" class="sub_box contest_content">
				<div class="sub_titleImg">
					<img src="/resources/images/sub_contest_sample01.png" alt="공모전 이미지"/>
				</div>
				<ul class="mypage_notice_category">
					<li class="mypage_notice_active"><a href="#social_content" title="공고문">공고문</a></li>
					<li><a href="#sub_contest_teams" title="팀원모집">팀원모집</a></li>
					<li><a href="#sub_contest_recommend" title="추천공모전">추천공모전</a></li>
				</ul>
				<ul class="mypage_notice_category_scroll">
					<li class="mypage_notice_scroll_active"><a href="#social_content" title="공고문">공고문</a></li>
					<li><a href="#sub_contest_teams" title="팀원모집">팀원모집</a></li>
					<li><a href="#sub_contest_recommend" title="추천공모전">추천공모전</a></li>
				</ul>
				<h3>공모주제</h3>
				<p class="sub_box_txt">산업통상부의 역할을 일반국민에게 알리는 마케팅 공모전</p>
				<h3>문제사항 및 취지</h3>
				<p class="sub_box_txt">현 시점에서 대한민국의 국민이 산업통상부의 역할에 대한 인식 정도가 낮다. 다양한 대학생들의 아이디어를 통해 산업통상부의 역할을 알릴 수 있는 좋은 아이디어를 모집한다.</p>
				<h3>참여대상</h3>
				<p class="sub_box_txt">대학생</p>
				<h3>접수부문</h3>
				<p class="sub_box_txt">아이디어 제안, 콘텐츠 제작</p>
				<h3>전체일정</h3>
				<ul id="myteam_schedule" class="sub_contest_calendar_list">
					<li class="sche_blank"><i></i><strong>3/21</strong><span>접수 시작</span></li>
					<li class="sche_blank"><i></i><strong>4/21</strong><span>접수 마감</span></li>
					<li class="sche_blank"><i></i><strong>4/31</strong><span>평가 및 심사</span></li>
					<li class="sche_blank"><i></i><strong>5/3</strong><span>결과 발표</span></li>
				</ul>
			</div>
			<div id="sub_contest_teams" class="sub_box sub_contest_teams">
				<h3 class="sub_contest_teams_title">팀원 모집</h3>
				<div class="swiper-container sub_contest_teams_listWrap">
					<ul class="swiper-wrapper sub_contest_teams_list">
						<li class="swiper-slide">
							<a href="/front/contest/team" title="공모전 뉴스타터 상세보기">
								<p class="main_recruit_img"><img src="/resources/images/recruit_img01.png" alt="공모전 이미지"/></p>
								<div class="main_recruit_txt">
									<strong>서울권 공모전 팀원구함</strong>
									<span>제 4회 아름드리 웹드라마 UCC공모전</span>
									<p class="main_recruit_txt_detail">
										<span>by 공모킬러팀</span>
										<b><i class="fas fa-map-marker-alt"></i>홍대역 인근</b>
										<strong>D-5</strong>
									</p>
								</div>
							</a>
						</li>
						<li class="swiper-slide">
							<a href="/front/contest/team" title="공모전 뉴스타터 상세보기">
								<p class="main_recruit_img"><img src="/resources/images/recruit_img02.png" alt="공모전 이미지"/></p>
								<div class="main_recruit_txt">
									<strong>서울권 공모전 팀원구함</strong>
									<span>제 4회 아름드리 웹드라마 UCC공모전</span>
									<p class="main_recruit_txt_detail">
										<span>by 공모킬러팀</span>
										<b><i class="fas fa-map-marker-alt"></i>홍대역 인근</b>
										<strong>D-5</strong>
									</p>
								</div>
							</a>
						</li>
						<li class="swiper-slide">
							<a href="/front/contest/team" title="공모전 뉴스타터 상세보기">
								<p class="main_recruit_img"><img src="/resources/images/recruit_img01.png" alt="공모전 이미지"/></p>
								<div class="main_recruit_txt">
									<strong>서울권 공모전 팀원구함</strong>
									<span>제 4회 아름드리 웹드라마 UCC공모전</span>
									<p class="main_recruit_txt_detail">
										<span>by 공모킬러팀</span>
										<b><i class="fas fa-map-marker-alt"></i>홍대역 인근</b>
										<strong>D-5</strong>
									</p>
								</div>
							</a>
						</li>
						<li class="swiper-slide">
							<a href="/front/contest/team" title="공모전 뉴스타터 상세보기">
								<p class="main_recruit_img"><img src="/resources/images/recruit_img02.png" alt="공모전 이미지"/></p>
								<div class="main_recruit_txt">
									<strong>서울권 공모전 팀원구함</strong>
									<span>제 4회 아름드리 웹드라마 UCC공모전</span>
									<p class="main_recruit_txt_detail">
										<span>by 공모킬러팀</span>
										<b><i class="fas fa-map-marker-alt"></i>홍대역 인근</b>
										<strong>D-5</strong>
									</p>
								</div>
							</a>
						</li>
					</ul>
					<!-- Add Arrows -->
					<div class="contest_team_move_left swiper-button-prev"></div>
					<div class="contest_team_move_right swiper-button-next"></div>
				</div>
			</div>
			<div id="sub_contest_recommend" class="sub_box sub_contest_recommend">
				<h3>추천 공모전</h3>
				<ul class="recruit_on_listWrap">
					<li>
						<a href="/front/contest/contest" title="추천 공모전 상세보기">
							<p class="main_recruit_img"><img src="/resources/images/recruit_img01.png" alt="공모전 이미지"/></p>
							<div class="main_recruit_txt">
								<span>제 6회 산업통상부 마케팅 아이디어 공모전</span>
								<p class="main_recruit_txt_detail">
									<em>기획/마케팅</em>
									<i>by 공모킬러팀</i>
									<b>500만원</b>
									<strong>D-5</strong>
								</p>
							</div>
						</a>
					</li>
					<li>
						<a href="/front/contest/contest" title="추천 공모전 상세보기">
							<p class="main_recruit_img"><img src="/resources/images/recruit_img01.png" alt="공모전 이미지"/></p>
							<div class="main_recruit_txt">
								<span>제 6회 산업통상부 마케팅 아이디어 공모전</span>
								<p class="main_recruit_txt_detail">
									<em>기획/마케팅</em>
									<i>by 공모킬러팀</i>
									<b>500만원</b>
									<strong>D-5</strong>
								</p>
							</div>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="sub_common_right contest_right">
			<div class="sub_box sub_common_title">
				<h3>제6회 산업통상부 마케팅 아이디어 공모전</h3>
				<p class="social_by">BY 산업통상자원부</p>
				<ul>
					<li><i><img src="/resources/images/icon_contest_dday.png" alt="D-Day"/></i>D-30</li>
					<li><i><img src="/resources/images/icon_contest_prize.png" alt="300만원"/></i>300만원</li>
					<li><i><img src="/resources/images/icon_contest01.png" alt="기획/마케팅"/></i>기획/마케팅</li>
					<li><i><img src="/resources/images/icon_team_member01.png" alt="대학생"/></i>대학생</li>
				</ul>
				<p class="sub_common_report"><a href="#none" title="신고하기" onclick="fn_contestReport();"><i class="fas fa-exclamation-triangle"></i>신고하기</a></p>
			</div>
			<p class="sub_share">
				<a href="#none" onclick="fn_contest_share();" title="공유하기"><i class="far fa-share-alt"></i>공유하기</a>
				<a href="#none" onclick="fn_contest_favourite();" title="찜하기"><i class="fal fa-heart"></i>찜하기</a>
				<a href="#none" onclick="fn_contest_toContestSite();" title="공모전사이트"><i class="fal fa-globe"></i>사이트</a>
				<a class="fn_contestPosterPopup" href="#none" title="공모전포스터"><i class="far fa-image"></i>포스터</a>
			</p>
			<div class="sub_box sub_common_teams">
				<h3><strong>도전에 참여 중인 뉴-스타터</strong> (6명)</h3>
				<div class="swiper-container sub_common_teams_swiper">
					<ul class="swiper-wrapper">
						<li class="swiper-slide">
							<a href="/front/mypage/profile_other" title="사용자 프로필 보기">
								<p class="sub_common_teams_img"><img src="/resources/images/profile_picture.png" alt="사용자 프로필 보기 "/></p>
								<p class="sub_common_teams_txt"><strong>도널드</strong></p>
							</a>
						</li>
						<li class="swiper-slide">
							<a href="/front/mypage/profile_other" title="사용자 프로필 보기">
								<p class="sub_common_teams_img"><img src="/resources/images/profile_picture.png" alt="사용자 프로필 보기 "/></p>
								<p class="sub_common_teams_txt"><strong>도널드</strong></p>
							</a>
						</li>
						<li class="swiper-slide">
							<a href="/front/mypage/profile_other" title="사용자 프로필 보기">
								<p class="sub_common_teams_img"><img src="/resources/images/profile_picture.png" alt="사용자 프로필 보기 "/></p>
								<p class="sub_common_teams_txt"><strong>도널드</strong></p>
							</a>
						</li>
						<li class="swiper-slide">
							<a href="/front/mypage/profile_other" title="사용자 프로필 보기">
								<p class="sub_common_teams_img"><img src="/resources/images/profile_picture.png" alt="사용자 프로필 보기 "/></p>
								<p class="sub_common_teams_txt"><strong>도널드</strong></p>
							</a>
						</li>
						<li class="swiper-slide">
							<a href="/front/mypage/profile_other" title="사용자 프로필 보기">
								<p class="sub_common_teams_img"><img src="/resources/images/profile_picture.png" alt="사용자 프로필 보기 "/></p>
								<p class="sub_common_teams_txt"><strong>도널드</strong></p>
							</a>
						</li>
						<li class="swiper-slide">
							<a href="/front/mypage/profile_other" title="사용자 프로필 보기">
								<p class="sub_common_teams_img"><img src="/resources/images/profile_picture.png" alt="사용자 프로필 보기 "/></p>
								<p class="sub_common_teams_txt"><strong>도널드</strong></p>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="sub_box sub_common_apply">
				<h3>이번 공모전에 도전해보세요!<br/><span class="apply_subtitle">한번의 도전이 당신을 바꾸고, 당신은 세상을 바꾸게 될 것입니다.</span></h3>
				<p class="sub_box_button"><button class="btn_grn btn_team_common" onclick="fn_toTeamContest();">도전하기</button></p>
			</div>
			<p class="sub_box_button">
				<button class="btn_blk btn_team_common" onclick="fn_toContest();">공모전 메인 바로가기</button>
			</p>
		</div>
	</div>
</div>
<div class="m_footerDummy"></div>
<div id="modal_contestReport" class="modal_team_view">
	<p class="modal_guide_banner_close"><a href="#none" title="닫기"><img src="/resources/images/info_guide_close.png" alt="닫기"/></a></p>
	<div class="modal_team_viewWrap">
		<h3>신고하기</h3>
		<div class="modal_team_viewContents">
			<p><textarea placeholder="신고 사유를 입력해주세요."></textarea></p>
		</div>
		<p class="modal_submit_button">
			<a class="fn_modalSubmitCancel" href="#none" title="취소">취소</a>
			<a class="fn_contestReportSubmit" href="#none" title="확인">확인</a>
		</p>
	</div>
</div>
<div id="modal_contestPoster" class="modal_team_view">
	<p class="modal_guide_banner_close"><a href="#none" title="닫기"><img src="/resources/images/info_guide_close.png" alt="닫기"/></a></p>
	<div class="modal_team_viewWrap">
		<h3>공모전 포스터 확인</h3>
		<div class="modal_team_viewContents modal_posterContents">
			<div class="modal_profileAward_imgWrap">
				<img src="/resources/images/sub_contest_sample01.png" alt="공모전 이미지"/>
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
		//swiper init
		var swiperSub = new Swiper('.sub_contest_teams_listWrap', {
			slidesPerView: 2,
			navigation: {
				nextEl: '.contest_team_move_right',
				prevEl: '.contest_team_move_left',
			},
			breakpoints: {
				// when window width is <= 480px
			    480: {
			      slidesPerView: 1
			    }
			}
		});
		
		//swiper init
		var swiperSub = new Swiper('.sub_common_teams_swiper', {
			slidesPerView: 5
		});
		
		//상단 고정바 리사이즈
		$(window).resize(function(){
			var cateWidth = $(".contest_content .mypage_notice_category").width();
			var offset = $(".contest_content .mypage_notice_category").offset();
			$(".mypage_notice_category_scroll").css("width", ""+cateWidth+"px");
		}).resize();
		
		//스크롤 기능
		$(window).scroll(function(){
			var scrollPos = $(document).scrollTop();
			var offset = $(".contest_content .mypage_notice_category").offset();
			//console.log(scrollPos);
			if( scrollPos > 700 ){
				$(".mypage_notice_category_scroll").css({"left":""+ offset.left +"px", "opacity":"1"});
			}
			else{
				$(".mypage_notice_category_scroll").css("left", "-9999px");
			}
		});
		
		$(".fn_contestPosterPopup").click(function(){
			$("#screenCover").show(0);
			$("#modal_contestPoster").show(0);
			
			$(".fn_modalSubmitCancel").click(function(){
				$("#modal_contestPoster").hide(0);
				$("#screenCover").hide(0);
			});
		});
	});
	
	//신고하기 버튼
	function fn_contestReport(){
		$("#screenCover").show(0);
		$("#modal_contestReport").show(0);
		
		$(".fn_modalSubmitCancel").click(function(){
			$("#modal_contestReport").hide(0);
			$("#screenCover").hide(0);
		});
		
		$(".fn_contestReportSubmit").click(function(){
			if( confirm("신고 사유를 등록하시겠습니까?") ){
				alert("신고가 등록되었습니다.");
				$("#modal_contestReport").hide(0);
				$("#screenCover").hide(0);
				return false;
			}
			else{
				return false;
			}
		});
	}
</script>