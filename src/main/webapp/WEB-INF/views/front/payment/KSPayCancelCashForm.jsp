<!------------------------------------------------------------------------------
 FILE NAME : KSPayCreditForm.jsp
 AUTHOR : kspay@ksnet.co.kr
 DATE : 2003/11/29
                                                         http:'www.kspay.co.kr
                                                         http:'www.ksnet.co.kr
                                  Copyright 2003 KSNET, Co. All rights reserved
------------------------------------------------------------------------------->
<%@ page contentType="text/html;charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
	String storeid         = request.getParameter("storeid");       //' *�������̵�
	String storepasswd     = request.getParameter("storepasswd");   //' ��������(���)�� �н����� (���Ļ��)  
	String ordername       = request.getParameter("ordername");     //' *�ֹ��ڸ�
	String ordernumber     = request.getParameter("ordernumber");   //' *�ֹ���ȣ
	String currencytype    = request.getParameter("currencytype");
	String amount          = "";

// Sample
	if (storeid == null || storeid.equals("")){
		storeid      = "2999199999";     // �������̵�
		storepasswd  = "";               // ��������(���)�� �н����� (���Ļ��)
	}else{
		if( storeid == null || storeid.equals("")){
			storeid = "2999199999";
		}
		if(storepasswd == null || storepasswd.equals("")){
			storepasswd = " ";
		}
	}
%>
<html>
<head>
<title>KSPay</title>
<meta http-equiv="Content-Type" content="text/html charset=euc-kr">
<style type="text/css">
	BODY{font-size:9pt line-height:160%}
	TD{font-size:9pt line-height:160%}
	A {color:blueline-height:160% background-color:#E0EFFE}
	INPUT{font-size:9pt}
	SELECT{font-size:9pt}
	.emp{background-color:#FDEAFE}
	.white{background-color:#FFFFFF color:black border:1x solid white font-size: 9pt}
</style>
</head>

<body onload="" topmargin=0 leftmargin=0 marginwidth=0 marginheight=0 onFocus="" >
<form name=KSPayAuthForm method=post action="./KSPayCancelCashPost">
<!--�⺻-------------------------------------------------->
<input type=hidden name="storeid"    	value="<%=storeid%>">
<input type=hidden name="storepasswd" 	value="<%=storepasswd%>">
<table border=0 width=0>
<tr>
<td align=center>
<table width=400 cellspacing=0 cellpadding=0 border=0 bgcolor=#4F9AFF>
<tr>
<td>
<table width=100% cellspacing=1 cellpadding=2 border=0>
<tr bgcolor=#4F9AFF height=25>
<td align=left><font color="#FFFFFF">
KSPay �ſ�ī�� ���
</font></td>
</tr>
<tr bgcolor=#FFFFFF>
<td valign=top>
<table width=100% cellspacing=0 cellpadding=2 border=0>
<tr>
<td align=left>
<table>
<tr>
	<td>���α��� :</td>
	<td>
		<input type=hidden name="authty" value="H010">H010.���ݿ��������
	</td>
</tr>
<tr>
	<td>�ŷ���ȣ :</td>
	<td>
		<input type=text name=trno size=15 maxlength=12 value="">
	</td>
</tr>
<!-- <���ݿ����� ��Һ���>  -->
<tr>
	<td>��һ��� :</td>
	<td>
		<input type=radio name=cash_canc_type size=15 maxlength=1 value="1">�ŷ����
		<input type=radio name=cash_canc_type size=15 maxlength=1 value="2">�����߱����
		<input type=radio name=cash_canc_type size=15 maxlength=1 value="3">��Ÿ
	</td>
</tr>
<tr>
<td colspan=2 align=center>
		<input type=submit  value=" �� �� ">
</tr>
</td>
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
</body>
</html>