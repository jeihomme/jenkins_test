<!------------------------------------------------------------------------------
 FILE NAME : KSPayCashPost.jsp
 AUTHOR : kspay@ksnet.co.kr
 DATE : 2004/12/22
                                                         http://www.kspay.co.kr
                                                         http://www.ksnet.co.kr
                                  Copyright 2003 KSNET, Co. All rights reserved
------------------------------------------------------------------------------->
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="com.ppm.kspay.KSPayApprovalCancelBean" %>
<%@ page contentType="text/html;charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
// Default(수정항목이 아님)-------------------------------------------------------
	String EncType       = "2";                                    // 0: 암화안함, 1:openssl, 2: seed
	String	Version      = "0412";                                 // 전문버전: 현금영수증은 전문버전을 0311이전으로 하면 안됩니다.
	String Type          = "00";                                   // 구분
	String Resend        = "0";                                    // 전송구분 : 0 : 처음,  2: 재전송
	String RequestDate   = new SimpleDateFormat("yyyyMMddhhmmss").format(new java.util.Date()); // 요청일자 : yyyymmddhhmmss
	String KeyInType     = "K";                                    // KeyInType 여부 : S : Swap, K: KeyInType
	String LineType      = "1";                                    // lineType 0 : offline, 1:internet, 2:Mobile
	String ApprovalCount = "1";                                    // 복합승인갯수
	String GoodType      = "0";                                    // 제품구분 0 : 실물, 1 : 디지털
	String HeadFiller    = "";                                     // 예비
//-------------------------------------------------------------------------------
	
// Header (입력값 (*) 필수항목)--------------------------------------------------
	String StoreId       = request.getParameter("storeid")    ;    // 상점아이디
	String OrderNumber   = request.getParameter("ordernumber");    // 주문번호
	String UserName      = request.getParameter("ordername")  ;    // 주문자명
	String IdNum         = request.getParameter("idnum")      ;    // 주민번호 or 사업자번호
	String Email         = request.getParameter("email")      ;    // email
	String GoodName      = request.getParameter("goodname")   ;    // 제품명
	String PhoneNo       = ""                                 ;    // 휴대폰번호
// Header end -------------------------------------------------------------------
	
// Data Default(수정항목이 아님)-------------------------------------------------
	String CallCode      = "0";                                    //통화코드  (0: 원화, 1: 미화)
	String Filler        = "0";                                    //예비
// Data Default end -------------------------------------------------------------
	
// Data (입력값 (*) 필수항목)----------------------------------------------------
	String ApprovalType  = request.getParameter("authty");         //H000:일반발급, H200:계좌이체, H600:가상계좌
	String IssuSele      = "1";                                    //0:일반발급(PG원거래번호 중복체크), 1:단독발급(주문번호 중복체크 : PG원거래 없음), 2:강제발급(중복체크 안함)
	String TransactionNo = request.getParameter("TransactionNo");  //입금완료된 계좌이체, 가상계좌 거래번호
	String UserInfo      = IdNum;                                  //주민등록번호, 사업자번호, 카드번호, 휴대폰번호, 기타
	String SupplyAmt     = request.getParameter("SupplyAmt");      //공급가액
	String TaxAmt        = request.getParameter("TaxAmt");         //세금
	String SvcAmt        = request.getParameter("SvcAmt");         //봉사료
	String TotAmt        = request.getParameter("TotAmt");         //현금영수증 발급금액
	String UserInfoSele  = "";                                     //0:주민등록번호, 1:사업자번호, 2:카드번호, 3:휴대폰번호, 4:기타
	String TranSele      = request.getParameter("transele");       //발행구분 0: 소득공제용(개인), 1: 지출증빙용(사업자)
	
	//중복체크전문 오류방지를 위해서 구분값 체크 및 변경
	if (IssuSele.substring(0,1) != "2" && !ApprovalType.substring(0,2).equals("H0"))
	{
		IssuSele = "0";     //가상계좌, 계좌이체요청이므로 0으로 세팅
	}
	else if (!IssuSele.substring(0,1).equals("2"))
	{
		IssuSele = "1";     //일반요청이므로 이므로 1로 세팅
	}
	else
	{
		IssuSele = "2";     //강제발급으로 세팅
	}
	
	if (IdNum.length() == 10 && IdNum.substring(0,1) != "0")   // 사업자번호
	{
		UserInfoSele = "1";
	}
	else if (IdNum.length() == 13)     // 주민등록번호
	{
		UserInfoSele = "0";
	}
	else                               // 휴대폰번호
	{
		UserInfoSele = "3";
	}
// Data end ---------------------------------------------------------------------

// 승인거절 응답
// Server로 부터 응답이 없을시 자체응답

	String rApprovalType        = (ApprovalType != null && ApprovalType.length() == 4) ? ApprovalType.substring(0,3) + "1" : "H000";
	String rTransactionNo       = "";
	String rStatus              = "X";
	String rCashTransactionNo   = "";
	String rIncomeType          = "";
	String rTradeDate           = "";
	String rTradeTime           = "";
	String rMessage1            = "발급거절";
	String rMessage2            = "B잠시후재시도";
	String rCashMessage1        = "";
	String rCashMessage2        = "";
	String rFiller              = "";
	
	try 
	{
		com.ppm.kspay.KSPayApprovalCancelBean ipg = new com.ppm.kspay.KSPayApprovalCancelBean("localhost", 29991);
		
		ipg.HeadMessage(EncType, Version, Type, Resend, RequestDate, StoreId, OrderNumber, UserName, IdNum, Email, 
						GoodType, GoodName, KeyInType, LineType, PhoneNo, ApprovalCount, HeadFiller);
		
		ipg.CashBillDataMessage(ApprovalType, TransactionNo, IssuSele, UserInfoSele, UserInfo, TranSele, CallCode, SupplyAmt
									, TaxAmt, SvcAmt, TotAmt, Filler);
		
		if(ipg.SendSocket("1")) {
			rApprovalType        = ipg.ApprovalType      [0];/* 승인구분 코드          */
			rTransactionNo       = ipg.HTransactionNo    [0];/* 거래번호               */
			rStatus              = ipg.HStatus           [0];/* 오류구분 O:정상 X:거절 */
			rCashTransactionNo   = ipg.HCashTransactionNo[0];/* 현금영수증 거래번호    */
			rIncomeType          = ipg.HIncomeType       [0];/* 0: 소득      1: 비소득 */
			rTradeDate           = ipg.HTradeDate        [0];/* 거래 개시 일자         */
			rTradeTime           = ipg.HTradeTime        [0];/* 거래 개시 시간         */
			rMessage1            = ipg.HMessage1         [0];/* 응답 message1          */
			rMessage2            = ipg.HMessage2         [0];/* 응답 message2          */
			rCashMessage1        = ipg.HCashMessage1     [0];/* 국세청 메시지 1        */
			rCashMessage2        = ipg.HCashMessage2     [0];/* 국세청 메시지 2        */
			rFiller              = ipg.HFiller           [0];/* 예비                   */
		}
	}
	catch(Exception e) {
		rStatus                  = "X";
		rMessage1                = "발급거절";         // 메시지1
		rMessage2                = "잠시후재시도";     // 메시지2
	} // end of catch
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html charset=euc-kr">
<title>KSPay</title>
<style type="text/css">
	TABLE{font-size:9pt; line-height:160%;}
	A {color:blueline-height:160% background-color:#E0EFFE}
	INPUT{font-size:9pt}
	SELECT{font-size:9pt}
	.emp{background-color:#FDEAFE}
	.white{background-color:#FFFFFF color:black border:1x solid white font-size: 9pt}
</style>
</head>
<body>
<table border=0 width=0>
	<tr>
		<td align=center>
			<table width=350 cellspacing=0 cellpadding=0 border=0 bgcolor=#4F9AFF>
				<tr>
					<td width=50%>
						<table width=100% cellspacing=1 cellpadding=2 border=0>
							<tr bgcolor=#4F9AFF height=25>
								<td align=left><font color="#FFFFFF">
								현금영수증 발급
								</font></td>
							</tr>
							<tr bgcolor=#FFFFFF>
								<td valign=top>
									<table width=100% cellspacing=0 cellpadding=2 border=0>
										<tr>
											<td align=left>
												<table>	
													<tr><td>거래번호       </td><td><%=rTransactionNo%></td></tr>
													<tr><td>오류구분(O/X)  </td><td><%=rStatus%></td></tr>
													<tr><td>국세청승인번호 </td><td><%=rCashTransactionNo%></td></tr>
													<tr><td>거래 일자      </td><td><%=rTradeDate%></td></tr>
													<tr><td>거래 시간      </td><td><%=rTradeTime%></td></tr>
													<tr><td>응답 메세지1   </td><td><%=rMessage1%></td></tr>
													<tr><td>응답 메세지2   </td><td><%=rMessage2%></td></tr>
												</table>
											<td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>