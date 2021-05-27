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
				<th scope="row">서비스 종류</th>
				<td>
					<div class="form-inline">
						<select name="prdtType" class="form-control form-control-sm col-8" title="마스터 영역" >
							<option value="">선택해주세요</option>
							<option value="1:1코칭">1:1코칭</option>
							<option value="VOD">VOD</option>
							<option value="LIVE CLASS">LIVE CLASS</option>
						</select>
					</div>				
				</td>
				<th scope="row">분야</th>
				<td>
					<div class="form-inline">
						<select name="pCodeNm" class="form-control form-control-sm col-8" title="마스터 영역" >
							<option value="">선택해주세요</option>
						</select>
					</div>				
				</td>
				<th scope="row">분야상세</th>
				<td>
					<div class="form-inline">
						<select name="mCodeNm" class="form-control form-control-sm col-8" title="마스터 영역" >
							<option value="">선택해주세요</option>
						</select>
					</div>				
				</td>
				<td rowspan="2"><a id="btnSearch" onClick="fn_BtnSearch();" class="btn btn-md btn-black">검색</a></td>
			</tr>	
			<tr>
				<th scope="row">마스터명/상품코드/상품명</th>
				<td><input type="text" name="searchText" class="form-control form-control-sm col-8"  placeholder="검색어를 입력하세요" value="${out.params.searchText }"  onkeypress="if(event.keyCode==13){fn_BtnSearch();}"/></td>
				<th scope="row">판매상태</th>
				<td>
					<div class="form-inline">
						<select name="prdtStatCd" class="form-control form-control-sm col-8" title="마스터 영역" >
							<option value="">-- 구분 --</option>
						</select>
					</div>				
				</td>
				<th scope="row">등록일</th>
				<td style="text-align:center;">
					<input id="sysRegDtmStr" name="sysRegDtmStr" readonly="readonly" onChange="inputDateComparison(this, 'sysRegDtmStr', 'sysRegDtmEnd' );" type="text" class="form-control form-control-sm datepicker"   value="<c:if test="${out.params.sysRegDtmStr ne null}">${out.params.sysRegDtmStr}</c:if>"  autocomplete= "new-password" autocomplete__wrapper autocomplete style="width:45%;float:left;"/>
					<span style="padding: 8px;display: inline-block; float:left;">~</span>
					<input id="sysRegDtmEnd" name="sysRegDtmEnd" readonly="readonly" onChange="inputDateComparison(this, 'sysRegDtmStr', 'sysRegDtmEnd' );" type="text" class="form-control form-control-sm datepicker"  value="<c:if test="${out.params.sysRegDtmEnd ne null}">${out.params.sysRegDtmEnd}</c:if>"  autocomplete= "new-password" autocomplete__wrapper autocomplete  style="width:45%;float:left;" /> 
				</td>
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
			<col style="width: 5%;" />
				
			<col style="width: 7%;" />
			<col style="width: 7%;" />
			<col style="width: 7%;" />
			<col style="width: 7%;" />
			<col style="width: 10%;" />

			<col />
			<col style="width: 7%;" />
			<col style="width: 5%;" />
			
			<col style="width: 7%;" />
			<col style="width: 7%;" />
			<col style="width: 7%;" />
			
			
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No.</th>
				
				<th scope="col">서비스 종류</th>
				<th scope="col">마스터명</th>
				<th scope="col">분야</th>
				<th scope="col">분야상세</th>
				<th scope="col">상품코드</th>
				
				<th scope="col">상품명</th>
				<th scope="col">등록일</th>
				<th scope="col">찜 수</th>
				
				<th scope="col">리뷰 수</th>
				<th scope="col">평균 평점</th>
				<th scope="col">판매상태</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row">
					<tr>
						<td>${row.NUM_DESC_ORDER }</td>
						
						<td>${fn:split( row.PRDT_TYPE, ',' )[0]  }</td>
						<td>${row.USER_NM }</td>
						<td>${row.P_CODE_NM }</td>
						<td>${row.M_CODE_NM }</td>
						<td>
							<a href="${ unit.move('view', row.PRDT_CATE_CD, 'PRDT', row.CATE_IDX, 'CATE') }">
								<c:forEach items="${fn:split( row.PRDT_CD, ',' ) }" var="code">
									${code}
								</c:forEach>
							</a>
						</td>
						
						<c:if test="${ row.PRDT_NM1 eq null }"><td class="prdtTitle">-</td></c:if>
						<c:if test="${ row.PRDT_NM1 ne null }"><td class="prdtTitle">${ row.PRDT_NM1 } ${ row.PRDT_NM2 }</td></c:if>
						
						<td>${row.PRDT_REG_DTM }</td>
						<td><a class="btn " onclick="fn_BtnDatePopup( '', '${row.PRDT_CD }' );">${row.LIKE_CNT }</a></td>
						
						<td>${row.REVI_CNT }</td>
						<td>${row.REVI_AVG }</td>
						<td>${row.PRDT_STAT_NM }</td>
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
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">이름</th>
<!-- 									<th scope="col">분야</th> -->
<!-- 									<th scope="col">분야상세</th> -->
									<th scope="col">계정</th>
									<th scope="col">찜 등록일</th>
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


<script type="text/javascript">

//////////////////////////////////////////////////////////
// 1. 변수 초기화
//////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////
// 2. 첫 실행 함수
//////////////////////////////////////////////////////////
$(function(){
	fn_SelectOption("", "CAT", "pCodeNm");
	$('[name=pCodeNm]').val('${out.params.pCodeNm}');

	if ('${out.params.pCodeNm }' != '') {
		fn_SelectOption( $('[name=pCodeNm]').val(), "CAT", "mCodeNm");
		$('[name=mCodeNm]').val('${out.params.mCodeNm }');
	}

	fn_SelectOption("", "SAL", "prdtStatCd");
	$('[name=prdtStatCd]').val('${out.params.prdtStatCd}');
	$('[name=prdtType]').val('${out.params.prdtType}');


	$('.prdtTitle').each(function(){
		$(this).text( fn_LegnthOver( $(this).text(), 30 ) ); 
	});
	
});


$("[name=pCodeNm]").on('change',function(k){
	fn_SelectOption($(this).val(), "CAT", "mCodeNm");
});

//////////////////////////////////////////////////////////
//3. 사용자 함수
//////////////////////////////////////////////////////////



function fn_BtnDatePopup( PAGE_NO, BASK_PRDT_CD ) {
	
	var params = new Object();
	params.status = "PAGE";
	params.query = "selectMngPrdtLikeList";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.BASK_PRDT_CD = BASK_PRDT_CD;
	params.listCnt = $('#listCnt').val();
	params.thisPage = PAGE_NO;
	
	if (params.thisPage == 0 || params.thisPage == null || params.thisPage == "" || params.thisPage == undefined) {
		params.thisPage = 1;
	}

	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var jsonData = result.out.detail.data;
	var inTag = '';

	$('#popupList').empty();
	inTag += '<tr><td colspan="6">등록된 데이터가 없습니다.</td></tr>';
	$('#popupList').append( inTag );
	inTag = '';
	
	 if( jsonData.length ) {
		$('#popupList').empty();
		 
		$.each(jsonData, function(key, val) {
			
			inTag += '<tr>';
			inTag += '<td>'+ val.NUM_DESC_ORDER + '</td>';
			inTag += '<td>'+ val.USER_NM + '</td>';
// 			inTag += '<td>'+ val.P_CODE_NM + '</td>';
// 			inTag += '<td>'+ val.M_CODE_NM + '</td>';
			inTag += '<td>'+ val.USER_EMAIL + '</td>';
			inTag += '<td>'+ val.SYS_REG_DTM + '</td>';
			inTag += '</tr>';
		});
		
		$('#popupList').append( inTag );
	 }
		
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


</script>



