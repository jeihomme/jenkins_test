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
		<li class="active"><a href="/front/mypage/awards" title="수상인증">수상인증</a></li>
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
	<div class="mypage_expireInfo mypage_award">
		<h3>수상 경력 / 자격증 인증하기</h3>
		<p class="mypage_award_img"><img src="/resources/images/mypage_award.png" alt="수상인증"/></p>
		<p class="mypage_award_txt">최근 3년간 받으셨던 상장, 자격증, 이수증을 등록해 보세요! 간단한 사진촬영으로 ‘뉴스타터’님의 능력을 증명해요!</p>
		<p class="mypage_award_btn"><button class="btn_grn btn_team_common" onclick="fn_awardReg();">등록하기</button></p>
	</div>
</div>
<div class="mypage_wrap">
	<div class="sectionWrap">
		<div class="mypage_myteam mypage_award_table">
			<h3><i><img src="/resources/images/icon_award.png" alt="수상"/></i><span>나의 수상 이력</span></h3>
			<p class="mypage_award_table_summary">등록된 시상 내역 <strong>(최근 총 2회)</strong></p>
			<table class="mypage_table_common">
				<tbody>
					<tr>
						<th class="tdwidth30">대회명</th>
						<th class="collapseCol">주최</th>
						<th>실적</th>
						<th class="collapseCol">날짜</th>
						<th>파일첨부</th>
						<th class="collapseCol"></th>
					</tr>
					<tr>
						<td class="tdwidth30">
							<span>해양 수산부 마케팅 공모전</span>
						</td>
						<td class="collapseCol">
							<span>해양 수산부</span>
						</td>
						<td>
							<span>금상</span>
						</td>
						<td class="collapseCol">
							<span>2019.05.23</span>
						</td>
						<td>
							<a id="award_addFile01" href="#none" title="파일첨부"><img src="/resources/images/icon_clip.png" alt="파일첨부"/></a>
							<input id="award_addFile01_dummy" type="file" title="파일첨부" hidden="hidden"/>
						</td>
						<td class="collapseCol">
							<span class="award_editDelete"><button id="award_editFile01" class="btn_team_common btn_lightblue">수정</button><button id="award_delFile01" class="btn_team_common btn_lightblue">삭제</button></span>
						</td>
					</tr>
					<tr>
						<td class="tdwidth30">
							<span>컴퓨터활용 1급 자격증</span>
						</td>
						<td class="collapseCol">
							<span>컴퓨터활용진흥원</span>
						</td>
						<td>
							<span>동상</span>
						</td>
						<td class="collapseCol">
							<span>2019.06.12</span>
						</td>
						<td>
							<a id="award_addFile02" href="#none" title="파일첨부"><img src="/resources/images/icon_clip.png" alt="파일첨부"/></a>
							<input id="award_addFile02_dummy" type="file" title="파일첨부" hidden="hidden"/>
						</td>
						<td class="collapseCol">
							<span class="award_editDelete"><button id="award_editFile02" class="btn_team_common btn_lightblue">수정</button><button id="award_delFile02" class="btn_team_common btn_lightblue">삭제</button></span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div class="m_footerDummy"></div>
<div id="modal_awardReg" class="modal_team_view">
	<p class="modal_guide_banner_close"><a href="#none" title="닫기"><img src="/resources/images/info_guide_close.png" alt="닫기"/></a></p>
	<div class="modal_team_viewWrap">
		<h3>수상 경력/자격증 등록하기</h3>
		<div class="modal_team_viewContents modal_awardRegContents">
			<p><input type="text" placeholder="대회 명을 입력해주세요. 예) 해양수산부 마케팅 공모전"/></p>
			<p><input type="text" placeholder="주최사 명을 입력해주세요. 예) 해양수산부"/></p>
			<p><input type="text" placeholder="실적을 입력해주세요. 예) 금상"/></p>
			<p class="datepicker_wrap"><input id="datepicker_awardReg" type="text" placeholder="수상 날짜를 입력해주세요."/></p>
		</div>
		<p class="modal_submit_button">
			<a class="fn_modalSubmitCancel" href="#none" title="취소">취소</a>
			<a class="fn_awardRegSubmit" href="#none" title="등록">등록</a>
		</p>
	</div>
</div>
<script>
$(document).ready(function(){
	$("#datepicker_awardReg").datepicker();
});

//수상 경력 등록하기
function fn_awardReg(){
	$("#screenCover").show(0);
	$("#modal_awardReg").show(0);
	
	$(".fn_modalSubmitCancel").click(function(){
		$("#modal_awardReg").hide(0);
		$("#screenCover").hide(0);
	});
	
	$(".fn_awardRegSubmit").click(function(){
		if( confirm("등록하시겠습니까?") ){
			alert("등록되었습니다.");
			$("#modal_awardReg").hide(0);
			$("#screenCover").hide(0);
			return false;
		}
		else{
			return false;
		}
	});
}
</script>