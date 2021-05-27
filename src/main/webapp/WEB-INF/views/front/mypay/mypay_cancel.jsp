<%@ page contentType="text/html; charset=euc-kr" %>
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
			if (is_mobile()) {
				location.href = "/front/payment/payment";
			}else{
				location.href = "/front/payment/payment2";
			}
		}else
		{
			FormName = opener.document.KSPayWeb;
			setTimeout("self.close()",1000);
		}	

	}
	return_proceed();
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
</body>
CANCEL
</html>