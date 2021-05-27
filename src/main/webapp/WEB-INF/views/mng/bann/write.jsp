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
				<th scope="row">배너 제목</th>
				<td>
					<div class="form-inline">
						<input type="text" name="BANN_BANN_TITL" class="form-control form-control-sm col-8"  placeholder="입력해주세요."/>
					</div>				
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
				<th scope="row">기간</th>
				<td colspan="3">
					<div class="designRadiobutton  form-inline" style="display: block;">
						<label for="radio2_2" class="label_txt wd150" >시작일</label>
						<input type="text" name="BANN_STR_DTM" class="datepicker form-control form-control-sm"  readonly="readonly"/>
						&nbsp;&nbsp;&nbsp;~ &nbsp;&nbsp;
						<label for="radio2_2" class="label_txt" style="padding:0 12px 0 0 ;   text-indent: 0;    cursor: pointer;">종료일</label>
						<input type="text" name="BANN_END_DTM" class="datepicker form-control form-control-sm"  readonly="readonly"/>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">제목1</th>
				<td>
					<div class="form-inline">
						<input type="text" name="BANN_TITL1" class="form-control form-control-sm col-8"  placeholder="입력해주세요."/>
					</div>				
				</td>
			</tr>
			<tr>
				<th scope="row">제목2</th>
				<td>
					<div class="form-inline">
						<input type="text" name="BANN_TITL2" class="form-control form-control-sm col-8"  placeholder="입력해주세요."/>
					</div>				
				</td>
			</tr>
			<tr>
				<th scope="row">부제1</th>
				<td>
					<div class="form-inline">
						<input type="text" name="BANN_SUBT1" class="form-control form-control-sm col-8"  placeholder="입력해주세요."/>
					</div>				
				</td>
			</tr>
			<tr>
				<th scope="row">부제2</th>
				<td>
					<div class="form-inline">
						<input type="text" name="BANN_SUBT2" class="form-control form-control-sm col-8"  placeholder="입력해주세요."/>
					</div>				
				</td>
			</tr>
			<tr>
				<th scope="row">배너색</th>
				<td>
					
					<div class="form-inline">
						<div class="colorpickerBase" id="colorId" style="display: inline-block; ">
							<div style="background-color: #1eccb4;"></div>
						</div>
						<span style="margin-left:50px; ">배너사진과 같은 라인의 여백색상 설정값 <br class="mobile"><span style="color: red;">※PC 웹에서만 설정이 가능합니다.</span></span>
					</div>
					<input type="hidden" name="BANN_CLR" class="form-control form-control-sm col-8" value="#1eccb4"/>
					
				</td>
			</tr>
			<tr>
				<th>웹 이미지</th>
				<td>
					<div class="fileArea">				
						<input type="file" id="BANN_UUID_WEB_FILE" name="BANN_UUID_WEB_FILE" style="display:none;margin-left:0px;" maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" 
								maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."
								maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."
								totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."
								onclick="imgIdValue = $(this).attr('id');"
						/>	
						<label class="btn btn-sm btn-outline-secondary" for="BANN_UUID_WEB_FILE" >파일선택</label>
					
											<span class="file_possible file_possible1" style="color:red !important;">( 이미지사이즈- 1200px*520px ,이미지 파일 jpg, png, gif )</span>		
											<span class="file_possible file_possible2" style="color:red !important;">( 이미지사이즈- 1920px*44px ,이미지 파일 jpg, png, gif )</span>		
											<span class="file_possible file_possible3" style="color:red !important;">( 이미지사이즈- 1200px*130px ,이미지 파일 jpg, png, gif )</span>		
																
						<div class="fileList" id="BANN_UUID_WEB_FILEList"></div>
						<input id="BANN_UUID_WEB" name="BANN_UUID_WEB" type="hidden" />
						<div id="BANN_UUID_WEB_FILEListClone" style="display:none;">
						<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>
						</div>											
					</div>
				</td>
			</tr>
			<tr>
				<th>모바일 이미지</th>
				<td>
					<div class="fileArea">				
						<input type="file" id="BANN_UUID_MOBI_FILE" name="BANN_UUID_MOBI_FILE" style="display:none;margin-left:0px;" maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" 
								maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."
								maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."
								totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."
								onclick="imgIdValue = $(this).attr('id');"
						/>	
						<label class="btn btn-sm btn-outline-secondary" for="BANN_UUID_MOBI_FILE" >파일선택</label>
						
						
											<span class="file_possible file_possible1" style="color:red !important;">( 이미지사이즈- 300px*236px ,이미지 파일 jpg, png, gif )</span>		
											<span class="file_possible file_possible2" style="color:red !important;">( 이미지사이즈- 375px*44px ,이미지 파일 jpg, png, gif )</span>		
											<span class="file_possible file_possible3" style="color:red !important;">( 이미지사이즈- 324px*130px ,이미지 파일 jpg, png, gif )</span>	
						
						
						
<!-- 											<span class="file_possible" style="color:red !important;">( 모든 파일 구분, 다중 선택 가능 )</span>							 -->
						<div class="fileList" id="BANN_UUID_MOBI_FILEList"></div>
						<input id="BANN_UUID_MOBI" name="BANN_UUID_MOBI" type="hidden" />
						<div id="BANN_UUID_MOBI_FILEListClone" style="display:none;">
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
</div>



<link rel="stylesheet" media="screen" type="text/css" href="/resources/css/colorpicker.css" />
<script type="text/javascript" src="/resources/js/colorpicker.js"></script>
<script type="text/javascript">
$(function(){
	setColorPicker('colorId'); 
	fn_SelectOption("", "BNN", "BANN_TYPE");
	
	$('[name=BANN_TITL1]').show();
	$('[name=BANN_TITL2]').show();
	$('[name=BANN_SUBT1]').show();
	$('[name=BANN_SUBT2]').show();

	$('#searchArea tbody tr').each(function(key, val){
		if( key != 0 ) $(this).hide();
	});
});

$("input[type=file][name]").change(function(){		
	var tagId = $(this).attr('id').replace('_FILE', '');
	if( $('#'+tagId+'').val() == '' ) setUuid( fn_GetUuid() );
	else setUuid( $('#'+tagId+'').val() );
});

$('#BANN_TYPE').change(function(){

	$('#searchArea tbody tr').eq(1).show();
	$('#searchArea tbody tr').eq(2).show();
	$('#searchArea tbody tr').eq(8).show();
	$('#searchArea tbody tr').eq(9).show();
	$('#searchArea tbody tr').eq(10).show();
	$('#searchArea tbody tr').eq(11).show();
	$('#searchArea tbody tr').eq(12).show();
	
	$('[name=BANN_STR_DTM]').val('');
	$('[name=BANN_END_DTM]').val('');
	$('[name=BANN_TITL1]').val('');
	$('[name=BANN_TITL2]').val('');
	$('[name=BANN_SUBT1]').val('');
	$('[name=BANN_SUBT2]').val('');
	
	

	
	if( $(this).val() == 'BNN01' ) {
		$('.file_possible1').hide();
		$('.file_possible2').show();
		$('.file_possible3').hide();
		
		$('.colorpickerBase > div').css({'background-color': '#000000'});
		$('[name=BANN_CLR]').val('#000000');
		setColorPicker('colorId');
		
		$('#searchArea tbody tr').eq(3).show();
		
		$('#searchArea tbody tr').eq(4).hide();
		$('#searchArea tbody tr').eq(5).hide();
		$('#searchArea tbody tr').eq(6).hide();
		$('#searchArea tbody tr').eq(7).hide();
		

		
		
		
	} else if( $(this).val() == 'BNN02' ) {
		
		$('.file_possible1').show();
		$('.file_possible2').hide();
		$('.file_possible3').hide();
		$('.colorpickerBase > div').css({'background-color': '#1eccb4'});
		$('[name=BANN_CLR]').val('#1eccb4');
		setColorPicker('colorId');
		
		$('#searchArea tbody tr').eq(3).hide();

		$('#searchArea tbody tr').eq(4).show();
		$('#searchArea tbody tr').eq(5).show();
		$('#searchArea tbody tr').eq(6).show();
		$('#searchArea tbody tr').eq(7).show();
	

	} else if( $(this).val() == 'BNN03' ) {
		
		$('.file_possible1').hide();
		$('.file_possible2').hide();
		$('.file_possible3').show();
		$('.colorpickerBase > div').css({'background-color': '#000000'});
		$('[name=BANN_CLR]').val('#000000');
		setColorPicker('colorId');
		
		$('#searchArea tbody tr').eq(3).hide();
		
		$('#searchArea tbody tr').eq(4).hide();
		$('#searchArea tbody tr').eq(5).hide();
		$('#searchArea tbody tr').eq(6).hide();
		$('#searchArea tbody tr').eq(7).hide();
	} else {
		$('#searchArea tbody tr').hide();
		$('#searchArea tbody tr').eq(0).show();
	}

});

var setColorPicker = function( colorId ){
	$('.colorpickerBase').ColorPicker({
		color: $('[name=BANN_CLR]').val(),
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
			$('[name=BANN_CLR]').val( '#' + hex );
		}
	});
}

function fn_BtnRegist(){
	
	if ( $('[name=BANN_UUID_WEB]').val() == '' || $('[name=BANN_UUID_WEB]').val() == null || typeof $('[name=BANN_UUID_WEB]').val() == 'undefind' ) {
		return alert('웹 이미지를 추가해주세요.');
	}
	if ( $('[name=BANN_UUID_MOBI]').val() == '' || $('[name=BANN_UUID_MOBI]').val() == null || typeof $('[name=BANN_UUID_MOBI]').val() == 'undefind' ) {
		return alert('모바일 이미지를 추가해주세요.');
	}
	
	var params = unit_getParams("searchArea");
	params.status = "WRITE";
	params.query = "insertMngBannData";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");

	var result = fn_DataAjax( params );
	if( result ) location.href='${unit.move("index", "" )}';
}

</script>




















