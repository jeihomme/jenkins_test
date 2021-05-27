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
			<col style="width: 30%;" />	
			<col style="width: 15%;" />
			<col style="width: 30%;" />
			<col style="width: 5%;" />
			<col />					
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">마스터명/상품명/작성자명</th>
				<td>
					<input name="MASTER_NM" type="text" value="${out.params.masterNm}" class="form-control form-control-sm col-8" onkeypress="if(event.keyCode==13){fn_BtnSearch();}">
				</td>	
				<th scope="row">구분</th>
				<td>
					<select name="PRD_CD" class="form-control form-control-sm col-8" >
					</select>
				</td>	
				<td rowspan="2"><a id="btnSearch" onClick="fn_BtnSearch();" class="btn btn-md btn-black">검색</a></td>
			</tr>	
			<tr>
				<th scope="row">분야</th>
				<td>
					<select name="CAT_PARENT_CD" class="form-control form-control-sm col-8" >
					</select>
				</td>	
				<th scope="row">분야상세</th>
				<td>
					<select name="CAT_CD" class="form-control form-control-sm col-8" >
						<option value="">분야 선택시, 생성됩니다.</option>
					</select>
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
			<col style="width: 7%;" />		
			<col style="width: 7%;" />	
			<col style="width: 7%;" />		
			<col style="width: 7%;" />	
				
			<col style="width: 7%;" />	
			<col style="width: 15%;" />
			<col>
			<col style="width: 3%;" />		
			<col style="width: 5%;" />
					
			<col style="width: 7%;" />		
			<col style="width: 7%;" />		 
			<col style="width: 5%;" />		
				
			<col style="width: 5%;" />		
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">마스터명</th>
				<th scope="col">분야</th>
				<th scope="col">분야상세</th>
				<th scope="col">상품코드</th>
				<th scope="col">구분</th>
				<th scope="col">상품명</th>
				
				<th scope="col">후기</th>
				<th scope="col">평점</th>
				<th scope="col">평균 평점</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">신고 수</th>
				
				<th scope="col">노출 여부</th>
			</tr>
		</thead>


<!--  INFO |---------|--------|---------|----------|----------|----------------|--------------|----------|-------------------|----------|--------------|--------|------------|---------|------------|---------|--------|  -->
<!--  INFO |REVI_IDX |BUY_IDX |CATE_IDX |P_CODE_ID |M_CODE_ID |BUY_NM          |BUY_PRDT_CD   |PRDT_TYPE |REVI_CNTN          |REVI_SCOR |PRDT_SCOR_AVG |USER_NM |SYS_REG_DTM |REPO_IDX |REVI_USE_YN |NUM_DESC |NUM_ASC |  -->
<!--  INFO |---------|--------|---------|----------|----------|----------------|--------------|----------|-------------------|----------|--------------|--------|------------|---------|------------|---------|--------|  -->
<!--  INFO |3        |6       |8        |CAT08     |CAT0803   |마스터1 / 교육 / 예체능 |202011LNA0027 |라이브클래스    |굳이 다시 듣고싶진 않지만,... |3.5       |3.5           |회원2     |2020-11-30  |준비중      |Y           |3        |1       |  -->
<!--  INFO |2        |3       |8        |CAT08     |CAT0803   |마스터1 / 교육 / 예체능 |202011LNA0027 |라이브클래스    |답변이 생각한 것보다 조금 ... |4         |4.5           |회원1     |2020-11-30  |준비중      |Y           |2        |2       |  -->
<!--  INFO |1        |3       |8        |CAT08     |CAT0803   |마스터1 / 교육 / 예체능 |202011LNA0027 |라이브클래스    |저에게 딱 맞는 강의였어요 ... |5         |4.5           |회원1     |2020-11-30  |준비중      |Y           |1        |3       |  -->
<!--  INFO |---------|--------|---------|----------|----------|----------------|--------------|----------|-------------------|----------|--------------|--------|------------|---------|------------|---------|--------|  -->
 
		<tbody>
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row">
					<tr>
						<td>${row.NUM_DESC_ORDER }</td>
						<td>${row.MASTER_NM }</td>
						<td>${row.P_CODE_NM }</td>
						<td>${row.M_CODE_NM }</td>
						<td>${row.BUY_PRDT_CD }</td>
						<td>${row.PRDT_TYPE_NM }</td>
						<td class="prdtTitle">${row.INFO_PRDT_TITL1 } ${row.INFO_PRDT_TITL2 }</td>
						
						<td><a href="${ unit.move('view', row.REVI_IDX, 'revi') }">${ row.REVI_CNTN } </a></td>
						<td>${row.REVI_SCOR }</td>
						<td>${row.PRDT_SCOR_AVG }</td>
						<td>${row.USER_NICK }</td>
						<td>${row.SYS_REG_DTM }</td>
						<td>${row.REPO_IDX }</td>
						
						<td>
							<input type="checkbox" id="useYn${row.REVI_IDX }" name="useYn${row.REVI_IDX }" onchange="updateUseYn('useYn${row.REVI_IDX }', this.checked, 'updateMngUseYn');" class="input_on-off" <c:if test="${row.REVI_USE_YN eq 'Y' }">checked</c:if> >
							<label for="useYn${row.REVI_IDX }" class="label_on-off useYn" style="margin: auto;">
								<span class="marble"></span>
								<span class="on">노출</span>
								<span class="off">비노출</span>
							</label>
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
	fn_SelectOptionNotCode( 'selectMasterNameOnlyList', 'CATE_IDX');
	$('[name=CATE_IDX]').val('${out.params.cateIdx}');
	
	fn_SelectOption( '', 'PRD', 'PRD_CD' );
	$('[name=PRD_CD]').val('${out.params.prdCd}');
	
	fn_SelectOption( '', 'CAT', 'CAT_PARENT_CD' );
	$('[name=CAT_PARENT_CD]').val('${out.params.catParentCd}');
	
	if( '${out.params.catParentCd}'.length > 0 ) {
		fn_SelectOption( '${out.params.catParentCd}', '', 'CAT_CD' );
		$('[name=CAT_CD]').val('${out.params.catCd}');
	}

	$('.prdtTitle').each(function(){
		$(this).text( fn_LegnthOver( $(this).text(), 20 ) );
	});
	
});

$('[name=CAT_PARENT_CD]').change(function(){
	if( $(this).val() != '' ) {
		fn_SelectOption( $(this).val(), '', 'CAT_CD' );
		$('[name=CAT_CD]').val('');
	}
});

//////////////////////////////////////////////////////////
//3. 사용자 함수
//////////////////////////////////////////////////////////
	
</script>



