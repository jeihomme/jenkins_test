<!------------------------------------------------------------------------------
 ���ϸ� : KSPayMobileCancelPost.jsp
 ���   : �޴���������� ó�� ������
------------------------------------------------------------------------------->
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.ppm.kspay.KSPayApprovalCancelBean" %>
<%@ page contentType="text/html;charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
// Default(�����׸��� �ƴ�)-------------------------------------------------------
	String EncType       = "2";                                 // 0: ��ȭ����, 1:openssl, 2: seed
	String Version       = "0210";                              // ��������
	String Type          = "00";                                // ����
	String Resend        = "0";                                 // ���۱��� : 0 : ó��,  2: ������
	String RequestDate   = new SimpleDateFormat("yyyyMMddhhmmss").format(new java.util.Date()); // ��û���� : yyyymmddhhmmss
	String KeyInType     = "K";                                 // KeyInType ���� : S : Swap, K: KeyInType
	String LineType      = "1";                                 // lineType 0 : offline, 1:internet, 2:Mobile
	String ApprovalCount = "1";                                 // ���ս��ΰ���
	String GoodType      = "0";                                 // ��ǰ���� 0 : �ǹ�, 1 : ������
	String HeadFiller    = "";                                  // ����
//-------------------------------------------------------------------------------

// Header (�Է°� (*) �ʼ��׸�)--------------------------------------------------
	String StoreId       = request.getParameter("storeid");     // *�������̵�
	String OrderNumber   = "";                                  // �ֹ���ȣ
	String UserName      = "";                                  // �ֹ��ڸ�
	String IdNum         = "";                                  // �ֹι�ȣ or ����ڹ�ȣ
	String Email         = "";                                  // email
	String GoodName      = "";                                  // ��ǰ��
	String PhoneNo       = "";                                  // �޴�����ȣ
// Header end -------------------------------------------------------------------

// Data Default(�����׸��� �ƴ�)-------------------------------------------------
	String ApprovalType  = request.getParameter("authty");      // ���α���
	String TrNo          = request.getParameter("trno");        // �ŷ���ȣ
// Data Default end -------------------------------------------------------------

// ���ΰ��� ����
// Server�� ���� ������ ������ ��ü����
	String rApprovalType  = "M111";
	String rTransactionNo = "";                                 //�ŷ���ȣ
	String rStatus        = "X";                                //���� O : ����, X : ����
	String rTradeDate     = "";                                 //�ŷ�����
	String rTradeTime     = "";                                 //�ŷ��ð�
	String rBalAmount     = "";                                 //�ܾ�
	String rRespCode      = "PM09";                             //�����ڵ�
	String rRespMsg       = "C����� ��õ�";                   //����޽���
	String rBypassMsg     = "";                                 //Echo�׸�
	String rCompCode      = "";                                 //���񽺾�ü����
	String rFiller        = "";
	
	try 
	{
		KSPayApprovalCancelBean ipg = new KSPayApprovalCancelBean("localhost", 29991); 
		
		ipg.HeadMessage(EncType, Version, Type, Resend, RequestDate, StoreId, OrderNumber, UserName, IdNum, Email, 
						GoodType, GoodName, KeyInType, LineType, PhoneNo, ApprovalCount, HeadFiller);
		
		ipg.CancelDataMessage(ApprovalType, "0", TrNo, "", "", "","","");
		
		if(ipg.SendSocket("1")) {
			rApprovalType    = ipg.ApprovalType[0];       // ���α��� �ڵ�          
			rTransactionNo   = ipg.MTransactionNo[0];     // �ŷ���ȣ 
			rStatus          = ipg.MStatus[0];            // �ŷ��������� 
			rTradeDate       = ipg.MTradeDate[0];         // �ŷ�����
			rTradeTime       = ipg.MTradeTime[0];         // �ŷ��ð�
			rBalAmount       = ipg.MBalAmount[0];         // �ܾ�
			rRespCode        = ipg.MRespCode[0];          // �����ڵ�
			rRespMsg         = ipg.MRespMsg[0];           // ����޽���
			rBypassMsg       = ipg.MBypassMsg[0];         // Echo �ʵ�
			rCompCode        = ipg.MCompCode[0];          // ����ڵ�
			rFiller          = ipg.MFiller[0];            // ����
		}
		
		if (rStatus.substring(0,1).equals("X")) // ��Ұ����� ��� �ѹ� �� �����Ѵ�.
		{
			if(ipg.SendSocket("1")) {
				rApprovalType    = ipg.ApprovalType[0];   // ���α��� �ڵ�          
		 		rTransactionNo   = ipg.MTransactionNo[0]; // �ŷ���ȣ 
		 		rStatus          = ipg.MStatus[0];        // �ŷ��������� 
				rTradeDate       = ipg.MTradeDate[0];     // �ŷ�����
				rTradeTime       = ipg.MTradeTime[0];     // �ŷ��ð�
				rBalAmount       = ipg.MBalAmount[0];     // �ܾ�
				rRespCode        = ipg.MRespCode[0];      // �����ڵ�
				rRespMsg         = ipg.MRespMsg[0];       // ����޽���
				rBypassMsg       = ipg.MBypassMsg[0];     // Echo �ʵ�
				rCompCode        = ipg.MCompCode[0];      // ����ڵ�
		 		rFiller          = ipg.MFiller[0];        // ����
			}
		}
	}
	catch(Exception e) {
			rStatus             = "X";
			rRespCode           = "9999";          // �����ڵ�
			rRespMsg            = "C��Ұ���";     // ����޽���
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
KSPay �ڵ������� ��Ұ��&nbsp;
</font></td>

</tr>
<tr bgcolor=#FFFFFF>
<td valign=top>
<table width=100% cellspacing=0 cellpadding=2 border=0>
<tr>
<td align=left>
<table>
<tr>
	<td>�ŷ����� :</td>
	<td><%=rApprovalType%></td>
</tr>
<tr>
	<td>�ŷ���ȣ :</td>
	<td><%=rTransactionNo%></td>
</tr>
<tr>
	<td>�ŷ��������� :</td>
	<td><%=rStatus %></td>
</tr>
<tr>
	<td>�ŷ��ð� :</td>
	<td><%=rTradeDate%>&nbsp;<%=rTradeTime%></td>
</tr>
<tr>
	<td>�����ڵ� :</td>
	<td><%=rRespCode%></td>
</tr>
<tr>
	<td>����޽��� :</td>
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