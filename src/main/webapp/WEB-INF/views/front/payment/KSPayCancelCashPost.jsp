<!------------------------------------------------------------------------------
 FILE NAME : KSPayCancelCashPost.jsp
 AUTHOR : kspay@ksnet.co.kr
 DATE : 2003/11/29
                                                         http://www.kspay.co.kr
                                                         http://www.ksnet.co.kr
                                  Copyright 2003 KSNET, Co. All rights reserved
------------------------------------------------------------------------------->
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.ppm.kspay.KSPayApprovalCancelBean" %>
<%@ page contentType="text/html;charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
// Default(수정항목이 아님)-------------------------------------------------------
	String EncType       = "0";                                      // 0: 암화안함, 1:openssl, 2: seed
	String Version       = "0210";                                   // 전문버전
	String Type          = "00";                                     // 구분
	String Resend        = "0";                                      // 전송구분 : 0 : 처음,  2: 재전송
	String RequestDate   = new SimpleDateFormat("yyyyMMddhhmmss").format(new java.util.Date()); // 요청일자 : yyyymmddhhmmss
	String KeyInType     = "K";                                      // KeyInType 여부 : S : Swap, K: KeyInType
	String LineType      = "1";                                      // lineType 0 : offline, 1:internet, 2:Mobile
	String ApprovalCount = "1";                                      // 복합승인갯수
	String GoodType      = "0";                                      // 제품구분 0 : 실물, 1 : 디지털
	String HeadFiller    = "";                                       // 예비
//-------------------------------------------------------------------------------
	
// Header (입력값 (*) 필수항목)--------------------------------------------------
	String StoreId       = request.getParameter("storeid");          // *상점아이디
	String OrderNumber   = "";                                       // 주문번호
	String UserName      = "";                                       // *주문자명
	String IdNum         = "";                                       // 주민번호 or 사업자번호
	String Email         = "";                                       // *email
	String GoodName      = "";                                       // *제품명
	String PhoneNo       = "";                                       // *휴대폰번호
// Header end -------------------------------------------------------------------
	
// Data Default(수정항목이 아님)-------------------------------------------------
	String ApprovalType  = request.getParameter("authty");           // 승인구분
	String TrNo          = request.getParameter("trno");             // 거래번호
	String Refundcheck   = request.getParameter("cash_canc_type");   // 취소구분(1.거래취소, 2.오류발급취소, 3.기타) 
// Data Default end -------------------------------------------------------------
	
// 승인거절 응답
// Server로 부터 응답이 없을시 자체응답
	String rApprovalType        = "H011"; 
	String rHTransactionNo      = "";                // 거래번호
	String rHStatus             = "X";               // 상태 O : 승인, X : 거절
	String rHCashTransactionNo  = "";                // 현금현수증 거래확인번호
	String rHIncomeType         = "";                // 소득비소득 구분
	String rHTradeDate          = "";                // 거래일자
	String rHTradeTime	        = "";                // 거래시간
	String rHMessage1           = "취소거절";        // 메시지1
	String rHMessage2           = "C잠시후재시도";   // 메시지2
	String rHCashMessage1       = "";
	String rHCashMessage2       = "";
	
	try
	{
		KSPayApprovalCancelBean ipg = new KSPayApprovalCancelBean("localhost", 29991); 
		
		ipg.HeadMessage(EncType, Version, Type, Resend, RequestDate, StoreId, OrderNumber, UserName, IdNum, Email, 
						GoodType, GoodName, KeyInType, LineType, PhoneNo, ApprovalCount, HeadFiller);
		
//<현금영수증 취소변경> 
		ipg.CancelDataMessage(ApprovalType, "0", TrNo, "", "", "",Refundcheck,"");
		
		if(ipg.SendSocket("1")) {
			rApprovalType       = ipg.ApprovalType[0];
			rHTransactionNo     = ipg.HTransactionNo[0];         // 거래번호
			rHStatus            = ipg.HStatus[0];                // 상태 O : 승인, X : 거절
			rHCashTransactionNo = ipg.HCashTransactionNo[0];     // 거래일자
			rHIncomeType        = ipg.HIncomeType[0];            // 거래시간
			rHTradeDate         = ipg.HTradeDate[0];             // 발급사코드
			rHTradeTime         = ipg.HTradeTime[0];             // 매입사코드
			rHMessage1          = ipg.HMessage1[0];              // 승인번호 or 거절시 오류코드
			rHMessage2          = ipg.HMessage2[0];              // 메시지1
			rHCashMessage1      = ipg.HCashMessage1[0];          // 메시지2
			rHCashMessage2      = ipg.HCashMessage2[0];          // 카드번호
		}
	}
	catch(Exception e) {
		rHMessage2 = "P잠시후재시도("+e.toString()+")";     // 메시지2
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
								현금영수증 취소
								</font></td>
							</tr>
							<tr bgcolor=#FFFFFF>
								<td valign=top>
									<table width=100% cellspacing=0 cellpadding=2 border=0>
										<tr>
											<td align=left>
												<table>	
													<tr><td>거래번호       </td><td><%=rHTransactionNo%></td></tr>
													<tr><td>오류구분(O/X)  </td><td><%=rHStatus%></td></tr>
													<tr><td>국세청승인번호 </td><td><%=rHCashTransactionNo%></td></tr>
													<tr><td>거래 일자      </td><td><%=rHTradeDate%></td></tr>
													<tr><td>거래 시간      </td><td><%=rHTradeTime%></td></tr>
													<tr><td>응답 메세지1   </td><td><%=rHMessage1%></td></tr>
													<tr><td>응답 메세지2   </td><td><%=rHMessage2%></td></tr>
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