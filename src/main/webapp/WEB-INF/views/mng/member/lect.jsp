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
                    <li onclick="location.href='${unit.move('tab', out.params.userIdx, 'user', 'network' ) }'">
                        <a href="${unit.move('tab', out.params.userIdx, 'user', 'network' ) }">
                            인맥
                        </a>
                    </li>
                    <li class="active" onclick="location.href='${unit.move('tab', out.params.userIdx, 'user', 'lect' ) }'">
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
	<span class="listCount" style="display:inline-block;">전체 <span class="ppm_key_color">${out.list.paging.totalCnt }</span></span>		
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
			<col style="width: 3%;" />
			<col style="width: 7%;" />
			<col style="width: 8%;" />
			<col  />
			
			<col  style="width: 7%;"/>
			<col  style="width: 7%;"/>
			<col  style="width: 8%;"/>
			<col  style="width: 8%;"/>
			<col  style="width: 5%;"/>
			
			<col  style="width: 7%;"/>
			<col  style="width: 7%;"/>
			<col  style="width: 5%;"/>
			<col  style="width: 7%;"/>
<%-- 			<col  style="width: 7%;"/> --%>
			<col  style="width: 7%;"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">구분</th>
				<th scope="col">마스터명</th>
				<th scope="col">상품코드</th>
				
				<th scope="col">분야</th>
				<th scope="col">분야상세</th>
				<th scope="col">시작</th>
				<th scope="col">종료</th>
				<th scope="col">수강일(일)</th>
				
				<th scope="col">총 강의 수(개)</th>
				<th scope="col">진행 강의 수(개)</th>
				<th scope="col">수강률(%)</th>
				<th scope="col">진행내역</th>
<!-- 				<th scope="col">다운로드</th> -->
				<th scope="col">수강관리</th>
			</tr>
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
								<col style="width: 5%;" />
								<col style="width: 20%;" />
								<col style="width: 10%;" />
								<col style="width: 15%;" />
								<col style="width: 5%;" />
								<col style="width: 5%;" />
								<col style="width: 15%;" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">No.</th>
									<th scope="col">강의</th>
									<th scope="col">영상코드</th>
									<th scope="col">수강시작</th>
									<th scope="col">첨부파일여부</th>
									<th scope="col">다운로드횟수</th>
									<th scope="col">최근다운로드일시</th>
									
								</tr>
							</thead>
							<tbody id="vodListTbody">
							</tbody>
						</table>
					</div>

					<div class="btn_wrap" style="text-align: right;">
						<a class="btn   btn-outline-dark" data-action="popup_hide">닫기</a>
					</div>
					<!--// End 팝업 컨텐츠 -->
				</div>
			</div>
		</div>
	</div>
</div>


<div id="addPop" class="alert_wrap">
	<div class="alert_layer" style="min-width: 500px;">
		<div class="alert_inner">
			<div class="alert_header">
				<button class="btn btn_close_pop" style="display: block; top: 5px; right: 5px; border: none;" data-action="popup_hide"></button>
			</div>				
			<div class="dialog_content" >
				<div class="scroll_area">
					<h3 id="endVod">수강관리</h3>
					<div class="tbl_list" style="    overflow: scroll;">
						<table class="list_tbl01">
							<colgroup>
								<col style="width: 30%;" />
								<col />
							</colgroup>
							<tbody id="addTbody" >
								<tr>
									<th scope="col">기존기간</th>
									<td scope="row"></td>
								</tr>
								<tr>
									<th scope="col">기간연장</th>
									<td scope="row"><input type="number" value="0" name="EXTE_DATE"> 일</td>
								</tr>
								<tr>
									<th scope="col" style="border-bottom: 1px solid #d2d2d2;" >총기간</th>
									<td scope="row"></td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="btn_wrap" style="text-align: right;">
						<a class="btn   btn-outline-dark" id="vodEnd" >수강종료</a>
						<a class="btn   btn-outline-dark" id="vodAdd" >저장</a>
						<a class="btn   btn-outline-dark" data-action="popup_hide">닫기</a>
					</div>
					<!--// End 팝업 컨텐츠 -->
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
	params.query = "selectMngMemberLectList";
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
// 	INFO |---------|----------|----------|--------------|---------------------------------|---------------|--------|---------|---------|---------------|---------------|--------------------|----------|--------------|----------|---------|--------| 
// 	INFO |USER_IDX |PRDT_TYPE |MASTER_NM |PRDT_CD       |PRDT_NM                          |CODE_PARENT_NM |CODE_NM |PRDT_STR |PRDT_END |PRDT_TOTAL_DTM |PRDT_TOTAL_CNT |PRDT_TOTAL_CNT_USER |PRDT_PROG |REVI_SCOR_AVG |PRDT_REPL |NUM_DESC |NUM_ASC | 
// 	INFO |---------|----------|----------|--------------|---------------------------------|---------------|--------|---------|---------|---------------|---------------|--------------------|----------|--------------|----------|---------|--------| 
// 	INFO |4        |화상        |마스터1      |202011FNA0005 |조변과 함께하는 기적의 화상상담 당신도 기사회생 할수 있다 |법률             |변호사     |준비중      |준비중      |준비중            |준비중            |준비중                 |준비중       |0.0           |준비중       |1        |1       | 
// 	INFO |4        |채팅        |마스터1      |202011CNA0003 |1:1 테스트 1                        |법률             |변호사     |준비중      |준비중      |준비중            |준비중            |준비중                 |준비중       |0.0           |준비중       |2        |2       | 
// 	INFO |4        |라이브클래스    |마스터1      |202011LNA0027 |테스트용                             |교육             |예체능     |준비중      |준비중      |준비중            |준비중            |준비중                 |준비중       |0.0           |준비중       |3        |3       | 
// 	INFO |---------|----------|----------|--------------|---------------------------------|---------------|--------|---------|---------|---------------|---------------|--------------------|----------|--------------|----------|---------|--------| 
	 
	 if( jsonData.length > 0 ) {
		$('#'+OBJECT_ID+'').empty();
		 
		$.each(jsonData, function(key, val) {
			inTag += '<tr>';
			inTag += '<td>'+ val.NUM_DESC + '</td>';
			inTag += '<td>'+ val.PRDT_TYPE + '</td>';
			inTag += '<td>'+ val.MASTER_NM + '</td>';
			inTag += '<td>'+ val.PRDT_CD + '</td>';
// 			inTag += '<td>'+ val.PRDT_NM + '</td>';
			
			inTag += '<td>'+ val.CODE_PARENT_NM + '</td>';
			inTag += '<td>'+ val.CODE_NM + '</td>';
			inTag += '<td>'+ val.PRDT_STR + '</td>';
			inTag += '<td>'+ val.PRDT_END + '</td>';
			inTag += '<td>'+ val.PRDT_TOTAL_DTM + '</td>';

			inTag += '<td>'+ val.PRDT_TOTAL_CNT + '</td>';
			inTag += '<td>'+ val.PRDT_PROG_CNT + '</td>';
			inTag += '<td>'+ val.PRDT_PROG_AVG + '</td>';
			inTag += '<td><a class="btn " onclick="fn_BtnDatePopup(\'selectMngBuyVodList\', \'vodListTbody\', \'vodList\', '+val.PRDT_IDX+', \''+val.PRDT_TYPE+'\', '+val.BUY_IDX+', '+val.USER_IDX+', \''+val.PRDT_CD+'\');">진행내역</a></td>';
// 			inTag += '<td><a class="btn " onclick="fn_BtnDatePopup(\'selectMngVodDownLog\', \'downLogTbody\', \'downLog\', '+val.PRDT_IDX+', \''+val.PRDT_TYPE+'\', '+val.BUY_IDX+', '+val.USER_IDX+', \''+val.PRDT_CD+'\');">다운로드내역</a></td>';
// 			inTag += '<td><a class="btn " onclick="fn_BtnVodAdd( '+val.BUY_IDX+' );">기간연장</a></td>';
			if ( val.VOD_CANCLE_END_YN == 'Y' ) {
				inTag += '<td>수강종료</td>';
			}else{
				inTag += '<td><a class="btn " onclick="fn_BtnDatePopup(\'selectMngMemberLectDetail\', \'addTbody\', \'addPop\', '+val.PRDT_IDX+', \''+val.PRDT_TYPE+'\', '+val.BUY_IDX+', '+val.USER_IDX+', \''+val.PRDT_CD+'\');">수강관리</a></td>';
			}
			
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

function fn_BtnDatePopup( QUERY, TBODY, POPUP, PRDT_IDX, PRDT_TYPE, BUY_IDX, USER_IDX, PRDT_CD, TIME_DTM ) {

	var chatId = "";
	
	var params = new Object();
	params.status = "LIST";
	params.query = QUERY;
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.PRDT_IDX = PRDT_IDX;
	params.PRDT_TYPE = PRDT_TYPE;
	params.PRDT_CD = PRDT_CD;
	params.USER_IDX = USER_IDX;
	params.BUY_IDX = BUY_IDX;
	
	if( TBODY != 'addTbody') {
		fn_VodList( params, TBODY, 5 );
		alertShow('70%','',POPUP);
	} else {
		fn_BtnVodAdd( params, TBODY, 5 );
		alertShow('30%','',POPUP);
	}
	if ( chatId != "" && typeof chatId != 'undefined'  ) 
		$('.tbl_list').scrollTop( $('#'+chatId ).position().top );
		
}


function fn_VodList( PARAMS, OBJECT_ID, CNT ) {
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result.out.detail.data;
	var inTag = '';
// 	 INFO |--------------|---------|----------|--------|-----------------|----------|--------------------| 
// 	 INFO |MAST_USER_IDX |USER_IDX |MASTER_NM |USER_NM |HIST_CNTN        |HIST_UUID |SYS_REG_DTM         | 
// 	 INFO |--------------|---------|----------|--------|-----------------|----------|--------------------| 
// 	 INFO |1             |0        |마스터1      |        |안녕하세요, 수퍼 마스터입니다 |[null]    |2020-11-25 14:44:18 | 
// 	 INFO |0             |4        |          |회원1     |안녕하세요 마스터님!      |[null]    |2020-11-25 14:44:19 | 
// 	 INFO |1             |0        |마스터1      |        |수고하셨습니다          |[null]    |2020-11-26 15:16:15 | 
// 	 INFO |0             |4        |          |회원1     |다음에 또 신청할게요~     |[null]    |2020-11-26 15:16:29 | 
// 	 INFO |--------------|---------|----------|--------|-----------------|----------|--------------------| 

	 if( jsonData != null ) {
		$('#'+OBJECT_ID+'').empty();
		
		var vodTotal = '';
		var progCnt = 0;	
		$.each(jsonData, function(key, val) {
			vodTotal = '['+val.MASTER_NM+', '+val.LECT_NM+', '+val.LECT_CD+'] 강좌진행 : '+(val.PROG_CNT > 0? ++progCnt:progCnt  )+'/'+(val.VOD_TOTAL+'');
			
			inTag += '<tr>';
			inTag += '<td>'+ (key+1) + '</td>';
			inTag += '<td>'+ val.DATA_TITL + '</td>';
			inTag += '<td>'+ val.DATA_CD + '</td>';
			inTag += '<td>'+ val.SYS_REG_DTM + '</td>';
			inTag += '<td>'+ val.DATA_UUID_YN + '</td>';
			inTag += '<td>'+ val.PMDL_CNT + '</td>';
			inTag += '<td>'+ ( val.DOWN_DTM==undefined?'-':val.DOWN_DTM ) + '</td>';
			inTag += '</tr>';
		});
		$('#vodTotal').text( vodTotal );
		
		$('#'+OBJECT_ID+'').append( inTag );
	 }
}


function fn_BtnVodAdd( PARAMS, OBJECT_ID, CNT ) {
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result.out.detail.data;
	var inTag = '';
	console.log( jsonData );
// 	$( '#'+OBJECT_ID ).empty();
	$('#'+OBJECT_ID+' tr td').css("text-align","left");
	$('#'+OBJECT_ID+' tr:eq(0) td:eq(0)').text(jsonData[0].PRDT_STR + ' ~ ' + jsonData[0].PRDT_END+ '(총 '+ jsonData[0].PRDT_TOTAL_DTM + ' 일)');
	
	$('#'+OBJECT_ID+' tr:eq(2) td:eq(0)').html('<span id="constantDate">'+jsonData[0].PRDT_STR + ' ~ <span><span id="variableDate">' + jsonData[0].PRDT_END+ '(총 '+ jsonData[0].PRDT_TOTAL_DTM + ' 일)</span>');
	
// 	USER_IDX |PRDT_TYPE |MASTER_NM |PRDT_CD       		|PRDT_NM          |BUY_NO       	|BUY_IDX |CODE_PARENT_NM |CODE_NM 	|PRDT_STR         	|PRDT_END         |PRDT_TOTAL_DTM |PRDT_TOTAL_CNT |PRDT_PROG_CNT |PRDT_PROG_AVG |
// 	---------	|---------- 	|----------		|--------------		 |----------------|-------------	|--------	|---------------		|--------		|-----------------	|-----------------|---------------|---------------|--------------|--------------|
// 	110       	|VOD        		|강승현        		|202102VLA0005 	|추성훈, 모델 강승현  |677890050452 |719     	|건강             			|다이어트 상담 	|2021-04-26 16:14 |2021-06-25 16:14 |91             |3              |0             |0.0           |
// 	---------	|----------		|----------		|--------------		 |----------------|-------------	|--------	|---------------		|--------		|-----------------	|-----------------|---------------|---------------|--------------|--------------|
	
	$('#vodEnd').off();
	$('#vodAdd').off();
	$('input[name=EXTE_DATE]').off();
	$('input[name=EXTE_DATE]').val('0');
	$('#vodEnd').on('click',vodEnd);
	$('#vodAdd').on('click',vodAdd);
	
	
	
	$('input[name=EXTE_DATE]').on('change',function(){
		var enddate = new Date( jsonData[0].PRDT_END );
		
		if (enddate != null && enddate != undefined && this.value > 0) {
			enddate.setDate(enddate.getDate() + (1*this.value));
		}
		
		var dateString = enddate.getFullYear() + '-' + ("0" + (enddate.getMonth()+1) ).slice(-2) + '-' +("0" +enddate.getDate() ).slice(-2);
		
		$('#variableDate').text( dateString + '(총'+(this.value > 0 ? ( (1*jsonData[0].PRDT_TOTAL_DTM)+(1*this.value) ) :jsonData[0].PRDT_TOTAL_DTM )+')' );
		
	});
	
	function vodAdd(){
		
		var params = new Object();
		params.status = "WRITE";
		params.query = "insertMngVodExtensionData";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		params.BUY_IDX = PARAMS.BUY_IDX;
		params.EXTE_DATE = 1*$('input[name=EXTE_DATE]').val();
		
		if ( 1*$('input[name=EXTE_DATE]').val() == 0 ) {
			return alert('0일 이상 입력해 주세요.');
		}else{
			fn_DataAjax( params );
			alert('정상적으로 처리되었습니다.');
			location.reload();
		}
	}
	
	function vodEnd(){
		// VOD 수강종료
		if (confirm('정말로 수강종료하시겠습니까?')) {
			
		var params = new Object();
		params.status = "EDIT";
		params.query = "updateMngVodEndData";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		params.BUY_IDX = PARAMS.BUY_IDX;
		
		var result = fn_DataAjax2( params );
		alert('정상적으로 처리되었습니다.');
		location.reload();
		}
	}
}


</script>









