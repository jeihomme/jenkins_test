<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'chat_solution', 'ajax')}" />

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
.solution_content {
    width: 100%;
    height: calc(100vh - 200px);
}
}
</style>

<div id="wrap" class="chat_wrap">
    <div id="container" class="solution_container">
        <div class="solution_sidebar">
		    <div class="header_top">
		    	<h1 class="header_logo" style="float: none;"><a href="javascript:;" style="margin: auto;">PEOPLEMADE</a></h1>
		
		    </div>
            <button type="button" class="mo_history_on">히스토리 보기</button>

            <div class="ss_title_box" style="height: 210px;">
                <h1 class="ss_title">
                </h1>
                <span class="ss_tag">
                </span>
				
				<p class="ss_tag4">
                </p>
	
	
                <div class="ss_progess_box" style="padding-top: 0;">
                    <span class="ss_time chat_time">
                    </span>
                    <div class="ss_progess_bar">
                        <!-- 상태바 % -->
                        <span class="ssp_bar" style="width: 0%;"></span>
                    </div>
                </div>

                <button type="button" class="mo_acco_btn"></button>
            </div>

            <div class="ss_acco_box">
                <div class="ss_acco acco_box active">
                    <div class="acco_title">
                        <span class="ss_acco_title">참여중인 사람</span>
                        <button type="button" class="acco_toggle_single"></button>
                    </div>
                    <div class="acco_content joinList" style="display: block; height: auto;"></div>
                </div>
                <div class="ss_acco acco_box">
                    <div class="acco_title">
                        <span class="ss_acco_title">다운로드 목록</span>
                        <button type="button" class="acco_toggle_single"></button>
                    </div>
                    <div class="acco_content downlist" style="overflow-y: auto;">
                    
					<div class="fileArea">
						<div class="fileList" id="CHAT_UUID_FILEList"></div>
						<div id="CHAT_UUID_FILEListClone" style="display:none;">
<!-- 							<div> -->
							<div class="acco_content_item ss_info_box">
								<button type="button" class="btn-data" style="color:#fff; background-color:transparent;">
									<i class="ico-data ico-data_color" style="margin-right:10px; "></i><span class="fileName"></span>
								</button>
							</div>
						</div>											
					</div>
                    </div>
                </div>
            </div>
        </div><!-- // .solution_sidebar -->

        <div class="solution_content">
        	<div id="CHAT_TEXT_CLONE" style="display:none;">
        		<div class="chat_item">
                    <span class="chat_thumb" style="background-image: url(/resources/assets/images/sub/profile_default_img.png)"></span>
                    <div class="chat_content">
                        <span class="chat_name">마스터</span>
                        <div class="chat_text">
                            <p class="chat_msg"></p>
                            <div class="chat_info">
                                <span class="date">05:00</span>
                                <span class="date"></span>
                            </div>
                        </div>
                    </div>
                </div>
        	</div>
            <div class="chat_box" id="CHAT_LIST"></div>

            <div class="chat_typing_box"> 	
                <textarea name="chatText" id="chatText" class="chat_textarea" placeholder="메시지를 입력해 주세요." onkeypress='if(event.keyCode==13) insertText("T");'></textarea>
                <div class="emotion_list"></div>
                <div class="ct_bottom_box">
                    
					<div class="fileArea">
						<input type="file" id="CHAT_UUID_FILE" name="CHAT_UUID_FILE" style="display:none;margin-left:0px;" multiple maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" 
								maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."
								maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."
								totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."
								onchange="imgIdValue=$(this).attr('id');insertText('F');"
						/>
<!-- 						<button type="button" class="file_btn"></button> -->
						<label class="btn btn-sm btn-outline-secondary" for="CHAT_UUID_FILE" style="display:none;"></label>
						<input id="CHAT_UUID" name="CHAT_UUID" type="hidden" />
					</div>
					
                </div>
                <button type="button" class="ct_submit emotion_btn "></button>
                <button type="button" class="ct_submit file_btn " onclick="$('#CHAT_UUID_FILE').trigger('click');"></button>
                <button class="ct_submit" onclick="insertText('T');"></button>
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


var var_chat_room = '${out.params.buyIdx }';
var var_user_idx = '';
var var_user_type = '';

var frontChatIdx = '${sessionScope.frontChatIdx }';
var frontChatType = '${sessionScope.frontChatType }';
var mngChatIdx = '${sessionScope.mngChatIdx }';
var mngChatType = '${sessionScope.mngChatType }';

console.log('frontChatIdx : ' + frontChatIdx);
console.log('frontChatType : '+frontChatType);
console.log('mngChatIdx : '+mngChatIdx);
console.log('mngChatType : '+mngChatType);

var mySession = '';
var yourSession = '';
var sessionList = '';
var sessionArr = '';
var downloadCnt = 0;

console.log( frontChatIdx );

//로컬용
// var EMOTION_FILE = '202102021746476d19b64df17b40b4a1140116b53f8c30';
// 서버용
var EMOTION_FILE = '202102021906012d08666d62494b4d933899749b897677';
var EMOTION_FILE_NM = 'EMOTION';
var fileArr = [];
var fileLinkArr = [];
var fileExistsArr = [];
var emotionCnt = 0;

var timeRunVal = '';
var timeRunCnt = 0;

var timeStrVal = '';
var timeStrCnt = 0;
var chatUuid = '';
// var $clone = $("#CHAT_TEXT_CLONE").clone(0);

$(function(){
	
// 	console.log('-----------------------------------------');

	if( localStorage.getItem("frontLoginIdx") == null ) {
		var_user_idx =  localStorage.getItem("mngLoginIdx");
		var_user_type = localStorage.getItem("mngUserType");
	} else {
		var_user_idx =  localStorage.getItem("frontLoginIdx");
		var_user_type = localStorage.getItem("frontUserType");
	}

	fn_ChatInfo();
	fn_MastReviList();
	
	unit_wsOpen(var_chat_room, "selectChatList");

	
	if ( var_user_type != 'A' ) {
		setTimeout(function(){
					
			if( localStorage.getItem("frontLoginIdx") == null ) $('#chatText').val( $('.ssp_name').eq(0).text()+'님이 입장하셨습니다.');
			else $('#chatText').val( $('.ssp_name').eq(1).text()+'님이 입장하셨습니다.');
			insertText('T');
			
		}, 2000);
	}
	

    var end = setInterval(endFn, 1000);
	var seconds = 0;
	var minutes = 0;
	var persent = 0;
		
    function endFn() {
    	var hours = ((timeStrVal/60)+'').slice(0,2);
    	var nowHours = new Date().getHours();
    	
    	console.log( hours + '< ' + nowHours);
    	
    	if( hours == nowHours ) {
    		seconds += 1;
    		minutes = parseInt( seconds/60 );
    		persent = parseInt( (minutes / timeRunVal*1) * 100 );
    		$('.ssp_bar').css('width', '' + persent + '%');
    	}
    }
    
        var selectChatListRoop = setInterval(selectChatList, 10000);
    $( '#now_loading' ).hide();
});


$('.emotion_btn').click(function(){
	if( $('.emotion_list').css('display') == 'none' ) {
		$('#chatText').hide();
		$('.emotion_list').show();

		if( emotionCnt == 0 ) {
			var inTag = '';
			setUuid( EMOTION_FILE );
			unit_fileGet( EMOTION_FILE_NM+'_FILE' , "fn_fileUpload");

			$.each( fileExistsArr, function(key,val){
				inTag += '<img src="'+ fileExistsArr[key] +'" style="width:20px;height:20px;" onclick="$(\'#chatText\').val( \''+ fileExistsArr[key] +'\' );insertText( \'P\' );"/>';		
			});

			$('.emotion_list').append( inTag );
			emotionCnt = 1;
		}
		
	} else {
		$('#chatText').show();
		$('.emotion_list').hide();
	}
});

function insertText( TYPE ){
	if( TYPE == 'F' ) $('#chatText').val( '*파일을 첨부하였습니다.\n (다운로드 목록 확인)' );
	
	if ( $.trim($('#chatText').val()) != ""){
		var params = new Object();
		params.USER_TYPE = var_user_type;
		params.USER_IDX = var_user_idx;
		params.CHAT_ROOM = var_chat_room;
		params.CHAT_MSG = $.trim($('#chatText').val());
		
		if( TYPE == 'F' ) {
			params.CHAT_UUID = $('#CHAT_UUID').val();
			$('.acco_toggle_single').parents('.acco_box').removeClass('active').children('.joinList').slideUp();
			$('.acco_toggle_single').parents('.acco_box').children('.acco_content:not(.joinList)').slideDown().closest('.acco_box').addClass('active');
		}
		
		params.status = "WRITE";
		params.CHAT_TYPE = TYPE;
		
		params.query = "insertFrontChat";
		
		var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
		if ( unit_isComplete(result) ){
			unit_wsSend();
			$('#chatText').val("");
			$("#CHAT_LIST").scrollTop(99999999);
			$('#chatText').focus();
			selectChatList();
		} else {
			alert("입력에 실패하였습니다.");
		}
	}

	$("#CHAT_LIST").scrollTop(99999999);
}

function selectChatList( SCROLL ){
	var params = new Object();
	params.status = "LIST";
	params.query = "selectFrontChatList";
	params.CHAT_ROOM = var_chat_room;
	
	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var jsonData = result.out.detail.data;
	var donwloadCntList = 0;
	var chatIdx = 0;

	if ( var_user_type == 'A' ) {
		var notAdminVar = true;
	}
	
	if ( unit_isComplete(result) ) {
		if( jsonData.length > 0 ) {
			$("#CHAT_LIST").empty();
			$.each(jsonData, function(index, value){
				var $clone = $("#CHAT_TEXT_CLONE").clone(0);
				var chat_list_flag = false;

				 if( value.USER_IDX != var_user_idx ) {
					 if( chatIdx != 0 ) {
						var params = new Object();
						params.status = "UPDATE";
						params.CHAT_ROOM = var_chat_room;
						params.USER_IDX = chatIdx;
						params.query = "updateFrontChat";
						var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
					 } else chatIdx = value.USER_IDX;
				 }
				 
				$("#CHAT_LIST .chat_item").each( function(){
					if ( $(this).attr("idx") == value.IDX ) chat_list_flag = true;
				});
				
				if ( var_user_type == 'A' ) {
					if ( notAdminVar ) {
						if(value.USER_TYPE == 'M'){
							var_user_type = value.USER_TYPE;
							var_user_idx = value.USER_IDX;
							notAdminVar = false;
						}
					}					
				}
				
// 				if ( chat_list_flag == false ) {
					$clone.find(".chat_item").attr("idx", value.IDX);
	
					if (value.USER_TYPE == var_user_type && value.USER_IDX.toString() == var_user_idx){ 					
						$clone.find(".chat_item").addClass("local");
// 						alert( value.USER_TYPE + ', ' + var_user_type  + ' : ' + value.USER_IDX.toString()  + ', ' + var_user_idx.toString() );
					}
					
					if (value.USER_TYPE == var_user_type && value.USER_IDX.toString() == var_user_idx.toString()){ 					
						$clone.find(".chat_text").addClass("local");

						if( value.CHAT_READ_YN == 'Y' ) {
							$clone.find(".date").eq(1).html( ' 읽음' );
						} else {
							$clone.find(".date").eq(1).html( ' 안 읽음' );
							$clone.find(".date").eq(1).css('color','red');
						}
						
					} else { 					
						$clone.find(".chat_text").addClass("other");
					}
					
					$clone.find(".chat_name").html(value.USER_NAME);
					
					if( value.CHAT_TYPE == 'P') {
						$clone.find(".chat_msg").html( '<img src="'+ value.CHAT_MSG +'" style="width:30px;height:30px;" />' );
					} else if( value.CHAT_TYPE == 'F') {
						$clone.find(".chat_msg").html(value.CHAT_MSG.replace("\n","<br>"));
						donwloadCntList++;
					} else {
						$clone.find(".chat_msg").html(value.CHAT_MSG.replace("\n","<br>"));
					} 
					
					$clone.find(".date").eq(0).html( value.CHAT_DT.substring(8,10)+"："+value.CHAT_DT.substring(10,12) );
					
					$("#CHAT_LIST").append($clone.html());
	
					setUuid( value.USER_UUID );
					unit_fileGet( "USER_UUID_FILE" , "fn_fileUpload");
						 
					if( value.USER_UUID != null || value.USER_UUID != '' )
						$("[idx="+value.IDX+"] > span").css({"background-image":"url("+$('#imgTag').val()+")"});

					if( value.CHAT_TYPE == 'F') {
						//파일목록 불러오기
						if( value.CHAT_UUID != '' ) chatUuid = value.CHAT_UUID;
					}
// 				}
					if ( value.CHAT_TYPE == 'E' && index == jsonData.length-1 ) {
						$('.chat_typing_box').hide();
					}
			});
		}

		$('#CHAT_UUID').val( chatUuid );
		if( chatUuid == '' ) $('#CHAT_UUID').val( fn_GetUuid() ); 
		setUuid( $('#CHAT_UUID').val() );
		imgIdValue = "CHAT_UUID_FILE";
		unit_fileGet( imgIdValue, "fn_fileUpload");
		
// 		if( SCROLL != '' || SCROLL != null || SCROLL+'' != 'undefined' ) {
	
// 			alert( SCROLL.length );
// 			alert( $('.ssp_name').eq(1).text() );
			
		if( SCROLL != '' || SCROLL != null ) {
// 			$("#CHAT_LIST").scrollTop(99999999);
			$('#chatText').focus();

			if( typeof SCROL != 'undefined' ) {
				if( SCROLL.data != null ) {
					if( SCROLL.data != '' ){
						sessionArr = SCROLL.data.split(',');
						if( sessionArr[0] == 'join') mySession = sessionArr[1];
						if( sessionArr[0] == 'sessionList') sessionList = sessionArr;
					}
				}
			}
			
		}
		
		if( donwloadCntList != 0 ) {
			if( downloadCnt < donwloadCntList ) {
				downloadCnt = donwloadCntList;
// 				$('.acco_toggle_single').parents('.acco_box').toggleClass('active').children('.acco_content').slideToggle();
				$('.acco_toggle_single').parents('.acco_box').removeClass('active').children('.joinList').slideUp();
				$('.acco_toggle_single').parents('.acco_box').children('.acco_content:not(.joinList)').slideDown().closest('.acco_box').addClass('active');
			}
		}
	}

	$('#chatText').val("");
	fn_ChatInfo();

}

function fn_ChatInfo(){

	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectFrontMypeoplemadePrdtDetail";
	params.BUY_IDX = var_chat_room;
	params.FRONT_LOGIN_IDX = var_user_idx;
	
	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var jsonData = result.out.detail.data;
	var inTag = '';
	var chatIdx = 0;
	
	$('.joinList').empty();
	
	$.each(jsonData, function(key,val){
		
		if (frontChatIdx == '') {
			frontChatIdx = val.USER_IDX;
		}
		
		if( localStorage.getItem("frontLoginIdx") != null ) chatIdx = val.M_USER_IDX;
		else chatIdx = val.USER_IDX;
	
		$('.ss_title').html(val.INFO_PRDT_TITL1+'<br class="pc_show">'+val.INFO_PRDT_TITL2);
		$('.ss_tag').html('<span>#1:1채팅코칭 #'+val.P_CODE_NM+' </span><span> #'+val.M_CODE_NM+'</span>'); 
		$('.ss_time').html('<span>'+val.PRDT_STR_DTM2+', '+val.TIME_STR+', '+val.TIME2+'</span>분<span class="gray">·</span><span>'+val.PRDT_PRIC_REAL+'</span>원');
		
		$('.ss_tag4').html('<span>'+val.P_CODE_NM+'</span>·<span>'+val.M_USER_NM+'</span>');
		
		console.log( jsonData );
		
		if( timeRunCnt == 0 ) {
			timeRunVal = val.TIME2;
			timeRunCnt = 1;
		}

		if( timeStrCnt == 0 ) {
			timeStrVal = val.TIME1;
			timeStrCnt = 1;
		}
		
        inTag += '<div class="acco_content_item ss_info_box">';

		setUuid( val.M_USER_UUID );
		unit_fileGet( val.M_USER_UUID_NM+'_FILE' , "fn_fileUpload");
        if( val.M_USER_UUID == null || val.M_USER_UUID == '' ) inTag += '    <span class="ss_thumb" style="background-image: url(/resources/assets/images/sub/profile_default_img.png);"></span>';
        else inTag += '    <span class="ss_thumb" style="background-image: url('+$('#imgTag').val()+');"></span>';
        
        inTag += '    <div class="ss_people_info">';
        
        if( localStorage.getItem("frontLoginIdx") == null )
       		inTag += '        <span class="ssp_name mngIdx" session="'+mySession+'" mngIdx="'+val.USER_IDX+'">'+val.M_USER_NM+'<span class="ssp_cate_light2"></span></span>';
       	else 
       		inTag += '        <span class="ssp_name mngIdx" session="'+yourSession+'" mngIdx="'+val.USER_IDX+'">'+val.M_USER_NM+'<span class="ssp_cate_light2"></span></span>';
       		
        inTag += '        <span class="ssp_cate">마스터</span>';
        inTag += '    </div>';
        inTag += '</div>';
		
        inTag += '<div class="acco_content_item ss_info_box">';

		setUuid( val.USER_UUID );
		unit_fileGet( val.USER_UUID_NM+'_FILE' , "fn_fileUpload");
        if( val.USER_UUID == null || val.USER_UUID == '' ) inTag += '    <span class="ss_thumb" style="background-image: url(/resources/assets/images/sub/profile_default_img.png);"></span>';
        else inTag += '    <span class="ss_thumb" style="background-image: url('+$('#imgTag').val()+');"></span>';
        
        inTag += '    <div class="ss_people_info">';

        if( localStorage.getItem("frontLoginIdx") == null )
        	inTag += '        <span class="ssp_name userIdx" session="'+yourSession+'" userIdx="'+val.USER_IDX+'">'+val.USER_NM+'<span class="ssp_cate_light2"></span></span>';
        else
        	inTag += '        <span class="ssp_name userIdx" session="'+mySession+'" userIdx="'+val.USER_IDX+'">'+val.USER_NM+'<span class="ssp_cate_light2"></span></span>';
        
        inTag += '        <span class="ssp_cate">나</span>';
        inTag += '    </div>';
        inTag += '</div>';
        
        $('.joinList').append( inTag );
	});
    
	var params = new Object();
	params.status = "EDIT";
	params.CHAT_ROOM = var_chat_room;
	params.USER_IDX = chatIdx;
	params.query = "updateFrontChat";
	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	 
	//파일목록 불러오기
	if( chatUuid == '' ) $('#CHAT_UUID').val( fn_GetUuid() ); 
	setUuid( $('#CHAT_UUID').val() );
	imgIdValue = "CHAT_UUID_FILE";
	unit_fileGet( imgIdValue, "fn_fileUpload");
	
	$.each(sessionList, function(key,val){
		if( key > 0 ) {
			if( val != mySession ) yourSession = val;
			$('.ssp_name').each(function(){
				if( $(this).attr('session') == val ) {
					$(this).children('span').removeClass('ssp_cate_light2');
					$(this).children('span').addClass('ssp_cate_light');
				}
			});
		}
	});
	
// 	if( sessionList.length > 2 ) {
// 		if( ! $('.chat_item:last').hasClass('local') ) {
	        if( localStorage.getItem("frontLoginIdx") != null ) {
	        	$('.userIdx > span').removeClass('ssp_cate_light2');
	        	$('.userIdx > span').addClass('ssp_cate_light');
	        } else {
	        	$('.mngIdx > span').removeClass('ssp_cate_light2');
	        	$('.mngIdx > span').addClass('ssp_cate_light');
	        }
// 		}
// 	}
}

function fn_MastReviList(){
	var params = new Object();
	params.status = "LIST";
	params.query = "selectFrontReviList";
	params.cateIdx = cateIdx; 
	params.frontLoginIdx = frontChatIdx;
	params.prdtCd = 'CN'; 
	
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
				inTag += '	<div class="sh_title '+( val.BUY_IDX == var_chat_room ? 'nowHist' :'' )+' ">';
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
				
				inTag += '		<br><span class="sh_cate" style="font-size: 80%;">';
				inTag += '			<span>'+ val.PRDT_STR_DTM +' '+ val.TIME_STR +'</span> ';
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























