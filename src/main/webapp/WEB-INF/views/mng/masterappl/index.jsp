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
		<caption>관리자 리스트 조회</caption>
		<colgroup>
			<col style="width: 15%;" />
			<col />	
			<col style="width: 15%;" />
			<col  />
			<col style="width: 5%;" />
			<col />					
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">마스터명/닉네임/이메일</th>
				<td>
					<div class="form-inline">
						<input type="text" id="APPL_MASTER_NM" value="${out.params.applMasterNm}"  onkeypress="if(event.keyCode==13){fn_BtnSearch();}" name="APPL_MASTER_NM" class="form-control form-control-sm col-8" title="마스터명/닉네임/이메일" >
					</div>				
				</td>
				<th scope="row">자격증여부</th>
				<td>
					<div class="form-inline">
						<select id="APPL_LICE_YN" name="APPL_LICE_YN" class="form-control form-control-sm col-8" title="" >
							<option value="">-- 전체 --</option>
							<option value="Y">Y</option>
							<option value="N">N</option>
						</select>
					</div>				
				</td>
				<td rowspan="3"><a id="btnSearch" onClick="fn_BtnSearch();" class="btn btn-md btn-black">검색</a></td>
			</tr>	
			<tr>
				<th scope="row">분야</th>
				<td>
					<div class="form-inline">
						<select id="APPL_HOPE_PARENT" name="APPL_HOPE_PARENT" class="form-control form-control-sm col-8" title="마스터 영역" >
							<option value="">-- 구분 --</option>
						</select>
					</div>				
				</td>
				<th scope="row">분야상세</th>
				<td>
					<div class="form-inline">
						<select id="APPL_HOPE" name=APPL_HOPE class="form-control form-control-sm col-8" title="마스터 영역" >
							<option value="">-- 구분 --</option>
						</select>
					</div>	
				</td>
			</tr>	
			<tr>
				<th scope="row">구분</th>
				<td>
					<div class="form-inline">
						<select id=APPL_MAST_TYPE name="APPL_MAST_TYPE" class="form-control form-control-sm col-8" title="마스터 영역" >
							<option value="">-- 구분 --</option>
						</select>
					</div>	
				</td>
				<th scope="row">승인여부</th>
				<td>
					<div class="form-inline">
						<select id="APPL_CD" name="APPL_CD" class="form-control form-control-sm col-8" title="" >
							<option value="">-- 구분 --</option>
						</select>
					</div>				
				</td>
			</tr>				
		</tbody>
	</table>
</div>

	
<!-- 리스트  시작-->
	<div class="form-inline" style="display:flex; justify-content:space-between; padding-bottom:10px; margin-top: 30px;">	
		<span class="listCount" style="display:inline-block;">전체 <span class="ppm_key_color">${out.list.paging.totalCnt }</span></span>		
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
			<col />				
			<col style="width: 10%;" />		
			<col style="width: 7%;" />		
			<col style="width: 10%;" />			
			<col style="width: 10%;" />	
						
			<col style="width: 7%;" />			
			<col style="width: 20%;" />		
<%-- 			<col style="width: 10%;" />		 --%>
			<col style="width: 5%;" />		
			<col style="width: 5%;" />		
			<col style="width: 5%;" />
					
			<col style="width: 7%;" />		
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">마스터명</th>
				<th scope="col">닉네임</th>
				<th scope="col">신청일</th>
				<th scope="col">이메일</th>
				<th scope="col">연락처</th>
				
				<th scope="col">분야</th>
				<th scope="col">분야상세</th>
<!-- 				<th scope="col">서비스신청</th> -->
				<th scope="col">구분</th>
				<th scope="col">자격증여부</th>
				<th scope="col">승인상태</th>
				
				<th scope="col">승인상태수정일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row">
					<tr>
						<td>${row.NUM_DESC_ORDER }</td> 
						<td><a href="${unit.move('view', row.APPL_IDX, 'appl' )}">${row.USER_NM }</a> </td>
						<td><a href="${unit.move('view', row.APPL_IDX, 'appl' )}">${row.USER_NICK }</a> </td>
						<td>${row.SYS_REG_DTM }</td>
						<td><a href="${unit.move('view', row.APPL_IDX, 'appl' )}">${row.USER_EMAIL }</a> </td>
						<td>${row.USER_PHONE }</td>
						
						<td>${row.APPL_HOPE_PARENT }</td>
						<td>
							<c:if test="${row.APPL_HOPE_1 ne '' and not empty row.APPL_HOPE_1}">${row.APPL_HOPE_1 }</c:if>
							<c:if test="${row.APPL_HOPE_2 ne '' and not empty row.APPL_HOPE_2}">, ${row.APPL_HOPE_2 }</c:if>
							<c:if test="${row.APPL_HOPE_3 ne '' and not empty row.APPL_HOPE_3}">, ${row.APPL_HOPE_3 }</c:if>
						</td>
<%-- 						<td>${row.APPL_SVCE_CD }</td> --%>
						<td>${row.APPL_MAST_TYPE }</td>
						<td>
							<c:choose>
								<c:when test="${ (row.APPL_LICE_NM1 ne '' and not empty row.APPL_LICE_NM1) or (row.APPL_LICE_NM2 ne '' and not empty row.APPL_LICE_NM2) }">Y</c:when>
								<c:otherwise>N</c:otherwise>
							</c:choose>
						</td>
						
						<td>${row.APPL_CD }</td>
						<td>${row.SYS_MOD_DTM }</td>
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

<script type="text/javascript">

//////////////////////////////////////////////////////////
// 1. 변수 초기화
//////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////
// 2. 첫 실행 함수
//////////////////////////////////////////////////////////
$(function(){
	fn_SelectOption("", "MAC", "APPL_CD");
	fn_SelectOption("", "MAS", "APPL_MAST_TYPE");
	fn_SelectOption("", "CAT", "APPL_HOPE_PARENT");
	$('#APPL_HOPE_PARENT').val('${out.params.applHopeParent}');
	$('#APPL_CD').val('${out.params.applCd}');
	
	$('#APPL_MAST_TYPE').val('${out.params.applMastType }');
	$('#APPL_LICE_YN').val('${out.params.applLiceYn }');
	if ('${out.params.applHopeParent }' != '') {
		fn_SelectOption('${out.params.applHopeParent }', "CAT", "APPL_HOPE");
		$('#APPL_HOPE').val('${out.params.applHope }');
	}
// 	fn_SelectOption("CAT01","CAT","testSelect");
});

$("[name=APPL_HOPE_PARENT]").on('change',function(k){
	fn_SelectOption($(this).val(), "CAT", "APPL_HOPE");
});

//////////////////////////////////////////////////////////
//3. 사용자 함수
//////////////////////////////////////////////////////////
	
</script>



