<%@ page contentType="text/html;charset=euc-kr" 
%><%@ include file="./eutil.jsp"
%>
<%
	String MYPAY_WEBHOST_SRCH_URL = "https://kspay.ksnet.to/store/PAY_PROXY/mypay/mypay_jcanc_tot.jsp"; // 취소url 운영: kspay.ksnet.to , 개발 : 210.181.28.134
	
	String DEFAULT_RPARAMS	= "authyn`trno`trddt`trdtm`amt`msg1`msg2`result`resultcd`storeid`username`email`goodname`mobile";
	
  String storeid = request.getParameter("sndStoreid") ;
  String trno    = request.getParameter("sndTrno") ;    // 거래번호 취소
  String cordno  = request.getParameter("sndOrdno") ;   // 주문번호 취소( 거래번호 미입력시 필수 )
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
	<title>입력값</title>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" >
	<style type="text/css">
	BODY{font-size:6pt; line-height:160%}
	TD{font-size:6pt; line-height:160%}
	INPUT{font-size:6pt;}
	</style>
</head>
<body bgcolor=#ffffff onload="">
<CENTER><B><font size=4 color="blue">취소결과</font></B></CENTER>
<br>
<TABLE  width=100% border="1" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td align="center" colspan=4>
			<br>
			이페이지는 <font color = "red">취소시</font>에 업체측으로 리턴되는 결과 값들을 나타내고 있읍니다. 
			<br>
			아래와 같은 리턴 항목들중에서 귀사에서 필요하신 부분만 받으셔서 사용하시면 됩니다.
			<br>
			<br>
		</td>
	</tr>
<TR>
	<TD><B>항목명</B></TD>
	<TD><B>변수명</B></TD>
	<TD><B>결과값</B></TD>
	<TD><B>비고</B></TD>
</TR>

<TR>
	<TD>승인구분</TD>
	<TD>authyn</TD>
	<TD><%if(authyn.equals("O")) out.print("승인"); else out.print("거절");%></TD>
	<TD>승인요청에 대하여 승인이 허락되던지 <br>거절되던지 리턴값의 항목은 같읍니다.</TD>
</TR>
<TR>
	<TD>거래구분</TD>
	<TD>result</TD>
	<TD><%=result%></TD>
	<TD></TD>
</TR>
<TR>
	<TD>거래번호</TD>
	<TD>trno</TD>
	<TD><%=trno%></TD>
	<TD>거래번호는 중요합니다. <br>결재정보중 유니크키로 사용하는값으로 사후 승인취소등의 처리시 꼭 필요합니다.</TD>
</TR>
<TR>
	<TD>거래일자</TD>
	<TD>trddt</TD>
	<TD><%=trddt%></TD>
	<TD>&nbsp;</TD>
</TR>
<TR>
	<TD>거래시간</TD>
	<TD>trdtm</TD>
	<TD><%=trdtm%></TD>
	<TD>&nbsp;</TD>
</TR>
<TR>
	<TD>금액</TD>
	<TD>amt</TD>
	<TD><%=amt%></TD>
	<TD>&nbsp;</TD>
</TR>
<TR>
	<TD>메세지1</TD>
	<TD>msg1</TD>
	<TD><%=msg1%></TD>
	<TD>메세지는 카드사에서 보내는 것을 그대로 리턴해 드리는것으로<br> KSNET에서 생성된 내용은 아닙니다.</TD>
</TR>
<TR>
	<TD>메세지2</TD>
	<TD>msg2</TD>
	<TD><%=msg2%></TD>
	<TD>승인성공시 이부분엔 OK와 승인번호가 표시됩니다.</TD>
</TR>
<TR>
    <TD>응답코드</TD>
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
