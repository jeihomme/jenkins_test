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
			<col width="15%"/>					
			<col />					
			<col width="5%"/>					
		</colgroup>
		<tbody>	
			<tr>
				<th scope="row">구분</th>
				<td>
					<div class="form-inline">
						<select id="FAQ_CD" name="FAQ_CD" class="form-control form-control-sm col-8" title="노출 영역" >
							<option value="">-- 구분 --</option>
						</select>
					</div>				
				</td>
				<td rowspan="2"><a id="btnSearch" onClick="fn_BtnSearch();" class="btn btn-md btn-black">검색</a></td>
			</tr>	
			<tr>
				<th scope="row">제목/내용</th>
				<td><input type="text" name="FAQ_TITLE" class="form-control form-control-sm col-8"  placeholder="검색어를 입력하세요" value="${out.params.faqTitle }"  onkeypress="if(event.keyCode==13){fn_BtnSearch();}"/></td>
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
		<caption>FAQ 리스트 테이블</caption>
		<colgroup>
			<col style="width: 10%;" />	
			<col style="width: 20%;" />				
			<col>
			<col style="width: 10%;" />
			<col style="width: 15%;" />			
			<col style="width: 15%;" />			
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">구분</th>
				<th scope="col">제목</th>
				<th scope="col">등록자</th>
				<th scope="col">등록일</th>
				<th scope="col">노출여부</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row" varStatus="vs">
					<tr>
						<td>${row.NUM_DESC_ORDER }</td>
						<td>${row.FAQ_CDNM }</td>
						<td><a href="${unit.move('edit', row.FAQ_IDX, 'faq' )}">${row.FAQ_TITL }</a></td>
						<td>${row.SYS_REG_NM}</td>
						<td>${row.SYS_REG_DTM}</td>
						<td>
							<div class="form-inline">
								<input type="checkbox" id="FAQ_USE_YN${vs.count }" onchange="updateUseYn(${row.FAQ_IDX }, this.checked, 'updateMngUseYn');" name="FAQ_USE_YN" class="input_on-off" <c:if test="${row.FAQ_USE_YN eq 'Y' }">checked</c:if> >
								 <label for="FAQ_USE_YN${vs.count }" class="label_on-off" style="margin: auto;"> 
								   <span class="marble"></span>
								   <span class="on">공개</span>
								   <span class="off">비공개</span>
								 </label>
							 </div>
						</td>
					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="7">등록된 내용이 없습니다.</td>
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
// 	fn_SelectOption("CAT01","CAT","testSelect");
	fn_SelectOption( '', 'FAQ', 'FAQ_CD' );
	$('#FAQ_CD').val('${out.params.faqCd}');
});

// function excelDownload(){
// 	var params = new unit_getParams("searchArea");
// 	params.status = 'excelList';
// 	params.query = 'selectMngFaqList';
// 	params.rowSize = $('#selectListCnt').val();
	
// 	${unit.setValue("/mng/faq/excel", 'params' )};
// }
//////////////////////////////////////////////////////////
//3. 사용자 함수
//////////////////////////////////////////////////////////
	
</script>



