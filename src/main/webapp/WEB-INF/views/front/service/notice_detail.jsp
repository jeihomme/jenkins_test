<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" />


    <div id="container">
    
     <div class="section_inner">
        <section>
            <div class="section_inner">
                <div class="breadcrumb">
                    <span>홈</span>
                    <span>고객센터</span>
                    <span>피플메이드 소식</span>
                </div>
                <h2 class="page_title">피플메이드 소식</h2>
            </div>
        </section>
<!--         <div class="account_container section_inner"> -->
<!--             <div class="sub_nav_box"> -->
<!--                 <ul class="sub_nav"> -->
<!--                     <li><a href="/front/main/index" class="home"></a></li> -->
<!--                     <li><a href="#">고객센터</a></li> -->
<!--                     <li><a href="/front/service/event" class="current">피플메이드 소식</a></li> -->
<!--                 </ul> -->
<!--             </div> -->

            <div class="account_double_box">
<!--                 <h3 class="account_title account_title_big pc_show"> -->
<!--                     피플메이드 소식 -->
<!--                 </h3> -->
                
                <div class="notice_box">
                    <div class="mypeople_tab_box">
                        <ul class="mypeople_tab">
                            <li><a href="/front/service/notice?target=ALL" class="mypeople_item" value="" >전체</a></li>
                            <li><a href="/front/service/notice" class="mypeople_item" value="NOT01" >공지</a></li>
                            <li><a href="/front/service/event" class="mypeople_item " value="NOT02" >이벤트</a></li>
                            <li><a href="/front/service/notice_paper" class="mypeople_item" value="NOT03" >언론보도</a></li>
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
		                  <!-- <input type="submit" class="board_search_submit" onclick='fn_BtnChnageListCnt("","");'>210520 수정 -->
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
	chk = 1;
	fn_BtnDetail( 'dataList','${out.params.notiIdx}' );
	$( '#now_loading' ).hide();
});

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
	

	console.log( jsonData[0].NOTI_CD );
//  INFO |--------|--------|-------------|------------|---------|-----------------------------------------------|--------------------------------|-------------| 
//  INFO |QNA_IDX |CODE_NM |QNA_TITL     |SYS_REG_DTM |QNA_CNTN |QNA_USER_UUID                                  |QNA_REPL                        |QNA_MNG_UUID | 
//  INFO |--------|--------|-------------|------------|---------|-----------------------------------------------|--------------------------------|-------------| 
//  INFO |5       |회원가입    |박재우씨 답변해주세요2 |2020-11-02  |테슽5      |20201103151619abe775bb0f5d4589bd0c444a73e26259 |<p>테스트 잘 된것 같네요</p><p>수고하세요</p> |             | 
//  INFO |--------|--------|-------------|------------|---------|-----------------------------------------------|--------------------------------|-------------| 
	$('.mypeople_item').removeClass('active');
	if (jsonData[0].NOTI_CD == 'NOT01') {
		$('.mypeople_item').eq(1).addClass('active');
	}else if (jsonData[0].NOTI_CD == 'NOT02') {
		$('.mypeople_item').eq(2).addClass('active');
	}else if (jsonData[0].NOTI_CD == 'NOT03') {
		$('.mypeople_item').eq(3).addClass('active');
	}
	
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
		
		 var now = new Date();
		 var year = now.getFullYear();
		    
		if( val.SYS_REG_DTM.indexOf( year ) > -1 ) {
			inTag += '<th class="date">'+val.SYS_REG_DTM.substr(5,6)+'</th>';
			inTag += '</tr>';
			inTag += '</thead>';	
		} else {
			inTag += '<th class="date">'+val.SYS_REG_DTM+'</th>';
			inTag += '</tr>';
			inTag += '</thead>';
		}
		
		inTag += '<tbody><tr><td colspan="3">';
		inTag += '<div class="board_detail_content">';
		inTag += '<p>'+val.NOTI_CNTN+'</p>';
		
		if( val.NOTI_UUID.trim().length > 0 ) {
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