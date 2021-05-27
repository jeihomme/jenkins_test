<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=euc-kr" %>
<%
////////////////////////////////////////////////////////////////////////////////////////////////
String temp_name = null;
String[] temp_values = null;
String	my_page			= request.getRequestURI();
System.out.println("[" + my_page + "]: param check starting ...........................");
System.out.println("[" + my_page + "]:request.getHeader(\"Referer\")=>" + request.getHeader("Referer"));
Enumeration temp_enum = request.getParameterNames();
if (temp_enum != null)
{
	while(temp_enum.hasMoreElements())
	{
		temp_name = (String)temp_enum.nextElement();
		temp_values = request.getParameterValues(temp_name);
		System.out.print("[" + my_page + "]:" + temp_name + "=>");
		if (temp_values != null)
		{
			for(int temp_i=0; temp_i<temp_values.length; temp_i++)
			{
				//System.out.print(temp_values[temp_i] + ",");
				System.out.print( new String(temp_values[temp_i].getBytes("8859_1"), "KSC5601") + ",");
			}
		}
		System.out.println("  ");
	}
}
System.out.println("[" + my_page + "]: param check ended ..............................");
/////////////////////////////////////////////////////////////////////////////////////////////////
	String rcid		    = request.getParameter("reCommConId"		);
	String reRetParam	= request.getParameter("reRetParam"			);

%>
<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<body >
<script type="text/javascript">
	function return_proceed()
	{
		var FormName = "";
		if( opener == null )
		{
			FormName = parent.document.KSPayWeb;
		}else
		{
			FormName = opener.document.KSPayWeb;
			FormName.reCommConId.value = "<%=rcid%>" ;
			FormName.reRetParam.value  = "<%=reRetParam%>" ;
			opener.goResult();
			setTimeout("self.close()",1000);
		}	

	}
	return_proceed();

</script>
</body>
............  Ã³¸®Áß .............
</html>