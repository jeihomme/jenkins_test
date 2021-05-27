<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'face_history_list', 'ajax')}" />

<link href="/resources/assets/css/chat.css" rel="stylesheet" type="text/css" />
	
<style>
.white_select { font-size:12px; height: 28px; padding-left:10px; padding-right:30px; padding-bottom:2px; }			
#footer, #header{display:none;}
.topbar{display:none;}
.section_inner{display: none;}
.emotion_list{width: 90%;height: 100px;border: 1px solid white;display:none;}
textarea:focus, input:focus, select:force  {
	outline:none !important;
} 
.mo_acco_btn.active { transform:none; }
@media screen and (max-width: 1250px){
	.header_top {
	    /* min-height: inherit; */
	    min-height: 58px;
	    padding: 20px 0 15px;
	}
}
@media screen and (max-width: 1310px){
.solution_sidebar {
    width: 100%;
    height: 200px;
}
.ss_acco_box {
    display: none;
    position: fixed;
    top: 200px;
    left: 0;
    width: 100%;
    z-index: 1;
}
}
</style>

<div id="wrap" class="chat_wrap">
    <div id="container" class="solution_container">
        <div class="solution_history" style="width: 100%; right: 0%;">
            <div class="sh_layer"></div>

            <div class="sh_inner" style="width: 100%;">
                <h2 class="solution_history_title">
                    히스토리
                </h2>
                <button type="button" class="mo_history_off" style="display: none;">접기</button>
                <div class="sh_box" id="reviList">
                </div>
            </div>
        </div>
    </div>
</div><!-- // #wrap -->

<script>

// 모바일 아코디언 toggle
$('.mo_acco_btn').on( 'click', function(){
	$(this).toggleClass('active');
    $('.ss_acco_box').slideToggle();
});

// 히스토리 on
$('.mo_history_on').on( 'click', function(){
    $('.solution_history').animate({right: '0'});
    $('.solution_history').addClass('active');
});

// 히스토리 off
$('.mo_history_off').on( 'click', function(){
    $('.solution_history').animate({right: '-100%'});
    $('.solution_history').removeClass('active');
});


$(function(){
	
// 	console.log('-----------------------------------------');
	fn_MastReviList();
	
//         var selectChatListRoop = setInterval(selectChatList, 10000);
    $( '#now_loading' ).hide();
});

var face_buy_idx = '${out.params.buyIdx }';

function fn_MastReviList(){
	var params = new Object();
	params.status = "LIST";
	params.query = "selectFrontReviList";
	params.cateIdx = '${out.params.cateIdx}';
	params.frontLoginIdx = '${out.params.frontLoginIdx}';
	params.prdtCd = 'FN';
	
	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var jsonData = result.out.detail.data;
	var inTag = '';
	
	if ( unit_isComplete(result) ) {
		if( jsonData.length > 0 ) {
			$('#reviList').empty();
			
			$.each(jsonData, function(key, val){

				setUuid( val.USER_UUID );
				unit_fileGet( val.USER_UUID_NM+'_FILE' , "fn_fileUpload");

				inTag += '<div class="sh_item">';
				inTag += '	<div class="sh_title '+( val.BUY_IDX == face_buy_idx ? 'nowHist' :'' )+' ">';
				inTag += '		<span class="sh_thumb" style="background-image: url('+$('#imgTag').val()+');"></span>';
				inTag += '		<span class="sh_name">';
				inTag += '			<span>'+ val.USER_NM +' 마스터</span>';
// 				inTag += '			·';
// 				inTag += '			<span>'+ val.DTM_DIFF +'</span>';
				inTag += '		</span>';
				inTag += '		<span class="sh_cate" style="font-size: 80%;">';
				inTag += '			<span>'+ val.PRDT_TYPE +'</span> ';
				inTag += '			<span>'+ val.TIME_RUN +'</span>';
				inTag += '		</span>';
				inTag += '	</div>';
				inTag += '	<div class="sh_content">';
				if ( val.REVI_CNTN != undefined && val.REVI_CNTN.length != 0 ) {
					inTag += '		<div class="sh_img"></div>';
					inTag += '		<p class="sh_text"></p>';
					inTag += '	<span>'+ val.REVI_CNTN+'</span>';
				}
				inTag += '		<br><span style="display:block;margin-top:10px;">작성일: '+ val.SYSDATE+'</span>';
				inTag += '	</div>';
				inTag += '</div>';
				
			});

// 	        $('#reviList').append( inTag );
		}else{
			inTag += '<div> 히스토리가 없습니다.';
			inTag += '</div>';
		}
		
		$('#reviList').append( inTag );
	}
}

</script>























