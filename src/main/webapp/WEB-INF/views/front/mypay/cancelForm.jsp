<%@ page contentType="text/html; charset=euc-kr" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<title>MYPAY 취소샘플</title>
<style type="text/css">
	BODY{font-size:6pt; line-height:160%}
	TD{font-size:6pt; line-height:160%}
	INPUT{font-size:6pt;}
</style>
</head>
<script language="javascript">

	function _cancel(_frm) 
	{
		_frm.action ='./cancelPost';
		_frm.submit();
  }
</script>
<body>
<!--결제 완료후 결과값을 받아처리할 결과페이지의 주소-->
	<form name=KSPayWeb method=post target="_self">
<table border=0 width=100%>
	<tr>
	<td>
	<hr noshade size=1>
	<b>MYPay 취소샘플</b>
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
정보를 기입하신 후 취소버튼을 눌러주십시오
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
	<td>토큰 : </td>
	<td><input type=text name=sndCtoken  size=30 maxlength=30 value="SLu8EA9A-03S0Ce0Q3fj7k2jG76pVg"></td>
</tr>
<tr>
	<td>상점아이디 : </td> 
	<td><input type=text name=sndStoreid size=12 maxlength=10 value="KSNET00027"></td>
</tr>
<tr>
	<td>거래번호 : </td>
	<td><input type=text name=sndTrno size=12 maxlength=12 value=""></td>
</tr>
<tr>
	<td>주문번호 : </td>
	<td><input type=text name=sndOrdno size=50 maxlength=50 value=""></td>
</tr>
<tr>
	<td colspan=2 align=center>
	<br>
	<input type="button" value=" 취 소 " onClick="javascript:_cancel(document.KSPayWeb);">
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
<br>


</form>
</body>
</html>
