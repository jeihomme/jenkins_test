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
					<input name="BUY_COMP_DTM_SEARCH" readonly="readonly" type="text" class="form-control form-control-sm datepicker col-8"   value="<c:if test="${out.params.buyCompDtmSearch ne null}">${out.params.buyCompDtmSearch}</c:if>"  autocomplete= "new-password" autocomplete__wrapper autocomplete />
				</td>
				<th scope="row">취소신청일</th>
				<td>
					<input name=BUY_REFU_DTM_SEARCH readonly="readonly" type="text" class="form-control form-control-sm datepicker col-8"   value="<c:if test="${out.params.buyRefuDtmSearch ne null}">${out.params.buyRefuDtmSearch}</c:if>"  autocomplete= "new-password" autocomplete__wrapper autocomplete />
				</td>
				<th scope="row">처리상태</th>
				<td>
					<select name="BUY_STAT_SEARCH" class="form-control form-control-sm col-8">
						<option value="">선택</option>
						<option value="취소신청">취소신청</option>
						<option value="취소완료">취소완료</option>
						<option value="환불신청">환불신청</option>
						<option value="환불완료">환불완료</option>
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
			<col style="width: 10%;" />
			<col style="width: 7%;" />
			<col style="width: 7%;" />
<%-- 			<col style="width: 7%;" /> --%>
			
			<col style="width: 5%;" />
			<col style="width: 7%;" />
<%-- 			<col style="width: 7%;" /> --%>

			<col />
			<col style="width: 5%;" />
			<col style="width: 7%;" />
			<col style="width: 5%;" />
			<col style="width: 5%;" />
			<col style="width: 7%;" />
			
			<col style="width: 5%;" />
			<col style="width: 5%;" />
			<col style="width: 5%;" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No.</th>
				
				<th scope="col">취소/환불일자</th>
				<th scope="col">결제일자</th>
				<th scope="col">결제번호</th>
				<th scope="col">구분</th>
<!-- 				<th scope="col">상품코드</th> -->
				
				<th scope="col">마스터명</th>
				<th scope="col">분야</th>
<!-- 				<th scope="col">분야상세</th> -->
				
				<th scope="col">상품명</th>
				<th scope="col">회원명</th>
				<th scope="col">연락처</th>
				<th scope="col">결제방법</th>
				<th scope="col">결제상태</th>
				<th scope="col">취소/환불금액</th>
				
				<th scope="col">쿠폰</th>
				<th scope="col">현금영수증</th>
				<th scope="col">결제상태<br>결제취소</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row">
					<tr>

						<td>${row.NUM_DESC_ORDER }</td>
						
						<td>${row.BUY_REFU_DTM }</td>
						<td>${row.BUY_COMP_DTM }</td>
						<td>${row.BUY_NO }(${row.BUY_NO_CNT})</td>
						<td>	${row.PRDT_TYPE }</td>
<%-- 						<td>${row.BUY_PRDT_CD }</td> --%>

						<td>${ row.MASTER_NM }</td>
						<td>${row.PARENT_CODE_NM }</td>
<%-- 						<td>${row.CODE_NM }</td> --%>
						
						<td class="prdtTitle"><a href="javascript:;" onclick='window.open("${ fn:replace(row.MOVE_URL,"/mng/refu/detail","/front/prdt/detail") }","width=535,height=860, scrollbars=no, resizable=yes");'>${row.PRDT_NM }</a></td>
						<td>${row.USER_NM }</td>
						<td>
							${row.USER_PHONE.replaceAll("(\\d{3})(\\d{3,4})(\\d{4})","$1-$2-$3") }
						</td>
						<td>${row.BUY_TYPE }</td>
						<td>
							${row.BUY_STAT}
						</td>
						<td>
							${row.PRDT_PRIC_REAL }원
						</td>
						
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
								Y
							</c:if>
							<c:if test="${row.CASH_RECEIPT ne '1' }">
								N
							</c:if>
						</td>
						<td>
							<a class="insertPopup btn btn_key_color2" onclick="fn_BtnStatus( '${row.BUY_NO }', '${row.BUY_STAT}', '${row.BUY_TYPE }')">상태확인</a>
						</td>
					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="9999">등록된 내용이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>

	<c:set value="${out.list.paging}"  var="paging" />
	<%@ include file="/WEB-INF/views/shared/mng_paging.jspf" %>

<!-- 회원정보 수정 팝업 -->
<!--  팝업메뉴  -->
<div id="popup_status" class="popup_wrap">
	<div class="popup_layer">
		<div class="popup_inner">
			<div class="popup_header">	
				<h1 class="title" style="margin:0; font-weight:600 !important;">처리상태 변경</h1>			
				<button class="btn btn_close_pop" data-action="popup_hide" >닫기</button>
			</div>
			<div class="dialog_content">
				<div class="scroll_area">
					<div class="tbl_view" >
						<table class="view_tbl01" summary="" id="cateArea">
							<input type="hidden" name="BUY_NO" />
							<input type="hidden" name="BUY_TYPE" />
							
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
									<th scope="row">환불선택</th>
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
							<tfoot>
							</tfoot>
						</table>
					</div>
					
					<div class="btn_wrap" style="text-align: left;">
					
						<div class="designRadiobutton form-control-sm" >
							<input type="radio" id="radio1_1" name="BUY_STAT" value="취소신청" checked />
							<label for="radio1_1" class="label_txt">취소신청</label>
						</div>
						<div class="designRadiobutton form-control-sm">
							<input type="radio" id="radio1_2" name="BUY_STAT" value="취소완료" />
							<label for="radio1_2" class="label_txt">취소완료</label>
						</div>
						<div class="designRadiobutton form-control-sm">
							<input type="radio" id="radio1_3" name="BUY_STAT" value="환불신청" />
							<label for="radio1_3" class="label_txt">환불신청</label>
						</div>
						<div class="designRadiobutton form-control-sm">
							<input type="radio" id="radio1_4" name="BUY_STAT" value="환불완료" />
							<label for="radio1_4" class="label_txt">환불완료</label>
						</div>
						<div class="designRadiobutton form-control-sm" id="noReturn">
							<input type="radio" id="radio1_5" name="BUY_STAT" value="결제완료" />
							<label for="radio1_5" class="label_txt">환불철회</label>
						</div>
					</div>	
					
					<div class="btn_wrap" style="text-align: right;">
						<a href="javascript:;" onclick="fn_BtnStatusSave();" class="btn  btn-md btn_key_color">저장</a>						
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
				<h1 class="title" style="margin:0; font-weight:600 !important;">환불신청</h1>			
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
						<a href="javascript:;" onclick="fn_BtnRefundAppy();" class="btn  btn-md btn_key_color">환불신청</a>						
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

	$('.prdtTitle a').each(function(){
		$(this).text( fn_LegnthOver( $(this).text(), 10 ) );
	});
});




//////////////////////////////////////////////////////////
//3. 사용자 함수
//////////////////////////////////////////////////////////

function fn_BtnStatus( BUY_NO, BUY_STAT, BUY_TYPE ) {
	$('[name=BUY_STAT]:radio[value="'+BUY_STAT+'"]').prop('checked', true );
	$('[name=BUY_NO]').val( BUY_NO );
	$('[name=BUY_TYPE]').val( BUY_TYPE );
	
	var params = new Object();
	params.query = "selectMngRefuDetail";
	params.status = "LIST";
	params.MNG_LOGIN_IDX = localStorage.getItem('mngLoginIdx');
	params.BUY_NO = BUY_NO;
 	var result = fn_DataAjax2( params );
	var inTag = '';
 	
 	result = result.out.detail.data;
//INFO |--------|--------|---------|---------|----------|---------------------|------------|---------|---------|----------|-------------|--------------|--------------|-----------------------------------------------|-------------|---------|---------|---------------|------------|---------|-------------|------------|-------------|----------|---------------------|------------|---------------|------------|---------------| 
//INFO |USER_NM |BUY_IDX |CATE_IDX |USER_IDX |USER_NICK |USER_EMAIL           |USER_PHONE  |TIME_IDX |COUP_IDX |COUP_DISC |COUP_DISC_NM |BUY_PRDT_CD   |BUY_CD        |BUY_ORDER_NUMBER                               |BUY_NO       |BUY_TYPE |BUY_PRIC |PRDT_PRIC_REAL |BUY_COMP_YN |BUY_STAT |BUY_COMP_DTM |BUY_REFU_YN |CASH_RECEIPT |PRDT_TYPE |PRDT_NM              |SYS_REG_IDX |SYS_REG_DTM    |SYS_MOD_IDX |SYS_MOD_DTM    | 
//INFO |--------|--------|---------|---------|----------|---------------------|------------|---------|---------|----------|-------------|--------------|--------------|-----------------------------------------------|-------------|---------|---------|---------------|------------|---------|-------------|------------|-------------|----------|---------------------|------------|---------------|------------|---------------| 
//INFO |김블루루    |160     |8        |4        |아이폰SE2    |user1@bluelime.co.kr |01034442444 |[null]   |27       |22        |%            |202011LNA0027 |202012PCA0049 |20201231165323c1fe1a2c41c1e0136cb7ec9cc91e5b98 |176730126101 |신용카드     |19500    |5000           |Y           |결제완료     |[null]       |N           |0            |라이브클래스    |최고의 예능, 마스터1의 재간     |4           |20201231165404 |4           |20210104120604 | 
//INFO |김블루루    |161     |10       |4        |아이폰SE2    |user1@bluelime.co.kr |01034442444 |[null]   |27       |22        |%            |202012ENA0007 |202012PCA0050 |20201231165323c1fe1a2c41c1e0136cb7ec9cc91e5b98 |176730126101 |신용카드     |19500    |19000          |Y           |결제완료     |[null]       |N           |0            |1:1이메일상담  |나의 몸을 위해, 꼭 먹어야하는 알약 |4           |20201231165404 |4           |20210104110103 | 
//INFO |--------|--------|---------|---------|----------|---------------------|------------|---------|---------|----------|-------------|--------------|--------------|-----------------------------------------------|-------------|---------|---------|---------------|------------|---------|-------------|------------|-------------|----------|---------------------|------------|---------------|------------|---------------| 

 	$('#payCancleTbody').empty();
	
 	$.each(result, function( key, val ){
 		
 		inTag += '<tr>';
 		
 		if( val.BUY_TYPE.indexOf('신용카드') > -1 ) {
 			if( val.BUY_REFU_YN == 'N' ) inTag += '<td>'+val.BUY_STAT+'</td>';
 			else if( val.BUY_REFU_YN == 'R' ) inTag += '<td>'+val.BUY_STAT+'</td>';
 			else	inTag += '<td> '+val.BUY_STAT+' </td>';
 		} else inTag += '<td>'+val.BUY_STAT+'</td>';
 		
 		if ( val.BUY_STAT.indexOf('완료') > -1 ) {
			$('#noReturn').hide();
		}else{
			$('#noReturn').show();
		}
 		
 		inTag += '<td>'+val.BUY_NO+'</td>';
 		inTag += '<td>'+val.PRDT_TYPE+'</td>';
 		inTag += '<td>'+val.BUY_PRDT_CD+'</td>';
 		if ( typeof val.PRDT_NM == 'undefined' ) {
	 	inTag += '<td>상품명없음</td>';
		}else{
	 	inTag += '<td>'+val.PRDT_NM+'</td>';
		}
 		inTag += '<td>'+val.PRDT_PRIC_REAL+'원</td>';
 		if( val.COUP_DISC != null ) {
 			inTag += '<td>'+val.COUP_DISC+val.COUP_DISC_NM+'</td>';
	 		if( val.COUP_DISC_NM == '%' ) {
	 			var calc = parseInt( val.PRDT_PRIC_REAL * (1 - ( val.COUP_DISC*0.01 ) ) );
	 		} else {
	 			var calc = val.PRDT_PRIC_REAL - val.COUP_DISC;
	 		}
 		} else {
 			 inTag += '<td> - </td>';
 			var calc = val.PRDT_PRIC_REAL;
 		}
 		inTag += '<td>'+ calc +'원<input type="hidden" value="'+val.BUY_TYPE+'" id="'+val.BUY_IDX+'_'+val.BUY_NO+'" name="cancleType" ></td>';
 		inTag += '</tr>';
 		
 		$('#payCancleTbody').append( inTag );
 		
 		if( val.BUY_REFU_YN == 'Y') $('#payCancleTbody tr').eq( key ).children('td').css('color','red');
 		inTag = '';
 	});
 	
	popupShow("70%","","popup_status");	
}

function fn_BtnStatusSave(){
	var params = new Object();
	params.status = "EDIT";
	params.query = "updateMngRefuData";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	if( $('[name=BUY_TYPE]').val() == '신용카드') {
		
		params.BUY_NO = $('[name=BUY_NO]').val();
		params.BUY_STAT = $("input[name='BUY_STAT']:checked").val();
		
		if ( params.BUY_STAT == '취소완료' || params.BUY_STAT == '결제완료' ) {
			
			if ( $("input[name='BUY_STAT']:checked").val() == "취소완료" ) {
				// 카드결제 취소
				var payCancle = new Object();
				payCancle.status = "PAY_CANCLE";
				payCancle.query = "";
				payCancle.mngLoginIdx = localStorage.getItem("mngLoginIdx");
				
				var cancleYn = false;
				
				payCancle.BUY_NO = $('[name=BUY_NO]').val();
				
				var result = fn_DataAjax2( payCancle );
				console.log(result);
				if ( result.out.CamcleResult.CancleCashReciept.all.rHStatus == 'O' ||  result.out.CamcleResult.CancleCashReciept.all.rStatus == 'O' || result.out.CamcleResult.CancleCashReciept.all.authyn == 'O' || result.out.CamcleResult.CancleCashReciept.all.rACStatus == 'O' ) {
					cancleYn = true;
				}else{
					cancleYn = false;
				}
				
				if (!cancleYn) {
					return alert('결제 취소에 실패했습니다. 잠시 후 다시 시도해 주세요.');
				}else{
					var result = fn_DataAjax2( params );
					if (result.out.resultCnt > 0) {
						alert('결제 취소가 완료되었습니다');
					}
				}
				
			}else{
				var result = fn_DataAjax2( params );
				if (result.out.resultCnt > 0) {
					alert('취소철회가 완료되었습니다');
				}
			}
		
		}else{
			return alert('취소, 환불신청으로는 변경할 수 없습니다.');
		}
		
	} else {
		params.BUY_NO = $('[name=BUY_NO]').val();
		params.BUY_STAT = $("input[name='BUY_STAT']:checked").val();
		
		if ( params.BUY_STAT == "취소완료" || params.BUY_STAT == "환불완료" || params.BUY_STAT == '결제완료' ) {
			
			if ( $("input[name='BUY_STAT']:checked").val() == "취소완료" || $("input[name='BUY_STAT']:checked").val() == "환불완료" ) {
				
				
				var payCancle = new Object();
				payCancle.status = "PAY_CANCLE";
				payCancle.query = "";
				payCancle.mngLoginIdx = localStorage.getItem("mngLoginIdx");
				
				var cancleYn = false;
				
				payCancle.BUY_NO = $('[name=BUY_NO]').val();
				
				var result = fn_DataAjax2( payCancle );
				console.log(result.out.CamcleResult);
				if ( result.out.CamcleResult.CancleCashReciept.all.rHStatus == 'O' ||  result.out.CamcleResult.CancleCashReciept.all.rStatus == 'O' || result.out.CamcleResult.CancleCashReciept.all.authyn == 'O' || result.out.CamcleResult.CancleCashReciept.all.rACStatus == 'O' ) {
					cancleYn = false;
				}else{
					cancleYn = true;
				}

				if ( result.out.CamcleResult.CancleCashReciept.all.CASH_RECEIPT != '0' ) {
					if (cancleYn) {
						alert('현금영수증 취소가 실패하였습니다.');
					}
				}
				
				var result = fn_DataAjax2( params );
				if (result.out.resultCnt > 0) {
					alert('결제 취소가 완료되었습니다');
				}
				
			}else{
				var result = fn_DataAjax2( params );
				if (result.out.resultCnt > 0) {
					alert('철회가 완료되었습니다');
				}
			}
			
		}else{
			return alert('취소, 환불신청으로는 변경할 수 없습니다.');
		}
		
	}
	
	location.reload();
	
// 	params.BUY_IDX = $('[NAME=BUY_IDX]').val();
// 	params.BUY_STAT = $("input[name='BUY_STAT']:checked").val();
	
// 	location.href = "${unit.move('index','')}";
}

</script>



