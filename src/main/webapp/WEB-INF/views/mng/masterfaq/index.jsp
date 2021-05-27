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
		<caption>FAQ 리스트 조회</caption>
		<colgroup>
			<col width="10%"/>					
			<col width="20%"/>				
			<col width="10%"/>					
			<col width="20%"/>				
			<col width="10%"/>					
			<col />				
			<col width="5%"/>					
		</colgroup>
		<tbody>	
			<tr>
				<th scope="row">마스터명</th>
				<td>
					<div class="form-inline">
						<input type="text" name="CATE_IDX" class="form-control form-control-sm col-8" title="마스터 영역" value="${out.params.cateIdx}"  onkeypress="if(event.keyCode==13){fn_BtnSearch();}" />
					</div> 
				</td>
				<th scope="row">FAQ 등록여부</th>
				<td>
					<div class="form-inline">
						<select id="FAQ_YN" name="FAQ_YN" class="form-control form-control-sm col-8" title="" >
							<option value="">-- 전체 --</option>
							<option value="Y">Y</option>
							<option value="N">N</option>
						</select>
					</div>				
				</td>
				<th scope="row">FAQ 노출여부</th>
				<td>
					<div class="form-inline">
						<select id="FAQ_USE_YN" name="FAQ_USE_YN" class="form-control form-control-sm col-8" title="" >
							<option value="">-- 전체 --</option>
							<option value="Y">Y</option>
							<option value="N">N</option>
						</select>
					</div>				
				</td>
				<td rowspan="2"><a id="btnSearch" onClick="fn_BtnSearch();" class="btn btn-md btn-black">검색</a></td>
			</tr>	
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
				<td colspan="3">
					<div class="form-inline">
						<select id="CODE_ID" name="CODE_ID" class="form-control form-control-sm col-8" title="마스터 영역" >
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
		<caption>FAQ 리스트 테이블</caption>
		<colgroup>
			<col style="width: 5%;" />			
			<col>	
			<col style="width: 10%;" />	
			<col style="width: 10%;" />		
			<col style="width: 10%;" />		
			
			<col style="width: 7%;" />		
			<col style="width: 10%;" />		
			<col style="width: 10%;" />			
			<col style="width: 10%;" />	
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">마스터명</th>
				<th scope="col">분야</th>
				<th scope="col">분야상세</th>
				<th scope="col">마스터코드</th>
				
				<th scope="col">FAQ 등록 여부</th>
				<th scope="col">등록자</th>
				<th scope="col">최초등록일</th>
				<th scope="col">노출여부</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row" varStatus="vs">
					<tr>
						<td>${row.NUM_DESC }</td> 
						<td>${row.MASTER_NM }</td>
						<td>${row.P_CODE_NM }</td>
						<td>${row.M_CODE_NM }</td>
						<td><a href="${unit.move('view', row.CATE_IDX, 'CATE' )}">${row.CATE_CD }</a></td>
						<td>	${row.FAQ_INSERT_YN}</td>
						<td>	${row.SYS_REG_NM}</td>
						<td>	${row.SYS_REG_DTM}</td>
						<td>
							<c:choose>
								<c:when test="${row.FAQ_INSERT_YN eq 'Y' }">
									<div class="form-inline">
										<input type="checkbox" id="FAQ_USE_YN${vs.count }" onchange="updateUseYn(${row.CATE_IDX }, this.checked, 'updateMngUseYn');" name="FAQ_USE_YN" class="input_on-off" <c:if test="${row.FAQ_USE_YN eq 'Y' }">checked</c:if> >
										 <label for="FAQ_USE_YN${vs.count }" class="label_on-off" style="margin: auto;"> 
										   <span class="marble"></span>
										   <span class="on">공개</span>
										   <span class="off">비공개</span>
										 </label>
									 </div>
								</c:when>							
								<c:otherwise>
									미등록
								</c:otherwise>
							</c:choose>
						</td>
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
	fn_SelectOption("", "CAT", "PARENT_CODE_ID");
	$('#PARENT_CODE_ID').val('${out.params.parentCodeId }');
	
	$('#FAQ_YN').val('${out.params.faqYn }');
	$('#FAQ_USE_YN').val('${out.params.faqUseYn }');
	
	if ('${out.params.parentCodeId }' != '') {
		fn_SelectOption('${out.params.parentCodeId }', "CAT", "CODE_ID");
		$('#CODE_ID').val('${out.params.codeId }');
	}
	
});

$("[name=PARENT_CODE_ID]").on('change',function(k){
	fn_SelectOption($(this).val(), "CAT", "CODE_ID");
});
//////////////////////////////////////////////////////////
//3. 사용자 함수
//////////////////////////////////////////////////////////
	
</script>



