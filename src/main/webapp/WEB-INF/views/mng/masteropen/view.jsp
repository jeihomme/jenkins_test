<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'index', 'ajax')}" />

<style>
.infoView{ border: 1px solid #222; margin-bottom: 10px; }
.infoView > div{padding: 5px; position: relative;}
.gnb_box { margin-bottom: 0; }
.gnb_list>li {width: 50%!important;}
.gnb_list>li.active { background-color: #333; }
.note-toolbar {background-color: #fff!important; border: none!important;}
.panel-default{flex: 0 0 83.333333%;   max-width: 83.333333%; width: 100%!important;}
/* .tool_box{position: absolute; top: 50%; right: 2.5%;} */
.tool_box{position: absolute; top: 5%;right: 1%;}
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
.infoView > div > *{
	margin-bottom: 5px;
}
input[name=INFO_TITL]{display: inline-block; color: #ff8939;}

@media screen
and (max-device-width : 1200px){
	.file_possible{ display: block; }
}

</style>

<link rel="stylesheet" media="screen" type="text/css" href="/resources/css/colorpicker.css" />
<script type="text/javascript" src="/resources/js/colorpicker.js"></script>

<!-- 조회  시작-->				
<div class="tbl_view" style="margin-bottom: 20px;">
	<table class="view_tbl01" summary="">
		<colgroup>
			<col style="width: 15%;" />
			<col  />
			<col style="width: 15%;" />
			<col  />
		</colgroup>
		<tbody id="UserTable">
			<tr>
				<th scope="row">마스터명</th>
				<td id="USER_NM"></td>
				<th scope="row">계정</th>
				<td id="USER_EMAIL"></td>
			</tr>
			<tr>
				<th scope="row">분야</th>
				<td id="CODE_PARENT_NM"></td>
				<th scope="row">분야상세</th>
				<td id="CODE_NM"></td>
			</tr>
			<tr>
				<th scope="row">최근로그인</th>
				<td id="USER_LOGIN_DTM"></td>
				<th scope="row">최근상담일</th>
				<td id="USER_CONS_DTM"></td>
			</tr>
<!-- 			<tr> -->
<!-- 				<th>마스터 노출 이미지</th> -->
<!-- 				<td colspan="3"> -->
<!-- 					<div class="fileArea">				 -->
<!-- 									<input type="file" id="CATE_MASTEROPEN_UUID_FILE" name="CATE_MASTEROPEN_UUID_FILE" style="display:none;margin-left:0px;" maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload"  -->
<!-- 											maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다." -->
<!-- 											maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다." -->
<!-- 											totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다." -->
<!-- 											onclick="imgIdValue = $(this).attr('id');" -->
<!-- 									/>	 -->
<!-- 									<label class="btn btn-sm btn-outline-secondary" for="CATE_MASTEROPEN_UUID_FILE" >파일선택</label> -->
<!-- 										<span class="file_possible" style="color:red !important;">( 이미지 파일만 )</span>							  -->
<!-- 									<div class="fileList" id="CATE_MASTEROPEN_UUID_FILEList"></div> -->
<!-- 									<input id="CATE_MASTEROPEN_UUID" name="CATE_MASTEROPEN_UUID" type="hidden" /> -->
<!-- 									<div id="CATE_MASTEROPEN_UUID_FILEListClone" style="display:none;"> -->
<!-- 									<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div> -->
<!-- 									</div> -->
<!-- 					</div> -->
<!-- 				</td> -->
<!-- 			</tr> -->
		</tbody>
	</table>
</div>	
<div class="gnb_box">
                <ul class="gnb_list">
                    <li class="active">
                      <a href="${unit.move( 'view', out.params.cateIdx, 'cate' ) }">
                            소개영역
                      </a>
                    </li>
                    <li>
                      <a href="${unit.move( 'tab',  out.params.cateIdx, 'cate' , 'viewSale' ) }">
                            판매 상품 영역
                      </a>
                    </li>
                </ul>
</div>

<!-- 조회  시작-->				
<div class="tbl_view" style="margin-bottom: 20px;">
	<table class="view_tbl01" summary="">
		<colgroup>
			<col style="width: 15%;" />
			<col  />
			<col style="width: 15%;" />
			<col  />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">제목1</th>
				<td><input name="INFO_MAST_TITL1" placeholder="제목1을 입력하세요( 12자 이내 )" class=" form-control form-control-sm col-10" style="display: inline-block;" maxlength="12"></td>
			</tr>
			<tr>
				<th scope="row">제목2</th>
				<td><input name="INFO_MAST_TITL2" placeholder="제목2을 입력하세요" class=" form-control form-control-sm col-10" style="display: inline-block;"></td>
			</tr>
			<tr>
				<th scope="row">부제1</th>
				<td><input name="INFO_MAST_SUBT1" placeholder="부제1를 입력하세요" class=" form-control form-control-sm col-10" style="display: inline-block;"></td>
			</tr>
			<tr>
				<th scope="row">부제2</th>
				<td><input name="INFO_MAST_SUBT2" placeholder="부제2를 입력하세요" class=" form-control form-control-sm col-10" style="display: inline-block;"></td>
			</tr>
		</tbody>
	</table>
</div>	

<div class="btn_wrap" style="text-align: right;">
	<a onclick="fn_BtnRegist( '1' );" class="btn  btn-md btn-outline-dark" style="width:150px; padding-left: 24px;">페이지 미리 보기</a>
</div>

<div>
	<span style="color: red;">제목 색상은 ※PC 웹에서만 설정이 가능합니다.</span>
</div>

<div id="masteropenList" style="position: relative; overflow-y: auto;">
	
	<div class="infoView" >
		<div>
			<h3 class="handle">여기를 드래그하면 움직입니다.</h3>
			<select id="INFO_CD" name="INFO_CD" class="form-control form-control-sm col-10"></select>
			<input name="INFO_TITL" placeholder="제목을 입력하세요" class=" form-control form-control-sm col-10" style="display: inline-block;">
			<div class="colorpickerBase" id="color0" style="display: inline-block; ">
				<div style="background-color: #ff8939; "></div>
			</div>
			<input name="INFO_TITL_SUB" placeholder="소제목을 입력하세요" class=" form-control form-control-sm col-10">
			<textarea  name="INFO_CNTN" placeholder="내용을 입력하세요" class="noSummer form-control form-control-sm col-10"></textarea>
			<input name="INFO_UUID_INFO" placeholder="첨부파일 설명" class=" form-control form-control-sm col-10">
			<div class="tool_box">
				<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span>
				<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span>
			</div>
		</div>
	</div>
	
</div>


<div class="btn_wrap" style="text-align: right;">
	<a href="${ unit.move('index', '') }" class="btn btn-md btn-outline-dark">목록</a>
	<a onclick="fn_BtnRegist( '' );" class="btn btn-md btn_key_color">저장</a>
</div>

<!-- 조회 끝 -->	
<script>
// setUuid( $('[name=unitUuid]').val() );
// imgIdValue = "NOTI_UUID_FILE";
// unit_fileGet( imgIdValue, "fn_fileUpload");
var info_code = "";
var info_play_code = "";
var cateIdx = '${out.params.cateIdx }';
$(function(){
	setColorPicker('color0');
	fn_SelectOption("","INF","INFO_CD");
	
	info_code = $('[name=INFO_CD]').html();
	
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectMngMasterDetail";
	params.cateIdx = '${out.params.cateIdx }';
	var detailJson = fn_DataDetail( params, "N" );
	
// INFO |---------|--------|--------------------------|------------|-------------------|--------------------|--------------|-----------------------------------------------|--------|--------------|--------|---------------|----------|----------|-------|---------|---------|---------| 
// INFO |USER_IDX |USER_NM |USER_EMAIL                |SYS_REG_DTM |USER_MAST_JOIN_DTM |USER_LOGIN_DTM      |USER_CONS_DTM |CATE_MASTEROPEN_UUID                           |CODE_ID |CATE_CD       |CODE_NM |CODE_PARENT_NM |CATE_SLOG |CATE_INFO |FOLLOW |LECT_CNT |FACE_CNT |CHAT_CNT | 
// INFO |---------|--------|--------------------------|------------|-------------------|--------------------|--------------|-----------------------------------------------|--------|--------------|--------|---------------|----------|----------|-------|---------|---------|---------| 
// INFO |1        |마스터1    |peoplemade2020d@gmail.com |2020-10-29  |2020-12-10         |2020-12-18 19:38:22 |2020-11-04    |20201125185743a6dcadf9d02f82a6c0bdd9eac2d3b295 |CAT0105 |202011MNA0004 |명상      |건강             |명상할수있다    |명상박사      |0      |0        |0        |0        | 
// INFO |---------|--------|--------------------------|------------|-------------------|--------------------|--------------|-----------------------------------------------|--------|--------------|--------|---------------|----------|----------|-------|---------|---------|---------| 
	
	var apendImg = "";
	apendImg += '<tr>';
	apendImg += '				<th>마스터 노출 이미지</th>';
	apendImg += '				<td colspan="3">';
	apendImg += '					<div class="fileArea">				';
	apendImg += '									<input type="file" id="CATE_MASTEROPEN_UUID_FILE" name="CATE_MASTEROPEN_UUID_FILE" style="display:none;margin-left:0px;" maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" ';
	apendImg += '											maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."';
	apendImg += '											maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."';
	apendImg += '											totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."';
	apendImg += '											onclick="imgIdValue = $(this).attr(\'id\');"';
	apendImg += '											onchange="checkFileTypeImg(this.value);"';
	apendImg += '									/>	';
	apendImg += '									<label class="btn btn-sm btn-outline-secondary" for="CATE_MASTEROPEN_UUID_FILE" >파일선택</label>';
	apendImg += '										<span class="file_possible" style="color:#656565!important;">( 이미지사이즈- 820px*534px, 이미지 파일 jpg, png, gif )</span>							 ';
	apendImg += '									<div class="fileList" id="CATE_MASTEROPEN_UUID_FILEList"></div>';
	apendImg += '									<input id="CATE_MASTEROPEN_UUID" name="CATE_MASTEROPEN_UUID" type="hidden"/>';
	apendImg += '									<div id="CATE_MASTEROPEN_UUID_FILEListClone" style="display:none;">';
	apendImg += '									<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>';
	apendImg += '									</div>';
	apendImg += '					</div>';
	apendImg += '				</td>';
	apendImg += '</tr>';
	
	$('#UserTable').append( apendImg );
	setUuid( detailJson[0].CATE_MASTEROPEN_UUID );
	imgIdValue = "CATE_MASTEROPEN_UUID_FILE";
	unit_fileGet( imgIdValue, "fn_fileUpload");
	
	
	var params = new Object();
	params.status = "LIST";
	params.query = "selectMngMasteropenDetail";
	params.cateIdx = '${out.params.cateIdx }';
	fn_DataDetail2( params );
	
	fn_summernoteMasterOpen();
	
	// 드래그로 위치바꾸기
	$("#masteropenList").sortable({
		handle: ".handle",
		cursor:"move",
		axis:"y", //x축은 가로 y축은 세로
		stop: function( event , ui ){
			fn_summernoteMasterOpen();
		}
	});
	
	
});

var setColorPicker = function( colorId ){
	$('.colorpickerBase').ColorPicker({
		color: '#ff8939',
		onShow: function (colpkr) {
			$(colpkr).fadeIn(500);
			return false;
		},
		onHide: function (colpkr) {
			$(colpkr).fadeOut(500);
			return false;
		},
		onChange: function (hsb, hex, rgb) {
			$('#'+colorId).find('div').css('backgroundColor', '#' + hex+'!important');
			$('#'+colorId).siblings('input[name=INFO_TITL]').css('color', '#' + hex);
		}
	});
}

function rgb2hex(rgb) {
    if (  rgb.search("rgb") == -1 ) {
         return rgb;
    } else {
         rgb = rgb.match(/^rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*(\d+))?\)$/);
         function hex(x) {
              return ("0" + parseInt(x).toString(16)).slice(-2);
         }
         return "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]); 
    }
}




$(document).on("change", 'input[type=file][name]', function(){
		var tagId = $(this).attr('id').replace('_FILE', '');
		if( $('#'+tagId+'').val() == '' || $('#'+tagId+'').val() == 'undefined' ) setUuid( fn_GetUuid() );
		else setUuid( $('#'+tagId+'').val() );
	 	unit_fileSave( this );
});
$(document).on("change", '[name=INFO_CD]', fn_ChgInfo);
$(document).on("click", '.del_infoView', fn_DelInfo);
$(document).on("click",'.add_infoView',fn_AddInfo);

// $('[name=INFO_CD]').change(function(){
// 	if( $(this).val().indexOf('01') > -1 ) {//일반
// 		$('[name=DATA_UUID_INFO]').hide();
// 		$('[name=TITL_CNTN_SUB]').show();
// 	} else if( $(this).val().indexOf('02') > -1 ) {//추천대상
// 		$('[name=DATA_UUID_INFO]').hide();
// 		$('[name=TITL_CNTN_SUB]').hide();
		
// 	} else if( $(this).val().indexOf('05') > -1 ) {//하이라이트
// 		$('[name=DATA_UUID_INFO]').show();
// 		$('.note-editor .note-frame panel .panel-default').hide();
// 		$('[name=TITL_CNTN_SUB]').hide();
// 	} else if( $(this).val().indexOf('06') > -1 ) {//커리큘럼
// 		$('[name=DATA_UUID_INFO]').hide();
// 		$('[name=TITL_CNTN_SUB]').hide();
// 	}
// });

function fn_summernoteMasterOpen(){
	$('[name=INFO_CNTN]').not('.noSummer').summernote({
		width: 912.5,                 // 에디터 높이
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
		    ['height', ['height']],

		    ['insert',['picture','link','video']],
		    
 		    ['view', ['codeview','fullscreen', 'help']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['table', ['table']],
			],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
	});
}

var fileTagCnt = 1;
var colorId = 1;
function fn_AddInfo(){
	var copy = $(this).closest('div.infoView');	
	var html = "";
		html += '<div class="infoView" >';
		html += '<div>';
		html += '<h3 class="handle">여기를 드래그하면 움직입니다.</h3>';
		html += '<select id="INFO_CD" name="INFO_CD" class="form-control form-control-sm col-10">'+info_code+'</select>';
		html += '<input name="INFO_TITL" placeholder="제목을 입력하세요" class=" form-control form-control-sm col-10">';
		html += '			<div class="colorpickerBase" id="color'+(colorId++)+'" style="display: inline-block; ">';
		html += '				<div style="background-color: #ff8939; "></div>';
		html += '			</div>';
		html += '<input name="INFO_TITL_SUB" placeholder="소제목을 입력하세요" class=" form-control form-control-sm col-10">';
		html += '<textarea  name="INFO_CNTN" placeholder="내용을 입력하세요" class="noSummer form-control form-control-sm col-10"></textarea>';
		html += '<div class="tool_box">';
		html += '<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span>';
		html += '<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span>';
		html += '</div>';
		html += '</div>';
		html += '</div>';
		
		copy.after(html);
		fn_summernoteMasterOpen();
		
		setColorPicker('color'+(colorId-1));
		
}

function fn_DelInfo(){
	if ( confirm('해당 항목을 삭제하시겠습니까?') ) {
		
		var copy = $(this).closest('div.infoView');	
		var cClass = copy.attr('class').replace('infoView', '').replace(/ /g,'.');
		var params = new Object();
		
		params.INFO_IDX = copy.children('div').attr('id');
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		params.query = "deleteMngMasteropenData";
		params.status = "DELETE";
		fn_DataAjax2( params );
		
		if (($('div.infoView').length) > 1) copy.remove();
		else{
			var html = "";
			html += '<div class="infoView" >';
			html += '<div>';
			html += '<h3 class="handle">여기를 드래그하면 움직입니다.</h3>';
			html += '<select id="INFO_CD" name="INFO_CD" class="form-control form-control-sm col-10">'+info_code+'</select>';
			html += '<input name="INFO_TITL" placeholder="제목을 입력하세요" class=" form-control form-control-sm col-10">';
			html += '			<div class="colorpickerBase" id="color'+(colorId++)+'" style="display: inline-block; ">';
			html += '				<div style="background-color: #ff8939; "></div>';
			html += '			</div>';
			html += '<input name="INFO_TITL_SUB" placeholder="소제목을 입력하세요" class=" form-control form-control-sm col-10">';
			html += '<textarea  name="INFO_CNTN" placeholder="내용을 입력하세요" class="noSummer form-control form-control-sm col-10"></textarea>';
			html += '<div class="tool_box">';
			html += '<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span>';
			html += '<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span>';
			html += '</div>';
			html += '</div>';
			html += '</div>';
			
			copy.after(html);
			fn_summernoteMasterOpen();
			
			setColorPicker('color'+(colorId-1));
			copy.remove();
		}
		
		if (copy.find('input[type=hidden][name*=INFO_UUID]').length) {
			if( fileTagCnt > 2 ) fileTagCnt-=copy.find('input[type=hidden][name*=INFO_UUID]').length;
		}
	}
}

function fn_ChgInfo(){
	var cValue = $(this).val();
	var target = $(this).closest('div.infoView');	
	var html = "";
	
	if (cValue == '' || cValue == null ) {
		return alert('카테고리를 선택해주세요');
	}else if (cValue == 'INF01') {
		html += '<div>';
		html += '<h3 class="handle">여기를 드래그하면 움직입니다.</h3>';
		html += '<select id="INFO_CD" name="INFO_CD" class="form-control form-control-sm col-10">'+info_code+'</select>';
		html += '<input name="INFO_TITL" placeholder="제목을 입력하세요" class=" form-control form-control-sm col-10">';
		html += '			<div class="colorpickerBase" id="color'+(colorId++)+'" style="display: inline-block; ">';
		html += '				<div style="background-color: #ff8939; "></div>';
		html += '			</div>';
		
	if (info_play_code == "" || info_play_code == null) html += '					<select name="INFO_PLAYER" style="display: inline-block;" class="form-control form-control-sm col-2"></select>';
	else html += '					<select name="INFO_PLAYER" style="display: inline-block;" class="form-control form-control-sm col-2">'+info_play_code+'</select>';
		html += '					<input name="INFO_LINK" style="display: inline-block;" placeholder="내용을 입력하세요" class="noSummer form-control form-control-sm col-8"><span class="file_possible" style="color:red !important;"> ( 영상사이즈- 820px*462px )</span>';
		
		html += '<textarea  name="INFO_CNTN" placeholder="내용을 입력하세요" class="noSummer form-control form-control-sm col-10"></textarea>';
		html += '				<div class="fileArea">				';
		html += '					<input type="file" id="INFO_UUID_FILE'+(++fileTagCnt)+'" name="INFO_UUID_FILE'+fileTagCnt+'" style="display:none;margin-left:0px;"  maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" ';
		html += '							maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."';
		html += '							maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."';
		html += '							totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."';
		html += '							onclick="imgIdValue = $(this).attr(\'id\');"';
		html += '							onchange="checkFileTypeImg(this.value);"';
		html += '					/>	';
		html += '					<label class="btn btn-sm btn-outline-secondary" for="INFO_UUID_FILE'+fileTagCnt+'" >파일선택</label>';
		html += '						<span class="file_possible" style="color:red !important;">( 이미지사이즈- 150px*150px ,이미지 파일 jpg, png, gif )</span>';
		html += '					<div class="fileList" id="INFO_UUID_FILE'+fileTagCnt+'List"></div>';
		html += '					<input id="INFO_UUID'+fileTagCnt+'" name="INFO_UUID'+fileTagCnt+'" type="hidden" />';
		html += '					<div id="INFO_UUID_FILE'+fileTagCnt+'ListClone" style="display:none;">';
		html += '					<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>';
		html += '					</div>';
		html += '				</div>';
		html += '<div class="tool_box">';
		html += '<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span>';
		html += '<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span>';
		html += '</div>';
		html += '</div>';
		target.empty();
		target.append(html);
		if (info_play_code == "" || info_play_code == null) {
			fn_SelectOption("","PLAY","INFO_PLAYER", target);
// 			info_play_code = $('[name=INFO_PLAYER]').html();
		}
		target.find('[name=INFO_CD]').val(cValue);
	}else if (cValue == 'INF02') {
		html += '<div>';
		html += '<h3 class="handle">여기를 드래그하면 움직입니다.</h3>';
		html += '<select id="INFO_CD" name="INFO_CD" class="form-control form-control-sm col-10">'+info_code+'</select>';
		html += '<input name="INFO_TITL" placeholder="제목을 입력하세요" class=" form-control form-control-sm col-10">';
		html += '			<div class="colorpickerBase" id="color'+(colorId++)+'" style="display: inline-block; ">';
		html += '				<div style="background-color: #ff8939; "></div>';
		html += '			</div>';
		html += '<input name="INFO_TITL_SUB" placeholder="소제목을 입력하세요" class=" form-control form-control-sm col-10">';
		html += '<textarea  name="INFO_CNTN" placeholder="내용을 입력하세요" class=" form-control form-control-sm col-10"></textarea>';
		html += '				<div class="fileArea">				';
		html += '					<input type="file" id="INFO_UUID_FILE'+(++fileTagCnt)+'" name="INFO_UUID_FILE'+fileTagCnt+'" style="display:none;margin-left:0px;"  maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" ';
		html += '							maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."';
		html += '							maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."';
		html += '							totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."';
		html += '							onclick="imgIdValue = $(this).attr(\'id\');"';
		html += '							onchange="checkFileTypeImg(this.value);"';
		html += '					/>	';
		html += '					<label class="btn btn-sm btn-outline-secondary" for="INFO_UUID_FILE'+fileTagCnt+'" >파일선택</label>';
		html += '						<span class="file_possible" style="color:red !important;">( 이미지 파일 jpg, png, gif )</span>';
		html += '					<div class="fileList" id="INFO_UUID_FILE'+fileTagCnt+'List"></div>';
		html += '					<input id="INFO_UUID'+fileTagCnt+'" name="INFO_UUID'+fileTagCnt+'" type="hidden" />';
		html += '					<div id="INFO_UUID_FILE'+fileTagCnt+'ListClone" style="display:none;">';
		html += '					<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>';
		html += '					</div>';
		html += '				</div>';
		html += '<div class="tool_box">';
		html += '<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span>';
		html += '<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span>';
		html += '</div>';
		html += '</div>';
		target.empty();
		target.append(html);
		fn_summernoteMasterOpen();
		target.find('[name=INFO_CD]').val(cValue);
	}else if (cValue == 'INF03') {
		html += '<div>';
		html += '<h3 class="handle">여기를 드래그하면 움직입니다.</h3>';
		html += '<select id="INFO_CD" name="INFO_CD" class="form-control form-control-sm col-10">'+info_code+'</select>';
		html += '<input name="INFO_TITL" placeholder="제목을 입력하세요" class=" form-control form-control-sm col-10">';
		html += '			<div class="colorpickerBase" id="color'+(colorId++)+'" style="display: inline-block; ">';
		html += '				<div style="background-color: #ff8939; "></div>';
		html += '			</div>';
		html += '<input name="INFO_TITL_SUB" placeholder="소제목을 입력하세요" class=" form-control form-control-sm col-10">';
		html += '<textarea  name="INFO_CNTN" placeholder="내용을 입력하세요" class="noSummer form-control form-control-sm col-10"></textarea>';
		html += '				<div class="fileArea">				';
		html += '					<input type="file" id="INFO_UUID_FILE'+(++fileTagCnt)+'" name="INFO_UUID_FILE'+fileTagCnt+'" style="display:none;margin-left:0px;"  maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" ';
		html += '							maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."';
		html += '							maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."';
		html += '							totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."';
		html += '							onclick="imgIdValue = $(this).attr(\'id\');"';
		html += '							onchange="checkFileTypeImg(this.value);"';
		html += '					/>	';
		html += '					<label class="btn btn-sm btn-outline-secondary" for="INFO_UUID_FILE'+fileTagCnt+'" >파일선택</label>';
		html += '						<span class="file_possible" style="color:red !important;">( 이미지사이즈- 845px*473px ,이미지 파일 jpg, png, gif )</span>';
		html += '					<div class="fileList" id="INFO_UUID_FILE'+fileTagCnt+'List"></div>';
		html += '					<input id="INFO_UUID'+fileTagCnt+'" name="INFO_UUID'+fileTagCnt+'" type="hidden" />';
		html += '					<div id="INFO_UUID_FILE'+fileTagCnt+'ListClone" style="display:none;">';
		html += '					<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>';
		html += '					</div>';
		html += '				</div>';
		html += '<div class="tool_box">';
		html += '<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span>';
		html += '<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span>';
		html += '</div>';
		html += '</div>';
		target.empty();
		target.append(html);
		target.find('[name=INFO_CD]').val(cValue);
	}else if (cValue == 'INF04') {
		html += '<div>';
		html += '<h3 class="handle">여기를 드래그하면 움직입니다.</h3>';
		html += '<select id="INFO_CD" name="INFO_CD" class="form-control form-control-sm col-10">'+info_code+'</select>';
		html += '<input name="INFO_TITL" placeholder="제목을 입력하세요" class=" form-control form-control-sm col-10">';
		html += '			<div class="colorpickerBase" id="color'+(colorId++)+'" style="display: inline-block; ">';
		html += '				<div style="background-color: #ff8939; "></div>';
		html += '			</div>';
		html += '<input name="INFO_TITL_SUB" placeholder="소제목을 입력하세요" class=" form-control form-control-sm col-10">';
		html += '<textarea  name="INFO_CNTN" placeholder="내용을 입력하세요" class=" form-control form-control-sm col-10"></textarea>';
		html += '				<div class="fileArea">				';
		html += '					<input type="file" id="INFO_UUID_FILE'+(++fileTagCnt)+'" name="INFO_UUID_FILE'+fileTagCnt+'" style="display:none;margin-left:0px;"  maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" ';
		html += '							maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."';
		html += '							maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."';
		html += '							totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."';
		html += '							onclick="imgIdValue = $(this).attr(\'id\');"';
		html += '							onchange="checkFileTypeImg(this.value);"';
		html += '					/>	';
		html += '					<label class="btn btn-sm btn-outline-secondary" for="INFO_UUID_FILE'+fileTagCnt+'" >파일선택</label>';
		html += '						<span class="file_possible" style="color:red !important;">( 이미지사이즈- 845px*473px ,이미지 파일 jpg, png, gif )</span>';
		html += '					<div class="fileList" id="INFO_UUID_FILE'+fileTagCnt+'List"></div>';
		html += '					<input id="INFO_UUID'+fileTagCnt+'" name="INFO_UUID'+fileTagCnt+'" type="hidden" />';
		html += '					<div id="INFO_UUID_FILE'+fileTagCnt+'ListClone" style="display:none;">';
		html += '					<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>';
		html += '					</div>';
		html += '				</div>';
		html += '<div class="tool_box">';
		html += '<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span>';
		html += '<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span>';
		html += '</div>';
		html += '</div>';
		target.empty();
		target.append(html);
		fn_summernoteMasterOpen();
		target.find('[name=INFO_CD]').val(cValue);
	}else if (cValue == 'INF05') {
		html += '		<div>';
		html += '			<h3 class="handle">여기를 드래그하면 움직입니다.</h3>';
		html += '			<select id="INFO_CD" name="INFO_CD" class="form-control form-control-sm col-10">'+info_code+'</select>';
		html += '			<input name="INFO_TITL" placeholder="제목을 입력하세요" class=" form-control form-control-sm col-10" style="display: inline-block;">';
		html += '			<div class="colorpickerBase" id="color'+(colorId++)+'" style="display: inline-block; ">';
		html += '				<div style="background-color: #ff8939; "></div>';
		html += '			</div>';
		html += '			<input name="INFO_TITL_SUB" placeholder="추천대상 소제목을 입력하세요" class=" form-control form-control-sm col-10">';
		html += '			<textarea  name="INFO_CNTN" placeholder="추천대상 내용을 입력하세요" class="noSummer form-control form-control-sm col-10"></textarea>';
		html += '				<div class="fileArea">				';
		html += '					<input type="file" id="INFO_UUID_FILE'+(++fileTagCnt)+'" name="INFO_UUID_FILE'+fileTagCnt+'" style="display:none;margin-left:0px;"  maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" ';
		html += '							maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."';
		html += '							maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."';
		html += '							totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."';
		html += '							onclick="imgIdValue = $(this).attr(\'id\');"';
		html += '							onchange="checkFileTypeImg(this.value);"';
		html += '					/>	';
		html += '					<label class="btn btn-sm btn-outline-secondary" for="INFO_UUID_FILE'+fileTagCnt+'" >파일선택</label>';
		html += '						<span class="file_possible" style="color:red !important;">( 이미지사이즈- 192px*144px ,이미지 파일 jpg, png, gif )</span>';
		html += '					<div class="fileList" id="INFO_UUID_FILE'+fileTagCnt+'List"></div>';
		html += '					<input id="INFO_UUID'+fileTagCnt+'" name="INFO_UUID'+fileTagCnt+'" type="hidden" />';
		html += '					<div id="INFO_UUID_FILE'+fileTagCnt+'ListClone" style="display:none;">';
		html += '					<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>';
		html += '					</div>';
		html += '				</div>';
		html += '		</div>';
		html += '		<div>';
		html += '			<input name="INFO_TITL_SUB" placeholder="상담진행 소제목을 입력하세요" class=" form-control form-control-sm col-10">';
		html += '			<textarea  name="INFO_CNTN" placeholder="상담진행 내용을 입력하세요" class="noSummer form-control form-control-sm col-10"></textarea>';
		html += '				<div class="fileArea">				';
		html += '					<input type="file" id="INFO_UUID_FILE'+(++fileTagCnt)+'" name="INFO_UUID_FILE'+fileTagCnt+'" style="display:none;margin-left:0px;" maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" ';
		html += '							maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."';
		html += '							maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."';
		html += '							totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."';
		html += '							onclick="imgIdValue = $(this).attr(\'id\');"';
		html += '							onchange="checkFileTypeImg(this.value);"';
		html += '					/>	';
		html += '					<label class="btn btn-sm btn-outline-secondary" for="INFO_UUID_FILE'+fileTagCnt+'" >파일선택</label>';
		html += '						<span class="file_possible" style="color:red !important;">( 이미지사이즈- 192px*144px ,이미지 파일 jpg, png, gif )</span>	 ';
		html += '					<div class="fileList" id="INFO_UUID_FILE'+fileTagCnt+'List"></div>';
		html += '					<input id="INFO_UUID'+fileTagCnt+'" name="INFO_UUID'+fileTagCnt+'" type="hidden" />';
		html += '					<div id="INFO_UUID_FILE'+fileTagCnt+'ListClone" style="display:none;">';
		html += '					<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>';
		html += '					</div>';
		html += '				</div>';
		html += '			<div class="tool_box">';
		html += '				<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span>';
		html += '				<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span>';
		html += '			</div>';
		html += '		</div>';
		html += '		<div>';
		html += '			<input name="INFO_TITL_SUB" placeholder="활용법 소제목을 입력하세요" class=" form-control form-control-sm col-10">';
		html += '			<textarea  name="INFO_CNTN" placeholder="활용법 내용을 입력하세요" class="noSummer form-control form-control-sm col-10"></textarea>';
		html += '				<div class="fileArea">				';
		html += '					<input type="file" id="INFO_UUID_FILE'+(++fileTagCnt)+'" name="INFO_UUID_FILE'+fileTagCnt+'" style="display:none;margin-left:0px;" maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" ';
		html += '							maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."';
		html += '							maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."';
		html += '							totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."';
		html += '							onclick="imgIdValue = $(this).attr(\'id\');"';
		html += '							onchange="checkFileTypeImg(this.value);"';
		html += '					/>	';
		html += '					<label class="btn btn-sm btn-outline-secondary" for="INFO_UUID_FILE'+fileTagCnt+'" >파일선택</label>';
		html += '						<span class="file_possible" style="color:red !important;">( 이미지사이즈- 192px*144px ,이미지 파일 jpg, png, gif )</span>							 ';
		html += '					<div class="fileList" id="INFO_UUID_FILE'+fileTagCnt+'List"></div>';
		html += '					<input id="INFO_UUID'+fileTagCnt+'" name="INFO_UUID'+fileTagCnt+'" type="hidden" />';
		html += '					<div id="INFO_UUID_FILE'+fileTagCnt+'ListClone" style="display:none;">';
		html += '					<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>';
		html += '					</div>';
		html += '				</div>';
		html += '		</div>';
		target.empty();
		target.append(html);
		
		target.find('[name=INFO_CD]').val(cValue);
// 	}else if (cValue == 'INF04') {
// 		html += '<div>';
// 		html += '					<h3 class="handle">여기를 드래그하면 움직입니다.</h3>';
// 		html += '					<select id="INFO_CD" name="INFO_CD" class="form-control form-control-sm col-10">'+info_code+'</select>';
// 		html += '					<div>';	
// 		html += '						<input name="INFO_TITL" placeholder="제목을 입력하세요" class=" form-control form-control-sm col-10" style="display: inline-block;">';
// 		html += '					<div class="colorpickerBase" id="color'+(colorId++)+'" style="display: inline-block; ">';
// 		html += '						<div style="background-color: #ff8939; "></div>';
// 		html += '					</div>';
// 		html += '					</div>';
// 		if (info_play_code == "" || info_play_code == null) {
// 			html += '					<select name="INFO_PLAYER" style="display: inline-block;" class="form-control form-control-sm col-10"></select>';
// 		}else{
// 			html += '					<select name="INFO_PLAYER" style="display: inline-block;" class="form-control form-control-sm col-10">'+info_play_code+'</select>';
// 		}
// 		html += '					<input name="INFO_CNTN" style="display: inline-block;" placeholder="내용을 입력하세요" class="noSummer form-control form-control-sm col-10">';
// 		html += '					<div class="tool_box">';
// 		html += '						<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span>';
// 		html += '						<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span>';
// 		html += '					</div>';
// 		html += '</div>';
		
// 		target.empty();
// 		target.append(html);
// 		if (info_play_code == "" || info_play_code == null) {
// 			fn_SelectOption("","PLAY","INFO_PLAYER");
// 			info_play_code = $('[name=INFO_PLAYER]').html();
// 		}
// 		target.find('[name=INFO_CD]').val(cValue);
// 	}else if (cValue == 'INF05') {
// 		html += '<div>';
// 		html += '					<h3 class="handle">여기를 드래그하면 움직입니다.</h3>';
// 		html += '			<select id="INFO_CD" name="INFO_CD" class="form-control form-control-sm col-10">'+info_code+'</select>';
// 		html += '			<input name="INFO_TITL" placeholder="제목을 입력하세요" class=" form-control form-control-sm col-10" style="display: inline-block;">';
// 		html += '			<div class="colorpickerBase" id="color'+(colorId++)+'" style="display: inline-block; ">';
// 		html += '				<div style="background-color: #ff8939; "></div>';
// 		html += '			</div>';
// 		html += '					<input name="INFO_CNTN" placeholder="상품코드를 입력하세요" class="noSummer form-control form-control-sm col-10">';
// 		html += '					<div class="tool_box">';
// 		html += '						<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span>';
// 		html += '						<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span>';
// 		html += '					</div>';
// 		html += '</div>';
		
// 		target.empty();
// 		target.append(html);
		
// 		target.find('[name=INFO_CD]').val(cValue);
	}
	
	setColorPicker('color'+(colorId-1));
	
}

function fn_BtnRegist( THIS ){
	
	var isc = false;
	var messege = "";
	
	if ($('[name=CATE_MASTEROPEN_UUID]').val() == '' || $('[name=CATE_MASTEROPEN_UUID]').val() == null) return alert('마스터 노출 이미지를 등록해주세요');
	var cateImg = new Object();
	cateImg.CATE_MASTEROPEN_UUID = $('[name=CATE_MASTEROPEN_UUID]').val();
	cateImg.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	cateImg.query = "updateMngMasteropenImg";
	cateImg.status = "EDIT";
	cateImg.cateIdx = '${out.params.cateIdx }';
	fn_DataAjax2( cateImg );
	
	var msg = "";
	$('#masteropenList div.infoView [name*=INFO]').not('[id*=UUID],[name*=INFO_PLAYER],[name*=INFO_LINK],[name*=INFO_TITL_SUB]').each(function(k){
		if ( $(this).val() == "" || $(this).val() == null ) return msg = "모든 항목을 입력해주세요.";
	});
	
	if (msg != "") {
		alert(msg);
	}else{
		$('#masteropenList div.infoView').each(function(k){
			var params = new Object();
			params.status = "WRITE";
			params.cateIdx = '${out.params.cateIdx }';
			params.query = "insertMngMasteropen";
			params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
			params.INFO_CD = $(this).find('[name=INFO_CD]').val();
			params.INFO_ORDE = k;
			params.INFO_TITL = $(this).find('[name=INFO_TITL]').val();
			params.INFO_TITL_COLR =  rgb2hex( $(this).find('[name=INFO_TITL]').css('color') );
			
			if( k == 0 ) {
				params.INFO_MAST_TITL1 = $('[name=INFO_MAST_TITL1]').val();
				params.INFO_MAST_TITL2 = $('[name=INFO_MAST_TITL2]').val();
				params.INFO_MAST_SUBT1 = $('[name=INFO_MAST_SUBT1]').val();
				params.INFO_MAST_SUBT2 = $('[name=INFO_MAST_SUBT2]').val();
			}
			
			if ( params.INFO_CD != 'INF05' ) {
				params.INFO_IDX = $(this).children('div').attr('id');
				if ( params.INFO_CD == 'INF01' ) params.INFO_PLAYER = $(this).find('[name=INFO_PLAYER]').val();
				else params.INFO_TITL_SUB = $(this).find('[name=INFO_TITL_SUB]').val();
				params.INFO_CNTN = $(this).find('[name=INFO_CNTN]').val();
				params.INFO_UUID = $(this).find('input[type=hidden][name*=INFO_UUID]').val(); 
				params.INFO_UUID_NUM = $(this).find('input[type=hidden][name*=INFO_UUID]').attr('id').replace('INFO_UUID',''); 

				params.INFO_LINK = $(this).find('[name=INFO_LINK]').val();
				fn_DataAjax2( params );
			} else {
				$(this).children('div').each(function( j ){
					params.INFO_IDX = $(this).attr('id');
					params.INFO_TITL_SUB = $(this).find('[name=INFO_TITL_SUB]').val();
					params.INFO_CNTN = $(this).find('[name=INFO_CNTN]').val();
					params.INFO_UUID = $(this).find('input[type=hidden][name*=INFO_UUID]').val(); 
					params.INFO_UUID_NUM = $(this).find('input[type=hidden][name*=INFO_UUID]').attr('id').replace('INFO_UUID','');
					
					fn_DataAjax2( params );
				}); 
			}
		});
		
		if( THIS == '' ) {
			if (confirm('저장되었습니다\n\n상품이 등록되어 있지 않을 시에는 상품관리에서 서비스별 상품을 등록하시고 ‘판매상품영역’에서 상품을 등록하세요\n\n판매 상품 영역으로 이동하시겠습니까?')) location.href = "${unit.move('tab',out.params.cateIdx , 'cate', 'viewSale'  )}";
			else location.reload();	
		} else {
			viewPreView();
		}
	}
}

//재정의
function fn_DataDetail2( PARAMS ) {
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result.out.detail.data;
	var jsonDataConvert = jsonData;
	
	if ( jsonDataConvert.length ) $('#masteropenList').empty();
	
	var INF05 = "";
	var INF05_CNT = 0;
	
	fileTagCnt += jsonDataConvert.length;
	
	$.each(jsonDataConvert ,function(key, val) {
		if( key == 0 ) {
			$('[name=INFO_MAST_TITL1]').val( val.INFO_MAST_TITL1 );
			$('[name=INFO_MAST_TITL2]').val( val.INFO_MAST_TITL2 );
			$('[name=INFO_MAST_SUBT1]').val( val.INFO_MAST_SUBT1 );
			$('[name=INFO_MAST_SUBT2]').val( val.INFO_MAST_SUBT2 );
		}
		var html = "";
		if ( jsonDataConvert[key].INFO_CD  == "INF01" ) {
			++fileTagCnt;
			html += '<div class="infoView" >';
			html += '<div id="'+jsonDataConvert[key].INFO_IDX+'">';
			html += '<h3 class="handle">여기를 드래그하면 움직입니다.</h3>';
			html += '<select id="INFO_CD" name="INFO_CD" class="form-control form-control-sm col-10">'+info_code+'</select>';
			html += '<input name="INFO_TITL" placeholder="제목을 입력하세요" class=" form-control form-control-sm col-10" style="color:'+jsonDataConvert[key].INFO_TITL_COLR+';"  value="'+jsonDataConvert[key].INFO_TITL+'">';
			html += '			<div class="colorpickerBase" id="color'+(colorId++)+'" style="display: inline-block; ">';
			html += '				<div style="background-color: '+jsonDataConvert[key].INFO_TITL_COLR+'; "></div>';
			html += '			</div>';
			
			if (info_play_code == "" || info_play_code == null) html += '					<select name="INFO_PLAYER" style="display: inline-block;" class="form-control form-control-sm col-2"></select>';
			else html += '					<select name="INFO_PLAYER" style="display: inline-block;" class="form-control form-control-sm col-2">'+info_play_code+'</select>';
				html += '					<input name="INFO_LINK" style="display: inline-block;" placeholder="내용을 입력하세요" class="noSummer form-control form-control-sm col-8" value="'+jsonDataConvert[key].INFO_LINK+'">';
				
			html += '<textarea  name="INFO_CNTN" placeholder="내용을 입력하세요" class="noSummer form-control form-control-sm col-10" >'+jsonDataConvert[key].INFO_CNTN+'</textarea>';
			html += '				<div class="fileArea">				';
			html += '					<input type="file" id="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" name="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" style="display:none;margin-left:0px;"  maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" ';
			html += '							maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."';
			html += '							maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."';
			html += '							totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."';
			html += '							onclick="imgIdValue = $(this).attr(\'id\');"';
			html += '							onchange="checkFileTypeImg(this.value);"';
			html += '					/>	';
			html += '					<label class="btn btn-sm btn-outline-secondary" for="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" >파일선택</label>';
			html += '						<span class="file_possible" style="color:red !important;">( 이미지 파일만 )</span>';
			html += '					<div class="fileList" id="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'List"></div>';
			html += '					<input id="INFO_UUID'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" name="INFO_UUID'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" type="hidden" value="'+jsonDataConvert[key].INFO_UUID+'"/>';
			html += '					<div id="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'ListClone" style="display:none;">';
			html += '					<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>';
			html += '					</div>';
			html += '				</div>';
			html += '<div class="tool_box">';
			html += '<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span>';
			html += '<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span>';
			html += '</div>';
			html += '</div>';
			html += '</div>';
			
			$('#masteropenList').append( html );
			fn_SelectOption("","PLAY","INFO_PLAYER", $('div.infoView').eq(key) );
			$('div.infoView:eq('+key+') [name=INFO_PLAYER]').val( jsonDataConvert[key].INFO_PLAYER );
			console.log($('div.infoView:eq('+key+') [name=INFO_PLAYER]').val());			
			$('[name=INFO_CD]').eq($('[name=INFO_CD]').length-1).val(jsonDataConvert[key].INFO_CD);
		} else if ( jsonDataConvert[key].INFO_CD  == "INF02" ) {
			++fileTagCnt;
			html += '<div class="infoView" >';
			html += '<div id="'+jsonDataConvert[key].INFO_IDX+'">';
			html += '<h3 class="handle">여기를 드래그하면 움직입니다.</h3>';
			html += '<select id="INFO_CD" name="INFO_CD" class="form-control form-control-sm col-10">'+info_code+'</select>';
			html += '<input name="INFO_TITL" placeholder="제목을 입력하세요" class=" form-control form-control-sm col-10" style="color:'+jsonDataConvert[key].INFO_TITL_COLR+';"  value="'+jsonDataConvert[key].INFO_TITL+'">';
			html += '			<div class="colorpickerBase" id="color'+(colorId++)+'" style="display: inline-block; ">';
			html += '				<div style="background-color: '+jsonDataConvert[key].INFO_TITL_COLR+'; "></div>';
			html += '			</div>';
			html += '<input name="INFO_TITL_SUB" placeholder="소제목을 입력하세요" class=" form-control form-control-sm col-10" value="'+jsonDataConvert[key].INFO_TITL_SUB+'">';
			html += '<textarea  name="INFO_CNTN" placeholder="내용을 입력하세요" class=" form-control form-control-sm col-10" >'+jsonDataConvert[key].INFO_CNTN+'</textarea>';
			html += '				<div class="fileArea">				';
			html += '					<input type="file" id="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" name="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" style="display:none;margin-left:0px;"  maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" ';
			html += '							maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."';
			html += '							maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."';
			html += '							totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."';
			html += '							onclick="imgIdValue = $(this).attr(\'id\');"';
			html += '							onchange="checkFileTypeImg(this.value);"';
			html += '					/>	';
			html += '					<label class="btn btn-sm btn-outline-secondary" for="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" >파일선택</label>';
			html += '						<span class="file_possible" style="color:red !important;">( 이미지 파일만 )</span>';
			html += '					<div class="fileList" id="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'List"></div>';
			html += '					<input id="INFO_UUID'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" name="INFO_UUID'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" type="hidden" value="'+jsonDataConvert[key].INFO_UUID+'"/>';
			html += '					<div id="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'ListClone" style="display:none;">';
			html += '					<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>';
			html += '					</div>';
			html += '				</div>';
			html += '<div class="tool_box">';
			html += '<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span>';
			html += '<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span>';
			html += '</div>';
			html += '</div>';
			html += '</div>';
			
			$('#masteropenList').append( html );
			$('[name=INFO_CD]').eq($('[name=INFO_CD]').length-1).val(jsonDataConvert[key].INFO_CD);
			fn_summernoteMasterOpen();
			
		} else if ( jsonDataConvert[key].INFO_CD  == "INF03" ) {
			++fileTagCnt;
			html += '<div class="infoView" >';
			html += '<div id="'+jsonDataConvert[key].INFO_IDX+'">';
			html += '<h3 class="handle">여기를 드래그하면 움직입니다.</h3>';
			html += '<select id="INFO_CD" name="INFO_CD" class="form-control form-control-sm col-10">'+info_code+'</select>';
			html += '<input name="INFO_TITL" placeholder="제목을 입력하세요" class=" form-control form-control-sm col-10" style="color:'+jsonDataConvert[key].INFO_TITL_COLR+';"  value="'+jsonDataConvert[key].INFO_TITL+'">';
			html += '			<div class="colorpickerBase" id="color'+(colorId++)+'" style="display: inline-block; ">';
			html += '				<div style="background-color: '+jsonDataConvert[key].INFO_TITL_COLR+'; "></div>';
			html += '			</div>';
			html += '<input name="INFO_TITL_SUB" placeholder="소제목을 입력하세요" class=" form-control form-control-sm col-10" value="'+jsonDataConvert[key].INFO_TITL_SUB+'">';
			html += '<textarea  name="INFO_CNTN" placeholder="내용을 입력하세요" class="noSummer form-control form-control-sm col-10" >'+jsonDataConvert[key].INFO_CNTN+'</textarea>';
			html += '				<div class="fileArea">				';
			html += '					<input type="file" id="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" name="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" style="display:none;margin-left:0px;"  maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" ';
			html += '							maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."';
			html += '							maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."';
			html += '							totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."';
			html += '							onclick="imgIdValue = $(this).attr(\'id\');"';
			html += '							onchange="checkFileTypeImg(this.value);"';
			html += '					/>	';
			html += '					<label class="btn btn-sm btn-outline-secondary" for="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" >파일선택</label>';
			html += '						<span class="file_possible" style="color:red !important;">( 이미지 파일만 )</span>';
			html += '					<div class="fileList" id="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'List"></div>';
			html += '					<input id="INFO_UUID'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" name="INFO_UUID'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" type="hidden" value="'+jsonDataConvert[key].INFO_UUID+'"/>';
			html += '					<div id="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'ListClone" style="display:none;">';
			html += '					<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>';
			html += '					</div>';
			html += '				</div>';
			html += '<div class="tool_box">';
			html += '<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span>';
			html += '<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span>';
			html += '</div>';
			html += '</div>';
			html += '</div>';
			
			$('#masteropenList').append( html );
			$('[name=INFO_CD]').eq($('[name=INFO_CD]').length-1).val(jsonDataConvert[key].INFO_CD);
			
		}else if ( jsonDataConvert[key].INFO_CD == "INF04"  ) {
			++fileTagCnt;
			html += '<div class="infoView" >';
			html += '<div id="'+jsonDataConvert[key].INFO_IDX+'">';
			html += '<h3 class="handle">여기를 드래그하면 움직입니다.</h3>';
			html += '<select id="INFO_CD" name="INFO_CD" class="form-control form-control-sm col-10">'+info_code+'</select>';
			html += '<input name="INFO_TITL" placeholder="제목을 입력하세요" class=" form-control form-control-sm col-10" style="color:'+jsonDataConvert[key].INFO_TITL_COLR+';" value="'+jsonDataConvert[key].INFO_TITL+'">';
			html += '			<div class="colorpickerBase" id="color'+(colorId++)+'" style="display: inline-block; ">';
			html += '				<div style="background-color: '+jsonDataConvert[key].INFO_TITL_COLR+'; "></div>';
			html += '			</div>';
			html += '<input name="INFO_TITL_SUB" placeholder="소제목을 입력하세요" class=" form-control form-control-sm col-10" value="'+jsonDataConvert[key].INFO_TITL_SUB+'">';
			html += '<textarea  name="INFO_CNTN" placeholder="내용을 입력하세요" class=" form-control form-control-sm col-10">'+jsonDataConvert[key].INFO_CNTN+'</textarea>';
			html += '				<div class="fileArea">				';
			html += '					<input type="file" id="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" name="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" style="display:none;margin-left:0px;"  maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" ';
			html += '							maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."';
			html += '							maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."';
			html += '							totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."';
			html += '							onclick="imgIdValue = $(this).attr(\'id\');"';
			html += '							onchange="checkFileTypeImg(this.value);"';
			html += '					/>	';
			html += '					<label class="btn btn-sm btn-outline-secondary" for="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" >파일선택</label>';
			html += '						<span class="file_possible" style="color:red !important;">( 이미지 파일만 )</span>';
			html += '					<div class="fileList" id="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'List"></div>';
			html += '					<input id="INFO_UUID'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" name="INFO_UUID'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" type="hidden" value="'+jsonDataConvert[key].INFO_UUID+'"/>';
			html += '					<div id="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'ListClone" style="display:none;">';
			html += '					<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>';
			html += '					</div>';
			html += '				</div>';
			html += '<div class="tool_box">';
			html += '<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span>';
			html += '<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span>';
			html += '</div>';
			html += '</div>';
			html += '</div>';
			$('#masteropenList').append( html );
			$('[name=INFO_CD]').eq($('[name=INFO_CD]').length-1).val(jsonDataConvert[key].INFO_CD);
			fn_summernoteMasterOpen();
			
		}else if ( jsonDataConvert[key].INFO_CD == "INF05"  ) {
			++fileTagCnt;
			if( INF05_CNT == 0 ){
				INF05 = '';
				
				INF05 += '<div class="infoView" >';
				
				INF05 += '		<div id="'+jsonDataConvert[key].INFO_IDX+'">';
				INF05 += '			<h3 class="handle">여기를 드래그하면 움직입니다.</h3>';
				INF05 += '			<select id="INFO_CD" name="INFO_CD" class="form-control form-control-sm col-10">'+info_code+'</select>';
				INF05 += '			<input name="INFO_TITL" placeholder="제목을 입력하세요" class=" form-control form-control-sm col-10" style="display: inline-block; color:'+jsonDataConvert[key].INFO_TITL_COLR+';" value="'+jsonDataConvert[key].INFO_TITL+'">';
				INF05 += '			<div class="colorpickerBase" id="color'+(colorId++)+'" style="display: inline-block; ">';
				INF05 += '				<div style="background-color: '+jsonDataConvert[key].INFO_TITL_COLR+'; "></div>';
				INF05 += '			</div>';
				INF05 += '			<input name="INFO_TITL_SUB" placeholder="추천대상 소제목을 입력하세요" class=" form-control form-control-sm col-10" value="'+jsonDataConvert[key].INFO_TITL_SUB+'">';
				INF05 += '			<textarea  name="INFO_CNTN" placeholder="추천대상 내용을 입력하세요" class="noSummer form-control form-control-sm col-10">'+jsonDataConvert[key].INFO_CNTN+'</textarea>';
				INF05 += '				<div class="fileArea">				';
				INF05 += '					<input type="file" id="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" name="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" style="display:none;margin-left:0px;"  maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" ';
				INF05 += '							maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."';
				INF05 += '							maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."';
				INF05 += '							totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."';
				INF05 += '							onclick="imgIdValue = $(this).attr(\'id\');"';
				INF05 += '							onchange="checkFileTypeImg(this.value);"';
				INF05 += '					/>	';
				INF05 += '					<label class="btn btn-sm btn-outline-secondary" for="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" >파일선택</label>';
				INF05 += '						<span class="file_possible" style="color:red !important;">( 이미지 파일만 )</span>';
				INF05 += '					<div class="fileList" id="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'List"></div>';
				INF05 += '					<input id="INFO_UUID'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" name="INFO_UUID'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" type="hidden" value="'+jsonDataConvert[key].INFO_UUID+'"/>';
				INF05 += '					<div id="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'ListClone" style="display:none;">';
				INF05 += '					<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>';
				INF05 += '					</div>';
				INF05 += '				</div>';
				INF05 += '		</div>';

				INF05_CNT++;
				
			}else if ( INF05_CNT == 1 ) {
				
				INF05 += '		<div id="'+jsonDataConvert[key].INFO_IDX+'">';
				INF05 += '			<input name="INFO_TITL_SUB" placeholder="상담진행 소제목을 입력하세요" class=" form-control form-control-sm col-10" value="'+jsonDataConvert[key].INFO_TITL_SUB+'">';
				INF05 += '			<textarea  name="INFO_CNTN" placeholder="상담진행 내용을 입력하세요" class="noSummer form-control form-control-sm col-10">'+jsonDataConvert[key].INFO_CNTN+'</textarea>';
				INF05 += '				<div class="fileArea">				';
				INF05 += '					<input type="file" id="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" name="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" style="display:none;margin-left:0px;" maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" ';
				INF05 += '							maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."';
				INF05 += '							maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."';
				INF05 += '							totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."';
				INF05 += '							onclick="imgIdValue = $(this).attr(\'id\');"';
				INF05 += '							onchange="checkFileTypeImg(this.value);"';
				INF05 += '					/>	';
				INF05 += '					<label class="btn btn-sm btn-outline-secondary" for="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" >파일선택</label>';
				INF05 += '						<span class="file_possible" style="color:red !important;">( 이미지 파일만 )</span>	 ';
				INF05 += '					<div class="fileList" id="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'List"></div>';
				INF05 += '					<input id="INFO_UUID'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" name="INFO_UUID'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" type="hidden" value="'+jsonDataConvert[key].INFO_UUID+'"/>';
				INF05 += '					<div id="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'ListClone" style="display:none;">';
				INF05 += '					<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>';
				INF05 += '					</div>';
				INF05 += '				</div>';
				INF05 += '			<div class="tool_box">';
				INF05 += '				<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span>';
				INF05 += '				<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span>';
				INF05 += '			</div>';
				INF05 += '		</div>';

				INF05_CNT++;
				
			}else if ( INF05_CNT == 2 ) {
				
				INF05 += '		<div id="'+jsonDataConvert[key].INFO_IDX+'">';
				INF05 += '			<input name="INFO_TITL_SUB" placeholder="활용법 소제목을 입력하세요" class=" form-control form-control-sm col-10" value="'+jsonDataConvert[key].INFO_TITL_SUB+'">';
				INF05 += '			<textarea  name="INFO_CNTN" placeholder="활용법 내용을 입력하세요" class="noSummer form-control form-control-sm col-10">'+jsonDataConvert[key].INFO_CNTN+'</textarea>';
				INF05 += '				<div class="fileArea">				';
				INF05 += '					<input type="file" id="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" name="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" style="display:none;margin-left:0px;" maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" ';
				INF05 += '							maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."';
				INF05 += '							maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."';
				INF05 += '							totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."';
				INF05 += '							onclick="imgIdValue = $(this).attr(\'id\');"';
				INF05 += '							onchange="checkFileTypeImg(this.value);"';
				INF05 += '					/>	';
				INF05 += '					<label class="btn btn-sm btn-outline-secondary" for="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" >파일선택</label>';
				INF05 += '						<span class="file_possible" style="color:red !important;">( 이미지 파일만 )</span>							 ';
				INF05 += '					<div class="fileList" id="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'List"></div>';
				INF05 += '					<input id="INFO_UUID'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" name="INFO_UUID'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'" type="hidden"  value="'+jsonDataConvert[key].INFO_UUID+'"/>';
				INF05 += '					<div id="INFO_UUID_FILE'+isZero(jsonDataConvert[key].INFO_UUID_NUM)+'ListClone" style="display:none;">';
				INF05 += '					<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>';
				INF05 += '					</div>';
				INF05 += '				</div>';
				INF05 += '		</div>';
				
				INF05 += '</div>';
				
				$('#masteropenList').append( INF05 );
				$('[name=INFO_CD]').eq($('[name=INFO_CD]').length-1).val(jsonDataConvert[key].INFO_CD);
				
				INF05_CNT = 0;
			}
		}
		setColorPicker('color'+(colorId-1));
	}); 
	
	$('#masteropenList input[type=hidden][name*=INFO_UUID]').each(function(k){
		setUuid( $(this).val() );
		imgIdValue = $(this).siblings('input[type=file][name*=INFO_UUID]').attr('id');
		unit_fileGet( imgIdValue, "fn_fileUpload");
	});
	
}

function isZero( num ){
	if ( num == 0 )
		return fileTagCnt;
	else
		return num;
}

// 미리보기
function viewPreView(){
	const newpop = window.open("${unit.url( '/front/master/mngMasterOpenPreView' , 'preView' ) }");
}

</script>
