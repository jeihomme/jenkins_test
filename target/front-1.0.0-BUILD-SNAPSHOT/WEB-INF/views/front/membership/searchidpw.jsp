<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<h2 class="hideHeading">컨텐츠</h2>
<div class="membership">
	<div class="sectionWrap">
		<div class="membership_join">
			<h2><a href="/front/main/main"><img src="/resources/images/logo_t.png" alt="LOGO"/></a></h2>
			<h3>이메일/비밀번호 찾기</h3>
			<div class="membership_find">
				<h4>이메일 찾기</h4>
				<p class="find_guide">가입시 입력하신 이름과 핸드폰 번호를 입력해 주세요.</p>
				<div class="login_form">
					<p><input id="findFormName" type="text" name="findFormName" title="이름 입력" placeholder="이름을 입력해주세요."/></p>
					<p><input id="findFormPhone" type="text" name="findFormPhone" title="핸드폰 번호 입력" placeholder="핸드폰 번호를 입력해주세요. 예) 01012341234"/></p>
				</div>
				<p class="join_btn">
					<button class="btn_grn btn_team_common" onclick="fn_srchMail();">확인</button>
				</p>
			</div>
			<div class="membership_find">
				<h4>비밀번호 찾기</h4>
				<p class="find_guide">가입시 입력하신 이름, 이메일 주소와 핸드폰 번호를 입력해 주세요.</p>
				<div class="login_form">
					<p><input id="findPFormName" type="text" name="findPFormName" title="이름 입력" placeholder="이름을 입력해주세요."/></p>
					<p><input id="findPFormMail" type="text" name="findPFormMail" title="이메일 주소 입력" placeholder="이메일을 입력해주세요."/></p>
					<p><input id="findPFormPhone" type="text" name="findPFormPhone" title="핸드폰 번호 입력" placeholder="핸드폰 번호를 입력해주세요. 예) 01012341234"/></p>
				</div>
				<p class="join_btn">
					<button class="btn_grn btn_team_common" onclick="fn_srchPW();">확인</button>
				</p>
			</div>
		</div>
	</div>
</div>
<div class="m_footerDummy"></div>
<div id="modal_findEmail" class="modal_team_view">
	<p class="modal_guide_banner_close"><a href="#none" title="닫기"><img src="/resources/images/info_guide_close.png" alt="닫기"/></a></p>
	<div class="modal_team_viewWrap">
		<h3>이메일 찾기</h3>
		<div class="modal_team_viewContents modal_findEmail" >
			<p><span>가입하신 이메일은</span><br> <strong class="seachemail"></strong> 입니다.</p>
		</div>
		<p class="modal_submit_button">
			<a class="fn_modalSubmitCancel" href="#none" title="확인" style="width:100%">확인</a>
		</p>
	</div>
</div>
<script>
	/* 아이디, 비밀번호 찾기 유효성 체크 */
	function fn_srchMail(){
		if( $("#findFormName").val().length == 0 ){
			$("#findFormName").focus();
			alert("이름을 입력해주세요.");
		}
		else if( $("#findFormPhone").val().length == 0 ){
			$("#findFormPhone").focus();
			alert("핸드폰 번호를 입력해주세요.");
		}
		else{
//			1. 유효성 검사
			var params = new Object();
			params.findFormName = $('[name=findFormName]').val();
			params.findFormPhone = $('[name=findFormPhone]').val();
			params.status = "EMAIL";

//			2. 유효성 검사 서비스로 이동
			var result = ${unit.ajax("searchidpw", "params")};
			if ( unit_isComplete(result) ){
				var jsonDetail = result.out.email.data;
				  $.each( jsonDetail, function( key, val) { 
					  var email = val.USER_EMAIL;	
					  var idx = email.indexOf("@");
					  var mail1 = email.substring(0, idx);
					  var mail2 = email.substring(idx+1);
					  var mail = mail1.substring(0, 2);
					  var mail3 = mail1.substring(2);
					  var mail4 = " ";
			          for(var i = 0; i < mail3.length; i++ ){
			        	  mail4 = mail4 + "*";
			          }
					  email = mail + mail4 + "@" +mail2 ;
					  
					  $('.seachemail').text(email);
						 fn_srchMailPopup();
				  });
			} else {
				alert("이름과 전화번호를 확인해주세요");
			}		
			}
	}
	
	function fn_srchMailPopup(){
		$("#screenCover").show(0);
		$("#modal_findEmail").show(0);
		
		$(".fn_modalSubmitCancel").click(function(){

			$("#modal_findEmail").hide(0);
			$("#screenCover").hide(0);
			 $('[name=findFormName]').val("");
			 $('[name=findFormPhone]').val("");
		});
	}
	
	//임시비밀번호 
	function fn_srchPW(){
		if( $("#findPFormName").val().length == 0 ){
			$("#findPFormName").focus();
			alert("이름을 입력해주세요.");
		}
		else if( $("#findPFormMail").val().length == 0 ){
			$("#findPFormMail").focus();
			alert("이메일을 입력해주세요.");
		}
		else if( $("#findPFormPhone").val().length == 0 ){
			$("#findPFormPhone").focus();
			alert("핸드폰 번호를 입력해주세요.");
		}
		else{
		//	1. 유효성 검사
			var params = new Object();
			params.findPFormName = $('[name=findPFormName]').val();
			params.findPFormMail = $('[name=findPFormMail]').val();
			params.findPFormPhone = $('[name=findPFormPhone]').val();			
			params.status = "PASSWORD";

//			2. 유효성 검사 서비스로 이동
			var result = ${unit.ajax("searchidpw", "params")};
			if ( unit_isComplete(result) ){
				alert("등록된 이메일로 임시 비밀번호가 전송 되었습니다.");
				 location.href='/front/membership/login';
			} else {
				alert("입력하신 정보를 확인해주세요");
			}
		}
	}
</script>
