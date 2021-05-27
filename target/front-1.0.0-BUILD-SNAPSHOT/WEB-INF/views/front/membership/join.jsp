<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<h2 class="hideHeading">컨텐츠</h2>
<div class="membership">
	<div class="sectionWrap">
		<div class="membership_join membership_join_form">
			<h2><a href="/front/main/main"><img src="/resources/images/logo_t.png" alt="LOGO"/></a></h2>
			<h3>회원가입</h3>
			<div class="membership_join_form_wrap">
				<div class="join_form_content join_form_left">
					<h3>기본정보</h3>
					<p><input type="text" id="joinFormName" name="joinFormName" title="이름 입력" placeholder="이름을 입력해주세요."/></p>
					<p class="join_form_btni"><input id="joinFormNick" type="text" name="joinFormNick" title="닉네임 입력" placeholder="닉네임을 입력해주세요."/><button onclick="fn_joinNChk();">중복확인</button></p>
					<p class="join_form_btni"><input id="joinFormMail" type="text" name="joinFormMail" title="이메일 입력" placeholder="이메일을 입력해주세요."/><button onclick="fn_joinMChk();">중복확인</button></p>
					<p><input id="joinFormPhone" type="text" name="joinFormPhone" title="핸드폰 번호 입력" placeholder="핸드폰 번호를 입력해주세요. 예) 01012341234"/></p>
					<p><input id="joinFormPW" type="password" name="joinFormPW" title="비밀번호 입력" placeholder="비밀번호(문자, 숫자 포함 8자 이상)을 입력해주세요."/></p>
					<p><input id="joinFormPWR" type="password" name="joinFormPWR" title="비밀번호 재입력" placeholder="비밀번호를 재입력해주세요."/></p>
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
								<input id="join_form_rad_youth" type="radio" name="joinformJOB" value="M"/>
								<label for="join_form_rad_youth">중학생</label>
							</li>
							<li>
								<input id="join_form_rad_high" type="radio" name="joinformJOB" value="H"/>
								<label for="join_form_rad_high">고등학생</label>
							</li>
							<li>
								<input id="join_form_rad_college" type="radio" name="joinformJOB" value="U"/>
								<label for="join_form_rad_college">대학생</label>
							</li>
							<li>
								<input id="join_form_rad_grad" type="radio" name="joinformJOB" value="G"/>
								<label for="join_form_rad_grad">대학원생</label>
							</li>
							<li>
								<input id="join_form_rad_adult" type="radio" name="joinformJOB" value="A"/>
								<label for="join_form_rad_adult">일반성인</label>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<p class="join_btn join_email"><button class="btn_grn btn_team_common" onclick="fn_toJoinMembership();">가입하기</button></p>
			 <p class="join_border">──────────&nbsp;&nbsp;&nbsp;또는&nbsp;&nbsp;&nbsp;──────────</p>
			 <p class="join_btn join_kakao"><button class="btn_team_common" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=d5cda98c6919a0870760707e269f4592&redirect_uri=http://eventso_test.report.so/oauth&response_type=code'"><i><img src="/resources/images/icon_kakao.png" alt="kakao"/></i>카카오톡으로 회원가입</button> 
			<!--<p class="join_btn join_kakao"><button class="btn_team_common" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=d5cda98c6919a0870760707e269f4592&redirect_uri=http://localhost:9090/oauth&response_type=code'"><i><img src="/resources/images/icon_kakao.png" alt="kakao"/></i>카카오톡으로 회원가입</button>-->
			<p class="join_etc">
				이미 계정이 있으신가요?
				<a href="/front/membership/login" title="기존 계정으로 로그인하기">기존 계정으로 로그인하기</a>
			</p>
		</div>
		<!-- <div class="membership_join">
			<h2><a href="/front/main/main"><img src="/resources/images/logo_t.png" alt="LOGO"/></a></h2>
			<h3>회원가입</h3>
			<p class="join_btn join_email"><button class="btn_grn btn_team_common btn_team_submit fn_toJoinEmail">이메일로 회원가입</button></p>
			<p class="join_border">──────────&nbsp;&nbsp;&nbsp;또는&nbsp;&nbsp;&nbsp;──────────</p>
			<p class="join_btn join_kakao"><button class="btn_team_common" onclick="fn_kakaoJoin();"><i><img src="/resources/images/icon_kakao.png" alt="kakao"/></i>카카오톡으로 회원가입</button></p>
			<p class="join_etc">
				이미 계정이 있으신가요?
				<a href="/front/membership/login" title="기존 계정으로 로그인하기">기존 계정으로 로그인하기</a>
			</p>
		</div> -->
	</div>
</div>
<div class="m_footerDummy"></div>
<script type="text/javascript">
$(document).ready(function(){
	$(".form_chkAll").click(function(){
		$(".form_chkbox").prop("checked", this.checked);
	});
});

var Nickck = "";
var Mailck = "";
var pattern1 = /[0-9]/;	// 숫자 
var pattern2 = /[a-zA-Z]/;	// 문자 

//닉네임 중복 체크
function fn_joinNChk() {
	if($("[name=joinFormNick]").val() == ''){alert("닉네임을 입력해주세요."); return;	}
	
	var params = new Object();
	params.joinFormNick = $('[name=joinFormNick]').val();
	params.status = "N";
	params.userId = 'jaewon.jung';

//2. 유효성 검사 서비스로 이동
var result = ${unit.ajax("join", "params")};

if ( unit_isComplete(result) ){
	alert("사용가능한 닉네임입니다.");
	Nickck = "ok";
} else {
	alert("이미 사용중인 닉네임입니다.");
	$('[name=joinFormNick]').val('');
	Nickck = "";
}
}
//이메일 중복 체크
function fn_joinMChk() {
	if($("[name=joinFormMail]").val() == ''){
		alert("이메일을 입력해주세요."); return;
		}else{
		 var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        if(!regEmail.test( $("[name=joinFormMail]").val()  )  ) {
            alert('이메일 주소가 유효하지 않습니다');
            return;
	}
	}

	
	var params = new Object();
	params.joinFormMail = $('[name=joinFormMail]').val();
	params.status = "M";
	params.userId = 'jaewon.jung';


//2. 유효성 검사 서비스로 이동
var result = ${unit.ajax("join", "params")};

if ( unit_isComplete(result) ){
	alert("사용가능한 이메일입니다.");
	Mailck = "ok";
} else {
	alert("이미 사용중인 이메일입니다.");
	$('[name=joinFormMail]').val('');
	Mailck = "";
}
}

function fn_toJoinMembership() {
if ( $("[name=joinFormName]").val() == "" ){  alert("이름을 입력해주세요 ."); return; }
if(Nickck == ""){alert("닉네임 중복체크를 해주세요."); return;}
if(Mailck == ""){alert("이메일 중복체크를 해주세요."); return;}
if ( $("[name=joinFormPhone]").val()== ""  ){  alert("전화번호를 입력해주세요 ."); return; }

if ( $("[name=join_form_chk_policy]:checked").val() != "Y" ){  alert("서비스 이용약관 동의가 필요합니다 ."); return; }
if ( $("[name=join_form_chk_privacy]:checked").val() != "Y" ){ alert("개인정보 수집 및 이용에 대한 동의가 필요합니다."); return; }
if ( $("[name=join_form_chk_age]:checked").val() != "Y" ){ alert("만 14세 이상만 회원가입이 가능합니다."); return; }
if ( $("[name=joinformJOB]:checked").val() == undefined){ alert("직업을 선택해주세요"); return; }

if(!pattern1.test($('[name=joinFormPW]').val()) || !pattern2.test($('[name=joinFormPW]').val()) || $('[name=joinFormPW]').val().length < 8) { 
	 alert("비밀번호는 8자리 이상 문자, 숫자로 구성하여야 합니다."); 
	 return;  }


if( $('[name=joinFormPW]').val() != $('[name=joinFormPWR]').val() ){
	alert("비밀번호가 일치하지 않습니다"); 
	$('[name=joinFormPW]').val('');
	$('[name=joinFormPWR]').val('');
	return;
	}
	
 //	1. 유효성 검사=
	var params = new Object();
	params.joinFormName = $('[name=joinFormName]').val();
	params.joinFormNick = $('[name=joinFormNick]').val();
	params.joinFormMail = $('[name=joinFormMail]').val();
	params.joinFormPhone = $('[name=joinFormPhone]').val();
	params.joinFormPW = $('[name=joinFormPW]').val();
	params.joinFormPWR = $('[name=joinFormPWR]').val();
	params.joinformJOB =$("[name=joinformJOB]:checked").val();
	
	if($("[name=joinformAccount]:checked").val() == 'Y'){
	params.joinformAccount =$("[name=joinformAccount]:checked").val();
	}else{
	params.joinformAccount ='N';	
	}
	if($("[name=joinformMailing]:checked").val()  == 'Y' ){
	params.joinformMailing =$("[name=joinformMailing]:checked").val();
	}else{
	params.joinformMailing ='N';	}
	
	params.status = "R";
	params.userId = 'jaewon.jung';
	
//	2. 유효성 검사 서비스로 이동
	var result = ${unit.ajax("join", "params")};
	
	if ( unit_isComplete(result) ){
		alert("회원가입이 완료되었습니다.");
		location.href='/front/membership/login';
	} else {
		alert("필수값을 입력해주세요.");
	} 
	
}
</script>