<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'index', 'ajax')}" /> 

<style>
#btnSearch:hover{	color: white!important;}
.form-inline{display: inline-block !important;}
/* td{    vertical-align: baseline !important;} */
</style>

<h3>오픈준비완료 목록</h3>
<div class="tbl_list">
	<table class="list_tbl01" summary="">
		<caption>관리자 리스트 테이블</caption>
		<colgroup>
			<col style="width: 5%;" />	
			<col style="width: 15%;" />				
			<col style="width: 15%;" />					
			<col style="width: 20%;" />		
			<col>
			<col style="width: 5%;" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">구분</th>
				<th scope="col">분야</th>
				<th scope="col">분야상세</th>
				<th scope="col">마스터명</th>
				<th scope="col">노출순서</th>
			</tr>
		</thead>
		<tbody id="openSuccess">
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row" varStatus="vs">
						<c:if test="${row.OPEN_TYPE eq '오픈준비완료'}">
							<tr>
								<td></td>
								<td>${row.OPEN_TYPE }<input type="hidden" name="cate_idx" value="${row.CATE_IDX }"><input type="hidden" name="prdt_cd" value="${row.PRDT_CD }"></td>
								<td>${row.P_CODE_NM }</td>
								<td>${row.M_CODE_NM }</td>
								<td>${row.USER_NM }</td>
								<td><input type="type" id="${row.CATE_IDX }" name="CATE_ORDR_OPEN" value="${row.CATE_ORDR }" style="    text-align: center;" onchange="fn_keyup( $(this) );"/></td>
							</tr>
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="9">등록된 내용이 없습니다.</td>
					</tr>
				</c:otherwise>
				
			</c:choose>
		</tbody>
	</table>
</div>


<h3></h3>
<h3>오픈준비중 목록</h3>
<div class="tbl_list">
	<table class="list_tbl01" summary="">
		<caption>관리자 리스트 테이블</caption>
		<colgroup>
			<col style="width: 5%;" />	
			<col style="width: 15%;" />				
			<col style="width: 15%;" />				
			<col style="width: 20%;" />			
			<col>
			<col style="width: 5%;" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">구분</th>
				<th scope="col">분야</th>
				<th scope="col">분야상세</th>
				<th scope="col">마스터명</th>
				<th scope="col">노출순서</th>
			</tr>
		</thead>
		<tbody id="openWait">
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row" varStatus="vs">
						<c:if test="${row.OPEN_TYPE eq '오픈준비중'}">
							<tr>
								<td>${ fn:length(out.list.data) - vs.index }</td>
								<td>${row.OPEN_TYPE }<input type="hidden" name="cate_idx" value="${row.CATE_IDX }"><input type="hidden" name="prdt_cd" value="${row.PRDT_CD }"></td>
								<td>${row.P_CODE_NM }</td>
								<td>${row.M_CODE_NM }</td>
								<td>${row.USER_NM }</td>
								<td><input type="type" id="${row.CATE_IDX }" name="CATE_ORDR_READY" value="${row.CATE_ORDR }" style="text-align: center;" onchange="fn_keyup( $(this) );"/></td> 
							</tr>
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="9">등록된 내용이 없습니다.</td>
					</tr>
				</c:otherwise>
				
			</c:choose>
		</tbody>
	</table>
</div>

<div class="col-4 btn_pagination" style="margin: 29px 0 0; float: right"><a href='javascript:;' class="btn btn-md btn_key_color" onclick="fn_BtnRegist();">저장</a></div>


<script type="text/javascript">

//////////////////////////////////////////////////////////
// 1. 변수 초기화
//////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////
// 2. 첫 실행 함수
//////////////////////////////////////////////////////////
$(function(){
	
	
	var params = new Object();
	params.query = "selectFrontMainMasterTimeCnt";
	params.status = "LIST";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	
	var masterTimeCntResult = fn_DataAjax2( params );
	masterTimeCntResult = masterTimeCntResult.out.detail.data;

	$.each(masterTimeCntResult, function(key,val){
		var masterCateIdx = val.CATE_IDX;
		var masterTimeCnt = val.TIME_CNT.split(',');
		var masterPrdtCd = val.PRDT_CD.split(',');
		var coachingChk = 0;
		var removeDiv = 0;
		
//			console.log( masterCateIdx );
//			console.log( masterTimeCnt );
//			console.log( masterPrdtCd );
		
		$.each(masterTimeCnt, function(key1,val1){
			
			if( masterPrdtCd[key1] == 'VL' ) {
				if( masterPrdtCd[key1].indexOf('VL') > -1 ) removeDiv = 1;
			} else if( masterPrdtCd[key1] == 'EN' ) {
				if( coachingChk == 0 ) {
					if( masterPrdtCd[key1].indexOf('EN') > -1 ) {
						coachingChk = 1;
						removeDiv = 1;
					}
				}
			} else if( ( masterPrdtCd[key1] == 'CN' ) || ( masterPrdtCd[key1] == 'FN' ) || ( masterPrdtCd[key1] == 'LN' ) ){
				if( val1 != '0' ) {
					if( coachingChk == 0 ) {
						if( masterPrdtCd[key1].indexOf('CN') > -1 ) removeDiv = 1;
						else if( masterPrdtCd[key1].indexOf('FN') > -1 ) removeDiv = 1;
						coachingChk = 1;
					}
					if( masterPrdtCd[key1].indexOf('LN') > -1 ) removeDiv = 1;
				}
			}
		});

		if( removeDiv == 0 ) $('#openSuccess > tr ').eq(key).remove();
		
	});

	$('#openSuccess > tr ').each(function( k ){
		$(this).find('td').eq(0).text( $('#openSuccess > tr').length - k );
	});
	$('#openWait > tr ').each(function( k ){
		$(this).find('td').eq(0).text( $('#openWait > tr').length - k );
	});
	
// 	var hasTimeList = [];
// 	var temparr = [];
// 	var temp_SALE_PRDT_CD = [];
// 	var temp_SALE_PRDT_CD_temp = '';
	
	// 1:1 코칭들이 중복되어 들어가지 않게 하는 값
// 	var haveCode = '';
	
// 	$.each( masterTimeCntResult.out.detail.data, function( mkey, mval ){
// 		$('input[name=cate_idx]').each( function( jkey, jval ){
// 			if ( mval.CATE_IDX == this.value ) {
// 				temp_SALE_PRDT_CD_temp = '';
// 				$.each( $(this).siblings('[name=prdt_cd]').val().split(','), function( jsplitkey, jsplitval ){
// 					if ( jsplitval.indexOf('CN') > -1 ) {
// 						if ( mval.TIME_CNT.split(',')[jsplitkey] > 0 ) {
// 							if ( haveCode.indexOf( jval.value ) == -1 ) {
// 								haveCode += jval.value;
// 								temparr.push(jval.value);
// 							}
// 							temp_SALE_PRDT_CD_temp += 'CN,';
// 						}
// 					}
// 					if ( jsplitval.indexOf('EN') > -1 ) {
// 						if ( haveCode.indexOf( jval.value ) == -1 ) {
// 							haveCode += jval.value;
// 							temparr.push(jval.value);
// 						}
// 						temp_SALE_PRDT_CD_temp += 'EN,';
// 					}
// 					if ( jsplitval.indexOf('FN') > -1 ) {
// 						if ( mval.TIME_CNT.split(',')[jsplitkey] > 0 ) {
// 							if ( haveCode.indexOf(jval.value ) == -1 ) {
// 								haveCode += jval.value;
// 								temparr.push(jval.value);
// 							}
// 							temp_SALE_PRDT_CD_temp += 'FN,';
// 						}
// 					}
// 					if ( jsplitval.indexOf('LN') > -1 ) {
// 						if ( mval.TIME_CNT.split(',')[jsplitkey] > 0 ) {
// 							if ( haveCode.indexOf( jval.value ) == -1 ) {
// 								haveCode += jval.value;
// 								temparr.push(jval.value);
// 							}
// 							temp_SALE_PRDT_CD_temp += 'LN,';
// 						}
// 					}
// 					if ( jsplitval.indexOf('VL') > -1 ) {
// 						if ( haveCode.indexOf( jval.value ) == -1 ) {
// 							haveCode += jval.value;
// 							temparr.push(jval.value);
// 						}
// 						temp_SALE_PRDT_CD_temp += 'VL,';
// 					}
					
// 				} ); 
// 				temp_SALE_PRDT_CD.push(temp_SALE_PRDT_CD_temp);
// 			}
			
// 		} );
// 	} );
	
// 	// 공백값 제거 (시간있는 수업들만 추림) 
// 	var temp_sale_prdt_cd_ = temp_SALE_PRDT_CD.filter( function(val){ if(val != '') return true; } );
	
// 	// 시간 없는 애들 없애버린 리스트로 교체
// 	jsonData = temparr;
	
// 	$('input[name=cate_idx]').each(function( key, value ){
// 		var isdelete = true;
// 		$.each( jsonData, function( k, v ){
// 				if ( v == value.value ) {
// 					isdelete = false;
// 				}
// 		});
// 		if (isdelete) {
// 			$(this).closest('tr').remove();
// 		}
// 	});
	
	$('#openSuccess tr').each( function( k ){
		$(this).find('td:eq(0)').text( $('#openSuccess tr').length - k );
	});
	$('#openWait tr').each( function( k ){
		$(this).find('td:eq(0)').text( $('#openWait tr').length - k );
	});
	
});

// $('[NAME=CATE_ORDR_OPEN]').each(function(key, val){
// 	var	outerTag = $(this);
// 	$('[NAME=CATE_ORDR_OPEN]').each(function(key1, val1){
// 		if( $(this).attr('id') != outerTag.attr('id') ) if( $(this).val() == outerTag.val() ) {
// 			outerTag.val('');
// 			fn_BtnRegist();
// 		}
// 	});
// });

// $('[NAME=CATE_ORDR_READY]').each(function(key, val){
// 	var	outerTag = $(this);
// 	$('[NAME=CATE_ORDR_READY]').each(function(key1, val1){
// 		if( $(this).attr('id') != outerTag.attr('id') ) if( $(this).val() == outerTag.val() ) {
// 			outerTag.val('');
// 			fn_BtnRegist();
// 		}
// 	});
// });

//////////////////////////////////////////////////////////
//3. 사용자 함수
//////////////////////////////////////////////////////////

function fn_keyup( INPUT_OBJ ) {
	if( INPUT_OBJ.attr('name') == 'CATE_ORDR_OPEN') {
		$('[NAME=CATE_ORDR_OPEN]').each(function(key, val){
			if( $(this).attr('id') != INPUT_OBJ.attr('id') ) if( $(this).val() == INPUT_OBJ.val() ) INPUT_OBJ.val('');
		});
	} else {
		$('[NAME=CATE_ORDR_READY]').each(function(key, val){
			if( $(this).attr('id') != INPUT_OBJ.attr('id') ) if( $(this).val() == INPUT_OBJ.val() ) INPUT_OBJ.val('');
		});
	}
}


function fn_BtnRegist(){
	
	$('[name=CATE_ORDR_OPEN]').each(function(key ,val){
		var params = new Object();
		params.status = "EDIT";
		params.query = "updateMngMainopenData";
		
		params.CATE_IDX = $(this).attr('id');
		if( $(this).val() == '' ) params.CATE_ORDR = null;
		else params.CATE_ORDR = $(this).val();
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		
		var result = fn_DataAjax( params, "N" ); 
	});
	
	$('[name=CATE_ORDR_READY]').each(function(key ,val){
		var params = new Object();
		params.status = "EDIT";
		params.query = "updateMngMainopenData";

		params.CATE_IDX = $(this).attr('id');
		if( $(this).val() == '' ) params.CATE_ORDR = null;
		else params.CATE_ORDR = $(this).val();
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		
		var result = fn_DataAjax( params, "N" );
	});
	
	alert('정상적으로 처리되었습니다.');
	location.href='${unit.move("index", "" )}';
}


</script>



