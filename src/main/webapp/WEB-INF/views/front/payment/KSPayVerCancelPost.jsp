<!------------------------------------------------------------------------------
 FILE NAME : KSPayCancelPost.jsp
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
	String EncType       = "2";                               // 0: 암화안함, 1:openssl, 2: seed
	String Version       = "0603";                            // 전문버전
	String Type          = "00";                              // 구분
	String Resend        = "0";                               // 전송구분 : 0 : 처음,  2: 재전송
	String RequestDate   = new SimpleDateFormat("yyyyMMddhhmmss").format(new java.util.Date()); // 요청일자 : yyyymmddhhmmss
	String KeyInType     = "K";                               // KeyInType 여부 : S : Swap, K: KeyInType
	String LineType      = "1";                               // lineType 0 : offline, 1:internet, 2:Mobile
	String ApprovalCount = "1";                               // 복합승인갯수
	String GoodType      = "0";                               // 제품구분 0 : 실물, 1 : 디지털
	String HeadFiller    = "";                                // 예비
//-------------------------------------------------------------------------------
	
// Header (입력값 (*) 필수항목)--------------------------------------------------
	String StoreId       = request.getParameter("storeid");   // *상점아이디
	String OrderNumber   = "";                                // 주문번호
	String UserName      = "";                                // *주문자명
	String IdNum         = "";                                // 주민번호 or 사업자번호
	String Email         = "";                                // *email
	String GoodName      = "";                                // *제품명
	String PhoneNo       = "";                                // *휴대폰번호                                                                              
// Header end -------------------------------------------------------------------
	
// Data Default(수정항목이 아님)-------------------------------------------------
	String ApprovalType  = request.getParameter("authty");    // 승인구분
	String TrNo          = request.getParameter("trno");      // 거래번호
// Data Default end -------------------------------------------------------------
	
// 승인거절 응답
// Server로 부터 응답이 없을시 자체응답
	String rVATransactionNo = "";                // 거래번호
	String rVAStatus        = "X";               // 상태 O : 승인, X : 거절
	String rVATradeDate     = "";                // 거래일자
	String rVATradeTime     = "";                // 거래시간
	String rVABankCode      = "";                // 은행코드
	String rVAVirAcctNo     = "";                // 가상계좌번호
	String rVAName          = "";                // 예금주명
	String rVACloseDate     = "";                // 마감일
	String rVACloseTime     = "";                // 마감시간
	String rVARespCode      = "";                // 응답코드
	String rVAMessage1      = "발급취소거절";    // 메시지1
	String rVAMessage2      = "C잠시후재시도";   // 메시지2
	String rVAFiller        = "";                // 예비
	
	try
	{
		KSPayApprovalCancelBean ipg = new KSPayApprovalCancelBean("localhost", 29991);
		//KSPayApprovalCancelBean ipg = new KSPayApprovalCancelBean("210.181.28.116", 21001); 
		
		ipg.HeadMessage(EncType, Version, Type, Resend, RequestDate, StoreId, OrderNumber, UserName, IdNum, Email, 
						GoodType, GoodName, KeyInType, LineType, PhoneNo, ApprovalCount, HeadFiller);
		
		ipg.CancelDataMessage(ApprovalType, "0", TrNo, "", "", "","","");
		
		if (ipg.SendSocket("6")) 
		{
			rVATransactionNo = ipg.VATransactionNo[0] ;   // 거래번호
			rVAStatus        = ipg.VAStatus[0] ;          // 상태 O : 승인, X : 거절
			rVATradeDate     = ipg.VATradeDate[0] ;       // 거래일자
			rVATradeTime     = ipg.VATradeTime[0] ;       // 거래시간
			rVABankCode      = ipg.VABankCode[0] ;        // 발급사코드
			rVAVirAcctNo     = ipg.VAVirAcctNo[0] ;       // 매입사코드
			rVAName          = ipg.VAName[0] ;            // 승인번호 or 거절시 오류코드
			rVACloseDate     = ipg.VACloseDate[0];        // 마감일
			rVACloseTime     = ipg.VACloseTime[0];        // 마감시간
			rVARespCode      = ipg.VARespCode[0];         // 응답코드
			rVAMessage1      = ipg.VAMessage1[0] ;        // 메시지1
			rVAMessage2      = ipg.VAMessage2[0] ;        // 메시지2
			rVAFiller        = ipg.VAFiller[0] ;          // 예비
		}
	}
	catch(Exception e) 
	{
		rVAMessage2 = "P잠시후재시도("+e.toString()+")";  // 메시지2
	}
%>

<html>
<head>
<title>KSPay</title>
<meta http-equiv="Content-Type" content="text/html charset=euc-kr">
<style type="text/css">
	TABLE{font-size:9pt; line-height:160%}
	TD{font-size:9pt; line-height:160%}
	A {color:blueline-height:160% background-color:#E0EFFE}
	INPUT{font-size:9pt;}
	SELECT{font-size:9pt;}
	.emp{background-color:#FDEAFE}
	.white{background-color:#FFFFFF color:black border:1x solid white font-size: 9pt}
</style>
</head>

<body onload="" topmargin=0 leftmargin=0 marginwidth=0 marginheight=0 >
<table border=0 width=0>
<tr>
<td align=center>
<table width=320 cellspacing=0 cellpadding=0 border=0 bgcolor=#4F9AFF>
<tr>
<td>
<table width=100% cellspacing=1 cellpadding=2 border=0>
<tr bgcolor=#4F9AFF height=25>
<td align=left><font color="#FFFFFF">
KSPay 가상계좌발급취소 결과&nbsp;
</font></td>
</tr>
<tr bgcolor=#FFFFFF>
<td valign=top>
<table width=100% cellspacing=0 cellpadding=2 border=0>
<tr>
<td align=left>
<table>
<tr>
	<td>거래종류1 :</td>
	<td><%=ApprovalType%></td>
</tr>
<tr>
	<td>거래번호 :</td>
	<td><%=rVATransactionNo%></td>
</tr>
<tr>
	<td>거래성공여부 :</td>
	<td><%=rVAStatus%></td>
</tr>
<tr>
	<td>거래시간 :</td>
	<td><%=rVATradeDate%>&nbsp;<%=rVATradeTime%></td>
</tr>
<tr>
	<td>발급은행코드 :</td>
	<td><%=rVABankCode%></td>
</tr>
<tr>
	<td>가상계좌번호 :</td>
	<td><%=rVAVirAcctNo%></td>
</tr>
<tr>
	<td>예금주 :</td>
	<td><%=rVAName%></td>
</tr>
<tr>
	<td>응답코드 :</td>
	<td><%=rVARespCode%></td>
</tr>
<tr>
	<td>메시지1 :</td>
	<td><%=rVAMessage1%></td>
</tr>
<tr>
	<td>메시지2 :</td>
	<td><%=rVAMessage2%></td>
</tr>

</table>
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
</td>
</tr>
</table>
</table>
</form>
</html>