<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />


<div class="remark" style="font-size:13px; padding-bottom:7px; margin-left:0;">'*' 항목은 필수입력 항목입니다.</div>	
<!-- 수정  시작-->				
<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>공지사항 관리 테이블</caption>
		<colgroup>
			<col style="width: 15%;"/>
			<col/>
			<col style="width: 15%;"/>
			<col style="width: 7%;"/>
		</colgroup>
		<tbody>
			<tr>
				<th scope="col">등록자</th>
				<td >
					<input disabled="disabled" type="text" name="SYS_REG_NM" class="form-control form-control-sm col-8"   />
				</td>
			</tr>
			<tr>
				<th scope="col">등록일</th>
				<td>
					<input disabled="disabled" type="text" name="SYS_REG_DTM" class="form-control form-control-sm col-8"   />
				</td>
			</tr>
			<tr>
				<th scope="row">구분</th>
				<td>
					<div class="form-inline">
						<select id="NOTI_CD" name="NOTI_CD" class="form-control form-control-sm col-8" title="구분 영역" >
							<option value="">-- 구분 --</option>
						</select>
					</div>	
				</td>
			</tr>
			<tr>
				<th scope="row">제목<span style="color:red;">*</span></th>
				<td>
					<div class="form-inline">
						<input type="hidden" id="NOTI_IDX" name="NOTI_IDX" >
						<input type="text" id="NOTI_TITL" name="NOTI_TITL" class="form-control form-control-sm col-8" title="제목 입력"  placeholder="제목을 입력해주세요." />
						<div class="designCheckbox form-control-sm ml20">
							<input type="checkbox" id="NOTI_OPEN_YN" name="NOTI_OPEN_YN" />
							<label for="NOTI_OPEN_YN" class="label_txt">공지</label>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">공개여부<span style="color:red;">*</span></th>
				<td>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio2_1" name="NOTI_USE_YN" value="Y"   /> 
						<label for="radio2_1" class="label_txt">Y</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio2_2" name="NOTI_USE_YN" value="N"  />
						<label for="radio2_2" class="label_txt">N</label>
					</div>				
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<div class="fileArea">				
						<input type="file" id="NOTI_UUID_FILE" name="NOTI_UUID_FILE" style="display:none;margin-left:0px;" multiple maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" 
								maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."
								maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."
								totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."
								onclick="imgIdValue = $(this).attr('id');"
						/>	
						<label class="btn btn-sm btn-outline-secondary" for="NOTI_UUID_FILE" >파일선택</label>
											<span class="file_possible" style="color:red !important;">( 모든 파일 구분, 다중 선택 가능 )</span>							
						<div class="fileList" id="NOTI_UUID_FILEList"></div>
						<input id="NOTI_UUID" name="NOTI_UUID" type="hidden" />
						<div id="NOTI_UUID_FILEListClone" style="display:none;">
						<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>
						</div>											
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">내용<span style="color:red;">*</span></th>
				<td>
					<textarea id="NOTI_CNTN" name="NOTI_CNTN" ></textarea>
				</td>
			</tr>					
		</tbody>
	</table>
</div>

<div class="btn_wrap">
	<a href='${unit.move("index", "" )}' class="btn  btn-md btn-outline-dark">목록</a>
	<a onclick="fn_BtnRegist()" class="btn btn-md btn_key_color" style="margin-right: 10px;">저장</a>
	<a href="#" class="btn btn-md btn-danger" onclick="fn_BtnDelete();">삭제</a>
</div>

<!-- 수정 끝 -->

<script type="text/javascript">

$(function(){

	fn_SelectOption( '', 'NOT', 'NOTI_CD' );
	
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectMngNotiDetail";
	params.notiIdx = '${out.params.notiIdx }';
	fn_DataDetail( params );
	
	fn_makeSummerNote( 'NOTI_CNTN' );
	
});

function fn_BtnRegist(){
	
	if ( $('[name=NOTI_TITL]').val().trim() == '' || $('[name=NOTI_TITL]').val().trim() == null ) return alert('제목을 입력해 주세요.');
	if ( $('[name=NOTI_CNTN]').val().trim() == '' || $('[name=NOTI_CNTN]').val().trim() == null ) return alert('내용을 입력해 주세요.');

	var params = unit_getParams("searchArea");
	params.status = "EDIT";
	params.query = "updateMngNotiData";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	
	if ( $('[name=NOTI_OPEN_YN]').is(':checked') ) {
		params.NOTI_OPEN_YN = 'Y';
	}else{
		params.NOTI_OPEN_YN = 'N';
	}
	
	
	var result = fn_DataAjax( params );
	if( result ) location.href='${unit.move("index", "" )}';
}


function fn_BtnDelete(){

	if( confirm('해당 게시글을 삭제하시겠습니까?') ) {

		var params = unit_getParams("searchArea");
		params.status = "DELETE";
		params.query = "deleteMngNotiData";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		
		var result = fn_DataAjax( params );
		if( result ) location.href='${unit.move("index", "" )}';
	}
}




</script>










