<%@ page contentType="text/html;charset=euc-kr" import="java.io.*,java.util.*,java.net.*"%>
<%@ include file="./eutil.jsp"%>
<%
	// ����̵� �߱޵Ǹ� �����Ǵ� ���� , �⺻�� �׽�Ʈ ���̵��.
	String mhkey        = "FF7BC0A83DC4E6B6114522CBD70A958C" ;    
	String mekey        = "549E98CA59A3691088CA0A52DC4BA66E";       
	String msalt        = "MA01";                                         
	String mpaymsalt    = "Qy5H10I3k4";   
	// ----------------------------------------------------------------------
	
	// ����� ��ū. ���� 1ȸ ������ �������� �����ִ� ���� ( �� �����ÿ��� ���� )
	String servicetoken = "" ;        
	
	String curr_date_14 = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());
  String etoken = get_etoken(mhkey, curr_date_14, "");

	// ������ ��ȣȭ ������ 
	StringBuffer sb = new StringBuffer();
	sb.append(curr_date_14   ).append(':');
	sb.append("servicetoken").append('=').append(servicetoken ) ;

	String p_data = sb.toString();
	String edata = encrypt_msg(mekey ,p_data);
%>
<!DOCTYPE html>
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=euc-kr" /> -->
<!-- <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" /> -->
<!-- <title>MYPAY ��������</title> -->
<style type="text/css">
	BODY{font-size:6pt; line-height:160%}
	TD{font-size:6pt; line-height:160%}
	INPUT{font-size:6pt;}
</style>
<!-- </head> -->
<script language="javascript">
	function my_pay(_frm) 
	{
		var width_	= 550;
		var height_	= 850;
		var left_	= screen.width;
		var top_	= screen.height;
    	
		left_ = left_/2 - (width_/2);
		top_ = top_/2 - (height_/2);
		
		_frm.sndReply.value=getLocalUrl("mypay_result");
		_frm.sndCancelUrl.value=getLocalUrl("mypay_cancel");
		_frm.action ='http://210.181.28.134/store/MYPay/MYPayWebTot.jsp'; 
		if(is_mobile()){
			_frm.target = "_self";
		}else{
			_frm.sndReply.value=getLocalUrl("mypay_rcv");
			_frm.sndCancelUrl.value=getLocalUrl("mypay_cancel");
			op = window.open("",'AuthFrmUp', 'height='+height_+',width='+width_+',status=yes,scrollbars=no,resizable=no,left='+left_+',top='+top_+'');
			_frm.target = "AuthFrmUp";
		}
		_frm.submit();
	}
	function getLocalUrl(mypage) 
	{ 
		var myloc = location.href; 
		return myloc.substring(0, myloc.lastIndexOf('/')) + '/' + mypage;
	}
	function goResult() 
	{ 
		document.payfrm.action = "./mypay_result";
		document.payfrm.target = "_self";
		document.payfrm.submit();
	} 
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
<!-- <body> -->
<form name="payfrm" method="post" target="_self">
<input type="hidden" name="sndMsalt"       value="<%=msalt%>">
<input type="hidden" name="sndMpayMsalt"   value="<%=mpaymsalt%>">
<input type="hidden" name="sndEdata"       value="<%=edata%>">
<input type="hidden" name="sndEtoken"      value="<%=etoken%>">

<table border=0 width=100%>
	<tr>
	<td>
	<hr noshade size=1>
	<b>MYPAY ����</b>
	<hr noshade size=1>
	</td>
	</tr>
</table>
<br>
<table border=0 width=100%>
<tr>
<td align=center>
<table width=100% cellspacing=0 cellpadding=0 border=0 bgcolor=#4F9AFF>
<tr>
<td>
<table width=100% cellspacing=1 cellpadding=2 border=0>
<tr bgcolor=#4F9AFF height=25>
<td align=center><font color="#FFFFFF">
������ �����Ͻ� �� ������ư�� �����ֽʽÿ�
</font></td>
</tr>
<tr bgcolor=#FFFFFF>
<td valign=top>
<table width=100% cellspacing=0 cellpadding=2 border=0>
<tr>
<td align=center>
<br>
<table>
<tr>
	<td>�������̵� : </td>
	<td><input type="text" name="sndStoreid" size=10 maxlength=10 value="2001106623"></td>
</tr>
<tr>
	<td>��ǥ��������ȣ : </td>
	<td><input type="text" name="sndStoreno" size=10 maxlength=10 value="KSNET00023"></td>
</tr>
<tr>
	<td>�ֹ���ȣ : </td>
	<td><input type="text" name="sndOrdernumber" size=30 maxlength=30 value="carrot_1234"></td>
</tr>
<tr>
	<td>ȸ�����̵� : </td>
	<td><input type="text" name="sndUserId" size=30 maxlength=30 value=""></td>
</tr>
<tr>
	<td colspan=2>������ �����ִ� �׸�</td>
</tr>
<tr>
	<td>��ǰ�� : </td>
	<td><input type="text" name="sndGoodname" size=30 maxlength=30 value="���10kg"></td>
</tr>
<tr>
	<td>���� : </td>
	<td><input type="text" name="sndAmount" size=30 maxlength=9 value="5000"></td>
</tr>
<tr>
	<td>�Һΰ��� : </td>
	<td><input type='text' name=sndInstallmentType value="0:2:3:4:5:6:7:8:9:10:11:12" size='35' ></td>
</tr>
<tr>
	<td>�������Һΰ��� : </td>
	<td><input type="text" name="sndInterestType" size=30 value="NONE"></td>
</tr>
<tr>
	<td>�����λ����ڵ� : </td>
	<td>
		<select name=sndThemecolor >
				<option value="" >DEFAULT</option>
				<option value="FF0000" >red(FF0000)</option>
				<option value="FFFF00" >yellow(FFFF00)</option>
				<option value="0000FF" >blue(0000FF)</option>
			</select>
		</td> 
</tr>
<tr>
	<td>�ֹ��ڼ��� : </td>
	<td><input type="text" name="sndOrdername" size=30 maxlength=20 value=""></td>
</tr>
<tr>
	<td>���ݿ������߱޿��� </td>
	<td>
	<input type="text" name="sndCashReceipt"  size=30 maxlength=12 value="0">
	</td>
</tr>
<tr>
	<td>���ڿ��� : </td>
	<td>
	<input type=text name=sndEmail size=30 maxlength=50 value="">
	</td>
</tr>

<tr>
	<td colspan=2 align=center>
	<br>
	<input type="button" value="�� ��" onClick="javascript:my_pay(document.payfrm);">
	<br><br>
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
</td>
</tr>
</table>
	<input type=hidden name="sndReply"      value=""> <!-- ���� ������ -->
	<input type=hidden name="sndCancelUrl"  value=""> <!-- ��� ���������� -->
	<input type=hidden name="sndRetParam"   value=""> <!-- sndReply , sndCancelUrl �� ���޵Ǿ���ϴ� �Ķ���� Ư������ ' " - ` �� ����ϽǼ� �����ϴ�. (����ǥ,�ֵ���ǥ,����,�������̼�)  -->
	<input type=hidden name="sndCharSet"    value="EUC-KR"> <!-- defalut : EUC-KR -->
	
	<!-- pc���� rcv ���������� ���õǴ� �� -->
	<input type=hidden name="reCommConId"   value="">
	<input type=hidden name="reRetParam"    value="">
<!-- </form> -->
<!-- </body> -->
<!-- </html> -->
