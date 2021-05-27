<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="./../mypay/eutil.jsp"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDateValue"><fmt:formatDate value="${now}" pattern="yyyyMM" /></c:set>
<c:set var="kspaySvcTkn" value="${out.kspaySvcTkn}"/>
<%
	// 운영아이디가 발급되면 제공되는 정보 , 기본은 테스트 아이디용.
	String mhkey        = "01F129202238E959E469496410570781" ;    
	String mekey        = "D593410C0AFCC1F8C86D5B940C6A846E";       
	String msalt        = "MA01";                                         
	String mpaymsalt    = "pY081aZe7H";
	// ----------------------------------------------------------------------
	
	// 사용자 토큰. 최초 1회 결제시 응답으로 내려주는 정보 ( 미 결제시에는 공백 )
	String servicetoken = "" ;       
	
	String curr_date_14 = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());
 	String etoken = get_etoken(mhkey, curr_date_14, "");
 	
 	String payToken = "";
 	payToken = (String)pageContext.getAttribute("kspaySvcTkn");
	
 	if( payToken.isEmpty() || payToken == null ){
 		
 	}else{
 		servicetoken = payToken;
 	}
	// 가맹점 암호화 데이터 
	StringBuffer sb = new StringBuffer();
	sb.append(curr_date_14   ).append(':');
	sb.append("servicetoken").append('=').append(servicetoken ) ;

	String p_data = sb.toString();
	String edata = encrypt_msg(mekey ,p_data);
%>
<script language="javascript">
	function my_pay(_frm) 
	{
		var width_	= 550;
		var height_	= 850;
		var left_	= screen.width;
		var top_	= screen.height;
    	
		left_ = left_/2 - (width_/2);
		top_ = top_/2 - (height_/2);
		
		_frm.sndReply.value=getMypayUrl("mypay_result");
		_frm.sndCancelUrl.value=getMypayUrl("mypay_cancel");
// 		_frm.action ='http://210.181.28.134/store/MYPay/MYPayWebTot.jsp'; 
		_frm.action ='https://kspay.ksnet.to/store/MYPay/MYPayWebTot.jsp'; 
		if(is_mobile()){
			_frm.target = "_self";
		}else{
			_frm.sndReply.value=getMypayUrl("mypay_rcv");
			_frm.sndCancelUrl.value=getMypayUrl("mypay_cancel");
			op = window.open("",'AuthFrmUp', 'height='+height_+',width='+width_+',status=yes,scrollbars=no,resizable=no,left='+left_+',top='+top_+'');
			_frm.target = "AuthFrmUp";
		}
		_frm.submit();
	}
// 	function getLocalUrl(mypage) 
// 	{ 
// 		var myloc = location.href; 
// 		return myloc.substring(0, myloc.lastIndexOf('/')) + '/' + mypage;
// 	}
	function getMypayUrl(mypage) 
	{ 
		var myloc = location.href; 
		myloc = myloc.substring(0, myloc.lastIndexOf('/'));
		return myloc.substring(0, myloc.lastIndexOf('/')) + '/mypay/' + mypage;
	}
// 	function goResult() 
// 	{ 
// 		document.payfrm.action = "./mypay_result";
// 		document.payfrm.target = "_self";
// 		document.payfrm.submit();
// 	} 
	function is_mobile()
	{
		if(navigator.userAgent.match(/Android/i)){
			
		}else if(navigator.userAgent.match(/iPhone|iPad|iPod/i)){
			
		}else{
			//PC
			return false;
		}
		return true;
	}
	
</script>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'index', 'ajax')}" />


<style>
/* SCROLL */
::-webkit-scrollbar { width: 2px;     border-radius: 40px;}
/* 스크롤바의 width */
::-webkit-scrollbar-track { background-color: black; }
/* 스크롤바의 전체 배경색 */
::-webkit-scrollbar-thumb { 
    background:#444; 
}
/* 스크롤바 색 */
::-webkit-scrollbar-button { display: none; }
/* 위 아래 버튼 (버튼 없애기를 함) */


.names{
/* float: left;  */
margin-right: 10px;
line-height: 40px;
width: 20%;
}

.img_area img { width: 135px; object-fit: scale-down; }

/* @media screen and (max-width: 1250px){
	.popup_content {
   		height: auto;
	}
} */
.amount-control { width: max-content; margin:auto; }
.product_price_item .amount-control{ float: right; }
.prdtCardImg { 
    height: 90px;
    width: 140px;
    position: relative;
    background-size: cover;
    background-position: center center;
    background-repeat: no-repeat;
}

@media screen and (max-width: 400px){
	.prdtCardImg { 
	    height: 50px;
	    width: 90px;
    	margin-left: 25px;
	}
}

button.timeDealDay{
    position: relative;
    top: 10px;
/*     right: 95px; */
	height: 20px;
    border-radius: 40px;
    width: 70px;
    background-color: #aa00ff;
    color: white;
    }
button.timeDealTime{
    position: relative;
	top: 10px;
/*     right: 90px; */
    width: 140px;
    background-color: black;
    color: white;
}
.timedealDiv{display:none;}
</style>

<link rel="stylesheet" type="text/css" href="/resources/assets/css/cash.css">
    <div id="container">
        <section>
            <div class="section_inner">
<!--                 <div class="section_cont_top"> -->
                    <h3 class="section_cont_top_title">결제하기</h3>
					<div class="breadcrumb phones_breadcrumb" style="right:25px;bottom:50px ;">
	                    <span class="is-active">01 장바구니</span>
	                    <span>주문내역</span>
	                    <span>장바구니</span>
                	</div>
<!--                 </div> -->
            </div>     
        </section>

        <section class="cart_pymt section_last">
            <div class="section_inner">
                <div class="cart_pymt_right">
                    <h4 class="cart_pymt_title">수강신청</h4>

                    <table class="cart_pymt_table">
                        <thead>
                            <tr>
                                <th>상품정보</th>
                                <th>판매가</th>
                                <th>할인</th>
                                <th>수량</th>
                                <th>주문금액</th>
                            </tr>
                        </thead>
                        <tbody id="prdtList">
                            
                            
                        </tbody>
                    </table>

                    <!-- 모바일 / 테블릿에서 보임 시작 -->
                    <div class="cart_pymt_table type_tablet">
                        
                    </div>
                    <!-- 모바일 / 테블릿에서 보임 끝 -->

                    <div class="cart_pymt_article coupon">
                        <div class="cart_pymt_article_row">
                            <div class="cart_pymt_article_col">
                                <strong class="cart_pymt_article_title">쿠폰</strong>
                            </div>
                            <div class="cart_pymt_article_col">
                                <span class="posible_coupon">사용가능한 쿠폰 <span class="color_main">0</span>장 <button class="icon_help">?</button> </span>
                                <select name="PRDT_LIST" id="" class="select select_white" >
                                </select>
                                <select name="COUP_LIST" id="" class="select select_white" >
                                </select>
                            </div>
                            <div class="cart_pymt_article_col">
                                <span class="cart_pymt_article_result">-0 원</span>
                            </div>
                        </div>
                    </div>
                    

                    <!-- 모바일에서 보여짐 시작 -->
                    <div class="final_mobile_show">
                        <h4 class="cart_pymt_title">최종 결제 금액</h4>    
                            <div class="cart_pymt_final_top">
                                <table class="cart_pymt_final_table">
                                    <tbody>
                                        <tr>
                                            <th>총 상품 금액</th>
                                            <td><span>0 원</span></td>
                                        </tr>
                                        <tr>
                                            <th>즉시 할인</th>
                                            <td><span class="color_main">-0 원</span></td>
                                        </tr>
                                        <tr>
                                            <th>쿠폰 할인 금액</th>
                                            <td><span class="color_main">-0 원</span></td>
                                        </tr>
                                        <tr>
                                            <th>총 상품 금액</th>
                                            <td><span>0 원</span></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                    </div>
                    <!-- 모바일에서 보여짐 끝 -->


                    
                    <div class="cart_pymt_article method">
                        <div class="cart_pymt_article_row">
                            <div class="cart_pymt_article_col">
                                <strong class="cart_pymt_article_title">결제수단</strong>
                            </div>
                            <div class="cart_pymt_article_col">
                                <div class="card_item_area">
                                    <button type="button" class="payMethod card_item is-active">신용카드</button>
                                    <button type="button" class="payMethod card_item">가상계좌</button>
                                    <button type="button" class="payMethod card_item">계좌이체</button>
                                    <button type="button" class="payMethod card_item">휴대폰결제</button>
                                    <button type="button" class="payMethod card_item">피플메이드페이</button>
                                </div>
                            </div>
                            <div class="cart_pymt_article_col">
                                <a href="javascript:;" class="method_info">무이자 할부 안내</a>
                            </div>
                        </div>
                    </div>

                    <div class="cart_pymt_article method" id="cashRecei" style="display: none;">
                        <div class="cart_pymt_article_row">
                            <div class="cart_pymt_article_col">
                                <strong class="cart_pymt_article_title">현금영수증 발급</strong>
                            </div>
                            <div class="cart_pymt_article_col">
                            
				                            <div class="pt_total" style="text-align: left;">
				                                <ul class="designRadiobutton form-control-sm"  >
				                                	<li style="display: inline-block;">
					                                	<div class="designRadiobutton form-control-sm">
															<input type="radio" id="receiptApplyed_true" name="CASH_RECEIPT" value="true" >
															<label for="receiptApplyed_true"  class="label_txt" style="z-index:0;">신청하기</label>
														</div>
													</li>
													<li style="display: inline-block;">
														<div class="designRadiobutton form-control-sm">
															<input type="radio" id="receiptApplyed_false" name="CASH_RECEIPT" value="false" checked="checked" >
															<label for="receiptApplyed_false" class="label_txt" style="z-index:0;">신청안함</label>
														</div>
													</li>
										        </ul>
										        <br>
										        <ul class="designRadiobutton form-control-sm"  style="display: none;" id="RECE_WHY" >
										        	<li style="display: inline-block;">
										        		<div class="designRadiobutton form-control-sm">
															<input type="radio" id="receiptIssueUsageCode_1"  name="CASH_RECE_WHY" value="PERSONAL_INCOME_TAX" checked="checked">
															<label for="receiptIssueUsageCode_1" class="label_txt">개인소득공제용</label>
														</div>
										        	</li>
													<li style="display: inline-block;">
														<div class="designRadiobutton form-control-sm">
															<input type="radio" id="receiptIssueUsageCode_2"  name="CASH_RECE_WHY" value="BIZ_EXPENSE_PROOF">
															<label for="receiptIssueUsageCode_2" class="label_txt">사업자증빙용(세금계산서용)</label>
														</div>
													</li>
										        </ul>
										        <ul id="receiptNm" style="display: none;">
										        	<li><span class="names">이름</span>
											        <input name="CASH_RECEIPT_NM" class="cash_input">
										        	</li>
										        	
										        </ul>
										        <div style="display: none;" class="PERSONAL_INCOME_TAX">
										        	<select class="cash_select"  name="CASH_RECE_KIND">
										        		<option value="휴대폰번호" selected="selected">휴대폰번호</option>
										        		<option value="주민등록번호" >주민등록번호</option>
										        	</select>
										        </div>
										        <span style="display: none;" class="resident_group socialNumber PERSONAL_INCOME_TAX" >
													<p class="cash_item tell_item post_item_tell">
													<input type="text" id="id_num" class="cash_input" name="CASH_RECE_SOCIAL_NUM1" maxlength="13" placeholder="-빼고 입력하세요" value="" style=" width: calc( 100% - 159px )" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
<!-- 													<span class="tell_mark">-</span> -->
<!-- 													<input type="password" id="id_num2" class="cash_input" name="CASH_RECE_SOCIAL_NUM2" maxlength="7"  value="" style=" width: 30%;"> -->
													</p>
												</span>
										        <span style="display: none;" class="resident_group phoneNumber PERSONAL_INCOME_TAX">
										        
										        	<p class="cash_item tell_item post_item_tell">
						                                <input type="text" name="CASH_RECE_PHONE_NUM1" class="cash_input" maxlength="11" placeholder="-빼고 입력하세요" style=" width: calc( 100% - 159px )" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
<!-- 						                                <span class="tell_mark">-</span> -->
<!-- 						                                <input type="text" name="CASH_RECE_PHONE_NUM2" class="cash_input" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"> -->
<!-- 						                                <span class="tell_mark">-</span> -->
<!-- 						                                <input type="text" name="CASH_RECE_PHONE_NUM3" class="cash_input" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"> -->
						                            </p>
										        
												</span>
				
												<div style="display: none;" class="BIZ_EXPENSE_PROOF">
										        <span style="display: inline;" class="resident_group bizNumber BIZ_EXPENSE_PROOF">
											        	<span class="names">사업자등록번호</span>
										        	<p class="cash_item tell_item post_item_tell" style="margin-top: 0px;">
											      	    <input type="text" class="cash_input" name="CASH_RECE_BIZ_NUM1" placeholder="-빼고 입력하세요" maxlength="10" value="" style="width: 100%;" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
<!-- 											      	    <span class="tell_mark">-</span> -->
<!-- 														<input type="text" class="cash_input" name="CASH_RECE_BIZ_NUM2" maxlength="2" value="" style="width: 20%;"> -->
<!-- 														<span class="tell_mark">-</span> -->
<!-- 														<input type="password" class="cash_input" name="CASH_RECE_BIZ_NUM3" maxlength="5"  value="" style="width: 30%;"> -->
										        	</p>
												</span>
										        </div>
										        
												
				                            </div>
											<script type="text/javascript">
												$(document).on('change', 'input[name=CASH_RECEIPT]', function (){
													if ($("input[name=CASH_RECEIPT]:checked").val() == 'true' ) {
														if ( $('[name=sndPaymethod]').val() == '0100000000' ) {
															$('#RECE_WHY').show();		
															$('#receiptIssueUsageCode_1').prop('checked', true);
															$('.PERSONAL_INCOME_TAX').not('.socialNumber').css('display','inline');
															$('.BIZ_EXPENSE_PROOF').hide();
															$('#receiptNm').show();
														}
														$('[name=sndCashReceipt]').val('1');
													}else{
														$('#receiptNm').hide();
														$('#RECE_WHY').hide();		
														$('.PERSONAL_INCOME_TAX').hide();
														$('.BIZ_EXPENSE_PROOF').hide();
														$('[name=sndCashReceipt]').val('0');
													}
												});
												
												$('input[name=CASH_RECE_WHY]').on('change',function(){
													if ($("input[name='CASH_RECE_WHY']:checked").val() == 'PERSONAL_INCOME_TAX' ) {
														$('[name=CASH_RECE_KIND]').val('휴대폰번호');
														$('.PERSONAL_INCOME_TAX').not('.socialNumber').css('display','inline');
														$('.BIZ_EXPENSE_PROOF').hide();
													}else{
														$('.PERSONAL_INCOME_TAX').hide();
														$('.BIZ_EXPENSE_PROOF').show();
													}
												});
												
												$('[name=CASH_RECE_KIND]').on('change', function(){
													if ( this.value == '휴대폰번호' ) {
														$('.socialNumber').hide();
														$('.phoneNumber').css('display','inline');
													}else{
														$('.phoneNumber').hide();
														$('.socialNumber').css('display','inline');
													}
												});
												
											</script>	
                            	
                            </div>
                          
                        </div>
                    </div>







                </div>
                <div class="cart_pymt_left">
                    <h4 class="cart_pymt_title">최종 결제 금액</h4>
                    <div class="cart_pymt_final">
                        <div class="cart_pymt_final_top">
                            <table class="cart_pymt_final_table">
                                <tr>
                                    <th>총 상품 금액</th>
                                    <td><span>0 원</span></td>
                                </tr>
                                <tr>
                                    <th>즉시 할인</th>
                                    <td><span class="color_main">-0 원</span></td>
                                </tr>
                                <tr>
                                    <th>쿠폰 할인 금액</th>
                                    <td><span class="color_main">-0 원</span></td>
                                </tr>
                                <tr>
                                    <th>총 상품 금액</th>
                                    <td><span>0 원</span></td>
                                </tr>
                            </table>
                    
                        </div>
                        <div class="cart_pymt_final_bottom">
                            <div class="cart_pymt_terms_top">
                                <label for="all" class="form_check border_color_main">
                                    <input type="checkbox" id="all" name="all">
                                    <span class="form_check_mark"></span>
<!--                                     주문 상품정보 및 이용 약관 동의하기 -->
                                    상품구매 조건 확인 및 동의하기
                                </label>
                            </div>
                            
                            <ul class="cart_pymt_terms_bottom">
                                <li>
                                    <label for="terms1" class="form_check">
                                        <input type="checkbox" id="terms1" name="terms">
                                        <span class="form_check_mark"></span>
                                        상품 구매조건 확인 및 취소 환불 규정 동의
                                    </label>
                                </li>
<!--                                 <li> -->
<!--                                     <label for="terms2" class="form_check"> -->
<!--                                         <input type="checkbox" id="terms2" name="terms"> -->
<!--                                         <span class="form_check_mark"></span> -->
<!--                                         개인정보 수집 및 이용 동의 -->
<!--                                     </label> -->
<!--                                     <a style="cursor: pointer;" class="pop_open" data-popup="childRegisterPop4">내용보기</a> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <label for="terms3" class="form_check"> -->
<!--                                         <input type="checkbox" id="terms3" name="terms"> -->
<!--                                         <span class="form_check_mark"></span> -->
<!--                                         개인정보 제공 및 위탁 동의 -->
<!--                                     </label> -->
<!--                                     <a style="cursor: pointer;" class="pop_open" data-popup="childRegisterPop3">내용보기</a> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <label for="terms4" class="form_check"> -->
<!--                                         <input type="checkbox" id="terms4" name="terms"> -->
<!--                                         <span class="form_check_mark"></span> -->
<!--                                         결제대행서비스 이용약관 동의 -->
<!--                                     </label> -->
<!--                                     <a style="cursor: pointer;" class="pop_open" data-popup="childRegisterPop2">내용보기</a> -->
<!--                                 </li> -->
                                <li>
                                    <label for="terms5" class="form_check">
                                        <input type="checkbox" id="terms5" name="terms">
                                        <span class="form_check_mark"></span>
                                        혜택 및 이벤트정보 수신동의(선택)
                                    </label>
<!--                                     <a style="cursor: pointer;" class="pop_open" data-popup="childRegisterPop5">내용보기</a> -->
                                </li>
                            </ul>
                        
                        </div>
                        <div class="cart_pymt_final_button">
                            <button class="btn_cart_pymt_final" onclick="fn_isMobilePay();">결제하기</button>
                        </div>
                        
                    </div>

                </div>
            </div>
        </section>

        
    </div><!-- // #container -->



<!-- 팝업의 영역 -->

<div id="childRegisterPop4" class="popup_wrap">
	<div class="popup_layer"></div>
	<div class="popup_box">
	<div class="popup_content phone_popup_content teblet_popup_content register_popup_content4" style="text-align:left;">
<!--                                     <button type="button" class="pop_close"></button> -->
	                                    
	<div class="register_pop_box">
	<h4 class="rp_title">개인정보처리방침</h4>
 	 <p class="rp_text">
	<div class="over" style=" overflow-y:scroll; height:400px; padding-right: 10px; width:100%;">
	<div class="leave_text_box" >
           주식회사 피플메이드(이하 “회사”)은 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』(이하 “정보통신망법”), 『개인정보 보호법』 등 관련 법령상의 개인정보 보호규정을 준수하며, 정보통신망법에 의거한 개인정보처리방침을 정하여 이용자 권익보호에 최선을 다하고 있습니다. 본 개인정보처리방침은 회사가 제공하는 웹/모바일웹/엡 서비스에 적용되며 다음과 같은 내용을 포함하고 있습니다.
                        <br><br>
                        <b>1. 이용자의 권리 및 행사방법</b>
                        <br>
                        ① 이용자는 언제든지 정보주체로서의 권리(등록되어 있는 본인의 개인정보를 열람, 정정, 동의 철회, 삭제)를 행사할 수 있으며, 아래 사항에 대한 열람, 제공, 정정, 동의 철회, 삭제(탈퇴), 처리 정지, 이의제기 등을 요구할 수 있습니다.
                        <br>
                            1) 회사가 보유하고 있는 이용자의 개인정보
                        <br>
                            2) 회사가 이용자의 개인정보를 이용하거나 제3자에게 제공한 현황
                        <br>
                            3) 이용자가 개인정보 수집·이용·제공 등의 동의를 한 현황
                        <br>
                                - 조회 및 수정 : 로그인 후 마이페이지 > 프로필 수정
                        <br>
                                - 삭제 및 회원탈퇴 : 로그인 후 마이페이지 > 회원탈퇴
                        <br>
                                - 동의 철회(이벤트 정보수신) : 로그인 후 마이페이지 > 설정 변경
                        <br>
                           4) 회사는 관련된 상담 및 문의처리를 위해 별도의 고객센터를 운영하고 있으며, 개인정보 보호책임자에게 이메일 또는 전화로 연락하시면 지체없이 조치하겠습니다.
                        <br>
                        ② 이용자가 개인정보의 오류에 대한 정정을 요청하신 경우, 완료하기 전까지 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다.
                        <br>
                        <br>
                        <b>2. 이용자의 의무</b>
                        <br>
                        이용자는 자신의 개인정보를 보호할 의무가 있으며, 회사의 고의 또는 과실 등 귀책사유 없이 ID/비밀번호 공유, 로그인 상태에서 자리를 비우는 등 이용자의 부주의로 인하여 발생하는 문제에 대해서는 회사가 책임지지 않습니다.
                        <br>
                        ① 이용자는 개인정보를 최신의 상태로 유지해야 하며, 부정확한 정보 입력으로 발생하는 문제의 책임은 이용자 자신에게 있습니다.
                        <br>
                        ② 이용자의 ID/비밀번호는 원칙적으로 본인만 사용하여야 하며 제3자에게 이를 양도하거나 대여할 수 없습니다. 타인의 개인정보를 도용한 회원가입 또는 ID 등을 도용하여 구매한 경우, 회원자격 상실 및 관계 법령에 따라 처벌될 수 있습니다.
                        <br>
                        ③ 이용자의 회사의 서비스를 이용한 후 반드시 계정을 로그아웃하고 웹 브라우저 프로그램을 종료해야 합니다.
                        <br>
                        3. 자동 수집되는 개인정보 및 거부에 관한 사항
                        <br>
                        회사는 이용자 맞춤서비스 등을 제공하기 위하여 쿠키(Cookie)를 설치 및 운영 합니다. 쿠키의 사용 목적과 거부에 관한 사항은 다음과 같습니다.
                        <br>
                        ① 쿠키란 : 쿠키는 웹사이트를 운영하는데 이용되는 서버가 이용자의 브라우저에 보내는 아주 작은 텍스트 파일로 이용자의 컴퓨터에 저장되어 운영됩니다.
                        <br>
                        ② 쿠키의 사용 목적 : 이용자의 접속 빈도나 방문 시간 등의 분석, 이용 형태 및 관심분야 파악, 자취 추적, 각종 이벤트 참여 정도, 방문 횟수 파악 등을 타겟 마케팅 등 개인별 맞춤 서비스를 제공하기 위해 쿠키를 사용 합니다.
                        <br>
                        ③ 쿠키의 설치·운영 및 거부
                        <br>
                           1) 이용자는 쿠키 설치에 대한 선택권을 가지고 있으며, 웹브라우저별 옵션 선택을 통해 모든 쿠키를 허용 또는 거부 하거나, 쿠키가 저장될 때마다 확인을 거치도록 할 수 있습니다. 쿠키 설치 허용여부를 지정하는 방법은 다음과 같습니다.
                        <br>
                                - Internet Explorer : 도구 메뉴 > 인터넷 옵션 > 개인정보 탭 > 개인정보처리 수준 설정
                        <br>
                                - Chrome : 설정 메뉴 > 고급 설정 표시 선택 > 개인정보-콘텐츠 설정 > 쿠키 수준 설정
                        <br>
                                - Firefox : 옵션 메뉴 > 개인정보 > 방문기록 -사용자 정의 설정 > 쿠키 수준 설정
                        <br>
                                - Safari : 환경설정 메뉴 > 개인정보 탭 > 쿠키 및 웹 사이트 데이터 수준 설정
                        <br>
                            2) 단, 쿠키의 저장을 거부하였을 경우에는 로그인이 필요한 서비스 등 일부 서비스 이용에 어려움이 있을 수 있습니다.
                        <br>
                        4. 개인정보 수집항목 및 이용 목적
	</div>
                                        </div>
										
                                        <br><br>
                                 
                                        <div class="rp_checkbox">
<!--                                             <input type="checkbox" id="keepLoginCheck1" class="custom_sq_check"> -->
<!--                                             <label for="keepLoginCheck1" class="custom_sq_label"></label> -->
<!--                                             <label for="keepLoginCheck1" class="custom_sq_text">개인정보 수집 및 이용에 대한 동의 (필수)</label> -->

                                        <input type="checkbox" id="keepCheck1" name="keepCheck">
                                        <span class="form_check_mark"></span>
                                        <label for="keepCheck1" class="custom_sq_text">개인정보 수집 및 이용에 대한 동의 (필수)</label>
                                        </div>
                                    </div>
            <div class="popup_bottom popup_bottom_box">
                                 
                                    <button type="button" class="account_btn_account account_btn_border3">확인</button>
                                    <button type="button" class="account_btn_account2 account_btn_border4">취소</button>

			</div>
<!--                                     <div class="popup_bottom"> -->
<!--                                         <button type="button" class="apply_pop_btn" onclick="alert('개인정보 수집 및 이용에 대한 동의 (필수)를 체크 해주세요.')">확인</button> -->
<!--                                         <button type="button" class="apply_pop_btn" >확인</button> -->
<!--                                          <button type="button" class="apply_pop_btnx ">취소</button> -->
<!--                                     </div> -->
		</div>
	</div>
</div><!-- //#childRegisterPop4 -->


<div id="childRegisterPop3" class="popup_wrap">
                            <div class="popup_layer"></div>
                            <div class="popup_box">
                                <div class="popup_content phone_popup_content teblet_popup_content register_popup_content3" style="text-align:left;">
<!--                                     <button type="button" class="pop_close"></button> -->
                                    
                                    <div class="register_pop_box">
                                        <h4 class="rp_title">이용약관</h4>
                                        <p class="rp_text">
										<div class="over" style=" overflow-y:scroll; height:400px; padding-right: 10px;
   
										width:100%">
                                            <div class="leave_text_box" >
                        <b>피플메이드 서비스 마스터 이용약관(개인용)<br><br>제1조 (목적)</b>본 약관은 피플메이드(이하 “회사”라 함)와 회사가 운영하는 지식iN 피플메이드 사이트(PC, 모바일 어플리케이션, 모바일웹 등을 모두 포함하여 이하 “피플메이드 사이트”라 함), 피플메이드 센터를 통해 제공하는 인터넷 마스터 상담 등 전자상거래 중개 서비스(이하 “피플메이드 서비스”라 함)에 피플메이드 서비스 입점하는 마스터(이하 “마스터” 또는 “피플메이드”라 함) 간의 권리, 의무, 책임, 제반 절차 및 기타 필요한 사항을 규정함을 목적으로 합니다.
                        <br><br>
                        <b>제2조 (정의)</b>
                        <br>
                        ①본 약관에서 사용하는 용어의 정의는 아래와 같습니다.
                        <br>
                        1.“상품”이라 함은 피플메이드 서비스에서 마스터가 통신판매하고, 회사가 통신판매중개를 하는 상담, 온라인 클래스 등(이상을 총칭하여 이하 “상담”이라 함) 용역 상품을 의미합니다. 피플메이드 서비스 내에서 판매할 수 있는 상품은 마스터가 상품의 판매조건에 따른 최종 작업물을 구매회원에게 제공하는 건당 과금 상품과 마스터가 상품의 판매조건에 따라 유료 상담 채팅 서비스, 온라인 클래스 서비스를 제공하는 시간당 과금 상품 등으로 구분됩니다.
                        <br>
                        2.“마스터”라 함은 본 약관에 따라 회사와 이용계약을 체결하고 피플메이드 서비스에 입점한 자로서 상품을 등록하여 제공하는 자를 의미합니다.
                        <br>
                        3.“구매회원”이라 함은 피플메이드 서비스를 통해 상품을 구매하는 자를 의미합니다.
                        <br>
                        4.“피플메이드 센터”라 함은 마스터가 피플메이드 서비스의 이용과 관련된 신청, 관리를 할 수 있도록 회사가 제공하는 PC 및 모바일 웹사이트를 의미합니다.
                        <br>
                        5.“판매대금”이라 함은 마스터가 피플메이드 서비스를 통해 판매한 상품에 있어서 구매회원의 실제 결제금액(상품 판매가격에서 쿠폰 등 할인수단 사용에 따른 할인금액을 제외한 금액)을 의미합니다.
                        <br>
                        ②본 조에서 정하지 않은 용어의 정의는 관련 법령 및 일반적인 상관례에 따릅니다.
                        <br><br>
                        <b>제3조 (약관의 게시 및 개정)</b>
                        <br>
                        ①회사는 본 약관의 내용과 상호, 사업자등록번호, 사업장 소재지, 연락처 등을 마스터가 쉽게 알 수 있도록 피플메이드 사이트, 피플메이드 센터의 초기화면 및 연결화면에 게시합니다.
                        <br>
                        ②회사는 피플메이드 서비스 운영의 필요에 따라 전자상거래 등에서의 소비자보호에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관련 법령을 위반하지 아니하는 범위 내에서 본 약관을 개정할 수 있습니다.
                        <br>
                        ③회사는 본 약관을 개정하는 경우 개정내용과 적용일자를 명시하여 피플메이드 센터를 통해 그 적용일자 7일 전부터 적용일자 전일까지 공지합니다. 다만, 마스터에게 불리하게 개정되는 경우에는 개정약관의 적용일자 30일 전부터 적용일자까지 공지합니다.
                        <br>
                        ④회사가 본 조 제3항에 따라 개정약관을 공지 또는 통지하고 적용일 전까지 마스터가 거부의사를 표명하지 않으면 개정약관에 동의한 것으로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 마스터가 명시적으로 거부의사를 표명하지 아니한 경우 개정약관에 동의한 것으로 봅니다.
                        <br><br>
                        <b>제4조 (약관의 효력 등)</b>
                        <br>
                        ①회사는 피플메이드 서비스 중 특정 서비스에 적용하기 위한 약관(이하 “개별약관”이라 함)을 별도로 제정할 수 있으며, 마스터가 개별약관에 동의한 경우 개별약관은 이용계약의 일부를 구성합니다. 개별약관에 본 약관과 상충하는 내용이 있을 경우 달리 정함이 없는 한 개별약관의 내용이 우선 적용됩니다.
                        <br>
                        ②회사는 본 약관에 세부적으로 규정되지 않는 내용에 대하여 상세히 정하기 위하여 운영정책을 제정할 수 있고, 본 약관 및 운영정책의 구체적인 적용 및 피플메이드 서비스의 이용방법을 안내하는 도움말을 작성하여 안내할 수 있으며, 해당 내용을 피플메이드 서비스 또는 피플메이드 센터를 통해 게시합니다.
                        <br>
                        ③본 약관에 따라 마스터로 가입하고자 하는 자는 본 약관의 내용을 숙지하고 마스터와 회사 간의 권리와 의무 관계에 대해 동의함을 확인합니다.
                        <br>
                        <b>제5조 (이용계약의 체결)</b>
                        <br><br>
                        ①피플메이드 서비스에 마스터로 가입하고자 하는 자는 관련 법령, 본 약관 및 운영정책, 도움말 등 안내에 따라 회사가 요청하는 증빙 서류가 있는 경우 신속히 제출하여야 하며, 회사는 해당 증빙 서류를 수신하는 시점까지 가입신청에 대한 승낙을 유보하거나 거절할 수 있습니다.
                        <br>
                        ②피플메이드 서비스의 마스터 가입은 인터넷 마스터 상담 등 전자상거래 중개 서비스인 피플메이드 서비스에서 거래되는 상품의 품질 보장 및 관련 법령상 요구되는 동의절차 간소화를 위해 만 19세 이상인 경우에만 가능합니다.
                    </div>
                                        </div>
										
                                        <br><br>
                                        <div class="rp_checkbox">
                                            <input type="checkbox" id="keepCheck2"  name="keepCheck">
                                            <label for="keepCheck2" class="custom_sq_text">서비스 이용약관 동의 (필수)</label>
                                        </div>
                                    </div>
                                    
                                                                        <div class="popup_bottom popup_bottom_box">
                                    <button type="button" class="account_btn_account account_btn_border3">확인</button>
                                    <button type="button" class="account_btn_account2 account_btn_border4">취소</button>
                                        
                                        
                                    </div>
                                    
                                    
<!--                                     <div class="popup_bottom"> -->
<!--                                         <button type="button" class="apply_pop_btn" onclick="alert('개인정보 수집 및 이용에 대한 동의 (필수)를 체크 해주세요.')">확인</button> -->
<!--                                         <button type="button" class="apply_pop_btn account_btn2finish account_btn_border3" >확인</button> -->
<!--                                          <button type="button" class="apply_pop_btnx account_btn2finish2 account_btn_border4 ">취소</button> -->
<!--                                     </div> -->
                                </div>
                            </div>
                        </div><!-- //#childRegisterPop3 -->

<div id="childRegisterPop2" class="popup_wrap">
                            <div class="popup_layer"></div>
                            <div class="popup_box">
                                <div class="popup_content phone_popup_content teblet_popup_content register_popup_content3" style="text-align:left;">
<!--                                     <button type="button" class="pop_close"></button> -->
                                    
                                    <div class="register_pop_box">
                                        <h4 class="rp_title">결제대행서비스 약관</h4>
                                        <p class="rp_text">
										<div class="over" style=" overflow-y:scroll; height:400px; padding-right: 10px;
   
										width:100%">
                                            <div class="leave_text_box">

							‘회사’는 사용자가 구매 신청한 ‘상품 등이 품절 등의 사유로 인도 또는 제공할 수 없을 때에는 지체 없이 그 사유를
							사용자에게 통지하여야 하고, 사전에 ‘상품 등의 대금을 받은 경우에는 대금을 받은 날로부터 영업일 기준 7일 이내에
							사용자가 요청한 내용을 처리하여야 한다. <br>
							<br> <b>제 1조 [용어의 정의]</b>

							<!--                        <b class="text_bar">가. 본 약관 및 피플메이드에서 제공하는 서비스에서의 용어 정의.</b> -->
							<br> <b class="textbar">1. ‘회사’라 함은 ㈜피플메이드를 말한다. <br>
								&nbsp;&nbsp;2. ‘마스터’란 ㈜피플메이드에서 활동하는 강사 또는 전문가를 말한다. <br>
								&nbsp;&nbsp;3. ‘사용자’란 서비스 구매자를 말한다. <br> &nbsp;&nbsp;4.
								‘VOD’ 란 영상화 된 강의를 의미합니다. <br> &nbsp;&nbsp;5. “1:1 코칭”이란 화상
								상담, 채팅 상담, 이메일 상담을 의미합니다. <br> &nbsp;&nbsp;6. “복합상품”이라 함은 두
								가지 이상의 상품이 결합되어 하나의 상품으로 판매되는 것을 말한다. <br> &nbsp;&nbsp;7.
								“복수상품”이라 함은 두 가지 이상의 상품을 말한다. <br> &nbsp;&nbsp;8. “기술적
								결함”이라 함은 피플메이드가 제공하는 서비스에서 발생되는 기계적 결함을 말한다. <br>



							</b> <br>

							<!-- <b>나.  본 약관에서 정하지 않은 용어의 정의는 관련 법령 및 일반적인 상관례에 따릅니다.</b> -->

							<b>제 2조 [취소 및 환불적용 기준] </b><br> <b class="text_bar">서비스별
								취소 및 환불적용 기준은 아래와 같습니다. </b> <br> <br> <b>VOD강의 취소 및
								환불</b> <br> <b class="text_bar">피플메이드에서 제공하는 VOD강의
								(‘디지털콘텐츠’)의 취소 및 환불의 기준은 아래와 같다. </b> <br> <b class="textbar">
								<취소 및 환불기준>
							</b>


							<div class="page-body">
								<!-- START : Contents -->






								<div class="tbl_list">
									<table class="list_tbl01" summary="">
										<caption>관리자 리스트 테이블</caption>
										<colgroup>
											<col style="width: 33.3%;">
											<col style="width: 33.3%;">
											<col style="width: 33.3%;">

										</colgroup>
										<thead>
											<tr>
												<th scope="col">취소 및 전액환불</th>
												<th scope="col">취소불가 및 50%환불</th>
												<th scope="col">취소 및 환불불가</th>
											</tr>
										</thead>
										<tbody>



											<tr>
												<td>수강시작 전 또는 진행 후 3일 미만 또는 2개 미만 강의를 수강 시</td>
												<td>수강시작 후 3일 이상 7일 이하 2개 이상 5개 미만 강의를 수강 시</td>
												<td>수강시작 후 7일 초과 또는 5개 이상 강의를 수강 시</td>

											</tr>

										</tbody>
									</table>
								</div>

								<b class="pps_per" style="font-weight: 300;"> ※ 수강시작은 구매한
									디지털콘텐츠 클릭 후 부터로 간주하며, 콘텐츠를 클릭하지 않은 경우, 결제 후 7일이 지난 후에는 자동으로 수강이
									시작된 것으로 간주한다. <!--    ※수강시작은 아래와 같이 두 가지의 경우로 간주한다. --> <br>
									<!--        1) 결제 후 7일이 지난 후 수강시작으로 간주한다.  --> <br> <!--      2) 구매한 디지털콘텐츠 클릭 후 수강시작으로 간주한다.  -->
								</b>



							</div>
							<br>
							<br> <b>1:1 코칭 취소 및 환불</b> <br> <b class="text_bar">피플메이드에서
								제공하는 1:1 코칭 (화상/채팅/이메일)의 취소 및 환불의 기준은 아래와 같습니다.</b> <br> <b
								class="textbar"> <취소 및 환불기준></b>


							<div class="page-body">
								<!-- START : Contents -->






								<div class="tbl_list">
									<table class="list_tbl01" summary="">
										<caption>관리자 리스트 테이블</caption>
										<colgroup>
											<col style="width: 20%;">
											<col style="width: 23%;">
											<col style="width: 23%;">
											<col style="width: 23%;">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">서비스 유형</th>
												<th scope="col">취소 및 전액환불</th>
												<th scope="col">취소 및 50%환불</th>
												<th scope="col">취소 및 환불 불가</th>
											</tr>
										</thead>
										<tbody>



											<tr>
												<td>· 1:1 화상<br>· 1:1 채팅
												</td>
												<td>· 상담시작 12시간 전 취소 신청 시</td>
												<td>· 상담시작 “12시간 - 3시간 전” 취소 신청 시 <br>· 1회 이상 시간변경
													후 취소 신청 시
												</td>
												<td>· 즉시상담 상품 <br> · 사용자의 미 참여<br> · 사용자의 자의적
													탈퇴<br> · 상담 3시간 이내
												</td>
											</tr>
											<tr>
												<td>· 1:1 이메일</td>
												<td>· 미사용 시</td>
												<td>· 1회 사용 시</td>
												<td>· 2회 이상 사용 시</td>
											</tr>
										</tbody>
									</table>
								</div>

								<b class="pps_per" style="font-weight: 300;">※기술적 결함 또는
									천재지변의 사유로 정상적으로 진행이 되지 않은 경우 ‘기타 사유로 인한 취소 및 환불’ 참고 <br>
									※즉시상담 서비스란 ‘즉시상담이 가능한 마스터’에서 선택하여 신청한 서비스를 말한다. <br>

								</b>



							</div>
							<br> <b>LIVECLASS 취소 및 환불 </b> <br> <b class="text_bar">피플메이드에서
								제공하는 LIVECLASS의 취소 및 환불의 기준은 아래와 같습니다. </b> <br> <b
								class="textbar"> <취소 및 환불기준></b>


							<div class="page-body">

								<div class="tbl_list">
									<table class="list_tbl01" summary="">
										<caption>관리자 리스트 테이블</caption>
										<colgroup>
											<col style="width: 33.3%;">
											<col style="width: 33.3%;">
											<col style="width: 33.3%;">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">취소 및 전액환불</th>
												<th scope="col">취소 및 50%환불</th>
												<th scope="col">취소 및 환불 불가</th>
											</tr>
										</thead>
										<tbody>



											<tr>
												<td>· 신청마감 전 <br>· 마스터의 사유로 취소 시
												</td>
												<td>· “신청마감 후 – 시작 3시간 전” 취소 신청 시</td>
												<td>· 사용자의 미 참여<br>· 사용자의 자의적 탈퇴<br>· 시작 전
													3시간 이내

												</td>

											</tr>

										</tbody>
									</table>
								</div>

								<b class="pps_per" style="font-weight: 300;">※기술적 결함 또는
									천재지변의 사유로 정상적으로 진행이 되지 않은 경우 ‘기타 사유로 인한 취소 및 환불’ 참고 </b>
							</div>
							<br>
				


							<b>제 3조 [기타 사유로 인한 취소 및 환불] </b> <br> <b class="text_bar">기타
								사유로 인한 취소 및 환불</b> <br> <b class="textbar"> 다음과 같은 사례가 발생하는
								경우 취소 및 환불이 신청이 가능합니다. <br> &nbsp;&nbsp;&nbsp;&nbsp;1. 마스터의
								불찰로 진행이 어려운 경우 <br> &nbsp;&nbsp;&nbsp;&nbsp;2. 마스터의 신청으로
								진행이 취소되는 경우 <br> &nbsp;&nbsp;&nbsp;&nbsp;3. 기술적 결함으로 진행이 되지
								못 한 경우 우선적으로 재이용권을 부여하며 지속적인 결함으로 진행이 어려운 경우 취소 및 환불을 진행 <br>
								&nbsp;&nbsp;&nbsp;&nbsp;4. 천재지변으로 인하여 진행이 어려운 상황을 증빙할 수 있는 경우




							</b> <br> <br> <b class="pps_per" style="font-weight: 300;">※마스터의
								사유로 인한 취소 및 환불은 담당자를 통한 확인절차를 진행 한 후 취소 또는 환불이 가능합니다. <br>
								※기술적 결함 또는 천재지변의 사유로 정상적으로 진행이 되지 않은 경우 담당부서의 확인 후 우선적으로 재사용권
								지급으로 처리되며 이 후 지속적으로 정상진행이 되지 않은 경우 취소/환불을 순차적으로 진행합니다.

							</b> <br>
							<br> <b>제 4조 [쿠폰 및 무료사용권 취소] </b> <br> <b
								class="text_bar"><strong>쿠폰 및 무료사용권 이용정책 </strong></b> <br>
							<b class="textbar">1. 지급된 쿠폰 및 무료사용권은 이용기간 이후에는 사용 할 수 없습니다.
								<br> &nbsp;&nbsp;&nbsp;&nbsp;2. 지급된 쿠폰 및 무료사용권은 환불이 불가능
								합니다. <br> &nbsp;&nbsp;&nbsp;&nbsp;3. 사용한 쿠폰 및 무료사용권은 재발급 또는
								재사용이 불가합니다.
							</b><br>
						
							<br> <b>제 5조 [결제수단에 따른 환불기간]</b> <br> <b
								class="text_bar"><strong>결제수단에 따른 환불 기간 및 특성</strong></b>


							<div class="page-body">

								<div class="tbl_list">
									<table class="list_tbl01" summary="">
										<caption>관리자 리스트 테이블</caption>
										<colgroup>
											<col style="width: 33.3%;">
											<col style="width: 33.3%;">
											<col style="width: 33.3%;">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">결제수단</th>
												<th scope="col">내 용</th>
												<th scope="col">비 고</th>

											</tr>
										</thead>
										<tbody>
											<tr>
												<td style="text-align: center !important;">신용카드 <br>(간편결제
													포함)
												</td>
												<td>평균 7일 이내 <br>(카드사 별 차이가 있을 수 있음)
												</td>
												<td>결제된 신용카드로만 환불이 가능</td>



											</tr>
											<tr>
												<td style="text-align: center !important;">휴대폰결제</td>
												<td>평균 1-2주 이내</td>
												<td>결제된 당월 이후 취소불가 및 협의된 방식으로 환불진행</td>

											</tr>
											<tr>
												<td style="text-align: center !important;">무통장입금</td>
												<td>평균 1-2주 이내</td>
												<td>환불 수수료가 공제된 금액으로 입금되며 본인 통장만 접수 가능</td>
											</tr>

											<tr>
												<td style="text-align: center !important;">실시간계좌이체</td>
												<td>평균 1-4일 이내<br>은행사의 사정에 따라 달라질 수 있음)
												</td>
												<td></td>
											</tr>
										</tbody>
									</table>
									<b class="pps_per" style="font-weight: 300;">※환불 시, 결제수단에 따라 실제 발생한 결제수수료 및 취소수수료 등의 금융수수료는 공제하고 환불될 수 있습니다.</b>
									<b class="pps_per" style="font-weight: 300;">※무통장입금/별도 계좌입금은 환불계좌를 접수 한 후 환불 받으실 수 있습니다.</b>
								</div>
							</div>
							<br>
							<div class="card_box"
								style="background-color: #191c21; border: 0; padding: 1.5em 1.5em;">
								<div class="board_list_item">

									<b class="textbar" style="font-size: 14px;"> <strong><취소
												및 환불기준></strong>
									</b><br> <b class="textbar"> 취소/환불처리 완료를 확인 후 본인명의로 된 계좌를
										접수한다. <br> &nbsp;&nbsp;&nbsp; 본인 계좌를 확인하기 위하여 담당자가 추가 서류
										또는 증빙을 요청할 수 있습니다. <br> &nbsp;&nbsp;&nbsp; 잘 못된 계좌정보 또는
										증빙자료로 접수 시 발생하는 불이익에 대하여 ㈜피플메이드에서는 책임을 지지 않습니다.

									</b>

								</div>
							</div>

							<b>제 6조 [취소 및 환불신청]</b>
							<br>
							<b class="text_bar"><strong>취소 및 환불신청 방법</strong> </b>
							<br> 피플메이드 로그인&nbsp; → &nbsp; 주문내역 확인&nbsp; →
							&nbsp; 취소 상품선택 및 취소 신청&nbsp; → &nbsp; 관리자 확인 및 승인 후 취소 처리 <br>
							<br> <br>


							<b>제 7조 [취소 및 환불불가 항목]</b>
							<br>
							<b class="text_bar"><strong>취소 및 환불불가</strong></b>
							<br>
							<b class="textbar"> 다음과 같은 사유로 인한 취소 및 환불은 불가합니다.
								<br> &nbsp;&nbsp;&nbsp;&nbsp;1. 제 2조 [취소 및 환불적용 기준]에 의거하여 환불이 어렵다고 판단되는 경우.
								<br> &nbsp;&nbsp;&nbsp;&nbsp;2. 환불불가가 명시된 VOD, 1:1코칭, LIVECLASS 또는 그 외 상품을 구매한 경우.
								<br> &nbsp;&nbsp;&nbsp;&nbsp;3. 사용자가 수강시작 후 자의적으로 탈퇴한 경우.
								<br> &nbsp;&nbsp;&nbsp;&nbsp;4. 사용자의 불찰로 인하여 환불이 어렵다고 판단되는 경우.
							</b> <br> <br> <b class="pps_per" style="font-weight: 300;">※마스터의
								사유로 인한 취소 및 환불은 담당자를 통한 확인절차를 진행 한 후 취소 또는 환불이 가능합니다. <br>
								※기술적 결함 또는 천재지변의 사유로 정상적으로 진행이 되지 않은 경우 담당부서의 확인 후 우선적으로 재사용권
								지급으로 처리되며 이 후 지속적으로 정상진행이 되지 않은 경우 취소/환불을 순차적으로 진행합니다.

							</b> <br>
							
						</div>
                                        </div>
										
                                        <br><br>
                                        <div class="rp_checkbox">
                                            <input type="checkbox" id="keepCheck3"  name="keepCheck">
                                            <label for="keepCheck3" class="custom_sq_text">서비스 이용약관 동의 (필수)</label>
                                        </div>
                                    </div>
                                    
                                                                        <div class="popup_bottom popup_bottom_box">
                                    <button type="button" class="account_btn_account account_btn_border3">확인</button>
                                    <button type="button" class="account_btn_account2 account_btn_border4">취소</button>
                                        
                                        
                                    </div>
                                    
                                    
<!--                                     <div class="popup_bottom"> -->
<!--                                         <button type="button" class="apply_pop_btn" onclick="alert('개인정보 수집 및 이용에 대한 동의 (필수)를 체크 해주세요.')">확인</button> -->
<!--                                         <button type="button" class="apply_pop_btn account_btn2finish account_btn_border3" >확인</button> -->
<!--                                          <button type="button" class="apply_pop_btnx account_btn2finish2 account_btn_border4 ">취소</button> -->
<!--                                     </div> -->
                                </div>
                            </div>
                        </div><!-- //#childRegisterPop3 -->


<!-- 팝업의 영역 끝 -->





<!-- <div class="popup popup_interest_free tablet_popup_interest_free phone_popup_interest_free"> -->
<div class="popup popup_interest_free tablet_popup_interest_free" style="z-index:99;">
    <div class="popup_wrapper">
	    <div class="popup_container" style="height:400px; overflow-y:scroll;z-index:99;"> 
	        <div class="popup_header">
	            <strong class="popup_title">▣ 무이자 할부안내 ▣</strong>
	        </div>
	        <div class="popup_body">
	            <div class="refund_info">
<!-- 	                <span>· 취소/ 반품 완료 즉시 카드승인 취소 및  환불이 진행됩니다.</span> -->
<!-- 	                <span>(취소/반품) 완료일 기준 3 ~ 5영업일 소요)</span> -->
<!-- 	                <span>단, 카드사의 사정에 따라 승인 취소 후 환불이 지연될 수 있습니다.</span>  -->
				<span>1. 대상카드  : 기존 신한카드/BC/삼성/현대/KB국민/NH농협/하나카드/롯데카드               </span>
				<span>   (법인, 체크, 선불, 기프트카드 제외)                                          </span>
				<span>2. 대상상점  : 대행가맹점 (단, 일부 가맹점 및 카드사 직가맹점 제외)                    </span>
				<span>3. 대상거래  : 당사 대행가맹점을 이용한 인터넷 쇼핑몰 신용카드 5만원 이상 결제 건           </span>
				<span>4. 대상기간  : 2021.03.01 ~ 2021.03.31                                     </span>
				<span>5. 할부조건  :                                                             </span>
				<br><span>■ NH농협카드                                                               </span>
				<span>2-6개월 무이자                                                             </span>
				<span>7~10개월 부분무이자 : 1,2회차 부담, 잔여회차 무이자                                </span>
				<span>11~12개월 부분무이자 : 1,2,3회차 부담, 잔여회차 무이자                             </span>
				<span>※ 7-12개월 부분무이자는 ARS 사전 등록시에만 적용됩니다. (NH농협카드 : 1644-2009)       </span>
				<br><span>■ BC카드                                                                  </span>
				<span>2-6개월 무이자                                                             </span>
				<span>7~10개월 부분무이자 : 1,2회차 부담, 잔여회차 무이자                                </span>
				<span>11~12개월 부분무이자 : 1,2,3회차 부담, 잔여회차 무이자                             </span>
				<span>※ 7-12개월 부분무이자는 ARS 사전 등록시에만 적용됩니다. (BC카드 : 1899-5772)         </span>
				<br><span>■ 삼성카드                                                                 </span>
				<span>2-6개월 무이자                                                             </span>
				<span>10개월 부분무이자 : 1,2,3,4회차 부담, 5~10회차 무이자                             </span>
				<span>12개월 부분무이자 : 1,2,3,4,5회차 부담, 6~12회차 무이자                           </span>
				<span>18개월 부분무이자 : 1,2,3,4,5,6,7회차 부담, 8~18회차 무이자                       </span>
				<span>24개월 부분무이자 : 1,2,3,4,5,6,7,8,9회차 부담, 10~24회차 무이자                  </span>
				<br><span>■ KB국민카드                                                               </span>
				<span>2-6개월 무이자                                                             </span>
				<span>10개월 부분무이자 : 1,2,3회차 부담, 4~10회차 무이자                               </span>
				<span>12개월 부분무이자 : 1,2,3,4회차 부담, 5~12회차 무이자                             </span>
				<br><span>■ 신한카드                                                                 </span>
				<span>2-6개월 무이자                                                             </span>
				<span>10개월 부분무이자 : 1,2,3,4회차 부담, 5~10회차 무이자                             </span>
				<span>12개월 부분무이자 : 1,2,3,4,5회차 부담, 6~12회차 무이자                           </span>
				<br><span>■ 하나카드                                                                 </span>
				<span>2-8개월 무이자                                                             </span>
				<span>10개월 부분무이자 : 1,2,3회차 부담, 4~10회차 무이자                               </span>
				<span>12개월 부분무이자 : 1,2,3,4회차 부담, 5~12회차 무이자                             </span>
				<br><span>■ 현대카드                                                                 </span>
				<span>2-7개월 무이자                                                             </span>
				<br><span>■ 롯데카드                                                                 </span>
				<span>2-4개월 무이자                                                             </span>

	            </div>
	        </div>
	        <div class="popup_footer">
	            <a class="popup_btn_close" style="color:#fff !important;background-color: black !important';">닫기</a>
	        </div>
	    </div>
	</div>
</div>

<!-- <div class="popup popup_icon_help tablet_popup_interest_free phone_popup_interest_free"> -->
<div class="popup popup_icon_help" style="z-index:99;">
    <div class="popup_wrapper">
	    <div class="popup_container">
	        <div class="popup_header">
	            <strong class="popup_title">사용가능한 쿠폰</strong>
	        </div>
	        <div class="popup_body">
	            <div class="refund_info">
	                <span>결제하시고자 하는 상품에 대한 쿠폰을 보여줍니다.</span>
	                <span>쿠폰을 적용할 상품을 선택하시고 적용하실 쿠폰을 선택해</span>
	                <span>주시면 됩니다.</span> 
	            </div>
	        </div>
	        <div class="popup_footer">
	            <a class="popup_btn_close" style="color:#fff !important;background-color: black !important';">닫기</a>
	        </div>
	    </div>
	</div>
</div>

<div class="popup popup_isMobilePay" style="z-index:99;">
    <div class="popup_wrapper">
	    <div class="popup_container">
	        <div class="popup_header">
	            <strong class="popup_title" style="text-align: center;">-핸드폰 결제시 주의사항-</strong>
	        </div>
	        <div class="popup_body">
	            <div class="refund_info" style="text-align: center;">
	                <span>월말 2 일전 결제시</span>
	                <span>취소 및 환불이 되지 않습니다.</span>
	            </div>
	        </div>
	        <div class="popup_footer">
	            <button class="popup_btn popup_btn_close" onclick="fn_paySubmit();">확인</button>
	        </div>
	    </div>
	</div>
</div>


















<script>

	$(document).ready(function(){
	    checkAllEvent('input[name=all]', '.cart_pymt_terms_bottom input[type=checkbox], .popup_content input[type=checkbox]' );
	    paymentCardEvent();
	    
	    $('.account_btn_account2, .account_btn_account ').on( 'click', function(){
	        $('.popup_wrap').hide();
	    });
	    
	    $('[name=keepCheck]').on('change', function(){
	    	if( $(this).is(':checked') ){
	        	$( '#terms'+ (1 + 1*this.id.replace('keepCheck', '') ) ).prop('checked', true);
	    	}else{
	        	$( '#terms'+ (1 + 1*this.id.replace('keepCheck', '') ) ).prop('checked', false);
	    	}
	    });
	    
	    $('[name=terms]').on('change', function(){
	    	if( $(this).is(':checked') ){
	    		console.log('체크');
	        	$( '#keepCheck'+ ( 1*this.id.replace('terms', '') - 1 ) ).prop('checked', true);
	    	}else{
	    		console.log('비체크');
	        	$( '#keepCheck'+ ( 1*this.id.replace('terms', '') - 1 ) ).prop('checked', false);
	    	}
	    });
	    
	});


    function paymentCardEvent(){
        $('.card_item').on('click', function(){
            $('.card_item').removeClass('is-active');
            $(this).addClass('is-active');
        })
    }
    



</script>

<script type="text/javascript" src="/resources/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/slick.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/common.js"></script>
<!-- <link href="/resources/payment/css/pgstyle.css" rel="stylesheet" type="text/css" charset="utf-8"> -->
<script language="javascript" src="/resources/payment/kspay_web.js"></script>
<script language="javascript">
	function _pay(_frm) 
	{
		// sndReply는 kspay_wh_rcv.jsp (결제승인 후 결과값들을 본창의 KSPayWeb Form에 넘겨주는 페이지)의 절대경로를 넣어줍니다. 
		_frm.sndReply.value           = getLocalUrl("kspay_wh_result") ;
	
		var agent = navigator.userAgent;
		var midx		= agent.indexOf("MSIE");
		var out_size	= (midx != -1 && agent.charAt(midx+5) < '7');
	
		//_frm.target = '_blank';
		_frm.action ='https://kspay.ksnet.to/store/KSPayMobileV1.4/KSPayPWeb.jsp';
		
		_frm.submit();
	}        
            
            
	function _submit(_frm)
	{
		if ($('[name=sndPaymethod]').val() != '11000') {
			_frm.sndReply.value = getLocalUrl("kspay_wh_rcv") ;
			$('[name=sndInstallmenttype]').val('ALL(0:2:3:4:5:6:7:8:9:10:11:12)');
			$('[name=sndStoreid]').val('2001106623');
			$('[name=sndStoreno]').val('KSNET00023');
// 			$('[name=sndStoreid]').val('2999199999');
// 			$('[name=sndAmount]').val('500');
			_pay(_frm);
		}else{
			$('[name=sndInstallmenttype]').val('0:2:3:4:5:6:7:8:9:10:11:12');
			$('[name=sndStoreid]').val('2001106672');
			$('[name=sndStoreno]').val('KSNET00027');
// 			$('[name=sndRetParam]').val('coup='+ $('[name=COUP_LIST]').val() );
			my_pay(_frm);
		}
	}
	function getLocalUrl(mypage) 
	{ 
		var myloc = location.href; 
		return myloc.substring(0, myloc.lastIndexOf('/')) + '/' + mypage;
	} 
	// goResult() - 함수설명 : 결재완료후 결과값을 지정된 결과페이지(kspay_wh_result.jsp)로 전송합니다.
	function goResult(){
		if ($('[name=sndPaymethod]').val() != '11000') {
		document.KSPayWeb.target = "";
		document.KSPayWeb.action = "./kspay_wh_result";
		document.KSPayWeb.submit();
		}else{
		$('[name=sndInstallmenttype]').val('0:2:3:4:5:6:7:8:9:10:11:12');
		document.KSPayWeb.action = "/front/mypay/mypay_result";
		document.KSPayWeb.target = "_self";
		document.KSPayWeb.submit();
		}
		
	}
		
// 	}
// 	// eparamSet() - 함수설명 : 결재완료후 (kspay_wh_rcv.jsp로부터)결과값을 받아 지정된 결과페이지(kspay_wh_result.jsp)로 전송될 form에 세팅합니다.
// 	function eparamSet(rcid, rctype, rhash){
// 		document.KSPayWeb.reWHCid.value 	= rcid;
// 		document.KSPayWeb.reWHCtype.value = rctype  ;
// 		document.KSPayWeb.reWHHash.value 	= rhash  ;
// 	}
	function mcancel()
	{
		// 취소
		closeEvent();
	}
	
	function fn_isMobilePay(){
		if ( $('[name=sndPaymethod]').val() == '0000010000' ) {
			$('.popup_isMobilePay').addClass('is-active');
		    $('html,body').css({overflowY:'hidden'})
		    $('.popup_isMobilePay').show();
		}else{
			fn_paySubmit();
		}
	}
	
	function fn_paySubmit(){
		
		// 
// 		let msg = '';
// 		var params = new Object();
// 		params.status = "LIST";
// 		params.query = "selectUserBuyTimeIdx";
// 		$('input[name=payPrdtCd]').each(function(k){
// 			// 초기화
// 			params.TIME_IDX = '';
// 			params.PRDT_CD = $(this).val();
// 			params.TIME_IDX = $(this).siblings('[name=payTimeIdx]').val();

// 			if ( $(this).val().indexOf( 'EN' ) > -1 || $(this).val().indexOf( 'VL' ) > -1 ) {
				
// 			}else{
// 				var timeIdxResult = fn_DataAjax2( params );
				
// 				if ( $(this).val().indexOf( 'LN' ) < 0 ) {
					
// 					if ( timeIdxResult.out.detail.data.length > 0 ) {
// 	// 					timeIdxResult.out.detail.data[0].NO_TIME;
// 	// 					timeIdxResult.out.detail.data[0].NO_TITL;
// 						msg = timeIdxResult.out.detail.data[0].NO_TITL+ timeIdxResult.out.detail.data[0].NO_TIME + '수업은 다른사용자가 이미 구매했습니다.';
// 	// 					console.log( '작동' );
// 						return ;
// 					}
// 				}else{
// 					if ( timeIdxResult.out.detail.data.length > 0 ) {
// 						if ( timeIdxResult.out.detail.data.length >= timeIdxResult.out.detail.data[0].LIVE_CNT ) {
// 							msg = timeIdxResult.out.detail.data[0].NO_TITL+ timeIdxResult.out.detail.data[0].NO_TIME + '\n해당 수업의 수강인원수를 초과했습니다.';
// 							return ;
// 						}
// 					}
// 				}
// 			}
// 		});
		
// 		if ( msg.length > 0 ) {
// 			alert( msg );
// 			return location.href='/front/mypage/cart';
// 		}
		
// 		if ( $('.cart_pymt_terms_bottom input[name=terms][type=checkbox]:checked ').length != 4 ) {
// 			return alert('주문 상품정보 및 이용 약관에 동의해 주시기 바랍니다.');
// 		}
		if ( $('.cart_pymt_terms_bottom input[name=terms][type=checkbox]:eq(0):checked ').length != 1 ) {
			return alert('상품 구매조건 확인 및 취소 환불 규정 동의해 주시기 바랍니다.');
		}
		
		if (fn_preSubmit() == 'GOPAY') {
			if ( $('[name=payAmout]').val() < 100 ) {
				alert('결제금액이 100원 미만이므로 네이버페이는 결제가 불가능 합니다.');
			}
			_submit(document.KSPayWeb);
		}
	}
	
	function fn_preSubmit(){

// 		$('[name=sndOrdernumber]').val( fn_GetUuid() );
		// 금액설정
// 		calcPrice();
		chkPrice();
		$('[name=sndVirExpDt]').val('');
		var params = new Object();
		params.query = "insertFrontUserPaymentData";
		params.status = "PAYMENT_WRITE";
		params.frontLoginIdx = localStorage.getItem('frontLoginIdx');
		
		var payMethod = $('[name=sndPaymethod]').val();
		if (payMethod == '1000000000') {
		params.BUY_CD = ${sysDateValue} + 'PC';
		params.BUY_TYPE = "신용카드";
		}else if (payMethod == '0100000000') {
		params.BUY_CD = ${sysDateValue} + 'PV';
		params.BUY_TYPE = "가상계좌";
		var date = new Date();
		date.setDate( date.getDate()+2 );
		$('[name=sndVirExpDt]').val( date.getFullYear() + ( "0"+ (date.getMonth() + 1) ).slice(-2) + ( "0"+ date.getDate() ).slice(-2) );
		}else if (payMethod == '0010000000') {
		params.BUY_CD = ${sysDateValue} + 'PB';
		params.BUY_TYPE = "계좌이체";
		}else if (payMethod == '0000010000') {
		params.BUY_CD = ${sysDateValue} + 'PN';
		params.BUY_TYPE = "휴대폰결제";
		}else if (payMethod == '11000') {
		params.BUY_CD = ${sysDateValue} + 'PM';
		params.BUY_TYPE = "피플메이드페이";
		}
		params.BUY_ORDER_NUMBER = $('[name=sndOrdernumber]').val();
		params.BUY_PRIC = $('[name=sndAmount]').val();
		
		params.CASH_RECEIPT = $('[name=sndCashReceipt]').val();

		// 현금영수증 유효값
		if ( params.CASH_RECEIPT == 1 ) {
			if ($('[name=sndPaymethod]').val() == "0100000000") {
				
				if ( $('[name=CASH_RECE_WHY]:checked').val() == 'PERSONAL_INCOME_TAX' ) {
					params.CASH_RECE_WHY = '소득공제용';
					params.CASH_RECEIPT_NM = $('[name=CASH_RECEIPT_NM]').val();
					$('[name=ECHA]').val('PERSONAL_INCOME_TAX');
					if ($('[name=CASH_RECE_KIND]').val() == '휴대폰번호' ) {
						params.CASH_RECE_KIND = $('[name=CASH_RECE_KIND]').val();
						params.CASH_RECE_SID = $('[name=CASH_RECE_PHONE_NUM1]').val();
						$('[name=ECHE]').val(params.CASH_RECE_KIND);
						$('[name=ECHF]').val(params.CASH_RECE_SID);
						if ( params.CASH_RECE_SID.length < 11 ) {
							$('[name=ECHA]').val('');
							$('[name=ECHE]').val('');
							$('[name=ECHF]').val('');
							params.CASH_RECE_WHY = '';
							params.CASH_RECE_KIND = '';
							params.CASH_RECE_SID = '';
							event.stopPropagation();
							event.stopImmediatePropagation();
							return alert('휴대폰번호를 제대로 입력해 주세요.');
						}
					}else{
						params.CASH_RECE_KIND = $('[name=CASH_RECE_KIND]').val();
						params.CASH_RECE_SID = $('[name=CASH_RECE_SOCIAL_NUM1]').val();
						if ( params.CASH_RECE_SID.length < 13 ) {
							$('[name=ECHA]').val('');
							$('[name=ECHE]').val('');
							$('[name=ECHF]').val('');
							params.CASH_RECE_WHY = '';
							params.CASH_RECE_KIND = '';
							params.CASH_RECE_SID = '';
							event.stopPropagation();
							event.stopImmediatePropagation();
							return alert('주민등록번호를 제대로 입력해 주세요.');
						}
					}
					
				}else{
					params.CASH_RECE_WHY = '지출증빙용';
					params.CASH_RECE_KIND = '사업자등록번호';
					params.CASH_RECEIPT_NM = $('[name=CASH_RECEIPT_NM]').val();
					params.CASH_RECE_SID = $('[name=CASH_RECE_BIZ_NUM1]').val();
					$('[name=ECHA]').val('BIZ_EXPENSE_PROOF');
					$('[name=ECHE]').val(params.CASH_RECE_KIND);
					$('[name=ECHF]').val(params.CASH_RECE_SID);
						if ( params.CASH_RECE_SID.length < 10 ) {
							$('[name=ECHA]').val('');
							$('[name=ECHE]').val('');
							$('[name=ECHF]').val('');
							params.CASH_RECE_WHY = '';
							params.CASH_RECE_KIND = '';
							params.CASH_RECE_SID = '';
							event.stopPropagation();
							event.stopImmediatePropagation();
							return alert('사업자등록번호를 제대로 입력해 주세요.');
						}
				}
			}else{
				$('[name=ECHA]').val('');
				$('[name=ECHE]').val('');
				$('[name=ECHF]').val('');
				params.CASH_RECE_WHY = '';
				params.CASH_RECE_KIND = '';
				params.CASH_RECE_SID = '';
			}
			
		}else{
			$('[name=ECHA]').val('');
			$('[name=ECHE]').val('');
			$('[name=ECHF]').val('');
			params.CASH_RECE_WHY = '';
			params.CASH_RECE_KIND = '';
			params.CASH_RECE_SID = '';
		}

		// 상품 코드별 timeIdx
		var timeArr = [];
		params.BASK_ARR = localStorage.getItem('baskArr'); //			202102CNA0016_9035,202102CNA0016_9036,202102CNA0016_9037
		$.each( params.BASK_ARR.split(','), function( k, v ){
// 			202102CNA0016_9035,
// 			202102CNA0016_9036,
// 			202102CNA0016_9037
			var t = v.split('_');
//		 			202102CNA0016, 9035,
//		 			202102CNA0016, 9036,
//		 			202102CNA0016, 9037
			if ( t[1] != undefined ) timeArr.push( t[1] );
		});
		
		var payArr = [];
		var timeArrIdx = 0;
		
		$('input[name=payPrdtCd]').each(function(k){
			// 초기화
			params.TIME_IDX = '';
			payArr.push( $(this).val() );
			params.PRDT_CD = $(this).val();
			params.COUP_IDX = '0';
// 			params.TIME_IDX = $(this).siblings('[name=payTimeIdx]').val();
			if( $(this).siblings('[name=payTimeIdx]').val() != '') params.TIME_IDX = timeArr[timeArrIdx++];
			
			params.REAL_PAY_PRIC = $(this).siblings('[name=realPayPric]').val();
			params.REAL_DISC_PRIC = $(this).siblings('[name=realDiscPric]').val();
			
			if ( k == $('[name=PRDT_LIST]').val() ) params.COUP_IDX = $('[name=COUP_LIST]').val();
			if ( params.TIME_IDX == '' ) params.TIME_IDX = null;
			
			params.PRDT_CNT = $(this).closest('tr').find('[name=prdt_cnt]').val();
			
			for (var i = 0; i < $(this).closest('tr').find('[name=prdt_cnt]').val(); i++) {
				if( params.COUP_IDX != 0 ) {
					if( i == 0 ) {
						params.REAL_PAY_PRIC = parseInt( 1*$(this).siblings('[name=realPayPric]').val()/params.PRDT_CNT );
						params.REAL_DISC_PRIC = parseInt( 1*$(this).siblings('[name=realDiscPric]').val() );
						params.COUP_IDX = $('[name=COUP_LIST]').val();
					} else {
						params.REAL_PAY_PRIC = parseInt( 1*$(this).siblings('[name=realPayPric]').val()/params.PRDT_CNT );
						params.REAL_DISC_PRIC = 0;
						params.COUP_IDX = 0;
					}
				} else {
					params.REAL_PAY_PRIC = parseInt( 1*$(this).siblings('[name=realPayPric]').val()/params.PRDT_CNT );
					params.REAL_DISC_PRIC = 0;	
					params.COUP_IDX = 0;
				}
				
				fn_DataAjax2( params );	
			}
		});
		
		$('[name=ECHA]').val( payArr );
		$('[name=ECHB]').val( $('[name=COUP_LIST]').val() );
		$('[name=ECHC]').val( $('[name=sndPaymethod]').val() );
		$('[name=ECHD]').val( $('[name=sndAmount]').val() );
		
		localStorage.setItem( 'sndGoodname' , $('[name=sndGoodname]').val() );
		
		localStorage.removeItem('payArr');
		localStorage.setItem('payArr',payArr);
		
		$('[name=sndEmail]').val( localStorage.getItem('frontLoginId') );
		$('[name=sndOrdername]').val( localStorage.getItem('frontLoginNm') );
		$('[name=sndUserId]').val( localStorage.getItem('frontLoginId') );
		$('[name=sndMobile]').val( localStorage.getItem('frontUserPhone') );
		
		return 'GOPAY';
	}
</script>
<script>
//10초 간격으로 탈퇴당했는지 알아봄
var coupList = "";

const secession = setInterval(function(){isSecession(); }, 10000 );

// 숫자
var baskCnt = localStorage.getItem("baskCnt");
var baskTempArr = localStorage.getItem('baskArr');
var tempCnt = [];
$.each(baskCnt.split(',') , function( k,v ){
	if ( v != null && v != 'null' ) 
		tempCnt.push(v) ;
} );

var baskTempArrTemp = [];
$.each(baskTempArr.split(',') , function( k,v ){
	if ( v != null && v != 'null' ) 
		baskTempArrTemp.push(v) ;
} );

$( function() {
	
	$('[name=sndOrdernumber]').val( fn_GetUuid().substring(0,30) );
	
	localStorage.removeItem('sndGoodname');
	
	if( localStorage.getItem("frontLoginIdx") == null ){
		return location.href = "/";
	}
	$('[name=sndEmail]').val( localStorage.getItem('frontLoginId') );
	$('[name=sndOrdername]').val( localStorage.getItem('frontLoginNm') );
	$('[name=sndUserId]').val( localStorage.getItem('frontLoginId') );
	$('[name=sndMobile]').val( localStorage.getItem('frontUserPhone') );
	// 상품 리스트 뿌려주기
	var params = new Object();
	params.status = "LIST";
	params.query = "selectFrontPaymentList";
	params.USER_IDX = localStorage.getItem("frontLoginIdx");
	
	params.BASK_ARR = localStorage.getItem('baskArr');
	
	// 상품 코드
	var arr = '';
	// 상품 코드별 timeIdx
	var timeArr = '';
	$.each( params.BASK_ARR.split(','), function( k, v ){
		if ( v != null && v != 'null' ) {
			
			var t = v.split('_');
			arr += '"'+t[0]+'"' + ',';
			if ( t[1] != undefined ) 
				timeArr += t[1] + ',';
		}
// 		console.log( timeArr );
	});
	if ( timeArr.length == 0 ) {
		timeArr = '0,';
	}
	
	params.BASK_ARR = arr.slice(  0 , arr.length-1 );
	params.TIME_IDX = timeArr.slice(  0 , timeArr.length-1 );
	
	
	var result = fn_DataAjax2( params );	
	result = result.out.detail.data;
	var html = "";
	// 모바일 html
	var mHtml = "";
	// 쿠폰위의 상품목록
	var prdtHtml = "";
	
	// 총 상품금액, 즉시할인, 총 상품금액
	var totalPrdtMoney = 0;
	var finalPrdtMoney = 0;
	var resultEachKeyValue = 0;
	
	$.each(result, function( k, v ){
		var typeTemp = 0;
		
		$.each(baskTempArrTemp, function(kk, vv){
			if ( v.PRDT_CD == vv ) {
				typeTemp = kk;
			}
		});
// 		202101CNA0001_9032,202101CNA0001_9033
// 		if( v.PRDT_USE_DTM != null ) {
// 			if( v.PRDT_USE_DTM.indexOf(',,,') > -1 ) {
// 				var prdtUseDtm = v.PRDT_USE_DTM;
// 				prdtUseDtm = prdtUseDtm.slice(0,-3);
// 				prdtUseDtm = prdtUseDtm.split(',,,');
// 			}
// 			else {
// 				var prdtUseDtm = [];
// 				prdtUseDtm.push( v.PRDT_USE_DTM.slice(0,-3) );
// 			}
// 		} else {
// 			var prdtUseDtm = [];
// 			prdtUseDtm.push( v.PRDT_USE_DTM.slice(0,-3) );
// 		}

// 		$.each(prdtUseDtm, function(key, val){
			html += '<tr>';
		    html += '    <td>';
		    html += '        <div class="info_area">';
		    html += '            <div class="img_area">';
	
		    if( v.INFO_TUMB_UUID != null ){
		    	if( v.INFO_TUMB_UUID != '' ){
		    		if( v.INFO_TUMB_UUID != undefined ) {
						setUuid(v.INFO_TUMB_UUID);
						unit_fileGet( v.INFO_TUMB_UUID_NM , "fn_fileUpload");
				    	html += '                <div class="prdtCardImg" style="background-image: url('+$('#imgTag').val()+');"></div>';
		    		} else html += '                <div class="prdtCardImg" style="background-image: url(/resources/assets/images/sub/profile_default_img.png);"></div>';
		    	} else html += '                <div class="prdtCardImg" style="background-image: url(/resources/assets/images/sub/profile_default_img.png);"></div>';
		    } else html += '                <div class="prdtCardImg" style="background-image: url(/resources/assets/images/sub/profile_default_img.png);"></div>';
			
		    html += '            </div>';
		    html += '            <div class="product_area">';
		    html += '                <span class="product_area_sub_title">['+v.PRDT_TYPE+'] '+v.P_CODE_NM+' ·'+v.USER_NM+'</span>';
		    html += '                <strong class="pc_product_area_title product_area_title">'+v.INFO_PRDT_TITL1+' '+v.INFO_PRDT_TITL2;

		    html += '                <div class="product_arae_term timedealDiv">';
		    html += '		<button class="btn timeDealDay" style="position: relative;"></button>';
		    html += '		<button class="btn timeDealTime" style="position: relative;"></button>';
		    html += '                </div>';
			
		    html += '                	<input type="hidden" name="payPrdtCd" value="'+v.PRDT_CD+'">'; 
		    html += '               	<input type="hidden" name="payTimeIdx" value = "'+v.TIME_IDX+'" >';
		    if( (v.DEAL_REAL_PRIC != null || v.DEAL_REAL_PRIC != undefined ) && ( ( v.MAIN_OPEN_DAY + v.MAIN_OPEN_TIME == 2 ) || ( v.SUBMAIN_OPEN_DAY + v.SUBMAIN_OPEN_TIME == 2 ) ) ) html += '               	<input type="hidden" name="realPayPric" value = "'+1*tempCnt[typeTemp]*v.DEAL_REAL_PRIC+'" >';
		    else html += '               	<input type="hidden" name="realPayPric" value = "'+1*tempCnt[typeTemp]*v.PRDT_PRIC_REAL_NOCOMMA+'" >';
		    html += '               	<input type="hidden" name="realDiscPric" value = "0" >';
		    html += '                </strong>';
		    html += '                <div class="product_arae_term">';
	
			if ( v.PRDT_TYPE == 'VOD' ) {
				html   += '                        <span>사용기간:</span>';
				html   += '                        <span>'+v.PRDT_TIME+'일</span>';
								}else if ( v.PRDT_TYPE == '1:1화상상담' ) {
// 				html   += '                        <span>수강기간:</span>';
// 				html   += '                        <span>'+getRidOfDupleDate( val )+'분</span>';
								}else if ( v.PRDT_TYPE == '1:1채팅상담' ) {
// 				html   += '                        <span>수강기간:</span>';
// 				html   += '                        <span>'+getRidOfDupleDate( val )+'분</span>';
								}else if ( v.PRDT_TYPE == '1:1이메일상담' ) {
				html   += '                        <span>상담회수:</span>';
				html   += '                        <span>구매일부터 '+ v.PRDT_TIME +'까지 '+ v.PRDT_CNT +'</span>';
								}else if ( v.PRDT_TYPE == 'LIVE CLASS' ) {
// 				html   += '                        <span>수강기간:</span>';
// 				html   += '                        <span>'+getRidOfDupleDate( val )+'분</span>';
			}
		    
		    
		    html += '                </div>';
	
		    html += '            </div>';
		    html += '        </div>';
		    html += '    </td>';
		    html += '    <td>';
		    html += '        <span>'+numberWithCommas( 1*tempCnt[typeTemp]*v.PRDT_PRIC_NOCOMMA )+' 원</span> ';
		    html += '    </td>';
		    html += '    <td>';
		    html += '        <span class="color_main">-'+numberWithCommas( 1*tempCnt[typeTemp]*( v.PRDT_PRIC_NOCOMMA.replace(/,/g,'')*1 - v.PRDT_PRIC_REAL_NOCOMMA.replace(/,/g,'')*1 )  )+' 원</span>';
		    if( (v.DEAL_REAL_PRIC != null || v.DEAL_REAL_PRIC != undefined ) && ( ( v.MAIN_OPEN_DAY + v.MAIN_OPEN_TIME == 2 ) || ( v.SUBMAIN_OPEN_DAY + v.SUBMAIN_OPEN_TIME == 2 ) ) )  html += '        <br><span class="color_main" style="color:red;">-'+numberWithCommas( 1*tempCnt[typeTemp]*( ( v.PRDT_PRIC_NOCOMMA.replace(/,/g,'')*1 + v.DEAL_DISC_PRIC.replace(/,/g,'')*1 )  - v.PRDT_PRIC_REAL_NOCOMMA.replace(/,/g,'')*1 ) )+' 원</span>';
		    html += '    </td>';
		    html += '    <td>';
	    	html += '		<div class="amount amountPC">';
			html += 	'		<div class="amount-control">';
			if ( v.PRDT_TYPE == 'VOD' ) {
				html += 		'		<input type="hidden" name="prdt_cnt" value="1" maxlength="3" readonly=readonly />';
			}else{
				html += 		'		<a class="opt-cnt-minus '+( tempCnt[typeTemp] > 1 ?'' : 'disabled') +' " href="javascript:void(0)" onclick="return false;">-</a>';
				html += 		'		<input type="text" name="prdt_cnt" value="'+tempCnt[typeTemp]+'" maxlength="3" readonly=readonly />';
				html += 		'		<a class="opt-cnt-plus" href="javascript:void(0)" onclick="return false;">+</a>';
			}
			html += 	'		</div>';
			html += '			</div>' ;
			html += '    </td>';
		    html += '    <td>';
		    html += '        <span>'+numberWithCommas( 1*tempCnt[typeTemp]*v.PRDT_PRIC_REAL_NOCOMMA )+' 원</span>';
		    if( (v.DEAL_REAL_PRIC != null || v.DEAL_REAL_PRIC != undefined ) && ( ( v.MAIN_OPEN_DAY + v.MAIN_OPEN_TIME == 2 ) || ( v.SUBMAIN_OPEN_DAY + v.SUBMAIN_OPEN_TIME == 2 ) ) )  html += '        <br><span class="color_main" style="color:red;">'+numberWithCommas( 1*tempCnt[typeTemp]*v.DEAL_REAL_PRIC )+' 원</span>';
		    html += '    </td>';
		    html += '</tr>';
			
	
// 		    prdtHtml += '<option value="'+ (resultEachKeyValue++) +'">'+v.INFO_PRDT_TITL1+' '+v.INFO_PRDT_TITL2+'</option>';
		    if( (v.DEAL_REAL_PRIC != null || v.DEAL_REAL_PRIC != undefined ) && ( ( v.MAIN_OPEN_DAY + v.MAIN_OPEN_TIME == 2 ) || ( v.SUBMAIN_OPEN_DAY + v.SUBMAIN_OPEN_TIME == 2 ) ) ) {
			    totalPrdtMoney += v.PRDT_PRIC.replace(/,/g,'')*tempCnt[typeTemp]*1;
			    finalPrdtMoney += v.DEAL_REAL_PRIC.replace(/,/g,'')*tempCnt[typeTemp]*1;
		    } else {
			    totalPrdtMoney += v.PRDT_PRIC.replace(/,/g,'')*tempCnt[typeTemp]*1;
			    finalPrdtMoney += v.PRDT_PRIC_REAL.replace(/,/g,'')*tempCnt[typeTemp]*1;		    	
		    }
		    
		    mHtml += '<div class="type_tablet_item">';
		    mHtml += '    <div class="info_area">';
		    mHtml += '        <div class="img_area">';
		    
		    if( v.INFO_TUMB_UUID != null ){
			    if( v.INFO_TUMB_UUID != '' ){
			    	if( v.INFO_TUMB_UUID != undefined ){
				    	mHtml += '                <div class="prdtCardImg" style="background-image: url('+$('#imgTag').val()+');"></div>';
						$('#imgTag').val('');
			    	} else mHtml += '                <div class="prdtCardImg" style="background-image: url(/resources/assets/images/sub/profile_default_img.png);"></div>';
			    } else mHtml += '                <div class="prdtCardImg" style="background-image: url(/resources/assets/images/sub/profile_default_img.png);"></div>';
		    } else mHtml += '                <div class="prdtCardImg" style="background-image: url(/resources/assets/images/sub/profile_default_img.png);"></div>';
	
		    mHtml += '        </div>';
		    mHtml += '        <div class="product_area">';
		    mHtml += '            <span class="product_area_sub_title">['+v.PRDT_TYPE+'] '+v.P_CODE_NM+' ·'+v.USER_NM+'</span>';
		    mHtml += '            <strong class="mobile_product_area_title product_area_title">'+is_too_long_word2(v.INFO_PRDT_TITL1, v.INFO_PRDT_TITL2, 11,'N' )+'</strong>';

		    mHtml += '            <div class="product_arae_term">';
		    mHtml += '		<button class="btn timeDealDay" style="position: relative;margin-right: 10px;"></button>';
		    mHtml += '		<button class="btn timeDealTime" style="position: relative;"></button>';
		    mHtml += '            </div>';
		    
		    mHtml += '            <div class="product_arae_term">';
	
			if ( v.PRDT_TYPE == 'VOD' ) {
				mHtml   += '                        <span>사용기간:</span>';
				mHtml   += '                        <span>'+v.PRDT_TIME+'일</span>';
				  		  									}else if ( v.PRDT_TYPE == '1:1화상상담' ) {
// 				mHtml   += '                        <span>수강기간:</span>';
// 			    mHtml   += '                        <span>'+getRidOfDupleDate( val )+'</span>';
				  		  									}else if ( v.PRDT_TYPE == '1:1채팅상담' ) {
// 				mHtml   += '                        <span>수강기간:</span>';
// 			    mHtml   += '                        <span>'+getRidOfDupleDate( val )+'</span>';
				  		  									}else if ( v.PRDT_TYPE == '1:1이메일상담' ) {
				mHtml   += '                        <span>상담회수:</span>';
				mHtml   += '                        <span>구매일부터 '+ v.PRDT_TIME +'까지 '+ v.PRDT_CNT +'</span>';
	//			    mHtml   += '                        <span>'+getRidOfDupleDate( val )+'</span>';
				  		  									}else if ( v.PRDT_TYPE == 'LIVE CLASS' ) {
// 				mHtml   += '                        <span>수강기간:</span>';
// 			    mHtml   += '                        <span>'+getRidOfDupleDate( val )+'</span>';
															}
		    mHtml += '            </div>';
	
		    mHtml += '            <div class="product_price">';
		    mHtml += '                <div class="product_price_item">';
		    mHtml += '                    <span>판매가</span>';
		    mHtml += '                    <span>'+numberWithCommas( 1*tempCnt[typeTemp]*v.PRDT_PRIC_NOCOMMA )+' 원</span>';
		    mHtml += '                </div>';
		    mHtml += '                <div class="product_price_item">';
		    mHtml += '                    <span>할인</span>';
		    mHtml += '                    <span class="color_main">-'+numberWithCommas( 1*tempCnt[typeTemp]*( v.PRDT_PRIC_NOCOMMA*1 - v.PRDT_PRIC_REAL_NOCOMMA*1 ) )+' 원</span>';
		    mHtml += '                </div>';
		    
	    	mHtml += '				<div class="amount amountMOBILE product_price_item">';
	    	mHtml += '                    <span>수량</span>';
			mHtml += 	'					<div class="amount-control">';
			if ( v.PRDT_TYPE == 'VOD' ) {
				mHtml += 	'						<input type="hidden" name="prdt_cnt" value="1" maxlength="3"  readonly=readonly />';
			}else{
				mHtml += 	'						<a class="opt-cnt-minus '+( tempCnt[typeTemp] > 1 ?'' : 'disabled') +' " href="javascript:void(0)" onclick="return false;">-</a>';
				mHtml += 	'						<input type="text" name="prdt_cnt" value="'+tempCnt[typeTemp]+'" maxlength="3"  readonly=readonly />';
				mHtml += 	'						<a class="opt-cnt-plus" href="javascript:void(0)" onclick="return false;">+</a>';
			}
			mHtml += 	'					</div>';
			mHtml += '				</div>' ;
		    mHtml += '                <div class="product_price_item">';
		    mHtml += '                    <span>주문금액</span>';
		    mHtml += '                    <span><b>'+numberWithCommas( 1*tempCnt[typeTemp]*v.PRDT_PRIC_REAL_NOCOMMA )+'</b> 원</span>';
		    mHtml += '                </div>';
		    mHtml += '            </div>';
	
		    mHtml += '        </div>';
		    mHtml += '    </div>';
		    mHtml += '</div>';
		    
// 		});

		$('#prdtList').append(html);
		html='';
		counter( v.MAIN_OPEN_DTM, $('.timeDealDay').eq(k), $('.timeDealTime').eq(k) );
		$('.cart_pymt_table.type_tablet').append(mHtml);
		mHtml='';
	});
	
	if (html == "") {
		html = '<div class="mlt_row hasbtn"style="font-size:22px; color:#aaa;text-align:center; ">등록된 내용이 없습니다.</div>';
	}
	
// 	$('#prdtList').empty();
// 	$('#prdtList').append(html);
	
// 	$('.cart_pymt_table.type_tablet').empty();
// 	$('.cart_pymt_table.type_tablet').append(mHtml);
	
// 	$('[name=COUP_LIST]').empty();
// 	$('[name=COUP_LIST]').append('<option value="">쿠폰을 선택해주세요</option>');
// 	$.each( coupList, function( k, v ){
// 		$('[name=COUP_LIST]').append('<option value="'+v.COUP_IDX+'">'+v.COUP_NM+'</option>');
// 	});
	
	getUseCoupList( result );
	$(document).on('keypress', '[name=prdt_cnt]', function(){
 	   $(this).val($(this).val());
 });
    
 $(document).on('click', '.amount-control > a', function(){
 	
 	isPC = $(this).closest('.amount').hasClass('amountPC');
 	
		var cnt =  $(this).siblings('[name=prdt_cnt]').val();
		if ( isPC ) {
			var target = $(this).closest('tr');
	   		var targetprice1 = target.children('td:eq(1)').find('span').last().text().replace('원','');
	   		var targetprice2 = target.children('td:eq(4)').find('span').last().text().replace('원','');
		}else{
	   		var target = $(this).closest('.product_price');
	   		var targetprice1 = target.children('.product_price_item:eq(0)').find('span:eq(1)').text().replace('원','');
	   		var targetprice2 = target.children('.product_price_item:eq(3)').find('span:eq(1) b').text().replace('원','');
		}
		targetprice1 = targetprice1.replace(/,/g,'');
		targetprice2 = targetprice2.replace(/,/g,'');
		targetprice1 = targetprice1/cnt;
		targetprice2 = targetprice2/cnt;
		
		if ($(this).hasClass('opt-cnt-minus') ){
			if ($(this).hasClass('disabled')) return alert( '더 이상 줄일 수 없습니다.' );
			
			if( (1*cnt - 1) == 1 ) $(this).css({'color':'black'});
			
			$(this).siblings('input[name=prdt_cnt]').attr( 'value', 1*cnt -1 );
			
			if (cnt == 2) $(this).addClass('disabled');
		   
			// 가격도 변경
			if ( isPC ) {
				target.children('td:eq(0)').find('[name=realPayPric]').val( targetprice2 * (cnt -1)  );
				target.children('td:eq(1)').find('span').last().text( numberWithCommas(targetprice1 * (1*cnt -1)) + ' 원' );
				target.children('td:eq(4)').find('span').last().text( numberWithCommas(targetprice2 * (1*cnt -1)) + ' 원' );
				
				target.children('td:eq(2)').find('span').last().text( '-'+ numberWithCommas( ( targetprice1 * (1*cnt -1) ) - ( targetprice2 * (1*cnt -1) )  ) + ' 원' );
			}else{
				target.children('td:eq(0)').find('[name=realPayPric]').val( targetprice2 * (1*cnt -1) );
				target.children('.product_price_item:eq(0)').find('span:eq(1)').text( numberWithCommas(1*targetprice1 * (1*cnt -1)) + ' 원' );
				target.children('.product_price_item:eq(3)').find('span:eq(1) b').text( numberWithCommas(1*targetprice2 * (1*cnt -1)) );

				target.children('.product_price_item:eq(1)').find('span:eq(1)').text('-'+ numberWithCommas( ( 1*targetprice1 * (1*cnt -1) ) - ( 1*targetprice2 * (1*cnt -1) )  ) + ' 원' );
			}
			
		}else if ($(this).hasClass('opt-cnt-plus')) {
			$(this).siblings('input[name=prdt_cnt]').attr( 'value', 1*cnt +1 );
			
		   $(this).siblings('.opt-cnt-minus').removeClass('disabled');
		   $(this).siblings('.opt-cnt-minus').css({'color':'#666'});
		  
			// 가격도 변경
			if ( isPC ) {
   				target.children('td:eq(0)').find('[name=realPayPric]').val( 1*targetprice2 * (1*cnt +1)  );
				target.children('td:eq(1)').find('span').last().text( numberWithCommas(targetprice1 * (1*cnt +1)) + ' 원' );
				target.children('td:eq(4)').find('span').last().text( numberWithCommas(targetprice2 * (1*cnt +1)) + ' 원' );
	   		   
				target.children('td:eq(2)').find('span').last().text( '-'+ numberWithCommas( ( targetprice1 * (1*cnt +1) ) - ( targetprice2 * (1*cnt +1) )  ) + ' 원' );
			}else{
				target.children('td:eq(0)').find('[name=realPayPric]').val( 1*targetprice2 * (1*cnt +1)  );
				target.children('.product_price_item:eq(0)').find('span:eq(1)').text( numberWithCommas(1*targetprice1 * (1*cnt +1)) + ' 원' );
				target.children('.product_price_item:eq(3)').find('span:eq(1) b').text( numberWithCommas(1*targetprice2 * (1*cnt +1)) );

				target.children('.product_price_item:eq(1)').find('span:eq(1)').text('-'+ numberWithCommas( ( 1*targetprice1 * (1*cnt +1) ) - ( 1*targetprice2 * (1*cnt +1) )  ) + ' 원' );
			}
		}
		
		// 전체 금액 산정
		if ( isPC ) {
			var totalPC = 0;
			var finalPC = 0;
			
			$('#prdtList tr').each( function( k, v ){
				var temptotal = $(this).children('td:eq(1)').find('span').last().text().replace('원', '');
				temptotal = temptotal.replace(/,/g,'');
				totalPC = totalPC + 1*temptotal;
				var tempfinal = $(this).children('td:eq(4)').find('span').last().text().replace('원', '');
				tempfinal = tempfinal.replace(/,/g,'');
				finalPC = finalPC + 1*tempfinal;
			});
			
			// PC
			$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(0) td').html('<span>'+numberWithCommas( totalPC)+' 원</span>');
			$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(1) td').html('<span class="color_main">-'+numberWithCommas( totalPC-finalPC )+' 원</span>');
			$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').html('<span>'+numberWithCommas( finalPC)+' 원</span>');
			// 모바일
			$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(0) td').html('<span>'+numberWithCommas( totalPC )+' 원</span>');
			$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(1) td').html('<span class="color_main">-'+numberWithCommas( totalPC-finalPC )+' 원</span>');
			$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(3) td').html('<span>'+numberWithCommas( finalPC )+' 원</span>');
		}else{
			var totalPC = 0;
			var finalPC = 0;
			
			$(' .type_tablet_item').each(function( k, v ){
				var temptotal = $(this).find('.product_price_item:eq(0)').find('span:eq(1)').text().replace('원', '');
				temptotal = temptotal.replace(/,/g,'');
				totalPC = totalPC + 1*temptotal;
				var tempfinal = $(this).find('.product_price_item:eq(3)').find('span:eq(1)').find('b').text().replace('원', '');
				tempfinal = tempfinal.replace(/,/g,'');
				finalPC = finalPC + 1*tempfinal;
			});
			// PC
			$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(0) td').html('<span>'+numberWithCommas( totalPC)+' 원</span>');
			$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(1) td').html('<span class="color_main">-'+numberWithCommas( totalPC-finalPC )+' 원</span>');
			$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').html('<span>'+numberWithCommas( finalPC)+' 원</span>');
	   		// 모바일
			$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(0) td').html('<span>'+numberWithCommas( totalPC )+' 원</span>');
			$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(1) td').html('<span class="color_main">-'+numberWithCommas( totalPC-finalPC )+' 원</span>');
			$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(3) td').html('<span>'+numberWithCommas( finalPC )+' 원</span>');
		}
		
		calcPrice();
		
 });
	
	
// 	$('[name=PRDT_LIST]').empty();
// 	$('[name=PRDT_LIST]').append('<option value="">상품을 선택해주세요</option>');
// 	$('[name=PRDT_LIST]').append( prdtHtml );
	
// 	console.log( $('.cart_pymt_final_table tr').length );
	// 모바일
	$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(0) td').html('<span>'+numberWithCommas( totalPrdtMoney)+' 원</span>');
	$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(1) td').html('<span class="color_main">-'+numberWithCommas( totalPrdtMoney-finalPrdtMoney )+' 원</span>');
	$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(3) td').html('<span>'+numberWithCommas( finalPrdtMoney)+' 원</span>');
	// PC
	$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(0) td').html('<span>'+numberWithCommas( totalPrdtMoney)+' 원</span>');
	$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(1) td').html('<span class="color_main">-'+numberWithCommas( totalPrdtMoney-finalPrdtMoney )+' 원</span>');
	$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').html('<span>'+numberWithCommas( finalPrdtMoney)+' 원</span>');
	
	
	$( '#now_loading' ).hide();
	
});



$(document).on('click', '.delone' ,function(){

	$(this).closest('.mlt_row ').remove();
	
	var baskArr = [];
	$('input[name=payCheck]').not('#payAllCheck').each(function(k){
		baskArr.push( $(this).closest('div.mlt_row').find('button.delone').attr('id').replace('del','') );
		console.log( baskArr );
	});
	localStorage.removeItem('baskArr');
	localStorage.setItem('baskArr',baskArr);
	
});

$('.delete_btn').click(function(){

	$('input[name=payCheck]:checked').not('#payAllCheck').each(function(k){
		$(this).closest('.mlt_row ').remove();
	});
	
	var baskArr = [];
	$('input[name=payCheck]').not('#payAllCheck').each(function(k){
		baskArr.push( $(this).closest('div.mlt_row').find('button.delone').attr('id').replace('del','') );
		console.log( baskArr );
	});
	localStorage.removeItem('baskArr');
	localStorage.setItem('baskArr',baskArr);
});

function undefindIsNothing( s ){
	if (typeof s == "undefind" || s == null ) {
		return "";
	}else{
		return s;
	}
}

function chkPrice(){
	var totalPrice = 0;
	var prdt_nm = "";
	$('[name=payPrdtCd]').each(function(k){
		if ( k == 0 )
			prdt_nm = ($(this).closest('.product_area').find(".product_area_sub_title").text().split(']')[0] + ']' +  $(this).closest('.product_area_title').text().replace('쿠폰적용','')).substring(0,19); 
		else if( k == $('[name=payPrdtCd]').length-1 )
			prdt_nm = ($(this).closest('.product_area').find(".product_area_sub_title").text().split(' ')[0] + ']' + $(this).closest('.product_area_title').text().replace('쿠폰적용','')).substring(0,19)+ ' 외 '+($('[name=payPrdtCd]').length-1)+ '건'; 
	});
// 	$('span#price > b').text( numberWithCommas( totalPrice ) );
// 	$('span#totalPrice > b').text( numberWithCommas( totalPrice ) );
// 	$('[name=sndAmount]').val( totalPrice );
	calcPrice();
	
	prdt_nm = prdt_nm.replace(/'/g,'');
	prdt_nm = prdt_nm.replace(/"/g,'');
	prdt_nm = prdt_nm.replace(/`/g,'');
	
	if(prdt_nm.length > 25){
		prdt_nm = prdt_nm.substring(0,25);
	}

	$('[name=sndGoodname]').val( prdt_nm );
	
};

function priceNoZero( price , disc ){
	if ( Number( price ) - Number( disc ) < 0 ) {
		return 0;
	}else{
		return Number( price ) - Number( disc );
	}
}

function calcPrice(){
	
	// 모바일
// 	$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(3) td').html('<span>'+numberWithCommas( finalPrdtMoney)+' 원</span>');
	// PC
// 	$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').html('<span>'+numberWithCommas( finalPrdtMoney)+' 원</span>');
	
	// 쿠폰적용 아이콘 없애기
	$('[name=payPrdtCd]').siblings('span.tag_coupon').remove();
	$('.mobile_product_area_title').find('span.tag_coupon').remove();
	// 각상품의 할인금액 없애기
	$('[name=payPrdtCd]').siblings('[name=realDiscPric]').val('0');
	
	var selectedValue = $('[name=COUP_LIST]').val();
	
	//금액 초기화 
	var makeCoupList_totalNum = Number( $('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(0) td').text().replace(/,/g,'').replace('-','').replace('원','').trim() );
	var makeCoupList_discNum = Number( $('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(1) td').text().replace(/,/g,'').replace('-','').replace('원','').trim() );

	// 금액 초기화
	$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(2) td').html('<span class="color_main">-0 원</span>');
	$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').html('<span>'+numberWithCommas( makeCoupList_totalNum - makeCoupList_discNum  )+' 원</span>');
	
	$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(2) td').html('<span class="color_main">-0 원</span>');
	$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(3) td').html('<span>'+numberWithCommas( makeCoupList_totalNum - makeCoupList_discNum  )+' 원</span>');

	
	
	// 현재 전체금액
	let priceTemp = Number( $('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').text().replace(/,/g,'').replace('원','').trim() );
				
	// 선택한 상품의 현재금액
	var targetTempCnt = Number( $('#prdtList tr:eq('+$('[name=PRDT_LIST]').val()+') td:eq(3) > .amount > div > input').val().trim() );
	if( targetTempCnt != null ) {
		var targetTemp = Number( $('#prdtList tr:eq('+$('[name=PRDT_LIST]').val()+') td:eq(4) span').text().replace(/,/g,'').replace('원','').trim() ) / targetTempCnt;
	} else {
		var targetTemp = Number( $('#prdtList tr:eq('+$('[name=PRDT_LIST]').val()+') td:eq(4) span').text().replace(/,/g,'').replace('원','').trim() );
	}

	if ( selectedValue != '' && selectedValue != null && typeof selectedValue != 'undefind' ) {
		
		// 쿠폰적용 아이콘 넣어주기
		$('.pc_product_area_title > [name=payPrdtCd]').eq( $('[name=PRDT_LIST]').val() ).siblings('span.tag_coupon').remove();
		$('.pc_product_area_title > [name=payPrdtCd]').eq( $('[name=PRDT_LIST]').val() ).before('<span class="tag_coupon">쿠폰적용</span>');
		$('.mobile_product_area_title').eq( $('[name=PRDT_LIST]').val() ).find('span.tag_coupon').remove();
		$('.mobile_product_area_title').eq( $('[name=PRDT_LIST]').val() ).html( $('.mobile_product_area_title').eq( $('[name=PRDT_LIST]').val() ).text() +'<span class="tag_coupon">쿠폰적용</span>');
		
		$.each(coupList, function( k, v ){
			if ( selectedValue == v.COUP_IDX ) {
				
				if (v.COUP_DISC_CD == 'DIS01') {
					
					if ( chkCOUP_MINI( v.COUP_MINI, v.COUP_MINI_TYPE ) ) {
						// 최소,최대 주문가격이 있을때
						if ( v.COUP_MINI_TYPE == 'D' ) {
							// 가격 이하
							if ( v.COUP_MINI >= priceTemp ) {
								$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(2) td').html( '<span class="color_main">-'+ numberWithCommas( ( targetTemp * Number( v.COUP_DISC )*0.01 ) ) + ' 원</span>' );
								$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').html( '<span>' + numberWithCommas(  priceTemp - ( targetTemp * Number( v.COUP_DISC )*0.01 )   ) + ' 원</span>' );

								$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(2) td').html( '<span class="color_main">-'+ numberWithCommas( ( targetTemp * Number( v.COUP_DISC )*0.01 ) ) + ' 원</span>' );
								$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(3) td').html( '<span>' + numberWithCommas(  priceTemp - ( targetTemp * Number( v.COUP_DISC )*0.01 )   ) + ' 원</span>' );
								
								$('.cart_pymt_article_result').text( '-'+ numberWithCommas(  ( targetTemp * Number( v.COUP_DISC )*0.01 )   )+' 원' );
								// 실제 결제되는 가격
								$('[name=sndAmount]').val( priceTemp - ( targetTemp * Number( v.COUP_DISC )*0.01 ) );
								// DB에 저장되는 각 상품의 할인 금액
								$('.pc_product_area_title > [name=payPrdtCd]').eq( $('[name=PRDT_LIST]').val() ).siblings('[name=realDiscPric]').val( ( targetTemp * Number( v.COUP_DISC )*0.01 ) );
								
							}else{
								$('[name=COUP_LIST]').val('');
								let priceNodisc = $('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(2) td span').text().replace('원','').replace('-','').replace(/,/g,'').trim();
								$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').html( '<span>' +numberWithCommas( priceTemp+priceNodisc.replace(/,/g,'').replace('원','').trim()*1 ) + ' 원</span>' );
								$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(2) td').html( '<span class="color_main">-0 원</span>' );
								
								$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(3) td').html( '<span>' +numberWithCommas( priceTemp+priceNodisc.replace(/,/g,'').replace('원','').trim()*1 ) + ' 원</span>' );
								$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(2) td').html( '<span class="color_main">-0 원</span>' );
								
								$('.cart_pymt_article_result').text( '-0 원' );
								
								$('[name=sndAmount]').val( Number( $('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').text().replace(/,/g,'').replace('원','').trim() ) );
								
								$('.pc_product_area_title > [name=payPrdtCd]').eq( $('[name=PRDT_LIST]').val() ).siblings('[name=realDiscPric]').val( '0' );
								
								return alert('쿠폰을 적용할 수없습니다. \n쿠폰을 적용하려면 상품금액이 ' +v.COUP_MINI +'원 이하여야 합니다.');							
							}
						}else if(v.COUP_MINI_TYPE == 'U'){
							// 가격 이상
							if ( v.COUP_MINI <= priceTemp ) {
								$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(2) td').html( '<span class="color_main">-'+ numberWithCommas( ( targetTemp * Number( v.COUP_DISC )*0.01 ) ) + ' 원</span>' );
								$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').html( '<span>' + numberWithCommas(  priceTemp - ( targetTemp * Number( v.COUP_DISC )*0.01 )   ) + ' 원</span>' );

								$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(2) td').html( '<span class="color_main">-'+ numberWithCommas( ( targetTemp * Number( v.COUP_DISC )*0.01 ) ) + ' 원</span>' );
								$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(3) td').html( '<span>' + numberWithCommas(  priceTemp - ( targetTemp * Number( v.COUP_DISC )*0.01 )   ) + ' 원</span>' );
								
								$('.cart_pymt_article_result').text( '-'+ numberWithCommas(  ( targetTemp * Number( v.COUP_DISC )*0.01 )   )+' 원' );
								
								$('[name=sndAmount]').val( priceTemp - ( targetTemp * Number( v.COUP_DISC )*0.01 ) );
								
								$('.pc_product_area_title > [name=payPrdtCd]').eq( $('[name=PRDT_LIST]').val() ).siblings('[name=realDiscPric]').val( ( targetTemp * Number( v.COUP_DISC )*0.01 ) );
								
							}else{
								$('[name=COUP_LIST]').val('');
								let priceNodisc = $('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(2) td span').text().replace('원','').replace('-','').replace(/,/g,'').trim();
								$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').html( '<span>' +numberWithCommas( priceTemp+priceNodisc.replace(/,/g,'').replace('원','').trim()*1 ) + ' 원</span>' );
								$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(2) td').html( '<span class="color_main">-0 원</span>' );

								$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(3) td').html( '<span>' +numberWithCommas( priceTemp+priceNodisc.replace(/,/g,'').replace('원','').trim()*1 ) + ' 원</span>' );
								$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(2) td').html( '<span class="color_main">-0 원</span>' );

								$('.cart_pymt_article_result').text( '-0 원' );
								
								$('[name=sndAmount]').val( Number( $('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').text().replace(/,/g,'').replace('원','').trim() ) );
								
								$('.pc_product_area_title > [name=payPrdtCd]').eq( $('[name=PRDT_LIST]').val() ).siblings('[name=realDiscPric]').val( '0' );
								
								return alert('쿠폰을 적용할 수없습니다. \n쿠폰을 적용하려면 상품금액이 ' +v.COUP_MINI +'원 이상이어야 합니다.');							
							}
						}
					}else{
						// 최소,최대 주문가격이 없을때 
						$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(2) td').html( '<span class="color_main">-'+ numberWithCommas( ( targetTemp * Number( v.COUP_DISC )*0.01 ) ) + ' 원</span>' );
						$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').html( '<span>' + numberWithCommas(  priceTemp - ( targetTemp * Number( v.COUP_DISC )*0.01 )   ) + ' 원</span>' );

						$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(2) td').html( '<span class="color_main">-'+ numberWithCommas( ( targetTemp * Number( v.COUP_DISC )*0.01 ) ) + ' 원</span>' );
						$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(3) td').html( '<span>' + numberWithCommas(  priceTemp - ( targetTemp * Number( v.COUP_DISC )*0.01 )   ) + ' 원</span>' );
						
						$('.cart_pymt_article_result').text( '-'+ numberWithCommas(  ( targetTemp * Number( v.COUP_DISC )*0.01 )   )+' 원' );
						
						$('[name=sndAmount]').val( priceTemp - ( targetTemp * Number( v.COUP_DISC )*0.01 ) );
						
						$('.pc_product_area_title > [name=payPrdtCd]').eq( $('[name=PRDT_LIST]').val() ).siblings('[name=realDiscPric]').val( ( targetTemp * Number( v.COUP_DISC )*0.01 ) );
						
					}
					
				}else if (v.COUP_DISC_CD == 'DIS02') {
					
					if ( chkCOUP_MINI( v.COUP_MINI, v.COUP_MINI_TYPE )  ) {
						// 최소,최대 주문가격이 있을때
						if ( v.COUP_MINI_TYPE == 'D' ) {
							// 가격 이하
							if ( v.COUP_MINI >= priceTemp ) {
								$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(2) td').html( '<span class="color_main">-'+numberWithCommas( v.COUP_DISC ) + ' 원</span>' );
								$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').html( '<span>' +  numberWithCommas( priceNoZero( priceTemp, v.COUP_DISC ) ) + ' 원</span>' );

								$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(2) td').html( '<span class="color_main">-'+numberWithCommas( v.COUP_DISC ) + ' 원</span>' );
								$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(3) td').html( '<span>' +  numberWithCommas( priceNoZero( priceTemp, v.COUP_DISC ) ) + ' 원</span>' );
								
								$('.cart_pymt_article_result').text( '-'+ numberWithCommas( v.COUP_DISC )+' 원' );
								
								$('[name=sndAmount]').val( priceNoZero( priceTemp, v.COUP_DISC ) );
								
								$('.pc_product_area_title > [name=payPrdtCd]').eq( $('[name=PRDT_LIST]').val() ).siblings('[name=realDiscPric]').val( v.COUP_DISC );
								
							}else{
								$('[name=COUP_LIST]').val('');
								let priceNodisc = $('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(2) td span').text().replace('원','').replace('-','').replace(/,/g,'').trim();
								$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').html( '<span>' +numberWithCommas( priceTemp+priceNodisc.replace(/,/g,'').replace('원','').trim()*1 ) + ' 원</span>' );
								$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(2) td').html( '<span class="color_main">-0 원</span>' );

								$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(3) td').html( '<span>' +numberWithCommas( priceTemp+priceNodisc.replace(/,/g,'').replace('원','').trim()*1 ) + ' 원</span>' );
								$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(2) td').html( '<span class="color_main">-0 원</span>' );
								
								$('.cart_pymt_article_result').text( '-0 원' );
								
								$('[name=sndAmount]').val( Number( $('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').text().replace(/,/g,'').replace('원','').trim() ) );
								
								$('.pc_product_area_title > [name=payPrdtCd]').eq( $('[name=PRDT_LIST]').val() ).siblings('[name=realDiscPric]').val( '0' );
								
								return alert('쿠폰을 적용할 수없습니다. \n쿠폰을 적용하려면 상품금액이 ' +v.COUP_MINI +'원 이하여야 합니다.');							
							}
						}else if(v.COUP_MINI_TYPE == 'U'){
							// 가격 이상
							if ( v.COUP_MINI <= priceTemp ) {
								$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(2) td').html( '<span class="color_main">-'+numberWithCommas( v.COUP_DISC ) + ' 원</span>' );
								$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').html( '<span>' +  numberWithCommas( priceNoZero( priceTemp, v.COUP_DISC ) ) + ' 원</span>' );

								$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(2) td').html( '<span class="color_main">-'+numberWithCommas( v.COUP_DISC ) + ' 원</span>' );
								$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(3) td').html( '<span>' +  numberWithCommas( priceNoZero( priceTemp, v.COUP_DISC ) ) + ' 원</span>' );
								
								$('.cart_pymt_article_result').text( '-'+ numberWithCommas( v.COUP_DISC )+' 원' );
								
								$('[name=sndAmount]').val( priceNoZero( priceTemp, v.COUP_DISC ) );
								
								$('.pc_product_area_title > [name=payPrdtCd]').eq( $('[name=PRDT_LIST]').val() ).siblings('[name=realDiscPric]').val( v.COUP_DISC );
								
							}else{
								$('[name=COUP_LIST]').val('');
								let priceNodisc = $('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(2) td span').text().replace('원','').replace('-','').replace(/,/g,'').trim();
								$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').html( '<span>' +numberWithCommas( priceTemp+priceNodisc.replace(/,/g,'').replace('원','').trim()*1 ) + ' 원</span>' );
								$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(2) td').html( '<span class="color_main">-0 원</span>' );

								$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(3) td').html( '<span>' +numberWithCommas( priceTemp+priceNodisc.replace(/,/g,'').replace('원','').trim()*1 ) + ' 원</span>' );
								$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(2) td').html( '<span class="color_main">-0 원</span>' );
								
								$('.cart_pymt_article_result').text( '-0 원' );
								
								$('[name=sndAmount]').val( Number( $('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').text().replace(/,/g,'').replace('원','').trim() ) );
								
								$('.pc_product_area_title > [name=payPrdtCd]').eq( $('[name=PRDT_LIST]').val() ).siblings('[name=realDiscPric]').val( '0' );
								
								return alert('쿠폰을 적용할 수없습니다. \n쿠폰을 적용하려면 상품금액이 ' +v.COUP_MINI +'원 이상이어야 합니다.');							
							}
						}
					}else{
						// 최소,최대 주문가격이 없을때 
						$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(2) td').html( '<span class="color_main">-'+numberWithCommas( v.COUP_DISC ) + ' 원</span>' );
						$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').html( '<span>' +  numberWithCommas( priceNoZero( priceTemp, v.COUP_DISC ) ) + ' 원</span>' );

						$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(2) td').html( '<span class="color_main">-'+numberWithCommas( v.COUP_DISC ) + ' 원</span>' );
						$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(3) td').html( '<span>' +  numberWithCommas( priceNoZero( priceTemp, v.COUP_DISC ) ) + ' 원</span>' );
								
						$('.cart_pymt_article_result').text( '-'+ numberWithCommas( v.COUP_DISC )+' 원' );
						
						$('[name=sndAmount]').val( priceNoZero( priceTemp, v.COUP_DISC ) );
						
						$('.pc_product_area_title > [name=payPrdtCd]').eq( $('[name=PRDT_LIST]').val() ).siblings('[name=realDiscPric]').val( v.COUP_DISC );
						
					}	
					
				}
			}
		});
	}else{
		let priceNodisc = $('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(2) td span').text().replace('원','').replace('-','').replace(/,/g,'').trim();
		let priceTempTotal = $('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td span').text().replace('원','').replace('-','').replace(/,/g,'').trim();
		
// 		console.log( priceTempTotal );
// 		console.log( priceNodisc );
		
		$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').html( '<span>' +numberWithCommas( priceTempTotal*1+priceNodisc.replace(/,/g,'').replace('원','').trim()*1 ) + ' 원</span>' );
		$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(2) td').html( '<span class="color_main">-0 원</span>' );

		$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(3) td').html( '<span>' +numberWithCommas( priceTempTotal*1+priceNodisc.replace(/,/g,'').replace('원','').trim()*1 ) + ' 원</span>' );
		$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(2) td').html( '<span class="color_main">-0 원</span>' );
		
		$('[name=sndAmount]').val( Number( $('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').text().replace(/,/g,'').replace('원','').trim() ) );
		
		$('.pc_product_area_title > [name=payPrdtCd]').eq( $('[name=PRDT_LIST]').val() ).siblings('[name=realDiscPric]').val( '0' );
		
		$('.tag_coupon').remove();
	}
}

function chkCOUP_MINI( COUP_MINI, COUP_MINI_TYPE ){
	if ( COUP_MINI == "" || COUP_MINI == null || typeof COUP_MINI == 'undefind' || COUP_MINI_TYPE == "" || COUP_MINI_TYPE == null || typeof COUP_MINI_TYPE == 'undefind' ) {
		return false;
	}else{
		return true;
	}
}

$(document).on('change', '[name=PRDT_LIST]', calcPrice);
$(document).on('change', '[name=COUP_LIST]', makeCoupList);

function fn_Subject( subjectNm ){
	var subject = "";
	if (subjectNm == "1:1채팅상담") {
		subject = '[CHAT]';
	}else if (subjectNm == "1:1화상상담") {
		subject = '[FACE]';
	}else if (subjectNm == "라이브클래스") {
		subject = '[LIVE]' ;
	}else if (subjectNm == "1:1이메일상담") {
		subject = '[MAIL]';
	}else if (subjectNm == "VOD") {
		subject = '[VOD]';
	}
	return subject;
}

// 결제수단 선택
$('.payMethod').on('click', function(){
	var text = "";
	$('[name=sndCashReceipt]').val('0');
	$('#receiptApplyed_false').prop('checked',true);
	$('#receiptNm').hide();
	$('#RECE_WHY').hide();		
	$('.PERSONAL_INCOME_TAX').hide();
	$('.BIZ_EXPENSE_PROOF').hide();
	switch(this.innerText){
		case '신용카드': text='1000000000'; $('#cashRecei').hide(); break;
		case '가상계좌': text='0100000000'; $('#cashRecei').show(); break;
		case '계좌이체': text='0010000000'; $('#cashRecei').show(); break;
		case '휴대폰결제': text='0000010000'; $('#cashRecei').hide(); break;
		case '피플메이드페이': text='11000'; $('#cashRecei').show(); break;
		default : text='1000000000'; $('#cashRecei').hide(); break;
	}
	$('[name=sndPaymethod]').val( text );
	$('.payMethod').removeClass('active');
	$(this).addClass('active');
});

function getRidOfDupleDate( DTM ){
	const dtmSplit = DTM.trim().split(' ~ ');
	if ( dtmSplit[0].substring(0,10) == dtmSplit[1].substring(0,10) ) {
		return dtmSplit[0] + ' ~ ' + dtmSplit[1].split(' ')[1];
	}else{
		return DTM;
	}
}


// 쿠폰 리스트 만들어주기
function makeCoupList(){
// 	$('[name=COUP_LIST]').empty();
	
	// 쿠폰적용 아이콘 없애기
	$('[name=payPrdtCd]').siblings('span.tag_coupon').remove();
	$('.mobile_product_area_title').find('span.tag_coupon').remove();
	// 각상품의 할인금액 없애기
	$('[name=payPrdtCd]').siblings('[name=realDiscPric]').val('0');
	
// 	var thisSelectedPrdt = this.value;
	var thisSelectedPrdt = $('[name=PRDT_LIST]').val();
	
// 	// 모바일
// 	$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(0) td').html('<span>'+numberWithCommas( totalPrdtMoney)+' 원</span>');
// 	$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(1) td').html('<span class="color_main">-'+numberWithCommas( totalPrdtMoney-finalPrdtMoney )+' 원</span>');
// 	$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(3) td').html('<span>'+numberWithCommas( finalPrdtMoney)+' 원</span>');
// 	// PC
// 	$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(0) td').html('<span>'+numberWithCommas( totalPrdtMoney)+' 원</span>');
// 	$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(1) td').html('<span class="color_main">-'+numberWithCommas( totalPrdtMoney-finalPrdtMoney )+' 원</span>');
// 	$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').html('<span>'+numberWithCommas( finalPrdtMoney)+' 원</span>');

	// 상품 변경시 쿠폰 초기화
	var makeCoupList_totalNum = Number( $('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(0) td').text().replace(/,/g,'').replace('-','').replace('원','').trim() );
	var makeCoupList_discNum = Number( $('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(1) td').text().replace(/,/g,'').replace('-','').replace('원','').trim() );
	
	$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(2) td').html('<span class="color_main">-0 원</span>');
	$('.cart_pymt_left .cart_pymt_final_table tbody > tr:eq(3) td').html('<span>'+numberWithCommas( makeCoupList_totalNum - makeCoupList_discNum  )+' 원</span>');
	$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(2) td').html('<span class="color_main">-0 원</span>');
	$('.final_mobile_show .cart_pymt_final_table tbody > tr:eq(3) td').html('<span class="color_main">'+numberWithCommas( makeCoupList_totalNum - makeCoupList_discNum  )+' 원</span>');
	
	$('.cart_pymt_article_result').text( '-0 원' );
	
// 	if($('[name=PRDT_LIST]').val() != ''){
		
	
// // 		var params = new Object();
// // 		params.status = "LIST";
// // 		params.query = "selectUserPrdtCoupList";
// // 		params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
// // 		params.PRDT_CD =  $('#prdtList > tr:eq('+this.value+') input[name=payPrdtCd]').val();
// // 		var coupListOne = fn_DataAjax2( params );	
// // 		coupListOne = coupListOne.out.detail.data;
		
// // 		coupList = coupListOne;
// 		$('.cart_pymt_article_result').text( '-0 원' );
// 		// 유저가 사용할수 있는 쿠폰이 없으면	
// 		if ( coupList.length == 0 ) {
// 			$('.posible_coupon > span').text( '0' );
// 			$('[name=COUP_LIST]').append('<option value="" >사용할수 있는 쿠폰이 없습니다.</option>');
// 		}else{
// 			//있으면
// 			console.log( coupList );
// 			var html = "";
// 			$.each( coupList, function ( k, v ) {
				
// 				$('[name=COUP_LIST]').empty();
// 					var params = new Object();
// 					params.status = "DETAIL";
// 					params.query = "selectUsePrdtList";
// 					params.PRDT_CD = $('[name=payPrdtCd]').eq( thisSelectedPrdt ).val();
// 					params.COUP_SERV_CD = v.COUP_SERV_CD;
// 					var prdtInfo = fn_DataAjax2( params );	
// 					prdtInfo = prdtInfo.out.detail.data[0];
// 					console.log( prdtInfo );
// 					if ( v.COUP_SERV_CD == 'ALL' || v.COUP_SERV_CD == prdtInfo.PRDT_TYPE || v.COUP_SERV_CD == prdtInfo.PRDT_TYPE2 ) {
// 						if ( v.COUP_CATE_CD != 'ALL' ) {

// 							var coup_cate_arr = v.COUP_CATE_CD.split(',');

// 							$.each( coup_cate_arr, function( coup_ket, coup_val ){
								
// 										if( coup_val.length == 5 ){
// 											if ( coup_val != prdtInfo.CODE_ID.substring( 0, 5 ) ) {
// 												if ( html.indexOf('value="'+v.COUP_IDX+'"') > -1 ) {
													
// 												}else{
// 													html += '<option value="'+v.COUP_IDX+'" >'+v.COUP_NM+'</option>';
// 												}
// 											}
// 										}else{
// 											if ( coup_val == prdtInfo.CODE_ID ) {
// 												if ( html.indexOf('value="'+v.COUP_IDX+'"') > -1 ) {
													
// 												}else{
// 													html += '<option value="'+v.COUP_IDX+'" >'+v.COUP_NM+'</option>';
// 												}
// 											}
// 										}
								
										
// 							});
							
// 						}else{
// 							html += '<option value="'+v.COUP_IDX+'" >'+v.COUP_NM+'</option>';
// 						}
// 					}
					
// 					$('[name=COUP_LIST]').append( (html.length > 0? '<option value="" >쿠폰을 선택해 주세요.</option>' : '<option value="" >사용할수 있는 쿠폰이 없습니다.</option>')+ html );
// 			});
			
			
// 		}
		
		
// 		$('.posible_coupon > span').text( $('[name=COUP_LIST] option').not('[value=""]').length );
	
// 	}
}

$( '.method_info' ).on('click',function(){
	$('.popup_interest_free').addClass('is-active');
    $('html,body').css({overflowY:'hidden'})
    $('.popup_interest_free').show();
});

$( '.icon_help' ).on('click',function(){
	$('.popup_icon_help').addClass('is-active');
    $('html,body').css({overflowY:'hidden'})
    $('.popup_icon_help').show();
});

$(document).on('click' ,'.popup_btn_close' ,function(){
    $('html,body').css({overflowY:'visible'})
    $('.popup').removeClass('is-active');
    $('.popup_interest_free').hide();
});

function isSecession(){
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectFrontUserHasSecession";
	params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
	
	var userHasSecession = ${unit.ajax( '/front/main/ajax', "ajax", "params")};
	
	if ( userHasSecession.out.detail.data[0].USER_USE_YN == 'N' ) {
		fn_BtnLogout();
	}
}

// 유저 쿠폰을 미리 만들어서 달아놈
function getUseCoupList( prdtList ){
	
	var phtml = "";
	var html = "";
	var htmlCnt = 0;
	
	var params = new Object();
	params.query = "selectUserPrdtCoupList";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.status = "LIST";
	var result = fn_DataAjax2( params );	
	coupList = result.out.detail.data;
	
	if ( coupList.length > 0 ) {
// 		$.each( prdtList, function( prdtKey, prdtVal ){
			$.each( coupList, function ( k, v ) {
					var params = new Object();
					params.status = "DETAIL";
					params.query = "selectUsePrdtList";
// 					params.PRDT_CD = prdtVal.PRDT_CD;
					params.COUP_SERV_CD = v.COUP_SERV_CD;
					var prdtInfo = fn_DataAjax2( params );
					prdtInfo = prdtInfo.out.detail.data[0];
					
// 					if ( v.COUP_SERV_CD == 'ALL' || v.COUP_SERV_CD == prdtInfo.PRDT_TYPE || v.COUP_SERV_CD == prdtInfo.PRDT_TYPE2 ) {
// 						if ( v.COUP_CATE_CD != 'ALL' ) {
		
// 							var coup_cate_arr = v.COUP_CATE_CD.split(',');
		
// 							$.each( coup_cate_arr, function( coup_ket, coup_val ){
								
// 										if( coup_val.length == 5 ){
// 											if ( coup_val == prdtInfo.CODE_ID.substring( 0, 5 ) ) {
// 												if ( html.indexOf('value="'+v.COUP_IDX+'"') > -1 ) {
													
// 												}else{
// 													phtml += '<option value="'+ prdtKey +'">'+prdtInfo.PRDT_NM1+' '+prdtInfo.PRDT_NM2+'</option>'; 
// 													html += '<option value="'+v.COUP_IDX+'" >'+v.COUP_NM+'</option>';
// 													htmlCnt++;
// 												}
// 											}
// 										}else{
// 											if ( coup_val == prdtInfo.CODE_ID ) {
// 												if ( html.indexOf('value="'+v.COUP_IDX+'"') > -1 ) {
													
// 												}else{
// 													phtml += '<option value="'+ prdtKey +'">'+prdtInfo.PRDT_NM1+' '+prdtInfo.PRDT_NM2+'</option>'; 
// 													html += '<option value="'+v.COUP_IDX+'" >'+v.COUP_NM+'</option>';
// 													htmlCnt++;
// 												}
// 											}
// 										}
								
										
// 							});
							
// 						}else{
// 							phtml += '<option value="'+ prdtKey +'">'+prdtInfo.PRDT_NM1+' '+prdtInfo.PRDT_NM2+'</option>'; 
							var coupDiscCd = v.COUP_DISC_CD;
						if( coupDiscCd == 'DIS01' ) coupDiscCd = '%';
						else coupDiscCd = '원';
						html += '<option value="'+v.COUP_IDX+'" >['+v.COUP_DISC+''+coupDiscCd+']'+v.COUP_NM+'</option>';
						htmlCnt++;
// 						}
// 					}
			});
// 		} );	
		
		$('[name=COUP_LIST]').append( (htmlCnt > 0? '<option value="" >쿠폰을 선택해 주세요.</option>' : '<option value="" >사용할수 있는 쿠폰이 없습니다.</option>')+ html );
		$('[name=PRDT_LIST]').empty();
		$('[name=PRDT_LIST]').append( '<option value="" >쿠폰을 먼저 선택해 주세요.</option>' );
		$('.posible_coupon > span').text( htmlCnt );

		
		$('[name=COUP_LIST]').change(function(){
			$('[name=PRDT_LIST]').empty();
			$('[name=PRDT_LIST]').append( '<option value="" >상품을 선택해주세요.</option>' );
			$.each( prdtList, function( prdtKey, prdtVal ){
//		 		$.each( coupList, function ( k, v ) {
//		 			if( k == 0 ) {
						var params = new Object();
						params.status = "DETAIL";
						params.query = "selectUsePrdtList";
						params.PRDT_CD = prdtVal.PRDT_CD;
//		 				params.COUP_SERV_CD = v.COUP_SERV_CD;
						var prdtInfo = fn_DataAjax2( params );
						prdtInfo = prdtInfo.out.detail.data[0];
						
						if( prdtList.length > 0 ) {
							var prdtType = prdtInfo.PRDT_CD;
							if( prdtType.indexOf('FN') > -1 ) prdtType = '[1:1화상]';
							else if( prdtType.indexOf('EN') > -1 ) prdtType = '[1:1이메일]';
							else if( prdtType.indexOf('CN') > -1 ) prdtType = '[1:1채팅]';
							else if( prdtType.indexOf('LN') > -1 ) prdtType = '[LIVE CLASS]';
							else if( prdtType.indexOf('VL') > -1 ) prdtType = '[VOD]';
							phtml = '<option value="'+ prdtKey +'">'+prdtType+' '+prdtInfo.PRDT_NM1+' '+prdtInfo.PRDT_NM2+'</option>';
							$('[name=PRDT_LIST]').append( phtml );
						} else {
							$('[name=PRDT_LIST]').append( '<option value="" >사용할수 있는 상품이 없습니다.</option>' );
						}
//		 			}
//		 		});
			});	
		});
	
	}else{
		$('.coupon').hide();
		$('[name=COUP_LIST]').append( '<option value="" >사용할수 있는 쿠폰이 없습니다.</option>' );
		$('[name=PRDT_LIST]').append( '<option value="" >사용할수 있는 쿠폰이 없습니다.</option>' );
		$('.posible_coupon > span').text( '0' );
		
	}
}


function counter( OPEN_DTM, BTN_DAY, BTN_TIME ){
	var dday = new Date( OPEN_DTM ).getTime(); //디데이
	
	if( OPEN_DTM != null ) {
		setInterval(function(){
			var now = new Date(); //현재 날짜 가져오기
			var distance = dday - now;
			var d = Math.floor(distance / (1000 * 60 * 60 * 24));
			var h = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
			var m = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
			var s = Math.floor((distance % (1000 * 60)) / 1000);
			var viewDay = '';
			var view = '';
			if (distance<0) {
				$('.timedealDiv').remove();
			} else {
				$('.timedealDiv').show();
				if (d>0) {
					viewDay = 'D-' + viewDay+d;
				} else {
					$('.timeDealDay').eq(BTN_DAY.index()).css({'background-color':'#ff00ff'});
					viewDay = '오늘종료';
					if( h < 2 ) viewDay = '마감임박';
					
					if( h > 0 ) view = view+h+'시간 ';
					if( m > 0 ) view = view+m+'분 ';
					if( s < 10) s = '0'+s;
					BTN_TIME.text( view+s+'초' );
					if( d+h+m+s < 1 ) location.href = window.location.href;
				}
				BTN_DAY.text( viewDay );
			}
		}, 1000);
	}
}
</script>

<form name=KSPayWeb method=post target="self"  accept-charset="EUC-KR">

									<select name=sndPaymethod style="display: none;">
										<option value="1000000000" selected>신용카드</option>
										<option value="0100000000">가상계좌</option>
										<option value="0010000000">계좌이체</option>
										<option value="0000010000" >휴대폰결제</option>
										<option value="11000" >피플메이드페이</option>
									</select>

						<input type='hidden' name='sndStoreid' value='2001106623' size='15' maxlength='10'>
                        <input type='hidden' name='sndOrdernumber' value='carrot_1234' size='30'>

<!--           상품명 -->
		      <!--상품명 50Byte(한글 25자) 입니다. ' " ` 는 사용하실수 없습니다. 따옴표,쌍따옴표,백쿼테이션 -->
          <input type="hidden" name='sndGoodname' value='당근10kg' size='25'>
          
<!--           금액 -->
		  <!--금액은 ,없이 입력 -->
          <input type='hidden' name='sndAmount' value='1004' size='15' maxlength='9'>
          
<!--           주문자명 -->
          <input type='hidden' name='sndOrdername' value='김토끼' size='30'>
          
<!--           전자우편 -->
		      <!--KSPAY에서 결제정보를 메일로 보내줍니다.(신용카드거래에만 해당)-->
          <input type='hidden' name='sndEmail' value='kspay@carrot.co.kr' size='30'>
          
<!--           이동전화 -->
		      <!--전화번호 value 값에 숫자만 넣게 해주시길 바랍니다. : '-' 가 들어가면 안됩니다.-->
          <input type='hidden' name='sndMobile' value='' size='12' maxlength='12' onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
					
			<!----------------------------------------------- <Part 2. 추가설정항목(메뉴얼참조)>  ----------------------------------------------->

	<!-- 0. 공통 환경설정 -->
	<input type=hidden	name=sndReply value="">
	<input type=hidden  name=sndGoodType value="1"> 	 <!-- 상품유형: 실물(1),디지털(2) -->
	<input type=hidden  name=sndCharSet value="euc-kr"> <!-- 가맹점 charset 설정변수 (euc-kr / utf-8) -->
	
	<!-- 1. 신용카드 관련설정 -->
	
	<!-- 신용카드 결제방법  -->
	<!-- 일반적인 업체의 경우 ISP,안심결제만 사용하면 되며 다른 결제방법 추가시에는 사전에 협의이후 적용바랍니다 -->
	<input type=hidden  name=sndShowcard value="C"> 
	
	<!-- 신용카드(해외카드) 통화코드: 해외카드결제시 달러결제를 사용할경우 변경 -->
	<input type=hidden	name=sndCurrencytype value="WON"> <!-- 원화(WON), 달러(USD) -->
	
	<!-- 할부개월수 선택범위 -->
	<!--상점에서 적용할 할부개월수를 세팅합니다. 여기서 세팅하신 값은 결제창에서 고객이 스크롤하여 선택하게 됩니다 -->
	<!--아래의 예의경우 고객은 0~12개월의 할부거래를 선택할수있게 됩니다. -->
	<input type=hidden	name=sndInstallmenttype value="ALL(0:2:3:4:5:6:7:8:9:10:11:12)">
	
	<!-- 가맹점부담 무이자할부설정 -->
	<!-- 카드사 무이자행사만 이용하실경우  또는 무이자 할부를 적용하지 않는 업체는  "NONE"로 세팅  -->
	<!-- 예 : 전체카드사 및 전체 할부에대해서 무이자 적용할 때는 value="ALL" / 무이자 미적용할 때는 value="NONE" -->
	<!-- 예 : 전체카드사 3,4,5,6개월 무이자 적용할 때는 value="ALL(3:4:5:6)" -->
	<!-- 예 : 삼성카드(카드사코드:04) 2,3개월 무이자 적용할 때는 value="04(3:4:5:6)"-->
	<!-- <input type=hidden	name=sndInteresttype value="10(02:03),05(06)"> -->
	<input type=hidden	name=sndInteresttype value="NONE">
	
	<!-- 카카오페이 사용시 필수 세팅 값 -->
	<input type=hidden name=sndStoreCeoName         value="함연식">  <!--  카카오페이용 상점대표자명 --> 
	<input type=hidden name=sndStorePhoneNo         value="07077327105">  <!--  카카오페이 연락처 --> 
	<input type=hidden name=sndStoreAddress         value="서울특별시 서초구 서초대로 79길 40, 1001호">  <!--  카카오페이 주소 --> 
	
	<!-- 2. 온라인입금(가상계좌) 관련설정 -->
	<input type=hidden	name=sndEscrow value="0"> 			        <!-- 에스크로사용여부 (0:사용안함, 1:사용) -->
	
	<!-- 3. 계좌이체 현금영수증발급여부 설정 -->
	<input type=hidden  name=sndCashReceipt value="0">          <!--계좌이체시 현금영수증 발급여부 (0: 발급안함, 1:발급) -->


	<input type=hidden name=sndStoreName       	    value="피플메이드">                  <!--회사명을 한글로 넣어주세요(최대20byte)-->
	<input type=hidden name=sndStoreNameEng    	    value="peoplemade">                       <!--회사명을 영어로 넣어주세요(최대20byte)-->
	<input type=hidden name=sndStoreDomain     	    value="https://peoplemade.net"> <!-- 회사 도메인을 http://를 포함해서 넣어주세요-->
	<input type=hidden name=sndUseBonusPoint		    value="">   							           <!-- 포인트거래시 60 -->                                                                                                                                                           
	<input type=hidden name=sndRtApp		   	        value="">									           <!-- 하이브리드APP 형태로 개발시 사용하는 변수 -->


<!----------------------------------------------- <Part 3. 승인응답 결과데이터>  ----------------------------------------------->
<!-- 결과데이타: 승인이후 자동으로 채워집니다. (*변수명을 변경하지 마세요) -->

	<input type=hidden name=reWHCid 	value="">
	<input type=hidden name=reWHCtype 	value="">
	<input type=hidden name=reWHHash 	value="">
	
<!--------------------------------------------------------------------------------------------------------------------------->

<!--업체에서 추가하고자하는 임의의 파라미터를 입력하면 됩니다.-->
<!--이 파라메터들은 지정된결과 페이지(kspay_result.jsp)로 전송됩니다.-->
	<input type="hidden" name="ECHA"        value="">
	<input type="hidden" name="ECHB"        value="">
	<input type="hidden" name="ECHC"        value="">
	<input type="hidden" name="ECHD"        value="">
	<input type="hidden" name="ECHE"        value="">
	<input type="hidden" name="ECHF"        value="">
<!--------------------------------------------------------------------------------------------------------------------------->

<!-- mypay때문에 합치게된 코드들 -->
<input type="hidden" name="sndMsalt"       value="<%=msalt%>">
<input type="hidden" name="sndMpayMsalt"   value="<%=mpaymsalt%>">
<input type="hidden" name="sndEdata"       value="<%=edata%>">
<input type="hidden" name="sndEtoken"      value="<%=etoken%>">
<!-- 대표가맹점 번호 -->
<input type="hidden" name="sndStoreno" size=10 maxlength=10 value="KSNET00023">
<!-- 회원아이디 -->
<input type="hidden" name="sndUserId" size=30 maxlength=30 value="">
<!-- 할부개월수 -->
<!-- <input type='hidden' name=sndInstallmentType value="0:2:3:4:5:6:7:8:9:10:11:12" size='35' > -->
<!-- 무이자 할부개월 -->
<input type="hidden" name="sndInterestType" size=30 value="NONE">
<input type=hidden name="sndCancelUrl"  value=""> <!-- 취소 리턴페이지 -->
<input type=hidden name="sndRetParam"   value=""> <!-- sndReply , sndCancelUrl 로 전달되어야하는 파라미터 특수문자 ' " - ` 는 사용하실수 없습니다. (따옴표,쌍따옴표,빼기,백쿼테이션)  -->

	<!-- pc버전 rcv 페이지에서 세팅되는 값 -->
	<input type=hidden name="reCommConId"   value="">
	<input type=hidden name="reRetParam"    value="">
	
	<input type=hidden name=sndVirExpDt value=""> <!-- 일자 : YYYYMMDD  -->

	<input type=hidden name=sndVirExpTm value="235959">   <!--  시간 : HHMMSS -->
	
	
	<input type="hidden" name="sndLogotype" value="1">  <!-- 마이페이 로고의 타입을 결정 케이에스넷 박은정대리한테 문의하여 설정 후 값을 받아 설정 -->
	<input type="hidden" name="sndThemecolor" value="212121">  <!-- 마이페이 테마 색상을 결정 RGB값 -->
	
</form>
