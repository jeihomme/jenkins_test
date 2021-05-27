<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'index', 'ajax')}" />

<style>
#btnSearch:hover{	color: white!important;}
</style>
<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>마스터 노출 정보 조회</caption>
		<colgroup>
			<col style="width: 15%;" />
			<col style="width: 20%;" />
			<col style="width: 10%;" />
			<col style="width: 20%;" />
			<col style="width: 10%;" />
			<col style="width: 20%;" />
			<col style="width: 5%;" />
			<col />					
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">마스터명/마스터코드</th>
				<td><input type="text" name="masterSreach" class="form-control form-control-sm col-8"  placeholder="검색어를 입력하세요" value="${out.params.masterSreach }"  onkeypress="if(event.keyCode==13){fn_BtnSearch();}"/></td>
				<th scope="row">분야</th>
				<td>
					<select id="PARENT_CODE_ID" name="PARENT_CODE_ID" class="form-control form-control-sm col-8" title="분야" >
						<option value="">선택해주세요.</option>
					</select>
				</td>
				<th scope="row">분야상세</th>
				<td>
					<select id="CODE_ID" name="CODE_ID" class="form-control form-control-sm col-8">
						<option value="">분야를 선택해주세요.</option>
					</select>
				</td>
				<td ><a id="btnSearch" onClick="fn_BtnSearch();" class="btn btn-md btn-black">검색</a></td>
			</tr>	
		</tbody>
	</table>
</div>

	
<!-- 리스트  시작-->
	<div class="form-inline" style="display:flex; justify-content:space-between; padding-bottom:10px; margin-top: 30px;">	
		<span class="listCount" style="display:inline-block;">전체 <span class="ppm_key_color">${out.list.paging.totalCnt }</span></span>		
		<div id="sub-form-inline">
			<button class="btn btn-light  form-inline mr10 form-control-sm" onclick="excelDownload();" value="엑셀 다운로드">엑셀 다운로드</button>
			<select id="selectListCnt" class="designSelectBox form-control form-control-sm mr10" title="셀렉트박스">
				<option value="10" selected="">10</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="300">300</option>
			</select>
		</div>		
	</div>

<div class="tbl_list">
	<table class="list_tbl01" summary="">
		<caption>마스터 노출 정보 테이블</caption>
		<colgroup>
			<col style="width: 3%;" />	
			<col style="width: 3%;" />	
			<col />		
			<col style="width: 7%;" />	
			<col style="width: 7%;" />	
			<col style="width: 7%;" />

			<col style="width: 7%;" />			
			<col style="width: 5%;" />		
			<col style="width: 5%;" />		
			<col style="width: 5%;" />		
			<col style="width: 6%;" />		
			
			<col style="width: 5%;" />		
			<col style="width: 5%;" />		
			<col style="width: 5%;" />		
			<col style="width: 5%;" />		
		</colgroup>
		<thead>
			<tr>
				<th scope="col">
					<input type="checkbox" id="chk_all">
				</th>
				<th scope="col">No.</th>
				<th scope="col">마스터명</th>
				<th scope="col">분야</th>
				<th scope="col">분야상세</th>
				<th scope="col">마스터코드</th>
				
				<th scope="col">등록일</th>
				<th scope="col">VOD</th>
				<th scope="col">화상상담</th>
				<th scope="col">채팅상담</th>
				<th scope="col">라이브클래스</th>
				
				<th scope="col">이메일상담</th>
				<th scope="col">팔로우</th>
				<th scope="col">후기</th>
				<th scope="col">평점 평균</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row">
					<tr>
						<td>
							<input type="checkbox" class="chk CATE_IDX" name="chk" value="${row.CATE_IDX }">
						</td>
						<td>${row.NUM_DESC_ORDER }</td>
						<td>${row.USER_NM } (${row.USER_EMAIL})</td>
						<td>${row.CATE_PARENT_NM }</td>
						<td>${row.CATE_NM }</td>
						<td><a href="${ unit.move('view', row.CATE_IDX, 'CATE', row.USER_IDX , 'USER') }">${ row.CATE_CD } </a></td>
						
						<td>${row.SYS_REG_DTM }</td>
						<td>${row.VOD_CNT }</td>
						<td>${row.FACE_CNT }</td>
						<td>${row.CHAT_CNT }</td>
						<td>${row.LIVE_CNT }</td>
						<td>${row.MAIL_CNT }</td>
						<td><a class="btn btn-md" onclick="fn_BtnDatePopup( '', '${row.CATE_IDX }' );">${row.FOLL_CNT }</a></td>
						<td>${row.REVI_CNT }</td>
						<td>${row.REVI_SCOR_AVG }</td>
					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="15">등록된 내용이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>

	<c:set value="${out.list.paging}"  var="paging" />
	<%@ include file="/WEB-INF/views/shared/mng_paging.jspf" %>


<div class="btn_wrap" style="text-align: left;">
	<a class="insertPopup btn btn-md btn_key_color">분야변경</a>
</div>

<div id="popupDiv" class="alert_wrap">
	<div class="alert_layer">
		<div class="alert_inner">
			<div class="alert_header">
				<button class="btn btn_close_pop" style="display: block; top: 5px; right: 5px; border: none;" data-action="popup_hide"></button>
			</div>				
			<div class="dialog_content" >
				<div class="scroll_area">
					<h3 id="vodTotal"></h3>
					<div class="tbl_list" style="height: 350px;    overflow-y: scroll;">
						<table class="list_tbl01">
							<colgroup>
								<col style="width: 7%;" />
								<col style="width: 15%;" />
<%-- 								<col style="width: 15%;" /> --%>
<%-- 								<col style="width: 15%;" /> --%>
								<col />
								<col style="width: 15%;" />
								<col style="width: 15%;" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">이름</th>
<!-- 									<th scope="col">분야</th> -->
<!-- 									<th scope="col">분야상세</th> -->
									<th scope="col">계정</th>
									<th scope="col">구매 횟수</th>
									<th scope="col">팔로우 등록일</th>
								</tr>
							</thead>
							<tbody id="popupList">
							</tbody> 
						</table>
					</div>
						
					<div class="pagination justify-content-center paging">
						<ul style="justify-content:space-between;" id="popupPagingVar">
						</ul>
					</div>

					<div class="btn_wrap" style="text-align: right;">
						<a class="btn  btn-md btn-outline-dark" data-action="popup_hide">닫기</a>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>



<!-- 회원정보 수정 팝업 -->
<!--  팝업메뉴  -->
<div id="popup_masteropen_addCateCd" class="popup_wrap">
	<div class="popup_layer">
		<div class="popup_inner">
			<div class="popup_header">	
				<h1 class="title" style="margin:0; font-weight:600 !important;">분야상세 변경</h1>			
				<button onclick="fn_cleanPop();" class="btn btn_close_pop" data-action="popup_hide">닫기</button>
				<input id="userEditIdx" type="hidden" />
			</div>
			<div class="dialog_content">
				<div class="scroll_area">
<!-- 					Start 팝업 컨텐츠 -->
					<div class="tbl_view" >
						<table class="view_tbl01" summary="" id="cateArea">
							<caption>분야상세 변경 테이블</caption>
							<colgroup>
								<col style="width: 20%;" />
								<col style="width: 80%;" />							
								<col  />	
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">분야</th>
									<td>
										<select id="PARENT_CODE_ID_EDIT" name="PARENT_CODE_ID_EDIT" class="form-control form-control-sm col-8" title="분야" >
											<option value="">분야를 선택해주세요.</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row">분야상세</th>
									<td>
										<select id="CODE_ID_EDIT" name="CODE_ID_EDIT" class="form-control form-control-sm col-8">
											<option value="">분야를 선택해주세요.</option>
										</select>
									</td>				
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="btn_wrap" style="text-align: right;">
						<a href="javascript:;" onclick="fn_BtnChangeCateIdx();" class="btn  btn-md btn_key_color">저장</a>						
					</div>				
<!-- 					// End 팝업 컨텐츠 -->
				</div><!-- // End scroll_area -->
			</div><!-- // End dialog_content -->
		</div><!-- // End popup_inner -->
	</div><!-- // End popup_layer -->
</div>

<script type="text/javascript">

//////////////////////////////////////////////////////////
// 1. 변수 초기화
//////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////
// 2. 첫 실행 함수
//////////////////////////////////////////////////////////
$(function(){
// 	검색조건 분야
	fn_SelectOption("", "CAT", "PARENT_CODE_ID");
	$('[name=PARENT_CODE_ID]').val( '${out.params.parentCodeId}');
	
// 	팝업 분야
	fn_SelectOption("", "CAT", "PARENT_CODE_ID_EDIT");

	if( $('[name=PARENT_CODE_ID]').val() != '' ) {
		fn_SelectOption( $('[name=PARENT_CODE_ID]').val(), "CAT", "CODE_ID");
		$('[name=CODE_ID]').val( '${out.params.codeId}');
	}
});

// 검색조건
// 분야상세 값 변경
$("[name=PARENT_CODE_ID]").on('change',function(k){
	$('[name=CODE_ID]').empty();
	$('[name=CODE_ID]').append('<option value="">분야를 선택해주세요.</option>');
	if( $(this).val() != '' ) fn_SelectOption($(this).val(), "CAT", "CODE_ID");
});

//팝업
// 분야상세 값 변경
$("[name=PARENT_CODE_ID_EDIT]").on('change',function(k){
	$('[name=CODE_ID_EDIT]').empty();
	$('[name=CODE_ID_EDIT]').append('<option value="">분야를 선택해주세요.</option>');
	if( $(this).val() != '' ) fn_SelectOption($(this).val(), "CAT", "CODE_ID_EDIT");
});

// 팝업열기
$('.insertPopup').click(function(){
	// dataCd 와 vodCd 최근값 가져오기
	
	if ($('input[name=chk]:checked').length == 0) {
		alert('체크박스를 선택해주세요');
	}else{
		$('[name=CATE_CD]').val('( 자동생성 )');
		fn_SelectOption("", "CAT", "PARENT_CODE_ID");
		
		popupShow("500","","popup_masteropen_addCateCd");	
	}
});

$('#chk_all').click(function(){
	if ( $('#chk_all').is(':checked') ) $('.chk').prop('checked', true);	
	else	$('.chk').prop('checked', false);	
});

$('.chk').click(function(){
	if ( $('input[name="chk"]:checked').length == $('.chk').length ) 	$('#chk_all').prop("checked", true);
	else	$('#chk_all').prop("checked", false);
});

//////////////////////////////////////////////////////////
//3. 사용자 함수
//////////////////////////////////////////////////////////
	
	
function fn_BtnDatePopup( PAGE_NO, CATE_IDX ) {
	
	var params = new Object();
	params.status = "PAGE";
	params.query = "selectMngMasteropenFollList";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.CATE_IDX = CATE_IDX;
	params.listCnt = $('#listCnt').val();
	params.thisPage = PAGE_NO;
	
	if (params.thisPage == 0 || params.thisPage == null || params.thisPage == "" || params.thisPage == undefined) {
		params.thisPage = 1;
	}

	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var jsonData = result.out.detail.data;
	var inTag = '';

	$('#popupList').empty();
	
	 if( jsonData.length ) {
		$.each(jsonData, function(key, val) {
			inTag += '<tr>';
			inTag += '<td>'+ val.NUM_DESC_ORDER + '</td>';
			inTag += '<td>'+ val.USER_NM + '</td>';
// 			inTag += '<td>'+ val.P_CODE_NM + '</td>';
// 			inTag += '<td>'+ val.M_CODE_NM + '</td>';
			inTag += '<td>'+ val.USER_EMAIL + '</td>';
			inTag += '<td>'+ val.BUY_CNT + '</td>';
			inTag += '<td>'+ val.SYS_REG_DTM + '</td>';
			inTag += '</tr>';
		});
	 } else {
		inTag += '<tr><td colspan="99">등록된 데이터가 없습니다.</td></tr>';
	 }

	$('#popupList').append( inTag );
		
	var varHtml = "";	
	varHtml += '		<li><a id="pagingFirst" onclick="fn_BtnDatePopup('+ result.out.detail.paging.prevStep +');"  aria-label="Previous"><i class="fa fa-angle-left"></i></a></li>   ';
	for (var i = result.out.detail.paging.startPage; i <= result.out.detail.paging.endPage; i++) {
		if (result.out.detail.paging.thisPage == i) varHtml += '<li><a id="pagingActive" onclick="fn_BtnDatePopup('+ i +');" class="active" style="cursor:pointer;">'+ i +'</a></li>   ';
		else varHtml += '<li><a name="pagingPassiive" onclick="fn_BtnDatePopup('+ i +');" style="cursor:pointer;">'+ i +'</a></li>   ';
	}
	varHtml += '		<li><a id="pagingLast" onclick="fn_BtnDatePopup('+ result.out.detail.paging.nextStep +');"  aria-label="Next"><i class="fa fa-angle-right"></i></a></li>   ';
	
	$('#popupPagingVar').empty();
	$('#popupPagingVar').append( varHtml );
		
	alertShow('70%','','popupDiv');
		
}

function fn_BtnChangeCateIdx(){

	var params = new Object();
	
	$('.CATE_IDX').each(function(key, val){
		if( $(this).is(':checked') ) {
			params.status = "EDIT";
			params.query = "updateMngCodeIdData";
			params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
			params.CATE_IDX = $(this).val();
			params.CODE_ID = $('[name=CODE_ID_EDIT]').val();
			
			if( params.CODE_ID != '' ) var result = fn_DataAjax( params ); 
// 			console.log('CATE_IDX : ' + params.CATE_IDX + ', CODE_ID : ' + params.CODE_ID );
		}
	});
	
	if( params.CODE_ID != '' ) {
		alert('정상적으로 처리되었습니다.');
		location.reload();
	} else {
		alert('분야/분야상세를 모두 선택해주세요.');
	} 
	
}


function fn_cleanPop(){
	$('[name=CODE_ID_EDIT]').val('');
}
</script>



