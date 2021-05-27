<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<style>
#btnSearch:hover{	color: white!important;}
#popupList tr th {text-align: center;}
#popupList tr:nth-child(1) td {border:none;}
</style>
<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>관리자 리스트 조회</caption>
		<colgroup>
			<col style="width: 10%;" />
			<col style="width: 37.5%;"/>					
			<col style="width: 10%;" />
			<col />					
			<col style="width: 5%;" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">쿠폰명</th>
				<td><input type="text" name="COUP_NM" class="form-control form-control-sm col-8"  placeholder="검색어를 입력하세요" value="${out.params.coupNm }"  onkeypress="if(event.keyCode==13){fn_BtnSearch();}"/></td>
				<th scope="row">회원명/회원ID</th>
				<td><input type="text" name="USER_NM" class="form-control form-control-sm col-8"  placeholder="검색어를 입력하세요" value="${out.params.userNm }"  onkeypress="if(event.keyCode==13){fn_BtnSearch();}"/></td>
				<td rowspan="2"><a id="btnSearch" onClick="fn_BtnSearch();" class="btn btn-md btn-black">검색</a></td>
			</tr>		
			<tr>
				<th scope="row">상품명</th>
				<td><input type="text" name="PRDT_NM" class="form-control form-control-sm col-8"  placeholder="검색어를 입력하세요" value="${out.params.prdtNm }"  onkeypress="if(event.keyCode==13){fn_BtnSearch();}"/></td>
				<th scope="row">사용기간</th>
				<td>
					<input name="COUP_STR_DTM"  type="text" class="form-control form-control-sm datepicker col-8" readonly="readonly" style="width:45%;float:left;"  value="<c:if test="${out.params.coupStrDtm ne null}">${out.params.coupStrDtm}</c:if>"  autocomplete= "new-password" autocomplete__wrapper autocomplete />
					<span style="padding: 8px;display: inline-block; float:left;">~</span>
					<input name="COUP_END_DTM"  type="text" class="form-control form-control-sm datepicker col-8" readonly="readonly" style="width:45%;float:left;"  value="<c:if test="${out.params.coupEndDtm ne null}">${out.params.coupEndDtm}</c:if>"  autocomplete= "new-password" autocomplete__wrapper autocomplete />
				</td>
			</tr>
		</tbody>
	</table>
</div>
	
<!-- 리스트  시작-->
	<div class="form-inline" style="display:flex; justify-content:space-between; padding-bottom:10px; margin-top: 30px;">	
		<span class="listCount" style="display:inline-block;">전체 <span ><span class="ppm_key_color">${out.list.paging.totalCnt }</span></span></span>		
		<div id="sub-form-inline">
<!-- 			<button class="btn btn-light  form-inline mr10 form-control-sm" onclick="excelDownload();" value="엑셀 다운로드">엑셀 다운로드</button> -->
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
		<caption>관리자 리스트 테이블</caption>
		<colgroup>
			<col style="width: 3%;" />	
			<col style="width: 6%;" />	
			<col style="width: 6%;" />	
			<col style="width: 6%;" />	
			<col />
							
			<col style="width: 6%;" />	
			<col style="width: 6%;" />				
			<col style="width: 15%;" />				
			<col style="width: 12%;" />
			<col style="width: 7%;" />
					
			<col style="width: 6%;" />	
			<col style="width: 6%;" />		
			<col style="width: 6%;" />		
			<col style="width: 6%;" />		
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">쿠폰등록일</th>
				<th scope="col">쿠폰사용기간</th>
				<th scope="col">분야</th>
				<th scope="col">쿠폰명</th>
				
				<th scope="col">쿠폰발행일</th>
				<th scope="col">방식</th>
				<th scope="col">회원명(회원ID)</th>
				<th scope="col">상품명</th>
				<th scope="col">결제번호</th>
				
				<th scope="col">쿠폰사용일</th>
				<th scope="col">할인금액</th>
				<th scope="col">결제금액</th>
				<th scope="col">결제상태</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row">
					<tr>
						<td>${row.NUM_DESC_ORDER }</td>
						<td>${row.COUP_DTM }</td>
						<td>${row.COUP_TERM }</td>
						<td>${row.COUP_CATE_CD }</td>
						<td>${row.COUP_NM }</td></td>
						
<%-- 						<td><a class="btn " onclick="fn_BtnPopup( '${row.COUP_IDX }' );">${row.COUP_NM }</a></td> --%>
						<td>${row.COUP_REG_DTM }
						<td>${row.COUP_KIND }</td>
						<td>${row.USER_NM }(>${row.USER_EMAIL })</td>
						<td>	
						<c:choose>
							<c:when test="${ fn:length( row.PRDT_NM ) > 11 }">
								${ fn:substring( row.PRDT_NM, 0, 11 ).concat("...") }
							</c:when>
							<c:otherwise>
								${ row.PRDT_NM }
							</c:otherwise>
						</c:choose>	
						</td>
						<td>${row.BUY_NO }</td>
						
						<td>${row.COUP_USE_DTM }</td>
						<td>${row.REAL_DISC_PRIC }</td>
						<td>${row.BUY_PRIC }</td>
						<td>${row.BUY_STAT }</td>
					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="99">등록된 내용이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>

	<c:set value="${out.list.paging}"  var="paging" />
	<%@ include file="/WEB-INF/views/shared/mng_paging.jspf" %> 

<div id="popupDiv" class="alert_wrap">
	<div class="alert_layer">
		<div class="alert_inner">
			<div class="alert_header">
				<button class="btn btn_close_pop" style="display: block; top: 5px; right: 5px; border: none;" data-action="popup_hide"></button>
			</div>				
			<div class="dialog_content" >
				<div class="scroll_area">
					<h3 id="vodTotal">쿠폰사용내역</h3>
					<div class="tbl_list" >
						<table class="list_tbl01">
							<colgroup>
								<col style="width: 15%;" />
								<col />
								<col style="width: 15%;" />
								<col style="width: 15%;" />
								<col style="width: 10%;" />
								<col style="width: 10%;" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">구분</th>
									<td id="COUP_SERV_NM" colspan="99"></td>
								</tr>
								<tr>
									<th scope="col">사용기간(일)</th>
									<td  colspan="99"><span id="COUP_PERIOD"></span>(<span id="COUP_PERIOD_DIFF"></span>일)</td>
								</tr>
								<tr>
									<th scope="col">발행건수</th>
									<td id="COUP_ISSU"  colspan="99"></td>
								</tr>
							</thead>
							<tbody id="popupList">
								<tr>
									<td></td> 
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>서비스</th>
									<th>품명</th>
									<th>분류</th>
									<th>분류상세</th>
									<th>할인금액</th>
									<th>실결제금액</th>
								</tr>
								<tr style="">
									<td id="PRDT_TYPE"></td>
									<td id=""><span id="INFO_PRDT_TITL1"></span><br><span id="INFO_PRDT_TITL2"></span></td>
									<td id="P_CODE_NM"></td>
									<td id="M_CODE_NM"></td>
									<td id="COUP_SALE"></td>
									<td id="BUY_PRIC"></td>
								</tr>
							</tbody> 
						</table>
					</div>

					<div class="btn_wrap" style="text-align: right;">
						<a class="btn  btn-md btn-outline-dark" data-action="popup_hide">닫기</a>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">

//////////////////////////////////////////////////////////
// 1. 변수 초기화
//////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////
// 2. 첫 실행 함수
//////////////////////////////////////////////////////////
$(function(){
// 	fn_SelectOption("CAT01","CAT","testSelect");
});

//////////////////////////////////////////////////////////
//3. 사용자 함수
//////////////////////////////////////////////////////////
	
function fn_BtnPopup( COUP_IDX ) {
	
	var params = new Object();
	params.status = "LIST";
	params.query = "selectMngCuseDetail";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.COUP_IDX = COUP_IDX;

	fn_DataDetail( params, "N" );
	

// INFO |-------------|-------------|------------------------|-----------------|----------|-----------|----------------|-----------------------|--------|--------|----------|---------| 
// INFO |COUP_SERV_CD |COUP_SERV_NM |COUP_PERIOD             |COUP_PERIOD_DIFF |COUP_ISSU |PRDT_TYPE  |INFO_PRDT_TITL1 |INFO_PRDT_TITL2        |CODE_NM |CODE_NM |COUP_SALE |BUY_PRIC | 
// INFO |-------------|-------------|------------------------|-----------------|----------|-----------|----------------|-----------------------|--------|--------|----------|---------| 
// INFO |ALL          |전체           |2021-01-20 ~ 2021-01-21 |1                |1         |LIVE CLASS |유수연의 강렬 토익강의    |토익 비법 대공개, 지금 바로 시작합니다 |외국어     |토익      |2,000     |198000   | 
// INFO |-------------|-------------|------------------------|-----------------|----------|-----------|----------------|-----------------------|--------|--------|----------|---------| 
	 
// 	var jsonData = result.out.detail.data;
// 	var inTag = '';

// 	$('#popupList').empty();
	
// 	 if( jsonData.length ) {
// 		$.each(jsonData, function(key, val) {
// 			inTag += '<tr>';
// 			inTag += '<td>'+ val.NUM_DESC_ORDER + '</td>';
// 			inTag += '<td>'+ val.USER_NM + '</td>';
// // 			inTag += '<td>'+ val.P_CODE_NM + '</td>';
// // 			inTag += '<td>'+ val.M_CODE_NM + '</td>';
// 			inTag += '<td>'+ val.USER_EMAIL + '</td>';
// 			inTag += '<td>'+ val.SYS_REG_DTM + '</td>';
// 			inTag += '</tr>';
// 		});
// 	 } else {
// 		inTag += '<tr><td colspan="6">등록된 데이터가 없습니다.</td></tr>';
// 	 }

// 	$('#popupList').append( inTag );
		
	alertShow('70%','','popupDiv');
		
}
</script>



