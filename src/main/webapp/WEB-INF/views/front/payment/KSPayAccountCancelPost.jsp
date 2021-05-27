<%------------------------------------------------------------------------------
 FILE NAME : KSPayCancelPost.jsp
 AUTHOR : kspay@ksnet.co.kr
 DATE : 2007/08/30
                                                         http://www.kspay.co.kr
                                                         http://www.ksnet.co.kr
                                  Copyright 2003 KSNET, Co. All rights reserved
-------------------------------------------------------------------------------%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.ppm.kspay.KSPayApprovalCancelBean" %>
<%@ page contentType="text/html;charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
//Header부 Data --------------------------------------------------
	String EncType              = "2" ;                                 // 0: 암화안함, 1:ssl, 2: seed
	String Version              = "0603" ;                              // 전문버전
	String Type                 = "00" ;                                // 구분
	String Resend               = "0" ;                                 // 전송구분 : 0 : 처음,  2: 재전송
	String RequestDate          = new SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()); // 요청일자 :
	String KeyInType            = "K" ;                                 // KeyInType 여부 : S : Swap, K: KeyInType
	String LineType             = "1" ;                                 // lineType 0 : offline, 1:internet, 2:Mobile
	String ApprovalCount        = "1" ;                                 // 복합승인갯수
	String GoodType             = "0" ;                                 // 제품구분 0 : 실물, 1 : 디지털
	String HeadFiller           = "" ;                                  // 예비
	
// Header (입력값 (*) 필수항목)--------------------------------------------------
	String StoreId              = request.getParameter("storeid") ;     // *상점아이디
	String OrderNumber          = "";                                   // 주문번호
	String UserName             = "";                                   // 주문자명
	String IdNum                = "";                                   // 주민번호 or 사업자번호
	String Email                = "";                                   // email
	String GoodName             = "";                                   // 제품명
	String PhoneNo              = "";                                   // 휴대폰번호
//Header end -------------------------------------------------------------------
	
//Data Default------------------------------------------------------------------
	String ApprovalType         = request.getParameter("authty") ;      // 승인구분 코드
	String TrNo                 = request.getParameter("trno") ;        // 거래번호
	
// Server로 부터 응답이 없을시 자체응답
	String rApprovalType        = "2011"                     ; // 승인구분
	String rACTransactionNo     = TrNo                       ; // 거래번호
	String rACStatus            = "X"                        ; // 오류구분 :승인 X:거절
	String rACTradeDate         = RequestDate.substring(0,8) ; // 거래 개시 일자(YYYYMMDD)
	String rACTradeTime         = RequestDate.substring(8,14); // 거래 개시 시간(HHMMSS)
	String rACAcctSele          = ""                         ; // 계좌이체 구분 -	1:Dacom, 2:Pop Banking,	3:실시간계좌이체 4: 승인형계좌이체
	String rACFeeSele           = ""                         ; // 선/후불제구분 -	1:선불,	2:후불
	String rACInjaName          = ""                         ; // 인자명(통장인쇄메세지-상점명)
	String rACPareBankCode      = ""                         ; // 입금모계좌코드
	String rACPareAcctNo        = ""                         ; // 입금모계좌번호
	String rACCustBankCode      = ""                         ; // 출금모계좌코드
	String rACCustAcctNo        = ""                         ; // 출금모계좌번호
	String rACAmount            = ""                         ; // 금액	(결제대상금액)
	String rACBankTransactionNo = ""                         ; // 은행거래번호
	String rACIpgumNm           = ""                         ; // 입금자명
	String rACBankFee           = "0"                        ; // 계좌이체 수수료
	String rACBankAmount        = ""                         ; // 총결제금액(결제대상금액+ 수수료
	String rACBankRespCode      = "9999"                     ; // 오류코드
	String rACMessage1          = "취소거절"                 ; // 오류 message 1
	String rACMessage2          = "C잠시후재시도"            ; // 오류 message 2
	String rACFiller            = ""                         ; // 예비
	
	try
	{
		KSPayApprovalCancelBean ipg = new KSPayApprovalCancelBean("localhost", 29991); 
		
		ipg.HeadMessage(EncType, Version, Type, Resend, RequestDate, StoreId, OrderNumber, UserName, IdNum, Email, 
			GoodType, GoodName, KeyInType, LineType, PhoneNo, ApprovalCount, HeadFiller);
		
		ipg.CancelDataMessage(ApprovalType, "0", TrNo, "", "", "","","");
		
		if(ipg.SendSocket("1")) {
			rApprovalType        = ipg.ApprovalType[0];
			rACTransactionNo     = ipg.ACTransactionNo[0];       // 거래번호
			rACStatus            = ipg.ACStatus[0];              // 오류구분 :승인 X:거절
			rACTradeDate         = ipg.ACTradeDate[0];           // 거래 개시 일자(YYYYMMDD)
			rACTradeTime         = ipg.ACTradeTime[0];           // 거래 개시 시간(HHMMSS)
			rACAcctSele          = ipg.ACAcctSele[0];            // 계좌이체 구분 -	5:금결원계좌이체    
			rACFeeSele           = ipg.ACFeeSele[0];             // 선/후불제구분 -	1:선불,	2:후불
			rACInjaName          = ipg.ACInjaName[0];            // 인자명(통장인쇄메세지-상점명)
			rACPareBankCode      = ipg.ACPareBankCode[0];        // 입금모계좌코드
			rACPareAcctNo        = ipg.ACPareAcctNo[0];          // 입금모계좌번호
			rACCustBankCode      = ipg.ACCustBankCode[0];        // 출금모계좌코드
			rACCustAcctNo        = ipg.ACCustAcctNo[0];          // 출금모계좌번호
			rACAmount            = ipg.ACAmount[0];              // 금액	(결제대상금액)
			rACBankTransactionNo = ipg.ACBankTransactionNo[0];   // 은행거래번호
			rACIpgumNm           = ipg.ACIpgumNm[0];             // 입금자명
			rACBankFee           = ipg.ACBankFee[0];             // 계좌이체 수수료
			rACBankAmount        = ipg.ACBankAmount[0];          // 총결제금액(결제대상금액+ 수수료
			rACBankRespCode      = ipg.ACBankRespCode[0];        // 오류코드
			rACMessage1          = ipg.ACMessage1[0];            // 오류 message 1
			rACMessage2          = ipg.ACMessage2[0];            // 오류 message 2
			rACFiller            = ipg.ACFiller[0];              // 예비
		}
	}
	catch(Exception e) {
		rACMessage2 = "P잠시후재시도("+e.toString()+")";         // 메시지2
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
								KSPay 취소 결과
								</font></td>
							</tr>
							<tr bgcolor=#FFFFFF>
								<td valign=top>
									<table width=100% cellspacing=0 cellpadding=2 border=0>
										<tr>
											<td align=left>
												<table>
													<tr><td>거래번호      </td><td><%=rACTransactionNo%></td></tr>
													<tr><td>오류구분(O/X) </td><td><%=rACStatus%></td></tr>
													<tr><td>거래 일자     </td><td><%=rACTradeDate%></td></tr>
													<tr><td>거래 시간     </td><td><%=rACTradeTime%></td></tr>
													<tr><td>응답 메세지1  </td><td><%=rACMessage1%></td></tr>
													<tr><td>응답 메세지2  </td><td><%=rACMessage2%></td></tr>
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