<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<!-- 쓰기  시작-->	
<div class="remark" style="font-size:13px; padding-bottom:7px; margin-left:0;">'*' 항목은 필수입력 항목입니다.</div>			
<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>관리자 등록 테이블</caption>
		<colgroup>
			<col style="width: 20%;" />							
			<col  />	
		</colgroup>
		<tbody>
			<tr>
				<th scope="row"> 관리자 ID<span style="color:red;">*</span></th>
				<td>
					<div class="form-inline">					
						<input type="text" name="MNG_ID" class="form-control form-control-sm col-8 mr10" placeholder="" onchange="fn_BtnDupl(this.value)"/><span id="checkIdResult"></span>
						<!--사용가능 아이디 : alert_duplicate_id / 이미 사용중인 아이디 :  alert_used_id-->
					</div>
				</td>				
			</tr>		
			<tr>
				<th scope="row">관리자명<span style="color:red;">*</span></th>
				<td colspan="3"><input type="text" name="MNG_NM"  class="form-control form-control-sm col-8" placeholder="예)홍길동" /></td>
			</tr>	
			<tr>
				<th scope="row">비밀번호<span style="color:red;">*</span></th>
				<td><input type="password" name="MNG_PW"  class="form-control form-control-sm col-8" placeholder="영문+숫자 8자리 이상, 특수문자 사용 불가" /></td>
			</tr>
			<tr>
				<th scope="row">권한<span style="color:red;">*</span></th>
				<td><select id="MNG_PREV" name="MNG_PREV" class="form-control form-control-sm col-8"></select></td>
			</tr>
			<tr>
				<th scope="row" >사용여부</th>
				<td >
					<div class="designRadiobutton form-control-sm" >
						<input type="radio" id="radio1_1" name="MNG_USE_YN" value="Y" checked disabled/>
						<label for="radio1_1" class="label_txt">사용</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio1_2" name="MNG_USE_YN" value="N" disabled/>
						<label for="radio1_2" class="label_txt">중지</label>
					</div>
				</td>				
			</tr>								
		</tbody>
	</table>
</div>



<div class="btn_wrap">
	<a href='${unit.move("index", "" )}' class="btn  btn-md btn-outline-dark">목록</a>
	<a onclick='fn_BtnRegist()' class="btn  btn-md btn_key_color" >저장</a>
</div>

    
<script src="//cdn.rawgit.com/placemarker/jQuery-MD5/master/jquery.md5.js"></script>

<script type="text/javascript">

$(function(){
	 fn_SelectOptionNotCode("selectPrevNameList","MNG_PREV");
});

function fn_BtnRegist(){
	
	if ( !idIsc) return alert('사용할 수 없는 아이디입니다. 다른 아이디로 가입을 시도해주세요.');
	if ( $('[name=MNG_NM]').val().trim() == '' || $('[name=MNG_NM]').val().trim() == null ) return alert('관리자명을 입력해 주세요.');
	if ( $('[name=MNG_PW]').val().trim() == '' || $('[name=MNG_PW]').val().trim() == null ) return alert('비밀번호를 입력해주세요.');
	if( fn_pwTest( $('[name=MNG_PW]').val().trim() ) ) return alert('비밀번호 조건[영문+숫자 8자리 이상, 특수문자 사용 불가]에 맞게 작성해주세요.');
	if ($('[name=MNG_PREV]').val() == '' || $('[name=MNG_PREV]').val() == null) return alert('관리자 권한을 설정해주세요.');

	var params = unit_getParams("searchArea");
	params.status = "WRITE";
	params.query = "insertMngAdminData";
	params.mngPw =  $.md5( $('[name=MNG_PW]').val() );
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.PREV_IDX = $('[name=MNG_PREV]').val();
	var result = fn_DataAjax( params );
	location.href='${unit.move("index", "" )}';
}


</script>

