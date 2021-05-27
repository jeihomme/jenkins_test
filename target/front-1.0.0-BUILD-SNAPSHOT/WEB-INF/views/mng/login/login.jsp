<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<div class="login">
	<div class="logo"><img src="/resources/images/logo.png" /></div>
	<div class="login_box">
		<h1>Mngin Login</h1>
		<p>이곳은 관리자 페이지 입니다. 관리자 아이디와 비밀번호를 입력해 주세요</p>

		<div class="loginwrap">
		
			<div class="inputwrap">
				<form>
					<div class="form-group row">	
						<label for="mngId" class="col-3 col-form-label col-form-label-lg">아이디</label>		
						<input type="text" class="col-9 form-control form-control-lg" name="mngId" placeholder="User ID" />
					</div>					
					<div class="form-group row">
						<label for="mngPw" class="col-3 col-form-label col-form-label-lg">비밀번호</label>
						<input type="password" class="col-9 form-control form-control-lg" name="mngPw" placeholder="Password" />
					</div>
				</form>
			</div>
			<div  class="login_btn" onclick="fn_BtnLogin()">로그인</div>
		</div>
	</div>
</div>
<div class="login_footer">Copyright © NEWSTARTER.  All Rights Reserved.</div>

<script type="text/javascript">

	function fn_BtnLogin() {
		
	// 	1. 유효성 검사를 위한 파라미터값
// 		var params = params = unit_getParams("section");
		var params = new Object();
		params.mngId = $('[name=mngId]').val();
		params.mngPw = $('[name=mngPw]').val();
		
	//	2. 유효성 검사 서비스로 이동
		var result = ${unit.ajax("login", "params")};
		
		if ( unit_isComplete(result) ){
// 			location.href='${unit.move("dashboard", "")}';
			location.href='/mng/main/dashboard';
		} else {
			alert("아이디 혹은 비밀번호를 입력해주세요.");
		}
	}

</script>




