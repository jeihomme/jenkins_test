<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDateValue"><fmt:formatDate value="${now}" pattern="yyyyMM" /></c:set>
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'index', 'ajax')}" />
<style>
#btnSearch:hover{	color: white!important;}
</style>
<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<colgroup>
			<col width="15%"/>					
			<col />					
			<col width="15%"/>					
			<col />					
			<col width="5%"/>					
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">노출위치</th>
				<td>
					<select name="bannType" class="form-control form-control-sm col-8" >
						<option value="">-- 구분 --</option>
					</select>
				</td>
				<th scope="row">제목</th>
				<td><input type="text" name="searchCate" class="form-control form-control-sm col-8"  placeholder="검색어를 입력하세요" value="${out.params.searchCate }"  onkeypress="if(event.keyCode==13){fn_BtnSearch();}"/></td>
				<td rowspan="2"><a id="btnSearch" onClick="fn_BtnSearch();" class="btn btn-md btn-black">검색</a></td>
			</tr>	
			<tr>
				<th scope="row">MD's Pick여부</th>
				<td>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio0_1" name="bannUseYn" value="" checked />
						<label for="radio0_1" class="label_txt">전체</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio0_2" name="bannUseYn" value="Y" <c:if test="${out.params.bannUseYn eq 'Y' }">checked</c:if> />
						<label for="radio0_2" class="label_txt">Y</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio0_3" name="bannUseYn" value="N" <c:if test="${out.params.bannUseYn eq 'N' }">checked</c:if> />
						<label for="radio0_3" class="label_txt">N</label>
					</div>
				</td>
				<th scope="row">노출순서</th>
				<td>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio1_1" name="bannOrdr" value="" checked />
						<label for="radio1_1" class="label_txt">등록순</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio1_2" name="bannOrdr" value="Y" <c:if test="${out.params.bannOrdr eq 'Y' }">checked</c:if> />
						<label for="radio1_2" class="label_txt">내림차순</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio1_3" name="bannOrdr" value="N" <c:if test="${out.params.bannOrdr eq 'N' }">checked</c:if> />
						<label for="radio1_3" class="label_txt">오름차순</label>
					</div>
				</td>
			</tr>			
		</tbody>
	</table>
</div>

	
<!-- 리스트  시작-->
	<div class="form-inline" style="display:flex; justify-content:space-between; padding-bottom:10px; margin-top: 30px;">
		<span class="listCount" style="display:inline-block;">전체 <span class="ppm_key_color">${out.list.paging.totalCnt }</span></span>
		<div id="sub-form-inline">
<!-- 			<button class="btn btn-light  form-inline mr10 form-control-sm" onclick="excelDownload();" value="엑셀 다운로드">엑셀 다운로드</button> -->
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
		<caption>관리자 리스트 테이블</caption>
		<colgroup>
			<col style="width: 2%;" />	
			
			<col style="width: 3%;" />	
			<col style="width: 4%;" />	
			<col style="width: 7%;"/>
			<col style="width: 7%;" />
			<col style="width: 4%;"/>
				
			<col style="width: 7%;" />
			<col style="width: 10%;" />
			<col style="width: 7%;" />
			<col style="width: 7%;" />
			<col style="width: 10%;" />
				
			<col />
			<col style="width: 7%;" />
			<col style="width: 5%;" />
			<col style="width: 5%;" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col"><input type="checkbox" id="chk_all"></th>
				
				<th scope="col">No.</th>
				<th scope="col">메인<br>노출</th>
				<th scope="col">메인<br>마감일시순</th>
				<th scope="col">구분</th>
				<th scope="col">서브<br>노출</th>
				
				<th scope="col">서브<br>마감일시순</th>
				<th scope="col">상품코드</th>
				<th scope="col">마스터명</th>
				<th scope="col">분야</th>
				<th scope="col">분야상세</th>
				
				<th scope="col">상품명</th>
				<th scope="col">등록일</th>
				<th scope="col">판매상태</th>
				<th scope="col">수정</th>
			</tr>
		</thead>
		<tbody>
 
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row">
					<tr>
						<td><input type="checkbox" class="chk TIME_IDX" name="chk" value="${row.PRDT_REG_CD }"></td>
						
						<td>${row.NUM_DESC_ORDER }</td>
						<td>${row.MAIN_OPEN_YN }</td>
						<td>
<%-- 							<c:if test="${row.MAIN_OPEN_YN eq 'Y'}"><input type="text" style="width: 65%;" value="${row.MAIN_OPEN_DTM }"/></c:if> --%>
<%-- 							<c:if test="${row.MAIN_OPEN_YN eq 'N'}">${row.MAIN_OPEN_DTM }</c:if> --%>
							${row.MAIN_OPEN_DTM }
						</td>
						<td>${row.PRDT_TYPE }</td>
						<td>${row.SUBMAIN_OPEN_YN }</td>
						<td>
<%-- 							<c:if test="${row.SUBMAIN_OPEN_YN eq 'Y'}"><input type="text" style="width: 65%;" value="${row.SUBMAIN_OPEN_DTM }"/></c:if> --%>
<%-- 							<c:if test="${row.SUBMAIN_OPEN_YN eq 'N'}">${row.SUBMAIN_OPEN_DTM }</c:if> --%>
							${row.SUBMAIN_OPEN_DTM }
						</td>
						
						<td>${row.PRDT_REG_CD }</td>
						<td>${row.USER_NM }</td>
						<td>${row.P_CODE_NM }</td>
						<td>${row.M_CODE_NM }</td>
						
						<td>${row.INFO_PRDT_TITL1 }<br>${row.INFO_PRDT_TITL2 }</td>
						<td>${row.SYS_REG_DTM }</td>
						<td>${row.S_CODE_NM }</td>
						<td>
							<a class="btn insertPopup" style="    background-color: #1eccb4 !important;    border-color: #1eccb4;" href="javascript:;" onclick="selectMngTimedealDetail('${row.PRDT_REG_CD }');">수정</a>
						</td>
					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="99">등록된 내용이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>

<%-- 	<c:set value="${out.list.paging}"  var="paging" /> --%>
<%-- 	<%@ include file="/WEB-INF/views/shared/mng_paging.jspf" %> --%>


<div class="btn_wrap" style="text-align: inherit;">
	<a class="btn insertPopupMain" style="    background-color: #1eccb4 !important;    border-color: #1eccb4;" href="javascript:;" >메인노출관리</a>
	<a class="btn insertPopupSub" style="    background-color: #1eccb4 !important;    border-color: #1eccb4;" href="javascript:;">서브노출관리</a>
</div>


<div id="popup_insertPopupMain" class="popup_wrap">
	<div class="popup_layer">
		<div class="popup_inner">
			<div class="popup_header">	
				<h1 id="mdpickOpenPopup" class="title" style="margin:0; font-weight:600 !important;">메인노출여부</h1>			
				<button onclick="fn_cleanPop();" class="btn btn_close_pop" data-action="popup_hide">닫기</button>
			</div>
			<div class="dialog_content">
				<div class="scroll_area">
<!-- 					Start 팝업 컨텐츠 -->
					<div class="tbl_view" >
						<table class="view_tbl01" summary="" id="mainOpen">
							<colgroup>
								<col style="width: 30%;" />
								<col style="width: 70%;" />							
								<col  />	
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">메인노출여부</th>
									<td>
										<div class="designRadiobutton form-control-sm">
											<input type="radio" id="radio2_1" name="MAIN_OPEN_YN" value="Y" checked />
											<label for="radio2_1" class="label_txt">Y</label>
										</div>
										<div class="designRadiobutton form-control-sm">
											<input type="radio" id="radio2_2" name="MAIN_OPEN_YN" value="N" />
											<label for="radio2_2" class="label_txt">N</label>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="btn_wrap" style="text-align: right;">
						<a href="javascript:;" onclick="fn_BtnRegistMain();" class="btn  btn-md btn_key_color">저장</a>						
					</div>				
<!-- 					// End 팝업 컨텐츠 -->
				</div><!-- // End scroll_area -->
			</div><!-- // End dialog_content -->
		</div><!-- // End popup_inner -->
	</div><!-- // End popup_layer -->
</div>


<div id="popup_insertPopupSub" class="popup_wrap">
	<div class="popup_layer">
		<div class="popup_inner">
			<div class="popup_header">	
				<h1 id="mdpickOpenPopup" class="title" style="margin:0; font-weight:600 !important;">서브노출여부</h1>			
				<button onclick="fn_cleanPop();" class="btn btn_close_pop" data-action="popup_hide">닫기</button>
			</div>
			<div class="dialog_content">
				<div class="scroll_area">
<!-- 					Start 팝업 컨텐츠 -->
					<div class="tbl_view" >
						<table class="view_tbl01" summary="" id="subOpen">
							<colgroup>
								<col style="width: 30%;" />
								<col style="width: 70%;" />							
								<col  />	
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">서브노출여부</th>
									<td>
										<div class="designRadiobutton form-control-sm">
											<input type="radio" id="radio3_1" name="SUBMAIN_OPEN_YN" value="Y" checked />
											<label for="radio3_1" class="label_txt">Y</label>
										</div>
										<div class="designRadiobutton form-control-sm">
											<input type="radio" id="radio3_2" name="SUBMAIN_OPEN_YN" value="N" />
											<label for="radio3_2" class="label_txt">N</label>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="btn_wrap" style="text-align: right;">
						<a href="javascript:;" onclick="fn_BtnRegistSub();" class="btn  btn-md btn_key_color">저장</a>						
					</div>				
<!-- 					// End 팝업 컨텐츠 -->
				</div><!-- // End scroll_area -->
			</div><!-- // End dialog_content -->
		</div><!-- // End popup_inner -->
	</div><!-- // End popup_layer -->
</div>


<div id="popup_insertPopup" class="popup_wrap">
	<div class="popup_layer">
		<div class="popup_inner">
			<div class="popup_header">	
				<h1 id="mdpickOpenPopup" class="title" style="margin:0; font-weight:600 !important;">타임딜 노출여부</h1>			
				<button onclick="fn_cleanPop();" class="btn btn_close_pop" data-action="popup_hide">닫기</button>
			</div>
			<div class="dialog_content">
				<div class="scroll_area">
<!-- 					Start 팝업 컨텐츠 -->
					<div class="tbl_view" >
						<table class="view_tbl01" summary="" id="subOpen">
							<colgroup>
								<col style="width: 30%;" />
								<col style="width: 70%;" />							
								<col  />	
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">구분</th>
									<td id="PRDT_TYPE"></td>
								</tr>
								<tr>
									<th scope="row">상품코드</th>
									<td id="PRDT_REG_CD"></td>
								</tr>
								<tr>
									<th scope="row">마스터명</th>
									<td id="USER_NM"></td>
								</tr>
								<tr>
									<th scope="row">분야</th>
									<td id="P_CODE_NM"></td>
								</tr>
								<tr>
									<th scope="row">분야상세</th>
									<td id="M_CODE_NM"></td>
								</tr>
								<tr>
									<th scope="row">상품명</th>
									<td id="INFO_PRDT_TITL"></td>
								</tr>
								<tr>
									<th scope="row">메인 타임딜 여부</th>
									<td>
										<div class="designRadiobutton form-control-sm">
											<input type="radio" id="radio4_1" name="MAIN_OPEN_YN_DETAIL" value="Y" checked />
											<label for="radio4_1" class="label_txt">Y</label>
										</div>
										<div class="designRadiobutton form-control-sm">
											<input type="radio" id="radio4_2" name="MAIN_OPEN_YN_DETAIL" value="N" />
											<label for="radio4_2" class="label_txt">N</label>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">메인 타임딜 노출</th>
									<td style="display: flex;">
										<input type="date" id="MAIN_OPEN_DTM_DETAIL1" class="form-control form-control-sm col-4" value="" />
										<input type="time" id="MAIN_OPEN_DTM_DETAIL2" class="form-control form-control-sm col-4" value="" />
									</td>
								</tr>
								<tr>
									<th scope="row">서브 타임딜 여부</th>
									<td>
										<div class="designRadiobutton form-control-sm">
											<input type="radio" id="radio5_1" name="SUBMAIN_OPEN_YN_DETAIL" value="Y" checked />
											<label for="radio5_1" class="label_txt">Y</label>
										</div>
										<div class="designRadiobutton form-control-sm">
											<input type="radio" id="radio5_2" name="SUBMAIN_OPEN_YN_DETAIL" value="N" />
											<label for="radio5_2" class="label_txt">N</label>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">서브 타임딜 노출순서</th>
									<td style="display: flex;">
										<input type="date" id="SUBMAIN_OPEN_DTM_DETAIL1" class="form-control form-control-sm col-4" value="" />
										<input type="time" id="SUBMAIN_OPEN_DTM_DETAIL2" class="form-control form-control-sm col-4" value="" />
									</td>
								</tr>
								<tr>
									<th scope="row"  rowspan="4" style="border-right:1px solid #d2d2d2;">타임딜 판매금액</th>
								</tr>
								<tr>
									<td style="display: flex;"><span style="align-self: center;padding-right: 30px;">현재 판매금액</span><span id="PRDT_PRIC_REAL">0</span></td>
								</tr>
								<tr>
									<td style="display: flex;"><span style="align-self: center;padding-right: 50px;">할인금액</span><input type="text" id="DEAL_DISC_PRIC" class="form-control form-control-sm col-4" value="" placehoder="타임딜 할인가격을 입력해주세요." onchange="fn_CalcPrice();" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" /></td>
								</tr>
								<tr>
									<td style="display: flex;"><span style="align-self: center;padding-right: 20px;">타임딜 판매금액</span><span id="DEAL_REAL_PRIC">0</span></td>
								</tr>
									
							</tbody>
						</table>
					</div>
					
					<div class="btn_wrap" style="text-align: right;">
						<a href="javascript:;" onclick="fn_BtnRegist();" class="btn  btn-md btn_key_color">저장</a>						
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
// 	fn_SelectOption("", "CAT", "PARENT_CODE_ID");

	$('#chk_all').click(function(){
		if ( $('#chk_all').is(':checked') ) $('.chk').prop('checked', true);	
		else	$('.chk').prop('checked', false);	
	});

	$('.chk').click(function(){
		if ( $('input[name="chk"]:checked').length == $('.chk').length ) 	$('#chk_all').prop("checked", true);
		else	$('#chk_all').prop("checked", false);
	});

	$('.insertPopupMain').click(function(){
		popupShow("500","","popup_insertPopupMain");	
	});

	$('.insertPopupSub').click(function(){
		popupShow("500","","popup_insertPopupSub");	
	});

	$('.insertPopupOrdr').click(function(){
		fn_BtnRegistOrdr();
	});
	
});

//////////////////////////////////////////////////////////
//3. 사용자 함수
//////////////////////////////////////////////////////////
	
	function fn_BtnRegistMain(){
		$('input[name="chk"]:checked').each(function(key,val){
			var params = new Object();
			params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
			params.status = "WRITE";
			params.query = "insertTimedealMainOpenYnData";
			params.prdtCd = $(this).val();
			params.MAIN_OPEN_YN = $('input[name="MAIN_OPEN_YN"]:checked').val();
			console.log( params );
			var result = fn_DataAjax( params );
		});
		location.href = window.location.href;
	}

	function fn_BtnRegistSub(){
		$('input[name="chk"]:checked').each(function(key,val){
			var params = new Object();
			params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
			params.status = "WRITE";
			params.query = "insertTimedealMSubOpenYnData";
			params.prdtCd = $(this).val();
			params.SUBMAIN_OPEN_YN = $('input[name="SUBMAIN_OPEN_YN"]:checked').val();
			var result = fn_DataAjax( params );
		});
		location.href = window.location.href;
	}

	function fn_BtnRegistOrdr(){
		$('input[name="chk"]').each(function(key,val){
			if( $(this).is(":checked") ) {
				var params = new Object();
				params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
				params.status = "WRITE";
				params.query = "insertTimedealMOrdrData";
				params.prdtCd = $(this).val();
				params.MAIN_OPEN_DTM = $('.list_tbl01 tbody tr').eq(key).find('td').eq(3).find('input').val();
				params.SUBMAIN_OPEN_DTM = $('.list_tbl01 tbody tr').eq(key).find('td').eq(6).find('input').val();
				
				var result = fn_DataAjax( params );
			}
		});
		
		location.href = window.location.href;
	}

	function selectMngTimedealDetail( PRDT_REG_CD ){
		$('#DEAL_DISC_PRIC').val( '' );				
		$('#DEAL_REAL_PRIC').text( '0' );				
		
		var params = new Object();
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		params.status = "DETAIL";
		params.query = "selectMngTimedealDetail";
		params.prdtRegCd = PRDT_REG_CD;
		
		var result = fn_DataAjax2( params );
		result = result.out.detail.data;

		if( result.length > 0 ) {
			$.each(result, function(key,val){
				$('#PRDT_TYPE').text(val.PRDT_TYPE);
				$('#PRDT_REG_CD').text(val.PRDT_REG_CD);
				$('#USER_NM').text(val.USER_NM);
				$('#P_CODE_NM').text(val.P_CODE_NM);
				$('#M_CODE_NM').text(val.M_CODE_NM);
				$('#INFO_PRDT_TITL').text(val.INFO_PRDT_TITL1 + ' ' + val.INFO_PRDT_TITL2);

				if( val.MAIN_OPEN_YN == 'Y') $('[name=MAIN_OPEN_YN_DETAIL]:radio[value="Y"]').prop('checked',true);
				else $('[name=MAIN_OPEN_YN_DETAIL]:radio[value="N"]').prop('checked',true);
				
				if( val.MAIN_OPEN_DTM != null ) {
					$('#MAIN_OPEN_DTM_DETAIL1').val(val.MAIN_OPEN_DTM.substr(0,10));
					$('#MAIN_OPEN_DTM_DETAIL2').val(val.MAIN_OPEN_DTM.substr(11,5));
				}

				if( val.SUBMAIN_OPEN_YN == 'Y') $('[name=SUBMAIN_OPEN_YN_DETAIL]:radio[value="Y"]').prop('checked',true);
				else $('[name=SUBMAIN_OPEN_YN_DETAIL]:radio[value="N"]').prop('checked',true);
				
				if( val.SUBMAIN_OPEN_DTM != null ) {
					$('#SUBMAIN_OPEN_DTM_DETAIL1').val(val.SUBMAIN_OPEN_DTM.substr(0,10));
					$('#SUBMAIN_OPEN_DTM_DETAIL2').val(val.SUBMAIN_OPEN_DTM.substr(11,5));
				}

				$('#PRDT_PRIC_REAL').text( val.PRDT_PRIC_REAL.replace(/,/g,'') );
				if( val.DEAL_DISC_PRIC != null ) $('#DEAL_DISC_PRIC').val( val.DEAL_DISC_PRIC.replace(/,/g,'') );				
				if( val.DEAL_REAL_PRIC != null ) $('#DEAL_REAL_PRIC').text( val.DEAL_REAL_PRIC.replace(/,/g,'') );				
				
			});
		}
		
		popupShow("700","","popup_insertPopup");
	}

	function fn_BtnRegist(){
		var params = new Object();
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		params.status = "WRITE";
		params.query = "insertTimedealData";
		params.prdtCd = $('#PRDT_REG_CD').text();
		params.MAIN_OPEN_DTM = $('#MAIN_OPEN_DTM_DETAIL1').val() + ' ' + $('#MAIN_OPEN_DTM_DETAIL2').val()+':00';
		params.SUBMAIN_OPEN_DTM = $('#SUBMAIN_OPEN_DTM_DETAIL1').val() + ' ' + $('#SUBMAIN_OPEN_DTM_DETAIL2').val()+':00';

		params.DEAL_REAL_PRIC = $('#DEAL_REAL_PRIC').text();
		params.DEAL_DISC_PRIC = $('#DEAL_DISC_PRIC').val();
		
		if( params.MAIN_OPEN_DTM.length != 19) return alert('메인 타임딜 노출시간을 입력해주세요');
		if( params.SUBMAIN_OPEN_DTM.length != 19) return alert('서브 타임딜 노출시간을 입력해주세요');
		
		if( $('[name=MAIN_OPEN_YN_DETAIL]:radio[value="Y"]').is(":checked") ) params.MAIN_OPEN_YN = 'Y';
		else params.MAIN_OPEN_YN = 'N';
		
		if( $('[name=SUBMAIN_OPEN_YN_DETAIL]:radio[value="Y"]').is(":checked") ) params.SUBMAIN_OPEN_YN = 'Y';
		else params.SUBMAIN_OPEN_YN = 'N';
		
		var result = fn_DataAjax( params );
		location.href = window.location.href;

	}

	function fn_CalcPrice() {
		var price = "";
		var CHAT_DISC = $('#DEAL_DISC_PRIC').val()*1;
		
		//원 단위 계산
		if ( $('#PRDT_PRIC_REAL').text()*1 < CHAT_DISC ) CHAT_DISC = $('#PRDT_PRIC_REAL').val();
		price = $('#PRDT_PRIC_REAL').text() - CHAT_DISC;
		
		$('#DEAL_REAL_PRIC').text( Math.floor(price/10) * 10 );
// 		$('#DEAL_DISC_PRIC').val( Number($('#DEAL_DISC_PRIC').text()) );
	}
	
</script>



