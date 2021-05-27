<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="data" value="${out.stat.data[0]}" />
<h2 class="hideHeading">컨텐츠</h2>
<div class="membership">
	<div class="sectionWrap">	
		<div class="membership_join membership_join_form">
			<h2><a href="/front/main/main"><img src="/resources/images/logo_t.png" alt="LOGO"/></a></h2>
			<h3>카카오톡 회원가입</h3>
			<div class="membership_join_form_wrap">
				<div class="join_form_content join_form_left">
					<h3>기본정보</h3>   
					<p><input type="text" id="joinFormName" name="kakaoFormName" title="이름 입력" placeholder="이름을 입력해주세요." value="${stat.USER_STAT}"/></p>
					<p><input id="joinFormNick" type="text" name="kakaoFormNick" title="닉네임 입력" readonly/>
					<p ><input id="joinFormMail" type="text" name="kakaoFormMail" title="이메일 입력" readonly/>
					<p><input id="joinFormPhone" type="text" name="kakaoFormPhone" title="핸드폰 번호 입력" placeholder="핸드폰 번호를 입력해주세요. 예) 01012341234"/></p>
				</div>
				<div class="form_control join_form_content join_form_right">
					<h3>이용약관동의</h3>
					<p class="join_form_chkbox_all">
						<input class="form_chkAll" id="join_form_chk_all" type="checkbox" name="join_form_chk_all"/>
						<label for="join_form_chk_all">전체동의</label>
					</p>
					<ul class="join_form_chkbox">
						<li>
							<input class="form_chkbox" id="join_form_chk_policy" type="checkbox" name="join_form_chk_policy" value="Y"/>
							<label for="join_form_chk_policy">서비스 이용약관 동의 (필수)</label>
							<button class="fn_showPolicy">내용보기</button>
						</li>
						<li>
							<input class="form_chkbox" id="join_form_chk_privacy" type="checkbox" name="join_form_chk_privacy" value="Y"/>
							<label for="join_form_chk_privacy">개인정보 수집 및 이용에 대한 동의 (필수)</label>
							<button class="fn_showPrivacy">내용보기</button>
						</li>
						<li>
							<input class="form_chkbox" id="join_form_chk_age" type="checkbox" name="join_form_chk_age" value="Y"/>
							<label for="join_form_chk_age">만 14세 이상 (필수)</label>
						</li>
						<li>
							<input class="form_chkbox" id="join_form_chk_accountActive" type="checkbox" name="joinformAccount" value="Y"/>
							<label for="join_form_chk_accountActive">장기간 미 접속시에도 계정 활성 상태 유지 (선택)</label>
						</li>
						<li>
							<input class="form_chkbox" id="join_form_chk_mailing" type="checkbox" name="joinformMailing" value="Y"/>
							<label for="join_form_chk_mailing">메일 수신 동의 (선택)</label>
						</li>
					</ul>
					<div class="join_form_radio_wrap">
						<p>직업</p>
						<ul class="join_form_radio">
							<li>
								<input id="join_form_rad_youth" type="radio" name="kakaoformJOB" value="M"/>
								<label for="join_form_rad_youth">중학생</label>
							</li>
							<li>
								<input id="join_form_rad_high" type="radio" name="kakaoformJOB" value="H"/>
								<label for="join_form_rad_high">고등학생</label>
							</li>
							<li>
								<input id="join_form_rad_college" type="radio" name="kakaoformJOB" value="U"/>
								<label for="join_form_rad_college">대학생</label>
							</li>
							<li>
								<input id="join_form_rad_grad" type="radio" name="kakaoformJOB" value="G"/>
								<label for="join_form_rad_grad">대학원생</label>
							</li>
							<li>
								<input id="join_form_rad_adult" type="radio" name="kakaoformJOB" value="A"/>
								<label for="join_form_rad_adult">일반성인</label>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<p class="join_btn join_email"><button class="btn_grn btn_team_common" onclick="fn_toJoinMembership();">가입하기</button></p>
			<p class="join_etc">
				이미 계정이 있으신가요?
				<a href="/front/membership/login" title="기존 계정으로 로그인하기">기존 계정으로 로그인하기</a>
			</p>
		</div>
	</div>
</div>
<div class="m_footerDummy"></div>
<script type="text/javascript">

$(function(){
	$("[name=kakaoFormNick]").val( ${sessionScope.kakaoNick} );
	$("[name=kakaoFormMail]").val( ${sessionScope.kakaoEmail} ); 
});
function fn_toJoinMembership() {
if ( $("[name=kakaoFormName]").val() == "" ){  alert("이름을 입력해주세요 ."); return; }
if ( $("[name=kakaoFormPhone]").val()== ""  ){  alert("전화번호를 입력해주세요 ."); return; }
if ( $("[name=join_form_chk_policy]:checked").val() != "Y" ){  alert("서비스 이용약관 동의가 필요합니다 ."); return; }
if ( $("[name=join_form_chk_privacy]:checked").val() != "Y" ){ alert("개인정보 수집 및 이용에 대한 동의가 필요합니다."); return; }
if ( $("[name=join_form_chk_age]:checked").val() != "Y" ){ alert("만 14세 이상만 회원가입이 가능합니다."); return; }
if ( $("[name=kakaoformJOB]:checked").val() == undefined){ alert("직업을 선택해주세요"); return; }


 //	1. 유효성 검사=
	var params = new Object();
	params.kakaoFormName = $('[name=kakaoFormName]').val();
	params.kakaoFormNick = $('[name=kakaoFormNick]').val();
	params.kakaoFormMail = $('[name=kakaoFormMail]').val();
	params.kakaoFormPhone = $('[name=kakaoFormPhone]').val();
	params.kakaoformJOB =$("[name=kakaoformJOB]:checked").val();
	
	if($("[name=joinformAccount]:checked").val() == 'Y'){
	params.joinformAccount =$("[name=joinformAccount]:checked").val();
	}else{
	params.joinformAccount ='N';	
	}
	if($("[name=joinformMailing]:checked").val()  == 'Y' ){
	params.joinformMailing =$("[name=joinformMailing]:checked").val();
	}else{
	params.joinformMailing ='N';	}
	
	
//	2. 유효성 검사 서비스로 이동
	var result = ${unit.ajax("kakaojoin", "params")};
	
	if ( unit_isComplete(result) ){
		alert("카카오톡 회원가입이 완료되었습니다.");
		location.href='/front/membership/login';
	} else {
		alert("필수값을 입력해주세요.");
	} 
	
}
</script>