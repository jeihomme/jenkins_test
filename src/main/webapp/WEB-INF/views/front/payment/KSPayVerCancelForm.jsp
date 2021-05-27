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
<form name=KSPayAuthForm method=post action="./KSPayVerCancelPost.jsp">
<!--�⺻-------------------------------------------------->
<table border=0 width=0>
<tr>
<td align=center>
<table width=380 cellspacing=0 cellpadding=0 border=0 bgcolor=#4F9AFF>
<tr>
<td>
<table width=100% cellspacing=1 cellpadding=2 border=0>
<tr bgcolor=#4F9AFF height=25>
<td align=left><font color="#FFFFFF">
KSPay 가상계좌발급취소
</font></td>
</tr>
<tr bgcolor=#FFFFFF>
<td valign=top>
<table width=100% cellspacing=0 cellpadding=2 border=0>
<tr>
<td align=left>
<table>
<tr>
	<td>상점ID(storeid) :</td>
	<td><input type="text" name="storeid" value="2999199999" maxlength="10"></td>
</tr>
<tr>
	<td>패스워드(storepasswd) :</td>
	<td><input type="text" name="storepasswd" value="" maxlength="10"></td>
</tr>
<tr>
	<td>승인구분 :</td>
	<td><input type=hidden name="authty" value="6010">6010.가상계좌발급취소</td>
</tr>
<tr>
	<td>거래번호 :</td>
	<td>
		<input type=text name=trno size=15 maxlength=12 value="">
	</td>
</tr>

<tr>
<td colspan=2 align=center>
		<input type=submit  value=" 취 소 ">
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