<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" />

<link href="/resources/assets/css/chat.css" rel="stylesheet" type="text/css" />
	
<style>
#footer, #header{display:none;}
.topbar{display:none;}

.ooo_input_email{ width: calc(100% - 10px); }
.oi_text_box{
margin-bottom: 6px; padding: 20px;
}
.oi_title{
    margin-bottom: 6px;
    margin-top: 12px;
    font-size: 14px;
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
	    margin-top: 0px;
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
	.ooo_input_email{ width: 100%; }
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
		<div class="solution_content" id="searchArea">
        	<button type="button" class="pop_close" onclick="window.close();"></button>
            <div class="ss_title_box3">
                <h1 class="ss_title NOT_CHK">
                    마스터에게 코칭 받고 싶은 내용을 적어주세요.
                    <br>
                    <span class="ss_title NOT_CHK" style="font-size:15px;color:red;">
						최대 3일~ 7일 이내에 순차적으로 답변이 진행됩니다.
                	</span>
                </h1>
                <span class="ss_tag3">
                </span>
               <div class="register_box leave_box">
                    <div class="leave_text_box">
                        <div class="ooo_box">
                            <p class="ooo_item">
                                <input type="text" name="MAIL_TITL" class="ooo_input ooo_input_email" placeholder="제목" style="color:black;" maxlength="50">
                            </p>
                            
                            <p class="apply_form_item">
                            	<label for="afi03" class="afi03_t" style="margin-top: -10px;">진행사항 안내</label>
								<span class="maf_check_item2 maf_check_item2_w" >
<!-- 									<label for="cart_item1" class="form_check "> -->
<!-- 	                                    <input type="checkbox" id="cart_item1" name="cart_item1" value="EAT01"> -->
<!-- 	                                    <span class="form_check_mark"></span> -->
<!-- 	                                    <label for="service11" class="custom_sq_text2">알림톡</label> -->
<!-- 	                                </label> -->
	                                <label for="cart_item2" class="form_check form_check_style">
	                                    <input type="checkbox" id="cart_item2" name="cart_item2" value="EAT02">
	                                    <span class="form_check_mark"></span>
	                                    <label for="service12" class="custom_sq_text2">SMS 수신</label>
	                                </label>
									<label for="cart_item3" class="form_check" style="    float: left;">
	                                    <input type="checkbox" id="cart_item3" name="cart_item3" value="EAT03">
	                                    <span class="form_check_mark"></span>
	                                    <label for="service13" class="custom_sq_text3">이메일 수신</label>
	                                </label>
								</span>
                            </p>
                            
                            <p class="ooo_item">
                                <textarea name="MAIL_CNTN" id="" class="ooo_textarea"  placeholder="문의내용(최대 1000자까지 입력 가능합니다)" style="color:black;" maxlength="1000"></textarea>
                            </p>
                           
                            <p class="ooo_item">
								<div class="fileArea">				
									<input type="file" id="MAIL_UUID_FILE" name="MAIL_UUID_FILE" style="display:none;margin-left:0px;" multiple maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" 
											maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."
											maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."
											totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."
											onclick="imgIdValue = $(this).attr('id');"
									/>	
									<label class="file_input_label" for="MAIL_UUID_FILE" style="width: 180px; display: inline-block;">파일선택</label>
														<span class="file_label_text" style="display: inline-block!important;">10MB이하의 파일을 첨부하실 수 있습니다.</span>							
									<div class="fileList" id="MAIL_UUID_FILEList" style="color:black;"></div>
									<input id="MAIL_UUID" name="MAIL_UUID" type="hidden" />
									<div id="MAIL_UUID_FILEListClone" style="display:none;color:black;">
									<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close" style="cursor:pointer;margin-left:20px; color:#aaa;font: -webkit-control; font-size:16px;">x</span></div>
									</div>											
								</div>
                            </p>
                        	</div>
                    	</div>           
                    </div>
					<div class="popup_bottom" style="margin-bottom: -40px;">
                         <button type="submit" id="email_btn" onclick="fn_BtnRegist();" class="account_btn2finish account_btn_border3">등록</button>
                         <button type="submit" class="account_btn2finish account_btn_border3" onclick="history.go(-2);" style="background-color:#fff !important;border-color:#fff;height: 40px;width: 90px;">취소</button>
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
 
<!-- <div id="reviewPop" class="popup_wrap"> -->
<!--     <div class="popup_layer"></div> -->
<!--     <div class="popup_box"> -->
<!--         <div class="popup_content review_content"> -->
<!--             <button type="button" class="pop_close pop_close_pop" onclick="closeReview();"></button> -->
<!--             <div class="cart_complete"> -->
<!--             <strong class="cart_complete_title">질문이 정상적으로 등록되었습니다.</strong> -->
            
<!--             <table class="card_complete_table"> -->
<!--                 <tbody> -->
<!--                  <tr> -->
<!--                      <td>최대 3일~ 7일 이내에 순차적으로 답변이 진행됩니다. </td> -->
<!--                  </tr> -->
<!--             	</tbody> -->
<!--             </table> -->
            
<!--             <div class="card_complete_button_area"> -->
<!--               <button type="button" class="card_complete_button btn_white" onclick="location.href='/front/mypeoplemade/email_solution_detail'">질문내용보기</button> -->
<!--               <button type="button" class="card_complete_button btn_cyan" onclick="location.href='/front/mypeoplemade/email_solution'">목록보기</button> -->
<!--             </div> -->
<!--         </div> -->
<!--         </div> -->
<!--     </div> -->
<!-- </div> -->
</div><!-- // #wrap -->
<script>
//히스토리 on


if( localStorage.getItem('frontLoginIdx') == null ) window.close();

	var doCnt = 0;
	var totalCnt = 0;
	var endDate;
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
    
    //등록 팝업
//     $('.account_btn2finish').on('click',function(){
//         $('#reviewPop').show();
//       });

    $(function(){
    	fn_ChatInfo();
    	fn_MastReviList();
    	$( '#now_loading' ).hide();
    });

    $("input[type=file][name]").change(function(){		
    	var tagId = $(this).attr('id').replace('_FILE', '');
    	if( $('#'+tagId+'').val() == '' ) setUuid( fn_GetUuid() );
    	else setUuid( $('#'+tagId+'').val() );
    });
    
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
		$('.ss_title').not('.NOT_CHK').html(val.INFO_PRDT_TITL1+'<br class="pc_show2">'+val.INFO_PRDT_TITL2);
		$('.ss_tag2').html('<span>#1:1이메일코칭</span><span>#'+val.P_CODE_NM+'</span><span>#'+val.M_CODE_NM+'</span>'); 
		$('.ss_progess_box').append('<span class="ss_time2_c">'+val.DOPRDT_CNT+'</span><span>회 / '+val.PRDT_CNT+'회</span><br><span class="ss_time2_day">'+val.PRDT_STR_DTM +' ~ '+val.PRDT_END_DTM+'까지</span>');
		persent = parseInt( (val.DOPRDT_CNT*1 / val.PRDT_CNT*1) * 100 );
		$('.ss_progess_box').append('<div class="ss_progess_bar"><span class="ssp_bar" style="width: '+persent+'%;"></span></div>');

		$('.ss_tag3').append('<span>선택된 마스터 : '+val.M_USER_NM+' – 1:1코칭 '+val.INFO_PRDT_TITL1+' '+val.INFO_PRDT_TITL2+'</span>');
// 		$('.ss_tag3').append('<span class="ss_time3_c">'+val.DOPRDT_CNT+'</span><span>회 / '+val.PRDT_CNT+'회</span>');
// 		$('.ss_tag3').append('<span class="ss_time3_day">사용 기간 : ~'+val.PRDT_END_DTM+'까지</span>');

		$('.ss_tag4').html('<span>'+val.P_CODE_NM+'</span>·<span>'+val.M_USER_NM+'</span>');

		doCnt = val.DOPRDT_CNT;
		totalCnt = val.PRDT_CNT;
		endDate = new Date( val.PRDT_END_DTM );
	});
}


function fn_BtnRegist(){
	var sysdate = new Date();
	if ( sysdate <= endDate ) {
		if( doCnt < totalCnt ) {
			
			if($('[name=MAIL_TITL]').val().trim() == '' ) return alert('제목을 입력해주세요.');
			if($('[name=MAIL_CNTN]').val().trim() == '' ) return alert('문의내용을 입력해주세요.');
			
			var params = unit_getParams("searchArea");
			params.status = "EDIT_MAIL";
			params.query = "insertMailSolution";
			params.BUY_IDX = '${out.params.buyIdx}';
			params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
			params.MAIL_ALRM_TYPE = '';
			
			if( params.cart_item1 != null ) params.MAIL_ALRM_TYPE += params.cart_item1 + ',';
			if( params.cart_item2 != null ) params.MAIL_ALRM_TYPE += params.cart_item2 + ',';
			if( params.cart_item3 != null ) params.MAIL_ALRM_TYPE += params.cart_item3 + ',';
			
			params.MAIL_ALRM_TYPE = params.MAIL_ALRM_TYPE.substr(0, params.MAIL_ALRM_TYPE.length -1);
			var result = fn_DataAjax( params, "N" );
	
			params.status = "EDIT_SMS";
			params.query = "selectPaySmsList";
			var result = fn_DataAjax( params, "N" );
		 	
			var url = window.location.href;
			location.href = url.replace('email_solution_text', 'email_solution');
		} else {
			alert('상담이 완료된 상품입니다.');
		}
	}else alert('상담기간이 지났습니다.');

	
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

