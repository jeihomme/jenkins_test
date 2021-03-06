<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" />

<style>
#screen{
	display:none;
	position: absolute;
    width: 100%;
    height: 200%;
    background-color: black;
    opacity: 0.6;
    z-index:9999;
}

.mnc_btn_box::before {
    content: '';
    position: absolute;
    top: -14px;
    left: 50%;
    width: 20px;
    height: 19px;
    background: url(/resources/assets/images/icon/icon_talk_tail.png) center center / cover no-repeat;
    transform: translateX(-50%) ;
} 
.mobile{display: none;}
@media(max-width : 1310px){
	.mnc_btn_box::before {
		left: 20%;
	}
	.mobile { display: block;}
	.seccession_btn {
		color: #000;
	    height: 40px;
	    line-height: 38px;
	    font-size: 13px;
	    max-width: 100px;
	}
}


@media screen and (max-width: 960px){
	.lnb_item:first-child {
	    padding-left: 0px;
	}
}
.fn_delKeyword{ margin-left: 3px; color: white; cursor: pointer; }

.userSecessionBtn{ margin-top: 30px; }
.userSecessionBtn span{ padding: 15px; cursor: pointer; background-color: #141414; border-radius: 5px; }

.rp_text_area { float: none; width: 100%; }

.seccession_btn {   
	display: block;
    width: 100%;
    height: 40px;
    line-height: 40px;
    color: #000;
    background-color: #26f1d4;
    border-radius: 5px;
    font-size: 17px;
    text-align: center;
    max-width: 160px;
    margin: 0 auto;
    margin-bottom: 6px;
}
@media screen and (max-width: 1250px){
	.btn_h40 {
	    height: 40px!important;
	}
}
select::-ms-expand {display:none}
</style>

    <div id="container">
        <div class="sub-inner">
            <div class="profile">
                <div class="img-area" style="position: relative; overflow: unset;">
                    <label for="USER_UUID_FILE" class="myinfo_thumb_label"></label>
                </div>
                <div class="text-area">
                    <strong></strong>
                    <div class="btn-box">
               <button type="button" class="" onclick="location.href='/front/mypeoplemade/myinfo' ">????????? ??????</button>
                        <div class="btn-profile-more">
                            <button type="button" class="btn-more"><i class="ico-profile-more"></i></button>
                            <ul class="more-menu">
                                <li>
                                    <a href="/front/mypage/payment">????????????</a>
                                </li>
                                <li>
                                    <a href="/front/mypage/mycoupon">??? ??????</a>
                                </li>
                                <li>
                                    <a href="/front/mypage/refund">??????/????????????</a>
                                </li>
                                <li>
                                    <a href="/front/mypeoplemade/myinfo">???????????????</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <p class="profile-info" style="white-space:pre;">
                    </p>
                </div>
            </div>
            <div class="lnb" style="margin-top:20px;">
                <ul class="vod-nav">
                    <li class="lnb_item" style="    display: inline-flex;"><a href="/front/mypeoplemade/network" style="    margin-right: 0;">?????????</a><a href="/front/mypeoplemade/network_list" style="    padding-top: 2px;"><span class="text-point text-point-small"><span>0</span>???</span></a></li>
                    <li class="lnb_item"><a class="lnbExtraClass" href="/front/mypeoplemade/coaching?1">VOD<span class="text-point text-point-small"><span></span>???</span></a></li>
                    <li class="lnb_item"><span class="hm_mail_alarm hm_mail_alarm_mypeople"></span><a href="/front/mypeoplemade/coaching?2">1:1??????<span class="text-point text-point-small"><span></span>???</span></a></li>
                    <li class="lnb_item"><a class="lnbExtraClass" href="/front/mypeoplemade/coaching?3">LIVE CLASS<span class="text-point text-point-small"><span></span>???</span></a></li>
                    <li class="lnb_item"><a href="/front/mypeoplemade/follow">?????????<span class="text-point text-point-small"><span></span>???</span></a></li>
                    <li class="lnb_item is-active"><a href="/front/mypeoplemade/myinfo">??? ????????????<!-- <span class="text-point"></span> --></a></li>
                </ul>
            </div>
                 
                <div class="mypage_box">
                    <div class="myinfo_box" id="searchArea">
                    
                        <input type="file" id="USER_UUID_FILE" name="USER_UUID_FILE" class="file_input" style="display:none; margin-left:0px;" maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" 
								maxsize_msg="???????????? ????????? ### MB??? ????????? ??? ????????????."
								maxcount_msg="?????? ????????? ### ?????? ?????? ??? ????????????."
								totalsize_msg="?????? ?????? ?????? ### MB??? ?????????????????????."
								onclick="imgIdValue = $(this).attr('id');"
								onchange="checkFileTypeImg(this.value);fn_userUuidChange(); "
								>
                        <div class="myinfo_thumb_box">
                            <div>
								<input id="USER_UUID" name="USER_UUID" type="hidden" />
							</div>
                        </div>
                        <div class="register_item phone_register_item tablet_register_item" style="padding-right: 100px;">
                        <div class="account_form" id="detailAccount">
                        
							<h3 class="account_title" style="margin-bottom:10px;font-size:18px;">????????????</h3>
                            <p class="account_item">
                                <input type="text" name="USER_NM" class="account_input" placeholder="??????">
                            </p>
                            <p class="account_item post_item">
                                <input type="text" class="account_input" name="USER_NICK"  placeholder="?????????">
								<button type="button" class="double_check_btn dubleBtn btn_h40" >????????????</button>
                            </p>

							
                            <p class="account_item tell_item">
                                <select name="USER_PHONE1" class="tell_select">
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="010">012</option>
                                    <option value="011">014</option>
                                    <option value="011">015</option>
                                    <option value="011">016</option>
                                    <option value="011">017</option>
                                    <option value="011">018</option>
                                    <option value="011">019</option>
                                    <option value="011">070</option>
                                </select>
                                <span class="tell_mark">-</span>
                                <input type="text" name="USER_PHONE2" class="account_input" minlength="3" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                                <span class="tell_mark">-</span>
                                <input type="text" name="USER_PHONE3" class="account_input" minlength="4" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                                <button type="button" class="double_check_btn dubleBtn btn_h40">????????????</button>
                            </p>
                            
<!-- 							<p class="pluse_tag2" > -->
<!-- 							    <span><strong>????????????</strong></span> -->
							<p class="account_item" >
								<h3 class="account_title" style="margin-bottom:20px;font-size:18px;">????????????</h3>
							</p>
							
							<p class="account_item" >
	                            <select name="PARENT_CODE_ID" id="PARENT_CODE_ID" class="tell_select2"></select>
								<select name="CODE_ID" id="CODE_ID" class="tell_select2" style="margin-right: 2px;">
									<option></option>
								</select>			
								<button type="button" onclick="addKeyw();" class="double_check_btn" style="float: right;">??????</button>
							</p>
                            
							<p class="pluse_tag" id="addKeywTarget">
<!-- 							    <span>#??????#??????,</span> -->
<!-- 								<span>#?????????????????#??????</span> -->
							</p>
							<span class="ooo_title account_item passwdArea"  style="margin-bottom:10px;font-size:18px;">????????????</span>
                            <p class="account_item post_item passwdArea">
                                <input type="password" name="USER_PW" class="account_input" placeholder="???????????? (??????, ?????? ?????? 8?????????)">
                                
	                           <label for="pwTypeChange1" class="form_check pwTypeChange1" style="color: white; font-size: 13px; font-weight: 300;top: 15px;left: 18px;">
	                           		<span><i class="fas fa-eye"></i></span>
	                            </label>
	                            <input type="checkbox" id="pwTypeChange1" style="display:none;">
<!-- 	                           	<span class="form_check_mark phone_form_check_mark tablet_form_check_mark" ></span> -->
                            </p>
                            <p class="account_item post_item passwdArea">
                                <input type="password" name="USER_PW_CONFIRM" class="account_input" placeholder="???????????? ?????? (??????, ?????? ?????? 8?????????)">
                            	
	                           <label for="pwTypeChange2" class="form_check pwTypeChange2" style="color: white; font-size: 13px; font-weight: 300;top: 15px;left: 18px;">
	                                <span><i class="fas fa-eye"></i></span>
	                            </label>
	                            <input type="checkbox" id="pwTypeChange2" style="display:none;">
								<span class="form_check_mark phone_form_check_mark tablet_form_check_mark" ></span>
                            </p>

							<span class="ooo_title account_item"  style="margin-bottom:10px;font-size:18px;">?????? ??? ??????????????? ????????????</span>
							<span>???????????? ??? ?????????/?????? ?????? ????????????????????? ????????? ??? ????????????.</span>
							
                            <p class="ooo_item ooo_item_mail">

	                           <label for="terms1" class="form_check" style="color: #909090; font-size: 13px; font-weight: 300;">
	                           		<input type="checkbox" id="terms1" name="terms1" >
	                           		<span class="form_check_mark" ></span>
	                                ?????? ?????? ??????
	                            </label>
	                            </p>
	                            <p class="ooo_item ooo_item_mail">
	
	                           <label for="terms2" class="form_check" style="color: #909090; font-size: 13px; font-weight: 300;">
	                           		<input type="checkbox" id="terms2" name="terms2" >
	                           		<span class="form_check_mark" ></span>
	                                ?????? ?????? ??????
	                            </label>
                            </p>
                        </div>
                    </div>
                    
                    <div class="myinfo_box">
                        <div class="ooo_box">
                            <span class="ooo_title account_item"  style="margin-bottom:10px;font-size:18px;">?????? ?????????</span>
                            <p class="ooo_item">
                                <textarea name="USER_INFO" id="USER_INFO" class="ooo_textarea"></textarea>
                            </p>
                        </div>
                    </div>
                    
                    <div class="myinfo_box last">
                        <div class="ooo_box">
                            <span class="ooo_title account_item"  style="margin-bottom:10px;font-size:18px;">????????????</span>
                            <p class="ooo_item">
                                <select  class="ooo_input ooo_input_small tell_select2"  placeholder="????????????" name="USER_REFU_BANK" id="USER_REFU_BANK">
                                	
                                </select>
                                <input type="text" class="ooo_input ooo_input_big" placeholder="????????????( '-'????????? ????????? ?????? )" name="USER_ACCOUNT" id="USER_ACCOUNT" onke>
                                <input type="text" class="ooo_input ooo_input_small" placeholder="?????????" name="USER_ACCOUNT_NM" id="USER_ACCOUNT_NM">
                            </p>
                        </div>
                        <div class="userSecessionBtn">
                        	<span>????????????</span>
                        </div>
                        
                    </div>

                    <button type="button" onclick="fn_BtnRegist();" class="account_btn payment_btn last">????????????</button>
                </div>
            </div><!-- //.account_double_box  -->
                    

        
        </div>
    </div><!-- // #container -->


<div id="userSeccessionPop" class="popup_wrap">
	<div class="popup_layer"></div>
	<div class="popup_box">
		<div class="popup_content register_popup_content3" style="text-align:left;overflow-y: auto;">
<!--                                     <button type="button" class="pop_close"></button> -->
                                    
			<div class="register_pop_box">
<!-- 				<h4 class="rp_title">???????????? ?????? ?????? ?????? ????????? ?????? ??????????????????</h4> -->
				<p class="rp_text">
				<div class="over" style="height:auto; padding-right: 10px;width:100%">
					<div class="leave_text_box" style="margin-bottom: 0;">
						<br class="mobile">
						<h4 class="rp_title">???????????? ?????? ?????? ?????? ????????? ?????? ??????????????????</h4>
<!-- 						1. ???????????? ??? ????????? ???????????? ???????????? ??????????????????.<br><br class="mobile"> -->
						1. ???????????? ??? ????????? ???????????? 30??? ????????? ???????????? ??????????????????.<br><br class="mobile">
						2. ???????????? ??? ?????????, ?????????, ?????? ?????? ????????? ?????? ????????????, ???????????? ????????? ????????? ??????????????? ???????????? ??????????????? ???????????? ?????? ?????? ????????? ????????? ?????????????????? ????????????.<br><br class="mobile">
						3. ???????????? ??? ????????? ???????????? ?????? ?????? ???????????? ?????? ??????????????? ???????????????. ??????, ?????? ????????? ?????? ????????? ????????? ????????? ?????? ?????? ?????? ????????? ???????????? ?????? ???????????????.<br><br class="mobile">
						4. ???????????? ??? ???????????? ????????? ???????????? ?????? ?????? ????????? ?????????????????? ????????? ?????? ?????? ?????? ?????? ???????????? ??????????????? ?????????????????? ????????????.<br><br>
						
						<h4 class="rp_title">?????? ????????? ?????? ?????????</h4>
						<textarea class="rp_text_area ooo_textarea" placeholder="???????????? ????????? ????????? ???????????? ?????? ?????? ???????????? ??? ??? ????????? ?????????????????????."></textarea>
					</div>
				</div>
										
				<br>
				
			</div>
			<div class="popup_bottom">
				<button type="button" class="seccession_btn" onclick="fn_seccession();">?????? ????????????</button>
				<span class="pop_close" style="cursor: pointer;"></span>
			</div>
		</div>
	</div>
</div><!-- //#childRegisterPop3 -->




<script src="//cdn.rawgit.com/placemarker/jQuery-MD5/master/jquery.md5.js"></script>
<script>
$(document).ready(function(){
//     $(".vod-nav").slick({
//         slidesToScroll: 2,
//         variableWidth: true,
//         autoplay: false,
//         infinite: false,
//         dots: false,
//         arrows: false
//     });
//     $('.vod-nav').slick('slickGoTo', 4);
    
});

var pwTypeChange1 = 0;
var pwTypeChange2 = 0;

$('#pwTypeChange1').change(function(){
	if( $(this).prop('checked') ) $('[name=USER_PW]').attr('type','text');
	else $('[name=USER_PW]').attr('type','password');
	
	//???????????? ????????? ??????
	if( $('.pwTypeChange1 span i').hasClass('fa-eye') ) {
		$('.pwTypeChange1 span i').removeClass('fa-eye');
		$('.pwTypeChange1 span i').addClass('fa-eye-slash');
	} else {
		$('.pwTypeChange1 span i').removeClass('fa-eye-slash');
		$('.pwTypeChange1 span i').addClass('fa-eye');
	}
});

$('#pwTypeChange2').change(function(){
	if( $(this).prop('checked') ) $('[name=USER_PW_CONFIRM]').attr('type','text');
	else $('[name=USER_PW_CONFIRM]').attr('type','password');

	//???????????? ????????? ??????
	if( $('.pwTypeChange2 span i').hasClass('fa-eye') ) {
		$('.pwTypeChange2 span i').removeClass('fa-eye');
		$('.pwTypeChange2 span i').addClass('fa-eye-slash');
	} else {
		$('.pwTypeChange2 span i').removeClass('fa-eye-slash');
		$('.pwTypeChange2 span i').addClass('fa-eye');
	}
});

$('.mt_box').click(function(event){
	$('#myinfoThumb').click();
	event.preventDefault();
});

var result;

$( function() {
	// ?????? ????????? ???????????????
	if( localStorage.getItem("frontLoginIdx") == null ) location.href = "/";

	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectFrontMypeoplemadePrdtCnt";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	var resultData = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var prdtCntData = resultData.out.detail.data[0];
	$('.text-point-small span').eq(0).text( prdtCntData.NET_CNT );
	$('.text-point-small span').eq(1).text( prdtCntData.VOD_CNT );
	$('.text-point-small span').eq(2).text( prdtCntData.COACH_CNT );
	$('.text-point-small span').eq(3).text( prdtCntData.LIVE_CNT );
	$('.text-point-small span').eq(4).text( prdtCntData.FOLL_CNT );
	
	fn_SelectOption("", "CAT", "PARENT_CODE_ID");

	fn_SelectOption("", "ZON", "USER_ZONE");
	fn_SelectOption("", "BK", "USER_REFU_BANK");
	
	var params = new Object();
	params.query = "selectFrontUserDetail";
	params.status = "DETAIL";
	params.USER_IDX = localStorage.getItem("frontLoginIdx");

	 
	result = fn_DataAjax2( params );
	result = result.out.detail.data[0];
	
	setUuid( result.USER_UUID );
	
	imgIdValue="USER_UUID_FILE";
	unit_fileGet( imgIdValue , "fn_fileUpload");
	
// 	$('.mt_info_text span').eq(0).text( result.USER_NICK );
// 	$('.mt_info_text span').eq(1).text( result.USER_EMAIL );
// 	if ( typeof result.USER_INFO == 'undefined' ) {
// 		$('.mt_info_text span').eq(2).text( '' );
// 	}else{
// 		$('.mt_info_text span').eq(2).text( result.USER_INFO );
// 	}
	$.each(result, function(key,val){
		$('#detailAccount p').each(function(k){
			if( $(this).find('input').attr('name') == key ){
				
				$(this).find('input').val(val);
			}
		});
	});
	$('[name=USER_NM]').val( result.USER_NM );
	$('[name=USER_PHONE1]').val( result.USER_PHONE1 );
	$('[name=USER_PHONE2]').val( result.USER_PHONE2 );
	$('[name=USER_PHONE3]').val( result.USER_PHONE3 );
	$('[name=USER_GENDER]').val( result.USER_GENDER );
	$('[name=USER_ZONE]').val( result.USER_ZONE );
	
	
	if ( result.USER_MAIL_YN == 'Y' ) $('#terms1').prop('checked', true);
	if ( result.USER_SMS_YN == 'Y' ) $('#terms2').prop('checked', true);
	
	if( result.USER_INFO != null ) {
		if( result.USER_INFO != '' ) {
			result.USER_INFO = result.USER_INFO.replace(/&amp;/g,"&");
			result.USER_INFO = result.USER_INFO.replace(/&lt;/g,"<");   
			result.USER_INFO = result.USER_INFO.replace(/&gt;/g,">");   
			result.USER_INFO = result.USER_INFO.replace(/&quot;/g,'"');
			result.USER_INFO = result.USER_INFO.replace(/&#39;/g,"'"); 
			result.USER_INFO = result.USER_INFO.replace(/<br \/>/g,"\n");
			result.USER_INFO = result.USER_INFO.replace(/&#63;/g,"?");
		}
	}
	
	$('[name=USER_INFO]').val( result.USER_INFO );
	$('[name=USER_REFU_BANK]').val( result.USER_REFU_BANK );
	$('[name=USER_ACCOUNT]').val( result.USER_ACCOUNT );
	$('[name=USER_ACCOUNT_NM]').val( result.USER_ACCOUNT_NM );
	
	var allCate = fn_SelectAllOption(  'CAT', 'nono' );
	
	var codeNm = "";
	var code = "";
	var parentCodeNm = "";
	
	
	if (result.USER_SNS_TYPE != '' && result.USER_SNS_TYPE != null && typeof result.USER_SNS_TYPE != 'undefind' ) {
// 		$('[name=USER_PW]').hide();
// 		$('[name=USER_PW_CONFIRM]').hide();
		$(".passwdArea").hide();
	}
	
	if ( result.USER_KEYW != '' && result.USER_KEYW != null && typeof result.USER_KEYW != 'undefind' ) {
		
		$.each( result.USER_KEYW.split(',') ,  function(k, v){
			$.each( allCate, function(key, val){
				if( v.substring(0,5) == val.CODE_ID ){
					parentCodeNm = val.CODE_NM;
				} 
				if ( v ==  val.CODE_ID ) {
					codeNm = val.CODE_NM;
					code = val.CODE_ID;
				}
				
				if ( parentCodeNm != "" && code != "" ) {
					$('#addKeywTarget').append('<span class="mr10" id="'+code+'">'+'#'+parentCodeNm+'#'+codeNm+'<span class="fn_delKeyword">???</span></span>');
					code = "";
					codeNm = "";
					parentCodeNm = "";
				}
			});
			
		});
	}
	
// 	console.log( result );
// 	console.log( JSON.stringify( result ) );
	
	$( '#now_loading' ).hide();
});

$("[name=PARENT_CODE_ID]").on('change',function(k){
	fn_SelectOption($(this).val(), "CAT", "CODE_ID");
});

//????????? ????????????
function addKeyw(){
	if ( $('[name=CODE_ID]').val() != '' ) {
		var isc = true;
		$('#addKeywTarget > span').each(function(k){
			if (this.id == $('[name=CODE_ID]').val())
				isc = false;
		});
		
		if (isc ) 			
			$('#addKeywTarget').append('<span class="mr10"  id="'+$('[name=CODE_ID]').val()+'">'+'#'+$('[name=PARENT_CODE_ID] option:checked').text()+'#'+$('[name=CODE_ID] option:checked').text()+'<span class="fn_delKeyword">???</span></span>');
	}else{
		clickPopupEvent('.double_check_btn',{
		      popupType : 'alert',
		      popupMsg: '??????????????? ??????????????????.',
		      beforePopup: function(thisBtn){
		      return 'ALERT';
		      }
		});
	}
}

$(document).on('click','.dubleBtn',dubleBtn);
//???????????? 3??? ??????
function dubleBtn(){
	var targetNm = $(this).siblings('input').attr('name').replace('USER_','');
	var msg = "";
	if (targetNm == "NICK") {
		
		if ( result.USER_NICK == $('[name=USER_NICK]').val() ) {
			dupleNickChk = true;
			return alert('????????? ??????????????????.');
		}
		
		fn_BtnDupl( $('[name=USER_NICK]').val() , targetNm);
		msg = "?????????";
	}else if (targetNm == "PHONE2") {
		var phone = "";
		var isPhone = true;
		$('[name^=USER_PHONE]').each(function(k){
			if (this.value != '') 
				phone += this.value;
			else
				isPhone = false;
		});
		
		// ????????? ??????
		if( phone.length < 10 ) isPhone = false;
		
		msg = "????????????";
		if (isPhone) {
			if ( result.USER_PHONE == phone ) {
				duplePhoneChk = true;
				return alert('????????? ?????????????????????.');
			}
			fn_BtnDupl( phone , targetNm);
		}else{
			dupleChk = false;
			return alert('??????????????? ????????? ???????????? ???????????????.');
		}
	}
	
	if( idIsc ){
		if (targetNm == "NICK") {
			dupleNickChk = true;
		}else if (targetNm == "PHONE2") {
			duplePhoneChk = true;
		}
		alert('?????? ????????? '+msg+'?????????.');
	}else{
		if (targetNm == "NICK") {
			dupleNickChk = false;
		}else if (targetNm == "PHONE2") {
			duplePhoneChk = false;
		}
		alert('?????? ????????? '+msg+'?????????.');
	}
	
}

$(document).on('change', '[name=USER_PW]', pwReg);
$(document).on('change', '[name=USER_PW_CONFIRM]', pwConfirm);
$('[name^=USER_PHONE]').on('change', function(){ duplePhoneChk = false; });
$('[name=USER_NICK]').on('change', function(){ dupleNickChk = false; });
$('[name=USER_ACCOUNT]').on('keyup',function(){ this.value=this.value.replace(/[^0-9]/g,''); });


function pwReg(){
	if( fn_pwTest(this.value) ){
		$(this).siblings('span').remove();
		$(this).parent().append('<span class="red" style="display:inline-block;">???????????? ????????? ???????????? ????????????.</span>');		
		pwRegChk = false;
	}else{
		$(this).siblings('span').remove();
		pwRegChk = true;
	}
		pwConfirm();
}

function pwConfirm(){
	if ( $('[name=USER_PW]').val() === $('[name=USER_PW_CONFIRM]').val() ){
		$('[name=USER_PW_CONFIRM]').siblings('span').remove();
		pwConfirmChk = true;
	}
	else{
		$('[name=USER_PW_CONFIRM]').siblings('span').remove();
		$('[name=USER_PW_CONFIRM]').parent().append('<span class="red" style="display:inline-block;">??????????????? ???????????? ????????????</span>');		
		pwConfirmChk = false;
	}
}

$('.mt_box').click(function(event){
	$('#USER_UUID_FILE').click();
	event.preventDefault();
});

function fn_userUuidChange(){
	var params = new Object();
	params.status = "EDIT";
	params.query = "updateFrontMypeoplemadeUserUuid";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	setTimeout(function(){
		params.USER_UUID = $('[name=USER_UUID]').val();
		fn_DataAjax2( params );
		localStorage.setItem( 'frontLoginUuid',$('[name=USER_UUID]').val() );
		location.reload();
	}
	, 1000);
}

//?????? ???????????? ????????? ?????? ??????
var dupleNickChk = false;
var duplePhoneChk = false;
var pwRegChk = false;
var pwConfirmChk = false;
function fn_BtnRegist(){
	
	var phone = "";
	var isPhone = true;
	
	if( $('[name=USER_NM]').val().trim() == '' ) return alert('????????? ????????? ?????????.');
	
	if ( result.USER_NICK != $('[name=USER_NICK]').val().trim() ) {
		
		if( $('[name=USER_NICK]').val().trim() == '' ){
			dupleNickChk = false;
			return alert('???????????? ????????? ?????????.');
		}
		if( !dupleNickChk ) return alert('????????? ??????????????? ???????????? ???????????????.');
	}
	
		$('[name^=USER_PHONE]').each(function(k){
			if (this.value != '') 
				phone += this.value;
			else
				isPhone = false;
		});
		if ( !isPhone ){
				duplePhoneChk = false;
				return alert('??????????????? ??????????????????.');
		}
							
	if ( result.USER_PHONE != phone ) {
		if( !duplePhoneChk ) return alert('???????????? ??????????????? ???????????? ???????????????.');
	}
	
	if ( $('[name=USER_PW]').val().trim() != '' ) {
		if( $('[name=USER_PW_CONFIRM]').val().trim() == '' ) return alert('???????????? ????????? ??????????????????.');
		
		if ( !pwRegChk ) return alert('???????????? ????????? ?????? ??????, ?????? ?????? 8??? ???????????? ???????????? ?????????.');
		if ( !pwConfirmChk ) return alert('??????????????? ???????????? ????????????.');
	}

	
	var params = unit_getParams('searchArea');
	params.status = "EDIT";
	params.query = "updateFrontMypageData";
	params.USER_IDX = result.USER_IDX;
	if(	$('#terms1').is(':checked') ){
		params.USER_MAIL_YN = 'Y';
		params.USER_PUSH_YN = 'Y';
	}else{
		params.USER_MAIL_YN = 'N';
		params.USER_PUSH_YN = 'N'; 
	}
	if ( $('#terms2').is(':checked') ) {
		params.USER_SMS_YN = 'Y';
	}else{
		params.USER_SMS_YN = 'N';
	}
	
	var USER_KEYW = "";
	$('#addKeywTarget > span').each(function(k){
		if( k == 0 ) USER_KEYW +=  this.id;
		else	USER_KEYW += ","+ this.id;
	});
	params.USER_KEYW = USER_KEYW;
	params.USER_PHONE = phone;
	if ( $('[name=USER_PW]').val() != '' && $('[name=USER_PW]').val() != null && typeof $('[name=USER_PW]').val() != "undefind" ) {
		params.USER_PW = $.md5( params.USER_PW );
		params.USER_PW_CONFIRM = $.md5( params.USER_PW_CONFIRM  );
	}
	
	if (result.USER_SNS_TYPE != '' && result.USER_SNS_TYPE != null && typeof result.USER_SNS_TYPE != 'undefind' ) {
		params.USER_SNS_YN = 'Y';
	}
	
	var resultcnt =  fn_DataAjax2( params );
	if(resultcnt.out.resultCnt){
    	localStorage.setItem("frontLoginNm", $('[name=USER_NM]').val() );
    	localStorage.setItem("frontUserInfo", $('[name=USER_INFO]').val() );
		alert('????????? ?????????????????????.');
		location.reload();
	}
}

$(document).ready(function(){
	lnbEvent();
});

$(document).on('click', '.fn_delKeyword', function(){
	$(this).parent().remove();
});

$('.userSecessionBtn span').on('click',function(){
	$('.popup_wrap').hide();
	$('#userSeccessionPop').show();
});

function fn_seccession(){
	var params = new Object();
	params.query = "updateFrontSeccessionReason";
	params.SECCESSION_REASON = $('.rp_text_area').val().trim();
	params.status = "EDIT";
	params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
	
	var resultparam = fn_DataAjax2( params );
	
	if ( unit_isComplete( resultparam ) ) {
		console.log(resultparam);
		if( resultparam.out.resultCnt > 0 ){
			alert('????????? ?????????????????????.');
			fn_BtnLogout();
		}else{
			alert('????????? ??????????????????. ????????? ?????? ??????????????????.');
		}
	}
}

</script>
