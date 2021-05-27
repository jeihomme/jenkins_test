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
// Default(�����׸��� �ƴ�)-------------------------------------------------------
	String EncType       = "2";                               // 0: ��ȭ����, 1:openssl, 2: seed
	String Version       = "0603";                            // ��������
	String Type          = "00";                              // ����
	String Resend        = "0";                               // ���۱��� : 0 : ó��,  2: ������
	String RequestDate   = new SimpleDateFormat("yyyyMMddhhmmss").format(new java.util.Date()); // ��û���� : yyyymmddhhmmss
	String KeyInType     = "K";                               // KeyInType ���� : S : Swap, K: KeyInType
	String LineType      = "1";                               // lineType 0 : offline, 1:internet, 2:Mobile
	String ApprovalCount = "1";                               // ���ս��ΰ���
	String GoodType      = "0";                               // ��ǰ���� 0 : �ǹ�, 1 : ������
	String HeadFiller    = "";                                // ����
//-------------------------------------------------------------------------------
	
// Header (�Է°� (*) �ʼ��׸�)--------------------------------------------------
	String StoreId       = request.getParameter("storeid");   // *�������̵�
	String OrderNumber   = "";                                // �ֹ���ȣ
	String UserName      = "";                                // *�ֹ��ڸ�
	String IdNum         = "";                                // �ֹι�ȣ or ����ڹ�ȣ
	String Email         = "";                                // *email
	String GoodName      = "";                                // *��ǰ��
	String PhoneNo       = "";                                // *�޴�����ȣ                                                                              
// Header end -------------------------------------------------------------------
	
// Data Default(�����׸��� �ƴ�)-------------------------------------------------
	String ApprovalType  = request.getParameter("authty");    // ���α���
	String TrNo          = request.getParameter("trno");      // �ŷ���ȣ
// Data Default end -------------------------------------------------------------
	
// ���ΰ��� ����
// Server�� ���� ������ ������ ��ü����
	String rVATransactionNo = "";                // �ŷ���ȣ
	String rVAStatus        = "X";               // ���� O : ����, X : ����
	String rVATradeDate     = "";                // �ŷ�����
	String rVATradeTime     = "";                // �ŷ��ð�
	String rVABankCode      = "";                // �����ڵ�
	String rVAVirAcctNo     = "";                // ������¹�ȣ
	String rVAName          = "";                // �����ָ�
	String rVACloseDate     = "";                // ������
	String rVACloseTime     = "";                // �����ð�
	String rVARespCode      = "";                // �����ڵ�
	String rVAMessage1      = "�߱���Ұ���";    // �޽���1
	String rVAMessage2      = "C�������õ�";   // �޽���2
	String rVAFiller        = "";                // ����
	
	try
	{
		KSPayApprovalCancelBean ipg = new KSPayApprovalCancelBean("localhost", 29991);
		//KSPayApprovalCancelBean ipg = new KSPayApprovalCancelBean("210.181.28.116", 21001); 
		
		ipg.HeadMessage(EncType, Version, Type, Resend, RequestDate, StoreId, OrderNumber, UserName, IdNum, Email, 
						GoodType, GoodName, KeyInType, LineType, PhoneNo, ApprovalCount, HeadFiller);
		
		ipg.CancelDataMessage(ApprovalType, "0", TrNo, "", "", "","","");
		
		if (ipg.SendSocket("6")) 
		{
			rVATransactionNo = ipg.VATransactionNo[0] ;   // �ŷ���ȣ
			rVAStatus        = ipg.VAStatus[0] ;          // ���� O : ����, X : ����
			rVATradeDate     = ipg.VATradeDate[0] ;       // �ŷ�����
			rVATradeTime     = ipg.VATradeTime[0] ;       // �ŷ��ð�
			rVABankCode      = ipg.VABankCode[0] ;        // �߱޻��ڵ�
			rVAVirAcctNo     = ipg.VAVirAcctNo[0] ;       // ���Ի��ڵ�
			rVAName          = ipg.VAName[0] ;            // ���ι�ȣ or ������ �����ڵ�
			rVACloseDate     = ipg.VACloseDate[0];        // ������
			rVACloseTime     = ipg.VACloseTime[0];        // �����ð�
			rVARespCode      = ipg.VARespCode[0];         // �����ڵ�
			rVAMessage1      = ipg.VAMessage1[0] ;        // �޽���1
			rVAMessage2      = ipg.VAMessage2[0] ;        // �޽���2
			rVAFiller        = ipg.VAFiller[0] ;          // ����
		}
	}
	catch(Exception e) 
	{
		rVAMessage2 = "P�������õ�("+e.toString()+")";  // �޽���2
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
KSPay ������¹߱���� ���&nbsp;
</font></td>
</tr>
<tr bgcolor=#FFFFFF>
<td valign=top>
<table width=100% cellspacing=0 cellpadding=2 border=0>
<tr>
<td align=left>
<table>
<tr>
	<td>�ŷ�����1 :</td>
	<td><%=ApprovalType%></td>
</tr>
<tr>
	<td>�ŷ���ȣ :</td>
	<td><%=rVATransactionNo%></td>
</tr>
<tr>
	<td>�ŷ��������� :</td>
	<td><%=rVAStatus%></td>
</tr>
<tr>
	<td>�ŷ��ð� :</td>
	<td><%=rVATradeDate%>&nbsp;<%=rVATradeTime%></td>
</tr>
<tr>
	<td>�߱������ڵ� :</td>
	<td><%=rVABankCode%></td>
</tr>
<tr>
	<td>������¹�ȣ :</td>
	<td><%=rVAVirAcctNo%></td>
</tr>
<tr>
	<td>������ :</td>
	<td><%=rVAName%></td>
</tr>
<tr>
	<td>�����ڵ� :</td>
	<td><%=rVARespCode%></td>
</tr>
<tr>
	<td>�޽���1 :</td>
	<td><%=rVAMessage1%></td>
</tr>
<tr>
	<td>�޽���2 :</td>
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