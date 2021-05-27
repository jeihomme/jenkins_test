<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDateValue"><fmt:formatDate value="${now}" pattern="yyyyMM" /></c:set>

<!-- 쓰기  시작-->	
<div><a href='${unit.move("tab", out.params.coupIdx, "coup", "coup_edit" )}' class="btn  btn-md"  style="float:left;margin-right:4px; ">쿠폰 생성</a></div> 
<div><a href='${unit.move("edit", out.params.coupIdx, "coup" )}' class="btn  btn-md"  style="float:left; margin-right:4px;">대상 지정</a></div>
<div><a href='${unit.move("tab", out.params.coupIdx, "coup", "coup_list" )}' class="btn  btn-md"  style="float:left;font-weight:bold; background-color:#f4b183;">쿠폰 리스트</a></div>

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
				<td colspan="3">
					<div class="fileArea">					
						<div class="fileList" id="COUP_UUID_FILEList"></div>
						<input id="COUP_UUID" name="COUP_UUID" type="hidden" />
						<div id="COUP_UUID_FILEListClone" style="display:none;">
						<div><span class="fileName"></span> (<span class="fileSize"></span> MB)</div>
						</div>											
					</div>
				
				</td>
			</tr>
			<tr>
				<th scope="row">구분</th>
				<td id="COUP_TYPE_TARGET" >
				</td>
				<th scope="row">사용방식</th>
				<td id="COUP_KIND_TARGET"></td>
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
				<td id="COUP_SERV_NM" colspan="3">
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
	<a class="btn btn-md btn_key_color" onclick="fn_BtnRegist();" style="float:right;">저장</a>
</div>


<!-- ckeditor.js -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script> -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/inline/ckeditor.js"></script> -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/balloon-block/ckeditor.js"></script> -->
<script type="text/javascript">
$(function(){
	
	
	
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
			else $('#'+key+'').html(val);
		});
		
		$('#COUP_KIND_TARGET').html( val1.COUP_KIND ) ;
		$('#COUP_TYPE_TARGET').html( val1.COUP_TYPE ) ;
		$('#COUP_USE_DATE_TARGET').html( val1.COUP_USE_DATE ) ;
		
		if ( val1.USER_COUP_CNT > 0 ) $('.btn_key_color').remove();
		if ( val1.COUP_TYPE_CD == 'CPT02' ) $('.btn_key_color').remove();
		
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
	
	$('#COUP_SERV_NM').text( COUP_SERV_CD );
	// 서비스 카테고리 값 만들기 end
	
	var params = new Object();
	params.status = "PAGE";
	params.query = "selectMngCoupDetailList";
	params.COUP_IDX = "${out.params.coupIdx }";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.thisPage = 1;
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
	}
	$('.noShow').hide();
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
	
});

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
		params.COUP_IDX = "${out.params.coupIdx }";
		params.USER_EMAIL = temp;
		
		var result = fn_DataAjax2( params );
		
		if( result.out.detail.data[0].CNT > 0 ){
			alert('해당 ID는 이미 쿠폰을 발급받은 ID 입니다. \n 중복발급은 불가합니다.');
			temp = tempId;
		}
	}
	
	if (temp2.length < 18) {
		alert('쿠폰번호는 18자의 영어 숫자로 구성되어야 합니다\n 자동생성 번호로 대체합니다');
		
		temp2 =  '${sysDateValue}' + ('0'+date.getDate()).slice(-2) + uuidv4().replace(/\-/g,'').toUpperCase().substr(0, 10);
	}
	temp2 = temp2.toUpperCase();
	target.find('td').eq(1).empty();
	target.find('td').eq(2).empty();

	target.find('td').eq(1).text(temp);
	target.find('td').eq(2).text(temp2);
	
}

var date = new Date();

function fn_makeCoupCd(){
	var target = $(this).closest('tr');
	target.find('[name=CHANGE_COUP_CD]').val( '${sysDateValue}' + ('0'+date.getDate()).slice(-2) + uuidv4().replace(/\-/g,'').toUpperCase().substr(0, 10) );
}

function fn_BtnPage( pageNo ){
	var params = new Object();
	params.status = "PAGE";
	params.query = "selectMngCoupDetailList";
	params.COUP_IDX = "${out.params.coupIdx }";
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
	}
	$('.noShow').hide();
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

function fn_BtnRegist(){
	
	var params = new Object();
	params.status = "EDIT";
	params.query = "updateMngCoupDataData";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	
	$('#pageTarget tr').each(function(k){
		
		params.DATA_IDX = $(this).find('td[id]').attr('id');
		params.COUP_DATA_CD = $(this).find('td').eq(2).text();
		params.USER_EMAIL = $(this).find('td').eq(1).text();
		
		fn_DataAjax2( params );
		
	});
	
	location.href='${unit.move("index","")}';
	
}





</script>

