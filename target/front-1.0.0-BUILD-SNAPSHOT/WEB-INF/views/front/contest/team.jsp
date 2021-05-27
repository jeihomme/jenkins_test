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
				<h3>서울권 공모전 팀원구함</h3>
				<h4>제6회 산업통상부 마케팅 아이디어 공모전</h4>
				<p class="social_by">BY 공모킬러팀</p>
				<ul class="sub_team_list_m">
					<li><i class="fas fa-map-marker-alt"></i>서울 전역</li>
					<li><i><img src="/resources/images/icon_contest01.png" alt="기획/마케팅"/></i>기획/마케팅</li>
				</ul>
				<p class="social_dday">오늘마감</p>
				<p class="sub_common_report"><a href="#none" title="신고하기" onclick="fn_contestReport();"><i class="fas fa-exclamation-triangle"></i>신고하기</a></p>
			</div>
			<p class="sub_share sub_share_m"><a onclick="fn_contest_share();" href="#none" title="공유하기"><i class="far fa-share-alt"></i>공유하기</a></p>
			<div id="social_content" class="sub_box social_content">
				<div class="sub_titleImg">
					<img src="/resources/images/sub_contest_sample.png" alt="사회문제 이미지"/>
				</div>
				<ul class="mypage_notice_category">
					<li class="mypage_notice_active"><a href="#social_content" title="공고문">공고문</a></li>
					<li><a href="#sub_common_qna" title="QNA">Q&amp;A</a></li>
				</ul>
				<ul class="mypage_notice_category_scroll">
					<li class="mypage_notice_scroll_active"><a href="#social_content" title="공고문">공고문</a></li>
					<li><a href="#sub_common_qna" title="QNA">Q&amp;A</a></li>
				</ul>
				<ul class="sub_box_list">
					<li>
						<i><img src="/resources/images/job_02_over.png" alt="대학생"/></i>
						<p>대학생</p>
					</li>
					<li>
						<i><img src="/resources/images/job_03_over.png" alt="대학원생"/></i>
						<p>대학원생</p>
					</li>
					<li>
						<i><img src="/resources/images/job_04_over.png" alt="일반성인"/></i>
						<p>일반성인</p>
					</li>
				</ul>
			</div>
			<div id="sub_common_qna" class="sub_box sub_common_qna">
				<h3><strong>Q&amp;A</strong> 공모킬러팀에게 질문하기</h3>
				<ul class="sub_common_qna_list">
					<li>
						<h4>
							<a href="#none" title="QnA">
								<strong><img src="/resources/images/sub_content_q.png" alt="Q"/></strong>
								<span>모임 시간은 어떻게 되나요?모임 시간은 어떻게 되나요?모임 시간은 어떻게 되나요?모임 시간은 어떻게 되나요?모임 시간은 어떻게 되나요?모임 시간은 어떻게 되나요?모임 시간은 어떻게 되나요?</span>
								<i class="fas fa-chevron-down"></i>
								<b><button class="btn_team_common btn_lightblue">수정</button><button class="btn_team_common btn_lightblue">삭제</button></b>
							</a>
						</h4>
						<p class="sub_common_qna_a">
							<strong><img src="/resources/images/sub_content_a.png" alt="A"/></strong><span>답변 내용이 들어갑니다. 답변 내용이 들어갑니다.</span>
						</p>
					</li>
					<li>
						<h4>
							<a href="#none" title="QnA">
								<strong><img src="/resources/images/sub_content_q.png" alt="Q"/></strong>
								<span>모임 시간은 어떻게 되나요?</span>
								<i class="fas fa-chevron-down"></i>
								<b><button class="btn_team_common btn_lightblue">수정</button><button class="btn_team_common btn_lightblue">삭제</button></b>
							</a>
						</h4>
						<p class="sub_common_qna_a">
							<strong><img src="/resources/images/sub_content_a.png" alt="A"/></strong><span>답변 내용이 들어갑니다. 답변 내용이 들어갑니다.</span>
						</p>
					</li>
					<li>
						<h4>
							<a href="#none" title="QnA">
								<strong><img src="/resources/images/sub_content_q.png" alt="Q"/></strong>
								<span>모임 시간은 어떻게 되나요?</span>
								<i class="fas fa-chevron-down"></i>
								<b><button class="btn_team_common btn_lightblue">수정</button><button class="btn_team_common btn_lightblue">삭제</button></b>
							</a>
						</h4>
						<p class="sub_common_qna_a">
							<strong><img src="/resources/images/sub_content_a.png" alt="A"/></strong><span>답변 내용이 들어갑니다. 답변 내용이 들어갑니다.</span>
						</p>
					</li>
					<li>
						<h4>
							<a href="#none" title="QnA">
								<strong><img src="/resources/images/sub_content_q.png" alt="Q"/></strong>
								<span>모임 시간은 어떻게 되나요?</span>
								<i class="fas fa-chevron-down"></i>
								<b><button class="btn_team_common btn_lightblue">수정</button><button class="btn_team_common btn_lightblue">삭제</button></b>
							</a>
						</h4>
						<p class="sub_common_qna_a">
							<strong><img src="/resources/images/sub_content_a.png" alt="A"/></strong><span>답변 내용이 들어갑니다. 답변 내용이 들어갑니다.</span>
						</p>
					</li>
				</ul>
				<p class="sub_box_button"><button class="btn_grn btn_team_common btn_team_leaveQuestion">질문하기</button></p>
			</div>
		</div>
		<div class="sub_common_right">
			<div class="sub_box sub_common_title">
				<h3>서울권 공모전 팀원구함</h3>
				<h4>제6회 산업통상부 마케팅 아이디어 공모전</h4>
				<p class="social_by">BY 공모킬러팀</p>
				<ul>
					<li><i class="fas fa-map-marker-alt"></i>서울 전역</li>
					<li><i><img src="/resources/images/icon_contest01.png" alt="기획/마케팅"/></i>기획/마케팅</li>
				</ul>
				<p class="social_dday">오늘마감</p>
				<p class="sub_common_report"><a href="#none" title="신고하기" onclick="fn_contestReport();"><i class="fas fa-exclamation-triangle"></i>신고하기</a></p>
			</div>
			<p class="sub_share"><a onclick="fn_contest_share();" href="#none" title="공유하기"><i class="far fa-share-alt"></i>공유하기</a></p>
			<div class="sub_box sub_common_teams">
				<h3><strong>현재 팀원</strong> (6명)</h3>
				<div class="swiper-container sub_common_teams_swiper">
					<ul class="swiper-wrapper">
						<li class="swiper-slide">
							<a href="/front/mypage/profile_other" title="팀원 프로필 보기">
								<p class="sub_common_teams_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
								<p class="sub_common_teams_txt"><strong>도널드</strong></p>
								<p class="sub_common_teams_leader"><i class="fas fa-crown"></i></p>
							</a>
						</li>
						<li class="swiper-slide">
							<a href="/front/mypage/profile_other" title="팀원 프로필 보기">
								<p class="sub_common_teams_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
								<p class="sub_common_teams_txt"><strong>도널드</strong></p>
							</a>
						</li>
						<li class="swiper-slide">
							<a href="/front/mypage/profile_other" title="팀원 프로필 보기">
								<p class="sub_common_teams_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
								<p class="sub_common_teams_txt"><strong>도널드</strong></p>
							</a>
						</li>
						<li class="swiper-slide">
							<a href="/front/mypage/profile_other" title="팀원 프로필 보기">
								<p class="sub_common_teams_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
								<p class="sub_common_teams_txt"><strong>도널드</strong></p>
							</a>
						</li>
						<li class="swiper-slide">
							<a href="/front/mypage/profile_other" title="팀원 프로필 보기">
								<p class="sub_common_teams_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
								<p class="sub_common_teams_txt"><strong>도널드</strong></p>
							</a>
						</li>
						<li class="swiper-slide">
							<a href="/front/mypage/profile_other" title="팀원 프로필 보기">
								<p class="sub_common_teams_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
								<p class="sub_common_teams_txt"><strong>도널드</strong></p>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="sub_box sub_common_apply">
				<h3>
					해당 팀의 프로젝트에 지원해보세요!<br/>
					<span class="apply_subtitle">팀원이 되어 함께 프로젝트를 수행하실 수 있습니다.</span>
				</h3>
				<p class="sub_social_applicant">현재 지원자 수 : 4명</p>
				<p class="sub_box_button"><button class="btn_grn btn_team_common btn_team_teamapply">팀원 지원하기</button></p>
			</div>
			<p class="sub_box_button">
				<button class="btn_blk btn_team_common" onclick="fn_toContest();">공모전 메인 바로가기</button>
			</p>
		</div>
	</div>
</div>
<div class="m_footerDummy"></div>
<div id="modal_teamApply" class="modal_team_view">
	<p class="modal_guide_banner_close"><a href="#none" title="닫기"><img src="/resources/images/info_guide_close.png" alt="닫기"/></a></p>
	<div class="modal_team_viewWrap">
		<h3>팀원 지원하기</h3>
		<div class="modal_team_viewContents">
			<p><textarea placeholder="자신의 역량을 적어주세요."></textarea></p>
			<p><textarea placeholder="팀에 임하는 마음가짐을 적어주세요."></textarea></p>
			<p style="padding-top: 16px"><input type="text" title="연락처 입력" placeholder="연락 가능한 연락처를 입력해주세요."/></p>
		</div>
		<p class="modal_submit_button">
			<a class="fn_modalSubmitCancel" href="#none" title="취소">취소</a>
			<a class="fn_modalteamApplySubmit" href="#none" title="확인">확인</a>
		</p>
	</div>
</div>
<div id="modal_leaveQuestion" class="modal_team_view">
	<p class="modal_guide_banner_close"><a href="#none" title="닫기"><img src="/resources/images/info_guide_close.png" alt="닫기"/></a></p>
	<div class="modal_team_viewWrap">
		<h3>질문 남기기</h3>
		<div class="modal_team_viewContents">
			<p><textarea placeholder="질문을 간략히 입력하세요."></textarea></p>
		</div>
		<p class="modal_submit_button">
			<a class="fn_modalSubmitCancel" href="#none" title="취소">취소</a>
			<a class="fn_modalLeaveQnaSubmit" href="#none" title="등록">등록</a>
		</p>
	</div>
</div>
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
<script>
	$(document).ready(function(){
		//상단 고정바 리사이즈
		$(window).resize(function(){
			var cateWidth = $(".social_content .mypage_notice_category").width();
			var offset = $(".social_content .mypage_notice_category").offset();
			$(".mypage_notice_category_scroll").css("width", ""+cateWidth+"px");
		}).resize();
		
		//스크롤 기능
		$(window).scroll(function(){
			var scrollPos = $(document).scrollTop();
			var offset = $(".social_content .mypage_notice_category").offset();
			//console.log(scrollPos);
			if( scrollPos > 700 ){
				$(".mypage_notice_category_scroll").css({"left":""+ offset.left +"px", "opacity":"1"});
			}
			else{
				$(".mypage_notice_category_scroll").css("left", "-9999px");
			}
		});
		
		//swiper init
		var swiperSub = new Swiper('.sub_common_teams_swiper', {
			slidesPerView: 5
		});
		
		/* 모달팝업_팀 소개_팀 지원하기 */
		$(".btn_team_teamapply").click(function(){
			$("#screenCover").show(0);
			$("#modal_teamApply").show(0);
			
			$(".fn_modalSubmitCancel").click(function(){
				$("#modal_teamApply").hide(0);
				$("#screenCover").hide(0);
			});
		});
		$(".fn_modalteamApplySubmit").click(function(){
			if( confirm("이 팀에 지원하시겠습니까?") ){
				alert("팀에 지원하셨습니다.");
				$("#modal_teamApply").hide(0);
				$("#screenCover").hide(0);
				return false;
			}
			else{
				return false;
			}
		});
		
		/* 모달팝업_팀 소개_질문남기기 */
		$(".btn_team_leaveQuestion").click(function(){
			$("#screenCover").show(0);
			$("#modal_leaveQuestion").show(0);
			
			$(".fn_modalSubmitCancel").click(function(){
				$("#modal_leaveQuestion").hide(0);
				$("#screenCover").hide(0);
			});
		});
		$(".fn_modalLeaveQnaSubmit").click(function(){
			if( confirm("질문을 남기시겠습니까?") ){
				alert("질문을 등록했습니다.");
				$("#modal_leaveQuestion").hide(0);
				$("#screenCover").hide(0);
				return false;
			}
			else{
				return false;
			}
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