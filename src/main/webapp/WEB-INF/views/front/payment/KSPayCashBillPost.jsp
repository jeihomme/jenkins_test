<!------------------------------------------------------------------------------
 FILE NAME : KSPayCashPost.jsp
 AUTHOR : kspay@ksnet.co.kr
 DATE : 2004/12/22
                                                         http://www.kspay.co.kr
                                                         http://www.ksnet.co.kr
                                  Copyright 2003 KSNET, Co. All rights reserved
------------------------------------------------------------------------------->
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="com.ppm.kspay.KSPayApprovalCancelBean" %>
<%@ page contentType="text/html;charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
// Default(�����׸��� �ƴ�)-------------------------------------------------------
	String EncType       = "2";                                    // 0: ��ȭ����, 1:openssl, 2: seed
	String	Version      = "0412";                                 // ��������: ���ݿ������� ���������� 0311�������� �ϸ� �ȵ˴ϴ�.
	String Type          = "00";                                   // ����
	String Resend        = "0";                                    // ���۱��� : 0 : ó��,  2: ������
	String RequestDate   = new SimpleDateFormat("yyyyMMddhhmmss").format(new java.util.Date()); // ��û���� : yyyymmddhhmmss
	String KeyInType     = "K";                                    // KeyInType ���� : S : Swap, K: KeyInType
	String LineType      = "1";                                    // lineType 0 : offline, 1:internet, 2:Mobile
	String ApprovalCount = "1";                                    // ���ս��ΰ���
	String GoodType      = "0";                                    // ��ǰ���� 0 : �ǹ�, 1 : ������
	String HeadFiller    = "";                                     // ����
//-------------------------------------------------------------------------------
	
// Header (�Է°� (*) �ʼ��׸�)--------------------------------------------------
	String StoreId       = request.getParameter("storeid")    ;    // �������̵�
	String OrderNumber   = request.getParameter("ordernumber");    // �ֹ���ȣ
	String UserName      = request.getParameter("ordername")  ;    // �ֹ��ڸ�
	String IdNum         = request.getParameter("idnum")      ;    // �ֹι�ȣ or ����ڹ�ȣ
	String Email         = request.getParameter("email")      ;    // email
	String GoodName      = request.getParameter("goodname")   ;    // ��ǰ��
	String PhoneNo       = ""                                 ;    // �޴�����ȣ
// Header end -------------------------------------------------------------------
	
// Data Default(�����׸��� �ƴ�)-------------------------------------------------
	String CallCode      = "0";                                    //��ȭ�ڵ�  (0: ��ȭ, 1: ��ȭ)
	String Filler        = "0";                                    //����
// Data Default end -------------------------------------------------------------
	
// Data (�Է°� (*) �ʼ��׸�)----------------------------------------------------
	String ApprovalType  = request.getParameter("authty");         //H000:�Ϲݹ߱�, H200:������ü, H600:�������
	String IssuSele      = "1";                                    //0:�Ϲݹ߱�(PG���ŷ���ȣ �ߺ�üũ), 1:�ܵ��߱�(�ֹ���ȣ �ߺ�üũ : PG���ŷ� ����), 2:�����߱�(�ߺ�üũ ����)
	String TransactionNo = request.getParameter("TransactionNo");  //�ԱݿϷ�� ������ü, ������� �ŷ���ȣ
	String UserInfo      = IdNum;                                  //�ֹε�Ϲ�ȣ, ����ڹ�ȣ, ī���ȣ, �޴�����ȣ, ��Ÿ
	String SupplyAmt     = request.getParameter("SupplyAmt");      //���ް���
	String TaxAmt        = request.getParameter("TaxAmt");         //����
	String SvcAmt        = request.getParameter("SvcAmt");         //�����
	String TotAmt        = request.getParameter("TotAmt");         //���ݿ����� �߱ޱݾ�
	String UserInfoSele  = "";                                     //0:�ֹε�Ϲ�ȣ, 1:����ڹ�ȣ, 2:ī���ȣ, 3:�޴�����ȣ, 4:��Ÿ
	String TranSele      = request.getParameter("transele");       //���౸�� 0: �ҵ������(����), 1: ����������(�����)
	
	//�ߺ�üũ���� ���������� ���ؼ� ���а� üũ �� ����
	if (IssuSele.substring(0,1) != "2" && !ApprovalType.substring(0,2).equals("H0"))
	{
		IssuSele = "0";     //�������, ������ü��û�̹Ƿ� 0���� ����
	}
	else if (!IssuSele.substring(0,1).equals("2"))
	{
		IssuSele = "1";     //�Ϲݿ�û�̹Ƿ� �̹Ƿ� 1�� ����
	}
	else
	{
		IssuSele = "2";     //�����߱����� ����
	}
	
	if (IdNum.length() == 10 && IdNum.substring(0,1) != "0")   // ����ڹ�ȣ
	{
		UserInfoSele = "1";
	}
	else if (IdNum.length() == 13)     // �ֹε�Ϲ�ȣ
	{
		UserInfoSele = "0";
	}
	else                               // �޴�����ȣ
	{
		UserInfoSele = "3";
	}
// Data end ---------------------------------------------------------------------

// ���ΰ��� ����
// Server�� ���� ������ ������ ��ü����

	String rApprovalType        = (ApprovalType != null && ApprovalType.length() == 4) ? ApprovalType.substring(0,3) + "1" : "H000";
	String rTransactionNo       = "";
	String rStatus              = "X";
	String rCashTransactionNo   = "";
	String rIncomeType          = "";
	String rTradeDate           = "";
	String rTradeTime           = "";
	String rMessage1            = "�߱ް���";
	String rMessage2            = "B�������õ�";
	String rCashMessage1        = "";
	String rCashMessage2        = "";
	String rFiller              = "";
	
	try 
	{
		com.ppm.kspay.KSPayApprovalCancelBean ipg = new com.ppm.kspay.KSPayApprovalCancelBean("localhost", 29991);
		
		ipg.HeadMessage(EncType, Version, Type, Resend, RequestDate, StoreId, OrderNumber, UserName, IdNum, Email, 
						GoodType, GoodName, KeyInType, LineType, PhoneNo, ApprovalCount, HeadFiller);
		
		ipg.CashBillDataMessage(ApprovalType, TransactionNo, IssuSele, UserInfoSele, UserInfo, TranSele, CallCode, SupplyAmt
									, TaxAmt, SvcAmt, TotAmt, Filler);
		
		if(ipg.SendSocket("1")) {
			rApprovalType        = ipg.ApprovalType      [0];/* ���α��� �ڵ�          */
			rTransactionNo       = ipg.HTransactionNo    [0];/* �ŷ���ȣ               */
			rStatus              = ipg.HStatus           [0];/* �������� O:���� X:���� */
			rCashTransactionNo   = ipg.HCashTransactionNo[0];/* ���ݿ����� �ŷ���ȣ    */
			rIncomeType          = ipg.HIncomeType       [0];/* 0: �ҵ�      1: ��ҵ� */
			rTradeDate           = ipg.HTradeDate        [0];/* �ŷ� ���� ����         */
			rTradeTime           = ipg.HTradeTime        [0];/* �ŷ� ���� �ð�         */
			rMessage1            = ipg.HMessage1         [0];/* ���� message1          */
			rMessage2            = ipg.HMessage2         [0];/* ���� message2          */
			rCashMessage1        = ipg.HCashMessage1     [0];/* ����û �޽��� 1        */
			rCashMessage2        = ipg.HCashMessage2     [0];/* ����û �޽��� 2        */
			rFiller              = ipg.HFiller           [0];/* ����                   */
		}
	}
	catch(Exception e) {
		rStatus                  = "X";
		rMessage1                = "�߱ް���";         // �޽���1
		rMessage2                = "�������õ�";     // �޽���2
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
								���ݿ����� �߱�
								</font></td>
							</tr>
							<tr bgcolor=#FFFFFF>
								<td valign=top>
									<table width=100% cellspacing=0 cellpadding=2 border=0>
										<tr>
											<td align=left>
												<table>	
													<tr><td>�ŷ���ȣ       </td><td><%=rTransactionNo%></td></tr>
													<tr><td>��������(O/X)  </td><td><%=rStatus%></td></tr>
													<tr><td>����û���ι�ȣ </td><td><%=rCashTransactionNo%></td></tr>
													<tr><td>�ŷ� ����      </td><td><%=rTradeDate%></td></tr>
													<tr><td>�ŷ� �ð�      </td><td><%=rTradeTime%></td></tr>
													<tr><td>���� �޼���1   </td><td><%=rMessage1%></td></tr>
													<tr><td>���� �޼���2   </td><td><%=rMessage2%></td></tr>
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