<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'index', 'ajax')}" />

<div class="gnb_box">
                <ul class="gnb_list">
                    <li onclick="location.href='${unit.move('view', out.params.userIdx, 'user' ) }'">
                        <a href="${unit.move('view', out.params.userIdx, 'user' ) }">
                            기본
                        </a>
                    </li>
                    <li class="active" onclick="location.href='${unit.move('tab', out.params.userIdx, 'user', 'network' ) }'">
                        <a href="${unit.move('tab', out.params.userIdx, 'user', 'network' ) }">
                            인맥
                        </a>
                    </li>
                    <li onclick="location.href='${unit.move('tab', out.params.userIdx, 'user', 'lect' ) }'">
                        <a href="${unit.move('tab', out.params.userIdx, 'user', 'lect' ) }">
                            수강
                        </a>
                    </li>
                    <li onclick="location.href='${unit.move('tab', out.params.userIdx, 'user', 'cons' ) }'">
                        <a href="${unit.move('tab', out.params.userIdx, 'user', 'cons' ) }">
                            상담
                        </a>
                    </li>
                </ul>
</div>
	

<div class="form-inline" style="display:flex; justify-content:space-between; padding-bottom:10px; margin-top: 30px;">	
	<span class="listCount" style="display:inline-block;">전체 <span style="color:#ff8939;">${out.list.paging.totalCnt }</span></span>		
	<div id="sub-form-inline">
		<select id="listCnt" class="designSelectBox form-control form-control-sm mr10" title="셀렉트박스" onchange="fn_BtnChnageListCnt();">
			<option value="10" selected="">10</option>
			<option value="50">50</option>
			<option value="100">100</option>
			<option value="300">300</option>
		</select>
	</div>		
</div>

<!-- 조회  시작-->				
<div class="tbl_list">
	<table class="list_tbl01" summary="" id="searchArea">
		<input id="USER_IDX" type="hidden" />
		<caption>회원정보 관리 테이블</caption>
		<colgroup>
			<col style="width: 5%;" />
			<col  />
			<col style="width: 15%;" />
			<col style="width: 15%;" />
			<col  style="width: 10%;"/>
			
			<col  style="width: 10%;"/>
			<col  style="width: 10%;"/>
			<col  style="width: 10%;"/>
			<col  style="width: 10%;"/>
		</colgroup>
		<thead>
				<th scope="col">번호</th>
				<th scope="col">마스터명</th>
				<th scope="col">분야</th>
				<th scope="col">분야상세</th>
				<th scope="col">첫 상담일</th>
				
				<th scope="col">최근상담일</th>
				<th scope="col">수강 VOD 수</th>
				<th scope="col">진행된 상담</th>
				<th scope="col">팔로우 내역</th>
		</thead>
		<tbody id="dataList">
		</tbody>
	</table>
</div>
	
<div class="pagination justify-content-center paging">
	<ul style="justify-content:space-between;" id="pagingVar">
	
	</ul>
</div>


<div class="btn_wrap">
	<a href="${ unit.move('index', '') }" class="btn btn-md btn-outline-dark">목록</a>
</div>

<div id="popupDiv" class="alert_wrap">
	<div class="alert_layer">
		<div class="alert_inner">
			<div class="alert_header">
				<button class="btn btn_close_pop" style="display: block; top: 5px; right: 5px; border: none;" data-action="popup_hide"></button>
			</div>				
			<div class="dialog_content" >
				<div class="scroll_area">
					<h3 id="vodTotal"></h3>
					<div class="tbl_list" style="height: 350px;    overflow-y: scroll;">
						<table class="list_tbl01">
							<colgroup>
								<col style="width: 7%;" />
								<col style="width: 15%;" />
<%-- 								<col style="width: 15%;" /> --%>
<%-- 								<col style="width: 15%;" /> --%>
								<col />
								<col style="width: 15%;" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">이름</th>
<!-- 									<th scope="col">분야</th> -->
<!-- 									<th scope="col">분야상세</th> -->
									<th scope="col">계정</th>
									<th scope="col">팔로우 등록일</th>
								</tr>
							</thead>
							<tbody id="popupList">
							</tbody> 
						</table>
					</div>
						
					<div class="pagination justify-content-center paging">
						<ul style="justify-content:space-between;" id="popupPagingVar">
						</ul>
					</div>

					<div class="btn_wrap" style="text-align: right;">
						<a class="btn  btn-md btn-outline-dark" data-action="popup_hide">닫기</a>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 조회 끝 -->	
<script>

var chk = 0;
$(function(){
	fn_BtnChnageListCnt();
	chk = 1;
});

function fn_BtnChnageListCnt( pageNo ){
	var params = new Object();
	params.status = "PAGE";
	params.query = "selectMngMemberNetworkList";
	params.userIdx = '${out.params.userIdx }';
	params.listCnt = $('#listCnt').val();
	params.thisPage = pageNo;
	if (params.thisPage == 0 || params.thisPage == null || params.thisPage == "" || params.thisPage == undefined) {
		params.thisPage = 1;
	}
// 	if (tab == 'sreach' ||typeof tab == 'undefined') {
// 		params.masterTab = masterTab;
// 	}else{
// 		params.masterTab = tab;
// 		masterTab = tab;
// 	}
	fn_DataList( params, "dataList", 7 );
}

function fn_DataList( PARAMS, OBJECT_ID, CNT ) {
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result.out.detail.data;
	var inTag = '';

	if( jsonData.length > 0 ) {
		$('#'+OBJECT_ID+'').empty();
		 
		$.each(jsonData, function(key, val) {
			inTag += '<tr>';
			inTag += '<td>'+ val.NUM_DESC_ORDER + '</td>';
			inTag += '<td>'+ val.MASTER_NM + '</td>';
			inTag += '<td>'+ val.CODE_PARENT_NM + '</td>';
			inTag += '<td>'+ val.CODE_NM + '</td>';
			inTag += '<td>'+ val.USER_MAST_JOIN_DTM + '</td>';
			inTag += '<td>'+ val.USER_CONS_DTM + '</td>';
			inTag += '<td>'+ val.PRDT_LECT_CNT + '</td>';
			inTag += '<td>'+ val.PRDT_CONS_CNT + '</td>';
			inTag += '<td><a class="btn btn-md" onclick="fn_BtnDatePopup( \'\', '+val.CATE_IDX+' );">팔로우내역</a></td>';
			inTag += '</tr>';
		});
		
	 } else {
			inTag += '<tr>';
			inTag += '<td colspan="99">등록된 내용이 없습니다.</td>';
			inTag += '</tr>';
	 }
		$('#'+OBJECT_ID+'').append( inTag );
		
		var varHtml = "";	
		varHtml += '		<li><a id="pagingFirst" onclick="fn_BtnChnageListCnt('+ result.out.detail.paging.prevStep +');"  aria-label="Previous"><i class="fa fa-angle-left"></i></a></li>   ';
		for (var i = result.out.detail.paging.startPage; i <= result.out.detail.paging.endPage; i++) {
			if (result.out.detail.paging.thisPage == i) varHtml += '<li><a id="pagingActive" onclick="fn_BtnChnageListCnt('+ i +');" class="active" style="cursor:pointer;">'+ i +'</a></li>   ';
			else varHtml += '<li><a name="pagingPassiive" onclick="fn_BtnChnageListCnt('+ i +');" style="cursor:pointer;">'+ i +'</a></li>   ';
		}
		varHtml += '		<li><a id="pagingLast" onclick="fn_BtnChnageListCnt('+ result.out.detail.paging.nextStep +');"  aria-label="Next"><i class="fa fa-angle-right"></i></a></li>   ';
		
		$('#pagingVar').empty();
		$('#pagingVar').append( varHtml );
		$('.listCount').html('전체 <span class="ppm_key_color">' + result.out.totalCnt + '</span>' );
		
// 		if( chk == 1 ) alert('페이지 개수 변환에 성공하였습니다.');
		
}



function fn_BtnDatePopup( PAGE_NO, CATE_IDX ) {
	
	var params = new Object();
	params.status = "PAGE";
	params.query = "selectMngMemberNetworkFollList";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.CATE_IDX = CATE_IDX;
	params.listCnt = $('#listCnt').val();
	params.thisPage = PAGE_NO;
	
	if (params.thisPage == 0 || params.thisPage == null || params.thisPage == "" || params.thisPage == undefined) {
		params.thisPage = 1;
	}

	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var jsonData = result.out.detail.data;
	var inTag = '';

	$('#popupList').empty();
	
	 if( jsonData.length ) {
		$.each(jsonData, function(key, val) {
			inTag += '<tr>';
			inTag += '<td>'+ val.NUM_DESC_ORDER + '</td>';
			inTag += '<td>'+ val.USER_NM + '</td>';
// 			inTag += '<td>'+ val.P_CODE_NM + '</td>';
// 			inTag += '<td>'+ val.M_CODE_NM + '</td>';
			inTag += '<td>'+ val.USER_EMAIL + '</td>';
			inTag += '<td>'+ val.SYS_REG_DTM + '</td>';
			inTag += '</tr>';
		});
	 } else {
		inTag += '<tr><td colspan="6">등록된 데이터가 없습니다.</td></tr>';
	 }

	$('#popupList').append( inTag );
		
	var varHtml = "";	
	varHtml += '		<li><a id="pagingFirst" onclick="fn_BtnDatePopup('+ result.out.detail.paging.prevStep +');"  aria-label="Previous"><i class="fa fa-angle-left"></i></a></li>   ';
	for (var i = result.out.detail.paging.startPage; i <= result.out.detail.paging.endPage; i++) {
		if (result.out.detail.paging.thisPage == i) varHtml += '<li><a id="pagingActive" onclick="fn_BtnDatePopup('+ i +');" class="active" style="cursor:pointer;">'+ i +'</a></li>   ';
		else varHtml += '<li><a name="pagingPassiive" onclick="fn_BtnDatePopup('+ i +');" style="cursor:pointer;">'+ i +'</a></li>   ';
	}
	varHtml += '		<li><a id="pagingLast" onclick="fn_BtnDatePopup('+ result.out.detail.paging.nextStep +');"  aria-label="Next"><i class="fa fa-angle-right"></i></a></li>   ';
	
	$('#popupPagingVar').empty();
	$('#popupPagingVar').append( varHtml );
		
	alertShow('70%','','popupDiv');
		
}



</script>