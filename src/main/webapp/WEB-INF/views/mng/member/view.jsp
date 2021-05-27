<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<div class="gnb_box">
                <ul class="gnb_list">
                    <li class="active" onclick="location.href='${unit.move('view', out.params.userIdx, 'user' ) }'">
                        <a href="${unit.move('view', out.params.userIdx, 'user' ) }">
                            기본
                        </a>
                    </li>
                    <li onclick="location.href='${unit.move('tab', out.params.userIdx, 'user', 'network' ) }'">
                        <a href="${unit.move('tab', out.params.userIdx, 'user', 'network' ) }">
                            인맥
                        </a>
                    </li>
                    <li onclick="location.href='${unit.move('tab', out.params.userIdx, 'user', 'lect' ) }'">
                        <a href="${unit.move('tab', out.params.userIdx, 'user', 'lect' ) }">
                            수강
                        </a>
                    </li>
                    <li onclick="location.href='${unit.move('tab', out.params.userIdx, 'user', 'cons' ) }'">
                        <a href="${unit.move('tab', out.params.userIdx, 'user', 'cons' ) }">
                            상담
                        </a>
                    </li>
                </ul>
</div>

<!-- 조회  시작-->				
<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<input id="USER_IDX" type="hidden" />
		<caption>회원정보 관리 테이블</caption>
		<colgroup>
			<col style="width: 15%;" />
			<col  />
			<col  style="width: 15%;"/>
			<col  />
		</colgroup>
		<tbody>
			<tr>
				<th scope="col">회원명</th>
				<td id="USER_NM"></td>
				<th scope="col">계정</th>
				<td id="USER_EMAIL"></td>
			</tr>
			<tr>
				<th scope="col">닉네임</th>
				<td id="USER_NICK"></td>
				<th scope="col">연락처</th>
				<td id="USER_PHONE"></td>
<!-- 				<th scope="col">성별</th> -->
<!-- 				<td id="USER_GENDER"></td> -->
			</tr>
			<tr>
				<th scope="col">가입일</th>
				<td id="SYS_REG_DTM"></td>
				<th scope="col">가입수단</th>
				<td id="USER_SNS_TYPE_NM"></td>
			</tr>
<!-- 			<tr> -->
<!-- 				<th scope="col">생년월일</th> -->
<!-- 				<td id="USER_BIRTH"></td> -->
<!-- 				<th scope="col">지역</th> -->
<!-- 				<td id="USER_ZONE"></td> -->
<!-- 			</tr> -->
			<tr>
				<th scope="col">이메일 수신동의</th>
				<td colspan="3" id="USER_MAIL_YN">
				</td>
			</tr>
			<tr>
				<th scope="col">SMS/LMS 수신 동의</th>
				<td colspan="3" id="USER_SMS_YN"></td>
			</tr>
			<tr>
				<th scope="col">최근로그인</th>
				<td colspan="3" id="USER_LOGIN_DTM"></td>
			</tr>
			<tr>
				<th scope="col">상태</th>
				<td colspan="3" id="USER_STATE"></td>
			</tr>
			<tr>
				<th scope="col">관리</th>
				<td colspan="3" id="USER_STATE_OUT"><a onclick="fn_BtnDetelePopup();">탈퇴</a></td>
			</tr>
		</tbody>
	</table>
</div>

<div class="btn_wrap">
	<a id="refreshPw" href="javascript:;" onclick="fn_BtnPwInitPopup();" class="btn btn-md btn_key_color" style="width: auto;">비밀번호 초기화</a>
	<a href="${ unit.move('index', '') }" class="btn btn-md btn-outline-dark">목록</a>
<%-- 	<a href="${ unit.move('edit', out.detail.data[0].USER_IDX , 'mng' ) }" class="btn btn-md btn_key_color">수정</a> --%>
</div>

<!-- 데이타 삭제 -->
<div id="alert_del" class="alert_wrap">
	<div class="alert_layer">
		<div class="alert_inner">
			<div class="alert_header" style="padding: 4px; border-bottom: 1px solid #d2d2d2;">
				<span>피플메이드</span>
				<button class="btn btn_close_pop" data-action="popup_hide">X</button>
			</div>				
			<div class="dialog_content">
				<div class="scroll_area">
					<!-- Start 팝업 컨텐츠 -->

					<div class="alert_msg_area">
						<div class="alert_msg" style="text-align: left;">
							탈퇴를 진행하시겠습니까?<br>
							회원 정보는 1년 후 완전 삭제되며 해당 기간 동안<br>
							동일 아이디로 재 가입이 불가 합니다.
						</div>
					</div>

					<div class="btn_wrap">
						<button type="button" onclick="fn_BtnDelete();" class="btn btn-md btn_key_color" data-action="popup_hide">확인</button>					
						<button type="button" class="btn  btn-md btn-danger" data-action="popup_hide">취소</button>
					</div>

					<!--// End 팝업 컨텐츠 -->
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 데이타 삭제 -->
<div id="alert_init" class="alert_wrap">
	<div class="alert_layer">
		<div class="alert_inner">
			<div class="alert_header" style="padding: 4px; border-bottom: 1px solid #d2d2d2;">
				<span>피플메이드</span>
				<button class="btn btn_close_pop" data-action="popup_hide">X</button>
			</div>				
			<div class="dialog_content">
				<div class="scroll_area">
					<!-- Start 팝업 컨텐츠 -->

					<div class="alert_msg_area">
						<div class="alert_msg" style="text-align: left;">
							비밀번호 초기화를 진행하시겠습니까?
						</div>
					</div>

					<div class="btn_wrap">
						<button type="button" onclick="fn_BtnPwInit();" class="btn btn-md btn_key_color" data-action="popup_hide">확인</button>					
						<button type="button" class="btn  btn-md btn-danger" data-action="popup_hide">취소</button>
					</div>

					<!--// End 팝업 컨텐츠 -->
				</div>
			</div>
		</div>
	</div>
</div>

<script src="//cdn.rawgit.com/placemarker/jQuery-MD5/master/jquery.md5.js"></script>

<!-- 조회 끝 -->	
<script>
// setUuid( $('[name=unitUuid]').val() );
// imgIdValue = "NOTI_UUID_FILE";
// unit_fileGet( imgIdValue, "fn_fileUpload");

$(function(){
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectMngMemberDetail";
	params.userIdx = '${out.params.userIdx }';
	fn_DataDetail( params );
	
	if( $('#USER_STATE').text() == '탈퇴' ) {
		$('#USER_STATE_OUT').parent('tr').remove();
		$('#refreshPw').remove();
	}
});


function fn_BtnDetelePopup() {
	alertShow('400','','alert_del');
}

function fn_BtnDelete(){
	var params = unit_getParams("searchArea");
	params.status = "DELETE";
	params.query = "deleteMngMemberData";
	params.userIdx = '${out.params.userIdx }';
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	var result = fn_DataAjax( params );
	
	location.href='${unit.move("index", "" )}';
}

function fn_BtnPwInitPopup(){
	alertShow('400','','alert_init');
}

function fn_BtnPwInit(){
	var params = unit_getParams("searchArea");
	params.status = "EDIT"; 
	params.query = "updateMngMemberData";
	params.userIdx = '${out.params.userIdx }';
	params.USER_PW = $.md5( 'abcd1234' );
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	var result = fn_DataAjax( params );
	
	location.reload();
}
</script>
