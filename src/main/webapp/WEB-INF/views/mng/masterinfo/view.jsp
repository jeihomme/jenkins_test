<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'index', 'ajax')}" /> 
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDateValue"><fmt:formatDate value="${now}" pattern="yyyyMM" /></c:set>

<style>
	.btn-css-edit{    line-height: 1.5;width: 90px;height: 37px;}
</style>
<div class="title_wrap mt5">
	※ 마스터코드를 생성 페이지 입니다. (‘마스터코드’란 해당 마스터의 특정한 분야&분야상세에 대한 코드) 
</div>
<div class="title_wrap mt5">
	※ 관리자는 1명의 마스터에게 여러 분야의 마스터코드를 생성할 수 있습니다. 
</div>
<div class="title_wrap mt5">
	 
</div>

<!-- 조회  시작-->				
<div class="tbl_view">
	<table class="view_tbl01" summary="">
		<colgroup>
			<col style="width: 15%;" />
			<col  />
			<col style="width: 15%;" />
			<col  />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">마스터명</th>
				<td id="USER_NM"></td>
				<th scope="row">계정</th>
				<td id="USER_EMAIL"></td>
			</tr>
			<tr>
				<th scope="row">가입일</th>
				<td id="SYS_REG_DTM"></td>
				<th scope="row">마스터승인일</th>
				<td id="USER_MAST_JOIN_DTM"></td>
			</tr>
			<tr>
				<th scope="row">최근로그인</th>
				<td id="USER_LOGIN_DTM"></td>
				<th scope="row">최근상담일</th>
				<td id="USER_CONS_DTM"></td>
			</tr>
		</tbody>
	</table>
</div>


<span class="red" style="display:block; padding-top: 15px;">아래 셀렉트 박스로 권한을 부여할 수 있습니다.</span>
<div class="btn_wrap" style="text-align: right; position:relative; padding-top: 5px;    height: 55px;">
	<select style="position: absolute; left: 0;" id="MAST_PREV" name="MAST_PREV" class="form-control form-control-sm col-3" ></select>
<!-- 	<a class="insertPopup btn btn-md btn_key_color">추가</a> -->
</div>

<div class="tbl_list">
	<table class="list_tbl01" summary="">
		<caption>공지사항 관리 테이블</caption>
		<colgroup>
			<col style="width: 5%;" />
			<col />
			<col style="width: 10%;" />
			<col style="width: 10%;" />
			<col style="width: 15%;" />
			
<%-- 			<col style="width: 20%;" /> --%>
<%-- 			<col style="width: 15%;" /> --%>
			<col style="width: 10%;" />
			<col style="width: 10%;" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">마스터코드</th>
				<th scope="col">분야</th>
				<th scope="col">분야상세</th>
				<th scope="col">등록일</th>
				
<!-- 				<th scope="col">간략소개</th> -->
<!-- 				<th scope="col">대표 슬로건</th> -->
				<th scope="col">메인여부</th>
				<th scope="col">구매여부</th>
			</tr>
		</thead>
		<tbody id="detailList">
		</tbody>
	</table>
</div>

<div class="btn_wrap" style="text-align: right;">
	<a class="insertPopup btn btn-sm btn_key_color btn-css-edit">추가</a>
	<a href="${ unit.move('index', '') }" class="btn btn-sm btn-outline-dark btn-css-edit">목록</a>
</div>

<!-- 회원정보 수정 팝업 -->
<!--  팝업메뉴  -->
<div id="popup_masterinfo_addCateCd" class="popup_wrap">
	<div class="popup_layer">
		<div class="popup_inner">
			<div class="popup_header">	
				<h1 class="title" style="margin:0; font-weight:600 !important;">마스터코드 추가</h1>			
				<button onclick="fn_cleanPop();" class="btn btn_close_pop" data-action="popup_hide">닫기</button>
				<input id="userEditIdx" type="hidden" />
			</div>
			<div class="dialog_content">
				<div class="scroll_area">
<!-- 					Start 팝업 컨텐츠 -->
					<div class="tbl_view" >
						<table class="view_tbl01" summary="" id="cateArea">
							<caption>마스터코드추가 테이블</caption>
							<colgroup>
								<col style="width: 20%;" />
								<col style="width: 80%;" />							
								<col  />	
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">마스터코드</th>
									<td>
										<input type="text" id="CATE_CD" name="CATE_CD" disabled="disabled"  class="form-control form-control-sm col-8" title="마스터코드" />
									</td>
								</tr>
								<tr>
									<th scope="row">분야</th>
									<td>
										<select id="PARENT_CODE_ID" name="PARENT_CODE_ID" class="form-control form-control-sm col-8" title="분야" >
											<option value="">분야를 선택해주세요.</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row">분야상세</th>
									<td>
										<select id="CODE_ID" name="CODE_ID" class="form-control form-control-sm col-8">
											<option value="">분야를 선택해주세요.</option>
										</select>
									</td>				
								</tr>
<!-- 								<tr> -->
<!-- 									<th scope="row">간략소개</th> -->
<!-- 									<td> -->
<!-- 										<input id="CATE_INFO" type="text" name="CATE_INFO" class="form-control form-control-sm col-8" title="간략 소개" /> -->
<!-- 									</td> -->
<!-- 								</tr> -->
								
<!-- 								<tr> -->
<!-- 									<th scope="row">대표 슬로건</th> -->
<!-- 									<td> -->
<!-- 										<input type="text" id="CATE_SLOG" name="CATE_SLOG" class="form-control form-control-sm col-8" title="대표 슬로건"  /> -->
<!-- 									</td> -->
<!-- 								</tr> -->
							</tbody>
						</table>
					</div>
									
								
					
					<div class="btn_wrap" style="text-align: right;">
						<a href="javascript:;" onclick="fn_addCateCd();" class="btn  btn-md btn_key_color">저장</a>						
					</div>				
<!-- 					// End 팝업 컨텐츠 -->
				</div><!-- // End scroll_area -->
			</div><!-- // End dialog_content -->
		</div><!-- // End popup_inner -->
	</div><!-- // End popup_layer -->
</div>





<!-- 데이타 삭제 -->
<div id="alert_del" class="alert_wrap">
	<div class="alert_layer">
		<div class="alert_inner">
			<div class="alert_header">
				<button class="btn btn_close_pop" data-action="popup_hide">X</button>
			</div>				
			<div class="dialog_content">
				<div class="scroll_area">
					<!-- Start 팝업 컨텐츠 -->

					<div class="alert_msg_area">
						<div class="alert_msg">
							삭제하시겠습니까?
						</div>
					</div>

					<div class="btn_wrap">
						<button type="button" onclick="location.href='./notice'" class="btn  btn-md btn-dark" data-action="popup_hide">확인</button>					
						<button type="button" class="btn  btn-md btn-outline-dark" data-action="popup_hide">취소</button>
					</div>

					<!--// End 팝업 컨텐츠 -->
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 조회 끝 -->	
<script>

var date = new Date();
var cdyear = date.getFullYear();
var cdmonth = date.getMonth()+1;
var cateCd = '';





	$(function(){
		var params = new Object();
		params.status = "DETAIL";
		params.query = "selectMngMasterinfoDetail";
		params.userIdx = '${out.params.userIdx }';
		var detail = fn_DataDetail( params );
		
		params.status = "LIST";
		params.query = "selectMngMasterinfoDetailList";
		params.userIdx = '${out.params.userIdx }';
		fn_DataList( params, "detailList", 9 );
		
		fn_SelectOptionNotCode("selectPrevNameList","MAST_PREV");
		$('[name=MAST_PREV]').val( detail[0].PREV_IDX );
	});
	
	
	// 팝업열기
	$('.insertPopup').click(function(){
		// dataCd 와 vodCd 최근값 가져오기
		
		$('[name=CATE_CD]').val('( 자동생성 )');
		fn_SelectOption("", "CAT", "PARENT_CODE_ID");
		
		popupShow("500","","popup_masterinfo_addCateCd");	
	});
	
	// 분야상세 값 변경
	$("[name=PARENT_CODE_ID]").on('change',function(k){
		$('[name=CODE_ID]').empty();
		$('[name=CODE_ID]').append('<option value="">분야를 선택해주세요.</option>');
		if( $(this).val() != '' ) fn_SelectOption($(this).val(), "CAT", "CODE_ID");
	});
	
	function fn_cleanPop(){
		$('#CATE_CD').val('');
		$('#CATE_INFO').val('');
		$('#CATE_SLOG').val('');
	}
	
	
	function fn_addCateCd(){
		
		if ($('#CATE_CD').val() == '' || $('#CATE_CD').val() == null ) return alert('마스터코드가 발번되지 않았습니다. 창을 닫았다가 다시 시도해 주세요.');
		if ($('#CODE_ID').val() == '' || $('#CODE_ID').val() == null ) return alert('분야상세를 선택해주세요.');
// 		if ($('#CATE_INFO').val() == '' || $('#CATE_INFO').val() == null ) return alert('간략소개를 입력해주세요.');
// 		if ($('#CATE_SLOG').val() == '' || $('#CATE_SLOG').val() == null ) return alert('대표슬로건을 입력해주세요.');
		
		var params = unit_getParams('cateArea');
		params.userIdx = '${out.params.userIdx }';
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		params.CATE_CD = '${sysDateValue}' + "MN";
		params.status = "DETAIL";		
		params.query = "selectMngMasterinfoDetailData";
		var result = fn_DataAjax2( params );
		console.log( result );
		if ( result.out.detail.data[0].CNT == 0 ) {
			params.status = "WRITE";
			params.query = "insertMngMasterinfoDetailData";
			fn_DataAjax( params );
			location.reload();
		}else{
			alert( '이미 생성된 분야입니다.' );
		}
	}
	
	
	function fn_DataList( PARAMS, OBJECT_ID ) {
		var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
		var jsonData = result.out.detail.data;
		var jsonDataOne = '';
		var dataArr = [];
		var inTag = '';
		var useYnKey = [];
		var useYnVal = [];
		var readYnKey = [];
		var readYnVal = [];
		var columnCnt = 0;
		
		
		$.each(jsonData,function(key1, val1) {
			inTag += '<tr>';
			jsonDataOne = JSON.stringify(val1);
			
			for( var a = 1; ; a++) {
				if( jsonDataOne.indexOf("DATA"+a+"") > -1 ) columnCnt++;
				else break;
			}
			
			
			$.each(val1,function(key, val) {

				for( var a = 1; a<=columnCnt; a++)
					if( key.indexOf(""+a+"") > -1 ){
							dataArr[a] = '<td>'+val+'</td>';
					}
						
				
				dataArr[1] = '<td><a href="'+val1.MNG_MASTER_URL.replace('/prdtinfo/detail','/masteropen/index')+'">'+val1.DATA1+'</a></td>';
						
				if( key.indexOf("NUM_DESC") > -1 ) {
					dataArr[0] = '<td>'+val+'</td>';
				} else if( key.indexOf("USE_YN") > -1 ) {
					useYnVal.push(val);
				} else if( key.indexOf("READ_YN") > -1 ) {
					readYnVal.push(val);
				} else if( key.indexOf("IDX") > -1 ) {
					useYnKey.push(val);
					readYnKey.push(val);
					
					dataArr[8] = ''
								+ '<td>'
								+ '<input type="checkbox" id="useYn'+val+'" name="useYn'+val+'" onchange="updateUseYn(\'useYn'+val+'\', this.checked, \'updateMngUseYn\');" class="input_on-off" >'
								+ '<label for="useYn'+val+'" class="label_on-off useYn" style="margin: auto;">'
								+ '<span class="marble"></span>'
								+ '<span class="on">공개</span>'
								+ '<span class="off">비공개</span>'
								+ '</label>'
								+ '</td>';
					dataArr[9] = ''
						+ '<td>'
						+ '<input type="checkbox" id="readYn'+val+'" name="readYn'+val+'" onchange="updateUseYn(\'readYn'+val+'\', this.checked, \'updateMngReadYn\');" class="input_on-off" >'
						+ '<label for="readYn'+val+'" class="label_on-off readYn" style="margin: auto;">'
						+ '<span class="marble"></span>'
						+ '<span class="on">가능</span>'
						+ '<span class="off">불가능</span>'
						+ '</label>'
						+ '</td>';
				}
			});
			
			$.each(dataArr,function(key, val) {
				inTag += dataArr[key];
			});
			inTag += '</tr>';
		});
		
		$('#'+OBJECT_ID+'').append( inTag );
		
		//체크박스 데이터 출력처리
		$.each(useYnVal, function(key, val){
			if( val == 'Y' ) $('input:checkbox[name=useYn'+useYnKey[key]+']').prop('checked',true);
			else $('input:checkbox[name=useYn'+useYnKey[key]+']').prop('checked',false);
		});
		$.each(readYnVal, function(key, val){
			if( val == 'Y' ) $('input:checkbox[name=readYn'+readYnKey[key]+']').prop('checked',true);
			else $('input:checkbox[name=readYn'+readYnKey[key]+']').prop('checked',false);
		});
		
		$('[for^=useYn]').click(function(){
			var idCnt = $(this).attr('for');
			idCnt = idCnt.replace('useYn','');
			if( $('[for=useYn'+idCnt+'] .on').css('display') == 'inline-block' ) if( $('[for=readYn'+idCnt+'] .on').css('display') == 'inline-block' ) $('#readYn'+idCnt+'').click();
		});
	}
	
	$('[name=MAST_PREV]').on('change',function(k){
		if (this.value != "") {
			var params = new Object();
			params.status = "EDIT";
			params.query = "updateMngMasterPrev";
			params.USER_IDX = '${out.params.userIdx }';
			params.PREV_IDX = this.value;
			fn_DataAjax( params );
			if( confirm('권한이 변경되었습니다. \n변경된 권한은 다음 로그인부터 적용됩니다. \n로그아웃하시겠습니까?') ){
				fn_BtnLogout();
			}
		}
	});
	
</script>
