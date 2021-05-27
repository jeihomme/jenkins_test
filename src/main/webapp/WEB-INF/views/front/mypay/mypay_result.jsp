<%@ page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDateValue"><fmt:formatDate value="${now}" pattern="yyyyMM" /></c:set>
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/payment/ajax" /> 
<%@ include file="./eutil.jsp"%>
<%
	request.setCharacterEncoding("EUC-KR");
	
	String rcid		    = request.getParameter("reCommConId"		);
	String reRetParam	= request.getParameter("reRetParam"			);

	// 공통변수
	
	String authyn     = "";
	String trno       = "";
	String trddt      = "";
	String trdtm      = "";
	String amt        = "";
	String bnkcd      = "";
	String msg1       = "";
	String msg2       = "";
	String ordno      = "";
	String acno       = "";
	String result     = "";
	String resultcd   = "";
 
	String storeid    = "2001106672";
	String username   = "";
	String email      = "";
	String goodname   = "";
	String mobile     = "";
	
	// 마이카드
	
	String authno = "";
	String isscd = "";
	String aqucd = "";
	
	// 마이통장
	// 현금영수증
	String cbauthyn   = "";
	String cbtrno     = "";
	String cbauthno   = "";
	String cbmsg1     = "";
	String cbmsg2     = "";
	
	String ksnet_svc_tkn = "";
	
	// 카드 할부 1월 27일 추가 문제시 DEFAULT_RPARAMS에서도 같이 없앨것
	String  	halbu = "";
 	String 	cardno = "";
	
// 	String MYPAY_WEBHOST_URL = "http://210.181.28.134/store/MYPay/web_host/recv_jpost_tot.jsp";    // 개발용
	String MYPAY_WEBHOST_URL = "https://kspay.ksnet.to/store/MYPay/web_host/recv_jpost_tot.jsp";    // 실서버용      
	String DEFAULT_RPARAMS	= "authyn`trno`trddt`trdtm`amt`acno`msg1`msg2`ordno`result`resultcd`bnkcd`storeid`username`email`goodname`mobile`cbauthyn`cbtrno`cbauthno`cbmsg1`cbmsg2`ksnet_svc_tkn`statuscd`halbu`cardno";

	String curr_date_14 = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());
	String msalt = "MA01";
	String mhkey = "FF7BC0A83DC4E6B6114522CBD70A958C";
	String etoken = get_etoken(mhkey , curr_date_14, "");
	
	StringBuffer sb = new StringBuffer();
	
	sb.append("sndCommConId").append('=').append(rcid).append('&');
	sb.append("sndActionType").append('=').append("1").append('&');
	sb.append("sndStoreid" ).append('=').append(storeid).append('&');
	sb.append("sndMsalt" ).append('=').append(msalt).append('&');
	sb.append("sndEtoken" ).append('=').append(etoken).append('&');
	sb.append("sndRpyParams").append('=').append(URLEncoder.encode(DEFAULT_RPARAMS,"euc-kr")).append('&');
	sb.append("sndCharSet").append('=').append("euc-kr") ;
	
	String send_msg = sb.toString();

	String recv_msg  = call_web_api(MYPAY_WEBHOST_URL ,send_msg , "euc-kr");
	System.out.println("recv_msg["+recv_msg+"]");
	
	LinkedHashMap param_hash = new LinkedHashMap();
	
	boolean ret = parseJson(recv_msg, param_hash); 
	
	// 공통
	
	authyn =  (String)param_hash.get("authyn" );
	trno   =  (String)param_hash.get("trno" );
	trddt  =  (String)param_hash.get("trddt" );
	trdtm  =  (String)param_hash.get("trdtm" );
	amt    =  (String)param_hash.get("amt" );
	msg1   =  (String)param_hash.get("msg1" );
	msg2   =  (String)param_hash.get("msg2" );
	ordno  =  (String)param_hash.get("ordno" );
	acno   =  (String)param_hash.get("acno" );
	result =  (String)param_hash.get("result" );     // 1000(마이카드) , B101(마이통장)
	resultcd = (String)param_hash.get("resultcd" );
	
	username = (String)param_hash.get("username" );
	email    = (String)param_hash.get("email" );
	goodname = (String)param_hash.get("goodname" );
	mobile   = (String)param_hash.get("mobile" );

	// 마이카드 
	if(result.equals("1000")){
		authno = (String)param_hash.get("authno" ); // 승인번호
		isscd    = (String)param_hash.get("isscd" );	// 발급사코드
		aqucd = (String)param_hash.get("aqucd" ); // 매입사코드
	}
	
	// 마이통장
	if(result.equals("B101")){
		bnkcd = (String)param_hash.get("bnkcd" ); // 은행코드 3자리
	}
	
	// 현금영수증 (마이통장 사용시)
	cbauthyn = (String)param_hash.get("cbauthyn" );
	cbtrno   = (String)param_hash.get("cbtrno" );
	cbauthno = (String)param_hash.get("cbauthno" );
	cbmsg1   = (String)param_hash.get("cbmsg1" );
	cbmsg2   = (String)param_hash.get("cbmsg2" );
	
	ksnet_svc_tkn = (String)param_hash.get("ksnet_svc_tkn" );

	halbu		= (String)param_hash.get("halbu");
	cardno	= (String)param_hash.get("cardno");
	
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
var bankArr = [	'002:산업',	'003:기업',	'004:국민',	'007:수협',
						'011:농협',	'020:우리',	'023:SC제일',	'027:씨티',
						'031:대구',	'032:부산',	'034:광주',	'035:제주',
						'037:전북',	'039:경남',	'081:KEB하나',	'088:신한',
						'089:K뱅크',	'090:카뱅' ];
$( function() {
	
	if ('<%=resultcd%>' == '0000') {

		if ('<%=ksnet_svc_tkn%>' != "" && '<%=ksnet_svc_tkn%>' != null ) {
			var params = new Object();			
			params.query = 'updateFrontUserSvcTknData';
			params.KSNET_SVC_TKN = '<%=ksnet_svc_tkn%>';
			params.status = "EDIT";
			params.frontLoginIdx = localStorage.getItem('frontLoginIdx');
			fn_DataAjax2( params );	
		}
		
		$('#price').text( numberWithCommas($('#price').text())+' 원' );
		
		var params = new Object();
		params.query = "updateFrontUserPaymentData";
		params.status = "EDIT";
		params.frontLoginIdx = localStorage.getItem('frontLoginIdx');
<%-- 		params.COUP_IDX = '<%=payCouponVal%>'; --%>
		
		
		params.BUY_ORDER_NUMBER = '<%=ordno%>';
		params.BUY_NO = '<%=trno%>';
		params.BUY_PRIC = '<%=amt%>';
		
		var payResult = '<%=result%>';
			console.log(payResult);
			switch (payResult)
			{
				case '1001' : params.BUY_TYPE = "피플메이드카드"; break;
				case 'B101' : params.BUY_TYPE = "피플메이드통장"	; break;
				default  :  params.BUY_TYPE = "(????)"; break; 
			}
		
		if (payResult == 'B101') {
			params.BUY_CD = ${sysDateValue} + 'PT'; // 마이통장
			
		}else if (payResult == '1001') {
			params.BUY_CD = ${sysDateValue} + 'PM'; // 마이카드
		}
		var bkNm = "";
		$.each(bankArr, function( k, v ){
			if (v.indexOf( '<%=bnkcd%>' ) > -1 ) {
				bkNm = v.split(':')[1];
			}
		});
		
		if ( payResult == '1001' ) {
			bkNm = '';
		}
		
		$('#accountNo').text(localStorage.getItem('frontLoginNm') +' / ' +  bkNm + ' <%=acno%>' );
		params.BUY_BANK_CD = '<%=bnkcd%>';
		params.BUY_ACCO_NO = bkNm + ' <%=acno%>';
		
		if(params.BUY_TYPE == '피플메이드카드') params.BUY_BANK_CD = '<%=aqucd%>';	

		if ('<%=authyn%>' == 'O' ) {
			params.BUY_COMP_YN = "Y";
			params.BUY_STAT= '결제완료';
		}else if ('<%=authyn%>' == 'S' ) {
			params.BUY_COMP_YN = "S";
			params.BUY_STAT= '결제대기중';
		}else{
			params.BUY_COMP_YN = "N";
		}
		
		// 다음주에 물어 보고 결정
		// params.CASH_RECEIPT = 
		
		params.CASH_RECEIPT = '<%=cbauthyn%>';
		
		params.BUY_HALBU = '<%=halbu%>';
		params.BUY_CARD_NO = '<%=cardno%>';
		console.log( params.CASH_RECEIPT );
		if ( params.CASH_RECEIPT == null || params.CASH_RECEIPT == "null" || params.CASH_RECEIPT == '' || typeof params.CASH_RECEIPT == "null" ) {
			params.CASH_RECEIPT = '0';
		}else{
			params.CASH_RECEIPT = '1';
			params.CASH_RECE_NO = '<%=cbtrno%>';	
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
			params.COUP_ARR = localStorage.getItem('payArr');
			fn_DataAjax2( params );	
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
                            <td id="sndGoodname"><%=goodname%></td>
                        </tr>
                        <tr>
                            <th>총 결제 금액</th>
                            <td>
                                <span id="price" class="pay"><%=amt%></span>
                            </td>
                        </tr>
                        <tr>
                            <th>결제수단</th>
                            <td>
                                <div class="method">
                                    <div>
		                                <%
										switch (result)
										{
											case "1001" : out.println("피플메이드카드"); break;
											case "B101" : out.println("피플메이드통장")	; break;
											default  :  out.println("(????)"); break; 
										}
										%>
                                    </div>
                                    
                            <% if ( result.equals("B101")  ){ %>
                                    <div class="color_main"  id="accountNo"> / <%=authno%> / <%=isscd%></div>
							<%}%>
                                    
                                </div>
                            </td>
                        </tr>
                            <% if ( result.equals("B101")  ){ %>
					          <% if (cbauthyn == "O"){ %>
                        <tr>
                            <th>현금영수증거래번호/승인번호</th>
                            <td>
                                <div class="method">
							            <div><%=cbtrno%> / <%=cbauthno%></div>
                                </div>
                            </td>
                        </tr>
					          <%}%>
							<%}%>
                    </table>
                    <div class="card_complete_button_area">
                      <button type="button" class="card_complete_button btn_white" onclick="location.href='/front/mypage/payment' ">구매내역 보기</button>
                      <button type="button" class="card_complete_button btn_cyan" onclick="location.href='/' ">홈으로 가기</button>
                    </div>
                </div>
            </div>
        </section>
<%-- 							<% if ( result.equals("B101")  ){ %> --%>
<!-- 							          <tr > -->
<!-- 							            <td> 계좌번호 </td> -->
<!-- 							            <td id="accountNo"></td> -->
<!-- 							          </tr> -->
<%-- 							          <% if (cbauthyn == "O"){ %> --%>
<!-- 							          <tr > -->
<!-- 							            <td> 현금영수증거래번호 </td> -->
<%-- 							            <td id="accountNo"><%=cbtrno%></td> --%>
<!-- 							          </tr> -->
<!-- 							          <tr > -->
<!-- 							            <td> 현금영수증승인번호 </td> -->
<%-- 							            <td id="accountNo"><%=cbauthno%></td> --%>
<!-- 							          </tr> -->
<%-- 							          <% } %> --%>
<%-- 							<%}%> --%>
							
					
    </div><!-- // #container -->
<jsp:include page="/WEB-INF/views/front/payment/paymentFooter.jsp"/>
