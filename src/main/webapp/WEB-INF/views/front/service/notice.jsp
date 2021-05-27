<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" />


    <div id="container">
        <div class="account_container section_inner">
            <div class="sub_nav_box">
                <ul class="sub_nav">
                    <li><a href="/front/main/index" class="home"></a></li>
                    <li><a href="#">고객센터</a></li>
                    <li><a href="/front/service/event" class="current">피플메이드 소식</a></li>
                </ul>
            </div>

            <div class="account_double_box">
                <h3 class="account_title account_title_big pc_show">
                    피플메이드 소식
                </h3>
                
                <div class="notice_box">
                    <div class="mypeople_tab_box">
                        <ul class="mypeople_tab">
                            <li><a href="javascript:;" class="mypeople_item" value="" onclick='fn_BtnChnageListCnt("", "", $(this) );'>전체</a></li>
                            <li><a href="javascript:;" class="mypeople_item active" value="NOT01" onclick='fn_BtnChnageListCnt("", "NOT01", $(this) );'>공지</a></li>
                            <li><a href="javascript:;" class="mypeople_item" value="NOT02" onclick='fn_BtnChnageListCnt("", "NOT02", $(this) );'>이벤트</a></li>
                            <li><a href="javascript:;" class="mypeople_item" value="NOT03" onclick='fn_BtnChnageListCnt("", "NOT03", $(this) );'>언론보도</a></li>
                        </ul>
                        
	                    <!-- <div class="board_search_box">
		                    <input type="text" id="notiTitl" class="board_search_input" placeholder="검색어를 입력 하세요" onkeypress='if(event.keyCode==13){ fn_BtnChnageListCnt("","","");}'>
		                    <input type="submit" class="board_search_submit" onclick='fn_BtnChnageListCnt("","");'>
		                     <button type="button" class="board_search_btn">검색</button> 
	                    </div> 210520 수정 위치변경 -->
                    </div>

                    <div id="dataList" class="board_box"></div>

					<div class="pagination justify-content-center paging">
						<ul style="justify-content:space-between;  text-align: center;" id="dataPage"></ul>
					</div>
					
					<div class="board_search_box">
		                <input type="text" id="notiTitl" class="board_search_input" placeholder="검색어를 입력 하세요" onkeypress='if(event.keyCode==13){ fn_BtnChnageListCnt("","","");}'>
		                <!--  <input type="submit" class="board_search_submit" onclick='fn_BtnChnageListCnt("","");'> 210520 수정 -->
		                <button type="button" class="board_search_btn">검색</button> 
	                </div>                        
                </div>
            </div><!-- //.account_double_box  -->
        </div>
    </div><!-- // #container -->

<!-- <script type="text/javascript" src="/resources/assets/js/jquery-1.12.4.min.js"></script> -->
<!-- <script type="text/javascript" src="/resources/assets/js/slick.min.js"></script> -->
<!-- <script type="text/javascript" src="/resources/assets/js/jquery.waypoints.min.js"></script> -->
<!-- <script type="text/javascript" src="/resources/assets/js/common.js"></script> -->
<script>





var chk = 0;
$(function(){
	$('.mypeople_item').eq(1).trigger('click');
	chk = 1;
	if('${param.target}' == 'ALL')	$('.mypeople_item').eq(0).trigger('click');
	$( '#now_loading' ).hide();
});

function fn_BtnChnageListCnt( PAGE_NO, NOTI_CD, OBJECT ){
	if( OBJECT != '' && OBJECT != null && OBJECT != undefined  ) {
		$(".mypeople_item").removeClass("active");
		OBJECT.addClass("active");
	}
	
	paymentCnt = 0;
	
	var params = new Object();
	params.status = "PAGE";
	params.query = "selectFrontNotiList";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.notiTitl = $("#notiTitl").val();

	$('.mypeople_item').each(function(key, val){
		if( $(this).hasClass("active") ) {
			params.notiCd = $(this).attr('value');
// 			console.log( params.notiCd );
		}
	});
	
// 	params.notiCd = NOTI_CD;
	
// 	$.each($('.mypeople_item'), function(key, val){
// 		if( NOTI_CD == "" ) $('.mypeople_item').eq(0).addClass('active');
// 		else if( NOTI_CD == "NOT01" ) $('.mypeople_item').eq(1).addClass('active');
// 		else if( NOTI_CD == "NOT02" ) $('.mypeople_item').eq(2).addClass('active');
// 		else if( NOTI_CD == "NOT03" ) $('.mypeople_item').eq(3).addClass('active');
// 	});
	
	if( PAGE_NO.length > 0 ) params.thisPage = PAGE_NO;
	else params.thisPage = 1;
	
	fn_DataList( params, "dataList", 7 );
}

function fn_DataList( PARAMS, OBJECT_ID, CNT ) {
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result.out.detail.data;
	var inTag = '';

//  INFO |--------|--------|-------------|--------------------------------|------------|---------|--------| 
//  INFO |QNA_IDX |CODE_NM |QNA_TITL     |QNA_REPL                        |SYS_REG_DTM |NUM_DESC |NUM_ASC | 
//  INFO |--------|--------|-------------|--------------------------------|------------|---------|--------| 
//  INFO |5       |회원가입    |박재우씨 답변해주세요2 |<p>테스트 잘 된것 같네요</p><p>수고하세요</p> |2020-11-02  |2        |1       | 
//  INFO |4       |VOD강좌   |박재우씨 답변해주세요1 |[null]                          |2020-11-02  |5        |2       | 
//  INFO |3       |1:1화상상담 |박재우씨 답변해주세요1 |<p>잘받았다</p>                     |2020-11-02  |4        |3       | 
//  INFO |2       |마스터지원   |박재우씨 답변해주세요  |[null]                          |2020-11-02  |3        |4       | 
//  INFO |1       |회원가입    |최우성씨 답변해주세요  |<p>잘받았다 답변</p>                  |2020-11-02  |1        |5       | 
//  INFO |--------|--------|-------------|--------------------------------|------------|---------|--------| 
	
	
	
	 
	$('#'+OBJECT_ID+'').empty();
	
	 if( jsonData.length > 0 ) {

		inTag += '<table class="board_table">';
		inTag += '<tbody>';
		
		$.each(jsonData, function(key, val) {
			
			inTag += '<tr>';
			inTag += '<td>';
			inTag += '<span class="board_cate">'+val.CODE_NM+'</span>';
			inTag += '<p class="board_title">';
			
			inTag += '<a href="'+val.NOTI_URL+'" >';
			inTag += ''+val.NOTI_TITL+'';
			inTag += '</a>';
			inTag += '</p>';
			inTag += '</td>';
			inTag += '<td class="date">';
			inTag += ''+val.SYS_REG_DTM+'';
			inTag += '</td>';
			inTag += '</tr>';
		});
		
		inTag += '</tbody>';
		inTag += '</table>';

		$('#'+OBJECT_ID+'').append( inTag );
	 } else {
		inTag += '<div class="mlt_row hasbtn noDataList" >등록된 내용이 없습니다.</div>';
		$('#'+OBJECT_ID+'').append( inTag );
	 }

		var varHtml = "";	
		varHtml += '		<li class="pagi_btn pagi_btn_prev"><a id="pagingFirst" onclick="fn_BtnChnageListCnt('+ result.out.detail.paging.prevStep +');"  aria-label="Previous"><i class="fa fa-angle-left"></i></a></li>   ';
		for (var i = result.out.detail.paging.startPage; i <= result.out.detail.paging.endPage; i++) {
			if (result.out.detail.paging.thisPage == i) varHtml += '<li class="pagi_btn pagi_num current"><a id="pagingActive" onclick="fn_BtnChnageListCnt('+ i +');" class="active" style="cursor:pointer;"><b>'+ i +'</b></a></li>   ';
			else varHtml += '<li class="pagi_btn pagi_num"><a name="pagingPassiive" onclick="fn_BtnChnageListCnt('+ i +');" style="cursor:pointer;"><b>'+ i +'</b></a></li>   ';
		}
		varHtml += '		<li class="pagi_btn pagi_btn_next"><a id="pagingLast" onclick="fn_BtnChnageListCnt('+ result.out.detail.paging.nextStep +');"  aria-label="Next"><i class="fa fa-angle-right"></i></a></li>   ';
		
		
		$('#dataPage').empty();
		$('#dataPage').append( varHtml );
// 		$('.listCount').text('전체 ' + result.out.totalCnt );
// 		if( chk == 1 ) alert('페이지 개수 변환에 성공하였습니다.');
}

function fn_BtnDetail( OBJECT_ID, NOTI_IDX ) {

	$('#'+OBJECT_ID+'').empty();
	
	var params = new Object();
	params.status = "LIST";
	params.query = "selectFrontNotiListIdx";
	var result = fn_DataAjax2( params );
	var jsonData = result.out.detail.data;
	var loop = 1;
	var prevIdx = 0;//1,
	var nextIdx = 0;//
	var tempIdx = 0;//2,
	var tempKey = 0;//2,
	var eachCnt = 0;
	var PREV_NOTI_TITL = '';
	var NEXT_NOTI_TITL = '';
	
	if( jsonData.length > 0 ) {
		$.each(jsonData, function(key, val) {
			if( loop == 1 ) {
				if( val.NOTI_IDX != NOTI_IDX ) {
					tempIdx = val.NOTI_IDX;
					if( eachCnt == 0 ) {
						prevIdx = val.NOTI_IDX;
						PREV_NOTI_TITL = val.NOTI_TITL;
					}
				} else {
					eachCnt = jsonData.length + 1;
					tempKey = key+1;
					loop = 0;
				}
			}
		});
		
		if( jsonData[tempKey] != null ) {
			nextIdx = jsonData[tempKey].NOTI_IDX;
			NEXT_NOTI_TITL = jsonData[tempKey].NOTI_TITL;
		} else {
			nextIdx = 0;
		}
	}

// 		console.log( prevIdx + ' , ' + NOTI_IDX + ' , ' + nextIdx );
	
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectFrontNotiDetail";
	params.NOTI_IDX = NOTI_IDX;
	
	var inTag = '';
	var result = fn_DataAjax2( params );
	var jsonData = result.out.detail.data;
	

	
//  INFO |--------|--------|-------------|------------|---------|-----------------------------------------------|--------------------------------|-------------| 
//  INFO |QNA_IDX |CODE_NM |QNA_TITL     |SYS_REG_DTM |QNA_CNTN |QNA_USER_UUID                                  |QNA_REPL                        |QNA_MNG_UUID | 
//  INFO |--------|--------|-------------|------------|---------|-----------------------------------------------|--------------------------------|-------------| 
//  INFO |5       |회원가입    |박재우씨 답변해주세요2 |2020-11-02  |테슽5      |20201103151619abe775bb0f5d4589bd0c444a73e26259 |<p>테스트 잘 된것 같네요</p><p>수고하세요</p> |             | 
//  INFO |--------|--------|-------------|------------|---------|-----------------------------------------------|--------------------------------|-------------| 

	$.each(jsonData, function(key, val) {

		inTag += '<table class="board_detail_table">';
		
		inTag += '<colgroup><col width="10%"><col width="75%"><col width="15%">';
		inTag += '</colgroup>';
		
		inTag += '<thead>';
		inTag += '<tr>';
		inTag += '<th colspan="2">';
		inTag += '<span class="board_cate">'+val.CODE_NM+'</span>';
		inTag += '<p class="board_title">'+val.NOTI_TITL+'</p>';
		inTag += '</th>';
		inTag += '<th class="date">'+val.SYS_REG_DTM+'</th>';
		inTag += '</tr>';
		inTag += '</thead>';
		
		inTag += '<tbody><tr><td colspan="3">';
		inTag += '<div class="board_detail_content">';
		inTag += '<p>'+val.NOTI_CNTN+'</p>';
		
		if( val.NOTI_UUID != '' ) {
			inTag += '<p class="file">';
			inTag += '<a href="javascript:;" class="board_detail_file_link"></a>';
			inTag += '</p>';	
		}
		
		inTag += '</div>';
		inTag += '</td></tr></tbody>';
		
		inTag += '<tfoot>';
		inTag += '<tr class="board_detail_back">';
		inTag += '<td colspan="3">';
		inTag += '<a href="javascript:;" onclick="fn_BtnChnageListCnt(\'\');" class="account_btn">목록</a>';
		inTag += '</td>';
		inTag += '</tr>';
		
		inTag += '<tr class="board_detail_nav">';
		inTag += '<td class="bdn_title">';
		inTag += '<span>다음글</span>';
		inTag += '</td>';
		inTag += '<td colspan="2">';

		if( prevIdx == 0 ) inTag += '<span>다음글이 없습니다.</span>';
		else inTag += '<a href="javascript:;" onclick="fn_BtnDetail(\''+OBJECT_ID+'\', '+prevIdx+');">'+PREV_NOTI_TITL+'</a>';
		
		inTag += '</td>';
		inTag += '</tr>';
		
		inTag += '<tr class="board_detail_nav">';
		inTag += '<td class="bdn_title">';
		inTag += '<span>이전글</span>';
		inTag += '</td>';
		inTag += '<td colspan="2">';

		if( nextIdx == 0 ) inTag += '<span>이전글이 없습니다.</span>';
		else inTag += '<a href="javascript:;" onclick="fn_BtnDetail(\''+OBJECT_ID+'\', '+nextIdx+');">'+NEXT_NOTI_TITL+'</a>';
		
		inTag += '</td>';
		inTag += '</tr>';
		
		inTag += '</tfoot>';
		inTag += '</table>';

		$('#'+OBJECT_ID+'').append( inTag );
		
		imgIdValue = 'NOTI_UUID_FILE';
		setUuid( val.NOTI_UUID );
		unit_fileGet( imgIdValue, "fn_fileUpload");
		
		$(function(){
			$("#dataPage").css("display", "none");
			$(".notice_box .board_search_box").css("display", "none");
		})
	});
}

</script>