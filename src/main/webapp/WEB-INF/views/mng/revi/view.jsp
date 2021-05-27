<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDateValue"><fmt:formatDate value="${now}" pattern="yyyyMM" /></c:set>
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'index', 'ajax')}" />


<!--  INFO |---------|--------|---------|--------|--------|----------------|--------------|----------|-------------------|----------|--------------|--------|------------|---------|------------|  -->
<!--  INFO |REVI_IDX |BUY_IDX |CATE_IDX |CODE_ID |CODE_ID |BUY_NM          |BUY_PRDT_CD   |PRDT_TYPE |REVI_CNTN          |REVI_SCOR |PRDT_SCOR_AVG |USER_NM |SYS_REG_DTM |REPO_IDX |REVI_USE_YN |  -->
<!--  INFO |---------|--------|---------|--------|--------|----------------|--------------|----------|-------------------|----------|--------------|--------|------------|---------|------------|  -->
<!--  INFO |3        |6       |8        |CAT08   |CAT0803 |마스터1 / 교육 / 예체능 |202011LNA0027 |라이브클래스    |굳이 다시 듣고싶진 않지만,... |3.5       |3.5           |회원2     |2020-11-30  |준비중      |Y           |  -->
<!--  INFO |---------|--------|---------|--------|--------|----------------|--------------|----------|-------------------|----------|--------------|--------|------------|---------|------------|  -->
 
 
<style>
.ui-timepicker-container.ui-timepicker-standard{z-index: 2002!important;}
</style> 
<!-- 쓰기  시작-->	
<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<colgroup>
			<col style="width: 10%;"/>
			<col />
			<col style="width: 10%;"/>
			<col style="width: 23%;"/>
			<col style="width: 10%;"/>
			<col style="width: 23%;"/>
		</colgroup>
		<tbody>
			<input type="hidden" name="REVI_IDX" class="form-control form-control-sm col-8"/>
			<tr>
				<th scope="row">작성일</th>
				<td id="SYS_REG_DTM" style="text-align:left;">
				</td>
				<th scope="row">작성자 ID</th>
				<td id="USER_EMAIL" style="text-align:left;">
				</td>
			</tr>	
			<tr>
				<th scope="row">작성자 닉네임</th>
				<td id="USER_NM" style="text-align:left;" colspan="5">
				</td>
			</tr>	
			<tr>
				<th scope="row">마스터명</th>
				<td id="MASTER_NM" style="text-align:left;">
				</td>
				<th scope="row">마스터 ID</th>
				<td id="MASTER_EMAIL" style="text-align:left;" colspan="3">
				</td>
			</tr>	
			<tr>
				<th scope="row">분야</th>
				<td id="P_CODE_NM" style="text-align:left;">
				</td>
				<th scope="row">분야상세</th>
				<td id="M_CODE_NM" style="text-align:left;">
				</td>
				<th scope="row">구분</th>
				<td id="PRDT_TYPE" style="text-align:left;">
				</td>
			</tr>	
			<tr>
				<th scope="row">상품명</th>
				<td id="PRDT_NM" style="text-align:left;">
				</td>
				<th scope="row">평점</th>
				<td id="REVI_SCOR" style="text-align:left;" colspan="3">
				</td>
			</tr>	
			<tr>
				<th scope="row">내용</th>
				<td id="REVI_CNTN" style="text-align:left;" colspan="5">
				</td>
			</tr>	
<!-- 			<tr> -->
<!-- 				<th>첨부파일</th> -->
<!-- 				<td > -->
<!-- 					<input type="hidden" id="REVI_UUID" name="REVI_UUID" /> -->
<!-- 					<div class="fileArea"> -->
<!-- 						<label for="REVI_UUID_FILE"></label>							 -->
<!-- 						<div class="fileList" id="REVI_UUID_FILEList"></div> -->
<!-- 						<div id="REVI_UUID_FILEListClone" style="display:none;"> -->
<!-- 						<div><span class="fileName"></span> (<span class="fileSize"></span> MB)</div> -->
<!-- 						</div>											 -->
<!-- 					</div> -->
<!-- 				</td> -->
<!-- 			</tr> -->
			<tr>
				<th scope="row">신고내역</th>
				<td colspan="5">
					<div class="dialog_content" >
						<div class="scroll_area">
							<div class="tbl_list" >
								<table class="list_tbl01">
									<colgroup>
										<col style="width: 10%;" />
										<col style="width: 10%;" />
										<col style="width: 15%;" />
										<col />
										<col style="width: 10%;" />
										
									</colgroup>
									<thead>
										<tr>
											<th scope="col">회원명</th>
											<th scope="col">닉네임</th>
											<th scope="col">이메일</th>
											<th scope="col">신고사유</th>
											<th scope="col">신고일</th>
										</tr>
									</thead>
									<tbody id="repoList">
									</tbody>
								</table>
							</div>
							<!--// End 팝업 컨텐츠 -->
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">공개여부</th>
				<td style="text-align:left;" colspan="5">
					<input type="checkbox" id="REVI_PUBL_YN" name="REVI_PUBL_YN" onchange="showON_PUBLICK( this.checked ); updateUseYn( '${out.params.reviIdx }', this.checked, 'updateMngPublickUseYn');" class="input_on-off" >
					<label for="REVI_PUBL_YN" class="label_on-off useYn" style="margin: auto;">
						<span class="marble"></span>
						<span class="on">공개</span>
						<span class="off">비공개</span>
					</label>
				</td>
			</tr>
			<tr id="ON_PUBLICK">
				<th scope="row">비공개 사유</th>
				<td colspan="5"> 
					<textArea id="REVI_REPO_CNTN" name="REVI_REPO_CNTN" placeholder="사유 작성 시, 비공개로 처리됩니다."></textArea>
				</td>
			</tr>
			<tr>
				<th scope="row">노출여부</th>
				<td style="text-align:left;">
					<input type="checkbox" id="REVI_USE_YN" name="REVI_USE_YN" onchange="updateUseYn( '${out.params.reviIdx }', this.checked, 'updateMngUseYn');" class="input_on-off" >
					<label for="REVI_USE_YN" class="label_on-off useYn" style="margin: auto;">
						<span class="marble"></span>
						<span class="on">노출</span>
						<span class="off">비노출</span>
					</label>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="btn_wrap">
	<a href='${unit.move("index", "" )}' class="btn  btn-md btn-outline-dark">목록</a>
	<a class="btn btn-md btn_key_color" onclick="fn_BtnRegist();" >저장</a>
</div>


<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<script type="text/javascript">
var basicCntn = '';

$(function(){
	var params = new Object();
	params.reviIdx = '${out.params.reviIdx }';
	
	params.status = "DETAIL";
	params.query = "selectMngReviDetail";
	var detailData = fn_DataDetail( params );
	basicCntn = $('#REVI_REPO_CNTN').val()+'';
	
	params.status = "LIST";
	params.query = "selectMngRepoList";
	fn_DataList( params, 'repoList' );
	
	$('#PRDT_NM').text(detailData[0].INFO_PRDT_TITL1 + detailData[0].INFO_PRDT_TITL2);
	
});

function fn_DataList( PARAMS, OBJECT_ID, CNT ) {
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result.out.detail.data;
	var inTag = '';

//	 INFO |---------|-----------------------|----------|---------|--------| 
//	 INFO |QUES_IDX |QUES_CNTN              |DATA_CNTN |NUM_DESC |NUM_ASC | 
//	 INFO |---------|-----------------------|----------|---------|--------| 
//	 INFO |6        |1. Are you sure &#63;  |확신합니다     |2        |1       | 
//	 INFO |5        |1. 온 몸이 부숴질거 같나요 &#63; |글세요       |1        |2       | 
//	 INFO |---------|-----------------------|----------|---------|--------| 
	 
	 if( jsonData != null ) {
		$('#'+OBJECT_ID+'').empty();
		 
		$.each(jsonData, function(key, val) {
			inTag += '<tr>';
			inTag += '<td>'+ val.USER_NM + '</td>';
			inTag += '<td>'+ val.USER_NICK + '</td>';
			inTag += '<td>'+ val.USER_EMAIL + '</td>';
			inTag += '<td style="text-align: left;" >'+ val.REPO_CNTN + '</td>';
			inTag += '<td>'+ val.SYS_REG_DTM + '</td>';
			inTag += '</tr>';
		});
		
		$('#'+OBJECT_ID+'').append( inTag );
	 }
}

function fn_BtnRegist(){
	
	if ( !$('#REVI_PUBL_YN').is(':checked') ) {
		if ( $('#REVI_REPO_CNTN').val().length == 0 ) {
			return alert('비공개처리시 사유입력은 필수입니다.');
		}
	}
	
	var params = unit_getParams("searchArea");
	if( basicCntn != '') params.status = "EDIT";
	else if( $('#REVI_PUBL_YN').is(':checked') ) params.status = "EDIT"; 
	else params.status = "EDIT_MAIL"; 
	params.query = "updateMngReviData";
	params.reviIdx = '${out.params.reviIdx }';
	params.email = $('#MASTER_EMAIL').text();
	params.REVI_REPO_CNTN = $('#REVI_REPO_CNTN').val();
	params.MAST_INFO = $('#MASTER_NM').text()
						+ " 마스터와 "
						+ $('#PRDT_TYPE').text()
						+ ", #"
						+ $('#P_CODE_NM').text()
						+ " #"
						+ $('#M_CODE_NM').text();
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	
	var result = fn_DataAjax( params, 'N' );
	location.href='${unit.move("index", "" )}';
}

function showON_PUBLICK( checked ){
	if ( checked ) {
		$('#ON_PUBLICK').hide();
	}else{
		$('#ON_PUBLICK').show();
	}
}

</script>

