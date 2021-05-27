<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDateValue"><fmt:formatDate value="${now}" pattern="yyyyMM" /></c:set> 	

<style type="text/css">
/* .fileArea { margin-left:10px; margin-bottom:10px; } */
.fileList { background-color:#fcf3ec; border-radius:5px; padding: 7px;display:none; }
.fileList div { font-size:12px; line-height: 20px; }
.fileList span.close { font-size:11px; color:red;  padding-top: 4.1px; padding-left: 5px;cursor:pointer; }
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
.btn-part{
	margin-left: 10px;
	border-radius: 40px;
    background-color: #ff8939 !important;
    border-color: #ff8939;
    color: #ffffff;
}	

</style>


<!-- 쓰기  시작-->	


<div class="title_wrap mt5">
	 ※ VOD강의를 생성하는 곳은 강의명/강의코드, 강의영상, 강의자료(첨부파일) 등을 등록하고 강의영상의 순서와 무료공개를 설정할 수 있다.
</div>
<div class="title_wrap">
	<h4><b>강의 정보</b></h4>
</div>
<!-- <div class="remark" style="font-size:13px; padding-bottom:7px; margin-left:0;">'*'은 필수입력 항목입니다.</div>			 -->
<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>동영상관리 테이블</caption>
		<colgroup>
			<col style="width: 15%;"/>
			<col/>
			<col style="width: 15%;"/>
			<col style="width: 7%;"/>
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">강의코드<span style="color:red;">*</span></th>
				<td>
					<div class="form-inline">
						<input type="text" name="VOD_CD" class="form-control form-control-sm col-8" title="제목 입력" disabled="disabled" readonly="readonly" />
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">강의명<span style="color:red;">*</span></th>
				<td>
					<div class="form-inline">
						<input type="text" name="VOD_NM" class="form-control form-control-sm col-8" title="제목 입력"  placeholder=""/>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">분야</th>
				<td>
					<div class="form-inline">
						<select id="PARENT_CODE_ID" name="PARENT_CODE_ID" disabled class="form-control form-control-sm col-8" title="마스터 영역" >
							<option value="">선택해주세요</option>
						</select>
					</div>	
				</td>
			<tr>
			<tr>
				<th scope="row">분야상세</th>
				<td >
					<input type="hidden" name="CODE_ID" />
					<div class="form-inline">
						<select id="MAIN_CODE_ID" name="MAIN_CODE_ID" disabled class="form-control form-control-sm col-8" title="마스터 영역" >
							<option value="">분야를 선택해주세요</option>
						</select>
					</div>	
				</td>
			</tr>
			<tr>
				<th scope="row">마스터<span style="color:red;">*</span></th>
				<td>
					<div class="form-inline">
						<select id="CATE_IDX" name="CATE_IDX" class="form-control form-control-sm col-8" disabled="disabled">
							<option value="">-- 선택 --</option>
						</select>
					</div>				
				</td>
			</tr>
			<tr>
				<th scope="row">업로드 상태<span style="color:red;">*</span></th>
				<td>
<!-- 					<select id="VOD_PROG_CD" name="VOD_PROG_CD" class=" form-control form-control-sm col-8"> -->
<!-- 					</select> -->
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio0_Y" name="VOD_PROG_CD" value="VOD01" checked/>
						<label for="radio0_Y" class="label_txt">진행중</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio0_N" name="VOD_PROG_CD" value="VOD02" />
						<label for="radio0_N" class="label_txt">완강</label>
					</div>
				</td>
			</tr>
<!-- 			<tr> -->
<!-- 				<th scope="row">강의상태<span style="color:red;">*</span></th> -->
<!-- 				<td> -->
<!-- 					<select id="VOD_STAT_CD" name="VOD_STAT_CD" class=" form-control form-control-sm col-8"> -->
<!-- 					</select> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>첨부파일</th> -->
<!-- 				<td> -->
<!-- 					<div class="fileArea">				 -->
<!-- 						<input type="file" id="NOTI_UUID_FILE" name="NOTI_UUID_FILE" style="display:none;margin-left:0px;" multiple maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload"  -->
<!-- 								maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다." -->
<!-- 								maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다." -->
<!-- 								totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다." -->
<!-- 								onclick="imgIdValue = $(this).attr('id');" -->
<!-- 						/>	 -->
<!-- 						<label class="btn btn-sm btn-outline-secondary" for="NOTI_UUID_FILE" >파일선택</label> -->
<!-- 											<span class="file_possible" style="color:red !important;">( 모든 파일 구분, 다중 선택 가능 )</span>							 -->
<!-- 						<div class="fileList" id="NOTI_UUID_FILEList"></div> -->
<!-- 						<input id="NOTI_UUID" name="NOTI_UUID" type="hidden" /> -->
<!-- 						<div id="NOTI_UUID_FILEListClone" style="display:none;"> -->
<!-- 						<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div> -->
<!-- 						</div>											 -->
<!-- 					</div> -->
<!-- 				</td> -->
<!-- 			</tr> -->
			<tr>
				<th scope="row">예상영상수</th>
				<td>
					<input type="text" name="VOD_CNT" id="VOD_CNT" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
				</td>
			</tr>		
			<tr>
				<th scope="row">파트수<span style="color:red;">*</span></th>
				<td id="partTarget">
					<input type="text" placeholder="입력할 파트의 수를 입력해주세요" name="VOD_PART_CNT" id="VOD_PART_CNT" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"><a onclick="addPart();" class="btn btn-md btn_key_color" style="    height: 40px;width: 90px;">등록</a>
				</td>
			</tr>		
		</tbody>
	</table>
</div>
<div class="title_wrap" style="position: relative;">
	<h4><b>영상 정보</b></h4>
	<span class="file_possible red" style=" position: absolute;right: 0;top: 0;">첨부파일 PDF, ZIP, JPG, PNG, GIF 만 허용 </span>
</div>
<div class="tbl_list">
	<table class="list_tbl01" summary="" id="searchArea2">
		<caption>동영상관리 리스트 테이블</caption>
		<colgroup>
			<col style="width: 5%;" />	
			<col style="width: 15%">
			<col style="width: 10%">
			<col style="width: 15%;" />				
			<col  />			
			<col style="width: 10%;" />			
			<col style="width: 10%;" />		
			<col style="width: 10%;" />		
			<col style="width: 5%;" />		
		</colgroup>
		<thead>
			<tr>
				<th scope="col"><input type="checkbox" id="chk_all" ></th>
				<th scope="col">영상코드<span style="color:red;">*</span></th>
				<th scope="col">파트<span style="color:red;">*</span></th>
				<th scope="col">제목<span style="color:red;">*</span></th>
				<th scope="col">영상 경로<span style="color:red;">*</span></th>
				<th scope="col">파일 첨부</th>
				<th scope="col">시간(분)</th>
				<th scope="col">노출 순서<span style="color:red;">*</span></th>
				<th scope="col">무료공개</th>
			</tr>
		</thead>
		<tbody id="vodAppend">
					<tr id="nodata">
						<td colspan="11">등록된 내용이 없습니다.</td>
					</tr>
		</tbody>
	</table>
</div>

<div class="btn_wrap" style="text-align: right;position: relative;">
	<a class="btn  btn-md btn-danger" onclick="fn_removeVod();" style="position: absolute;left: 0; width: 150px !important;">선택 영상 삭제</a>
	<a class="btn btn-md addVod btn_key_color" onclick="fn_addVod();">영상 추가</a>
</div>
<div class="btn_wrap" style="text-align: right;">
	<a onclick="fn_BtnDelete();" class="btn  btn-md btn-danger" style="margin-right: 10px;">삭제</a>
	<a href='${unit.move("index", "" )}' class="btn  btn-md btn-outline-dark">목록</a>
	<a class="btn btn-md btn_key_color" onclick="fn_BtnRegist();">저장</a>
</div>
<script type="text/javascript">
var vodCd = "";
var vodIdx = "";
var dataCd = "";
var dataCdTemp = "";
var dataCdTempCnt = 0;
var vodId = 0;

var date = new Date();
var cdyear = date.getFullYear();
var cdmonth = date.getMonth()+1;

$(function(){
	vodIdx = '${out.params.vodIdx }';
	// 셀렉트박스 뿌려주기
	fn_SelectOptionNotCode( 'selectMasterNameList', 'CATE_IDX');
	fn_SelectOption("", "CAT", "PARENT_CODE_ID");
// 	fn_SelectOption("","SAL","VOD_STAT_CD");
// 	fn_SelectOption("","VOD","VOD_PROG_CD");
	
	var params = new Object();
	params.status = "DETAIL";
	params.vodIdx = vodIdx;
	params.query = "selectMngVodDetail";
	
	fn_DataDetail(params);

	var jsonData = fn_DataAjax2(params);
	$('[name=VOD_PROG_CD]').eq(0).val('VOD01');
	$('[name=VOD_PROG_CD]').eq(1).val('VOD02');
	$('[name=VOD_PROG_CD]:radio[value="'+jsonData.out.detail.data[0].VOD_PROG_CD+'"]').prop('checked',true);
	
	var codeIdStr = $('[name=CODE_ID]').val()+'';
	fn_SelectOption( codeIdStr.substr(0,5), "CAT", "MAIN_CODE_ID");
	$('#PARENT_CODE_ID').val( codeIdStr.substring(0,5) );
	$('#MAIN_CODE_ID').val( codeIdStr );
	
// 	console.log( jsonData.out.detail.data[0].VOD_PROG_CD );
	
	var params = new Object();
	params.status = "LIST";
	params.vodIdx = vodIdx;
	params.query = "selectMngVodDetailList";
	
	var jsonDetail = fn_DataAjax2(params);

	var params = new Object();
	params.status = "LIST";
	params.vodIdx = vodIdx;
	params.query = "selectMngVodDetailPartList";
	
	var partList = fn_DataAjax2(params);
	partList = partList.out.detail.data;
	
	var detailList = jsonDetail.out.detail.data;
	$.each(detailList, function(k,v){
		if ( $('#nodata').length ) {
			$('#nodata').remove();
		}
		
		var html = "";
		vodId = (k+1);
		html += '<tr id="'+(k+1)+'">'; 
		html += '	<td><input type="checkbox" class="chk" name="chk" ><input type="hidden" name="DATA_IDX" value="'+v.DATA_IDX+'"></td>'; 
		html += '	<td><input type="text" class="col-10" readonly="readonly" disabled="disabled" name="DATA_CD" id="DATA_CD'+(k+1)+'" value="'+v.DATA_CD+'"></td>';
		html += '	<td><div class="form-inline"><select id="SELECT_PART'+vodId+'" name="SELECT_PART" class="form-control form-control-sm col-8">'+getSelectValue( partList, $(this) )+'</select></div></td>';
		html += '	<td><input type="text" class="col-10" name="DATA_TITL" id="DATA_TITL'+(k+1)+'" value="'+v.DATA_TITL+'"></td>';
		html += '	<td>';
		html += '		<input type="text" class="col-10" name="DATA_PC_URL" id="DATA_PC_URL'+(k+1)+'" placeholder="PC 경로" value="'+v.DATA_PC_URL+'">';
// 		html += '		<input type="text" class="col-10" name="DATA_MOBI_URL" id="DATA_MOBI_URL'+(k+1)+'" placeholder="모바일 경로" value="'+v.DATA_MOBI_URL+'">';
		html += '	</td>';
		html += '	<td>';
		html += '		<div class="fileArea">';
		html += '			<input type="file" id="DATA_UUID_FILE'+(k+1)+'" name="DATA_UUID_FILE'+(k+1)+'" style="display:none;margin-left:0px;" multiple maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload"'; 
		html += '					maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다." ';
		html += '					maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다." ';
		html += '					totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다." ';
		html += '					onclick="imgIdValue = $(this).attr(\'id\');"';
		html += '					accept=".PDF, image/gif, image/jpeg, image/png, image/jpg, .ZIP"';
		html += ' 					onchange="checkFileType(this.value);"';
		html += '			/>	 ';
		html += '			<label class="btn btn-sm btn-outline-secondary" for="DATA_UUID_FILE'+(k+1)+'" >파일선택</label> ';
		html += '			<div class="fileList" id="DATA_UUID_FILE'+(k+1)+'List"></div> ';
		html += '			<input id="DATA_UUID'+(k+1)+'" name="DATA_UUID'+(k+1)+'" type="hidden" value="'+v.DATA_UUID+'"/> ';
		html += '			<div id="DATA_UUID_FILE'+(k+1)+'ListClone" style="display:none;"> ';
		html += '			<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div> ';
		html += '			</div>';
		html += '		</div> ';
		html += '	</td> ';
		html += '	<td> ';
		html += '		약 '+ Math.ceil( getRunn( v.DATA_PC_URL )/60 ) +' 분';
		html += '	</td> ';
		html += '	<td> ';
		html += '		<input type="text" class="col-8" name="DATA_ORDE" id="DATA_ORDE'+(k+1)+'" value="'+v.DATA_ORDE+'" onkeyup="this.value=this.value.replace(/[^0-9]/g,\'\');"> ';
		html += '	</td> ';
		html += '	<td> ';
		html += '		<input type="checkbox" name="DATA_FREE_YN" id="DATA_FREE_YN'+(k+1)+'" '+isY(v.DATA_FREE_YN)+'> ';
		html += '	</td> ';
		html += '</tr> ';
		$('#vodAppend').append(html);
		
		$("input[type=file][name]").change(function(){		
			var tagId = $(this).attr('id').replace('_FILE', '');
			if( $('#'+tagId+'').val() == '' ){
				setUuid( fn_GetUuid() );
			}
			else setUuid( $('#'+tagId+'').val() );
		 	unit_fileSave( this );
		});
		
	});	
	
	if ( partList[0].DATA_PART_IDX != '' ) {
		
		$('[name=VOD_PART_CNT]').val( partList.length );
		var partHtml = "";
		console.log(partList.length);
		for (var i = 0; i < partList.length; i++) {
			console.log(partList[i]);
			partHtml += '<div><input placeholder="파트명을 입력해주세요" class="VOD_PART" name="VOD_PART" id="VOD_PART_ID'+partList[i].DATA_PART_IDX+'" value="'+partList[i].DATA_PART_NM+'" /> : 파트명'+partList[i].DATA_PART_IDX+'</div>';
		}
	}
	
	$('#partTarget').append( partHtml );
	
	function getSelectValue( partList, detailList ){
		var html = "<option value=''>선택</option>";
		$.each(partList, function(k , v){
			if ( v.DATA_PART_IDX != null && v.DATA_PART_IDX != '' && typeof v.DATA_PART_IDX !='undefind' ) {

				if ( detailList[0].DATA_PART_IDX == v.DATA_PART_IDX ) {
					html += '<option value="'+v.DATA_PART_IDX+'" selected="selected">'+v.DATA_PART_IDX+'</option>';
				}else{
					html += '<option value="'+v.DATA_PART_IDX+'">'+v.DATA_PART_IDX+'</option>';
				}
			
			}
		});
		
		return html;
	}
	
	$('input[type=hidden][name^=DATA_UUID]').each(function(){
		
		setUuid( $(this).val() );
		
		imgIdValue = $(this).attr("name").replace(/[0-9]/g,'')+"_FILE"+$(this).attr("name").replace(/[^0-9]/g,'');
		unit_fileGet( imgIdValue, "fn_fileUpload");
	
	});
	
	
});

function isY( yn ){ if ( yn == 'Y' ) return 'checked'; }

$('#chk_all').click(function(){
	if ( $('#chk_all').is(':checked') ) $('.chk').prop('checked', true);	
	else	$('.chk').prop('checked', false);	
});

$('.chk').click(function(){
	if ( $('input[name="chk"]:checked').length == $('.chk').length ) 	$('#chk_all').prop("checked", true);
	else	$('#chk_all').prop("checked", false);
});

var fn_BtnRegist_AntiDouble = false;
function fn_BtnRegist(){
	
		if ( $('[name=VOD_NM]').val().trim() == '' || $('[name=VOD_NM]').val() == null ) return alert('강의명을 입력해주세요.');
		if ( $('[name=CATE_IDX]').val() == '' ) return alert('마스터를 선택해주세요.');
		
		if ( $('[name=VOD_PART_CNT]').val() == '' ) return alert( '파트수를 입력해 주세요' );
		if ( $('[name=VOD_PART]').length == 0 ) return alert( '파트명을 등록해 주세요' );
		
		var vodEachYn = true;
		
		$('[name=VOD_PART]').each(function( k ){
			if (this.value == '') {
				vodEachYn = false;
				return alert( (k+1)+'번째 파트명을 등록해주세요');
			}
		});
		
		if ( !vodEachYn ) 
			return ;
		
		var eachStop = false;
		var eachMsg = "";
		
		$('[name=DATA_ORDE]').each(function(k){	
			if ($(this).val().trim() == ''){
				eachStop = true;
				eachMsg = '노출순서를 입력해주세요.';
				return;
			}
		});
// 		$('[name=DATA_RUNN]').each(function(k){	
// 			if ($(this).val().trim() == ''){
// 				eachStop = true;
// 				eachMsg = '시간(분)을 입력해주세요.';
// 				return ;
// 			}
// 		});
// 		$('[name=DATA_MOBI_URL]').each(function(k){
// 			if ($(this).val().trim() == ''){
// 				eachStop = true;
// 				eachMsg = 'MOBILE URL을 입력해주세요.';
// 				return ;
// 			}
// 		});
		$('[name=DATA_PC_URL]').each(function(k){	
			if ($(this).val().trim() == ''){
				eachStop = true;
				eachMsg = 'PC URL을 입력해주세요.';
				return ;
			}
		});
		$('[name=DATA_TITL]').each(function(k){		
			if ($(this).val().trim() == ''){
				eachStop = true;
				eachMsg = '제목을 입력해주세요.';	
				return ;
			}
		});
		
		$('[name=SELECT_PART]').each(function( k ){
			if ( this.value.trim() == '' ) {
				eachStop = true;
				eachMsg = "영상정보에서 파트를 지정해 주세요.";
				return ;
			}
		});
		
		$('[name=DATA_CD]').each(function(k){
			if ($(this).val().trim() == ''){
				eachStop = true;
				eachMsg = "영상코드가 누락되었습니다 해당 행을 삭제한 후 다시 작성하여 주세요.";
				return ;
			}
		});
		if (eachStop) {	return alert(eachMsg); }
		
		if (fn_BtnRegist_AntiDouble) return alert('이미 처리중입니다.');
		
		
		var params = unit_getParams("searchArea");
		params.status = "EDIT";
		params.query = "updateMngVodData";
		params.vodIdx = vodIdx;
		params.VOD_PROG_CD = $('input[name="VOD_PROG_CD"]:checked').val();
		
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
			
		fn_DataAjax2( params );
		
		fn_BtnRegist_AntiDouble = true;
		
		if ( $('#nodata').length ) {
			$('#nodata').remove();
		}
		
		var vodData = $("#searchArea2 #vodAppend tr");
		var params2 = new Object();
		vodData.each(function(k){
			
			params2 = unit_getParams(this.id);
			params2.vodIdx = vodIdx;
			params2.status = "WRITE";
			params2.query = "updateMngVodDataDataOnDuplicate";
			params2.mngLoginIdx = localStorage.getItem("mngLoginIdx");
			params2.DATA_UUID = $(this).find('input[type=hidden][name^=DATA_UUID]').val();
			
			params2.DATA_PART_IDX = params2.SELECT_PART;

			params2.DATA_RUNN = getRunn( $(this).find('input[name=DATA_PC_URL]').val() );
			
			$('[name=VOD_PART]').each(function( key ){
				if ( this.id.replace('VOD_PART_ID', '') == $("#searchArea2 #vodAppend tr").eq(k).find('[name=SELECT_PART] option:selected').val() ) {
					params2.DATA_PART_NM = this.value;
				}
			});
			
			if ( $('#'+this.id+' [name=DATA_FREE_YN]').is(":checked") ) {
				params2.DATA_FREE_YN = 'Y';
			}else{
				params2.DATA_FREE_YN = 'N';
			}
			fn_DataAjax2( params2 );
			
		});
		
		location.href='${unit.move("index", "" )}';
}

function fn_addVod(){
	
	if ( $('#nodata').length ) {
		$('#nodata').remove();
	}
	
	var params = new Object();
	params.status = "WRITE";
	params.query = "updateMngVodDataDataOnDuplicate";
	params.DATA_CD = '${sysDateValue}' + 'VN';	
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	var result = fn_DataAjax2( params );
	if( result.out.resultCnt > 0 ){
	
		var params2 = new Object();
		params2.status = "DETAIL";
		params2.query = "selectMngVodDataDataIdx";
		params2.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		var result = fn_DataAjax2( params2 );
		
		var html = "";
		
		html += '<tr id="'+ (++vodId) +'">';
		html += '<td><input type="checkbox" class="chk" name="chk" ><input type="hidden" name="DATA_IDX" value="'+result.out.detail.data[0].DATA_IDX+'"></td>';
		html += '<td><input type="text" class="col-10" readonly="readonly" disabled="disabled" value="'+result.out.detail.data[0].DATA_CD+'" name="DATA_CD" id="DATA_CD'+vodId+'"></td>';
		html += '<td><div class="form-inline"><select id="SELECT_PART'+vodId+'" name="SELECT_PART" class="form-control form-control-sm col-8"></select></div></td>';
		html += '<td><input type="text" class="col-10" name="DATA_TITL" id="DATA_TITL'+vodId+'"></td>';
		html += '<td>';
		html += '	<input type="text" class="col-10" name="DATA_PC_URL" id="DATA_PC_URL'+vodId+'" placeholder="PC 경로, EX) : https://peoplemade.com/">';
// 		html += '	<input type="text" class="col-10" name="DATA_MOBI_URL" id="DATA_MOBI_URL'+vodId+'" placeholder="모바일 경로, EX) : https://peoplemade.com/">';
		html += '</td>';
		html += '<td>';
		html += ' 	<div class="fileArea">';				
		html += ' 		<input type="file" id="DATA_UUID_FILE'+vodId+'" name="DATA_UUID_FILE'+vodId+'" style="display:none;margin-left:0px;" multiple maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" '; 
		html += ' 				maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."';
		html += ' 				maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."';
		html += ' 				totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."';
		html += ' 				onclick="imgIdValue = $(this).attr(\'id\'); "';
		html += '				accept=".PDF, image/gif, image/jpeg, image/png, image/jpg, .ZIP"';
		html += ' 				onchange="checkFileType(this.value);"';
		html += ' 		/>';
		html += ' 		<label class="btn btn-sm btn-outline-secondary" for="DATA_UUID_FILE'+vodId+'" >파일선택</label>';
		html += ' 		<div class="fileList" id="DATA_UUID_FILE'+vodId+'List"></div>';
		html += ' 		<input id="DATA_UUID'+vodId+'" name="DATA_UUID'+vodId+'" type="hidden" />';
		html += ' 		<div id="DATA_UUID_FILE'+vodId+'ListClone" style="display:none;">';
		html += ' 		<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>';
		html += ' 		</div>';
		html += ' 	</div>';
		html += '</td>';
		html += '<td>';
		html += '	<input type="text" class="col-8" name="DATA_RUNN" id="DATA_RUNN'+vodId+'" onkeyup="this.value=this.value.replace(/[^0-9]/g,\'\');">';
		html += '</td>';
		html += '<td>';
		html += '	<input type="text" class="col-8" name="DATA_ORDE" id="DATA_ORDE'+vodId+'" onkeyup="this.value=this.value.replace(/[^0-9]/g,\'\');">';
		html += '</td>';
		html += '<td>';
		html += '	<input type="checkbox" name="DATA_FREE_YN" id="DATA_FREE_YN'+vodId+'">';
		html += '</td>';
		html += '</tr>';
		
		$('#vodAppend').append(html);
		
		$('[name=SELECT_PART]').empty();
		
		var html = "<option value=''>선택</option>";
		for (var i = 0; i < $('[name=VOD_PART_CNT]').val(); i++) {
			html += '<option value="'+(i+1)+'">'+(i+1)+'</option>';
		}
		
		$('[name=SELECT_PART]').append( html );
		
		$("input[type=file][name]").change(function(){		
			var tagId = $(this).attr('id').replace('_FILE', '');
			if( $('#'+tagId+'').val() == '' ){
				setUuid( fn_GetUuid() );
			}
			else setUuid( $('#'+tagId+'').val() );
		 	unit_fileSave( this );
		});
	}
}


/* 	alert('제거'); */
function fn_removeVod(){
	
	$('[name=chk]').each(function(k){
		if ( $(this).is(':checked') ) {
			if ( $(this).siblings('[name=DATA_IDX]').val() != '' ) {
				var params = new Object();
				params.status = "DELETE";
				params.vodIdx = '${out.params.vodIdx }';
				params.DATA_IDX = $(this).siblings('[name=DATA_IDX]').val();
				params.query = "DeleteMngVodDataData";
				params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
				fn_DataAjax2( params );
			}
			$(this).closest('tr').remove();
		}
		
	});

	if ( $('#vodAppend').children().size() == 0 ) {
		var html  = '<tr id="nodata">';
			html	+= '<td colspan="11">등록된 내용이 없습니다.</td>';
			html	+= '</tr>';
		$('#vodAppend').append(html);
	}
}

//삭제
function fn_BtnDelete(){
	if (confirm('강좌를 삭제하시겠습니까?')) {
		
		var params = new Object();
		params.status = "DELETE";
		params.query = "deleteMngVodData";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		params.VOD_IDX = vodIdx;
		fn_DataAjax2( params );
		location.href='${unit.move("index", "" )}';
	}
}

// $(document).on('change','[name=DATA_PC_URL]',function(){
// 	if ( !checkDetailUrl( this.value ) ) {
// 		alert('URL 형식으로 입력해주세요.');
// 		this.value = '';
// 	} 
// });

function addPart(){
	var html = "";
// 	$('#partTarget > div ').remove();
	
	for (var i = 0; i < $('[name=VOD_PART_CNT]').val(); i++) {
		if ( $('#partTarget > div ').length > i ) {
			
			for (var j = $('#partTarget > div ').length; j > 0 ; j--) {
				if ( j > $('[name=VOD_PART_CNT]').val() ) {
					$('#partTarget > div ').eq( (j-1) ).remove();
				}
			}
			
		}else{
			html += '<div><input placeholder="파트명을 입력해주세요" class="VOD_PART" name="VOD_PART" id="VOD_PART_ID'+(i+1)+'" /> : 파트명 '+(i+1)+'</div>';
		}
		
	}
	
	$('#partTarget').append( html );
	
	
	$('[name=SELECT_PART]').empty();
	
	var html2 = "<option value=''>선택</option>";
	for (var i = 0; i < $('[name=VOD_PART_CNT]').val(); i++) {
		html2 += '<option value="'+(i+1)+'">'+(i+1)+'</option>';
	}
	
	$('[name=SELECT_PART]').append( html2 );
	
	
	
}

function getRunn( URL ){
	var json = getYojiiFileInfo( URL );
	
	function isEmpty(obj) {
		  for (let key in obj) {
		    // if the loop has started, there is a property
		    return false;
		  }
		  return true;
	}	
	
	if ( isEmpty(json) ) 
		return '0';
	else
		return json.playtime;
}


</script>

