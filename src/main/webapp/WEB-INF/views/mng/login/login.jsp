<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<div class="login phones_login" >
	<div class="login_text">
		<h1>Manager Login</h1>
		<p>이곳은 관리자 페이지 입니다.</p>
		<p>관리자 아이디와 비밀번호를 입력해 주세요</p>
	</div>
	<div class="login_box phones_login_box">
		<div class="loginwrap">
			<div class="inputwrap">
				<label for="mngId" class="col-form-label col-form-label-lg">아이디</label>		
				<input type="text" class="form-control form-control-lg phones_mngInputTag" id="mngId" name="mngId" placeholder="User ID"  onkeypress="if(event.keyCode==13){fn_BtnLogin();}"/>
				<label for="mngPw" class="col-form-label col-form-label-lg">비밀번호</label>
				<input type="password" class="form-control form-control-lg phones_mngInputTag" id="mngPw" name="mngPw" placeholder="Password" onkeypress="if(event.keyCode==13){fn_BtnLogin();}"/>
				<div  class="login_btn phones_mngInputTag" onclick="fn_BtnLogin()">로그인</div>
				<div class="form-group row">
					<label for="idSaveCheck" class="col-10 col-form-label col-form-label-lg" style="    margin-left: 30px;">아이디 저장</label>
					<input id="idSaveCheck" type="checkbox" name="recordId" value="Y" checked style="margin-top:10px; width: 20px; height: 20px;    margin-left: -90%;"/> 
				</div>
			</div>
			<div class="register_select_box" style="padding-top: 100px; display: none;">
            	<button id="create-kakao-login-btn" type="button" class="sns_btn kakao_btn" >카카오계정으로 로그인</button>
            	<div id="naverIdLogin" class="sns_btn naver_btn">네이버 아이디로 로그인</div>
            	<button id="googleLoginBtn" type="button" class="sns_btn google_btn" onclick="startApp();">구글계정으로 로그인</button>
            </div>
		</div>
	</div>
</div>
<div class="login_footer">Copyright © PeopleMade.  All Rights Reserved.</div>

<!--   카카오 api -->
  <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!--   구글 api -->
  <script src="https://apis.google.com/js/api:client.js"></script>
<!--   네이버 api -->
  <script type="text/javascript" src="/resources/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="//cdn.rawgit.com/placemarker/jQuery-MD5/master/jquery.md5.js"></script>
<script type="text/javascript">
	
	$(function(){
		 
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var key = getCookie("key");
	    $("#mngId").val(key); 
	     
	    if($("#mngId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	            setCookie("key", $("#mngId").val(), 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("key");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#mngId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            setCookie("key", $("#mngId").val(), 7); // 7일 동안 쿠키 보관
	        }
	    });
	//카카오톡 간편로그인 API
	
	Kakao.init('625dd9d4348f689932842a4a6c30558d');
		if ($('#create-kakao-login-btn').attr('id')) {
			Kakao.Auth.createLoginButton({
				container : '#create-kakao-login-btn',
				success : function(token) {
				Kakao.API.request({
						url : '/v2/user/me',
						success : function(data) {
							//console.log(JSON.stringify(data));
							USR_EMAIL = data.kakao_account.email;
							joinType = 'SNS';
							USER_SNS_TYPE = 'K';
								//로그인 시
								fn_loginChk(joinType);
						}
					});
				},
				fail : function(err) {
					alert('계정정보 수집에 실패하였습니다.');
				}
			});
			$('#create-kakao-login-btn').text('카카오계정으로 로그인');
		}
		startApp();
	});

	//구글 간편로그인 API
	var googleUser = {};
	var startApp = function() {
		gapi.load( 'auth2', function() {
			// Retrieve the singleton for the GoogleAuth library and set up the client.
			auth2 = gapi.auth2.init({
					// 클라이언트 ID 설정하기
					client_id : '29882695424-nkp55onmr849eop3av67qernr2fapc1n.apps.googleusercontent.com',
					cookiepolicy : 'single_host_origin'
					// Request scopes in addition to 'profile' and 'email'
					//scope: 'additional_scope'
					});
			attachSignin(document.getElementById('googleLoginBtn'));
			
		});
	};

	function attachSignin(element) {
		auth2.attachClickHandler(element, {}, function(googleUser) {
			//console.log( googleUser.getBasicProfile().getId() );
			USR_EMAIL = googleUser.getBasicProfile().getEmail();
			joinType = 'SNS';
			USER_SNS_TYPE = 'G';
				//						로그인 시
				fn_loginChk(joinType);

		}, function(error) {
			alert('계정정보 수집에 실패하였습니다.');
		});
	}

	//네이버 간편로그인 API
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "Yy3VYgU3VeQz48IxqqLD",//로컬 용
// 			clientId : "cJME75uYUeMQFAzAHfZe",//beta.so 용
			
			callbackUrl : "https://localhost:8443/mng/login/loginCallback",
			isPopup : false, /* 팝업을 통한 연동처리 여부 */
			loginButton : {
				color : "green",
				type : 3,
				height : 60
			}
		/* 로그인 버튼의 타입을 지정 */
		});

		/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init(); 
		$('#naverIdLogin a img').after('네이버 아이디로 로그인');

	var referer = '${header.referer}';
	if (referer.indexOf('Callback') > -1) {
		naverLogin.getLoginStatus(function(status) {
			if (status) {
				/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
				var email = naverLogin.user.email;
				var name = naverLogin.user.name;

				USR_EMAIL = naverLogin.user.email;
				USR_EMAIL = USR_EMAIL.replace('never', 'naver');
				
				joinType = 'SNS';
				USER_SNS_TYPE = 'N';
				
				//로그인 시
				fn_loginChk(joinType);
				
				if (opener)
					window.open().self.close();
			} 
			else {
				alert('계정정보 수집에 실패하였습니다.');
			}
		});
	}
var joinType = "";
var USER_SNS_TYPE = "";	
var USR_EMAIL = "";
// SNS 로그인
function fn_loginChk( joinType ){
// 	1. 유효성 검사를 위한 파라미터값
if ( joinType == "SNS" && USER_SNS_TYPE != "" ) {
	
	var params = new Object();
	params.userEmail = USR_EMAIL;
	params.status = "CHECK";
	params.query = "selectMngLoginCheck";
	params.SNS_TYPE = USER_SNS_TYPE;
}
	
//	2. 유효성 검사 서비스로 이동
	var result = ${unit.ajax("/mng/login/ajax", "ajax", "params")};
	if ( unit_isComplete(result) ){
		
		var jsonDetail = result.out.detail.data;
		if( !jsonDetail.length ){
			if( confirm( "회원정보가 없습니다.") ){
				return location.href = "/front/account/register_select";
			}
		}

		if (jsonDetail[0].PREV_CD == 'undefind' || jsonDetail[0].PREV_CD == null || jsonDetail[0].PREV_CD == '') {
			alert('마스터 권한이 없습니다. 마스터 등록이 필요합니다.');
			return location.href = "/";
		}
		
// 		localStorage.setItem("mngLoginId", jsonDetail[0].USER_EMAIL ); 
		localStorage.setItem("mngPrevCd", jsonDetail[0].PREV_CD ); 
		localStorage.setItem("mngLoginIdx", jsonDetail[0].MNG_IDX ); 
		localStorage.setItem("mngUserType", jsonDetail[0].USER_TYPE ); 
		localStorage.setItem("mngLoginNm", jsonDetail[0].MNG_NM ); 
		if( jsonDetail[0].USER_TYPE == 'A' ) location.href='/mng/main/index';
		else location.href='/mng/wait/index';
	}
}
	
	
	function fn_BtnLogin() {
	// 	1. 유효성 검사를 위한 파라미터값
		var params = new Object();
		params.mngId = $('[name=mngId]').val();
		params.mngPw =  $.md5( $('[name=mngPw]').val() );
		params.status = "CHECK";
		params.query = "selectMngLoginCheck";
		
	//	2. 유효성 검사 서비스로 이동
		var result = ${unit.ajax("/mng/login/ajax", "ajax", "params")};
		
		if ( unit_isComplete(result) ) {
			var jsonDetail = result.out.detail.data;
			if( !jsonDetail.length ) return alert("아이디 혹은 비밀번호를 입력해주세요.");
			if( jsonDetail[0].USER_TYPE == 'U' ) return alert("아이디 혹은 비밀번호를 입력해주세요.");
			
			localStorage.setItem("mngPrevCd", jsonDetail[0].PREV_CD ); 
			localStorage.setItem("mngLoginIdx", jsonDetail[0].MNG_IDX ); 
			localStorage.setItem("mngUserType", jsonDetail[0].USER_TYPE ); 
			localStorage.setItem("mngLoginNm", jsonDetail[0].MNG_NM ); 
			
			if( jsonDetail[0].USER_TYPE == 'A' ) location.href='/mng/main/index';
			else location.href='/mng/wait/index';
		}
	}
</script>




