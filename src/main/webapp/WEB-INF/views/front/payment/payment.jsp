<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="java.io.*,java.util.*,java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="./../mypay/eutil.jsp"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDateValue"><fmt:formatDate value="${now}" pattern="yyyyMM" /></c:set>
<c:set var="kspaySvcTkn" value="${out.kspaySvcTkn}"/>
<%
	// 운영아이디가 발급되면 제공되는 정보 , 기본은 테스트 아이디용.
	String mhkey        = "FF7BC0A83DC4E6B6114522CBD70A958C" ;    
	String mekey        = "549E98CA59A3691088CA0A52DC4BA66E";       
	String msalt        = "MA01";                                       
	String mpaymsalt    = "apUj1C9pSo";   
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
		_frm.action ='http://210.181.28.134/store/MYPay/MYPayWebTot.jsp'; 
		if(is_mobile()){
			alert('MOBIEL');
			_frm.target = "_self";
		}else{
			alert('PC');
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

    <div id="container">
        <div class="account_container section_inner">
            <div class="sub_nav_box">
                <ul class="sub_nav">
                    <li><a href="/front/main/index" class="home"></a></li>
                    <li><a href="/front/mypage/payment">마이페이지</a></li>
                    <li><a href="#" class="current">장바구니</a></li>
                </ul>
            </div>

            <div class="account_double_box">
                <h3 class="account_title account_title_big pc_show">
                    결제
                </h3>
                
                <div class="mypage_box">
                    

                    <div class="mypage_top">
                        <input type="checkbox" id="payAllCheck" name="payCheck"   class="custom_sq_check" value="">
                        <label for="payAllCheck" class="custom_sq_label"></label>
                        <label for="payAllCheck" class="custom_sq_text">전체선택 / 선택삭제</label>
                    </div>

                    <div class="mypage_lec_table" id="baskList">
                    </div>

                    <div class="delete_btn_box">
                        <button type="button" class="delete_btn">삭제</button>
                    </div>

                    <div class="payment_box">
                    <form name=KSPayWeb method=post target="self" accept-charset="EUC-KR">
                        <div class="payment_select_box">
                            <span class="ps_title">쿠폰 선택</span>
                            <select name="COUP_LIST" id="COUP_LIST" class="white_select">
                            </select>
                        </div>
                        <input type='hidden' name='sndStoreid' value='2001106623' size='15' maxlength='10'>
                        <input type='hidden' name='sndOrdernumber' value='carrot_1234' size='30'>
                        <div class="payment_total_box">
                            <div class="pt_title"><span> 결제수단</span></div>
                            <div class="pt_total" id="pt_total">
                                <select name=sndPaymethod style="display: none;">
									<option value="1000000000" selected>신용카드</option>
									<option value="0100000000">가상계좌</option>
									<option value="0010000000">계좌이체</option>
									<option value="0000010000" >휴대폰결제</option>
									<option value="MYPAY" >마이페이</option>
								</select>
								<div class="payMethod">신용카드</div>
								<div class="payMethod">가상계좌</div>
								<div class="payMethod">계좌이체</div>
								<div class="payMethod">휴대폰결제</div>
								<div class="payMethod">마이페이</div>
                            </div>
                        </div>
                        <div class="payment_total_box" id="cashRecei">
                            <div class="pt_title"><span>현금영수증 발급</span></div>
                            <div class="pt_total" style="text-align: left;">
                                <ul class="designRadiobutton form-control-sm"  style="margin-left: 20px">
						        	<li><span class="radio-mark radio-checked"></span><input type="radio" id="receiptApplyed_true" name="CASH_RECEIPT" value="true" ><label for="receiptApplyed_true">신청하기</label></li>
									<li><span class="radio-mark"></span><input type="radio" id="receiptApplyed_false" name="CASH_RECEIPT" value="false" checked="checked"><label for="receiptApplyed_false">신청안함</label></li>
						        </ul>
						        <ul class="designRadiobutton form-control-sm"  style="margin-left: 20px; display: none;" id="RECE_WHY" >
						        	<li><span class="radio-mark radio-checked"></span><input type="radio" id="receiptIssueUsageCode_1"  name="CASH_RECE_WHY" value="PERSONAL_INCOME_TAX" checked="checked"><label for="receiptIssueUsageCode_1">개인소득공제용</label></li>
									<li><span class="radio-mark"></span><input type="radio" id="receiptIssueUsageCode_2"  name="CASH_RECE_WHY" value="BIZ_EXPENSE_PROOF"><label for="receiptIssueUsageCode_2">사업자증빙용(세금계산서용)</label></li>
						        </ul>
						        <div id="receiptNm" style="margin-left: 20px; display: none;">
						        	이름
							        <input style="display: inline;" name="CASH_RECEIPT_NM" >
						        </div>
						        <div style="display: none;  margin-left: 20px" class="PERSONAL_INCOME_TAX">
						        	<select  name="CASH_RECE_KIND">
						        		<option value="휴대폰번호" selected="selected">휴대폰번호</option>
						        		<option value="주민등록번호" >주민등록번호</option>
						        	</select>
						        </div>
						        <span style="display: none;" class="resident_group socialNumber PERSONAL_INCOME_TAX" >
									<input type="text" id="id_num" name="CASH_RECE_SOCIAL_NUM1" maxlength="6" value="">
									-
									<input type="password" id="id_num2" name="CASH_RECE_SOCIAL_NUM2" maxlength="7"  value="">
								</span>
						        <span style="display: none;" class="resident_group phoneNumber PERSONAL_INCOME_TAX">
						      	   <input type="text" name="CASH_RECE_PHONE_NUM1" maxlength="3" value="">
						      	    -
									<input type="text"  name="CASH_RECE_PHONE_NUM2" maxlength="6" value="">
									-
									<input type="password" name="CASH_RECE_PHONE_NUM3" maxlength="7"  value="">
								</span>

								<div style="display: none;  margin-left: 20px" class="BIZ_EXPENSE_PROOF">
						        	사업자등록번호
						        <span style="display: inline;" class="resident_group bizNumber BIZ_EXPENSE_PROOF">
						      	   <input type="text" class="bizProof" name="CASH_RECE_BIZ_NUM1" maxlength="3" value="">
						      	    -
									<input type="text" class="bizProof" name="CASH_RECE_BIZ_NUM2" maxlength="2" value="">
									-
									<input type="password" class="bizProofL" name="CASH_RECE_BIZ_NUM3" maxlength="5"  value="">
								</span>
						        </div>
						        
								
                            </div>
							<script type="text/javascript">
								$('input[name=CASH_RECEIPT]').on('change', function (){
									if ($("input[name='CASH_RECEIPT']:checked").val() == 'true' ) {
										$('#RECE_WHY').show();		
										$('#receiptIssueUsageCode_1').prop('checked', true);
										$('.PERSONAL_INCOME_TAX').not('.socialNumber').css('display','inline');
										$('.BIZ_EXPENSE_PROOF').hide();
										$('[name=sndCashReceipt]').val('1');
										$('#receiptNm').show();
									}else{
										$('#RECE_WHY').hide();		
										$('.PERSONAL_INCOME_TAX').hide();
										$('.BIZ_EXPENSE_PROOF').hide();
										$('[name=sndCashReceipt]').val('0');
										$('#receiptNm').hide();
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
                        <div class="payment_total_box">
                            <div class="pt_title"><span>합계금액</span></div>
                            <div class="pt_total" id="pt_total">
                                <span id="price">상품금액 <b>0</b>원</span>
                                <span class="ptt_aa">-</span>
                                <span id="discPrice">할인금액 <b>0</b>원</span>
                                <span class="ptt_aa">=</span>
                                <span id="totalPrice" class="total"><b>0</b>원</span>
                            </div>
                        </div>

<!--           상품명 -->
		      <!--상품명 50Byte(한글 25자) 입니다. ' " ` 는 사용하실수 없습니다. 따옴표,쌍따옴표,백쿼테이션 -->
          <input type="hidden" name='sndGoodname' value='당근10kg' size='30'>
          
<!--           금액 -->
		  <!--금액은 ,없이 입력 -->
          <input type='hidden' name='sndAmount' value='1004' size='15' maxlength='9'>
          
<!--           주문자명 -->
          <input type='hidden' name='sndOrdername' value='김토끼' size='30'>
          
<!--           전자우편 -->
<!-- 		      KSPAY에서 결제정보를 메일로 보내줍니다.(신용카드거래에만 해당) -->
          <input type='hidden' name='sndEmail' value='kspay@carrot.co.kr' size='30'>
          
<!--           이동전화 -->
		      <!--전화번호 value 값에 숫자만 넣게 해주시길 바랍니다. : '-' 가 들어가면 안됩니다.-->
          <input type='hidden' name='sndMobile' value='01112341234' size='12' maxlength='12' onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
					
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
	<input type=hidden name=sndStoreCeoName         value="">  <!--  카카오페이용 상점대표자명 --> 
	<input type=hidden name=sndStorePhoneNo         value="">  <!--  카카오페이 연락처 --> 
	<input type=hidden name=sndStoreAddress         value="">  <!--  카카오페이 주소 --> 
	
	<!-- 2. 온라인입금(가상계좌) 관련설정 -->
	<input type=hidden	name=sndEscrow value="0"> 			        <!-- 에스크로사용여부 (0:사용안함, 1:사용) -->
	
	<!-- 3. 계좌이체 현금영수증발급여부 설정 -->
	<input type=hidden  name=sndCashReceipt value="0">          <!--계좌이체시 현금영수증 발급여부 (0: 발급안함, 1:발급) -->

	<input type=hidden name=sndVirExpDt     		    value="">                            <!-- 마감일시 -->
	<input type=hidden name=sndVirExpTm     		    value="">                            <!-- 마감시간 -->
	<input type=hidden name=sndStoreName       	    value="피플메이드">                  <!--회사명을 한글로 넣어주세요(최대20byte)-->
	<input type=hidden name=sndStoreNameEng    	    value="peoplemade">                       <!--회사명을 영어로 넣어주세요(최대20byte)-->
	<input type=hidden name=sndStoreDomain     	    value="https://peoplemade.beta.so"> <!-- 회사 도메인을 http://를 포함해서 넣어주세요-->
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
<input type="hidden" name="sndStoreno" size=10 maxlength=10 value="KSNET00005">
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


<!--                         <button type="button" class="account_btn payment_btn" onclick="location.href='/front/mypay/mypay_order';">결제하기</button> -->
                        <button type="button" class="account_btn payment_btn" onclick="fn_paySubmit();">결제하기</button>
                        </form>
                    </div>
                </div>
            </div><!-- //.account_double_box  -->
        </div>
    </div><!-- // #container -->


<script type="text/javascript" src="/resources/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/slick.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/common.js"></script>
<!-- <link href="/resources/payment/css/pgstyle.css" rel="stylesheet" type="text/css" charset="utf-8"> -->
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
    
	function mcancel()
	{
		// 취소
		closeEvent();
	}
	
	function _submit(_frm)
	{
		if ($('[name=sndPaymethod]').val() != 'MYPAY') {
			$('[name=sndInstallmenttype]').val('ALL(0:2:3:4:5:6:7:8:9:10:11:12)');
			$('[name=sndStoreid]').val('2001106623');
			_pay(_frm);
		}else{
			$('[name=sndInstallmenttype]').val('0:2:3:4:5:6:7:8:9:10:11:12');
			$('[name=sndStoreid]').val('2001106623');
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
// 	function goResult(){
// 		document.KSPayWeb.target = "";
// 		document.KSPayWeb.action = "./kspay_wh_result";
// 		document.KSPayWeb.submit();
// 	}
	// eparamSet() - 함수설명 : 결재완료후 (kspay_wh_rcv.jsp로부터)결과값을 받아 지정된 결과페이지(kspay_wh_result.jsp)로 전송될 form에 세팅합니다.
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
	function fn_paySubmit(){
		if ( $('input[name=payCheck]:checked').length > 0 ) {
			if (fn_preSubmit() == 'GOPAY') {
				if ( $('[name=payAmout]').val() < 100 ) {
					alert('결제금액이 100원 미만이므로 네이버페이는 결제가 불가능 합니다.');
				}
				_submit(document.KSPayWeb);
			}
		}else{
			return alert('선택된 상품이 없습니다.');
		}
	}
	
	function fn_preSubmit(){
		
		var params = new Object();
		params.query = "insertFrontUserPaymentData";
		params.status = "PAYMENT_WRITE";
		params.frontLoginIdx = localStorage.getItem('frontLoginIdx');
		
		params.COUP_IDX = $('[name=COUP_LIST]').val();
		
		var payMethod = $('[name=sndPaymethod]').val();
		if (payMethod == '1000000000') {
		params.BUY_CD = ${sysDateValue} + 'PC';
		params.BUY_TYPE = "신용카드";
		}else if (payMethod == '0100000000') {
		params.BUY_CD = ${sysDateValue} + 'PV';
		params.BUY_TYPE = "가상계좌발급";
		}else if (payMethod == '0010000000') {
		params.BUY_CD = ${sysDateValue} + 'PB';
		params.BUY_TYPE = "계좌이체";
		}else if (payMethod == '0000010000') {
		params.BUY_CD = ${sysDateValue} + 'PN';
		params.BUY_TYPE = "휴대폰결제";
		}else if (payMethod == 'MYPAY') {
		params.BUY_CD = ${sysDateValue} + 'PM';
		params.BUY_TYPE = "마이페이";
		}
		params.BUY_ORDER_NUMBER = $('[name=sndOrdernumber]').val();
		params.BUY_PRIC = $('[name=sndAmount]').val();
		
		params.CASH_RECEIPT = $('[name=sndCashReceipt]').val();
		
		if ( params.CASH_RECEIPT == 1 ) {
			if ($('[name=sndPaymethod]').val() == "0100000000") {
				
				if ( $('[name=CASH_RECE_WHY]').val() == 'PERSONAL_INCOME_TAX' ) {
					params.CASH_RECE_WHY = '소득공제용';
					params.CASH_RECEIPT_NM = $('[name=CASH_RECEIPT_NM]').val();
					$('[name=ECHA]').val('PERSONAL_INCOME_TAX');
					if ($('[name=CASH_RECE_KIND]').val() == '휴대폰번호' ) {
						params.CASH_RECE_KIND = $('[name=CASH_RECE_KIND]').val();
						params.CASH_RECE_SID = $('[name=CASH_RECE_PHONE_NUM1]').val() + $('[name=CASH_RECE_PHONE_NUM2]').val() + $('[name=CASH_RECE_PHONE_NUM3]').val();
						$('[name=ECHE]').val(params.CASH_RECE_KIND);
						$('[name=ECHF]').val(params.CASH_RECE_SID);
						if ( params.CASH_RECE_SID.length < 11 ) {
							$('[name=ECHA]').val('');
							$('[name=ECHE]').val('');
							$('[name=ECHF]').val('');
							event.stopPropagation();
							event.stopImmediatePropagation();
							return alert('휴대폰번호를 제대로 입력해 주세요.');
						}
					}else{
						params.CASH_RECE_KIND = $('[name=CASH_RECE_KIND]').val();
						params.CASH_RECE_SID = $('[name=CASH_RECE_SOCIAL_NUM1]').val() + $('[name=CASH_RECE_SOCIAL_NUM2]').val();
						if ( params.CASH_RECE_SID.length < 13 ) {
							$('[name=ECHA]').val('');
							$('[name=ECHE]').val('');
							$('[name=ECHF]').val('');
							event.stopPropagation();
							event.stopImmediatePropagation();
							return alert('주민등록번호를 제대로 입력해 주세요.');
						}
					}
				}else{
					params.CASH_RECE_WHY = '지출증빙용';
					params.CASH_RECE_KIND = '사업자등록번호';
					params.CASH_RECEIPT_NM = $('[name=CASH_RECEIPT_NM]').val();
					params.CASH_RECE_SID = $('[name=CASH_RECE_BIZ_NUM1]').val() + $('[name=CASH_RECE_BIZ_NUM2]').val() + $('[name=CASH_RECE_BIZ_NUM3]').val();
					$('[name=ECHA]').val('BIZ_EXPENSE_PROOF');
					$('[name=ECHE]').val(params.CASH_RECE_KIND);
					$('[name=ECHF]').val(params.CASH_RECE_SID);
						if ( params.CASH_RECE_SID.length < 10 ) {
							$('[name=ECHA]').val('');
							$('[name=ECHE]').val('');
							$('[name=ECHF]').val('');
							event.stopPropagation();
							event.stopImmediatePropagation();
							return alert('사업자등록번호를 제대로 입력해 주세요.');
						}
				}
			}else{
				$('[name=ECHA]').val('');
				$('[name=ECHE]').val('');
				$('[name=ECHF]').val('');
			}
			
		}else{
			$('[name=ECHA]').val('');
			$('[name=ECHE]').val('');
			$('[name=ECHF]').val('');
		}
		
		var payArr = [];
		$('input[name=payCheck]:checked').not('#payAllCheck').each(function(k){
			payArr.push( $(this).closest('div.mlt_row').find('button.delone').attr('id').replace('del','') );
			params.PRDT_CD = $(this).closest('div.mlt_row').find('button.delone').attr('id').replace('del','');
			fn_DataAjax2( params );	
		});
		
		$('[name=ECHA]').val( payArr );
		$('[name=ECHB]').val( $('[name=COUP_LIST]').val() );
		$('[name=ECHC]').val( $('[name=sndPaymethod]').val() );
		$('[name=ECHD]').val( $('[name=sndAmount]').val() );
		localStorage.setItem( 'sndGoodname' , $('[name=sndGoodname]').val() );
		
		localStorage.removeItem('payArr');
		localStorage.setItem('payArr',payArr);
		
		$('[name=sndEmail]').val( localStorage.getItem('frontLoginId') );
		$('[name=sndOrdername]').val( localStorage.getItem('frontLoginNick') );
		$('[name=sndUserId]').val( localStorage.getItem('frontLoginId') );
		$('[name=sndMobile]').val( localStorage.getItem('frontUserPhone') );
		
		return 'GOPAY';
	}
</script>
<script>
var coupList = "";

$( function() {
	
	$('[name=sndOrdernumber]').val( fn_GetUuid().substring(0,30) );
	
	localStorage.removeItem('sndGoodname');
	
	if( localStorage.getItem("frontLoginIdx") == null ){
		return location.href = "/";
	}
	console.log( localStorage.getItem('baskArr') );
	$('[name=sndEmail]').val( localStorage.getItem('frontLoginId') );
	$('[name=sndOrdername]').val( localStorage.getItem('frontLoginNick') );
	$('[name=sndUserId]').val( localStorage.getItem('frontLoginId') );
	$('[name=sndMobile]').val( localStorage.getItem('frontUserPhone') );
	var params = new Object();
	params.status = "LIST";
	params.query = "selectFrontPaymentList";
	params.USER_IDX = localStorage.getItem("frontLoginIdx");
	params.BASK_ARR = localStorage.getItem('baskArr');
	
	var arr = '';
	$.each( params.BASK_ARR.split(','), function( k, v ){
		arr += '"'+v+'"' + ',';
	});
	params.BASK_ARR = arr.slice(  0 , arr.length-1 );
	
	var result = fn_DataAjax2( params );	
	result = result.out.detail.data;
	var html = "";
	$.each(result, function( k, v ){
		
		setUuid(v.PRDT_UUID);
		
		unit_fileGet( v.PRDT_UUID_NM+'_FILE' , "fn_fileUpload");

		html += '<div class="mlt_row hasbtn hascheck">';
		html += '       <div class="mlt_cell mlt_check_cell">';
		html += '           <input type="checkbox" id="payCheck'+k+'" name="payCheck" class="custom_sq_check" >';
		html += '           <label for="payCheck'+k+'" class="custom_sq_label"></label>';
		html += '       </div>';
		html += '       <div class="mlt_cell mlt_thumb_cell">';
		html += '           <img src="'+$('#imgTag').val()+'" alt="썸네일">';
		html += '       </div>';
		html += '       <div class="mlt_cell mlt_info_cell">';
		html += '           <p class="mlt_info">';
		html += '               <button type="button" id="del'+v.BASK_IDX+'" class="mlt_state delone">삭제</button>';
		html += '           </p>';
		html += '           <div class="mlt_lec_info">';
		html += '               <span class="mlt_category">'+v.PRDT_NM+'</span>';
		html += '               <p class="mlt_lec_title">';
		html += '                   <span class="mltl_name">'+v.USER_NM+'</span>';
		html += '                   <span class="mltl_sub">'+v.CATE_SLOG+'</span>';
		html += '               </p>';
		html += '           </div>';
		html += '       </div>';
		html += '       <div class="mlt_cell mlt_tail_cell">';
		html += '           <div class="mlt_tail">';
		html += '               <span class="mttt_name">'+v.PRDT_TYPE+'</span>';
		html += '               <span class="mttt_info">';
		html += '                   <span>'+undefindIsNothing( v.PRDT_CNT )+'</span>';
		html += '                   <span class="prdtPrice" >'+v.PRDT_PRIC_REAL+'원</span>';
		html += '               </span>';
		html += '           </div>';
		html += '       </div>';
		html += '</div>';
	});
	
	if (html == "") {
		html = '<div class="mlt_row hasbtn"style="font-size:22px; color:#aaa;text-align:center; ">등록된 내용이 없습니다.</div>';
	}
	
	$('#baskList').empty();
	$('#baskList').append(html);
	
	var params = new Object();
	params.query = "selectFrontUserCoupList";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.status = "LIST";
	var result = fn_DataAjax2( params );	
	coupList = result.out.detail.data;
	$('[name=COUP_LIST]').empty();
	$('[name=COUP_LIST]').append('<option value="">쿠폰을 선택해주세요</option>');
	$.each( coupList, function( k, v ){
		$('[name=COUP_LIST]').append('<option value="'+v.COUP_IDX+'">'+v.COUP_NM+'</option>');
	});
	
	
});

$('#payAllCheck').click(function(){
	if( $(this).prop('checked') ) $('[name=payCheck]').prop('checked', true);
	else $('[name=payCheck]').prop('checked', false);
});

$(document).on('click', '[name=payCheck]', function(){
	$('[name=payCheck]').each(function(key,val){
		if( $(this).val() == "" ) $(this).attr('checked', false); 
	});
	
	var legnth = $('[name=payCheck]').length;
	var legnthCk = $('[name=payCheck]:checked').length;
	if( (legnth-1) == legnthCk ) $("input[name=payCheck]").prop("checked",true);
	
	chkPrice();	
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
	$('[name=payCheck]:checked').not('[value=""]').each(function(k){
		totalPrice += Number( $(this).closest('div.mlt_row').find('.mttt_info > .prdtPrice').text().replace('원','').replace(',','') );
		
		if ( k == 0 && $('[name=payCheck]:checked').not('[value=""]').length == 1){ prdt_nm = fn_Subject( $(this).closest('div.mlt_row').find(".mttt_name").text() ) +  $(this).closest('div.mlt_row').find(".mlt_category").text(); } 
		else if( k == $('[name=payCheck]:checked').not('[value=""]').length-1 && $('[name=payCheck]:checked').not('[value=""]').length > 1) {	
			prdt_nm = fn_Subject( $(this).closest('div.mlt_row').find(".mttt_name").text() ) + $(this).closest('div.mlt_row').find(".mlt_category").text()+ ' 외 '+($('[name=payCheck]:checked').not('[value=""]').length-1)+ ' 건'; 
		}
		
	});
	$('span#price > b').text( numberWithCommas( totalPrice ) );
	$('span#totalPrice > b').text( numberWithCommas( totalPrice ) );
	$('[name=sndAmount]').val( totalPrice );
	calcPrice();
		
	
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
	var selectedValue = $('[name=COUP_LIST]').val();
	if ( selectedValue != '' && selectedValue != null && typeof selectedValue != 'undefind' ) {
		$.each(coupList, function( k, v ){
			console.log( v );
			if ( selectedValue == v.COUP_IDX ) {
				let priceTemp = Number( $('span#price > b').text().replace(',','') );
				if (v.COUP_DISC_CD == 'DIS01') {
					
					if ( chkCOUP_MINI( v.COUP_MINI, v.COUP_MINI_TYPE ) ) {
						// 최소,최대 주문가격이 있을때
						if ( v.COUP_MINI_TYPE == 'D' ) {
							// 가격 이하
							if ( v.COUP_MINI >= priceTemp ) {
								$('span#discPrice > b').text( numberWithCommas( ( priceTemp * Number( v.COUP_DISC )*0.01 ) ) );
								$('span#totalPrice > b').text( numberWithCommas(  priceTemp - ( priceTemp * Number( v.COUP_DISC )*0.01 )   ) );
								$('[name=sndAmount]').val( priceTemp - ( priceTemp * Number( v.COUP_DISC )*0.01 ) );
							}else{
								$('[name=COUP_LIST]').val('');
								$('span#discPrice > b').text('0');
								$('span#totalPrice > b').text( $('span#price > b').text() );
								$('[name=sndAmount]').val( $('span#price > b').text().replace(/,/g,'') );
								return alert('쿠폰을 적용할 수없습니다. \n쿠폰을 적용하려면 상품금액이 ' +v.COUP_MINI +'원 이하여야 합니다.');							
							}
						}else if(v.COUP_MINI_TYPE == 'U'){
							// 가격 이상
							if ( v.COUP_MINI <= priceTemp ) {
								$('span#discPrice > b').text( numberWithCommas( ( priceTemp * Number( v.COUP_DISC )*0.01 ) ) );
								$('span#totalPrice > b').text( numberWithCommas(  priceTemp - ( priceTemp * Number( v.COUP_DISC )*0.01 )   ) );
								$('[name=sndAmount]').val( priceTemp - ( priceTemp * Number( v.COUP_DISC )*0.01 ) );
							}else{
								$('[name=COUP_LIST]').val('');
								$('span#discPrice > b').text('0');
								$('span#totalPrice > b').text( $('span#price > b').text() );
								$('[name=sndAmount]').val( $('span#price > b').text().replace(/,/g,'') );
								return alert('쿠폰을 적용할 수없습니다. \n쿠폰을 적용하려면 상품금액이 ' +v.COUP_MINI +'원 이상이어야 합니다.');							
							}
						}
					}else{
						// 최소,최대 주문가격이 없을때 
						$('span#discPrice > b').text( numberWithCommas( ( priceTemp * Number( v.COUP_DISC )*0.01 ) ) );
						$('span#totalPrice > b').text( numberWithCommas(  priceTemp - ( priceTemp * Number( v.COUP_DISC )*0.01 )   ) );
						$('[name=sndAmount]').val( priceTemp - ( priceTemp * Number( v.COUP_DISC )*0.01 ) );
					}
					
				}else if (v.COUP_DISC_CD == 'DIS02') {
					
					if ( chkCOUP_MINI( v.COUP_MINI, v.COUP_MINI_TYPE )  ) {
						// 최소,최대 주문가격이 있을때
						if ( v.COUP_MINI_TYPE == 'D' ) {
							// 가격 이하
							if ( v.COUP_MINI >= priceTemp ) {
								$('span#discPrice > b').text( numberWithCommas( v.COUP_DISC ) );
								$('span#totalPrice > b').text( numberWithCommas( priceNoZero( priceTemp, v.COUP_DISC ) ) );
								$('[name=sndAmount]').val( priceNoZero( priceTemp, v.COUP_DISC ) );
							}else{
								$('[name=COUP_LIST]').val('');
								$('span#discPrice > b').text('0');
								$('span#totalPrice > b').text( $('span#price > b').text() );
								$('[name=sndAmount]').val( $('span#price > b').text().replace(/,/g,'') );
								return alert('쿠폰을 적용할 수없습니다. \n쿠폰을 적용하려면 상품금액이 ' +v.COUP_MINI +'원 이하여야 합니다.');							
							}
						}else if(v.COUP_MINI_TYPE == 'U'){
							// 가격 이상
							if ( v.COUP_MINI <= priceTemp ) {
								$('span#discPrice > b').text( numberWithCommas( v.COUP_DISC ) );
								$('span#totalPrice > b').text( numberWithCommas( priceNoZero( priceTemp, v.COUP_DISC ) ) );
								$('[name=sndAmount]').val( priceNoZero( priceTemp, v.COUP_DISC ) );
							}else{
								$('[name=COUP_LIST]').val('');
								$('span#discPrice > b').text('0');
								$('span#totalPrice > b').text( $('span#price > b').text() );
								$('[name=sndAmount]').val( $('span#price > b').text().replace(/,/g,'') );
								return alert('쿠폰을 적용할 수없습니다. \n쿠폰을 적용하려면 상품금액이 ' +v.COUP_MINI +'원 이상이어야 합니다.');							
							}
						}
					}else{
						// 최소,최대 주문가격이 없을때 
						$('span#discPrice > b').text( numberWithCommas( v.COUP_DISC ) );
						$('span#totalPrice > b').text( numberWithCommas( priceNoZero( priceTemp, v.COUP_DISC ) ) );
						$('[name=sndAmount]').val( priceNoZero( priceTemp, v.COUP_DISC ) );
					}	
					
				}
			}
		});
	}else{
		$('span#discPrice > b').text('0');
		$('span#totalPrice > b').text( $('span#price > b').text() );
		$('[name=sndAmount]').val( $('span#price > b').text().replace(/,/g,'') );
	}
}

function chkCOUP_MINI( COUP_MINI, COUP_MINI_TYPE ){
	if ( COUP_MINI == "" || COUP_MINI == null || typeof COUP_MINI == 'undefind' || COUP_MINI_TYPE == "" || COUP_MINI_TYPE == null || typeof COUP_MINI_TYPE == 'undefind' ) {
		return false;
	}else{
		return true;
	}
}

$(document).on('change', '[name=COUP_LIST]', calcPrice);

function fn_Subject( subjectNm ){
	var subject = "";
	if (subjectNm == "1:1채팅상담") {
		subject = '[CHAT] ';
	}else if (subjectNm == "1:1화상상담") {
		subject = '[FACE] ';
	}else if (subjectNm == "라이브클래스") {
		subject = '[LIVE] ' ;
	}else if (subjectNm == "1:1이메일상담") {
		subject = '[MAIL] ';
	}else if (subjectNm == "VOD") {
		subject = '[VOD] ';
	}
	return subject;
}

//결제수단 선택
$('.payMethod').on('click', function(){
	var text = "";
	$('[name=sndCashReceipt]').val('0');
	switch(this.innerText){
		case '신용카드': text='1000000000'; $('#cashRecei').hide(); break;
		case '가상계좌': text='0100000000'; $('#cashRecei').show(); break;
		case '계좌이체': text='0010000000'; $('#cashRecei').show(); break;
		case '휴대폰결제': text='0000010000'; $('#cashRecei').hide(); break;
		case '마이페이': text='MYPAY'; $('#cashRecei').show(); break;
		default : text='1000000000'; $('#cashRecei').hide(); break;
	}
	$('[name=sndPaymethod]').val( text );
	$('.payMethod').removeClass('active');
	$(this).addClass('active');
});

</script>

