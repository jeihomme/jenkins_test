<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="data" value="${out.apply.data[0]}" />

<h2 class="hideHeading">컨텐츠</h2>
<div class="mypage_subGnb">
	<ul>
		<li><a href="/front/mypage/profile" title="프로필">프로필</a></li>
		<li><a href="/front/mypage/bookmark" title="나의 관심 프로젝트">나의 관심 프로젝트</a></li>
		<li><a href="/front/mypage/team_contest" title="팀 만들기">팀 만들기</a></li>
		<li><a href="/front/mypage/myteam_list" title="나의 팀 관리">나의 팀 관리</a></li>
		<li><a href="/front/mypage/awards" title="수상인증">수상인증</a></li>
		<li class="active"><a href="/front/membership/kakaomodify" title="정보수정">정보수정</a></li>
		<li><a href="/front/mypage/notice" title="공지사항">공지사항</a></li>
	</ul>
</div>
<div class="membership">
	<div class="sectionWrap">
		<div class="membership_modify">
			<h2>정보수정</h2>
			<div class="form_control modify_form">
				<h3>기본정보</h3>
				<h3 class="flt_right">프로필 정보</h3>
				<div class="modify_form_content modify_kakao_left join_form_left">
					<h4>이름</h4>
					<p><input id="modifyFormName" type="text" name="modifyFormName" disabled  value="${data.USER_NAME}"/></p>
					<h4>닉네임</h4>
					<p class="join_form_btni"><input id="modifyFormNick" type="text" name="modifyFormNick" title="닉네임 입력" placeholder="닉네임을 입력해주세요."/ value="${data.USER_NICK}"><button onclick="fn_joinNChk();">중복확인</button></p>
					<h4>핸드폰 번호</h4>
					<p><input id="modifyFormPhone" type="text" name="modifyFormPhone" title="핸드폰 번호 입력" placeholder="핸드폰 번호를 입력해주세요. 예) 01012341234" value="${data.USER_TEL}" /></p>
					<h4>직업</h4>
					<ul class="join_form_radio">
						<li>
							<input id="join_form_rad_youth" type="radio" name="modifyformJOB" value="M" <c:if test="${data.USER_JOB eq 'M'}">checked</c:if> />
							<label for="join_form_rad_youth">중학생</label>
						</li>
						<li>
							<input id="join_form_rad_high" type="radio" name="modifyformJOB" value="H" <c:if test="${data.USER_JOB eq 'H'}">checked</c:if>/>
							<label for="join_form_rad_high">고등학생</label>
						</li>						
						<li>
							<input id="join_form_rad_college" type="radio" name="modifyformJOB" value="U" <c:if test="${data.USER_JOB eq 'U'}">checked</c:if>/>
							<label for="join_form_rad_college">대학생</label>
						</li>
						<li>
							<input id="join_form_rad_grad" type="radio" name="modifyformJOB" value="G" <c:if test="${data.USER_JOB eq 'G'}">checked</c:if>/>
							<label for="join_form_rad_grad">대학원생</label>
						</li>
						<li>
							<input id="join_form_rad_adult" type="radio" name="modifyformJOB" value="A" <c:if test="${data.USER_JOB eq 'A'}">checked</c:if>/>
							<label for="join_form_rad_adult">일반성인</label>
						</li>
					</ul>
					<h4>동의여부</h4>
					<ul class="join_form_chkbox">
						<li>
							<input class="form_chkbox" id="modify_form_chk_keep" type="checkbox" name="modifyformAccount" value="Y" <c:if test="${data.LONG_NOT_CONT_YN eq 'Y'}">checked</c:if>/>
							<label for="modify_form_chk_keep">장기간 미 접속시에도 계정 활성 상태 유지 (선택)</label>
						</li>
						<li>
							<input class="form_chkbox" id="modify_form_chk_mailling" type="checkbox" name="modifyformMailing" value="Y" <c:if test="${data.EMAIL_RECEIVING_YN eq 'Y'}">checked</c:if>/>
							<label for="modify_form_chk_mailling">메일 수신 동의 (선택)</label>
						</li>
					</ul>
				</div>
				<div class="modify_form_content modify_kakao_right join_form_right">
					<h4>이미지 수정</h4>
					<p class="myInfo_pic">
						<a id="modifyFormProfileImg" href="#none" title="프로필 사진">
							<img src="/resources/images/profile_picture.png" alt="프로필 사진"/>
							<img class="modify_picture" src="/resources/images/profile_team_add_white.png" alt="프로필 사진 변경"/>
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
					<h4>활동 이력</h4>
					<ul class="modify_form_myActive">
						<li>
							<p class="myActive_img"><img src="/resources/images/icon_profile01.png" alt="공모전 참여"/></p>
							<p class="myActive_txt"><span>5회</span></p>
						</li>
						<li>
							<p class="myActive_img"><img src="/resources/images/icon_profile02.png" alt="팀 활동"/></p>
							<p class="myActive_txt"><span>2회</span></p>
						</li>
						<li>
							<p class="myActive_img"><img src="/resources/images/icon_profile03.png" alt="수상경력"/></p>
							<p class="myActive_txt"><span>3회</span></p>
						</li>
					</ul>
					<ul class="modify_form_record">
						<li><span>공모전 참여 기록</span><button onclick="fn_toProfileContest();">상세보기</button></li>
						<li><span>팀 활동 기록</span><button onclick="fn_toProfileTeam();">상세보기</button></li>
						<li><span>수상 및 자격증 인증 기록</span><button onclick="fn_toProfileAwards();">상세보기</button></li>
					</ul>
					<p>
						<input class="form_chkbox" id="modify_form_chk_refuse" type="checkbox" name="modifyformrefuse" value="Y" <c:if test="${data.TEAM_INVITATION eq 'Y'}">checked</c:if>/>
						<label for="modify_form_chk_refuse">팀 초대 거부(검색에 노출 불가)</label>
					</p>
				</div>
			</div>	
			<div class="team_submitWrap">
				<button class="btn_grn btn_team_common" onclick="fn_modifySubmit();">수정완료</button>
			</div>
		</div>
	</div>
</div>
<div class="m_footerDummy"></div>
<script type="text/javascript">
var Nickck = "";

function fn_joinNChk() {
	if($("[name=modifyFormNick]").val() == ''){alert("닉네임을 입력해주세요."); return;	}
	
	var params = new Object();
	params.joinFormNick = $('[name=modifyFormNick]').val();
	params.status = "N";
	params.userId = 'jaewon.jung';

//2. 유효성 검사 서비스로 이동
var result = ${unit.ajax("kakaomodify", "params")};

if ( unit_isComplete(result) ){
	alert("사용가능한 닉네임입니다.");
	Nickck = "ok";
} else {
	alert("이미 사용중인 닉네임입니다.");
	$('[name=modifyFormNick]').val('');
	Nickck = "";
}
}

function fn_modifySubmit() {
	if(Nickck == ""){alert("닉네임 중복체크를 해주세요."); return;}
	
	
//	1. 유효성 검사
	var params = new Object();
	params.modifyFormNick = $('[name=modifyFormNick]').val();
	params.modifyFormPhone = $('[name=modifyFormPhone]').val();
	params.modifyformJOB = $('[name=modifyformJOB]:checked').val();
	if($("[name=modifyformAccount]:checked").val() == 'Y'){
		params.modifyformAccount =$("[name=modifyformAccount]:checked").val();
		}else{
		params.modifyformAccount ='N';	
		}
	if($("[name=modifyformMailing]:checked").val() == 'Y'){
		params.modifyformMailing =$("[name=modifyformMailing]:checked").val();
		}else{
		params.modifyformMailing ='N';	
		}
	if($("[name=modifyformrefuse]:checked").val() == 'Y'){
		params.modifyformrefuse =$("[name=modifyformrefuse]:checked").val();
		}else{
		params.modifyformrefuse ='N';	
		}
	params.status = "E";
	params.userId = 'jaewon.jung';
//	2. 유효성 검사 서비스로 이동
	var result = ${unit.ajax("kakaomodify", "params")};
	
	if ( unit_isComplete(result) ){
		alert("정보가 수정되었습니다.");
		location.href='/front/mypage/profile';
	} else {
		alert("필수값을 입력해주세요.");
	}
	
}
</script>