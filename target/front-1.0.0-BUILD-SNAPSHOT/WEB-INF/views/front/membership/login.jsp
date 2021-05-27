<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<h2 class="hideHeading">컨텐츠 </h2>
<div class="membership">
	<div class="sectionWrap">
		<div class="membership_join">
			<h2><a href="/front/main/main"><img src="/resources/images/logo_t.png" alt="LOGO"/></a></h2>
			<h3>로그인 </h3>
			<div class="login_form">
				<p><input  type="text" name="loginFormMail" title="이메일 입력" placeholder="이메일을 입력해주세요."/></p>
				<p><input  type="password" name="loginFormPW" title="비밀번호 입력" placeholder="비밀번호를 입력해주세요."/></p>
				<p class="login_check form_control">
					<input class="form_chkbox" id="login_form_keep" type="checkbox" name="login_form_keep" checked/>
					<label for="login_form_keep">로그인 상태 유지</label>
				</p>
			</div>
			<p class="join_btn join_email">
				<button class="btn_grn btn_team_common" onclick="fn_loginChk();">로그인</button>
				<span class="login_findid"><a href="/front/membership/searchidpw" title="이메일/비밀번호 찾기">이메일/비밀번호 찾기</a></span>
			</p>
			<p class="join_border">──────────&nbsp;&nbsp;&nbsp;또는&nbsp;&nbsp;&nbsp;──────────</p>
			<p class="join_btn join_kakao">
				<p class="join_btn join_kakao">
				<!-- <button class="btn_team_common" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=d5cda98c6919a0870760707e269f4592&redirect_uri=http://eventso_test.report.so/oauth&response_type=code'"><i><img src="/resources/images/icon_kakao.png" alt="kakao"/></i>카카오톡으로 로그인</button>--> 
				<button class="btn_team_common" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=d5cda98c6919a0870760707e269f4592&redirect_uri=http://localhost:9090/oauth&response_type=code'"><i><img src="/resources/images/icon_kakao.png" alt="kakao"/></i>카카오톡으로 로그인</button>
			</p>
			</p>
			<p class="join_btn join_black">
				<span>아직 뉴-스타터에 가입하지 않으셨다면?</span>
				<button class="btn_team_common" onclick="fn_toJoin();">회원가입</button>
			</p>
		</div>
	</div>
</div>
<div class="m_footerDummy"></div>

<script type="text/javascript">
$(function(){
var KakaologinStat = '${sessionScope.KakaologinStat}';
if(KakaologinStat != ""){
	  alert("사용중인 이메일 입니다 관리자에게 문의하세요.");

}
});

function fn_loginChk() {
//	1. 유효성 검사
	var params = new Object();
	params.loginFormMail = $('[name=loginFormMail]').val();
	params.loginFormPW = $('[name=loginFormPW]').val();

//	2. 유효성 검사 서비스로 이동
	var result = ${unit.ajax("login", "params")};
	if ( unit_isComplete(result) ){
		var jsonDetail = result.out.stat.data;
		  $.each( jsonDetail, function( key, val) { 
			  if( val.USER_STAT == 'U' ) {
				  location.href='/front/main/main';
			  }
		      else if( val.USER_STAT == 'P' ) {
		    	  alert("중지된 회원입니다 관리자에게 문의하세요.");
		      }
		      else if( val.USER_STAT == 'L' ) {
		    	  alert("탈퇴 회원입니다 관리자에게 문의하세요.");
		      }
		      else if( val.USER_STAT == 'F' ) {
		    	  alert("탈퇴 회원입니다 관리자에게 문의하세요.");
		      }
		  });
	} else {
		alert("아이디와 비밀번호를 확인해주세요.");
	}
	
}
</script>