<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDateValue"><fmt:formatDate value="${now}" pattern="yyyyMM" /></c:set>
<!-- 쓰기  시작-->	
<div ><a onclick="showRegiest1(this);" class="btn  btn-md acticeMenu"  style="float:left;margin-right:4px;">쿠폰 생성</a></div> 
<div class="regiest2"><a onclick="showRegiest2(this);" class="btn  btn-md acticeMenu"  style="float:left; margin-right:4px;">대상 지정</a></div>
<div class="regiest3"><a onclick="showRegiest3(this);" class="btn  btn-md acticeMenu"  style="float:left;">쿠폰 리스트</a></div>

<script type="text/javascript">
	function showRegiest1(t){
		$('#coupWrite').show();
		$('#coupTarget').show();
		$('#coupList').hide();
		$('.acticeMenu').removeClass('acticeMenu');
		$(t).addClass('acticeMenu');
	}
	function showRegiest2(t){
		$('#coupWrite').show();
		$('#coupTarget').show();
		$('#coupList').hide();
		$('.acticeMenu').removeClass('acticeMenu');
		$(t).addClass('acticeMenu');
	}
	function showRegiest3(t){
		$('#coupWrite').hide();
		$('#coupTarget').hide();
		$('#coupList').show();
		$('.acticeMenu').removeClass('acticeMenu');
		$(t).addClass('acticeMenu');
	}
</script>

<style>
	#USE_CATE span{ margin-left: 5px;}
	.acticeMenu{font-weight:bold; background-color:#f4b183!important;}
</style>

<div id="coupWrite">
	
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
					<td>
						<div class="form-inline">
							<select  name=COUP_TYPE class="form-control form-control-sm col-5" title="마스터 영역" >
								<option value="">-- 구분 --</option>
							</select>
						</div>
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
					<th scope="row"  class="JOIN_COUP">유효기간<span style="color:red;">*</span></th>
					<td colspan="3"  class="JOIN_COUP">
						<div class="designRadiobutton  form-inline" style="display: block;">
							<input type="text" name="COUP_STR_DTM" class="datepicker form-control form-control-sm " readonly="readonly" >
							~
							<input type="text" name="COUP_END_DTM" class="datepicker form-control form-control-sm " readonly="readonly" >
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" >사용기간(일)<span style="color:red;">*</span></th>
					<td colspan="3" >
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
</div>
<div id="coupTarget">

	<div class="btn_wrap" style="text-align: left; margin-top: 10px;">
		※ 대상자는 발행 건수를 초과할 수 없습니다.
		<br>
		※ 마스터인 경우, 쿠폰 발행대상이 되지 않습니다.
	</div>
	
	
	<div class="tbl_view">
		<table class="view_tbl01" summary="" id="searchArea">
			<caption>쿠폰 관리 테이블</caption>
			<colgroup>
				<col style="width: 15%;"/>
				<col/>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">대상자</th>
					<td>
						<div class="designRadiobutton form-control-sm">
							<input type="radio" id="radio1_1" name="COUP_TARGET" checked value="ALL" />
							<label for="radio1_1" class="label_txt">전체</label>
						</div>
						<div class="designRadiobutton form-control-sm hide0" >
							<input type="radio" id="radio1_2" name="COUP_TARGET" value="EXCEL" />
							<label for="radio1_2" class="label_txt" style="padding-right: 0;">일부</label>
							<form action="${ajaxUrl}"  id="USER_EXCEL_LIST" name="USER_EXCEL_LIST" enctype="multipart/form-data" method="post" style="display: inline;" >
								<div class="fileArea" style=" padding-right: 27px; display: inline;">				
											<input type="file" id="COUP_TARGET_EXCEL" name="COUP_TARGET_EXCEL" style="display:none;margin-left:0px;" maxsize="100" maxcount="100" totalsize="1000"
													maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."
													maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."
													totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."
													onchange="checkFileTypeExcel(this.value);"
											/>	
											<label class="btn btn-sm btn-outline-secondary" for="COUP_TARGET_EXCEL" >파일선택</label>
											<label id="fileLabel" class="btn btn-sm btn btn-dark" style="display:none; color: #fff;    background-color: #343a40;    border-color: #343a40;"></label>
								</div>
							</form>
						</div>
						<div class="designRadiobutton form-control-sm hide0">
							<input type="radio" id="radio1_3" name="COUP_TARGET" value="CLEAR" onclick="fn_clear()" />
							<label for="radio1_3" class="label_txt">초기화</label>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">리스트</th>
					<td>
						<div id="coupLIst">
						</div>
					</td>
				</tr>
							
			</tbody>
		</table>
	</div>
	
	<div class="btn_wrap" style="text-align: left;">
		※ 대상자 '일부'를 이용하기 위해서는 샘플을 다운로드 해야합니다.
		<label class="btn btn-sm btn btn-dark" style="color: rgb(255, 255, 255); background-color: rgb(52, 58, 64); border-color: rgb(52, 58, 64);" onclick="location.href ='/resources/down/PPM_COUPON_SAMPLE.xls';">샘플 다운로드</label>
	</div>
	
	<div class="btn_wrap">
		<a href='${unit.move("index", "" )}' class="btn  btn-md btn-outline-dark"  style="float:left;">목록</a>
		<a class="btn btn-md btn_key_color" onclick="fn_BtnRegist2();" style="float:right;">저장</a>
	</div>
</div>


<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<div id="coupList">

	<div class="tbl_view" style="margin-top:50px;">
		<table class="view_tbl01" summary="" id="searchArea">
			<caption>쿠폰 관리 테이블</caption>
			<colgroup>
				<col style="width: 15%;"/>
				<col style="width: 35%"/>
				<col style="width: 15%;"/>
				<col/>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">쿠폰명</th>
					<td id="COUP_NM" colspan="3">
					</td>
				</tr>
				<tr>
					<th scope="row">배너이미지</th>
					<td id="COUP_UUID_TARGET" colspan="3">
						
					</td>
				</tr>
				<tr>
					<th scope="row">구분</th>
					<td id="COUP_TYPE_TARGET">
					</td>
					<th scope="row">사용방식</th>
					<td id="COUP_KIND_TARGET">
					</td>
				</tr>
				<tr>
					<th scope="row">유효기간</th>
					<td id="COUP_PERIOD" colspan="3">
					</td>
				</tr>
				<tr>
					<th scope="row">사용기간(일)</th>
					<td id="COUP_USE_DATE_TARGET" colspan="3">
					</td>
				</tr>
				<tr>
					<th scope="row">서비스 카테고리</th>
					<td id="COUP_SERV_CD" colspan="3">
					</td>
				</tr>
				<tr>
					<th scope="row">가능 카테고리</th>
					<td id="COUP_CATE_CD" colspan="3">
					</td>
				</tr>
				<tr>
					<th scope="row">가격제한</th>
					<td id="COUP_MIN_PRICE" colspan="3">
					</td>
				</tr>
				<tr>
					<th scope="row">할인종류</th>
					<td id="COUP_DISC_NM" colspan="3">
					</td>
				</tr>
				<tr>
					<th scope="row">발행건수</th>
					<td id="COUP_ISSU_CNT" colspan="3">
					</td>
				</tr>
							
			</tbody>
		</table>
	</div>
	
	<div class="btn_wrap" style="text-align: left; margin-top: 10px;">
		<span class="red">*대상ID는 실존하는 ID이어야 합니다</span>
		<br>
		<span class="red">*마스터인 경우, 쿠폰 발행대상이 되지 않습니다.</span>
	</div>
	
	<div class="tbl_list">
			<table class="list_tbl01" summary="" >
				<caption>쿠폰 관리 테이블</caption>
				<colgroup>
					<col style="width: 5%;"/>
					<col style="width: 20%"/>
					<col/>
					<col style="width: 20%"/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">대상ID</th>
						<th scope="col">쿠폰번호</th>
						<th scope="col" id="editSave">수정</th>
					</tr>
				</thead>
				<tbody id="pageTarget">
					<tr>
						<td colspan="11">등록된 내용이 없습니다.</td>
					</tr>		
				</tbody>
			</table>
	</div>
	<div class="pagination justify-content-center paging">
		<ul style="justify-content:space-between;" id="pagingVar">
											
		</ul>
	</div>
	
	<div class="btn_wrap">
		<a href='${unit.move("index", "" )}' class="btn  btn-md btn-outline-dark" style="float: left;">목록</a>
		<a class="btn btn-md btn_key_color" onclick="fn_BtnRegist3();" style="float:right;">저장</a>
	</div>
</div>


<!-- ckeditor.js -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script> -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/inline/ckeditor.js"></script> -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/balloon-block/ckeditor.js"></script> -->

<script type="text/javascript">
$(function(){
	fn_SelectAllOption("CAT", "COUP_CATE_CD");
	fn_SelectAllOption("PRD","COUP_SERV_CD"); 
	fn_SelectOption("","DIS","COUP_DISC_CD"); 
	fn_SelectOption("","CPT","COUP_TYPE"); 
	$('#coupTarget').hide();
	$('#coupList').hide();
	$('.regiest2').hide();
	$('.regiest3').hide();
	
});

var COUP_IDX = '';

var date = new Date();

function fn_BtnRegist(){
	
	if ( $('[name=COUP_NM]').val().trim() == '' || $('[name=COUP_NM]').val().trim() == null ) return alert('쿠폰명을 입력해 주세요.');
	
	if ( $('[name=COUP_TYPE]').val().trim() == '' || $('[name=COUP_TYPE]').val().trim() == null ) return alert('구분을 선택해 주세요.');
	
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
	
	var params = unit_getParams("target");
	params.status = "WRITE";
	params.query = "insertMngCoupData";
	params.coupCd = '${sysDateValue}'+"CP";
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
		var params = unit_getParams("target");
		params.status = "DETAIL";
		params.query = "selectMngCoupIdx";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		var result = fn_DataAjax2( params );
		
		var params = unit_getParams("target");
		params.status = "WRITE";
		params.query = "insertMngCoupDataData";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		params.COUP_IDX = result.out.detail.data[0].COUP_IDX;
		
		console.log(params.COUP_ISSU);
		if ( params.COUP_ISSU == 0 ) {
			var params2 = new Object();
			params2.status = "DETAIL";
			params2.query = "selectMngUserCnt";
			params2.mngLoginIdx = localStorage.getItem("mngLoginIdx");
			var userCnt = fn_DataAjax2( params2 );
			
			for (var i = 0; i < userCnt.out.detail.data[0].USER_CNT; i++) {
				params.COUP_DATA_CD = '${sysDateValue}' + ('0'+date.getDate()).slice(-2) + uuidv4().replace(/\-/g,'').toUpperCase().substr(0, 10);
				fn_DataAjax2( params );
			}
			
		}else{
		
			for (var i = 0; i < result.out.detail.data[0].COUP_ISSU; i++) {
				params.COUP_DATA_CD = '${sysDateValue}' + ('0'+date.getDate()).slice(-2) + uuidv4().replace(/\-/g,'').toUpperCase().substr(0, 10);
				fn_DataAjax2( params );
			}
		}
		
		if ( $('[name=COUP_TYPE]').val() == 'CPT02' ) {
			
			return location.href='${unit.move("index", "" )}';	
		}
		
		var params = new Object();
		params.query = "selectMngInsertCoupIdx";
		params.status = "DETAIL";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		var coup = fn_DataAjax2( params );
		COUP_IDX = coup.out.detail.data[0].COUP_IDX;
		
		$('#coupTarget').show();
		$('.regiest2').show();
		$('#writeBtn').hide();
		
		if ( $('[name=COUP_ISSU]').val() == 0 ) {
			$('.hide0').hide();
		}
		
		$('.acticeMenu').removeClass('acticeMenu');
		$('.regiest2 a').addClass('acticeMenu');
		
	}

	$('#COUP_TYPE_TARGET').text( $('[name=COUP_TYPE] option:checked' ).text() );
	$('#COUP_KIND_TARGET').text( $('[name=COUP_KIND]:checked' ).siblings('label').text() );
	$('#COUP_USE_DATE_TARGET').text( $('[name=COUP_USE_DATE]' ).val() );

}

function addCoupCate(){
	
	if( $('[name=COUP_CATE_CD]').val( ) != '' ){
		var isc = true;
		$('#USE_CATE span').each(function(){
			if( $(this).attr('id') == $('[name=COUP_CATE_CD] option:checked').val() ){
				isc = false;				
			}
			if ( $(this).attr('id') == 'ALL' || $('[name=COUP_CATE_CD] option:checked').val() == 'ALL' ) {
				$('#USE_CATE').empty();
			}
		});
		
		if (isc) 
			$('#USE_CATE').append( '<span class=" btn btn_td4" id="'+$('[name=COUP_CATE_CD] option:checked').val()+'">'+$('[name=COUP_CATE_CD] option:checked').text()+'<span class="btn_xxx" onclick="$(this).parent().remove();">x</span>'+'</span>' );
		
	}
}

function addCoupServ(){
	
	if( $('[name=COUP_SERV_CD]').val( ) != '' ){
		var isc = true;
		var coach = false;
		$('#USE_SERV span').each(function(){
			if( $(this).attr('id') == $('[name=COUP_SERV_CD] option:checked').val() ){
				isc = false;				
			}
			if ( $(this).attr('id') == 'ALL' || $('[name=COUP_SERV_CD] option:checked').val() == 'ALL' ) {
				$('#USE_SERV').empty();
			}
			if ( this.id == 'PRD01' ) {
				coach = true;
			}
			
		});
		
		if (isc) 
			$('#USE_SERV').append( '<span class=" btn btn_td4" id="'+$('[name=COUP_SERV_CD] option:checked').val()+'">'+$('[name=COUP_SERV_CD] option:checked').text()+'<span class="btn_xxx" onclick="$(this).parent().remove();">x</span>'+'</span>' );
		
		if (coach) {
			$('#USE_SERV span').each(function(){
				if( this.id == 'PRD02' || this.id == 'PRD03' || this.id == 'PRD04'  ){
					$(this).remove();
				}
			});
		}
		
	}
}


$('[name=COUP_TYPE]').on('change',function(){
	if ( this.value == 'CPT01' ) {
		$('.JOIN_COUP').show();
	}else{
		$('.JOIN_COUP').hide();
		$('[name=COUP_KIND]').removeAttr('checked');
		$('[name=COUP_STR_DTM]').val('');
		$('[name=COUP_END_DTM]').val('');
	}
});


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////대상지정////////////////////////대상지정//////////////////////////대상지정//////////////////////대상지정//////////대상지정///////////////////대상지정//////대상지정///////대상지정////////대상지정//////////대상지정/////////대상지정////////////////
///////////////////////////////////대상지정/////////////////////////////////대상지정////////////////////////////////////////////대상지정////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////대상지정////////////////////////대상지정//////////////////////////대상지정//////////////////////대상지정//////////대상지정///////////////////대상지정//////대상지정///////대상지정////////대상지정//////////대상지정/////////대상지정////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////대상지정////////////////////////대상지정//////////////////////////대상지정//////////////////////대상지정//////////대상지정///////////////////대상지정//////대상지정///////대상지정////////대상지정//////////대상지정/////////대상지정////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////대상지정////////////////////////대상지정//////////////////////////대상지정//////////////////////대상지정//////////대상지정///////////////////대상지정//////대상지정///////대상지정////////대상지정//////////대상지정/////////대상지정////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////대상지정////////////////////////대상지정//////////////////////////대상지정//////////////////////대상지정//////////대상지정///////////////////대상지정//////대상지정///////대상지정////////대상지정//////////대상지정/////////대상지정////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////대상지정////////////////////////대상지정//////////////////////////대상지정//////////////////////대상지정//////////대상지정///////////////////대상지정//////대상지정///////대상지정////////대상지정//////////대상지정/////////대상지정////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
var delList = [];
// 쿠폰 삭제한 후 다시 생성해준다
function fn_delete(){
	
	var params = new Object();
	params.status = "DELETE";
	params.query = "deleteMngCoupData";
	params.COUP_IDX = COUP_IDX;
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");

	$.each(delList ,function( k, v ){
		params.DATA_IDX = v;
		fn_DataAjax2( params );
	});
}

$("#COUP_TARGET_EXCEL").change(function(){
    var fileValue = $(this).val().split("\\");
    var fileName = fileValue[fileValue.length-1];
    $('#fileLabel').show();
    $('#fileLabel').text( fileName );
    
    $('[name=COUP_TARGET]:radio[value=EXCEL]').prop("checked", true);
    
    
//     alert('작동입니다');
    
	var form = $("#USER_EXCEL_LIST")[0];
	var data = new FormData(form);
	
	$.ajax({
       	url : '/mng/coup/ajax2?COUP_IDX='+COUP_IDX,
       	contentType: "application/x-www-form-urlencoded; charset=UTF-8",
       	enctype: 'multipart/form-data',
       	processData: false,
        contentType: false,
        cache: false,
       	data : data,
        success : function(data) {
        	
//         	 INFO |---------|---------|---------|-------------| 
//         	 INFO |DATA_IDX |USER_IDX |IDX_LIST |NM_LIST      | 
//         	 INFO |---------|---------|---------|-------------| 
//         	 INFO |13       |[null]   |5,4,1    |회원2,회원1,마스터1 | 
//         	 INFO |14       |[null]   |5,4,1    |회원2,회원1,마스터1 | 
//         	 INFO |15       |[null]   |5,4,1    |회원2,회원1,마스터1 | 
//         	 INFO |16       |[null]   |5,4,1    |회원2,회원1,마스터1 | 
//         	 INFO |---------|---------|---------|-------------| 
        	 
        	 
        	 
			alert("업로드가 완료되었습니다.");
//             location.reload();
			if ( data.out.detail.data.length > 0 ) {
				var html = "";
				var idxList = data.out.detail.data[0].IDX_LIST;
				var idxListArr = idxList.split(',');
				var nmList = data.out.detail.data[0].NM_LIST;
				var nmListArr = nmList.split(',');
				var exceptDataIdx = '';
				
				$.each(idxListArr, function(key, val){
					var insertCheck = 0;
					$.each(  data.out.detail.data ,function( k ,v ){
						if( exceptDataIdx.indexOf( v.DATA_IDX ) < 0 ) {
							$('.user').each(function(k1, v1){
								if( $(this).attr('id') == val ) insertCheck = 99;
							});
								
							if( insertCheck == 0 ) {
								if( v.USER_IDX == null ) {
								
									html += '<span class="btn btn-sm btn_td4 upload" onclick="delList.push(this.id); " id="'
										+ v.DATA_IDX+'">'
										+ nmListArr[key]+'<span class="user" id="'
										+ val+'"></span><span class="btn_xxx" onclick="$(this).parent().remove();">x</span>'+'</span> </span>';
									insertCheck = 99;
									exceptDataIdx += v.DATA_IDX+',';
								}
							}
						}
					});
				});
				
// 				$.each(  data.out.detail.data ,function( k ,v ){
// 					html += '<span class="btn btn-sm btn-outline-dark upload" onclick="delList.push(this.id); $(this).remove();" id="'+v.DATA_IDX+'">'+v.USER_NM+'<span class="user" id="'+v.USER_IDX+'"></span></span>';
// 				});
				$('#coupLIst').append( html );
			}
        },
        error : function(data){
        	alert('업로드에 실패했습니다.');
        },
        type : "POST"
    }); 
    
});


function fn_clear(){
	$('#coupLIst').empty();
	$('#fileLabel').hide();
	$('#COUP_TARGET_EXCEL').val('');
// 	$('[name=COUP_TARGET]:radio[value=EXCEL]').prop("checked", true);
}

function fn_BtnRegist2(){
	
	fn_delete();
	
	var params = new Object();
	params.status = "LIST";
	params.query = "selectMngCoupNoUserList";
	params.COUP_IDX = COUP_IDX;
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	
	var coupList = fn_DataAjax2( params );
	
	if( $('[name=COUP_TARGET]:checked').val() == 'ALL' ){
		var params = new Object();
		params.status = "LIST";
		params.query = "selectNoCoupUserList";
		params.COUP_IDX = COUP_IDX;
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		var userList = fn_DataAjax2( params );
		userList = userList.out.detail.data.sort(function(){
			return Math.random() - Math.random();
		});
		
		var params = new Object();
		params.status = "EDIT";
		params.query = "addMngUserCoupData";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		if ( coupList.out.detail.data.length ) {
			$.each(userList,function( k , v ){
				if( coupList.out.detail.data.length > k ){
					params.USER_IDX = v.USER_IDX;
					params.DATA_IDX = coupList.out.detail.data[k].DATA_IDX;
					fn_DataAjax2( params );
				}
			});
		}
	}else if( $('[name=COUP_TARGET]:checked').val() == 'EXCEL' ){
		console.log('excel');
		
		$('#coupLIst > span').each(function(k){
			if ($(this).filter('.upload')) {
				var params = new Object();
				params.status = "EDIT";
				params.query = "addMngUserCoupData";
				params.DATA_IDX = this.id;
				params.USER_IDX = $(this).find('.user').attr('id');
				params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
				fn_DataAjax2( params );
// 				console.log(params);
			}
		});
	}
	
	$('.acticeMenu').removeClass('acticeMenu');
	$('.regiest3 a').addClass('acticeMenu');
	
	$('#coupList').show();
	$('.regiest3').show();
	$('#coupTarget').hide();
	$('#coupWrite').hide();
	showPage();
	
	$('#COUP_UUID_TARGET').append( '<div class="fileList" style="display:block;">'+$('#COUP_UUID_FILEList').html()+'</div>' );
	
	$('span.close').remove();
// 		location.href='${unit.move( "index", "" ) }';
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////쿠폰 리스트////////////////////////쿠폰 리스트//////////////////////////쿠폰 리스트//////////////////////쿠폰 리스트//////////쿠폰 리스트///////////////////쿠폰 리스트//////쿠폰 리스트///////쿠폰 리스트////////쿠폰 리스트//////////쿠폰 리스트/////////쿠폰 리스트////////////////
///////////////////////////////////쿠폰 리스트/////////////////////////////////쿠폰 리스트////////////////////////////////////////////쿠폰 리스트////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////쿠폰 리스트////////////////////////쿠폰 리스트//////////////////////////쿠폰 리스트//////////////////////쿠폰 리스트//////////쿠폰 리스트///////////////////쿠폰 리스트//////쿠폰 리스트///////쿠폰 리스트////////쿠폰 리스트//////////쿠폰 리스트/////////쿠폰 리스트////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////쿠폰 리스트////////////////////////쿠폰 리스트//////////////////////////쿠폰 리스트//////////////////////쿠폰 리스트//////////쿠폰 리스트///////////////////쿠폰 리스트//////쿠폰 리스트///////쿠폰 리스트////////쿠폰 리스트//////////쿠폰 리스트/////////쿠폰 리스트////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////쿠폰 리스트////////////////////////쿠폰 리스트//////////////////////////쿠폰 리스트//////////////////////쿠폰 리스트//////////쿠폰 리스트///////////////////쿠폰 리스트//////쿠폰 리스트///////쿠폰 리스트////////쿠폰 리스트//////////쿠폰 리스트/////////쿠폰 리스트////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////쿠폰 리스트////////////////////////쿠폰 리스트//////////////////////////쿠폰 리스트//////////////////////쿠폰 리스트//////////쿠폰 리스트///////////////////쿠폰 리스트//////쿠폰 리스트///////쿠폰 리스트////////쿠폰 리스트//////////쿠폰 리스트/////////쿠폰 리스트////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////쿠폰 리스트////////////////////////쿠폰 리스트//////////////////////////쿠폰 리스트//////////////////////쿠폰 리스트//////////쿠폰 리스트///////////////////쿠폰 리스트//////쿠폰 리스트///////쿠폰 리스트////////쿠폰 리스트//////////쿠폰 리스트/////////쿠폰 리스트////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function showPage(){
	
 	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectMngCoupDetail";
	params.COUP_IDX = COUP_IDX;
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	
	var result = fn_DataDetail( params );
	$.each(result ,function(key1, val1) {
		$.each(val1,function(key, val) {
			if( key.indexOf("IDX") > -1 ) $('#'+key+'').val(val);
			else if ( key.indexOf("COUP_CATE_CD") > -1 ) {}
			else $('#'+key+'').html(val);
		});
	});	
	
	if ( result[0].COUP_MINI == '' || result[0].COUP_MINI == null )
		$('#COUP_MIN_PRICE').text('없음');

	if ( result[0].COUP_ISSU == 0 ) {
		$('#COUP_ISSU_CNT').html( '전체' );
		$("#radio1_1").prop("checked", true);
	}else{
		$("#radio1_2").prop("checked", true);
	}
	
	// 기능 카테고리 값 만들기
	var coupCates = result[0].COUP_CATE_CD.split(',');
	var COUP_CATE_CD = "전체";
	var allOption = fn_SelectAllOption("CAT", "NO_TAG");
	$.each( coupCates, function( key, value ){
		$.each( allOption, function( k, v ){
			if ( value == v.CODE_ID ){
				if ( key == 0 ) 
					COUP_CATE_CD = v.CODE_NM;
				else
					COUP_CATE_CD += ', ' + v.CODE_NM;
			}
		});
	});
	
	$('#COUP_CATE_CD').text( COUP_CATE_CD );
	// 기능 카테고리 값 만들기 end
	
	// 서비스 카테고리 값 만들기
	var coupCates = result[0].COUP_SERV_CD.split(',');
	var COUP_SERV_CD = "전체";
	
	var allOption = fn_SelectAllOption("PRD", "NO_TAG");
	$.each( coupCates, function( key, value ){
		$.each( allOption, function( k, v ){
			if ( value == v.CODE_ID ) {
				if ( key == 0 ) COUP_SERV_CD = v.CODE_NM;
				else COUP_SERV_CD += ', ' + v.CODE_NM;
			}
		});
	});
	
	$('#COUP_SERV_CD').text( COUP_SERV_CD );
	// 서비스 카테고리 값 만들기 end
	
	fn_BtnPage();
	
}



$(document).on('click','.btnEdit',fn_edit);
$(document).on('click','.btnSave',fn_save);
$(document).on('click','.noShow',fn_makeCoupCd);

function fn_edit(){
	
	let trTemp = $('[name=CHANGE_ID]').closest('tr');
	trTemp.find('.btnSave').text('수정');
	trTemp.find('.btnSave').addClass('btnEdit');
	trTemp.find('.btnSave').removeClass('btnSave');
	trTemp.find('.noShow').hide();
	
	trTemp.find('td').eq(1).empty();
	trTemp.find('td').eq(1).text(tempId);

	let changeTemp = $('[name=CHANGE_COUP_CD]').val();
	trTemp.find('td').eq(2).empty();
	trTemp.find('td').eq(2).text(changeTemp);
	
	$(this).siblings('.noShow').show();
	
	$(this).text('저장');
	$('#editSave').text('저장');
	$(this).removeClass('btnEdit');
	$(this).addClass('btnSave');
	
	var target = $(this).closest('tr');
	console.log(target.find('td').eq(1).html());
	console.log(target.find('td').eq(2).html());
	
	tempId = target.find('td').eq(1).text();
	
	var html = "";
	html += '<input type="text" name="CHANGE_ID" value="'+target.find('td').eq(1).text()+'"  class="form-control form-control-sm col-8" >';
	target.find('td').eq(1).empty();
	target.find('td').eq(1).append(html);
	html="";
	html += '<input type="text" name="CHANGE_COUP_CD" value="'+target.find('td').eq(2).text()+'" disabled readonly maxlength="18" class="form-control form-control-sm col-8" >';
	target.find('td').eq(2).empty();
	target.find('td').eq(2).append(html);
	
}

var tempId = "";

function fn_save(){
	
	$(this).siblings('.noShow').hide();
	
	$(this).text('수정');
	$('#editSave').text('수정');
	$(this).removeClass('btnSave');
	$(this).addClass('btnEdit');
	
	var target = $(this).closest('tr');
	var temp = target.find('[name=CHANGE_ID]').val();
	var temp2 = target.find('[name=CHANGE_COUP_CD]').val();
	
	if (tempId != temp) {
		var params = new Object();
		params.status = "DETAIL";
		params.query = "selectMngHaveUser";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		params.COUP_IDX = COUP_IDX;
		params.USER_EMAIL = temp;
		
		var result = fn_DataAjax2( params );
		
		if( result.out.detail.data[0].CNT > 0 ){
			alert('해당 ID는 이미 쿠폰을 발급받은 ID 입니다. \n 중복발급은 불가합니다.');
			temp = tempId;
		}
	}
	
	if (temp2.length < 18) {
		alert('쿠폰번호는 18자의 영어 숫자로 구성되어야 합니다\n 자동생성 번호로 대체합니다');
		
		console.log(temp2.length);
		temp2 =  '${sysDateValue}' + ('0'+date.getDate()).slice(-2) + uuidv4().replace(/\-/g,'').toUpperCase().substr(0, 10);
	}
	temp2 = temp2.toUpperCase();
	target.find('td').eq(1).empty();
	target.find('td').eq(2).empty();

	target.find('td').eq(1).text(temp);
	target.find('td').eq(2).text(temp2);
	
}


function fn_makeCoupCd(){
	var target = $(this).closest('tr');
	target.find('[name=CHANGE_COUP_CD]').val( '${sysDateValue}' + ('0'+date.getDate()).slice(-2) + uuidv4().replace(/\-/g,'').toUpperCase().substr(0, 10) );
}

function fn_BtnPage( pageNo ){
	var params = new Object();
	params.status = "PAGE";
	params.query = "selectMngCoupDetailList";
	params.COUP_IDX = COUP_IDX;
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.thisPage = pageNo;
	if (params.thisPage == 0 || params.thisPage == null || params.thisPage == "" || params.thisPage == undefined) {
		params.thisPage = 1;
	}
	var resultList = fn_DataAjax2( params );
	
	var html = "";
	if ( resultList.out.detail.data.length > 0 ) {
		
		$.each(resultList.out.detail.data, function(k,v){
			html += '<tr>';
			html += '	<td>'+v.NUM_DESC+'</td>';
			if (v.USER_EMAIL == null || v.USER_EMAIL == '' || typeof v.USER_EMAIL == 'undefined') {
				html += '	<td></td>';
			}else{
				html += '	<td>'+v.USER_EMAIL+'</td>';
			}
			html += '	<td id="'+v.DATA_IDX+'">'+v.COUP_DATA_CD+'</td>';
			if (v.USER_COUP_IDX != 'NODATA') {
				html += '	<td><span class="btn btn-md btn-outline-dark">발급완료</span></td>';
			}else{
				html += '	<td><span class="btn btn-md btn-primary noShow mr5" style="display: inline-block; width:130px">쿠폰번호 생성</span><a class="btn  btn-md btn-primary btnEdit" >수정</a></td>';
			}
			html += '</tr>';
		});
		$('#pageTarget').empty();
		$('#pageTarget').append( html );
		$('.noShow').hide();
	}
	
	var varHtml = "";	
	varHtml += '		<li><a id="pagingFirst" onclick="fn_BtnPage('+ resultList.out.detail.paging.prevStep +');"  aria-label="Previous"><i class="fa fa-angle-left"></i></a></li>   ';
	
	for (var i = resultList.out.detail.paging.startPage; i <= resultList.out.detail.paging.endPage; i++) {
		if (resultList.out.detail.paging.thisPage == i) {
			varHtml += '<li><a id="pagingActive" onclick="fn_BtnPage('+ i +');" class="active" style="cursor:pointer;">'+ i +'</a></li>   '
		}else{
			varHtml += '<li><a name="pagingPassiive" onclick="fn_BtnPage('+ i +');" style="cursor:pointer;">'+ i +'</a></li>   ';
		}
		
	}
	
	varHtml += '		<li><a id="pagingLast" onclick="fn_BtnPage('+ resultList.out.detail.paging.nextStep +');"  aria-label="Next"><i class="fa fa-angle-right"></i></a></li>   ';
	$('#pagingVar').empty();
	$('#pagingVar').append( varHtml );
}

function fn_BtnRegist3(){
	
	var params = new Object();
	params.status = "EDIT";
	params.query = "updateMngCoupDataData";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	
	$('#pageTarget tr').each(function(k){
		
		params.DATA_IDX = $(this).find('td[id]').attr('id');
		console.log($(this).find('td[id]').attr('id'));
		params.COUP_DATA_CD = $(this).find('td').eq(2).text();
		params.USER_EMAIL = $(this).find('td').eq(1).text();
		
		fn_DataAjax2( params );
		
	});
	
	location.href='${unit.move("index","")}';
	
}

$(document).on('change','[name=COUP_MINI],[name=COUP_DISC]', function(){
	this.value = Number(this.value);
});

</script>

