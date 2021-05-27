<!------------------------------------------------------------------------------
 FILE NAME : KSPayCancelForm.html
 AUTHOR : kspay@ksnet.co.kr
 DATE : 2007/08/30
                                                         http:'www.kspay.co.kr
                                                         http:'www.ksnet.co.kr
                                  Copyright 2003 KSNET, Co. All rights reserved
------------------------------------------------------------------------------->
<html>
<head>
<title>KSPay</title>
<meta http-equiv="Content-Type" content="text/html charset=euc-kr">
<style type="text/css">
	TABLE{font-size:9pt; line-height:160%;}
	A {color:blueline-height:160% background-color:#E0EFFE}
	INPUT{font-size:9pt}
	SELECT{font-size:9pt}
	.emp{background-color:#FDEAFE}
	.white{background-color:#FFFFFF color:black border:1x solid white font-size: 9pt}
</style>
</head>

<body onload="" topmargin=0 leftmargin=0 marginwidth=0 marginheight=0 onFocus="" >
<form name=KSPayAuthForm method=post action="./KSPayAccountCancelPost.jsp">
<!--기본-------------------------------------------------->
<table border=0 width=0>
	<tr>
		<td align=center>
			<table width=280 cellspacing=0 cellpadding=0 border=0 bgcolor=#4F9AFF>
				<tr>
					<td>
						<table width=100% cellspacing=1 cellpadding=2 border=0>
							<tr bgcolor=#4F9AFF height=25>
								<td align=left>
									<font color="#FFFFFF">KSPay 취소</font>
								</td>
							</tr>
							<tr bgcolor=#FFFFFF>
								<td valign=top>
									<table width=100% cellspacing=0 cellpadding=2 border=0>
										<tr>
											<td align=left>
												<table>
													<tr>
														<td>승인구분 :</td>
														<td>
															<input type=hidden name="authty" value="2010">2010.계좌이체취소</option>
														</td>
													</tr>
													<tr>
														<td>상점아이디 :</td>
														<td>
															<input type=text name=storeid value="">
														</td>
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
</form>
</body>
</html>