<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDateValue"><fmt:formatDate value="${now}" pattern="yyyyMM" /></c:set>
<!-- 쓰기  시작-->	
<div><a href='${unit.move("tab", out.params.coupIdx, "coup", "coup_edit" )}' class="btn  btn-md"  style="float:left;margin-right:4px;font-weight:bold; background-color:#f4b183;">쿠폰 생성</a></div> 
<div class="iHateBirthDay"><a href='${unit.move("edit", out.params.coupIdx, "coup" )}' class="btn  btn-md"  style="float:left; margin-right:4px;">대상 지정</a></div>
<div class="iHateBirthDay"><a href='${unit.move("tab", out.params.coupIdx, "coup", "coup_list" )}' class="btn  btn-md"  style="float:left;">쿠폰 리스트</a></div>

<style>
	#USE_CATE span{  margin-left: 5px;}
</style>

	<div class="tbl_view" style="margin-top:50px;">
		<table class="view_tbl01" summary="" id="searchArea">
			<caption>쿠폰생성 관리 테이블</caption>
			<colgroup>
				<col style="width: 15%;"/>
				<col style="width: 35%;"/>
				<col style="width: 15%;"/>
				<col/>
			</colgroup>
			<tbody id="target">
				<tr>
					<th scope="row">쿠폰명<span style="color:red;">*</span></th>
					<td colspan="3">
						<input type="text" name="COUP_NM" value="" class="form-control form-control-sm col-8">
					</td>
				</tr>
				<tr>
					<th>배너이미지<span style="color:red">*</span></th>
					<td colspan="3">
						<div class="fileArea">				
							<input type="file" id="COUP_UUID_FILE" name="COUP_UUID_FILE" style="display:none;margin-left:0px;" maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" 
									maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."
									maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."
									totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."
									onclick="imgIdValue = $(this).attr('id');"
									onchange="checkFileTypeImg(this.value);"
							/>	
							<label class="btn btn-sm btn-outline-secondary" for="COUP_UUID_FILE" >파일선택</label>
												<span class="file_possible" style="color:red !important;">( 이미지사이즈- 180px*90px ,이미지 파일 jpg, png, gif )</span>							
							<div class="fileList" id="COUP_UUID_FILEList"></div>
							<input id="COUP_UUID" name="COUP_UUID" type="hidden" />
							<div id="COUP_UUID_FILEListClone" style="display:none;">
							<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>
							</div>											
						</div>
					</td>
				</tr>	
				<tr>
					<th scope="row">구분<span style="color:red;">*</span></th>
					<td id="COUP_TYPE_TET">
						<input  name=COUP_TYPE  type="hidden" class="form-control form-control-sm col-5" title="마스터 영역" />
					</td>
					<th scope="row" class="JOIN_COUP">사용방식<span style="color:red;">*</span></th>
					<td  class="JOIN_COUP">
						<div class="form-inline">
							<div class="designRadiobutton form-control-sm">
								<input type="radio" id="radio0_1" name="COUP_KIND" value="COU01" checked />
								<label for="radio0_1" class="label_txt">등록형</label>
							</div>
							<div class="designRadiobutton form-control-sm">
								<input type="radio" id="radio0_2" name="COUP_KIND" value="COU02"  />
								<label for="radio0_2" class="label_txt">다운로드형</label>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="JOIN_COUP">유효기간<span style="color:red;">*</span></th>
					<td colspan="3"  class="JOIN_COUP">
						<div class="designRadiobutton  form-inline" style="display: block;">
							<input type="text" name="COUP_STR_DTM" class="datepicker form-control form-control-sm " readonly="readonly" >
							~
							<input type="text" name="COUP_END_DTM" class="datepicker form-control form-control-sm " readonly="readonly" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">사용기간(일)<span style="color:red;">*</span></th>
					<td colspan="3">
						<input type="text" name="COUP_USE_DATE" class="form-control form-control-sm col-2">
					</td>
				</tr>
				<tr>
					<th scope="row">서비스 카테고리<span style="color:red;">*</span></th>
					<td colspan="3">
						<div class="form-inline">
							<select  name=COUP_SERV_CD class="form-control form-control-sm col-2" title="마스터 영역" >
								<option value="">-- 구분 --</option>
							</select>
							<span onclick="addCoupServ();" style="margin-left:10px; width: 20px; text-align: center;">+</span>
						</div>
						<div id="USE_SERV" style="margin-top: 5px;"></div>
					</td>
				</tr>
				<tr>
					<th scope="row">가능 카테고리<span style="color:red;">*</span></th>
					<td colspan="3">
						<div class="form-inline">
							<select  name=COUP_CATE_CD class="form-control form-control-sm col-2" title="마스터 영역" >
								<option value="">-- 구분 --</option>
							</select>
							<span onclick="addCoupCate();" style="margin-left:10px; width: 20px; text-align: center;">+</span>
						</div>
						<div id="USE_CATE" style="margin-top: 5px;"></div>
					</td>
				</tr>
				<tr>
					<th scope="row">가격제한</th>
					<td colspan="3">
						<div class="form-inline">
							<input type="text"  name="COUP_MINI" value="" class=" form-control form-control-sm col-2 mr10" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
							<select  name=COUP_MINI_TYPE class="form-control form-control-sm col-2" title="마스터 영역" >
								<option value="">-- 구분 --</option>
								<option value="U">이상</option>
								<option value="D">이하</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">할인종류<span style="color:red;">*</span></th>
					<td colspan="3">
						<div class="form-inline">
							<select  name=COUP_DISC_CD class="form-control form-control-sm col-2 mr10" title="마스터 영역" >
							</select>
							<input type="text"  name="COUP_DISC" value="" class=" form-control form-control-sm col-2 mr10" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">발행건수<span style="color:red;">*</span></th>
					<td colspan="3">
						<div class="form-inline">
							<input type="text"  name="COUP_ISSU" value="" class=" form-control form-control-sm col-2">
							<span class="ml10"> 건 (전체사용은 0을 입력)</span>
						</div>
					</td>
				</tr>
							
			</tbody>
		</table>
	</div>
	
	<div class="btn_wrap" id="writeBtn">
		<a href='${unit.move("index", "" )}' class="btn  btn-md btn-outline-dark"  style="float:left;">목록</a>
		<a class="btn btn-md btn_key_color" onclick="fn_BtnRegist();" style="float:right; width: 140px;">쿠폰매칭 생성</a>
	</div>



<!-- ckeditor.js -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script> -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/inline/ckeditor.js"></script> -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/balloon-block/ckeditor.js"></script> -->

<script type="text/javascript">

var coupIssuCnt = 0;
var birthCoupIdx = 0;
var date = new Date();

$(function(){
	fn_SelectAllOption("CAT", "COUP_CATE_CD");
	fn_SelectAllOption("PRD","COUP_SERV_CD"); 
	fn_SelectOption("","DIS","COUP_DISC_CD"); 
	
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectMngCoupDetail";
	params.COUP_IDX = "${out.params.coupIdx }";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	
	var result = fn_DataDetail( params );
	$.each(result ,function(key1, val1) {
		$.each(val1,function(key, val) {
			if( key.indexOf("IDX") > -1 ) $('#'+key+'').val(val);
			else if ( key.indexOf("COUP_CATE_CD") > -1 ) {}
			else if ( key.indexOf("COUP_SERV_CD") > -1 ) {}
			else $('[name='+key+']').val(val);
		});
		
		if ( val1.USER_COUP_CNT > 0 ) $('.btn_key_color').remove();
		if ( val1.COUP_TYPE_CD == 'CPT02' ) $('.btn_key_color').remove();
		
	});
	
	$( '#COUP_TYPE_TET' ).append( result[0].COUP_TYPE );
	$( '[name=COUP_TYPE]' ).val( result[0].COUP_TYPE_CD );
	
	if ( result[0].COUP_KIND_CD == 'COU01' ) {
		$( '#radio0_1' ).prop( 'checked', true );
	}else{
		$( '#radio0_2' ).prop( 'checked', true );
	}
	
	
	
	// 1번 쿠폰은 회우너가입쿠폰 특수한 기능을 한다
	if ( result[0].COUP_TYPE_CD == 'CPT02' ) {
		$('#target tr').eq(3).hide();
		$('#target tr').eq(5).hide();
		$('#target tr').eq(8).hide();
		
		$('.JOIN_COUP').hide();
		
		$('.iHateBirthDay').hide();
		
		birthCoupIdx = result[0].COUP_IDX;
	}
	
	coupIssuCnt = result[0].COUP_CNT ;
	
	var COUP_CATE_CD = result[0].COUP_CATE_CD.split(',');
	
	$.each(COUP_CATE_CD, function( k ,v){
		$('[name=COUP_CATE_CD] option').each(function(k){
			if ( this.value == v )
				$('#USE_CATE').append( '<span onclick="$(this).remove();" class="btn btn_td4" id="'+v+'">'+$('[name=COUP_CATE_CD] option[value="'+v+'"]').text()+'<span class="btn_xxx" onclick="$(this).parent().remove();">x</span>'+'</span>'  );
		});
	});

	var COUP_SERV_CD = result[0].COUP_SERV_CD.split(',');
	
	$.each(COUP_SERV_CD, function( k ,v){
		$('[name=COUP_SERV_CD] option').each(function(k){
			if ( this.value == v )
				$('#USE_SERV').append( '<span onclick="$(this).remove();" class="btn btn_td4" id="'+v+'">'+$('[name=COUP_SERV_CD] option[value="'+v+'"]').text()+'<span class="btn_xxx" onclick="$(this).parent().remove();">x</span>'+'</span>'  );
		});
	});
	
});


$(document).on('change','[name=COUP_MINI],[name=COUP_DISC]', function(){
	this.value = Number(this.value);
});


function fn_BtnRegist(){
	
	if ( $('[name=COUP_NM]').val().trim() == '' || $('[name=COUP_NM]').val().trim() == null ) return alert('쿠폰명을 입력해 주세요.');
	
// 	if ( $('[name=COUP_TYPE]').val().trim() == '' || $('[name=COUP_TYPE]').val().trim() == null ) return alert('구분을 선택해 주세요.');
	
	if ( $('[name=COUP_TYPE]').val().trim() == 'CPT01' ) {
		if ( $('[name=COUP_KIND]:checked').val().trim() == '' || $('[name=COUP_KIND]:checked').val().trim() == null ) return alert('사용방식을 선택해 주세요.');
		if ( $('[name=COUP_STR_DTM]').val().trim() == '' || $('[name=COUP_STR_DTM]').val().trim() == null ) return alert('유효기간을 입력해 주세요.');
		if ( $('[name=COUP_END_DTM]').val().trim() == '' || $('[name=COUP_END_DTM]').val().trim() == null ) return alert('유효기간을 입력해 주세요.');
	}
	
	if ( $('[name=COUP_USE_DATE]').val().trim() == '' || $('[name=COUP_USE_DATE]').val().trim() == null ) return alert('사용기간(일)을 입력해 주세요.');
	if ( $('#USE_SERV > span').length == 0 ) return alert('서비스 카테고리를 추가해 주세요');
	if ( $('#USE_CATE > span').length == 0 ) return alert('가능 카테고리를 추가해 주세요');
// 	if ( $('[name=COUP_MINI]').val().trim() == '' || $('[name=COUP_MINI]').val().trim() == null ) return alert('가격제한을 입력해 주세요.');
// 	if ( $('[name=COUP_MINI_TYPE]').val().trim() == '' || $('[name=COUP_MINI_TYPE]').val().trim() == null ) return alert('가격제한 종류를 선택해 주세요.');
	if ( $('[name=COUP_DISC_CD]').val().trim() == '' || $('[name=COUP_DISC_CD]').val().trim() == null ) return alert('할인 종류를 선택해 주세요.');
	if ( $('[name=COUP_DISC]').val().trim() == '' || $('[name=COUP_DISC]').val().trim() == null ) return alert('할인율을 입력해 주세요.');
	if ( $('[name=COUP_ISSU]').val().trim() == '' || $('[name=COUP_ISSU]').val().trim() == null ) return alert('발행건수를 입력해 주세요.');
	
	if ( $('[name=COUP_TYPE]').val() == 'CPT02' ) {
		$('[name=COUP_ISSU]').val('1');
	}
	
	var params = new Object();
	params.status = "DETAIL";
	params.coupIssu = $('[name=COUP_ISSU]').val();
	params.COUP_IDX = '${out.params.coupIdx}';
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.query = "selectMngHaveUserCoupCnt";
	var haveUserCoupCnt = fn_DataAjax2( params );
	
	
	if ( haveUserCoupCnt.out.detail.data[0].HAVE_USER_COUP_CNT > $('[name=COUP_ISSU]').val() && $('[name=COUP_ISSU]').val() != 0 ) {
			return alert( '쿠폰 대상이 모두 지정되었습니다. 지정된 대상이 없는 만큼 건수 하향 수정이 가능합니다.' );
	} else{
		
			var params = unit_getParams("target");
			params.status = "LIST";
			params.query = "selectMngHaveNoUserCoupList";
			params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
			params.COUP_IDX = '${out.params.coupIdx}';
			var result = fn_DataAjax2( params );
			var noUserCoupList = result.out.detail.data;
		
			var params = unit_getParams("target");
			params.status = "EDIT";
			params.query = "updateMngCoupData";
			params.COUP_IDX = '${out.params.coupIdx}';
			params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
			
			var COUP_SERV_CD = "";
			$('#USE_SERV > span').each(function(k){
				if (k == 0) 
				COUP_SERV_CD += $(this).attr('id');
				else
				COUP_SERV_CD += ','+ $(this).attr('id');
			});
			params.COUP_SERV_CD = COUP_SERV_CD;
			
			var COUP_CATE_CD = "";
			$('#USE_CATE > span').each(function(k){
				if (k == 0) 
				COUP_CATE_CD += $(this).attr('id');
				else
				COUP_CATE_CD += ','+ $(this).attr('id');
			});
			params.COUP_CATE_CD = COUP_CATE_CD;
			
			var result = fn_DataAjax2( params );
			
			if ( result.out.resultCnt > 0) {
				
				if (birthCoupIdx != 0) {
					// 회원가입쿠폰
					location.href='${unit.move("index", "" )}';	
				}else{
				
					// 일반쿠폰들
					if( $('[name=COUP_ISSU]').val() == 0 ){
						
						var params = unit_getParams("target");
						params.status = "WRITE";
						params.query = "insertMngCoupDataData";
						params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
						params.COUP_IDX =  '${out.params.coupIdx}';
						
						var params2 = new Object();
						params2.status = "DETAIL";
						params2.query = "selectMngUserCnt";
						params2.mngLoginIdx = localStorage.getItem("mngLoginIdx");
						var userCnt = fn_DataAjax2( params2 );
						
						if ( userCnt.out.detail.data[0].USER_CNT-coupIssuCnt > 0 ) {
							for (var i = 0; i < userCnt.out.detail.data[0].USER_CNT-coupIssuCnt  ; i++) {
								params.COUP_DATA_CD = '${sysDateValue}' + ('0'+date.getDate()).slice(-2) + uuidv4().replace(/\-/g,'').toUpperCase().substr(0, 10);
								fn_DataAjax2( params );
							}
						}else if ( userCnt.out.detail.data[0].USER_CNT-coupIssuCnt == 0 ) {
							var params = new Object();
							params.status = "DELETE";
							params.query = "deleteMngCoupDataData";
							params.COUP_IDX = '${out.params.coupIdx}';
							params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
							fn_DataAjax2( params );
						}else if( userCnt.out.detail.data[0].USER_CNT < coupIssuCnt ){
							
								var params = new Object();
								params.status = "DELETE";
								params.query = "deleteMngCoupDataData";
								params.COUP_IDX = '${out.params.coupIdx}';
								params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
								
								for (var i = 0; i < ( coupIssuCnt - userCnt.out.detail.data[0].USER_CNT ); i++) {
									params.DATA_IDX = noUserCoupList[i].DATA_IDX;
									fn_DataAjax2( params );
								}
						}
							
						
					}else if ( coupIssuCnt < $('[name=COUP_ISSU]').val() ) {
						/* 발행건수가 기존보다 많을때 */
						var params = unit_getParams("target");
						params.status = "WRITE";
						params.query = "insertMngCoupDataData";
						params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
						params.COUP_IDX =  '${out.params.coupIdx}';
						
						for (var i = 0; i < ($('[name=COUP_ISSU]').val() - coupIssuCnt) ; i++) {
							params.COUP_DATA_CD = '${sysDateValue}' + ('0'+date.getDate()).slice(-2) + uuidv4().replace(/\-/g,'').toUpperCase().substr(0, 10);
							fn_DataAjax2( params );
						}
					
						
					}else if ( coupIssuCnt > $('[name=COUP_ISSU]').val() ) {
						/* 발행건수가 기존보다 적을때 */
						if ( $('[name=COUP_ISSU]').val() > haveUserCoupCnt.out.detail.data[0].HAVE_USER_COUP_CNT ) {
							// null = > N
							var params = new Object();
							params.status = "DELETE";
							params.query = "deleteMngCoupDataData";
							params.COUP_IDX = '${out.params.coupIdx}';
							params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
							
							for (var i = 0; i < ( coupIssuCnt - $('[name=COUP_ISSU]').val() ); i++) {
								params.DATA_IDX = noUserCoupList[i].DATA_IDX;
								fn_DataAjax2( params );
							}
								
						}else if ( $('[name=COUP_ISSU]').val() == haveUserCoupCnt.out.detail.data[0].HAVE_USER_COUP_CNT ) {
							// null = > N
							var params = new Object();
							params.status = "DELETE";
							params.query = "deleteMngCoupDataData";
							params.COUP_IDX = '${out.params.coupIdx}';
							params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
							fn_DataAjax2( params );
						}
						
					}
					
					if ( $('[name=COUP_ISSU]').val() == 0 ) {
						if ( birthCoupIdx == 1 ) location.href='${unit.move("index", "" )}';	
						else location.href='${unit.move("tab", out.params.coupIdx, "coup", "coup_list" )}';
					} else location.href='${unit.move("edit", out.params.coupIdx, "coup" )}';
				}	
			}
	}
}

function addCoupCate(){
	if( $('[name=COUP_CATE_CD]').val( ) != '' ){
		var isc = true;
		
		$('#USE_CATE span').each(function(){
			if( $(this).attr('id') == $('[name=COUP_CATE_CD] option:checked').val() ) isc = false;
			if ( $(this).attr('id') == 'ALL' || $('[name=COUP_CATE_CD] option:checked').val() == 'ALL' ) $('#USE_CATE').empty();
		});
		
		if (isc) $('#USE_CATE').append( '<span onclick="$(this).remove();" class=" btn btn_td4" id="'+$('[name=COUP_CATE_CD] option:checked').val()+'">'+$('[name=COUP_CATE_CD] option:checked').text()+'<span class="btn_xxx" onclick="$(this).parent().remove();">x</span>'+'</span>' );
		
	}
}

function addCoupServ(){
	if( $('[name=COUP_SERV_CD]').val( ) != '' ) {
		var isc = true;
		var coach = false;
		
		$('#USE_SERV span').each(function(){
			if( $(this).attr('id') == $('[name=COUP_SERV_CD] option:checked').val() ) isc = false;
			if ( $(this).attr('id') == 'ALL' || $('[name=COUP_SERV_CD] option:checked').val() == 'ALL' ) $('#USE_SERV').empty();
			if ( this.id == 'PRD01' ) coach = true;
		});
		
		if (isc) $('#USE_SERV').append( '<span class=" btn btn_td4" id="'+$('[name=COUP_SERV_CD] option:checked').val()+'">'+$('[name=COUP_SERV_CD] option:checked').text()+'<span class="btn_xxx" onclick="$(this).parent().remove();">x</span>'+'</span>' );
		
		if (coach) {
			$('#USE_SERV span').each(function(){
				if( this.id == 'PRD02' || this.id == 'PRD03' || this.id == 'PRD04'  ) $(this).remove();
			});
		}
		
	}
}

</script>

