<%@ page contentType="text/html;charset=euc-kr" 
%><%@ include file="./eutil.jsp"
%>
<%
	String MYPAY_WEBHOST_SRCH_URL = "https://kspay.ksnet.to/store/PAY_PROXY/mypay/mypay_jcanc_tot.jsp"; // ���url �: kspay.ksnet.to , ���� : 210.181.28.134
	
	String DEFAULT_RPARAMS	= "authyn`trno`trddt`trdtm`amt`msg1`msg2`result`resultcd`storeid`username`email`goodname`mobile";
	
  String storeid = request.getParameter("sndStoreid") ;
  String trno    = request.getParameter("sndTrno") ;    // �ŷ���ȣ ���
  String cordno  = request.getParameter("sndOrdno") ;   // �ֹ���ȣ ���( �ŷ���ȣ ���Է½� �ʼ� )
  String ctoken  = request.getParameter("sndCtoken") ;
  
  String camt   = "";
  String ccnt   = "";
  String cbnkcd = "";
  String cacno  = "";
  
 
	String mhkey = "01F129202238E959E469496410570781" ; 
	String msalt = "MA01";
	String curr_date_14 = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());
  String etoken = get_etoken(mhkey, curr_date_14, "");

	String authyn   = "";
	String trddt    = "";
	String trdtm    = "";
	String amt      = "";
	String msg1     = "";
	String msg2     = "";
	String ordno    = "";
	String result   = "";
	String resultcd = "";

	StringBuffer sb = new StringBuffer();

	sb.append("sndStoreid" ).append('=').append(storeid).append('&');
	sb.append("sndTrno" ).append('=').append(trno).append('&');
	sb.append("sndOrdno" ).append('=').append(cordno).append('&');
	sb.append("sndCtoken" ).append('=').append(ctoken).append('&');
	sb.append("sndCancAmount" ).append('=').append(camt).append('&');
	sb.append("sndCancCnt" ).append('=').append(ccnt).append('&');
	sb.append("sndBnkcd" ).append('=').append(cbnkcd).append('&');
	sb.append("sndAcno" ).append('=').append(cacno).append('&');
	sb.append("sndMsalt" ).append('=').append(msalt).append('&');
	sb.append("sndEtoken" ).append('=').append(etoken).append('&');
	sb.append("sndRpyParams").append('=').append(URLEncoder.encode(DEFAULT_RPARAMS,"euc-kr")   ).append('&');
	sb.append("sndCharSet").append('=').append("euc-kr") ;
	
	String send_msg = sb.toString();
	String recv_msg  = call_web_api(MYPAY_WEBHOST_SRCH_URL ,send_msg , "euc-kr");
	System.out.println("recv_msg["+recv_msg+"]");
	
	LinkedHashMap param_hash = new LinkedHashMap();
	
	boolean ret = parseJson(recv_msg, param_hash); 
	
	authyn   = (String)param_hash.get("authyn" );
	trddt    = (String)param_hash.get("trddt" );
	trdtm    = (String)param_hash.get("trdtm" ); 
	amt      = (String)param_hash.get("amt" );
	msg1     = (String)param_hash.get("msg1" );
	msg2     = (String)param_hash.get("msg2" );
	result   = (String)param_hash.get("result" );
	resultcd = (String)param_hash.get("resultcd" ); 
%>
<html>
<head> 
	<title>�Է°�</title>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" >
	<style type="text/css">
	BODY{font-size:6pt; line-height:160%}
	TD{font-size:6pt; line-height:160%}
	INPUT{font-size:6pt;}
	</style>
</head>
<body bgcolor=#ffffff onload="">
<CENTER><B><font size=4 color="blue">��Ұ��</font></B></CENTER>
<br>
<TABLE  width=100% border="1" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td align="center" colspan=4>
			<br>
			���������� <font color = "red">��ҽ�</font>�� ��ü������ ���ϵǴ� ��� ������ ��Ÿ���� �����ϴ�. 
			<br>
			�Ʒ��� ���� ���� �׸���߿��� �ͻ翡�� �ʿ��Ͻ� �κи� �����ż� ����Ͻø� �˴ϴ�.
			<br>
			<br>
		</td>
	</tr>
<TR>
	<TD><B>�׸��</B></TD>
	<TD><B>������</B></TD>
	<TD><B>�����</B></TD>
	<TD><B>���</B></TD>
</TR>

<TR>
	<TD>���α���</TD>
	<TD>authyn</TD>
	<TD><%if(authyn.equals("O")) out.print("����"); else out.print("����");%></TD>
	<TD>���ο�û�� ���Ͽ� ������ ����Ǵ��� <br>�����Ǵ��� ���ϰ��� �׸��� �����ϴ�.</TD>
</TR>
<TR>
	<TD>�ŷ�����</TD>
	<TD>result</TD>
	<TD><%=result%></TD>
	<TD></TD>
</TR>
<TR>
	<TD>�ŷ���ȣ</TD>
	<TD>trno</TD>
	<TD><%=trno%></TD>
	<TD>�ŷ���ȣ�� �߿��մϴ�. <br>���������� ����ũŰ�� ����ϴ°����� ���� ������ҵ��� ó���� �� �ʿ��մϴ�.</TD>
</TR>
<TR>
	<TD>�ŷ�����</TD>
	<TD>trddt</TD>
	<TD><%=trddt%></TD>
	<TD>&nbsp;</TD>
</TR>
<TR>
	<TD>�ŷ��ð�</TD>
	<TD>trdtm</TD>
	<TD><%=trdtm%></TD>
	<TD>&nbsp;</TD>
</TR>
<TR>
	<TD>�ݾ�</TD>
	<TD>amt</TD>
	<TD><%=amt%></TD>
	<TD>&nbsp;</TD>
</TR>
<TR>
	<TD>�޼���1</TD>
	<TD>msg1</TD>
	<TD><%=msg1%></TD>
	<TD>�޼����� ī��翡�� ������ ���� �״�� ������ �帮�°�����<br> KSNET���� ������ ������ �ƴմϴ�.</TD>
</TR>
<TR>
	<TD>�޼���2</TD>
	<TD>msg2</TD>
	<TD><%=msg2%></TD>
	<TD>���μ����� �̺κп� OK�� ���ι�ȣ�� ǥ�õ˴ϴ�.</TD>
</TR>
<TR>
    <TD>�����ڵ�</TD>
    <TD>resultcd</TD>
    <TD><%=resultcd%></TD>
    <TD></TD>
</TR>
	<tr>
		<td align="center" colspan=4>
			<br>
			<br>
			<br>
		</td>
	</tr>
</TABLE>
</body>
</html>
