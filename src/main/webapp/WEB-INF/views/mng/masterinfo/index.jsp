<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<style>
#btnSearch:hover{	color: white!important;}
</style>
<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<colgroup>
			<col width="15%"/>					
			<col />					
			<col width="5%"/>					
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">마스터명/아이디</th>
				<td><input type="text" name="searchCate" class="form-control form-control-sm col-8"  placeholder="검색어를 입력하세요" value="${out.params.searchCate }"  onkeypress="if(event.keyCode==13){fn_BtnSearch();}"/></td>
				<td rowspan="2"><a id="btnSearch" onClick="fn_BtnSearch();" class="btn btn-md btn-black">검색</a></td>
			</tr>	
			<tr>	
				<th scope="row">기간</th>
				<td>
					<input id="MASTER_STR_DTM" name="MASTER_STR_DTM" readonly="readonly" onChange="inputDateComparison(this, 'MASTER_STR_DTM', 'MASTER_END_DTM' );" value="${out.params.masterStrDtm }" class="datepicker form-control form-control-sm" style="width:25%;display: inline-block;"  type="text" >
					~
					<input id="MASTER_END_DTM" name="MASTER_END_DTM" readonly="readonly" onChange="inputDateComparison(this, 'MASTER_STR_DTM', 'MASTER_END_DTM' );" value="${out.params.masterEndDtm }" class="datepicker form-control form-control-sm" style="width:25%;display: inline-block;"  type="text" >
				</td>	
			</tr>			
		</tbody>
	</table>
</div>

	
<!-- 리스트  시작-->
	<div class="form-inline" style="display:flex; justify-content:space-between; padding-bottom:10px; margin-top: 30px;">	
		<span class="listCount" style="display:inline-block;">총 마스터 수 : ${out.list.data[0].MASTER_CNT }명<span class="listCount" style="display:inline-block;"> / 검색결과 : ${out.list.paging.totalCnt }명</span></span>
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
		<caption>관리자 리스트 테이블</caption>
		<colgroup>
			<col style="width: 5%;" />	
			<col style="width: 10%;"/>
			<col />				
			<col style="width: 10%;" />			
			<col style="width: 7%;" />		
			<col style="width: 10%;" />			
			<col style="width: 10%;" />		
			<col style="width: 15%;" />		
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">마스터명</th>
				<th scope="col">계정</th>
				<th scope="col">분야내역</th>
				<th scope="col">회원가입일</th>
				<th scope="col">마스터승인일(최신 승인일)</th>
				<th scope="col">보유 마스터코드 수</th>
				<th scope="col">권한</th>
			</tr>
		</thead>
		<tbody>
 
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row">
					<tr>
						<td>${row.NUM_DESC_ORDER }</td>
						<td><a href="${ unit.move('view', row.USER_IDX, 'user') }">${ row.USER_NM } </a></td>
						<td><a href="${ unit.move('view', row.USER_IDX, 'user') }">${ row.USER_EMAIL } </a></td>
						<td>	${row.USER_KEYW_NM }</td>
						<td>${row.SYS_REG_DTM }</td>
						<td>${row.USER_MAST_JOIN_DTM }</td>
						<td>${row.CATE_CD_CNT }</td>
						<td>${row.PREV_NM }</td>
					</tr>
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

	<c:set value="${out.list.paging}"  var="paging" />
	<%@ include file="/WEB-INF/views/shared/mng_paging.jspf" %>



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
	
</script>



