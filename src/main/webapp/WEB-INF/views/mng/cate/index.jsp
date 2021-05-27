<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<style>
#btnSearch:hover{	color: white!important;}
.form-inline{display: inline-block !important;}
.trCssClass{background-color: white;}
.trCssClass:nth-child(1){background-color: #1eccb4 !important;}


/* td{    vertical-align: baseline !important;} */
</style>

<div>
	<h5>카테고리 등록/수정
	</h5> 
</div>

<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>관리자 리스트 조회</caption>
		<colgroup>
			<col style="width: 20%;" />
			<col style="width: 30%;" />
			<col style="width: 20%;" />
			<col style="width: 30%;" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row" >※분야 등록/수정 방법</th>
				<td>
					<span>1. 카테고리를 '선택해주세요'로 선택</span><br>
					<span>2. 분야명을 작성</span><br>
					<span>3. '저장'버튼 클릭</span><br>
				</td>
				<th scope="row" >※분야상세 등록/수정 방법</th>
				<td>
					<span>1. 카테고리를 선택</span><br>
					<span>2. 분야상세명을 작성</span><br>
					<span>3. '등록'버튼 클릭( 수정 시, 생략 )</span><br>
					<span>4. '저장'버튼 클릭</span><br>
				</td>
			</tr>
			<tr>
				<th >카테고리</th>
				<td colspan="3">
					<select name="CATE_CODE_ID" class="form-control form-control-sm col-8" ></select>
				</td>
			</tr>
			<tr>
				<th scope="row" >노출순서</th>
				<td colspan="3">
					<div class="form-inline" id="CODE_ORDR">
						<input type="text" name="CODE_ORDR" class="form-control form-control-sm col-8"  />
					</div>
				</td>
			</tr>	
			<tr>
				<th scope="row" >분야</th>
				<td colspan="3">
					<div class="form-inline" id="PARENT_CODE_ID_LIST">
						<input type="hidden" name="PARENT_CODE_ID" />
<!-- 						<input type="text" name="PARENT_CODE_NM" class="form-control form-control-sm col-8"  onkeyup="fn_keyup();"/> -->
						<input type="text" name="PARENT_CODE_NM" class="form-control form-control-sm col-8"  />
					</div>
				</td>
			</tr>	
			<tr>
				<th scope="row" >분야상세</th>
				<td colspan="3">
					<div class="form-inline" id="CODE_ID_LIST"></div>
				</td>
			</tr>
			<tr>
				<th scope="row" >분야상세 등록</th>
				<td colspan="3">
					<div class="form-inline" id="CODE_ID_LIST"></div>
					<div class="form-inline" >
						<input type="text" name="CODE_ID_ADD" class="form-control form-control-sm col-8"  />
						<a href='javascript:;'  class="btn btn-md btn_key_color" onclick="fn_BtnAdd( );">등록</a>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="btn_pagination" style="margin: 29px 0 0;"><a href='javascript:;' class="btn btn-md btn_key_color" onclick="fn_BtnRegist();">저장</a></div>

<div>
	<h5>카테고리 사용현황
<!-- 		<span style="color:red;">※분야 삭제 시 페이지를 새로 고칩니다.</span><br> -->
<!-- 		<span style="color:red;">※분야상세 삭제 시 페이지를 유지합니다.</span> -->
	</h5> 
</div>

<div class="tbl_list">
	<table class="list_tbl01" summary="">
		<caption>관리자 리스트 테이블</caption>
		<colgroup>
			<col style="width: 20%;" />
			<col >							
			<col style="width: 20%;" />	
			<col style="width: 10%;" />		
		</colgroup>
		<thead>
			<tr>
				<th scope="col">구분</th>
				<th scope="col">마스터명</th>
				<th scope="col">사용 마스터 수</th>
				<th scope="col">삭제</th>
			</tr>
		</thead>
		<tbody id="dataList"></tbody>
	</table>
</div>


<script type="text/javascript">

//////////////////////////////////////////////////////////
// 1. 변수 초기화
//////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////
// 2. 첫 실행 함수
//////////////////////////////////////////////////////////
$(function(){
	fn_SelectOption("", "CAT", "CATE_CODE_ID");
});

$('[NAME=CATE_CODE_ID]').change(function(){
	$('[name=parentCodeDel]').remove();
	
	$('[NAME=PARENT_CODE_ID]').val( '' );
	$('[NAME=PARENT_CODE_NM]').val( '' );
	
	if( $('[NAME=CATE_CODE_ID]').val() == '' ){
		$('#CODE_ID_LIST').empty();
		$('#dataList').empty();
		return;
	}
	$('[NAME=PARENT_CODE_ID]').val( $('[NAME=CATE_CODE_ID]').val() );
	$('[NAME=PARENT_CODE_NM]').val( $('[NAME=CATE_CODE_ID] option:checked').text() );
	
// 	var onchangeInTag = ''; 
// 	onchangeInTag += '<a name="parentCodeDel" href="javascript:;" class="btn btn-md btn-danger" onclick="fn_BtnDelete( this );">삭제</a>'; 
	
// 	$('#PARENT_CODE_ID_LIST').append( onchangeInTag );
	

	$('#CODE_ID_LIST').empty();
	
	var params = new Object();
	params.status = "CODE";
	params.query = "selectCode";
	params.code = $(this).val();
	params.parentCode = $(this).val().substr(0,5);

	var result = fn_DataAjax2( params );
	var inTag = '';
	var jsonDetail = result.out.detail.data;
	
	if( jsonDetail.length > 0 ) {
		$.each(jsonDetail, function(key, val){
			inTag += '<div class="form-inline" >';
			inTag += '<input type="hidden" name="CODE_ID" value="'+ val.CODE_ID +'"/>';
			inTag += '<input type="text" name="CODE_NM" class="form-control form-control-sm col-8" value="'+ val.CODE_NM +'"/>';
// 			inTag += '<a href="javascript:;" class="btn btn-md btn-danger" onclick="fn_BtnDelete( this );">삭제</a>'; 
// 			inTag += '<span>'+ val.CODE_NM +'</span>';
			inTag += '</div>';
		});
		$('#CODE_ID_LIST').append( inTag );
	}

	$('#dataList').empty();

	var params = new Object();
	params.status = "LIST";
	params.query = "selectMngCateDetailList";
	params.parentCodeId = $(this).val();

	var result = fn_DataAjax2( params );
	var inTag = '';
	var jsonDetail = result.out.detail.data;
	
	if( jsonDetail.length > 0 ) {
		$.each(jsonDetail, function(key, val){
			$('[name=CODE_ORDR]').val( val.CODE_ORDR );
			
			inTag += '<tr class="trCssClass">';
			
				inTag += '<td>'+val.CODE_TYPE+'</td>';
				inTag += '<td>'+val.M_CODE_NM+'</td>';
				
				if( val.CODE_TYPE == '분야') inTag += '<td>'+val.P_CODE_CNT+'</td>';
				else inTag += '<td>'+val.M_CODE_CNT+'</td>';
				
				if( val.CODE_TYPE == '분야') {
					if( val.P_CODE_CNT == 0 ) inTag += '<td><input type="hidden" name="CODE_ID" value="'+ val.M_CODE_ID +'"/><a href="javascript:;" class="btn btn-md btn-danger" onclick="fn_BtnDelete( this );">삭제</a></td>';
					else inTag += '<td></td>'
				} else {
					if( val.M_CODE_CNT == 0 ) inTag += '<td><input type="hidden" name="CODE_ID" value="'+ val.M_CODE_ID +'"/><a href="javascript:;" class="btn btn-md btn-danger" onclick="fn_BtnDelete( this );">삭제</a></td>';
					else inTag += '<td></td>'
				}
			
			inTag += '</tr>';
		});

	} else {
		inTag += '<tr><td colspan="9">등록된 내용이 없습니다.</td></tr>';
	}
	
	$('#dataList').append( inTag );
});


//////////////////////////////////////////////////////////
//3. 사용자 함수
//////////////////////////////////////////////////////////

function fn_keyup() {
	$('[NAME=PARENT_CODE_ID]').val( '' );
	$('[NAME=CATE_CODE_ID]').val('');
	$('#CODE_ID_LIST').empty();
	$('[name=parentCodeDel]').remove();
}

function fn_BtnAdd( ) {
	var tagCnt = 0;
	var inTag = '';
	
	if( $('[name=CODE_ID_ADD]').val() != '' ) {
		$('[name=CODE_NM]').each(function(key, val){
			if( $('[name=CODE_NM]').eq(key).val() == $('[name=CODE_ID_ADD]').val() ) tagCnt++;
		});
		
		if( tagCnt == 0 ) {

			inTag += '<div class="form-inline" >';
			inTag += '<input type="hidden" name="CODE_ID" value=""/>';
			inTag += '<input type="text" name="CODE_NM" class="form-control form-control-sm col-8" value="'+ $('[name=CODE_ID_ADD]').val() +'"/>';
			inTag += '</div>';
			
			$('[NAME=CODE_ID_ADD]').val('');
			$('#CODE_ID_LIST').append( inTag );
		}
	}
}

function fn_BtnRegist(){
// 	분야 저장
	var params = unit_getParams("searchArea");
	params.status = "EDIT";
	params.PARENT_CODE_ID = $('[name=PARENT_CODE_ID]').val();
	params.PARENT_CODE_NM = $('[name=PARENT_CODE_NM]').val();
	params.query = "updateMngCateParentData";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	
	if( $('[name=PARENT_CODE_NM]').val() == '' ) return alert('분야명은 필수값입니다.');
	
	var result = fn_DataAjax( params, "N" );
	
	$('[name=CODE_NM]').each(function(key ,val){

//	 	분야상세 저장
		var params = unit_getParams("searchArea");
		params.status = "EDIT";
		params.query = "updateMngCateData";

		params.PARENT_CODE_ID = $('[name=PARENT_CODE_ID]').val();
		params.PARENT_CODE_NM = $('[name=PARENT_CODE_NM]').val();
		params.CODE_ID_LIST = $('[name=CODE_ID]').eq(key).val();
		params.CODE_NM = $(this).val();
		params.CODE_ORDR = $('[name=CODE_ORDR]').val();
		
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		
		var result = fn_DataAjax( params, "N" );
	});

	var params = unit_getParams("searchArea");
	params.status = "EDIT";
	params.query = "updateMngCateOrdrData";
	params.PARENT_CODE_ID = $('[name=PARENT_CODE_ID]').val();
	params.CODE_ORDR = $('[name=CODE_ORDR]').val();
	var result = fn_DataAjax( params, "N" );
	
	location.href='${unit.move("index", "" )}';
	alert('정상적으로 처리되었습니다.');
}



function fn_BtnDelete( THIS ){
	var mainHtml = $(THIS).parent('td');
	
	var CODE_ID = mainHtml.children('input').val();
	
	
	if( confirm('해당 데이터를 삭제하시겠습니까?') ) {

		var params = unit_getParams("searchArea");
		params.status = "DELETE";
		params.query = "deleteMngCateData";
		params.CODE_ID = CODE_ID;
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		
		var result = fn_DataAjax( params );
		if( CODE_ID.length == 7 ) {
			var delTagIndex = mainHtml.parent('tr').index() - 1;
			mainHtml.parent('tr').remove();
			$('#CODE_ID_LIST .form-inline').eq( delTagIndex ).remove();
		}
		else location.href='${unit.move("index", "" )}';
	}
}

</script>



