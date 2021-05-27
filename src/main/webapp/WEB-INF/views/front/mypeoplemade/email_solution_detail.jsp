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


.white_select{
    font-size:12px;
    height: 28px;
    padding-left:10px;
    padding-right:30px;
    padding-bottom:2px;
}

.board_detail_content{
    overflow-y: auto;
    max-height: 100px;
}

#endDATE{
	color: #909090!important;
 	font-size: 12px;
 	display: block;
 	padding-bottom: 10px;
}
@media screen 
and (min-device-width : 800px)
and (max-device-width : 1200px) {
	.NOT_CHK{
	    margin-left: 40%;
	}
}
.account_btn {font-size: 15px;}
@media screen and (max-width: 1250px){
	.header_top {
	    /* min-height: inherit; */
	    min-height: 58px;
	    padding: 20px 0 15px;
	}
	#endDATE{
	 	font-size: 11px;
	}
	.board_detail_table .date {
    padding-top: 10px; 
	}
	.mltd_state {
    bottom: auto; 
    line-height: 20px; 
    margin: 15px 15px ; 
    font-size: 13px;
	}
	.account_btn {font-size: 13px;}
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
.board_table td.date, .board_table .mltd_state, .board_detail_table  { color: white;} 
.board_comment .bc_title{ display: inline-block; }
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

.mltd_state {
    border: 1px solid #444;;
    position: absolute;
    top: 0%;
    left: 100%;
    color: white;
    margin-top: 0;
    margin-left: 20px;
}

.board_detail_content .file { margin-top: 0px!important; vertical-align: top; }
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
        
        
		<div class="solution_content" >
			<a type="button" class="pop_close" onclick="history.go(-1);"></a>
			<div class="ss_title_box3">
                <h1 class="ss_title">
                </h1>
                <span class="ss_tag3">
                    <span>사용 가능한 1:1이메일 코칭권 :</span>
                </span>

				<button type="button" class="prdt_apply_btn_e" data-popup="applyStep1Pop" onclick='location.href="${unit.url("/front/mypeoplemade/email_solution_notice", "email_solution_notice", out.params.cateIdx, out.params.prdtCd, "", out.params.buyIdx )}";'>이메일 코칭권 사용하기</button>
				<div >
 					<div class="board_detail_box board_detail_box_master">
                        <table class="board_detail_table">
                            <colgroup>
                                <col width="10%">
                                <col width="75%">
                                <col width="15%">
                            </colgroup>
                            <thead >
                                <tr>
                                    <th colspan="3" style="padding: 20px 20px 0 20px;">
                                        <span class="board_cate" style="display: inline-block; position: relative; max-width: calc(100% - 120px);width:100%;" ></span>
	                                    <p class="date" style="color:white !important;"></p>
                                        <p class="board_title"></p>
                                    </th>
                                </tr>
                            </thead>
                            <!-- 컨텐츠 내용  -->
                            <tbody>
                                <tr>
                                    <td colspan="3" style="    padding: 10px 20px;">
                                        <div class="board_detail_content" style="word-break: break-word;height: auto;    white-space: pre-line;max-height: 200px;"><p></p></div>
                                        <div class="board_detail_content" style="margin-top: 20px;">
<!--                                         <div class="" > -->
                                            <p></p> 
                                            <p class="file" style="display: inline-block;">
												<input id="MAIL_UUID" name="MAIL_UUID" type="hidden" />
												<div class="fileArea" style="display: inline-block;">	
		                                            <input type="checkbox" id="service28" class="custom_sq_check">
	<!-- 	                                            <label for="service28" class="custom_sq_label2"></label> -->
<!-- 		                                            <label for="service28" class="custom_sq_text2"><span class="mastetdot">·</span>이력사항</label> -->
	<!-- 	                                            <input type="text" class="maf_input mo_file_input">			 -->
													<input type="file" id="MAIL_UUID_FILE" name="MAIL_UUID_FILE" style="display:none;margin-left:0px;" multiple maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" 
															maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."
															maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."
															totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."
															onclick="imgIdValue = $(this).attr('id');"
													/>	
<!-- 													<label class="file_input_label" for="MAIL_UUID_FILE" >파일선택</label> -->
	<!-- 													<span class="file_possible" style="color:red !important;">( 모든 파일 구분, 다중 선택 가능 )</span>							 -->
<!-- 													<span class="pdfword">  *PDF파일, DOC파일 가능</span> -->
													<div class="fileList" id="MAIL_UUID_FILEList" style="cursor: pointer;"></div>
													<div id="MAIL_UUID_FILEListClone" style="display:none;">
														<div>
															<span class="fileName"></span> (<span class="fileSize"></span> MB)
<!-- 															<span class="close">X</span> -->
														</div>
													</div>											
												</div>
                                            </p>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr class="board_comment" style="margin-top: 18px;">
                                    <td colspan="3" style="    padding: 20px;">
                                        <span class="bc_title">답변내용</span><span id="endDATE"></span>
                                        <div class="board_comment_text" style="padding: 20px; white-space: pre-line;"><p></p></div>
                                    </td>
                                </tr>
                                <tr class="board_btn_row">
                                    <td colspan="3">
                                        <a href="javascript:;" class="account_btn eSolutionIndexBtn FRONT" onclick="history.go(-1);" style="margin-bottom: 20px;display:none;">목록</a>
                                        <a href="javascript:;" class="account_btn eSolutionIndexBtn MNG" onclick="fn_BtnRegist();" style="margin-bottom: 20px;display:none;">답변</a>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
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
	var mailIdx = '';
	var doCnt = '';
	var pdrtCnt = '';
	var endDate;
	var parentUrl = ""+opener.document.location;
	
	if( ""+parentUrl.indexOf('/mng/') > -1 ) $('.prdt_apply_btn_e').remove();

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
    	selectFrontMypeoplemadeEmailSolutionDetail();
    	fn_ChatInfo();
    	fn_MastReviList();
    	$( '#now_loading' ).hide();
    });

    function selectFrontMypeoplemadeEmailSolutionDetail(){

    	var params = new Object();
    	params.status = 'LIST';
    	params.query = "selectFrontMypeoplemadeEmailSolutionDetail";
    	params.BUY_IDX = '${out.params.buyIdx}';
    	params.frontLoginIdx = localStorage.getItem('frontLoginIdx');
    	params.mngLoginIdx = localStorage.getItem('mngLoginIdx');
    	params.MAIL_IDX = '${out.params.dataIdx}';

    	var result = fn_DataAjax2( params );
    	var jsonData = result.out.detail.data;
    	jsonData = ConvertHtmltoSystemSource( jsonData );
   	 
    	if ( jsonData.length > 0 ) {
    		$.each(jsonData, function( key , val ){
    			imgIdValue = 'MAIL_UUID_FILE';
    			setUuid( val.MAIL_UUID );
    			unit_fileGet( imgIdValue , "fn_fileUpload");
    			mailIdx = val.MAIL_IDX;
    			
    			// 첨부파일 없으면 클립모양숨기기
				if ( val.MAIL_UUID == "" || val.MAIL_UUID == null || val.MAIL_UUID == undefined ) {
					$('.file').hide();
				}
				
    			$('.board_detail_content p').eq(0).html( val.MAIL_CNTN );
    			
    			// 답변 박스 넣기
    			if (val.MAIL_REPL != undefined && val.MAIL_REPL != null && val.MAIL_REPL != '' ) {
    				$('.board_cate').html( val.MAIL_TITL + '<span class="mltd_state" style="width: 90px;">답변완료</span>' );
    				
    		    	params.status = 'EDIT';
    		    	params.query = "updateFrontMypeoplemadeEmailReadYn";
    		    	params.MAIL_IDX = val.MAIL_IDX;
    		    	params.frontLoginIdx = localStorage.getItem('frontLoginIdx');
    		    	var result = fn_DataAjax2( params );
				}else{
    				$('.board_cate').html( val.MAIL_TITL + '<span class="mltd_state" style="width: 90px;">미답변</span>' );
				}
    			
    	    	if( ""+parentUrl.indexOf('/mng/') > -1 ) {
    	    		if( val.MAIL_REPL == null ||  val.MAIL_REPL == '' ){
    	    			$('.board_comment_text').append('<p class="ooo_item"><textarea name="MAIL_REPL" id="" class="ooo_textarea"  placeholder="답변을 적어주세요." style="height:130px;color:white;"></textarea></p>');
    	    			$('.FRONT').remove();
    	    			$('.MNG').show();
    	    		} else {
    	    			$('.board_comment_text p').html( val.MAIL_REPL );
    	    			if( val.MAIL_REPL != null ) $('#endDATE').text( val.SYS_MOD_DTM );
    	    			$('.MNG').remove();
    	    			$('.FRONT').show();
    	    		}
    	    	} else {
	    			$('.board_comment_text p').html( val.MAIL_REPL );
	    			if( val.MAIL_REPL != null ) $('#endDATE').text( val.SYS_MOD_DTM );
	    			$('.MNG').remove();
	    			$('.FRONT').show();
    	    	}
    	    	
    			$('.date').text( val.SYS_REG_DTM );
    		});
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
    		$('.ss_progess_box').append('<span class="ss_time2_c">'+val.DOPRDT_CNT+'</span><span>회 / '+val.PRDT_CNT+'회</span><br><span class="ss_time2_day">'+val.PRDT_STR_DTM +' ~ '+val.PRDT_END_DTM+'</span>');
    		persent = parseInt( (val.DOPRDT_CNT*1 / val.PRDT_CNT*1) * 100 );
    		$('.ss_progess_box').append('<div class="ss_progess_bar"><span class="ssp_bar" style="width: '+persent+'%;"></span></div>');
    		 
    		$('.ss_tag3').append('<span class="ss_time3_c">'+(val.DOPRDT_CNT)+'</span><span>회 / '+val.PRDT_CNT+'회</span>');
    		$('.ss_tag3').append('<span class="ss_time3_day">사용 기간 : '+val.PRDT_STR_DTM +' ~ '+val.PRDT_END_DTM+'</span>');
    		
    		$('.ss_tag4').html('<span>'+val.P_CODE_NM+'</span>·<span>'+val.M_USER_NM+'</span>');
    		
    		if( val.DOPRDT_CNT == val.PRDT_CNT ) $('.prdt_apply_btn_e').hide();
    		doCnt = val.DOPRDT_CNT;
    		pdrtCnt = val.PRDT_CNT;
    		
    		endDate = new Date(val.PRDT_END_DTM);
    		
    		var sysdate = new Date();
    		
    		if ( endDate <= sysdate ) $('.prdt_apply_btn_e').remove();
    	});
    }


    function fn_BtnRegist(){
   		var params = unit_getParams("searchArea");
   		params.status = "EDIT_MAIL";
   		params.query = "insertMailSolution";
   		params.BUY_IDX = '${out.params.buyIdx}';
   		params.mailIdx = mailIdx;
       	params.mngLoginIdx = localStorage.getItem('mngLoginIdx');
		params.masterChk = "MASTER";
		params.MAIL_REPL = $('[name=MAIL_REPL]').val();
   		var result = fn_DataAjax( params, "N" );

// 	 	결제완료 SMS 통보
		params.status = "EDIT_SMS";
		params.query = "selectPaySmsList";
		var result = fn_DataAjax( params, "N" );
		
		if( doCnt == pdrtCnt ) {
//	 	 	결제완료 SMS 통보
			params.status = "EDIT_SMS";
			params.query = "selectPaySmsList";
			params.prdtOver = '1';
			var result = fn_DataAjax( params, "N" );
		}

   		var url = window.location.href;
   		location.href = url.replace('email_solution_detail', 'email_solution');
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
    				imgIdValue = val.USER_UUID_NM+'_FILE';
    				setUuid( val.USER_UUID );
    				unit_fileGet( imgIdValue , "fn_fileUpload");

    				inTag += '<div class="sh_item" style="cursor:pointer;" onclick="fn_history_forward(\''+val.MOVE_URL+'\')">';
    				inTag += '	<div class="sh_title '+( val.BUY_IDX =='${out.params.buyIdx}' ? 'nowHist' :'' )+' ">';
    				inTag += '		<span class="sh_thumb" style="background-image: url('+$('#imgTag').val()+');"></span>';
    				inTag += '		<span class="sh_name">';
    				inTag += '			<span>'+ val.USER_NM +' 마스터</span>';
//     				inTag += '			·';
//     				inTag += '			<span>'+ val.DTM_DIFF +'</span>';
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

//     	        $('#reviList').append( inTag );
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















