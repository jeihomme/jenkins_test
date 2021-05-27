<%------------------------------------------------------------------------------
 FILE NAME : KSPayCancelPost.jsp
 AUTHOR : kspay@ksnet.co.kr
 DATE : 2007/08/30
                                                         http://www.kspay.co.kr
                                                         http://www.ksnet.co.kr
                                  Copyright 2003 KSNET, Co. All rights reserved
-------------------------------------------------------------------------------%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.ppm.kspay.KSPayApprovalCancelBean" %>
<%@ page contentType="text/html;charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
//Header�� Data --------------------------------------------------
	String EncType              = "2" ;                                 // 0: ��ȭ����, 1:ssl, 2: seed
	String Version              = "0603" ;                              // ��������
	String Type                 = "00" ;                                // ����
	String Resend               = "0" ;                                 // ���۱��� : 0 : ó��,  2: ������
	String RequestDate          = new SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()); // ��û���� :
	String KeyInType            = "K" ;                                 // KeyInType ���� : S : Swap, K: KeyInType
	String LineType             = "1" ;                                 // lineType 0 : offline, 1:internet, 2:Mobile
	String ApprovalCount        = "1" ;                                 // ���ս��ΰ���
	String GoodType             = "0" ;                                 // ��ǰ���� 0 : �ǹ�, 1 : ������
	String HeadFiller           = "" ;                                  // ����
	
// Header (�Է°� (*) �ʼ��׸�)--------------------------------------------------
	String StoreId              = request.getParameter("storeid") ;     // *�������̵�
	String OrderNumber          = "";                                   // �ֹ���ȣ
	String UserName             = "";                                   // �ֹ��ڸ�
	String IdNum                = "";                                   // �ֹι�ȣ or ����ڹ�ȣ
	String Email                = "";                                   // email
	String GoodName             = "";                                   // ��ǰ��
	String PhoneNo              = "";                                   // �޴�����ȣ
//Header end -------------------------------------------------------------------
	
//Data Default------------------------------------------------------------------
	String ApprovalType         = request.getParameter("authty") ;      // ���α��� �ڵ�
	String TrNo                 = request.getParameter("trno") ;        // �ŷ���ȣ
	
// Server�� ���� ������ ������ ��ü����
	String rApprovalType        = "2011"                     ; // ���α���
	String rACTransactionNo     = TrNo                       ; // �ŷ���ȣ
	String rACStatus            = "X"                        ; // �������� :���� X:����
	String rACTradeDate         = RequestDate.substring(0,8) ; // �ŷ� ���� ����(YYYYMMDD)
	String rACTradeTime         = RequestDate.substring(8,14); // �ŷ� ���� �ð�(HHMMSS)
	String rACAcctSele          = ""                         ; // ������ü ���� -	1:Dacom, 2:Pop Banking,	3:�ǽð�������ü 4: ������������ü
	String rACFeeSele           = ""                         ; // ��/�ĺ������� -	1:����,	2:�ĺ�
	String rACInjaName          = ""                         ; // ���ڸ�(�����μ�޼���-������)
	String rACPareBankCode      = ""                         ; // �Աݸ�����ڵ�
	String rACPareAcctNo        = ""                         ; // �Աݸ���¹�ȣ
	String rACCustBankCode      = ""                         ; // ��ݸ�����ڵ�
	String rACCustAcctNo        = ""                         ; // ��ݸ���¹�ȣ
	String rACAmount            = ""                         ; // �ݾ�	(�������ݾ�)
	String rACBankTransactionNo = ""                         ; // ����ŷ���ȣ
	String rACIpgumNm           = ""                         ; // �Ա��ڸ�
	String rACBankFee           = "0"                        ; // ������ü ������
	String rACBankAmount        = ""                         ; // �Ѱ����ݾ�(�������ݾ�+ ������
	String rACBankRespCode      = "9999"                     ; // �����ڵ�
	String rACMessage1          = "��Ұ���"                 ; // ���� message 1
	String rACMessage2          = "C�������õ�"            ; // ���� message 2
	String rACFiller            = ""                         ; // ����
	
	try
	{
		KSPayApprovalCancelBean ipg = new KSPayApprovalCancelBean("localhost", 29991); 
		
		ipg.HeadMessage(EncType, Version, Type, Resend, RequestDate, StoreId, OrderNumber, UserName, IdNum, Email, 
			GoodType, GoodName, KeyInType, LineType, PhoneNo, ApprovalCount, HeadFiller);
		
		ipg.CancelDataMessage(ApprovalType, "0", TrNo, "", "", "","","");
		
		if(ipg.SendSocket("1")) {
			rApprovalType        = ipg.ApprovalType[0];
			rACTransactionNo     = ipg.ACTransactionNo[0];       // �ŷ���ȣ
			rACStatus            = ipg.ACStatus[0];              // �������� :���� X:����
			rACTradeDate         = ipg.ACTradeDate[0];           // �ŷ� ���� ����(YYYYMMDD)
			rACTradeTime         = ipg.ACTradeTime[0];           // �ŷ� ���� �ð�(HHMMSS)
			rACAcctSele          = ipg.ACAcctSele[0];            // ������ü ���� -	5:�ݰ��������ü    
			rACFeeSele           = ipg.ACFeeSele[0];             // ��/�ĺ������� -	1:����,	2:�ĺ�
			rACInjaName          = ipg.ACInjaName[0];            // ���ڸ�(�����μ�޼���-������)
			rACPareBankCode      = ipg.ACPareBankCode[0];        // �Աݸ�����ڵ�
			rACPareAcctNo        = ipg.ACPareAcctNo[0];          // �Աݸ���¹�ȣ
			rACCustBankCode      = ipg.ACCustBankCode[0];        // ��ݸ�����ڵ�
			rACCustAcctNo        = ipg.ACCustAcctNo[0];          // ��ݸ���¹�ȣ
			rACAmount            = ipg.ACAmount[0];              // �ݾ�	(�������ݾ�)
			rACBankTransactionNo = ipg.ACBankTransactionNo[0];   // ����ŷ���ȣ
			rACIpgumNm           = ipg.ACIpgumNm[0];             // �Ա��ڸ�
			rACBankFee           = ipg.ACBankFee[0];             // ������ü ������
			rACBankAmount        = ipg.ACBankAmount[0];          // �Ѱ����ݾ�(�������ݾ�+ ������
			rACBankRespCode      = ipg.ACBankRespCode[0];        // �����ڵ�
			rACMessage1          = ipg.ACMessage1[0];            // ���� message 1
			rACMessage2          = ipg.ACMessage2[0];            // ���� message 2
			rACFiller            = ipg.ACFiller[0];              // ����
		}
	}
	catch(Exception e) {
		rACMessage2 = "P�������õ�("+e.toString()+")";         // �޽���2
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
								KSPay ��� ���
								</font></td>
							</tr>
							<tr bgcolor=#FFFFFF>
								<td valign=top>
									<table width=100% cellspacing=0 cellpadding=2 border=0>
										<tr>
											<td align=left>
												<table>
													<tr><td>�ŷ���ȣ      </td><td><%=rACTransactionNo%></td></tr>
													<tr><td>��������(O/X) </td><td><%=rACStatus%></td></tr>
													<tr><td>�ŷ� ����     </td><td><%=rACTradeDate%></td></tr>
													<tr><td>�ŷ� �ð�     </td><td><%=rACTradeTime%></td></tr>
													<tr><td>���� �޼���1  </td><td><%=rACMessage1%></td></tr>
													<tr><td>���� �޼���2  </td><td><%=rACMessage2%></td></tr>
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