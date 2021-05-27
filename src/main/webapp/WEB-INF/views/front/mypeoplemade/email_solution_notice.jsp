<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" />

<link href="/resources/assets/css/chat.css" rel="stylesheet" type="text/css" />
	
<style>
.footer{display:none !important;}
.topbar{display:none !important;}
.header{display:none !important;}

.oi_text_box{
border: 0 !important;
margin-bottom: 6px;
padding: 20px;
}

.oi_title{
padding: 20px 0 10px;
    border-top: 1px solid #909090;
    color: #000;
    margin-bottom: 0px;
    font-size: 14px;
}
.ss_title_box3{ padding: 60px 60px 20px 60px;
}
.solution_container::after {
    content: '';
    display: none;
    clear: both;
}
.white_select{
    font-size:12px;
    height: 28px;
    padding-left:10px;
    padding-right:30px;
    padding-bottom:2px;
}	
@media screen and ( max-width: 1310px ) {
	.section_inner {
	    position: relative;
	    max-width: 100%;
	    margin: 0 auto;
	}
	.ss_title_box3 {
	      padding: 30px 30px 10px 30px;
	}
}	

@media screen and ( max-width: 600px ) {
	.account_btn{
	    line-height: 30.1px!important;
	    height: 30px !important;
	    font-size: 12px;
	    max-width: 96px;
	}
	.oi_text_box{
	    margin-bottom: 0px;
	    padding: 10px;
	}
	.oi_title{
	    font-size: 12px;
	}
	.section_inner {
	    position: relative;
	    max-width: 100%;
	    padding: 0px 15px 0 15px;
	    margin: 0 auto;
	}
	.email_textarea > span {
	    font-size: 11px !important;
	}
	.board_detail_content > p > span {
	    font-size: 12px;
	}
	.board_detail_content > p {
	    font-size: 11px;
	}
}
@media screen 
and (min-device-width : 800px)
and (max-device-width : 1200px) {
	.NOT_CHK{
	    margin-left: 40%;
	}
}
@media screen and (max-width: 1250px){
	.header_top {
	    /* min-height: inherit; */
	    min-height: 58px;
	    padding: 20px 0 15px;
	}
}
.topbar_text{display: none;}
/* @media screen and (max-width: 900px){ */
/* 	.solution_sidebar2 { */
/* 	    width: 100%; */
/* 	    height: 183px; */
/* 	} */
/* } */
.solution_history, .solution_content, .solution_sidebar{ height: calc(100vh - 14px); }
#wrap.chat_wrap{ border: 7px solid #0e0e0e; border-left: none; }
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
	#wrap.chat_wrap{border-left: 7px solid #0e0e0e;}
}
</style>

<div id="wrap" class="chat_wrap">
    <div id="container" class="solution_container">
        <div class="solution_sidebar">
        	<div class="header_top">
			    	<h1 class="header_logo" style="float: none;"><a href="javascript:;" style="margin: auto;">PEOPLEMADE</a></h1>
			
			</div>
			<button type="button" class="mo_history_on">히스토리 보기</button>
            <div class="ss_title_box2">
                <h1 class="ss_title">
                </h1>
                <span class="ss_tag2">
                </span>
                
                <p class="ss_tag4">
                </p>

                <div class="ss_progess_box">
                </div>
            </div>
        </div><!-- // .solution_sidebar -->

<div class="solution_content ">
  <button type="button" class="pop_close" onclick="history.go(-1);"></button>
	<div class="ss_title_box3">
		<h1 class="ss_title">
		</h1>
		<span class="ss_tag3">
		    <span>사용 가능한 1:1이메일 코칭권 :</span>
		</span>
		<div class="board_detail_box" style="margin-top:10px;">
        <table class="#">
            <colgroup>
                <col width="10%">
                <col width="80%">
                <col width="10%">
            </colgroup>
            <tbody>
                <tr>
                    <td colspan="3">
                        <div class="board_detail_content board_detail_content_t" >
                            <p>
                                <span style="line-height: 2; color:#000;">코칭권 이용 안내</span>
                                
                                <br>
                                1. 질문에 대한 답변은 피플메이드 홈페이지에서 확인 가능합니다.
                                 <br>
                                 2. 질문을 등록하면, 코칭권 1회가 차감됩니다.
                                  <br>
                                  3. 질문 등록 후의 수정/삭제는 불가하니, 신중하게 작성해주시기 바랍니다.
                                   <br>
                                   4. 질문은 최대 1000자 이내로 작성 가능합니다.
                                   <br>
                                   5. 마스터가 문의사항에 대해 최대 3~7일 이내 순차적으로 답변을 드립니다
                                    <br>
                                    6. 사용 기한 내에 사용하지 못한 코칭권은 자동 소멸됩니다.
                                    <br>
                                    7. 2회이상 사용시에는 취소와 환불이 불가합니다.
                            </p>
                        </div>
                    </td>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td colspan="3" style="    padding: 10px 0;   font-weight: 300;  border: 0px; ">
                        <div class="board_detail_content" style=" font-weight: 300;  ">
                            <p class="email_textarea" style="color:#f44242;">
                              ※ 회원의 질문에 다음 각 항에 해당하는 내용이 포함된다고 판단되는 경우 마스터는 답변을 거부할 수 있습니다.
                               또한 해당 질문은 회사에 의해 사전통지 없이 삭제되며 회원의 코칭권은 차감될 수 있습니다.
                              
                             <span>
                                <br>
                                - 마스터 또는 해당 분야와 관련 없는 내용이 포함된 경우
                                 <br>
                                 - 마스터를 향한 욕설/비방/비하/모욕/차별 발언 등 명예훼손 및 인격모독성 표현이 포함된 경우
                                  <br>
                                    </span>
                            </p>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
		     
		    <span class="oi_title">개인정보 수집 및 이용에 대한 동의</span>
		    <div class="oi_text_box">
		        <p class="oi_text">
		            - 수집하는 개인정보 항목: 이메일 주소
		            <br>
		            작성해주시는 개인 정보는 문의 접수 및 고객 불만 해결을 위해 5년간 보관됩니다.
		            <br>
		            이용자는 본 동의를 거부할 수 있으나, 미동의 시 문의 접수가 불가능합니다.
		        </p>
		    </div>
		    <label for="cart_item1" class="form_check">
		        <input type="checkbox" id="cart_item1" name="cart_item1">
		        <span class="form_check_mark"></span>
		        <label for="service11" class="custom_sq_text2" style="line-height: 2; color:#000">동의합니다.</label>
		    </label>
		
		    <button type="submit" class="account_btn leave_btn" onclick="fn_BtnAgreeChk();">질문 작성하기</button>
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


if( localStorage.getItem('frontLoginIdx') == null ) window.close();

var front_email_user_idx = localStorage.getItem('frontLoginIdx');

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
    	fn_ChatInfo();
    	fn_MastReviList();
    	$( '#now_loading' ).hide();
    });
    
function fn_BtnAgreeChk(){
	if( $('#cart_item1').prop('checked') ) {
		var url = window.location.href;
		location.href = url.replace('email_solution_notice', 'email_solution_text');
	} else {
		alert('안내사항에 동의 후, 질문 작성이 가능합니다');
	}
}


function fn_ChatInfo(){
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectFrontMypeoplemadePrdtDetail";
	params.BUY_IDX = '${out.params.buyIdx}';
	params.frontLoginIdx = localStorage.getItem('frontLoginIdx');
	
	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var jsonData = result.out.detail.data;
	var persent = 0;
	
	if ( front_email_user_idx == null || front_email_user_idx ==undefined || front_email_user_idx =='' ) {
			front_email_user_idx = result.out.detail.data[0].USER_IDX;
	}
	
	$.each(jsonData, function(key,val){
		$('.ss_title').html(val.INFO_PRDT_TITL1+'<br class="pc_show2">'+val.INFO_PRDT_TITL2);
		$('.ss_tag2').html('<span>#1:1이메일코칭</span><span>#'+val.P_CODE_NM+'</span><span>#'+val.M_CODE_NM+'</span>'); 
		$('.ss_progess_box').append('<span class="ss_time2_c">'+val.DOPRDT_CNT+'</span><span>회 / '+val.PRDT_CNT+'회</span><br><span class="ss_time2_day">'+val.PRDT_STR_DTM +' ~ '+val.PRDT_END_DTM+'까지</span>');
		persent = parseInt( (val.DOPRDT_CNT*1 / val.PRDT_CNT*1) * 100 );
		$('.ss_progess_box').append('<div class="ss_progess_bar"><span class="ssp_bar" style="width: '+persent+'%;"></span></div>');
		 
		$('.ss_tag3').append('<span class="ss_time3_c">'+(val.DOPRDT_CNT)+'</span><span>회 / '+val.PRDT_CNT+'회</span>');
		$('.ss_tag3').append('<span class="ss_time3_day">사용 기간 : '+val.PRDT_STR_DTM +' ~ '+val.PRDT_END_DTM+'</span>');
		
		$('.ss_tag4').html('<span>'+val.P_CODE_NM+'</span>·<span>'+val.M_USER_NM+'</span>');
		
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
				console.log(val );
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
