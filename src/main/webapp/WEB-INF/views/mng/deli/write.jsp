<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
	

<style type="text/css">
.fileArea { margin-left:10px; margin-bottom:10px; }
.fileList { background-color:#ececec; border-radius:5px; padding:10px; display:none; }
.fileList div { font-size:12px; line-height: 20px; }
.fileList span.close { font-size:11px; color:red; padding-left:15px; cursor:pointer; }
	.chkbutton{
		    position: relative;
		    display: inline-block;
		    float: right;
		    width: 18%;
		    margin-left: 2%;
		    height: 30px;
		    border-radius: 3px;
		    background-color: #fff;
		    border: 1px solid #848484;
		    color: #848484;
		    vertical-align: middle;
		    font-size: 13px;
		    cursor: pointer;
		    word-break: keep-all;
	}
</style>


<!-- 쓰기  시작-->	
<div class="remark" style="font-size:13px; padding-bottom:7px; margin-left:0;">'*'은 필수입력 항목입니다.</div>			
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
				<th scope="row">제목</th>
				<td>
					<div class="form-inline">
						<input type="text" name="NOTI_TITL" class="form-control form-control-sm col-8" title="제목 입력"  placeholder="제목을 입력해주세요."/>
<!-- 						<div class="designCheckbox form-control-sm ml20"> -->
<!-- 							<input type="checkbox" id="checkbox0" name="NOTI_OPEN_YN" /> -->
<!-- 							<label for="checkbox0" class="label_txt">공지</label> -->
<!-- 						</div> -->
					</div>				
				</td>
			</tr>
<!-- 			<tr> -->
<!-- 				<th scope="row">구분</th> -->
<!-- 				<td> -->
<!-- 					<div class="designRadiobutton form-control-sm"> -->
<!-- 						<input type="radio" id="radio1_1" name="radio1" checked  /> -->
<!-- 						<label for="radio1_1" class="label_txt">공지사항</label> -->
<!-- 					</div> -->
<!-- 					<div class="designRadiobutton form-control-sm"> -->
<!-- 						<input type="radio" id="radio1_2" name="radio1" /> -->
<!-- 						<label for="radio1_2" class="label_txt">이벤트</label> -->
<!-- 					</div>				 -->
<!-- 					<div class="designRadiobutton form-control-sm"> -->
<!-- 						<input type="radio" id="radio1_3" name="radio1" /> -->
<!-- 						<label for="radio1_3" class="label_txt">보도자료</label> -->
<!-- 					</div> -->
<!-- 				</td> -->
<!-- 			</tr> -->
			<tr>
				<th scope="row">공지여부</th>
				<td>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio1_1" name="NOTI_OPEN_YN" checked value="Y" />
						<label for="radio1_1" class="label_txt">설정</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio1_2" name="NOTI_OPEN_YN" value="N" />
						<label for="radio1_2" class="label_txt">해제</label>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">공개여부</th>
				<td>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio2_1" name="NOTI_USE_YN" checked value="Y" />
						<label for="radio2_1" class="label_txt">공개</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio2_2" name="NOTI_USE_YN" value="N" />
						<label for="radio2_2" class="label_txt">비공개</label>
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
				<th scope="row">내용</th>
				<td>
					<textArea id="NOTI_CNTN" name="NOTI_CNTN"></textArea>
				</td>
			</tr>					
		</tbody>
	</table>
</div>

<div class="btn_wrap">
	<a href='${unit.move("index", "" )}' class="btn  btn-md btn-outline-dark">목록</a>
	<a class="btn btn-md btn_key_color" onclick="fn_BtnRegist();">저장</a>
</div>

<!-- ckeditor.js -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script> -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/inline/ckeditor.js"></script> -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/balloon-block/ckeditor.js"></script> -->

<script type="text/javascript">
$(function(){
	 $('#NOTI_CNTN').summernote({
		height: 300,                 // 에디터 높이
		minHeight: null,             // 최소 높이
		maxHeight: null,             // 최대 높이
		focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		placeholder: '내용을 입력해주세요.',	//placeholder 설정
		defaultFontName: '돋음체',
		toolbar: [
		    // [groupName, [list of button]]
		    ['fontname', ['fontname']],
		    ['fontsize', ['fontsize']],
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    ['color', ['forecolor','color']],
		    ['table', ['table']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['insert',['picture','link','video']],
//  		    ['view', ['fullscreen', 'help']]
			],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
	});
});

function fn_BtnRegist(){
	
	if ( $('[name=NOTI_TITL]').val().trim() == '' || $('[name=NOTI_TITL]').val().trim() == null ) return alert('제목을 입력해 주세요.');
	if ( $('[name=NOTI_CNTN]').val().trim() == '' || $('[name=NOTI_CNTN]').val().trim() == null ) return alert('내용을 입력해 주세요.');
	
	var params = unit_getParams("searchArea");
	params.status = "WRITE";
	params.query = "insertMngNotiData";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	
	var result = fn_DataAjax( params );
	location.href='${unit.move("index", "" )}';
}

</script>

