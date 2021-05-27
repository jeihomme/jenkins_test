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
			<col style="width: 10%;" />
			<col style="width: 35%;" />
			<col style="width: 10%;" />
			<col style="width: 40%;" />
			<col style="width: 5%;" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">구분</th>
				<td>
					<select name="bannType" class="form-control form-control-sm col-8" >
						<option value="">-- 구분 --</option>
					</select>
				</td>
				<th scope="row">제목</th>
				<td><input type="text" name="bannTitl" class="form-control form-control-sm col-8"  placeholder="제목을 입력하세요" value="${out.params.bannTitl }"  onkeypress="if(event.keyCode==13){fn_BtnSearch();}"/></td>
				
				<td rowspan="2"><a id="btnSearch" onClick="fn_BtnSearch();" class="btn btn-md btn-black">검색</a></td>
			</tr>	
			<tr>
				<th scope="row">공개여부</th>
				<td>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio0_1" name="bannUseYn" value="" checked />
						<label for="radio0_1" class="label_txt">전체</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio0_2" name="bannUseYn" value="Y" <c:if test="${out.params.bannUseYn eq 'Y' }">checked</c:if> />
						<label for="radio0_2" class="label_txt">공개</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio0_3" name="bannUseYn" value="N" <c:if test="${out.params.bannUseYn eq 'N' }">checked</c:if> />
						<label for="radio0_3" class="label_txt">비공개</label>
					</div>
				</td>
				<th scope="row">노출순서</th>
				<td>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio1_1" name="bannOrdr" value="" checked />
						<label for="radio1_1" class="label_txt">등록순</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio1_2" name="bannOrdr" value="Y" <c:if test="${out.params.bannOrdr eq 'Y' }">checked</c:if> />
						<label for="radio1_2" class="label_txt">내림차순</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio1_3" name="bannOrdr" value="N" <c:if test="${out.params.bannOrdr eq 'N' }">checked</c:if> />
						<label for="radio1_3" class="label_txt">오름차순</label>
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
<%-- 			<col style="width: 5%;" /> --%>
			<col style="width: 10%;" />
			<col style="width: 10%;" />	
			<col style="width: 10%;" />			
			<col >							
			<col style="width: 15%;" />		
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">구분</th>
				<th scope="col">노출순서</th>
				<th scope="col">제목</th>
				<th scope="col">공개여부</th>
				
				<th scope="col">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row">
					<tr>

<!--  INFO |---------|----------|----------|-----------|------------|------------|---------|--------|  -->
<!--  INFO |BANN_IDX |BANN_TYPE |BANN_ORDR |BANN_TITL |BANN_USE_YN |SYS_REG_DTM |NUM_DESC |NUM_ASC |  -->
<!--  INFO |---------|----------|----------|-----------|------------|------------|---------|--------|  -->
<!--  INFO |1        |최상단띠배너    |1         |1          |Y           |2020-12-21  |1        |1       |  -->
<!--  INFO |---------|----------|----------|-----------|------------|------------|---------|--------|  -->
					
						<td>${row.NUM_DESC_ORDER  }</td>
						<td>${row.BANN_TYPE }</td>
						<td>${row.BANN_ORDR }</td>
						<td><a href="${ unit.move('edit', row.BANN_IDX, 'bann') }">${ row.BANN_TITL }</a></td>
						<td>${row.BANN_USE_YN }</td>
						
						<td>${row.SYS_REG_DTM }</td>
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
	<div class="col-4 btn_pagination" style="margin: 29px 0 0; float: right"><a href='${unit.move("write", "" )}' class="btn btn-md btn_key_color">신규등록</a></div> 



<script type="text/javascript">

//////////////////////////////////////////////////////////
// 1. 변수 초기화
//////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////
// 2. 첫 실행 함수
//////////////////////////////////////////////////////////
$(function(){
	fn_SelectOption("", "PRD", "bannType");
	$('[name=bannType] option[value="PRD02"]').remove();
	$('[name=bannType] option[value="PRD03"]').remove();
	$('[name=bannType] option[value="PRD04"]').remove();
	$('[name=bannType]').val('${out.params.bannType}');
});

//////////////////////////////////////////////////////////
//3. 사용자 함수
//////////////////////////////////////////////////////////
	
</script>



