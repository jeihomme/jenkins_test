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
			<col style="width: 25%;" />
			<col style="width: 20%;" />
			<col style="width: 45%;" />
			<col style="width: 5%;" />
			<col />					
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">업로드 상태</th>
				<td>
					<select id="vodSelectStat" name="vodSelectStat" class="form-control form-control-sm col-8">
					</select>
				</td>
				<th scope="row">강의코드/강의명/마스터명</th>
				<td><input type="text" id="VOD_TITL" placeholder="검색어를 입력하세요" name="VOD_TITL" value="${out.params.vodTitl }"  class="form-control form-control-sm col-8" onkeypress="if(event.keyCode==13){fn_BtnSearch();}" ></td>
				<td><a id="btnSearch" onClick="fn_BtnSearch();" class="btn btn-md btn-black">검색</a></td>
			</tr>
<!-- 			<tr> -->
<!-- 				<th scope="row">강의명</th> -->
<!-- 				<td> -->
<!-- 					<select id="vodSelectNm" name="vodSelectNm" class="form-control form-control-sm col-8" > -->
<!-- 						<option value="">제목</option> -->
<!-- 					</select> -->
<!-- 				</td> -->
<!-- 			</tr>	 -->		
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
		<caption>관리자 리스트 테이블</caption>
		<colgroup>
			<col style="width: 5%;" />	
			<col style="width: 10%" />
			<col style="width: 10%;" />	
			<col style="width: 10%;" />	
			<col style="width: 10%;" />				
			<col  />			
			<col style="width: 5%;" />		
			
			<col style="width: 7%;" />			
			<col style="width: 7%;" />		
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">마스터명</th>
				<th scope="col">분야</th>
				<th scope="col">분야상세</th>
				<th scope="col">강의코드</th>
				
				<th scope="col">강의명</th>
				<th scope="col">영상 수</th>
				<th scope="col">등록일</th>
				<th scope="col">업로드 상태</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row">
					<tr>
						<td>${row.NUM_DESC_ORDER }</td>
						<td>${ row.MASTER_NM } </td>
						<td>${ row.P_CODE_NM } </td>
						<td>${ row.M_CODE_NM } </td>
						<td><a href="${ unit.move('edit', row.VOD_IDX, 'vod') }">${ row.VOD_CD } </a></td>
						<td><a href="${ unit.move('edit', row.VOD_IDX, 'vod') }">${ row.VOD_NM } </a></td>
						<td>${row.VOD_CNT_REAL}</td>
						<td>${row.SYS_REG_DTM }</td>
						<td>${row.VOD_PROG }</td>
<%-- 						<td>${row.VOD_STAT }</td> --%>
					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="11">등록된 내용이 없습니다.</td>
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
fn_SelectOptionNotCode( 'selectVodNameList', 'vodSelectNm');

fn_SelectOption("","VOD","vodSelectStat");
$('#vodSelectStat').val('${out.params.vodSelectStat}');

$('[name=vodSelectNm] option').each(function(k){
	if ( $(this).val() == '${out.params.vodSelectNm}' ) {
		$(this).attr('selected','selected');
	} 
});

var params = new Object();

	params.status = "DELETE";
	params.query = "deleteMngVodGarbageData";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	fn_DataAjax( params );

});

//////////////////////////////////////////////////////////
//3. 사용자 함수
//////////////////////////////////////////////////////////
	
</script>



