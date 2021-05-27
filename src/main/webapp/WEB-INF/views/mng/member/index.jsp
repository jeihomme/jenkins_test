<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 

<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>관리자 리스트 조회</caption>
		<colgroup>
			<col style="width: 10%;" />
			<col />	
			<col style="width: 10%;" />
			<col />	
			<col style="width: 5%;" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">회원명 또는 계정</th>
				<td><input type="text" name="userNm" class="form-control form-control-sm col-8"  placeholder="검색어를 입력하세요" value="${out.params.userNm }"  onkeypress="if(event.keyCode==13){fn_BtnSearch();}"/></td>
				<th scope="row">가입일</th>
				<td style="text-align:center;">
					<input id="sysRegDtmStr" name="sysRegDtmStr" readonly="readonly" onChange="inputDateComparison(this, 'sysRegDtmStr', 'sysRegDtmEnd' );" type="text" class="form-control form-control-sm datepicker"   value="<c:if test="${out.params.sysRegDtmStr ne null}">${out.params.sysRegDtmStr}</c:if>"  autocomplete= "new-password" autocomplete__wrapper autocomplete style="width:45%;float:left;"/>
					<span style="padding: 8px;display: inline-block; float:left;">~</span>
					<input id="sysRegDtmEnd" name="sysRegDtmEnd" readonly="readonly" onChange="inputDateComparison(this, 'sysRegDtmStr', 'sysRegDtmEnd' );" type="text" class="form-control form-control-sm datepicker"  value="<c:if test="${out.params.sysRegDtmEnd ne null}">${out.params.sysRegDtmEnd}</c:if>"  autocomplete= "new-password" autocomplete__wrapper autocomplete  style="width:45%;float:left;" /> 
				</td>
				<td><a id="btnSearch" onClick="fn_BtnSearch();" class="btn btn-md btn-black">검색</a></td>
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
		<caption>관리자 리스트 테이블</caption>
		<colgroup>
			<col style="width: 5%;" />	
			<col style="width: 10%;" />				
			<col>
			<col style="width: 10%;" />			
			<col style="width: 7%;" />			
			<col style="width: 5%;" />			
			
			<col style="width: 5%;" />			
			<col style="width: 7%;" />			
			<col style="width: 7%;" />		
			<col style="width: 3%;" />		
			<col style="width: 3%;" />		
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">회원명</th>
				<th scope="col">계정</th>
				<th scope="col">전화번호</th>
				<th scope="col">가입일</th>
				<th scope="col">가입수단</th>
				
				<th scope="col">구분</th>
				<th scope="col">메일수신동의</th>
				<th scope="col">문자수신동의</th>
				<th scope="col">상태</th>
				<th scope="col">관리</th>
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
						<td>${ row.USER_PHONE } </td>
						<td>${row.SYS_REG_DTM }</td>
						<td>${row.USER_SNS_TYPE_NM }</td>
						
						<td>${row.USER_TYPE_NM }</td>
						<td>${row.USER_MAIL_YN }</td>
						
						<td>${row.USER_SMS_YN }</td>
						<td>${row.USER_STATE }</td>
						<td><c:if test="${row.USER_STATE eq '활동'}"><a onclick="fn_BtnDetelePopup(${row.USER_IDX });" style="color:red;">탈퇴</a></c:if></td>
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

<!-- 데이타 삭제 -->
<div id="alert_del" class="alert_wrap">
	<div class="alert_layer">
		<div class="alert_inner">
			<div class="alert_header" style="padding: 4px; border-bottom: 1px solid #d2d2d2;">
				<span>피플메이드</span>
				<button class="btn btn_close_pop" data-action="popup_hide">X</button>
			</div>				
			<div class="dialog_content">
				<div class="scroll_area">
					<!-- Start 팝업 컨텐츠 -->

					<div class="alert_msg_area">
						<div class="alert_msg" style="text-align: left;">
							탈퇴를 진행하시겠습니까?<br>
							회원 정보는 1년 후 완전 삭제되며 해당 기간 동안<br>
							동일 아이디로 재 가입이 불가 합니다.
						</div>
					</div>

					<div class="btn_wrap">
						<button type="button" onclick="fn_BtnDelete();" class="btn btn-md btn_key_color" data-action="popup_hide">확인</button>					
						<button type="button" class="btn  btn-md btn-danger" data-action="popup_hide">취소</button>
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
// 	fn_SelectOption("CAT01","CAT","testSelect");
});
var delNum = 0;
//////////////////////////////////////////////////////////
//3. 사용자 함수
//////////////////////////////////////////////////////////
function fn_BtnDetelePopup( n ) {
	alertShow('400','','alert_del');
	delNum = n;
}


function fn_BtnDelete(){

// 	if( confirm('해당 게시글을 삭제하시겠습니까?') ) {
		var params = unit_getParams("searchArea");
		params.status = "DELETE";
		params.query = "deleteMngMemberData";
		params.userIdx = delNum;
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		var result = fn_DataAjax( params );
		
		alert('삭제가 완료되었습니다.');
		
		location.href='${unit.move("index", "" )}';
// 	}
}

</script>



