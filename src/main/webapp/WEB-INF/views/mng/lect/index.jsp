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
		<caption>동영상강좌 리스트 조회</caption>
		<colgroup>
			<col style="width: 10%;" />
			<col style="width: 20%;" />
			<col style="width: 10%;" />
			<col style="width: 20%;" />
			<col style="width: 10%;" />
			<col style="width: 25%;" />	
			<col style="width: 5%;" />
			<col />					
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">분야</th>
				<td>
					<div class="form-inline">
						<select id="PARENT_CODE_ID" name="PARENT_CODE_ID" class="form-control form-control-sm col-8" title="마스터 영역" >
							<option value="">-- 구분 --</option>
						</select>
					</div>	
				</td>
				<th scope="row">분야상세</th>
				<td >
					<div class="form-inline">
						<select id="CODE_ID" name="CODE_ID" class="form-control form-control-sm col-8" title="마스터 영역" >
							<option value="">-- 구분 --</option>
						</select>
					</div>	
				</td>
				<th scope="row">판매 상태</th>
				<td>
					<select id="lectSelectStatCd" name="lectSelectStatCd" class="form-control form-control-sm col-8">
						<option value="" selected="selected">전체</option>
					</select>
				</td>
				<td rowspan="2"><a id="btnSearch" onClick="fn_BtnSearch();" class="btn btn-md btn-black">검색</a></td>
			</tr>	
			<tr>
				<th scope="row">마스터명/상품코드</th>
				<td><input type="text" name="searchList" class="form-control form-control-sm col-8"  placeholder="검색어을 입력하세요" value="${out.params.searchList }"  onkeypress="if(event.keyCode==13){fn_BtnSearch();}"/></td>
				
				<th scope="row">등록일</th>
				<td colspan="3" style="text-align:center;">
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
		<span class="listCount" style="display:inline-block;">전체 <span ><span class="ppm_key_color">${out.list.paging.totalCnt }</span></span></span>		
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
		<caption>동영상강좌 리스트 테이블</caption>
		<colgroup>
			<col style="width: 5%;" />	
			<col style="width: 7%;" />			
			<col>
			<col style="width: 7%;" />		
			<col style="width: 7%;" />	
			
			<col style="width: 7%;" />		
			<col style="width: 5%;" />			
			<col style="width: 5%;" />			
			<col style="width: 5%;" />			
			<col style="width: 5%;" />			
			
			<col style="width: 7%;" />			
			<col style="width: 7%;" />			
			<col style="width: 7%;" />		
			<col style="width: 7%;" />		
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">마스터명</th>
				<th scope="col">상품코드</th>
				<th scope="col">분야</th>
				<th scope="col">분야상세</th>
				
				<th scope="col">수강일수</th>
				<th scope="col">총영상수</th>
				<th scope="col">상품가(원)</th>
				<th scope="col">할인종류</th>
				<th scope="col">할인폭</th>
				
				<th scope="col">판매가(원)</th>
				<th scope="col">등록일</th>
				<th scope="col">판매 상태</th>
				<th scope="col">클래스복사</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row">
					<tr>
						<td>${row.NUM_DESC_ORDER }</td>
						<td>${ row.MASTER_NM }</td>
						<td><a href="${ unit.move('edit', row.LECT_IDX, 'lect') }">${row.LECT_CD } </a></td>
<%-- 						<td><a href="${ unit.move('edit', row.LECT_IDX, 'lect') }">${row.LECT_NM }</a></td> --%>
						
						<td>${row.P_CODE_NM }</td>
						<td>${row.M_CODE_NM }</td>
						
						<td>${row.LECT_DTM }</td>
						<td>${row.LECT_VOD_CNT }</td>
						<td>${row.LECT_PRIC }</td>
						<td>${row.LECT_DISC_CDNM }</td>
						<td>${row.LECT_DISC }</td>
						<td>${row.LECT_PRIC_REAL }</td>
						
						<td>${row.SYS_REG_DTM }</td>
						<td>${row.LECT_STAT_CDNM }</td>
						<td><a class="btn" href="${ unit.move('write', row.LECT_IDX, 'lect') }">클래스복사</a></td>
					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="13">등록된 내용이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>

	<c:set value="${out.list.paging}"  var="paging" />
	<%@ include file="/WEB-INF/views/shared/mng_paging.jspf" %>
	<div class="col-4 btn_pagination" style="margin: 29px 0 0; float: right"><a href='${unit.move("write", "" )}' class="btn btn-md btn_key_color">신규등록</a></div> 


<script type="text/javascript">

//////////////////////////////////////////////////////////
// 1. 변수 초기화
//////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////
// 2. 첫 실행 함수
//////////////////////////////////////////////////////////
$(function(){
	fn_SelectOption("","SAL","lectSelectStatCd");
	$('#lectSelectStatCd').val('${out.params.lectSelectStatCd }');
	
	$('#FAQ_YN').val('${out.params.faqYn }');
	$('#FAQ_USE_YN').val('${out.params.faqUseYn }');
	
	fn_SelectOption("", "CAT", "PARENT_CODE_ID");
	$('#PARENT_CODE_ID').val('${out.params.parentCodeId }');
	
	if ('${out.params.parentCodeId }' != '') {
		fn_SelectOption('${out.params.parentCodeId }', "CAT", "CODE_ID");
		$('#CODE_ID').val('${out.params.codeId }');
	}
	
});

$("[name=PARENT_CODE_ID]").on('change',function(k){
	$("[name=CODE_ID]").empty();
	$("[name=CODE_ID]").append('<option value="">분야를 선택해주세요</option>');
	if( $(this).val() != '' ) fn_SelectOption($(this).val(), "CAT", "CODE_ID");
});

//////////////////////////////////////////////////////////
//3. 사용자 함수
//////////////////////////////////////////////////////////
	
</script>



