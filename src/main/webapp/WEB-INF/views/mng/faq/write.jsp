<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
	
<!-- 쓰기  시작-->	
<div class="remark" style="font-size:13px; padding-bottom:7px; margin-left:0;">'*' 항목은 필수입력 항목입니다.</div>			
<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>FAQ 관리 테이블</caption>
		<colgroup>
			<col style="width: 15%;"/>
			<col/>
			<col style="width: 15%;"/>
			<col style="width: 7%;"/>
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">등록일</th>
				<td>
					<div class="form-inline" id="sysdate">
					</div>				
				</td>
			</tr>
			<tr>
				<th scope="row">등록자</th>
				<td>
					<div class="form-inline" id="writer">
					</div>				
				</td>
			</tr>
			<tr>
				<th scope="row">제목<span style="color:red;">*</span></th>
				<td>
					<div class="form-inline">
						<input type="text" name="FAQ_TITL" class="form-control form-control-sm col-8" title="제목 입력" />
					</div>				
				</td>
			</tr>
			
			<tr>
				<th scope="row">구분<span style="color:red;">*</span></th>
				<td>
					<div class="form-inline">
						<select id="FAQ_CD" name="FAQ_CD" class="form-control form-control-sm col-8" title="노출 영역" >
							<option value="">-- 구분 --</option>
						</select>
					</div>				
				</td>
			</tr>
			<tr>
				<th scope="row">내용<span style="color:red;">*</span></th>
				<td>
					<textarea class="designTextarea form-control form-control-sm" name="FAQ_CNTN" id="FAQ_CNTN" style="width:100%; " title="내용 입력"></textarea>
				</td>
			</tr>	
			<tr>
				<th scope="row">노출여부<span style="color:red;">*</span></th>
				<td>
					<div class="form-inline">
						<input type="checkbox" id="FAQ_USE_YN" name="FAQ_USE_YN" class="input_on-off">
						 <label for="FAQ_USE_YN" class="label_on-off"> 
						   <span class="marble"></span>
						   <span class="on">공개</span>
						   <span class="off">비공개</span>
						 </label>
					</div>				
				</td>
			</tr>				
		</tbody>
	</table>
</div>


<div class="btn_wrap">
	<a href='${unit.move("index", "" )}' class="btn  btn-md btn-outline-dark" >목록</a>
	<a class="btn btn-md btn_key_color" onclick="fn_BtnRegist();" >저장</a>
</div>

<script type="text/javascript">
var oEditors = [];
$(function(){
	// 등록일 값 넣어줌
	let date = new Date();
	let dateString = ''+date.getFullYear() +'-'+ ('0'+(date.getMonth()+1)).slice(-2) +'-'+ ('0'+date.getDate()).slice(-2);
	$('#sysdate').text( dateString );
	// 등록자 값 넣어줌
	$('#writer').text( localStorage.getItem("mngLoginNm") );
	
	fn_SelectOption( '', 'FAQ', 'FAQ_CD' );
	
	fn_makeSummerNote( 'FAQ_CNTN' );
	
});


function fn_BtnRegist(){
	
	if ( $('[name=FAQ_TITL]').val().trim() == '' || $('[name=FAQ_TITL]').val().trim() == null ) return alert('제목을 입력해 주세요.');
	if ( $('[name=FAQ_CNTN]').val().trim() == '' || $('[name=FAQ_CNTN]').val().trim() == null ) return alert('내용을 입력해주세요.');
	if ( $('[name=FAQ_CD]').val() == '' ) return alert('질문종류를 선택해주세요.');
	
	var params = unit_getParams("searchArea");
	params.status = "WRITE";
	params.query = "insertMngFaqData";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	
	// 노출여부 공개
	if( $('input:checkbox[name=FAQ_USE_YN]').is(':checked') ) params.FAQ_USE_YN = 'Y';
	else params.FAQ_USE_YN = 'N';
	
	var result = fn_DataAjax( params );
	location.href='${unit.move("index", "" )}';
}

</script>

