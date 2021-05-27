<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'index', 'ajax')}" />

<style>

/* 스크롤 바 넓이 16px */
::-webkit-scrollbar{width: 6px; border-radius:40px; }
/* 스크롤 바 기본 색상 */
::-webkit-scrollbar-track {background-color:#fff;}
/* 스크롤 구간 배경 색상 */
::-webkit-scrollbar-thumb {background-color:#999 ; border-radius:40px;} 
/* 스크롤 바 위에 마우스 올렸을 때(hover) 색상 */
::-webkit-scrollbar-thumb:hover {background-color:#999;} 
/* 스크롤 상하단 버튼 넓이와 색상 */
/* ::-WEBKIT-SCROLLBAR-BUTTON:START:DECREMENT, ::-WEBKIT-SCROLLBAR-BUTTON:END:INCREMENT { */
/* WIDTH:16PX; HEIGHT:16PX; BACKGROUND-COLOR: MEDIUMPURPLE; */

#btnSearch:hover{	color: white!important;}
.alert_layer{width: 1200px !important;margin-left: -600px !important;height: 600px !important;margin-top: -400px !important;}
.datepicker{z-index:1 !important;}
</style>
<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>관리자 리스트 조회</caption>
		<colgroup>
			<col style="width: 10%;" />
			<col style="width: 37.5%;" />	
			<col style="width: 10%;" />
			<col />	
			<col style="width: 5%;" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">분야</th>
				<td style="text-align:center;" >
					<select id="PARENT_CODE_ID" name="PARENT_CODE_ID" class="form-control form-control-sm col-8" title="분야" >
						<option value="">선택해주세요.</option>
					</select>
				</td>
				<th scope="row">분야상세</th>
				<td style="text-align:center;" >
					<select id="CODE_ID" name="CODE_ID" class="form-control form-control-sm col-8">
						<option value="">분야를 선택해주세요.</option>
					</select>
				</td>
				<td style="text-align:center;" rowspan="4"><a id="btnSearch" onClick="fn_BtnSearch();" class="btn btn-md btn-black">검색</a></td>
			</tr>	
		</tbody>
	</table>
</div>

	
<!-- 리스트  시작-->
	<div class="form-inline" style="display:flex; justify-content:space-between; padding-bottom:10px; margin-top: 30px;">	
		<span class="listCount" style="display:inline-block;">전체 <span class="ppm_key_color">${out.list.paging.totalCnt }</span></span>		
		<div id="sub-form-inline">
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
			<col />
			<col style="width: 20%;" />
			<col style="width: 30%;" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">강좌명</th>
				<th scope="col">플레이어</th>
				<th scope="col">수강일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row">
					<tr>
						<td>${row.NUM_DESC_ORDER }</td>
						<td><a href="${unit.move('tab', row.LECT_IDX, 'lect', 'view' ) }">${row.LECT_NM }</a></td>
						<td><a href="/mng/yoyo/sample">${row.LECT_PLAY }</a></td>
						<td>${row.LECT_DTM }</td>
					
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


<div id="vodList" class="alert_wrap">
	<div class="alert_layer">
		<div class="alert_inner">
			<div class="alert_header">
				<button class="btn btn_close_pop" style="display: block; top: 5px; right: 5px; border: none;" data-action="popup_hide"></button>
			</div>				
			<div class="dialog_content" >
				<div class="scroll_area">
					<h3 id="vodTotal"></h3>
					<div class="tbl_list" style="height: 450px;    overflow-y: scroll;">
						<table class="list_tbl01">
							<colgroup>
								<col />
								<col />
								<col />
								<col />
								<col style="width: 10%;" />
								
							</colgroup>
							<thead>
								<tr>
									<th scope="col">마스터</th>
									<th scope="col">강좌</th>
									<th scope="col">강의</th>
									<th scope="col">영상</th>
									<th scope="col">상품코드</th>
								</tr>
							</thead>
							<tbody id="vodListTbody">
							</tbody>
						</table>
					</div>

					<div class="btn_wrap" style="text-align: right;">
						<a class="btn  btn-md btn-outline-dark" onclick="fn_BtnRegistQues();" data-action="popup_hide">닫기</a>
					</div>
					<!--// End 팝업 컨텐츠 -->
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
});

//////////////////////////////////////////////////////////
//3. 사용자 함수
//////////////////////////////////////////////////////////
	



</script>



