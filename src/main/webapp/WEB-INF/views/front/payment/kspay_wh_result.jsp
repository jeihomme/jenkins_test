<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDateValue"><fmt:formatDate value="${now}" pattern="yyyyMM" /></c:set>
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" /> 
<%
 	// PC일때 받는 값
 	String rcid		= request.getParameter("reWHCid"		);
 	String rctype	= request.getParameter("reWHCtype"		);
 	String rhash	= request.getParameter("reWHHash"			);
 	String sndCashReceipt	= request.getParameter("sndCashReceipt"			);
 	System.out.println( "sndCashReceipt : " + sndCashReceipt );
 // MOBILE일때 받는 값
 	if( rcid == null ){
 		rcid		= request.getParameter("reCommConId"		);
 	}
 	if( rctype == null ){
 		rctype	= request.getParameter("reCommType"		);
 	}
 	if( rhash == null ){
 		rhash	= request.getParameter("reHash"			);
 	}
 	String rcancel  = request.getParameter("reCnclType"			);   // 1 취소응답, 0 정상응답
 	/* rcid 없으면 결제를 끝까지 진행하지 않고 중간에 결제취소 */

 	String	authyn =  "";
 	String	trno   =  "";
 	String	trddt  =  "";
 	String	trdtm  =  "";
 	String	amt    =  "";
 	String	authno =  "";
 	String	msg1   =  "";
 	String	msg2   =  "";
 	String	ordno  =  "";
 	String	isscd  =  "";
 	String	aqucd  =  "";
 	String	temp_v =  "";
 	String	result =  "";
 	String	cbtrno =  "";
 	String	cbauthno =  "";

 	String	resultcd =  "";
 	
 	String  	halbu = "";
 	String 	cardno = "";

 	//업체에서 추가하신 인자값을 받는 부분입니다 
 	String	rece_why =  request.getParameter("RECE_WHY"); 
 	if( rece_why == null ) rece_why = request.getParameter("ECHA");
 	
 	String	rece_kind =  request.getParameter("RECE_KIND"); 
 	if( rece_kind == null ) rece_kind = request.getParameter("ECHE");
 	
 	String	rece_sid =  request.getParameter("RECE_SID"); 
 	if( rece_sid == null ) rece_sid = request.getParameter("ECHF");
	System.out.println("rece_why" + rece_why );
	System.out.println("rece_kind" + rece_kind );
	System.out.println("rece_sid" + rece_sid );
 	
 	
 	String payCouponVal =  request.getParameter("payCouponVal");
 	if( payCouponVal == null ) payCouponVal =  request.getParameter("ECHB");
 	
 	String	payMethod =  request.getParameter("payMethod");
 	if( payMethod == null ) payMethod =  request.getParameter("ECHC");
 	
 	String	payAmout =  request.getParameter("payAmout");
 	if( payAmout == null ) payAmout =  request.getParameter("ECHD");
 	
 	
 	com.ppm.kspay.KSPayWebHostBean ipg = new com.ppm.kspay.KSPayWebHostBean(rcid);
 	if (ipg.kspay_send_msg("1"))		//KSNET 결제결과 중 아래에 나타나지 않은 항목이 필요한 경우 Null 대신 필요한 항목명을 설정할 수 있습니다.
 	{
 		authyn	 = ipg.kspay_get_value("authyn");
 		trno	 = ipg.kspay_get_value("trno"  );
 		trddt	 = ipg.kspay_get_value("trddt" );
 		trdtm	 = ipg.kspay_get_value("trdtm" );
 		amt		 = ipg.kspay_get_value("amt"   );
 		authno	 = ipg.kspay_get_value("authno");
 		msg1	 = ipg.kspay_get_value("msg1"  );
 		msg2	 = ipg.kspay_get_value("msg2"  );
 		ordno	 = ipg.kspay_get_value("ordno" );
 		isscd	 = ipg.kspay_get_value("isscd" );
 		aqucd	 = ipg.kspay_get_value("aqucd" );
 		temp_v	 = "";
 		result	 = ipg.kspay_get_value("result");
 		cbtrno	 = ipg.kspay_get_value("cbtrno");
 		cbauthno	 = ipg.kspay_get_value("cbauthno");
 		
 		halbu		= ipg.kspay_get_value("halbu");
 		cardno		= ipg.kspay_get_value("cardno");
 		if (null != authyn && 1 == authyn.length())
 		{
 	if (authyn.equals("O"))
 	{
 		resultcd = "0000";
 	}else
 	{
 		resultcd = authno.trim();
 	}
 		}
 		// 정상처리되지 않은경우 ipg.kspay_send_msg("1") 를 다시한번 호출하여 응답을 재전송받을수 있습니다.
 	}
 	
 	
 %>
<jsp:include page="/WEB-INF/views/front/payment/paymentHeader.jsp"/>
<script language="javascript">
// 신용카드 영수증 출력 스크립트
function receiptView(tr_no)
{
	receiptWin = "http://nims.ksnet.co.kr/pg_infoc/src/bill/credit_view.jsp?tr_no="+tr_no;
    window.open(receiptWin , "" , "scrollbars=no,width=434,height=700");
}

// 현금영수증 출력 스크립트
function CashreceiptView(tr_no)
{
    receiptWin = "http://nims.ksnet.co.kr/pg_infoc/src/bill/ps1.jsp?s_pg_deal_numb="+tr_no;
    window.open(receiptWin , "" , "scrollbars=no,width=434,height=580");
}

// <OPTION VALUE="1000000000" SELECTED>신용카드</OPTION>
//<OPTION VALUE="0100000000">가상계좌</OPTION>
//<OPTION VALUE="0010000000">계좌이체</OPTION>
//<OPTION VALUE="0000010000" >휴대폰결제</OPTION>
$( function() {
//		현금영수증 로직
	
	if ( is_mobile() && '<%=rcancel%>' != 0 ) {
		location.href = "/front/payment/cart_payment_mobile";
	}
	
		var params = new Object();
		params.query = "selectFrontPaymentBankList";
		params.status = "LIST";
		params.frontLoginIdx = localStorage.getItem('frontLoginIdx');
		var bankList =  fn_DataAjax2( params );
		var bankNm = "";
		
		if(bankList.out.detail.data.length > 0 ){
			$.each(bankList.out.detail.data, function( k, v ){
				if (  v.CODE_ID.substring( 2 ) == '<%=authno%>' ) {
					bankNm = v.CODE_NM;
				}
			});
		}
		
		// 가상계좌일 경우 계좌번호 
		// 계좌이체일 경우는 아직 처리 안함 2020-12-21
		if ( $('#accountNo').length ) {
			$('#accountNo').text( localStorage.getItem('frontLoginNm') +' / ' + bankNm + '/ <%=isscd%>' );
		}
		
		$('#sndGoodname').text( localStorage.getItem('sndGoodname') );
		
		$('#price').text( numberWithCommas($('#price').text()) );
		
		var params = new Object();
		params.query = "updateFrontUserPaymentData";
		params.status = "EDIT";
		params.frontLoginIdx = localStorage.getItem('frontLoginIdx');
		params.COUP_IDX = '<%=payCouponVal%>';
		
		var payMethod = '<%=payMethod%>';
		if (payMethod == '1000000000') {
		params.BUY_CD = ${sysDateValue} + 'PC'; // 카드
		}else if (payMethod == '0100000000') {
		params.BUY_CD = ${sysDateValue} + 'PV'; // 가상계좌
		}else if (payMethod == '0010000000') {
		params.BUY_CD = ${sysDateValue} + 'PB'; // 계좌이체
		}else if (payMethod == '0000010000') { 
		params.BUY_CD = ${sysDateValue} + 'PN'; // 휴대폰결제
		}
		params.BUY_ORDER_NUMBER = '<%=ordno%>';
		params.BUY_NO = '<%=trno%>';
		params.BUY_PRIC = '<%=amt%>';
		
		var payResult = '<%=result%>';
		
		params.BUY_HALBU = '<%=halbu%>';
		params.BUY_CARD_NO = '<%=cardno%>';
		
		if (null == payResult || 4 != payResult.length)
		{
			params.BUY_TYPE = "(???)";
		}else
		{
			switch (payResult.charAt(0))
			{
				case '1' : params.BUY_TYPE = "신용카드"; break;
				case 'I' : params.BUY_TYPE = "신용카드"	; break;
				case '2' : params.BUY_TYPE = "계좌이체"	; break;
				case '6' : params.BUY_TYPE = "가상계좌"; break;
				case 'M' : params.BUY_TYPE = "휴대폰결제"; break;
				default  :  params.BUY_TYPE = "(????)"; break;
			}
		}
		
		params.BUY_ACCO_NO = bankNm + ' <%=isscd%>';
		params.BUY_BANK_CD =  '<%=authno%>';
		
		if(params.BUY_TYPE == '신용카드') params.BUY_BANK_CD = '<%=aqucd%>';
		
		if ('<%=authyn%>' == 'O' ) {
			if ( params.BUY_TYPE == "신용카드" || params.BUY_TYPE == "계좌이체" || params.BUY_TYPE == "휴대폰결제" ) {
				params.BUY_COMP_YN = "Y";
				params.BUY_STAT= '결제완료';
			}else{
				params.BUY_COMP_YN = "N";
				params.BUY_STAT= '입금대기';
			}
		}else{
			params.BUY_COMP_YN = "N";
			params.BUY_STAT= '결제실패';
		}
		
<%-- 		if ( payMethod == '0100000000' && '<%=sndCashReceipt%>' == 1 ) { --%>
// 			var cashReceipt = new Object();
// 			cashReceipt.query = "updateFrontPaymentCashReceData";
// 			cashReceipt.status = "CASH_RECEIPT_ISSUE";
// 			cashReceipt.frontLoginIdx = localStorage.getItem('frontLoginIdx');
			
<%-- 			cashReceipt.BUY_ORDER_NUMBER = '<%=ordno%>'; --%>
<%-- 			cashReceipt.BUY_NO = '<%=trno%>'; --%>
<%-- 			cashReceipt.BUY_PRIC = '<%=amt%>'; --%>
			
// 			fn_DataAjax2( cashReceipt );
// 		}
		
		// 다음주에 물어 보고 결정
		params.CASH_RECEIPT = '<%=sndCashReceipt%>';
		
		if ( params.CASH_RECEIPT == null || params.CASH_RECEIPT == "null" || params.CASH_RECEIPT == '' || typeof params.CASH_RECEIPT == "null" || params.CASH_RECEIPT == 'O' ) {
			params.CASH_RECEIPT = '0';
		}else{
			params.cbtrno = '<%=cbtrno%>';	
		}
		
		var payArr = localStorage.getItem('payArr');
		payArr = payArr.split(',');
		
		// 사전질문이 등록이 되어 있다면
		var ques_ques_idxs = localStorage.getItem('ques_ques_idxs');
		
		$.each(payArr, function( k, v ){
			params.PRDT_CD = v;
			fn_DataAjax2( params );
			
			if ( ques_ques_idxs != null && ques_ques_idxs != '' && ques_ques_idxs != undefined ) {
				
				ques_ques_idxs = ques_ques_idxs.slice(0,-1);
				
				if ( v.indexOf('FN') > -1 || v.indexOf('CN') > -1 || v.indexOf('LN') > -1 ) {
					// 시간 갚과 질문이 있는 상품이라면
// 					alert( '작동한다는 표시' );
					var ques_idx_params = new Object();
					ques_idx_params.query = "updatePrdtQuesDataData";
					ques_idx_params.status = "EDIT";
					ques_idx_params.QUES_QUES_IDXS = ques_ques_idxs;
					ques_idx_params.PRDT_CD = v;
					ques_idx_params.BUY_NO = params.BUY_NO;
					ques_idx_params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
					fn_DataAjax2( ques_idx_params );
				}
			}
			
		});
		
		
		if ('<%=authyn%>' == 'O' ) {
			var params = new Object();
			params.query = "deleteFrontPaymentBask";
			params.status = "DELETE";
			params.frontLoginIdx = localStorage.getItem('frontLoginIdx');
			params.PAY_ARR = localStorage.getItem('payArr');
			
			var arr = '';
			$.each( params.PAY_ARR.split(','), function( k, v ){
				arr += '"'+v+'"' + ',';
			});
			params.PAY_ARR = arr.slice(  0 , arr.length-1 );
			
			fn_DataAjax2( params );	
			
			var params = new Object();
			params.query = "deleteFrontPaymentCoup";
			params.status = "DELETE";
			params.frontLoginIdx = localStorage.getItem('frontLoginIdx');
			params.COUP_ARR = '<%=payCouponVal%>';
			fn_DataAjax2( params );	
			
		}
		
		localStorage.removeItem('ques_ques_idxs');
		
		var payCardType = '<%=cardno%>';
		
		if (payCardType != '' && payCardType != null) {
			if (payCardType.indexOf('KAKAO') > -1) {
				$('.method div').text('카카오페이');
			}else if ( payCardType.indexOf('NPAY') > -1 ) {
				$('.method div').text('네이버페이포인트');
			}else if ( payCardType.indexOf('PAYCO') > -1 ) {
				$('.method div').text('페이코');
			}
			
		}
		
		
		$( '#now_loading' ).hide();
});
// -->
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
<style>
#payTable tr{ height: 50px; }
#payTable {  border-top: 1px solid;}
#payTable td {border-bottom: 1px solid;}
#payTable td + td{border-left: 1px solid;}

#payBtns{ margin-top: 20px;  }
#payBtns input{ 
	width: 29%;
    height: 40px;
    color: #ff8939;
    border: 1px solid #ff8939;
    background-color: transparent;

    border-radius: 4px;
    cursor: pointer;
}
#payTable{text-align: center; margin: auto; color: white; width: 60%; }
@media( max-width: 1310px ){
	#payTable{width: 100%!important;}
}
#payBtns input + input{ margin-left: 2%;  background-color: #ff8939; color: white; }
</style>
   <div id="container">
        <section>
            <div class="section_inner">
                <div class="section_cont_top">
                    <h3 class="section_cont_top_title">결제완료</h3>
					<div class="breadcrumb">
	                    <span class="is-active">01 장바구니</span>
	                    <span>주문내역</span>
	                    <span>장바구니</span>
                	</div>
                </div>
            </div>     
        </section>
				
		<section>
            <div class="section_inner">
                <div class="cart_complete">
                    <%
                		if( authyn.equals("O") ){
                	%>		
                    <strong class="cart_complete_title">주문/ 결제가 정상적으로 완료되었습니다.</strong>
                	<%
                		}else{
                	%>		
                    <strong class="cart_complete_title">주문/ 결제가 실패했습니다.</strong>
                	<%
                		}
                	%>
                	
                    <table class="card_complete_table">
                        <tr>
                            <th>주문번호</th>
                            <td><%=trno%></td>
                        </tr>
                        <tr>
                            <th>주문상품</th>
                            <td id="sndGoodname"></td>
                        </tr>
                        <tr>
                            <th>총 결제 금액</th>
                            <td>
                                <span id="price" class="pay"><%=amt%></span>원
                            </td>
                        </tr>
                        <tr>
                            <th>결제수단</th>
                            <td>
                                <div class="method">
                                    <div>
		                                <%
													if (null == result || 4 != result.length())
													{
														out.println("(???)");
													}else
													{
														switch (result.charAt(0))
														{
															case '1' : out.println("신용카드"		); break;
															case 'I' : out.println("신용카드"		); break;
															case '2' : out.println("실시간계좌이체"	); break;
															case '6' : out.println("가상계좌"	); break; 
															case 'M' : out.println("휴대폰결제"		); break; 
															default  :  out.println("(????)"			); break; 
														}
													}
										%>
                                    </div>
								<% if ( payMethod.equals("0100000000")  ){ %>
                                    <div class="color_main"  id="accountNo"> / <%=authno%> / <%=isscd%></div>
<!--                                     <div class="color_main">입금기한 : 2020-12-31 까지</div> -->
								<%}%>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <div class="card_complete_button_area">
                      <button type="button" class="card_complete_button btn_white" onclick="location.href='/front/mypage/payment' ">구매내역 보기</button>
                      <button type="button" class="card_complete_button btn_cyan" onclick="location.href='/' ">홈으로 가기</button>
<%--                      <% if (authyn != null && authyn.equals("O") && trno.charAt(0) == '1') { %> <!-- 정상승인의 경우만 영수증출력: 신용카드의 경우만 제공 --> --%>
<%-- 											<input type="button" value="영수증출력" onClick="javascript:receiptView('<%=trno%>')"> --%>
<%-- 							      		<% } %> --%>
<%-- 									  <% if (authyn != null && authyn.equals("O") && trno.charAt(0) == '1') { %> <!-- 정상승인의 경우만 영수증출력: 신용카드의 경우만 제공 --> --%>
<%-- 											<input type="button" value="영수증출력" onClick="javascript:CashreceiptView('<%=trno%>')"> --%>
<%-- 							      		<% } %> --%>
                    </div>
                </div>
            </div>
        </section>
				
				
            
            
            
            
            
    </div><!-- // #container -->
<jsp:include page="/WEB-INF/views/front/payment/paymentFooter.jsp"/>


