<%@page import="jxl.format.Pattern"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<style>
#btnSearch:hover{	color: white!important;}
#cashInfo{ border: 1px dashed #d2d2d2;     padding: 40px 20px; }
#cashInfo > div > span:first-child { display: inline-block; width: 100px; text-align: justify; }
.view_tbl01 thead th {text-align: center; background-color: #ccc;}
.view_tbl01 tbody td {text-align: center !important;}

</style>
<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>마스터 노출 정보 조회</caption>
		<colgroup>
			<col style="width: 10.3%;" />
			<col style="width: 23%;" />	
			<col style="width: 10.3%;" />
			<col style="width: 23%;" />	
			<col style="width: 10.3%;" />
			<col style="width: 23%;" />	
			<col style="width: 5.1%;" />
			<col />					
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">상품명</th>
				<td><input type="text" name="PRDT_NM_SEARCH" class="form-control form-control-sm col-8"  placeholder="검색어를 입력하세요" value="${out.params.prdtNmSearch }"  onkeypress="if(event.keyCode==13){fn_BtnSearch();}"/></td>
				<th scope="row">회원명</th>
				<td><input type="text" name="USER_NM_SEARCH" class="form-control form-control-sm col-8"  placeholder="검색어를 입력하세요" value="${out.params.userNmSearch }"  onkeypress="if(event.keyCode==13){fn_BtnSearch();}"/></td>
				<th scope="row">결제방법</th>
				<td>
					<select name="BUY_TYPE_SEARCH" class="form-control form-control-sm col-8">
						<option value="" >선택</option>
						<option value="카드" <c:if test="${out.params.buyTypeSearch eq '카드' }">selected</c:if> >카드</option>
						<option value="가상계좌" <c:if test="${out.params.buyTypeSearch eq '가상계좌' }">selected</c:if>>가상계좌</option>
						<option value="계좌이체" <c:if test="${out.params.buyTypeSearch eq '계좌이체' }">selected</c:if>>계좌이체</option>
						<option value="휴대폰결제" <c:if test="${out.params.buyTypeSearch eq '휴대폰결제' }">selected</c:if>>휴대폰결제</option>
						<option value="피플메이드" <c:if test="${out.params.buyTypeSearch eq '피플메이드' }">selected</c:if>>피플메이드페이</option>
					</select>
				</td>
				<td rowspan="2"><a id="btnSearch" onClick="fn_BtnSearch();" class="btn btn-md btn-black">검색</a></td>
			</tr>	
			<tr>
				<th scope="row">결제일자</th>
				<td style="text-align:center;">
					<input name="BUY_COMP_DTM_SEARCH" readonly="readonly" type="text" class="form-control form-control-sm datepicker col-8"  style="width:45%;float:left;"  value="<c:if test="${out.params.buyCompDtmSearch ne null}">${out.params.buyCompDtmSearch}</c:if>"  autocomplete= "new-password" autocomplete__wrapper autocomplete />
					<span style="padding: 8px;display: inline-block; float:left;">~</span>
					<input name="BUY_COMP_DTM_END" readonly="readonly" type="text" class="form-control form-control-sm datepicker col-8"  style="width:45%;float:left;"  value="<c:if test="${out.params.buyCompDtmEnd ne null}">${out.params.buyCompDtmEnd}</c:if>"  autocomplete= "new-password" autocomplete__wrapper autocomplete />
				</td>
				<th scope="row">결제번호</th>
				<td><input type="text" name="BUY_NO_SEARCH" class="form-control form-control-sm col-8"  placeholder="검색어를 입력하세요" value="${out.params.buyNoSearch }"  onkeypress="if(event.keyCode==13){fn_BtnSearch();}"/></td>
				<th scope="row">쿠폰사용여부</th>
				<td>
					<select name="COUP_YN_SEARCH" class="form-control form-control-sm col-8">
						<option value="" >선택(Y, N)</option>
						<option value="Y" <c:if test="${out.params.coupYnSearch eq 'Y' }">selected</c:if>>Y</option>
						<option value="N" <c:if test="${out.params.coupYnSearch eq 'N' }">selected</c:if>>N</option>
					</select>
				</td>
			</tr>	
		</tbody>
	</table>
</div>

	
<!-- 리스트  시작-->
	<div class="form-inline" style="display:flex; justify-content:space-between; padding-bottom:10px; margin-top: 30px;">	
		<span class="listCount" style="display:inline-block;">전체 <span class="ppm_key_color">${out.list.paging.totalCnt }</span></span>		
		<div id="sub-form-inline">
			<button class="btn btn-light  form-inline mr10 form-control-sm" onclick="excelDownload();" value="엑셀 다운로드">엑셀 다운로드</button>
			<select id="selectListCnt" class="designSelectBox form-control form-control-sm mr10" title="셀렉트박스">
				<option value="10" selected="">10</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="300">300</option>
			</select>
		</div>		
	</div>

<div class="tbl_list">
	<table class="list_tbl01" summary="">
		<caption>마스터 노출 정보 테이블</caption>
		<colgroup>
			<col style="width: 3%;" />
				
			<col style="width: 10%;" />
			<col style="width: 7%;" />
			<col style="width: 7%;" />
			<col style="width: 8%;" />
			
			<col style="width: 5%;" />
			<col style="width: 7%;" />
			<col style="width: 7%;" />

			<col />
			<col style="width: 5%;" />
			<col style="width: 7%;" />
			<col style="width: 5%;" />
			<col style="width: 5%;" />
			
			<col style="width: 3%;" />
			<col style="width: 7%;" />
			<col style="width: 7%;" />
			
			
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No.</th>
				
				<th scope="col">결제일자</th>
				<th scope="col">결제번호</th>
				<th scope="col">구분</th>
				<th scope="col">상품코드</th>
				
				<th scope="col">마스터명</th>
				<th scope="col">분야</th>
				<th scope="col">분야상세</th>

				<th scope="col">상품명</th>
				<th scope="col">회원명</th>
				<th scope="col">연락처</th>
				<th scope="col">결제방법</th>
				<th scope="col">결제금액</th>
				
				<th scope="col">쿠폰</th>
				<th scope="col">현금영수증</th>
				<th scope="col">결제상태<br>결제처리/취소</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row">
					<tr>
						<td>${row.NUM_DESC_ORDER }</td>
						
						<td>${row.BUY_COMP_DTM }</td>
						<td>${row.BUY_NO }(${row.BUY_NO_CNT})</td>
						<td>	${row.PRDT_TYPE }</td>
						<td>${row.BUY_PRDT_CD }</td>
						
						<td>${ row.MASTER_NM }</td>
						<td>${row.PARENT_CODE_NM }</td>
						<td>${row.CODE_NM }</td>

						<td class="prdtTitle">${row.PRDT_NM }</td>
						<td>${row.USER_NM }</td>
						<td>
								${row.USER_PHONE.replaceAll("(\\d{3})(\\d{3,4})(\\d{4})","$1-$2-$3") }
						</td>
						<td>${row.BUY_TYPE }</td>
						<td>${row.BUY_PRIC }원</td>
						
						<td>
							<c:if test='${row.COUP_DISC_NM eq "%"}'>
								${row.COUP_DISC}${row.COUP_DISC_NM }
							</c:if>
							<c:if test='${row.COUP_DISC_NM ne "%"}'>
								${row.COUP_DISC}
							</c:if>
							<c:if test='${row.COUP_DISC_NM eq null}'>
								-
							</c:if>
						</td>
						<td>
							<c:if test="${row.CASH_RECEIPT eq '1' }">
								<a onclick="openPop('${row.BUY_NO}','RECE');">Y</a>
							</c:if>
							<c:if test="${row.CASH_RECEIPT ne '1' }">
								-
							</c:if>
						</td>
						<td>
<!-- 							<div class="form-inline"> -->
								<span>${row.BUY_STAT}</span>
							<c:if test="${row.BUY_STAT eq '입금대기' }">
								<a class="btn" onclick="openPop('${row.BUY_NO}','PAY','${row.BUY_STAT}')">결제완료</a>
							</c:if>
							<c:if test="${row.BUY_STAT eq '결제완료' }">
								<a class="btn" onclick="openPop('${row.BUY_NO}','PAY','${row.BUY_STAT}')">취소신청</a>
							</c:if>
<%-- 								<a class="btn" onclick="fn_SendSms('${row.BUY_NO}','PAY','${row.BUY_STAT}')">문자보내기</a> --%>
<!-- 							</div> -->
						</td>
					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="17">등록된 내용이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>

	<c:set value="${out.list.paging}"  var="paging" />
	<%@ include file="/WEB-INF/views/shared/mng_paging.jspf" %>


<!--  팝업메뉴  -->
<div id="popup_cancle_cashreceipt" class="popup_wrap">
	<div class="popup_layer">
		<div class="popup_inner">
			<div class="popup_header" style="background-color: #fff;">	
				<h1 class="title" style="margin-left:20px; font-weight:600 !important; text-align: left; color: #222;">현금영수증 정보</h1>			
				<button  class="btn btn_close_pop" data-action="popup_hide" style="background: url(/resources/images/btn_close.png) no-repeat center;">닫기</button>
			</div>
			<div class="dialog_content">
				<div class="scroll_area">
						<div id="cashInfo">
							<div>
								<span>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</span>
								<span>:</span>
								<span></span>
							</div>
							<br>
							<div>
								<span id="kind">전화번호</span>
								<span>:</span>
								<span></span>
							</div>
							<br>
							<div >
								<span>용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;도</span>
								<span>:</span>
								<span></span>
							</div>
						</div>
									
								
					
					<div class="btn_wrap" >
						<a href="javascript:;"  style="background-color: #cccccc;" class="btn  btn-md btn_close_pop" data-action="popup_hide">확인</a>						
					</div>				
<!-- 					// End 팝업 컨텐츠 -->
				</div><!-- // End scroll_area -->
			</div><!-- // End dialog_content -->
		</div><!-- // End popup_inner -->
	</div><!-- // End popup_layer -->
</div>

<!-- 결제내역 취소신청 -->
<!--  팝업메뉴  -->
<div id="popup_cancel_pay" class="popup_wrap">
	<div class="popup_layer">
		<div class="popup_inner">
			<div class="popup_header" style="background-color: #fff;">	
				<h1 class="title" style="margin-left:20px; font-weight:600 !important; text-align: left; color: #222;">결제내역 취소신청</h1>			
				<button  class="btn btn_close_pop" data-action="popup_hide" style="background: url(/resources/images/btn_close.png) no-repeat center;">닫기</button>
			</div>
			<div class="dialog_content">
				<div class="scroll_area">
					<div class="tbl_view" >
						<table class="view_tbl01" summary="" >
							<caption>결제내역 취소신청 테이블</caption>
							<colgroup>
								<col style="width: 10%;" />
								<col style="width: 10%;" />
								<col style="width: 15%;" />							
								<col style="width: 15%;" />	
								<col  />	
								
								<col style="width: 10%;" />
								<col style="width: 10%;" />
								<col style="width: 10%;" />							
							</colgroup>
							<thead>
								<tr>
									<th scope="row">결제유형</th>
									<th scope="row">주문번호</th>
									<th scope="row">구분</th>
									<th scope="row">상품코드</th>
									<th scope="row">상품명</th>
									
									<th scope="row">판매금액</th>
									<th scope="row">쿠폰</th>
									<th scope="row">결제금액</th>
								</tr>
							</thead>
							<tbody id="payCancleTbody"></tbody>
						</table>
					</div>
					<div class="btn_wrap" >
						<a href="javascript:;"  style="background-color: #cccccc;" class="btn  btn-md btn_close_pop" onclick="fn_BtnStatusSave();">취소/환불 처리</a>						
					</div>
<!-- 					// End 팝업 컨텐츠 -->
				</div><!-- // End scroll_area -->
			</div><!-- // End dialog_content -->
		</div><!-- // End popup_inner -->
	</div><!-- // End popup_layer -->
</div>


<!-- 환불신청 팝업 -->
<!--  팝업메뉴  -->
<div id="popup_refund" class="popup_wrap">
	<div class="popup_layer">
		<div class="popup_inner">
			<div class="popup_header">	
				<h1 class="title" style="margin:0; font-weight:600 !important;">환불처리</h1>			
				<button class="btn btn_close_pop refundClosePop" data-action="popup_hide">닫기</button>
				<input id="userEditIdx" type="hidden" />
			</div>
			<div class="dialog_content">
				<div class="scroll_area">
<!-- 					Start 팝업 컨텐츠 -->
					<div class="tbl_view" >
						<table class="view_tbl01" summary="" id="cateArea">
							<caption>환불신청 테이블</caption>
							<colgroup>
								<col style="width: 20%;" />
								<col style="width: 80%;" />							
								<col  />	
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">은행명</th>
									<td id="USER_REFU_BANK">
									</td>
								</tr>
								<tr>
									<th scope="row">계좌번호</th>
									<td id="USER_ACCOUNT">
									</td>
								</tr>
								<tr>
									<th scope="row">예금주</th>
									<td id="USER_ACCOUNT_NM">
									</td>				
								</tr>
								
							</tbody>
						</table>
					</div>
									
								
					
					<div class="btn_wrap" >
						<a href="javascript:;" onclick="fn_BtnRefundAppy();" class="btn  btn-md btn_key_color">환불처리</a>						
					</div>				
<!-- 					// End 팝업 컨텐츠 -->
				</div><!-- // End scroll_area -->
			</div><!-- // End dialog_content -->
		</div><!-- // End popup_inner -->
	</div><!-- // End popup_layer -->
</div>


<!--  환불신청완료 팝업 -->
<!--  팝업메뉴  -->
<div id="popup_refundAppy" class="popup_wrap">
	<div class="popup_layer">
		<div class="popup_inner">
			<div class="popup_header">	
				<h1 class="title" style="margin:0; font-weight:600 !important;">환불처리완료</h1>			
				<button class="btn btn_close_pop" data-action="popup_hide" >닫기</button>
			</div>
			<div class="dialog_content">
				<div class="refundData scroll_area" style="    text-align: center;">
				
					으로 환불처리가 완료되었습니다.
					
					<div class="btn_wrap" >
						<a href=""  class="btn btn_close_pop  btn-md btn_key_color" data-action="popup_hide" >확인</a>						
					</div>				
<!-- 					// End 팝업 컨텐츠 -->
				</div><!-- // End scroll_area -->
			</div><!-- // End dialog_content -->
		</div><!-- // End popup_inner -->
	</div><!-- // End popup_layer -->
</div>


<script type="text/javascript">

//////////////////////////////////////////////////////////
// 1. 변수 초기화
//////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////
// 2. 첫 실행 함수
//////////////////////////////////////////////////////////
$(function(){
// 	fn_SelectOption("CAT01","CAT","testSelect");

	$('.prdtTitle').each(function(){
		$(this).text( fn_LegnthOver( $(this).text(), 10 ) );
	});
	
});

//////////////////////////////////////////////////////////
//3. 사용자 함수
//////////////////////////////////////////////////////////

// function fn_SendSms(BUY_NO, kind, BUY_STAT){
// 	var params = new Object();
// 	params.status = "EDIT_SMS";
// 	params.query = "selectPaySmsList";
// 	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
// 	params.BUY_NO = BUY_NO;
	
//  	var result = fn_DataAjax2( params );
// }



function openPop(BUY_NO, kind, BUY_STAT){
	if( BUY_STAT == '입금대기' ) {
		var params = new Object();
		params.status = "EDIT";
		params.query = "updateMngPayData";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		params.BUY_NO = BUY_NO;
		params.BUY_STAT = '결제완료';
		params.BUY_COMP_YN = "Y";
		
	 	var result = fn_DataAjax2( params );

// 	 	결제완료 SMS 통보
		var params = new Object();
		params.status = "EDIT_SMS";
		params.query = "selectPaySmsList";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		params.BUY_NO = BUY_NO;
	 	var result = fn_DataAjax2( params );
	 	
	 	if (result.out.resultCnt > 0) {
		
	 		var params = new Object();
			params.query = "selectMngPayCashReceiptData";
			params.status = "LIST";
			params.MNG_LOGIN_IDX = localStorage.getItem('mngLoginIdx');
			params.BUY_NO = BUY_NO;
		 	var result2 = fn_DataAjax2( params );
			
		 	result2 = result2.out.detail.data[0];
		 	if ( result2.BUY_TYPE == "가상계좌"  ) {
				
		 		// 현금영수증 발급신청
				var cashReceipt = new Object();
				cashReceipt.query = "updateFrontPaymentCashReceData";
				cashReceipt.status = "CASH_RECEIPT_ISSUE";
				
				cashReceipt.BUY_NO = BUY_NO;
				
				var resultReceit = fn_DataAjax2( cashReceipt );
				if (resultReceit.out.receiptResult.rStatus == 'O') {
					alert("현금영수증\n\n"+resultReceit.out.receiptResult.rMessage1+ '\n'+ resultReceit.out.receiptResult.rCashMessage1);
				}else if( resultReceit.out.receiptResult.rStatus == 'NO' ){
					// 현금영수증 신청 안함
				}else{
					alert("현금영수증\n\n"+resultReceit.out.receiptResult.rMessage1+ '\n'+ resultReceit.out.receiptResult.rMessage2);
				}
			 	
			}
		}
	 	
	 	alert('정상적으로 처리되었습니다.');
		location.reload();
	} else {
		if (kind == 'RECE') {
			
			var params = new Object();
			params.query = "selectMngPayCashReceiptData";
			params.status = "LIST";
			params.MNG_LOGIN_IDX = localStorage.getItem('mngLoginIdx');
			params.BUY_NO = BUY_NO;
		 	var result = fn_DataAjax2( params );
			
		 	result = result.out.detail.data[0];
//	 	 	console.log(result);
		 	
		 	if ( result.CASH_RECE_KIND == "" || result.CASH_RECE_KIND == null || typeof result.CASH_RECE_KIND == "undefind" ) {
				return alert('현금영수증 정보는 가상계좌만 보실수 있습니다.');
			}
		 	
		 	if ( result.CASH_RECEIPT_NM == "" ||  result.CASH_RECEIPT_NM == null || typeof result.CASH_RECEIPT_NM == "undefind"  ) {
			 	$('#cashInfo > div:eq(0) > span:eq(2)').text(result.USER_NM);
			}else{
			 	$('#cashInfo > div:eq(0) > span:eq(2)').text(result.CASH_RECEIPT_NM);
			}
		 	
		 	if (result.CASH_RECE_KIND == "휴대폰번호") {
		 		$('#kind').text( result.CASH_RECE_KIND );
		 		$('#cashInfo > div:eq(1) > span:eq(2)').text( 	result.CASH_RECE_SID.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3"));
			}else{
		 		$('#kind').text( result.CASH_RECE_KIND );
			 	$('#cashInfo > div:eq(1) > span:eq(2)').text(result.CASH_RECE_SID);
			}
		 	
		 	$('#cashInfo > div:eq(2) > span:eq(2)').text(result.CASH_RECE_WHY);
		 	
			// 팝업열기
			popupShow("400","","popup_cancle_cashreceipt");	
			
		}else if (kind == 'PAY') {
			var params = new Object();
			params.query = "selectMngPayDetail";
			params.status = "LIST";
			params.MNG_LOGIN_IDX = localStorage.getItem('mngLoginIdx');
			params.BUY_NO = BUY_NO;
		 	var result = fn_DataAjax2( params );
			var inTag = '';
		 	
		 	result = result.out.detail.data;

		 	$('#payCancleTbody').empty();
			
		 	$.each(result, function( key, val ){
		 		
		 		inTag += '<tr>';
		 		
		 		if( val.BUY_TYPE.indexOf('신용카드') > -1 ) {
		 			if( val.BUY_REFU_YN == 'N' ) inTag += '<td>'+val.BUY_STAT+'</td>';
		 			else if( val.BUY_REFU_YN == 'R' ) inTag += '<td>'+val.BUY_STAT+'</td>';
		 			else	inTag += '<td> '+val.BUY_STAT+' </td>';
		 		} else inTag += '<td>'+val.BUY_STAT+'</td>';
		 		
		 		inTag += '<td>'+val.BUY_NO+'</td>';
		 		inTag += '<td>'+val.PRDT_TYPE+'</td>';
		 		inTag += '<td>'+val.BUY_PRDT_CD+'</td>';
		 		if ( typeof val.PRDT_NM == 'undefined' ) {
		 		inTag += '<td>상품명없음</td>';
				}else{
		 		inTag += '<td>'+val.PRDT_NM+'</td>';
				}
		 		inTag += '<td>'+val.REAL_PAY_PRIC+'원</td>';
		 		if( val.COUP_DISC != null ) {
		 			inTag += '<td>'+val.COUP_DISC+val.COUP_DISC_NM+'</td>';
			 		if( val.COUP_DISC_NM == '%' ) {
			 			var calc = val.REAL_PAY_PRIC.replace(/,/g,'') - val.REAL_DISC_PRIC.replace(/,/g,'');
			 		} else {
			 			var calc = val.REAL_PAY_PRIC.replace(/,/g,'') - val.REAL_DISC_PRIC.replace(/,/g,'');
			 		}
		 		} else {
		 			 inTag += '<td> - </td>';
		 			var calc = val.REAL_PAY_PRIC;
		 		}
		 		inTag += '<td>'+ numberWithCommas(calc) +'원<input type="hidden" value="'+val.BUY_TYPE+'" id="'+val.BUY_IDX+'_'+val.BUY_NO+'" name="cancleType" ></td>';
		 		inTag += '</tr>';
		 		
		 		$('#payCancleTbody').append( inTag );
		 		
		 		if( val.BUY_REFU_YN == 'Y') $('#payCancleTbody tr').eq( key ).children('td').css('color','red');
		 		inTag = '';
		 	});
		 	
		 // 팝업열기
			popupShow("70%","","popup_cancel_pay");	
		}
	}
}

//숫자 세자리마다 , 찍어주는 정규식
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

	function fn_BtnStatusSave(){
		
		
		if ( $('[name=cancleType]').eq(0).val() == '신용카드' ) {
			
			var payCancle = new Object();
			payCancle.status = "PAY_CANCLE";
			payCancle.query = "";
			payCancle.mngLoginIdx = localStorage.getItem("mngLoginIdx");
			
			
			var params = new Object();
			params.status = "EDIT";
			params.query = "updateMngPayData";
			params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
			params.BUY_STAT = '취소완료';
			
			var cancleYn = false;
			
			payCancle.BUY_NO = "";
			
			payCancle.BUY_NO = $('[name=cancleType]').eq(0).attr('id').split('_')[1];
			
				var result = fn_DataAjax2( payCancle );
				if ( result.out.CamcleResult.rStatus == 'O' || result.out.CamcleResult.authyn == 'O' || result.out.CamcleResult.rACStatus == 'O' ) {
					cancleYn = true;
					params.BUY_NO = payCancle.BUY_NO;
					var result = fn_DataAjax2( params );
				}else{
					cancleYn = false;
				}
			
			if (!cancleYn) {
				alert('결제 취소에 실패했습니다. 잠시 후 다시 시도해 주세요.');
			}
			location.href = "${unit.move('index','')}";
		
		}else if($('[name=cancleType]').eq(0).val() == '휴대폰결제'){
			var payCancle = new Object();
			payCancle.status = "PAY_CANCLE";
			payCancle.query = "";
			payCancle.mngLoginIdx = localStorage.getItem("mngLoginIdx");
			
			
			var params = new Object();
			params.status = "EDIT";
			params.query = "updateMngPayData";
			params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
			params.BUY_STAT = '취소완료';
			
			var cancleYn = false;
			
			payCancle.BUY_NO = "";
			
			payCancle.BUY_NO = $('[name=cancleType]').eq(0).attr('id').split('_')[1];
			var result = fn_DataAjax2( payCancle );
		
			if ( result.out.CamcleResult.rStatus == 'O' || result.out.CamcleResult.authyn == 'O' || result.out.CamcleResult.rACStatus == 'O' ) {
				cancleYn = true;
				params.BUY_NO = payCancle.BUY_NO;
				var result = fn_DataAjax2( params );
			}else{
				cancleYn = false;
			}
			
			if (!cancleYn) {
				alert('결제 취소에 실패했습니다. 잠시 후 다시 시도해 주세요.');
			}
			location.href = "${unit.move('index','')}";
			
		}else{
			fn_BtnRefund($('[name=cancleType]').eq(0).attr('id'));
		}
		
	}
	
	function fn_BtnRefund( BUY_IDX ){
		var params = new Object();
		params.status = "DETAIL";
		params.query = "selectMngRefuUserAccountData";
		params.BUY_IDX = BUY_IDX.split('_')[0];
		
		var result = fn_DataAjax2( params );
		
	 	$('#USER_REFU_BANK').text(result.out.detail.data[0].BKNM);
	 	$('#USER_ACCOUNT').text(result.out.detail.data[0].USER_ACCOUNT);
	 	$('#USER_ACCOUNT_NM').text(result.out.detail.data[0].USER_ACCOUNT_NM);
	 	
		popupShow("1000","","popup_refund");	
	}
	
	function fn_BtnRefundAppy(){
		if( $('#USER_ACCOUNT').text() != '' ) {
			var params = new Object();
			params.status = "EDIT";
			params.query = "updateMngPayData";
			params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
			params.BUY_STAT = '취소신청';
			params.BUY_NO = $('[name=cancleType]').eq(0).attr('id').split('_')[1];
			var result = fn_DataAjax2( params );
		
			if (result.out.resultCnt > 0) {
				params.status = "LIST";
				params.query = "selectMngPayCashReceipt";
				var result = fn_DataAjax2( params );
				
				console.log( result );
				
				// 현금영수증 발급했으면 취소
				if ( result.out.detail.data[0].CASH_RECEIPT > 0 && result.out.detail.data[0].CASH_RECE_NO != "" && result.out.detail.data[0].CASH_RECE_NO != null && typeof result.out.detail.data[0].CASH_RECE_NO != "undefind" ) {
					var payCancle = new Object();
					payCancle.status = "PAY_CANCLE";
					payCancle.query = "";
					payCancle.mngLoginIdx = localStorage.getItem("mngLoginIdx");
					
					var cancleYn = false;
					payCancle.BUY_NO = params.BUY_NO;
					
					var result = fn_DataAjax2( payCancle );
					
					if ( result.out.CamcleResult.CancleCashReciept.all.rHStatus == 'O' ||  result.out.CamcleResult.CancleCashReciept.all.rStatus == 'O' || result.out.CamcleResult.CancleCashReciept.all.authyn == 'O' || result.out.CamcleResult.CancleCashReciept.all.rACStatus == 'O' ) {
						cancleYn = false;
					}else{
						cancleYn = true;
					}
					if (cancleYn) {
						alert('현금영수증 취소가 실패하였습니다.');
					}
				}
			}
			
			$('.refundClosePop').trigger('click');
			
			$('.refundData').html( $('#USER_REFU_BANK').text()+ ', '+ $('#USER_ACCOUNT').text() + ', ' + $('#USER_ACCOUNT_NM').text() + $('.refundData').html() );
			
			popupShow("1000","","popup_refundAppy");	
		} else {
			alert('환불 시, 환불계좌정보가 등록되어 있어야 합니다.\n환불계좌정보 등록이 필요한 회원입니다.');
		}
	}

</script>



