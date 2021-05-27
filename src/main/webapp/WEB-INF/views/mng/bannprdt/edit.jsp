<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'index', 'ajax')}" />

<style>
	.colorpickerBase {
		position: absolute;
	    width: 36px;
	    height: 36px;
	    background: url(/resources/images/colorpicker/select2.png);
	}
	.colorpickerBase > div{
		position: absolute;
	    top: 4px;
	    left: 4px;
	    width: 28px;
	    height: 28px;
	    background: url(/resources/images/colorpicker/select2.png) center;
	}
</style>
<!-- 쓰기  시작-->	
<div class="remark" style="font-size:13px; padding-bottom:7px; margin-left:0;">모든 값은 필수입력 항목입니다.</div>			
<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<input type="hidden" name="BANN_IDX" class="form-control form-control-sm col-8" />
		<caption>공지사항 관리 테이블</caption>
		<colgroup>
			<col style="width: 15%;"/>
			<col/>
			<col style="width: 15%;"/>
			<col style="width: 7%;"/>
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">구분</th>
				<td>
					<select id="BANN_TYPE" name="BANN_TYPE" class="form-control form-control-sm col-8" >
						<option value="">-- 구분 --</option>
					</select>
				</td>
			</tr>
			<tr>
				<th scope="row">공개여부</th>
				<td>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio2_1" name="BANN_USE_YN" checked value="Y" />
						<label for="radio2_1" class="label_txt">공개</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio2_2" name="BANN_USE_YN" value="N" />
						<label for="radio2_2" class="label_txt">비공개</label>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td>
					<div class="form-inline">
						<input type="text" name="BANN_TITL" class="form-control form-control-sm col-8"  placeholder="입력해주세요."/>
					</div>				
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<div class="fileArea">				
						<input type="file" id="BANN_UUID_FILE" name="BANN_UUID_FILE" style="display:none;margin-left:0px;" maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" 
								maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."
								maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."
								totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."
								onclick="imgIdValue = $(this).attr('id');"
						/>	
						<label class="btn btn-sm btn-outline-secondary" for="BANN_UUID_FILE" >파일선택</label>
											<span class="file_possible" style="color:red !important;">( 이미지사이즈- 1200px*320px ,이미지 파일 jpg, png, gif )</span>							
						<div class="fileList" id="BANN_UUID_FILEList"></div>
						<input id="BANN_UUID" name="BANN_UUID" type="hidden" />
						<div id="BANN_UUID_FILEListClone" style="display:none;">
						<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>
						</div>											
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">링크</th>
				<td>
					<div class="form-inline">
						<input type="text" name="BANN_LINK" class="form-control form-control-sm col-8 NOT_CHK"  placeholder="입력해주세요."/>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">노출순서</th>
				<td>
					<div class="form-inline">
						<input type="text" name="BANN_ORDR" class="form-control form-control-sm col-8"  placeholder="숫자만 입력 가능" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="btn_wrap">
	<a href='${unit.move("index", "" )}' class="btn  btn-md btn-outline-dark">목록</a>
	<a class="btn btn-md btn_key_color" onclick="fn_BtnRegist();">저장</a>
	<a href="#" class="btn btn-md btn-danger" style="margin-left:10px;" onclick="fn_BtnDelete();">삭제</a>
</div>



<link rel="stylesheet" media="screen" type="text/css" href="/resources/css/colorpicker.css" />
<script type="text/javascript" src="/resources/js/colorpicker.js"></script>
<script type="text/javascript">
$(function(){

// INFO |---------|-----------|-----------|-----------|-----------|---------|----------|----------|----------|------------| 
// INFO |BANN_IDX |BANN_TITL1 |BANN_TITL2 |BANN_SUBT1 |BANN_SUBT2 |BANN_CLR |BANN_UUID |BANN_LINK |BANN_ORDR |BANN_USE_YN | 
// INFO |---------|-----------|-----------|-----------|-----------|---------|----------|----------|----------|------------| 
// INFO |5        |5          |5          |5          |5          |#ff8939  |          |5         |4         |Y           | 
// INFO |---------|-----------|-----------|-----------|-----------|---------|----------|----------|----------|------------| 
	 
	 
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectMngBannprdtDetail";
	params.bannIdx = '${out.params.bannIdx }';
	var jsonDetail = fn_DataDetail( params );

	fn_SelectOption("", "PRD", "BANN_TYPE");
	$('[name=BANN_TYPE] option[value="PRD02"]').remove();
	$('[name=BANN_TYPE] option[value="PRD03"]').remove();
	$('[name=BANN_TYPE] option[value="PRD04"]').remove();
	$('[name=BANN_TYPE]').val( jsonDetail[0].BANN_TYPE );
	
});

function fn_BtnRegist(){
	
	var params = unit_getParams("searchArea");
	params.status = "EDIT";
	params.query = "updateMngBannprdtData";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	
	var result = fn_DataAjax( params );
	if( result ) location.href='${unit.move("index", "" )}';
}


function fn_BtnDelete(){

	if( confirm('해당 게시글을 삭제하시겠습니까?') ) {

		var params = unit_getParams("searchArea");
		params.status = "DELETE";
		params.query = "deleteMngBannprdtData";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		
		var result = fn_DataAjax( params );
		if( result ) location.href='${unit.move("index", "" )}';
	}
}

</script>




















