<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
	
<!-- 조회  시작-->				
<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>FAQ 관리 테이블</caption>
		<colgroup>
			<col style="width: 15%;"/>
			<col/>
			<col style="width: 15%;"/>
			<col style="width: 7%;"/>
		</colgroup>
		<tbody>	
			<tr>
				<th scope="row">등록일</th>
				<td id="SYS_REG_DTM">
				</td>
			</tr>
			<tr>
				<th scope="row">등록자</th>
				<td id="SYS_REG_NM">
				</td>
			</tr>
			<tr>
				<th scope="row">구분</th>
				<td id="FAQ_CDNM">
				</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td id="FAQ_TITL">
				</td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td id="FAQ_CNTN">
				</td>
			</tr>	
			<tr>
				<th scope="row">노출여부</th>
				<td id="FAQ_USE_YN">
				</td>
			</tr>		
		</tbody>
	</table>
</div>

<div class="btn_wrap">
	<a href="${unit.move('index','')}" class="btn  btn-md btn-outline-dark">목록</a>
	<a href="${unit.move('edit', out.params.faqIdx, 'faq' )}" class="btn btn-md btn_key_color">수정</a>
</div>

<!-- 조회 끝 -->	


<script>


$(function(){
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectMngFaqDetail";
	params.faqIdx = '${out.params.faqIdx }';
	fn_DataDetail( params );
});

</script>


