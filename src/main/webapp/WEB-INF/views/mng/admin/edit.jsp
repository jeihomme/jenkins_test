<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<!-- 수정  시작-->				
<div class="remark" style="font-size:13px; padding-bottom:7px; margin-left:0;">'*' 항목은 필수입력 항목입니다.</div>	
<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>관리자 수정 테이블</caption>
		<colgroup>
			<col style="width: 20%;" />							
			<col  />	
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">관리자 ID</th>
				<td>
					<div class="form-inline">
						<input type="hidden" name="MNG_IDX" class="form-control form-control-sm col-4 mr10"  disabled/>
						<input type="text"  name="MNG_ID" class="form-control form-control-sm col-4 mr10" placeholder="" disabled/>
						<!--사용가능 아이디 : alert_duplicate_id / 이미 사용중인 아이디 :  alert_used_id-->
					</div>
				</td>	
			</tr>
			<tr>
				<th scope="row">관리자명<span style="color:red;">*</span></th>
				<td colspan="3"><input type="text" name="MNG_NM"   class="form-control form-control-sm col-8" placeholder="예)홍길동" /></td>
			</tr>	
			<tr>
				<th scope="row">비밀번호</th>
				<td><input type="password" name="MNG_PW"  class="form-control form-control-sm col-8" placeholder="영문+숫자 8자리 이상" /></td>
			</tr>
			<tr>
				<th scope="row">권한<span style="color:red;">*</span></th>
				<td><select id="MNG_PREV" name="MNG_PREV" class="form-control form-control-sm col-8"></select></td>
			</tr>
			<tr>
				<th scope="row" >사용여부<span style="color:red;">*</span></th>
				<td >
					<div class="designRadiobutton form-control-sm" >
						<input type="radio" id="radio2_Y" name="MNG_USE_YN" value="Y"  />
						<label for="radio2_Y" class="label_txt">사용</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio2_N" name="MNG_USE_YN" value="N" />
						<label for="radio2_N" class="label_txt">중지</label>
					</div>
				</td>
			</tr>						
		</tbody>
	</table>
</div>

<div class="btn_wrap">
	<a href='${unit.move("index", "" )}' class="btn  btn-md btn-outline-dark">목록</a>
	<a onclick='fn_BtnEditSave()' class="btn  btn-md btn_key_color" style="color:white;">저장</a>
</div>

<!-- 수정 끝 --><script src="//cdn.rawgit.com/placemarker/jQuery-MD5/master/jquery.md5.js"></script>
<script type="text/javascript">
var params = new Object();
params.status = "DETAIL";
params.query = "selectMngAdminDetail";
params.mngIdx = '${out.params.mngIdx }';

$(function(){
	 fn_SelectOptionNotCode("selectPrevNameList","MNG_PREV");
	 fn_DataDetail( params );
});

function fn_BtnEditSave(){
	
	if ( $('[name=MNG_NM]').val().trim() == '' || $('[name=MNG_NM]').val().trim() == null ) return alert('관리자명을 입력해 주세요.');
	if ($('[name=MNG_PW]').val() != '' && $('[name=MNG_PW]').val() != null) if( fn_pwTest( $('[name=MNG_PW]').val().trim() ) ) return alert('비밀번호 조건에 맞게 작성해주세요.');
	if ($('[name=MNG_PREV]').val() == '' || $('[name=MNG_PREV]').val() == null) return alert('관리자 권한을 설정해주세요.');
	
	var params = unit_getParams("searchArea");
	params.status = "EDIT";
	params.query = "updateMngAdminData";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	if ($('[name=MNG_PW]').val() != '' && $('[name=MNG_PW]').val() != null) params.mngPw = $.md5( $('[name=MNG_PW]').val() );
	params.mngUseYn =	$('input:radio[name=MNG_USE_YN]:checked').val();
	params.PREV_IDX = $('[name=MNG_PREV]').val();
	var result = fn_DataAjax2( params );
	
	if (params.PREV_IDX != "") {
		alert('권한이 변경되었습니다. \n변경된 권한은 다음 로그인부터 적용됩니다.');
	}
	
	location.href = "${unit.move('index','')}";
	
	
}
</script>