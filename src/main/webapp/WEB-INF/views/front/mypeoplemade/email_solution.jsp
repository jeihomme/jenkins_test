<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<link href="/resources/assets/css/chat.css" rel="stylesheet" type="text/css" />
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" />
	
<style>
.footer{display:none !important;}
.topbar{display:none !important;}
.header{display:none !important;}

.white_select{
    font-size:12px;
    height: 28px;
    padding-left:10px;
    padding-right:30px;
    padding-bottom:2px;
}

.NOT_CHK{
/*     margin-left: 44%; */
}

@media screen and (min-device-width : 320px) and (max-device-width : 800px) {
	.board_detail_box.board_detail_box_master {
    	margin-top: 50px;
	}
	.NOT_CHK{
/* 	    margin-left: 40%; */
	}
}

@media screen and (max-width : 600px)
{
	.board_detail_box.board_detail_box_master{ margin-top: 50px; }
}
@media screen 
and (min-device-width : 800px)
and (max-device-width : 1200px) {
	.NOT_CHK{
/* 	    margin-left: 40%; */
	}
}
@media screen and (max-width: 1250px){
	.header_top {
	    /* min-height: inherit; */
	    min-height: 58px;
	    padding: 20px 0 15px;
	}
}

/* @media screen and (max-width: 900px){ */
/* 	.solution_sidebar2 { */
/* 	    width: 100%; */
/* 	    height: 183px; */
/* 	} */
/* } */
.solution_history, .solution_content, .solution_sidebar{ height: calc(100vh - 14px); }
#wrap{ border: 7px solid #0e0e0e; border-left: none; }
.board_table td.date, .board_table .mltd_state, .board_detail_table .date { color: white;} 

@media screen and (max-width: 1310px){
	.solution_sidebar {
	    width: 100%;
	    height: 230px;
	}
	.solution_content {
    width: 100%;
    height: calc(100vh - 244px);
	}
	#wrap{border-left: 7px solid #0e0e0e;}
}

.board_title {word-break: normal;}
</style>

<div id="wrap" class="chat_wrap">
    <div id="container" class="solution_container">
        <div class="solution_sidebar">
	    	<div class="header_top">
				<h1 class="header_logo" style="float: none;"><a href="javascript:;" style="margin: auto;">PEOPLEMADE</a></h1>
			</div>
            <button type="button" class="mo_history_on">히스토리 보기</button>
            <div class="ss_title_box2">
                <h1 class="ss_title"></h1>
                <span class="ss_tag2"></span>
                <p class="ss_tag4"></p>
                <div class="ss_progess_box"></div>
            </div>
        </div><!-- // .solution_sidebar -->

		<div class="solution_content"  > <!-- style="padding: 0 20px 20px 20px;" -->
			<a type="button" class="pop_close" onclick="window.close();"></a>
				<div class="ss_title_box3">
	                <h1 class="ss_title">1:1이메일코칭</h1>
                <span class="ss_tag3">
                    <span>사용 가능한 1:1이메일 코칭권 :</span>
                </span>
				<button type="button" class="prdt_apply_btn_e" data-popup="applyStep1Pop" onclick='location.href="${unit.url("/front/mypeoplemade/email_solution_notice", "email_solution_notice", out.params.cateIdx, out.params.prdtCd, "", out.params.buyIdx )}";'>이메일 코칭권 사용하기</button>
            	<div class="board_detail_box board_detail_box_master">
					<table class="board_table"  style="    width: 100%; margin: 0 auto;"> <!-- margin-top:50px !important; -->
						<colgroup>
							<col />
							<col width="30%"/>
						</colgroup>
						<tbody id="dataList">
							<tr>
								<td style="text-align: center !important;">
									<span class="NOT_CHK" >등록된 상담이 없습니다.</span> 
								</td>
							</tr>
						</tbody>
                    </table>
                    
					<div class="pagination justify-content-center paging" >
						<ul style="justify-content:space-between;" id="dataPage"></ul>
					</div>
				</div>
			</div>
		</div>
		<div class="solution_history">
            <div class="sh_layer"></div>

            <div class="sh_inner">
                <h2 class="solution_history_title">
                    히스토리
                </h2>
                <button type="button" class="mo_history_off">접기</button>
                <div class="sh_box" id="reviList">
                </div>
            </div>
        </div>
	</div>
</div><!-- // #wrap -->
<script>

//히스토리 on
$('.mo_history_on').on( 'click', function(){
    $('.solution_history').animate({right: '0'});
    $('.solution_history').addClass('active');
});

// 히스토리 off
$('.mo_history_off').on( 'click', function(){
    $('.solution_history').animate({right: '-100%'});
    $('.solution_history').removeClass('active');
});

var front_email_user_idx = localStorage.getItem('frontLoginIdx');

var parentUrl = ""+opener.document.location;

var endDate;

$(function(){
	if( ""+parentUrl.indexOf('/mng/') > -1 ) $('.prdt_apply_btn_e').remove();
	
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectFrontMypeoplemadeEmailSolutionInfo";
	params.BUY_IDX = '${out.params.buyIdx}';
	
	var result = fn_DataAjax2( params );
	result = result.out.detail.data;

	front_email_user_idx = result[0].USER_IDX;
	
	fn_BtnChnageListCnt("");
	fn_ChatInfo();
	fn_MastReviList();
	
	$( '#now_loading' ).hide();
});

function fn_BtnChnageListCnt( PAGE_NO ){

	var params = new Object();
	params.status = 'PAGE';
	params.query = "selectFrontMypeoplemadeEmailSolutionList";
	params.BUY_IDX = '${out.params.buyIdx}';
	params.prdtUuidNm = "EN";
// 	params.frontLoginIdx = localStorage.getItem('frontLoginIdx');
	params.frontLoginIdx = front_email_user_idx;
	params.mngLoginIdx = localStorage.getItem('mngLoginIdx');
	params.listCnt = 3; 
	
	if( PAGE_NO > 0 && typeof PAGE_NO != 'undefined' ) params.thisPage = PAGE_NO;
	else params.thisPage = 1;
	
	fn_DataList( params, "dataList", 7 );
}

function fn_DataList( PARAMS, OBJECT_ID, CNT ) {
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var html = ''; 
	// 다운로드 목록 초기화
//		$('div.acco_content.downer').empty();
	
	if ( result.out.detail.data.length > 0 ) {
		$('#dataList').empty();
		
// INFO |---------|--------|---------|-----------|----------|----------|----------|---------|--------|---------------------------|----------|----------|------------|------------|-------------|---------|--------| 
// INFO |MAIL_IDX |BUY_IDX |CATE_IDX |M_USER_IDX |P_CODE_NM |M_CODE_NM |MASTER_NM |USER_IDX |USER_NM |MAIL_TITL                  |MAIL_UUID |MAIL_REPL |MAIL_USE_YN |SYS_REG_DTM |SYS_REG_TIME |NUM_DESC |NUM_ASC | 
// INFO |---------|--------|---------|-----------|----------|----------|----------|---------|--------|---------------------------|----------|----------|------------|------------|-------------|---------|--------| 
// INFO |2        |5       |4        |1          |건강        |명상        |마스터1      |4        |김블루     |피플메이드 회원가입 중 문의사항이 발생하였습니다 |[null]    |[null]    |Y           |2021-01-28  |07:59:03 PM  |2.0      |1.0     | 
// INFO |1        |5       |4        |1          |건강        |명상        |마스터1      |4        |김블루     |빠른 답변 부탁합니다.               |[null]    |네, 가능합니다  |Y           |2021-01-28  |07:59:03 PM  |1.0      |2.0     | 
// INFO |---------|--------|---------|-----------|----------|----------|----------|---------|--------|---------------------------|----------|----------|------------|------------|-------------|---------|--------| 
 		
//  		if ( front_email_user_idx == null || front_email_user_idx ==undefined || front_email_user_idx =='' ) {
//  			front_email_user_idx = result.out.detail.data[0].USER_IDX;
// 		}
 		
		$.each(result.out.detail.data, function( k , v ){
			html += '<tr>';
			html += '	<td>';
			html += '		<span class="board_cate">'+v.P_CODE_NM+'·'+v.MASTER_NM+'</span>';
			html += '		<p class="board_title">';
			html += '			<a href="'+v.MOVE_URL.replace('email_solution','email_solution_detail')+'">'+v.MAIL_TITL+'</a>';
			html += '		</p>';
			html += '	</td>';
			
			if( v.MAIL_REPL < 1 || v.MAIL_REPL == null ) html += '	<td class="date"><span class="mltd_state use">미답변</span>'+v.SYS_REG_DTM+'</td>';
			else html += '	<td class="date"><span class="mltd_state">답변완료</span>'+v.SYS_MOD_DTM+'</td>';
			
			html += '</tr>';
			$('.prdt_apply_btn_e').attr('onclick','location.href=\"'+v.MOVE_URL.replace('email_solution','email_solution_notice')+'\"' );
		});
        
		$('#dataList').append( html );
	
		var varHtml = "";	
		varHtml += '		<li onclick="fn_BtnChnageListCnt('+ result.out.detail.paging.prevStep +');"><a id="pagingFirst"   aria-label="Previous"><i class="fa fa-angle-left i_prev front"></i></a></li>   ';
		for (var i = result.out.detail.paging.startPage; i <= result.out.detail.paging.endPage; i++) {
			if (result.out.detail.paging.thisPage == i) varHtml += '<li class="pagi_btn pagi_num current" onclick="fn_BtnChnageListCnt('+ i +');"><a id="pagingActive"  class="is-active" style="cursor:pointer;"><b>'+ i +'</b></a></li>   ';
			else varHtml += '<li class="pagi_btn pagi_num" onclick="fn_BtnChnageListCnt('+ i +');"><a name="pagingPassiive"  style="cursor:pointer;"><b>'+ i +'</b></a></li>   ';
		}
		varHtml += '		<li onclick="fn_BtnChnageListCnt('+ result.out.detail.paging.nextStep +');" ><a id="pagingLast"  aria-label="Next"><i class="fa fa-angle-right i_next front"></i></a></li>   ';
		
		$('#dataPage').empty();
		$('#dataPage').append( varHtml );
	}
}   



function fn_ChatInfo(){
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectFrontMypeoplemadePrdtDetail";
	params.BUY_IDX = '${out.params.buyIdx}';
	params.frontLoginIdx = front_email_user_idx;
	
	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var jsonData = result.out.detail.data;
	var persent = 0;
	
	$.each(jsonData, function(key,val){
		$('.ss_title').html(val.INFO_PRDT_TITL1+'<br class="pc_show2">'+val.INFO_PRDT_TITL2);
		$('.ss_tag2').html('<span>#1:1이메일코칭</span><span>#'+val.P_CODE_NM+'</span><span>#'+val.M_CODE_NM+'</span>'); 
		$('.ss_progess_box').append('<span class="ss_time2_c">'+val.DOPRDT_CNT+'</span><span>회 / '+val.PRDT_CNT+'회</span><br><span class="ss_time2_day">'+val.PRDT_STR_DTM +' ~ '+val.PRDT_END_DTM+'</span>');
		persent = parseInt( (val.DOPRDT_CNT*1 / val.PRDT_CNT*1) * 100 );
		$('.ss_progess_box').append('<div class="ss_progess_bar"><span class="ssp_bar" style="width: '+persent+'%;"></span></div>');
		 
		$('.ss_tag3').append('<span class="ss_time3_c">'+(val.DOPRDT_CNT)+'</span><span>회 / '+val.PRDT_CNT+'회</span>');
		$('.ss_tag3').append('<span class="ss_time3_day">사용 기간 : '+val.PRDT_STR_DTM +' ~ '+val.PRDT_END_DTM+'</span>');
		 
		$('.ss_tag4').html('<span>'+val.P_CODE_NM+'</span>·<span>'+val.M_USER_NM+'</span>');
		
		if( val.DOPRDT_CNT == val.PRDT_CNT ) $('.prdt_apply_btn_e').hide();
		
		endDate = new Date(val.PRDT_END_DTM);
		
		var sysdate = new Date();
		
		if ( endDate <= sysdate ) $('.prdt_apply_btn_e').remove();
		
	});
	
	
}

function fn_MastReviList(){
	var params = new Object();
	params.status = "LIST";
	params.query = "selectFrontReviList";
	params.cateIdx = cateIdx; 
	params.frontLoginIdx = front_email_user_idx;
	params.prdtCd = 'EN'; 
	
	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var jsonData = result.out.detail.data;
	var inTag = '';
	
	if ( unit_isComplete(result) ) {
		if( jsonData.length > 0 ) {
			$('#reviList').empty();
			
			$.each(jsonData, function(key, val){
				setUuid( val.USER_UUID );
				unit_fileGet( val.USER_UUID_NM+'_FILE' , "fn_fileUpload");

				inTag += '<div class="sh_item" style="cursor:pointer;" onclick="fn_history_forward(\''+val.MOVE_URL+'\')">';
				inTag += '	<div class="sh_title '+( val.BUY_IDX =='${out.params.buyIdx}' ? 'nowHist' :'' )+' ">';
				inTag += '		<span class="sh_thumb" style="background-image: url('+$('#imgTag').val()+');"></span>';
				inTag += '		<span class="sh_name">';
				inTag += '			<span>'+ val.USER_NM +' 마스터</span>';
// 				inTag += '			·';
// 				inTag += '			<span>'+ val.DTM_DIFF +'</span>';
				inTag += '		</span>';
				inTag += '		<span class="sh_cate" style="font-size: 80%;">';
				inTag += '			<span>'+ val.PRDT_TYPE +'</span> ';
				inTag += '			<span>'+ val.MAIL_CNT +'회,</span>';
				inTag += '			<br><span >'+ val.BUY_COMP_DTM.substr(0, 10) + ' ~ ' + val.MAIL_END_DTM +'</span>';
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

function fn_history_forward( MOVE_URL ){
	
	location.href = MOVE_URL.replace('/prdt/detail','/mypeoplemade/email_solution');
	return;
}

</script>






