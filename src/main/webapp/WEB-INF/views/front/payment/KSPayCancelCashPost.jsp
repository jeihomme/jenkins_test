<!------------------------------------------------------------------------------
 FILE NAME : KSPayCancelCashPost.jsp
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
	String EncType       = "0";                                      // 0: ��ȭ����, 1:openssl, 2: seed
	String Version       = "0210";                                   // ��������
	String Type          = "00";                                     // ����
	String Resend        = "0";                                      // ���۱��� : 0 : ó��,  2: ������
	String RequestDate   = new SimpleDateFormat("yyyyMMddhhmmss").format(new java.util.Date()); // ��û���� : yyyymmddhhmmss
	String KeyInType     = "K";                                      // KeyInType ���� : S : Swap, K: KeyInType
	String LineType      = "1";                                      // lineType 0 : offline, 1:internet, 2:Mobile
	String ApprovalCount = "1";                                      // ���ս��ΰ���
	String GoodType      = "0";                                      // ��ǰ���� 0 : �ǹ�, 1 : ������
	String HeadFiller    = "";                                       // ����
//-------------------------------------------------------------------------------
	
// Header (�Է°� (*) �ʼ��׸�)--------------------------------------------------
	String StoreId       = request.getParameter("storeid");          // *�������̵�
	String OrderNumber   = "";                                       // �ֹ���ȣ
	String UserName      = "";                                       // *�ֹ��ڸ�
	String IdNum         = "";                                       // �ֹι�ȣ or ����ڹ�ȣ
	String Email         = "";                                       // *email
	String GoodName      = "";                                       // *��ǰ��
	String PhoneNo       = "";                                       // *�޴�����ȣ
// Header end -------------------------------------------------------------------
	
// Data Default(�����׸��� �ƴ�)-------------------------------------------------
	String ApprovalType  = request.getParameter("authty");           // ���α���
	String TrNo          = request.getParameter("trno");             // �ŷ���ȣ
	String Refundcheck   = request.getParameter("cash_canc_type");   // ��ұ���(1.�ŷ����, 2.�����߱����, 3.��Ÿ) 
// Data Default end -------------------------------------------------------------
	
// ���ΰ��� ����
// Server�� ���� ������ ������ ��ü����
	String rApprovalType        = "H011"; 
	String rHTransactionNo      = "";                // �ŷ���ȣ
	String rHStatus             = "X";               // ���� O : ����, X : ����
	String rHCashTransactionNo  = "";                // ���������� �ŷ�Ȯ�ι�ȣ
	String rHIncomeType         = "";                // �ҵ��ҵ� ����
	String rHTradeDate          = "";                // �ŷ�����
	String rHTradeTime	        = "";                // �ŷ��ð�
	String rHMessage1           = "��Ұ���";        // �޽���1
	String rHMessage2           = "C�������õ�";   // �޽���2
	String rHCashMessage1       = "";
	String rHCashMessage2       = "";
	
	try
	{
		KSPayApprovalCancelBean ipg = new KSPayApprovalCancelBean("localhost", 29991); 
		
		ipg.HeadMessage(EncType, Version, Type, Resend, RequestDate, StoreId, OrderNumber, UserName, IdNum, Email, 
						GoodType, GoodName, KeyInType, LineType, PhoneNo, ApprovalCount, HeadFiller);
		
//<���ݿ����� ��Һ���> 
		ipg.CancelDataMessage(ApprovalType, "0", TrNo, "", "", "",Refundcheck,"");
		
		if(ipg.SendSocket("1")) {
			rApprovalType       = ipg.ApprovalType[0];
			rHTransactionNo     = ipg.HTransactionNo[0];         // �ŷ���ȣ
			rHStatus            = ipg.HStatus[0];                // ���� O : ����, X : ����
			rHCashTransactionNo = ipg.HCashTransactionNo[0];     // �ŷ�����
			rHIncomeType        = ipg.HIncomeType[0];            // �ŷ��ð�
			rHTradeDate         = ipg.HTradeDate[0];             // �߱޻��ڵ�
			rHTradeTime         = ipg.HTradeTime[0];             // ���Ի��ڵ�
			rHMessage1          = ipg.HMessage1[0];              // ���ι�ȣ or ������ �����ڵ�
			rHMessage2          = ipg.HMessage2[0];              // �޽���1
			rHCashMessage1      = ipg.HCashMessage1[0];          // �޽���2
			rHCashMessage2      = ipg.HCashMessage2[0];          // ī���ȣ
		}
	}
	catch(Exception e) {
		rHMessage2 = "P�������õ�("+e.toString()+")";     // �޽���2
	} // end of catch
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html charset=euc-kr">
<title>KSPay</title>
<style type="text/css">
	TABLE{font-size:9pt; line-height:160%;}
	A {color:blueline-height:160% background-color:#E0EFFE}
	INPUT{font-size:9pt}
	SELECT{font-size:9pt}
	.emp{background-color:#FDEAFE}
	.white{background-color:#FFFFFF color:black border:1x solid white font-size: 9pt}
</style>
</head>
<body>
<table border=0 width=0>
	<tr>
		<td align=center>
			<table width=350 cellspacing=0 cellpadding=0 border=0 bgcolor=#4F9AFF>
				<tr>
					<td width=50%>
						<table width=100% cellspacing=1 cellpadding=2 border=0>
							<tr bgcolor=#4F9AFF height=25>
								<td align=left><font color="#FFFFFF">
								���ݿ����� ���
								</font></td>
							</tr>
							<tr bgcolor=#FFFFFF>
								<td valign=top>
									<table width=100% cellspacing=0 cellpadding=2 border=0>
										<tr>
											<td align=left>
												<table>	
													<tr><td>�ŷ���ȣ       </td><td><%=rHTransactionNo%></td></tr>
													<tr><td>��������(O/X)  </td><td><%=rHStatus%></td></tr>
													<tr><td>����û���ι�ȣ </td><td><%=rHCashTransactionNo%></td></tr>
													<tr><td>�ŷ� ����      </td><td><%=rHTradeDate%></td></tr>
													<tr><td>�ŷ� �ð�      </td><td><%=rHTradeTime%></td></tr>
													<tr><td>���� �޼���1   </td><td><%=rHMessage1%></td></tr>
													<tr><td>���� �޼���2   </td><td><%=rHMessage2%></td></tr>
												</table>
											<td>
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
</body>
</html>