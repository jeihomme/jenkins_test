<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

	
<!-- 수정  시작-->				
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
				<td id="SYS_REG_DTM">
					<input type="text" name="SYS_REG_DTM" class="form-control form-control-sm col-8" readonly/>
				</td>
			</tr>	
			<tr>
				<th scope="row">등록자</th>
				<td id="SYS_REG_NM">
					<input type="text" name="SYS_REG_NM" class="form-control form-control-sm col-8" readonly/>
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
				<th scope="row">제목<span style="color:red;">*</span></th>
				<td>
					<div class="form-inline">
						<input type="text" name="FAQ_TITL" class="form-control form-control-sm col-8" title="제목 입력" />
					</div>				
				</td>
			</tr>
			
			<tr>
				<th scope="row">내용<span style="color:red;">*</span></th>
				<td>
					<textarea id="FAQ_CNTN" name="FAQ_CNTN" title="내용 입력"></textarea>
				</td>
			</tr>	
			<tr>
				<th scope="row">노출여부<span style="color:red;">*</span></th>
				<td>
					<div class="form-inline">
						<input type="checkbox" id="FAQ_USE_YN" name="FAQ_USE_YN" class="input_on-off" onchange="updateUseYn(${out.params.faqIdx }, this.checked, 'updateMngUseYn');" >
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
	<a href="#" class="btn btn-md btn-danger" onclick="alertShow('300','','alert_del');">삭제</a>
</div>

    <!-- 데이타 삭제 -->
<div id="alert_del" class="alert_wrap">
	<div class="alert_layer">
		<div class="alert_inner">
			<div class="alert_header">
				<button class="btn btn_close_pop" data-action="popup_hide">X</button>
			</div>				
			<div class="dialog_content">
				<div class="scroll_area">
					<!-- Start 팝업 컨텐츠 -->

					<div class="alert_msg_area">
						<div class="alert_msg">
							삭제하시겠습니까?
						</div>
					</div>

					<div class="btn_wrap">
						<button type="button" onclick="fn_BtnDelete()" class="btn  btn-md btn-dark" data-action="popup_hide">확인</button>					
						<button type="button" class="btn  btn-md btn-outline-dark" data-action="popup_hide">취소</button>
					</div>

					<!--// End 팝업 컨텐츠 -->
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
$(function(){
	fn_SelectOption( '', 'FAQ', 'FAQ_CD' );
	
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectMngFaqDetail";
	params.faqIdx = '${out.params.faqIdx }';
	fn_DataDetail( params );
    
	fn_makeSummerNote( 'FAQ_CNTN' );
	
});


function fn_BtnRegist(){
	
	if ( $('[name=FAQ_TITL]').val().trim() == '' || $('[name=FAQ_TITL]').val().trim() == null ) return alert('제목을 입력해 주세요.');
	if ( $('[name=FAQ_CNTN]').val().trim() == '' || $('[name=FAQ_CNTN]').val().trim() == null ) return alert('내용을 입력해 주세요.');
	if ( $('[name=FAQ_CD]').val() == '' ) return alert('질문종류를 선택해주세요.');
	
	var params = unit_getParams("searchArea");
	params.status = "EDIT";
	params.query = "updateMngFaqData";
	params.faqIdx = '${out.params.faqIdx }';
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	
	if( $('input:checkbox[name=FAQ_USE_YN]').is(':checked') ) params.FAQ_USE_YN = 'Y';
	else params.FAQ_USE_YN = 'N';
	
	var result = fn_DataAjax( params );
	location.href='${unit.move("index", "" )}';
}

function fn_BtnDelete(){
	var params = unit_getParams("searchArea");
	params.status = "DELETE";
	params.query = "deleteMngFaqData";
	params.faqIdx = '${out.params.faqIdx }';
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	
	var result = fn_DataAjax( params );
	location.href='${unit.move("index", "" )}';
	
}


</script>

