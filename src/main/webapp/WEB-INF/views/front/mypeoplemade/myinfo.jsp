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
               <button type="button" class="" onclick="location.href='/front/mypeoplemade/myinfo' ">프로필 편집</button>
                        <div class="btn-profile-more">
                            <button type="button" class="btn-more"><i class="ico-profile-more"></i></button>
                            <ul class="more-menu">
                                <li>
                                    <a href="/front/mypage/payment">결제내역</a>
                                </li>
                                <li>
                                    <a href="/front/mypage/mycoupon">내 쿠폰</a>
                                </li>
                                <li>
                                    <a href="/front/mypage/refund">취소/환불내역</a>
                                </li>
                                <li>
                                    <a href="/front/mypeoplemade/myinfo">내정보관리</a>
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
                    <li class="lnb_item" style="    display: inline-flex;"><a href="/front/mypeoplemade/network" style="    margin-right: 0;">내인맥</a><a href="/front/mypeoplemade/network_list" style="    padding-top: 2px;"><span class="text-point text-point-small"><span>0</span>명</span></a></li>
                    <li class="lnb_item"><a class="lnbExtraClass" href="/front/mypeoplemade/coaching?1">VOD<span class="text-point text-point-small"><span></span>개</span></a></li>
                    <li class="lnb_item"><span class="hm_mail_alarm hm_mail_alarm_mypeople"></span><a href="/front/mypeoplemade/coaching?2">1:1코칭<span class="text-point text-point-small"><span></span>개</span></a></li>
                    <li class="lnb_item"><a class="lnbExtraClass" href="/front/mypeoplemade/coaching?3">LIVE CLASS<span class="text-point text-point-small"><span></span>개</span></a></li>
                    <li class="lnb_item"><a href="/front/mypeoplemade/follow">팔로잉<span class="text-point text-point-small"><span></span>개</span></a></li>
                    <li class="lnb_item is-active"><a href="/front/mypeoplemade/myinfo">내 정보관리<!-- <span class="text-point"></span> --></a></li>
                </ul>
            </div>
                 
                <div class="mypage_box">
                    <div class="myinfo_box" id="searchArea">
                    
                        <input type="file" id="USER_UUID_FILE" name="USER_UUID_FILE" class="file_input" style="display:none; margin-left:0px;" maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" 
								maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."
								maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."
								totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."
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
                        
							<h3 class="account_title" style="margin-bottom:10px;font-size:18px;">기본정보</h3>
                            <p class="account_item">
                                <input type="text" name="USER_NM" class="account_input" placeholder="이름">
                            </p>
                            <p class="account_item post_item">
                                <input type="text" class="account_input" name="USER_NICK"  placeholder="닉네임">
								<button type="button" class="double_check_btn dubleBtn btn_h40" >중복확인</button>
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
                                <button type="button" class="double_check_btn dubleBtn btn_h40">중복확인</button>
                            </p>
                            
<!-- 							<p class="pluse_tag2" > -->
<!-- 							    <span><strong>관심분야</strong></span> -->
							<p class="account_item" >
								<h3 class="account_title" style="margin-bottom:20px;font-size:18px;">관심분야</h3>
							</p>
							
							<p class="account_item" >
	                            <select name="PARENT_CODE_ID" id="PARENT_CODE_ID" class="tell_select2"></select>
								<select name="CODE_ID" id="CODE_ID" class="tell_select2" style="margin-right: 2px;">
									<option></option>
								</select>			
								<button type="button" onclick="addKeyw();" class="double_check_btn" style="float: right;">추가</button>
							</p>
                            
							<p class="pluse_tag" id="addKeywTarget">
<!-- 							    <span>#건강#약사,</span> -->
<!-- 								<span>#뷰티·스타일#헤어</span> -->
							</p>
							<span class="ooo_title account_item passwdArea"  style="margin-bottom:10px;font-size:18px;">비밀번호</span>
                            <p class="account_item post_item passwdArea">
                                <input type="password" name="USER_PW" class="account_input" placeholder="비밀번호 (문자, 숫자 포함 8자이상)">
                                
	                           <label for="pwTypeChange1" class="form_check pwTypeChange1" style="color: white; font-size: 13px; font-weight: 300;top: 15px;left: 18px;">
	                           		<span><i class="fas fa-eye"></i></span>
	                            </label>
	                            <input type="checkbox" id="pwTypeChange1" style="display:none;">
<!-- 	                           	<span class="form_check_mark phone_form_check_mark tablet_form_check_mark" ></span> -->
                            </p>
                            <p class="account_item post_item passwdArea">
                                <input type="password" name="USER_PW_CONFIRM" class="account_input" placeholder="비밀번호 확인 (문자, 숫자 포함 8자이상)">
                            	
	                           <label for="pwTypeChange2" class="form_check pwTypeChange2" style="color: white; font-size: 13px; font-weight: 300;top: 15px;left: 18px;">
	                                <span><i class="fas fa-eye"></i></span>
	                            </label>
	                            <input type="checkbox" id="pwTypeChange2" style="display:none;">
								<span class="form_check_mark phone_form_check_mark tablet_form_check_mark" ></span>
                            </p>

							<span class="ooo_title account_item"  style="margin-bottom:10px;font-size:18px;">혜택 및 이벤트정보 수신동의</span>
							<span>공지사항 및 이벤트/할인 등의 회원혜택정보를 받으실 수 있습니다.</span>
							
                            <p class="ooo_item ooo_item_mail">

	                           <label for="terms1" class="form_check" style="color: #909090; font-size: 13px; font-weight: 300;">
	                           		<input type="checkbox" id="terms1" name="terms1" >
	                           		<span class="form_check_mark" ></span>
	                                메일 수신 동의
	                            </label>
	                            </p>
	                            <p class="ooo_item ooo_item_mail">
	
	                           <label for="terms2" class="form_check" style="color: #909090; font-size: 13px; font-weight: 300;">
	                           		<input type="checkbox" id="terms2" name="terms2" >
	                           		<span class="form_check_mark" ></span>
	                                문자 수신 동의
	                            </label>
                            </p>
                        </div>
                    </div>
                    
                    <div class="myinfo_box">
                        <div class="ooo_box">
                            <span class="ooo_title account_item"  style="margin-bottom:10px;font-size:18px;">상태 메시지</span>
                            <p class="ooo_item">
                                <textarea name="USER_INFO" id="USER_INFO" class="ooo_textarea"></textarea>
                            </p>
                        </div>
                    </div>
                    
                    <div class="myinfo_box last">
                        <div class="ooo_box">
                            <span class="ooo_title account_item"  style="margin-bottom:10px;font-size:18px;">환불계좌</span>
                            <p class="ooo_item">
                                <select  class="ooo_input ooo_input_small tell_select2"  placeholder="입금은행" name="USER_REFU_BANK" id="USER_REFU_BANK">
                                	
                                </select>
                                <input type="text" class="ooo_input ooo_input_big" placeholder="계좌번호( '-'제외한 숫자만 입력 )" name="USER_ACCOUNT" id="USER_ACCOUNT" onke>
                                <input type="text" class="ooo_input ooo_input_small" placeholder="예금주" name="USER_ACCOUNT_NM" id="USER_ACCOUNT_NM">
                            </p>
                        </div>
                        <div class="userSecessionBtn">
                        	<span>회원탈퇴</span>
                        </div>
                        
                    </div>

                    <button type="button" onclick="fn_BtnRegist();" class="account_btn payment_btn last">수정하기</button>
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
<!-- 				<h4 class="rp_title">회원탈퇴 신청 전에 아래 사항을 확인 부탁드립니다</h4> -->
				<p class="rp_text">
				<div class="over" style="height:auto; padding-right: 10px;width:100%">
					<div class="leave_text_box" style="margin-bottom: 0;">
						<br class="mobile">
						<h4 class="rp_title">회원탈퇴 신청 전에 아래 사항을 확인 부탁드립니다</h4>
<!-- 						1. 회원탈퇴 후 동일한 계정으로 재가입이 불가능합니다.<br><br class="mobile"> -->
						1. 회원탈퇴 후 동일한 계정으로 30일 이내에 재가입이 불가능합니다.<br><br class="mobile">
						2. 회원탈퇴 시 수강권, 코칭권, 쿠폰 등의 권리는 모두 소멸되며, 회원탈퇴 후에는 환불이 불가하므로 결제하신 수강권이나 코칭권은 탈퇴 전에 반드시 환불을 신청해주시기 바랍니다.<br><br class="mobile">
						3. 회원탈퇴 시 회사가 보관하고 있는 회원 데이터는 모두 영구적으로 삭제됩니다. 다만, 관련 법령에 따라 회사가 보관할 의무가 있는 정보 또는 자료는 일정기간 동안 보관됩니다.<br><br class="mobile">
						4. 회원탈퇴 후 회원님이 게시한 게시물은 편집 또는 삭제를 불가능하오니 필요한 경우 탈퇴 신청 전에 게시물을 편집하거나 삭제해주시기 바랍니다.<br><br>
						
						<h4 class="rp_title">탈퇴 사유를 적어 주세요</h4>
						<textarea class="rp_text_area ooo_textarea" placeholder="회원님의 소중한 의견을 반영하여 좀더 나은 서비스로 될 수 있도록 노력하겠습니다."></textarea>
					</div>
				</div>
										
				<br>
				
			</div>
			<div class="popup_bottom">
				<button type="button" class="seccession_btn" onclick="fn_seccession();">탈퇴 신청하기</button>
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
	
	//비밀번호 아이콘 변경
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

	//비밀번호 아이콘 변경
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
	// 만약 로그인 안되있다면
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
					$('#addKeywTarget').append('<span class="mr10" id="'+code+'">'+'#'+parentCodeNm+'#'+codeNm+'<span class="fn_delKeyword">Ⅹ</span></span>');
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

//키워드 추가해줌
function addKeyw(){
	if ( $('[name=CODE_ID]').val() != '' ) {
		var isc = true;
		$('#addKeywTarget > span').each(function(k){
			if (this.id == $('[name=CODE_ID]').val())
				isc = false;
		});
		
		if (isc ) 			
			$('#addKeywTarget').append('<span class="mr10"  id="'+$('[name=CODE_ID]').val()+'">'+'#'+$('[name=PARENT_CODE_ID] option:checked').text()+'#'+$('[name=CODE_ID] option:checked').text()+'<span class="fn_delKeyword">Ⅹ</span></span>');
	}else{
		clickPopupEvent('.double_check_btn',{
		      popupType : 'alert',
		      popupMsg: '관심분야를 선택해주세요.',
		      beforePopup: function(thisBtn){
		      return 'ALERT';
		      }
		});
	}
}

$(document).on('click','.dubleBtn',dubleBtn);
//중복확인 3개 공통
function dubleBtn(){
	var targetNm = $(this).siblings('input').attr('name').replace('USER_','');
	var msg = "";
	if (targetNm == "NICK") {
		
		if ( result.USER_NICK == $('[name=USER_NICK]').val() ) {
			dupleNickChk = true;
			return alert('동일한 닉네임입니다.');
		}
		
		fn_BtnDupl( $('[name=USER_NICK]').val() , targetNm);
		msg = "닉네임";
	}else if (targetNm == "PHONE2") {
		var phone = "";
		var isPhone = true;
		$('[name^=USER_PHONE]').each(function(k){
			if (this.value != '') 
				phone += this.value;
			else
				isPhone = false;
		});
		
		// 자릿수 부족
		if( phone.length < 10 ) isPhone = false;
		
		msg = "전화번호";
		if (isPhone) {
			if ( result.USER_PHONE == phone ) {
				duplePhoneChk = true;
				return alert('동일한 전화번호입니다.');
			}
			fn_BtnDupl( phone , targetNm);
		}else{
			dupleChk = false;
			return alert('전화번호가 제대로 입력되지 않았습니다.');
		}
	}
	
	if( idIsc ){
		if (targetNm == "NICK") {
			dupleNickChk = true;
		}else if (targetNm == "PHONE2") {
			duplePhoneChk = true;
		}
		alert('사용 가능한 '+msg+'입니다.');
	}else{
		if (targetNm == "NICK") {
			dupleNickChk = false;
		}else if (targetNm == "PHONE2") {
			duplePhoneChk = false;
		}
		alert('이미 등록된 '+msg+'입니다.');
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
		$(this).parent().append('<span class="red" style="display:inline-block;">비밀번호 형식이 일치하지 않습니다.</span>');		
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
		$('[name=USER_PW_CONFIRM]').parent().append('<span class="red" style="display:inline-block;">비밀번호가 일치하지 않습니다</span>');		
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

//일반 회원가입 유효값 필요 변수
var dupleNickChk = false;
var duplePhoneChk = false;
var pwRegChk = false;
var pwConfirmChk = false;
function fn_BtnRegist(){
	
	var phone = "";
	var isPhone = true;
	
	if( $('[name=USER_NM]').val().trim() == '' ) return alert('이름을 입력해 주세요.');
	
	if ( result.USER_NICK != $('[name=USER_NICK]').val().trim() ) {
		
		if( $('[name=USER_NICK]').val().trim() == '' ){
			dupleNickChk = false;
			return alert('닉네임을 입력해 주세요.');
		}
		if( !dupleNickChk ) return alert('닉네임 중복확인이 완료되지 않았습니다.');
	}
	
		$('[name^=USER_PHONE]').each(function(k){
			if (this.value != '') 
				phone += this.value;
			else
				isPhone = false;
		});
		if ( !isPhone ){
				duplePhoneChk = false;
				return alert('전화번호를 입력해주세요.');
		}
							
	if ( result.USER_PHONE != phone ) {
		if( !duplePhoneChk ) return alert('전화번호 중복확인이 완료되지 않았습니다.');
	}
	
	if ( $('[name=USER_PW]').val().trim() != '' ) {
		if( $('[name=USER_PW_CONFIRM]').val().trim() == '' ) return alert('비밀번호 확인을 입력해주세요.');
		
		if ( !pwRegChk ) return alert('비밀번호 형식에 맞게 문자, 숫자 포함 8자 이상으로 작성해야 합니다.');
		if ( !pwConfirmChk ) return alert('비밀번호가 일치하지 않습니다.');
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
		alert('수정이 완료되었습니다.');
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
			alert('탈퇴가 완료되었습니다.');
			fn_BtnLogout();
		}else{
			alert('탈퇴에 실패했습니다. 잠시후 다시 시도해주세요.');
		}
	}
}

</script>
