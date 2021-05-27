<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<!-- 수정  시작-->				
<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>1:1문의 관리 테이블</caption>
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
					<div class="form-inline">
						<input disabled="disabled" type="text" name="QNA_CDNM" class="form-control form-control-sm col-8"   />
					</div>	
				</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td>
					<div class="form-inline">
						<input type="hidden" name="QNA_IDX" value="${out.params.qnaIdx }">
						<input disabled="disabled" type="text" name="QNA_TITL" class="form-control form-control-sm col-8" title="제목 입력"  />
					</div>				
				</td>
			</tr>
			<tr>
				<th scope="row">회원명</th>
				<td>
					<div class="form-inline">
						<input disabled="disabled" type="text" name="USER_NM" class="form-control form-control-sm col-8" title="제목 입력"  />
					</div>				
				</td>
			</tr>
			<tr>
				<th scope="row">회원ID</th>
				<td>
					<div class="form-inline">
						<input disabled="disabled" type="text" name="USER_EMAIL" class="form-control form-control-sm col-8" title="제목 입력"  />
					</div>				
				</td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td>
					<textarea class="designTextarea form-control form-control-sm" name="QNA_CNTN"  style="width:100%;height:200px;resize:none;" title="내용" readonly ></textarea>
				</td>
			</tr>
			<tr>
				<th>문의 첨부파일</th>
				<td>
					<div class="fileArea">					
						<div class="fileList" id="QNA_USER_UUID_FILEList"></div>
						<input id="QNA_USER_UUID" name="QNA_USER_UUID" type="hidden" />
						<div id="QNA_USER_UUID_FILEListClone" style="display:none;">
						<div><span class="fileName"></span> (<span class="fileSize"></span> MB)</div>
						</div>											
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">답변등록일</th>
				<td>
					<div class="form-inline">
						<input disabled="disabled" type="text" name="SYS_MOD_DTM" class="form-control form-control-sm col-8" title="제목 입력"  />
					</div>				
				</td>
			</tr>
			<tr>
				<th scope="row">등록자</th>
				<td>
					<div class="form-inline">
						<input disabled="disabled" type="text" name="MASTER_NM" class="form-control form-control-sm col-8" title="제목 입력"  />
					</div>				
				</td>
			</tr>
			<tr>
				<th scope="row">답변</th>
				<td>
					<textarea id="QNA_REPL" name="QNA_REPL" title="답변 입력" >${out.detail.data[0].QNA_REPL}</textarea>
				</td>
			</tr>
			<tr>
				<th>답변 첨부파일</th>
				<td>
					<div class="fileArea">				
						<input type="file" id="QNA_MNG_UUID_FILE" name="QNA_MNG_UUID_FILE" style="display:none;margin-left:0px;" multiple maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" 
								maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."
								maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."
								totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."
								onclick="imgIdValue = $(this).attr('id');"
						/>	
						<label class="btn btn-sm btn-outline-secondary" for="QNA_MNG_UUID_FILE" >파일선택</label>
											<span class="file_possible" style="color:red !important;">( 모든 파일 구분, 다중 선택 가능 )</span>							
						<div class="fileList" id="QNA_MNG_UUID_FILEList"></div>
						<input id="QNA_MNG_UUID" name="QNA_MNG_UUID" type="hidden" />
						<div id="QNA_MNG_UUID_FILEListClone" style="display:none;">
						<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>
						</div>											
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="btn_wrap">
<!-- 	<a href="./notice" class="btn btn-md btn-dark">목록</a> -->
	<a href="${ unit.move('index', '') }" class="btn btn-md btn-outline-dark">목록</a>
	<a onclick="fn_BtnRegist()" class="btn btn-md btn_key_color">저장</a>
</div>

<!-- 수정 끝 -->


<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
<script src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script>

<script type="text/javascript">
// setUuid( '${out.detail.data[0].QNA_USER_UUID}' );	
// imgIdValue = "QNA_USER_UUID_FILE";
// unit_fileGet( imgIdValue, "fn_fileUpload");

// setUuid( '${out.detail.data[0].QNA_MNG_UUID}' );	
// imgIdValue = "QNA_MNG_UUID_FILE";
// unit_fileGet( imgIdValue, "fn_fileUpload");



$(function(){

	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectMngQnaDetail";
	params.qnaIdx = '${out.params.qnaIdx }';
	fn_DataDetail( params );
	
	$('[name=QNA_CNTN]').val( replaceHtmlLang( $('[name=QNA_CNTN]').val() ) );
	
	fn_makeSummerNote( 'QNA_REPL' );
	
});

function fn_BtnRegist(){
	
	if ( $('[name=QNA_REPL]').val().trim() == '' || $('[name=QNA_REPL]').val().trim() == null ) return alert('내용을 입력해 주세요.');

	var params = unit_getParams("searchArea");
	params.status = "EDIT";
	params.query = "updateMngQnaData";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	
	var result = fn_DataAjax( params, "N" );
	location.href='${unit.move("index", "" )}';
}

function replaceHtmlLang( text ){
	text = text.replace(/&lt;/g,"<");   
	text = text.replace(/&gt;/g,">");   
	text = text.replace(/&quot;/g,'"');
	text = text.replace(/&#39;/g,"'"); 
	text = text.replace(/<br \/>/g,"\n");
	text = text.replace(/&#63;/g,"?");
	return text.replace(/&amp;/g,"&");
}

</script>