<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDateValue"><fmt:formatDate value="${now}" pattern="yyyyMM" /></c:set>
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" /> 
<script>
$( function() {
	var frm = $('[name=cashFrmFrame]');
	
// 	frm.action = '/front/payment/KSPayCashBillPost';
	
// 	frm.method = 'post';
// 	frm.submit();
	
});
	
	
</script>
<form name="cashFrmFrame" method="post" action="/front/payment/KSPayCashBillPost">
<table border=0 width=0>
<tr>
<td align=center>
<table width=320 cellspacing=0 cellpadding=0 border=0 bgcolor=#4F9AFF>
<tr>
<td>
<table width=100% cellspacing=1 cellpadding=2 border=0>
<tr bgcolor=#4F9AFF height=25>
<td align=left><font color="#FFFFFF">
KSPay 현금영수증발급 기본거래정보
</font></td>
</tr>
<tr bgcolor=#FFFFFF>
<td valign=top>
<table width=100% cellspacing=0 cellpadding=2 border=0>
<tr>
<td align=left>
<table>

	<tr>
		<td>상점 ID</td>
		<td><input type="text" name="storeid" value="2999199999" READONLY></td>
	</tr>
	<tr>
		<td>주문번호</td>
		<td><input type="text" name="ordernumber" value="kspay_123" maxlength="50"></td>
	</tr>
	<tr>
		<td>주문자명</td>
		<td><input type="text" name="ordername" value="홍길동" maxlength="50"></td>
	</tr>
	<tr>
		<td>사용자정보<br>(주민/사업자번호/휴대폰)</td>
		<td><input type="text" name="idnum" value="7011191234567" maxlength="13"></td>
	</tr>
	<tr>
		<td>email</td>
		<td><input type="text" name="email" value="gdhong@kspay.com" maxlength="50"></td>
	</tr>
	<tr>
		<td>상품명</td>
		<td><input type="text" name="goodname" value="풍선껌" maxlength="50"></td>
	</tr>
	<tr>
		<td>승인구분<font color=blue><br>- H000:일반발급<br>- H200:계좌이체<br>- H600:가상계좌 </font></td>
		<td><input type="text" name="authty" value="H000" maxlength="4"></td>
	</tr>

	<tr>
		<td>원거래번호<font color=blue><br>*일반발급시 사용안함</font></td><!-- 일반발급시 공백, 계좌이체/가상계좌 거래번호 -->
		<td><input type="text" name="TransactionNo" value="" maxlength="12"></td>
	</tr>
	<tr>
		<td>공급가액</td>
		<td><input type="text" name="SupplyAmt" value="6000" maxlength="9"></td>
	</tr>
	<tr>
		<td>세금</td>
		<td><input type="text" name="TaxAmt" value="1000" maxlength="9"></td>
	</tr>
	<tr>
		<td>봉사료</td>
		<td><input type="text" name="SvcAmt" value="0" maxlength="9"></td>
	</tr>
	<tr>
		<td>총금액</td><!-- 테스트상점은 총금액 7000원만 테스트 가능합니다. -->
		<td><input type="text" name="TotAmt" value="7000" maxlength="9"></td>
	</tr>
	<tr>
		<td>발행용도</td>
		<td>
		<INPUT TYPE="radio" NAME="transele" value="0" checked>소득공제용(개인)<br>
		<INPUT TYPE="radio" NAME="transele" value="1">지출증빙용(사업자)<br>
		</td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type=submit  value="현금영수증발급">
		</td>
	</tr>
</table></tr></table></td></tr></table></td></tr>
</table></td></tr></table></td></tr></table></table>
</form>