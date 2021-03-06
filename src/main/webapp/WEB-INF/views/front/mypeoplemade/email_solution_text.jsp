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
			<button type="button" class="mo_history_on">???????????? ??????</button>
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
                    ??????????????? ?????? ?????? ?????? ????????? ???????????????.
                    <br>
                    <span class="ss_title NOT_CHK" style="font-size:15px;color:red;">
						?????? 3???~ 7??? ????????? ??????????????? ????????? ???????????????.
                	</span>
                </h1>
                <span class="ss_tag3">
                </span>
               <div class="register_box leave_box">
                    <div class="leave_text_box">
                        <div class="ooo_box">
                            <p class="ooo_item">
                                <input type="text" name="MAIL_TITL" class="ooo_input ooo_input_email" placeholder="??????" style="color:black;" maxlength="50">
                            </p>
                            
                            <p class="apply_form_item">
                            	<label for="afi03" class="afi03_t" style="margin-top: -10px;">???????????? ??????</label>
								<span class="maf_check_item2 maf_check_item2_w" >
<!-- 									<label for="cart_item1" class="form_check "> -->
<!-- 	                                    <input type="checkbox" id="cart_item1" name="cart_item1" value="EAT01"> -->
<!-- 	                                    <span class="form_check_mark"></span> -->
<!-- 	                                    <label for="service11" class="custom_sq_text2">?????????</label> -->
<!-- 	                                </label> -->
	                                <label for="cart_item2" class="form_check form_check_style">
	                                    <input type="checkbox" id="cart_item2" name="cart_item2" value="EAT02">
	                                    <span class="form_check_mark"></span>
	                                    <label for="service12" class="custom_sq_text2">SMS ??????</label>
	                                </label>
									<label for="cart_item3" class="form_check" style="    float: left;">
	                                    <input type="checkbox" id="cart_item3" name="cart_item3" value="EAT03">
	                                    <span class="form_check_mark"></span>
	                                    <label for="service13" class="custom_sq_text3">????????? ??????</label>
	                                </label>
								</span>
                            </p>
                            
                            <p class="ooo_item">
                                <textarea name="MAIL_CNTN" id="" class="ooo_textarea"  placeholder="????????????(?????? 1000????????? ?????? ???????????????)" style="color:black;" maxlength="1000"></textarea>
                            </p>
                           
                            <p class="ooo_item">
								<div class="fileArea">				
									<input type="file" id="MAIL_UUID_FILE" name="MAIL_UUID_FILE" style="display:none;margin-left:0px;" multiple maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" 
											maxsize_msg="???????????? ????????? ### MB??? ????????? ??? ????????????."
											maxcount_msg="?????? ????????? ### ?????? ?????? ??? ????????????."
											totalsize_msg="?????? ?????? ?????? ### MB??? ?????????????????????."
											onclick="imgIdValue = $(this).attr('id');"
									/>	
									<label class="file_input_label" for="MAIL_UUID_FILE" style="width: 180px; display: inline-block;">????????????</label>
														<span class="file_label_text" style="display: inline-block!important;">10MB????????? ????????? ???????????? ??? ????????????.</span>							
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
                         <button type="submit" id="email_btn" onclick="fn_BtnRegist();" class="account_btn2finish account_btn_border3">??????</button>
                         <button type="submit" class="account_btn2finish account_btn_border3" onclick="history.go(-2);" style="background-color:#fff !important;border-color:#fff;height: 40px;width: 90px;">??????</button>
                   </div>
             </div>
       </div>
       
       <div class="solution_history">
            <div class="sh_layer"></div>

            <div class="sh_inner">
                <h2 class="solution_history_title">
                    ????????????
                </h2>
                <button type="button" class="mo_history_off">??????</button>
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
<!--             <strong class="cart_complete_title">????????? ??????????????? ?????????????????????.</strong> -->
            
<!--             <table class="card_complete_table"> -->
<!--                 <tbody> -->
<!--                  <tr> -->
<!--                      <td>?????? 3???~ 7??? ????????? ??????????????? ????????? ???????????????. </td> -->
<!--                  </tr> -->
<!--             	</tbody> -->
<!--             </table> -->
            
<!--             <div class="card_complete_button_area"> -->
<!--               <button type="button" class="card_complete_button btn_white" onclick="location.href='/front/mypeoplemade/email_solution_detail'">??????????????????</button> -->
<!--               <button type="button" class="card_complete_button btn_cyan" onclick="location.href='/front/mypeoplemade/email_solution'">????????????</button> -->
<!--             </div> -->
<!--         </div> -->
<!--         </div> -->
<!--     </div> -->
<!-- </div> -->
</div><!-- // #wrap -->
<script>
//???????????? on


if( localStorage.getItem('frontLoginIdx') == null ) window.close();

	var doCnt = 0;
	var totalCnt = 0;
	var endDate;
	var front_email_user_idx = localStorage.getItem('frontLoginIdx');
	
	
    // ???????????? on
    $('.mo_history_on').on( 'click', function(){
        $('.solution_history').animate({right: '0'});
        $('.solution_history').addClass('active');
    });

    // ???????????? off
    $('.mo_history_off').on( 'click', function(){
        $('.solution_history').animate({right: '-100%'});
        $('.solution_history').removeClass('active');
    });
    
    //?????? ??????
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
		$('.ss_tag2').html('<span>#1:1???????????????</span><span>#'+val.P_CODE_NM+'</span><span>#'+val.M_CODE_NM+'</span>'); 
		$('.ss_progess_box').append('<span class="ss_time2_c">'+val.DOPRDT_CNT+'</span><span>??? / '+val.PRDT_CNT+'???</span><br><span class="ss_time2_day">'+val.PRDT_STR_DTM +' ~ '+val.PRDT_END_DTM+'??????</span>');
		persent = parseInt( (val.DOPRDT_CNT*1 / val.PRDT_CNT*1) * 100 );
		$('.ss_progess_box').append('<div class="ss_progess_bar"><span class="ssp_bar" style="width: '+persent+'%;"></span></div>');

		$('.ss_tag3').append('<span>????????? ????????? : '+val.M_USER_NM+' ??? 1:1?????? '+val.INFO_PRDT_TITL1+' '+val.INFO_PRDT_TITL2+'</span>');
// 		$('.ss_tag3').append('<span class="ss_time3_c">'+val.DOPRDT_CNT+'</span><span>??? / '+val.PRDT_CNT+'???</span>');
// 		$('.ss_tag3').append('<span class="ss_time3_day">?????? ?????? : ~'+val.PRDT_END_DTM+'??????</span>');

		$('.ss_tag4').html('<span>'+val.P_CODE_NM+'</span>??<span>'+val.M_USER_NM+'</span>');

		doCnt = val.DOPRDT_CNT;
		totalCnt = val.PRDT_CNT;
		endDate = new Date( val.PRDT_END_DTM );
	});
}


function fn_BtnRegist(){
	var sysdate = new Date();
	if ( sysdate <= endDate ) {
		if( doCnt < totalCnt ) {
			
			if($('[name=MAIL_TITL]').val().trim() == '' ) return alert('????????? ??????????????????.');
			if($('[name=MAIL_CNTN]').val().trim() == '' ) return alert('??????????????? ??????????????????.');
			
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
			alert('????????? ????????? ???????????????.');
		}
	}else alert('??????????????? ???????????????.');

	
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
				inTag += '			<span>'+ val.USER_NM +' ?????????</span>';
// 				inTag += '			??';
// 				inTag += '			<span>'+ val.DTM_DIFF +'</span>';
				inTag += '		</span>';
				inTag += '		<span class="sh_cate" style="font-size: 80%;">';
				inTag += '			<span>'+ val.PRDT_TYPE +'</span> ';
				inTag += '			<span>'+ val.MAIL_CNT +'???,</span>';
				inTag += '			<br><span >'+ val.BUY_COMP_DTM.substr(0, 10) + ' ~ ' + val.MAIL_END_DTM +'</span>';
				inTag += '		</span>';
				inTag += '	</div>';
				inTag += '	<div class="sh_content">';
				if ( val.REVI_CNTN != undefined && val.REVI_CNTN.length != 0 ) {
					inTag += '		<div class="sh_img"></div>';
					inTag += '		<p class="sh_text"></p>';
					inTag += '	<span>'+ val.REVI_CNTN+'</span>';
				}
				inTag += '		<br><span style="display:block;margin-top:10px;">?????????: '+ val.SYSDATE+'</span>';
				inTag += '	</div>';
				inTag += '</div>';
				
			});

// 	        $('#reviList').append( inTag );
		}else{
			inTag += '<div> ??????????????? ????????????.';
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

