<!------------------------------------------------------------------------------
 파일명 : KSPayMobileCancelPost.jsp
 기능   : 휴대폰결제취소 처리 페이지
------------------------------------------------------------------------------->
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.ppm.kspay.KSPayApprovalCancelBean" %>
<%@ page contentType="text/html;charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
// Default(수정항목이 아님)-------------------------------------------------------
	String EncType       = "2";                                 // 0: 암화안함, 1:openssl, 2: seed
	String Version       = "0210";                              // 전문버전
	String Type          = "00";                                // 구분
	String Resend        = "0";                                 // 전송구분 : 0 : 처음,  2: 재전송
	String RequestDate   = new SimpleDateFormat("yyyyMMddhhmmss").format(new java.util.Date()); // 요청일자 : yyyymmddhhmmss
	String KeyInType     = "K";                                 // KeyInType 여부 : S : Swap, K: KeyInType
	String LineType      = "1";                                 // lineType 0 : offline, 1:internet, 2:Mobile
	String ApprovalCount = "1";                                 // 복합승인갯수
	String GoodType      = "0";                                 // 제품구분 0 : 실물, 1 : 디지털
	String HeadFiller    = "";                                  // 예비
//-------------------------------------------------------------------------------

// Header (입력값 (*) 필수항목)--------------------------------------------------
	String StoreId       = request.getParameter("storeid");     // *상점아이디
	String OrderNumber   = "";                                  // 주문번호
	String UserName      = "";                                  // 주문자명
	String IdNum         = "";                                  // 주민번호 or 사업자번호
	String Email         = "";                                  // email
	String GoodName      = "";                                  // 제품명
	String PhoneNo       = "";                                  // 휴대폰번호
// Header end -------------------------------------------------------------------

// Data Default(수정항목이 아님)-------------------------------------------------
	String ApprovalType  = request.getParameter("authty");      // 승인구분
	String TrNo          = request.getParameter("trno");        // 거래번호
// Data Default end -------------------------------------------------------------

// 승인거절 응답
// Server로 부터 응답이 없을시 자체응답
	String rApprovalType  = "M111";
	String rTransactionNo = "";                                 //거래번호
	String rStatus        = "X";                                //상태 O : 승인, X : 거절
	String rTradeDate     = "";                                 //거래일자
	String rTradeTime     = "";                                 //거래시간
	String rBalAmount     = "";                                 //잔액
	String rRespCode      = "PM09";                             //응답코드
	String rRespMsg       = "C잠시후 재시도";                   //응답메시지
	String rBypassMsg     = "";                                 //Echo항목
	String rCompCode      = "";                                 //서비스업체구분
	String rFiller        = "";
	
	try 
	{
		KSPayApprovalCancelBean ipg = new KSPayApprovalCancelBean("localhost", 29991); 
		
		ipg.HeadMessage(EncType, Version, Type, Resend, RequestDate, StoreId, OrderNumber, UserName, IdNum, Email, 
						GoodType, GoodName, KeyInType, LineType, PhoneNo, ApprovalCount, HeadFiller);
		
		ipg.CancelDataMessage(ApprovalType, "0", TrNo, "", "", "","","");
		
		if(ipg.SendSocket("1")) {
			rApprovalType    = ipg.ApprovalType[0];       // 승인구분 코드          
			rTransactionNo   = ipg.MTransactionNo[0];     // 거래번호 
			rStatus          = ipg.MStatus[0];            // 거래성공여부 
			rTradeDate       = ipg.MTradeDate[0];         // 거래일자
			rTradeTime       = ipg.MTradeTime[0];         // 거래시간
			rBalAmount       = ipg.MBalAmount[0];         // 잔액
			rRespCode        = ipg.MRespCode[0];          // 응답코드
			rRespMsg         = ipg.MRespMsg[0];           // 응답메시지
			rBypassMsg       = ipg.MBypassMsg[0];         // Echo 필드
			rCompCode        = ipg.MCompCode[0];          // 기관코드
			rFiller          = ipg.MFiller[0];            // 예비
		}
		
		if (rStatus.substring(0,1).equals("X")) // 취소거절의 경우 한번 더 전송한다.
		{
			if(ipg.SendSocket("1")) {
				rApprovalType    = ipg.ApprovalType[0];   // 승인구분 코드          
		 		rTransactionNo   = ipg.MTransactionNo[0]; // 거래번호 
		 		rStatus          = ipg.MStatus[0];        // 거래성공여부 
				rTradeDate       = ipg.MTradeDate[0];     // 거래일자
				rTradeTime       = ipg.MTradeTime[0];     // 거래시간
				rBalAmount       = ipg.MBalAmount[0];     // 잔액
				rRespCode        = ipg.MRespCode[0];      // 응답코드
				rRespMsg         = ipg.MRespMsg[0];       // 응답메시지
				rBypassMsg       = ipg.MBypassMsg[0];     // Echo 필드
				rCompCode        = ipg.MCompCode[0];      // 기관코드
		 		rFiller          = ipg.MFiller[0];        // 예비
			}
		}
	}
	catch(Exception e) {
			rStatus             = "X";
			rRespCode           = "9999";          // 응답코드
			rRespMsg            = "C취소거절";     // 응답메시지
	} // end of catch
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html charset=euc-kr">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Pragma" content="no-cache">
	<style type="text/css">
	TABLE{font-size:9pt; line-height:160%;}
	A {color:blueline-height:160% background-color:#E0EFFE}
	INPUT{font-size:9pt}
	SELECT{font-size:9pt}
	.emp{background-color:#FDEAFE}
	.white{background-color:#FFFFFF color:black border:1x solid white font-size: 9pt}
	</style>
</head>
<body onload="" topmargin=0 leftmargin=0 marginwidth=0 marginheight=0 >
<table border=0 width=0>
<tr>
<td align=center>
<table cellspacing=0 cellpadding=0 border=0 bgcolor=#4F9AFF>
<tr>
<td>
<table width=100% cellspacing=1 cellpadding=2 border=0>
<tr bgcolor=#4F9AFF height=25>
<td align=left>
<font color="#FFFFFF">
KSPay 핸드폰결제 취소결과&nbsp;
</font></td>

</tr>
<tr bgcolor=#FFFFFF>
<td valign=top>
<table width=100% cellspacing=0 cellpadding=2 border=0>
<tr>
<td align=left>
<table>
<tr>
	<td>거래종류 :</td>
	<td><%=rApprovalType%></td>
</tr>
<tr>
	<td>거래번호 :</td>
	<td><%=rTransactionNo%></td>
</tr>
<tr>
	<td>거래성공여부 :</td>
	<td><%=rStatus %></td>
</tr>
<tr>
	<td>거래시간 :</td>
	<td><%=rTradeDate%>&nbsp;<%=rTradeTime%></td>
</tr>
<tr>
	<td>응답코드 :</td>
	<td><%=rRespCode%></td>
</tr>
<tr>
	<td>응답메시지 :</td>
	<td><%=rRespMsg%></td>
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
</body>
</html>