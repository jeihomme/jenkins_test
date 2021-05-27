<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'index', 'ajax')}" />

 
<style>
.infoView{ border: 1px solid #222; margin-bottom: 10px; }
.infoView > div{padding: 5px; position: relative;}
.gnb_box { margin-bottom: 0; }
.gnb_list>li {width: 50%!important;}
.gnb_list>li.active { background-color: #333; }
.note-toolbar {background-color: #fff!important; border: none!important;}
.panel-default{flex: 0 0 91.666667%;   max-width: 91.666667%;}
.tool_box{position: absolute; top: 50%; right: 2.5%;}
[id^="addVod_Target"] input { margin: auto; }
.form-control-sm.designRadiobutton input[type="radio"] + label.label_txt{padding-left:0px !important;}

</style>

<!-- 조회  시작-->				
<div class="tbl_view" style="margin-bottom: 20px;">
	<table class="view_tbl01" summary="">
		<colgroup>
			<col style="width: 15%;" />
			<col  />
			<col style="width: 15%;" />
			<col  />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">마스터명</th>
				<td id="USER_NM"></td>
				<th scope="row">계정</th>
				<td id="USER_EMAIL"></td>
			</tr>
			<tr>
				<th scope="row">분야</th>
				<td id="CODE_PARENT_NM"></td>
				<th scope="row">분야상세</th>
				<td id="CODE_NM"></td>
			</tr>
			<tr>
				<th scope="row">최근로그인</th>
				<td id="USER_LOGIN_DTM"></td>
				<th scope="row">최근상담일</th>
				<td id="USER_CONS_DTM"></td>
			</tr>
		</tbody>
	</table>
</div>	

<div class="gnb_box">
                <ul class="gnb_list">
                    <li >
                      <a href="${unit.move( 'view', out.params.cateIdx, 'cate' ) }">
                            소개영역
                      </a>
                    </li>
                    <li class="active">
                      <a href="${unit.move( 'tab',  out.params.cateIdx, 'cate' , 'viewSale' ) }">
                            판매 상품 영역
                      </a>
                    </li>
                </ul>
</div>


<div class="btn_wrap" style="text-align: right; padding: 10px 0 0px;">
	<a class="btn btn-md btn_key_color" onclick="alertShow('70%','','search_vod');fn_BtnFindVod('');">추가</a>
</div>
					
<div class="tbl_view" style="margin-top: 20px;">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>판매상품 관리 테이블</caption>
		<colgroup>
			<col style="width: 15%;"/>
			<col/>
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">VOD</th>
				<td >
					<div class="tbl_list">
						<table class="list_tbl01" summary="">
							<caption>동영상강좌 리스트 테이블</caption>
							<colgroup>
								<col />				
<%-- 								<col style="width: 15%;" />			 --%>
								<col style="width: 15%;" />		
								<col style="width: 15%;" />		
<%-- 								<col style="width: 15%;" />		 --%>
								<col style="width: 15%;" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">상품코드</th>
<!-- 									<th scope="col">상품명</th> -->
									<th scope="col">판매 상태</th>
									<th scope="col">등록일</th>
<!-- 									<th scope="col">순서</th> -->
									<th scope="col">관리</th>
								</tr>
							</thead>
							<tbody id="addVod_TargetLECT">
										<tr class="noValue">
											<td colspan="11">등록된 내용이 없습니다.</td>
										</tr>
							</tbody>
						</table>
					</div>
				</td>
			</tr>					
			<tr>
				<th scope="row">1:1화상상담</th>
				<td >
					<div class="tbl_list">
						<table class="list_tbl01" summary="">
							<caption>1:1화상상담 리스트 테이블</caption>
							<colgroup>
								<col />				
<%-- 								<col style="width: 15%;" />			 --%>
								<col style="width: 15%;" />		
								<col style="width: 15%;" />		
<%-- 								<col style="width: 15%;" />		 --%>
								<col style="width: 15%;" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">상품코드</th>
<!-- 									<th scope="col">상품명</th> -->
									<th scope="col">판매 상태</th>
									<th scope="col">등록일</th>
<!-- 									<th scope="col">순서</th> -->
									<th scope="col">관리</th>
								</tr>
							</thead>
							<tbody id="addVod_TargetFACE">
										<tr class="noValue">
											<td colspan="11">등록된 내용이 없습니다.</td>
										</tr>
							</tbody>
						</table>
					</div>
				</td>
			</tr>					
			<tr>
				<th scope="row">1:1채팅상담</th>
				<td >
					<div class="tbl_list">
						<table class="list_tbl01" summary="">
							<caption>1:1채팅상담 리스트 테이블</caption>
							<colgroup>
								<col />				
<%-- 								<col style="width: 15%;" />			 --%>
								<col style="width: 15%;" />		
								<col style="width: 15%;" />		
<%-- 								<col style="width: 15%;" />		 --%>
								<col style="width: 15%;" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">상품코드</th>
<!-- 									<th scope="col">상품명</th> -->
									<th scope="col">판매 상태</th>
									<th scope="col">등록일</th>
<!-- 									<th scope="col">순서</th> -->
									<th scope="col">관리</th>
								</tr>
							</thead>
							<tbody id="addVod_TargetCHAT">
										<tr class="noValue">
											<td colspan="11">등록된 내용이 없습니다.</td>
										</tr>
							</tbody>
						</table>
					</div>
				</td>
			</tr>				
			<tr>
				<th scope="row">1:1이메일상담</th>
				<td >
					<div class="tbl_list">
						<table class="list_tbl01" summary="">
							<caption>1:1이메일상담 리스트 테이블</caption>
							<colgroup>
								<col />				
<%-- 								<col style="width: 15%;" />			 --%>
								<col style="width: 15%;" />		
								<col style="width: 15%;" />		
<%-- 								<col style="width: 15%;" />		 --%>
								<col style="width: 15%;" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">상품코드</th>
<!-- 									<th scope="col">상품명</th> -->
									<th scope="col">판매 상태</th>
									<th scope="col">등록일</th>
<!-- 									<th scope="col">순서</th> -->
									<th scope="col">관리</th>
								</tr>
							</thead>
							<tbody id="addVod_TargetMAIL">
										<tr class="noValue">
											<td colspan="11">등록된 내용이 없습니다.</td>
										</tr>
							</tbody>
						</table>
					</div>
				</td>
			</tr>					
			<tr>
				<th scope="row">라이브클래스</th>
				<td >
					<div class="tbl_list">
						<table class="list_tbl01" summary="">
							<caption>라이브클래스 리스트 테이블</caption>
							<colgroup>
								<col />				
<%-- 								<col style="width: 15%;" />			 --%>
								<col style="width: 15%;" />		
								<col style="width: 15%;" />		
<%-- 								<col style="width: 15%;" />		 --%>
								<col style="width: 15%;" />		
							</colgroup>
							<thead>
								<tr>
									<th scope="col">상품코드</th>
<!-- 									<th scope="col">상품명</th> -->
									<th scope="col">판매 상태</th>
									<th scope="col">등록일</th>
<!-- 									<th scope="col">순서</th> -->
									<th scope="col">관리</th>
								</tr>
							</thead>
							<tbody id="addVod_TargetLIVE">
										<tr class="noValue">
											<td colspan="11">등록된 내용이 없습니다.</td>
										</tr>
							</tbody>
						</table>
					</div>
				</td>
			</tr>						
		</tbody>
	</table>
</div>



<div class="btn_wrap" style="text-align: right;">
	<a href="${ unit.move('index', '') }" class="btn btn-md btn-outline-dark">목록</a>
	<a onclick="fn_BtnRegist();" class="btn btn-md btn_key_color">저장</a>
</div>


<style>
		.wd150{width: 130px;}
		
		#searchVod{
			padding: 20px 10px;
			border: 2px solid #222;
		}
		#searchVod span{
			display: inline-block;
    		width: 19%;  
    		font-weight: bold;
    	}
		#searchVod input{
			display: inline-block;
    		width: 80%;  
    	}
		#search_vod_Target td{
    		padding: 0!important;  
    	}
    	#searchVod .btn_wrap{
    		padding: 10px 0 0 0;
    	}
    	
		#addVod_Target input { margin: auto; }
    	
    	.btn-dark{
    		color: #fff;
    		background-color: #343a40;
   			border-color: #343a40;
   		}
</style>

<!-- 데이타 삭제 -->
<div id="search_vod" class="alert_wrap">
	<div class="alert_layer">
		<div class="alert_inner">
			<div class="alert_header">
				<h4 style="position: absolute; top: 10px; left: 30px;"><b id="titleTarget">상품추가 팝업</b></h4>
				<button class="btn btn_close_pop" style="display: block; top: 5px; right: 5px; border: none;" data-action="popup_hide"></button>
			</div>				
			<div class="dialog_content">
				<div class="scroll_area">
					<!-- Start 팝업 컨텐츠 -->
					<div id="searchVod" class="mb30">
						<div class="form-inline">
							<span>상품코드</span><input type="text" name="selectVodSearch" class="form-control form-control-sm col-8"  onkeypress="if(event.keyCode==13){fn_BtnFindVod('search');}"/>
						</div>
						<div class="form-inline">
							<span>분야</span>
								<select id="PARENT_CODE_ID" name="PARENT_CODE_ID" class="form-control form-control-sm col-8" >
									<option value="">선택해주세요.</option>
								</select>
						</div>
						<div class="form-inline">
							<span>분야상세</span>
								<select id="CODE_ID" name="CODE_ID" class="form-control form-control-sm col-8">
									<option value="">분야를 선택해주세요</option>
								</select>
						</div>
						<div class="form-inline">
							<div class="btn_wrap" style="display: inline; marign-left:5px;">
								<a class="btn  btn-md btn-dark" onclick="fn_BtnFindVod('search');">검색</a>
							</div>
						</div>
					</div>
	
					<div class="remark" style="font-size:13px; padding-bottom:7px; margin-left:0;">※ '한 구분'에 '한 상품'만 등록 가능합니다.</div>
					<div class="tbl_list" style="max-height: 450px; overflow: auto;">
						<table class="list_tbl01">
							<caption>동영상강좌 리스트 테이블</caption>
							<colgroup>
<%-- 								<col style="width: 10%;" /> --%>
								<col style="width: 15%;" />
								<col />
								<col style="width: 15%;" />			
								<col style="width: 15%;" />			
								<col style="width: 20%;" />
<%-- 								<col style="width: 15%;" />			 --%>
								<col style="width: 15%;" />			
							</colgroup>
							<thead>
								<tr>
									<th scope="col">
<!-- 										선택 -->
										<input type="checkbox" id="chk_all">
									</th>
<!-- 									<th scope="col">마스터명</th> -->
									<th scope="col">구분</th>
									<th scope="col">분야</th>
									<th scope="col">분야상세</th>
									<th scope="col">상품코드</th>
<!-- 									<th scope="col">상품명</th> -->
									<th scope="col">판매상태</th>
								</tr>
							</thead>
							<tbody id="search_vod_Target">
								<c:forEach begin="0" end="10" step="1">
									<tr>
										<td>
											<input type="checkbox" class="chk" name="chk">
										</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</c:forEach>	
							</tbody>
						</table>
					</div>
					<div class="pagination justify-content-center paging">
										<ul style="justify-content:space-between;" id="pagingVar">
										
										</ul>
					</div>
					<div class="btn_wrap" style="text-align: right;">
						<button type="button" onclick="fn_addVod();" class="btn  btn-md btn-outline-dark"  style="width:140px;">선택상품 추가</button>					
					</div>

					<!--// End 팝업 컨텐츠 -->
				</div>
			</div>
		</div>
	</div>
</div>




<!-- 조회 끝 -->	
<script>
var arr = ['LECT','FACE','CHAT','LIVE','MAIL'];
$(function(){

	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectMngMasterDetail";
	params.cateIdx = '${out.params.cateIdx }';
	fn_DataDetail( params );
	
	$.each(arr, function(k, v){
		 
		var params = new Object();
		params.CATE_IDX = '${out.params.cateIdx }';
		params.query = 'selectMngMasterSaleDataList';
		params.status = "LIST";
		params.masterTab = v;
		listJson = fn_DataAjax2( params );
		if ( listJson.out.detail.data.length > 0 ) {
			var htmlList = "";
			$('#addVod_Target'+v).empty();
			$.each(listJson.out.detail.data, function(key,val){
				htmlList += '<tr id="'+val[(v+'_CD')]+'">';
				htmlList += '		<td>'+val[(v+'_CD')]+'<input type="hidden" name="SALE_IDX" value="'+val.SALE_IDX+'" /><input type="hidden" name="'+v+'_IDX" value="'+val[(v+'_IDX')]+'" /></td>';
// 				html += '		<td>'+val[(v+'_NM')]+'</td>';
				htmlList += '		<td>'+val[(v+'_STAT_CD')]+'</td>';
				htmlList += '		<td>'+val.SYS_REG_DTM+'</td>';
// 				htmlList += '		<td><input type="text" name="ORDE" class="form-control form-control-sm col-8" value="'+val.SALE_ORDE+'"/></td>';
				htmlList += '		<td><a class="removeVod" title="'+v+'">삭제</a></td>';
				htmlList += '</tr>';
			});
			
			$('#addVod_Target'+v).append( htmlList );
			// 저장된 값 뿌려주기 end
		}	
	});
	
	
});

// 체크박스 껏다켰다
$('#chk_all').click(function(){
	if ( $('#chk_all').is(':checked') ) $('.chk').prop('checked', true);	
	else $('.chk').prop('checked', false);	
});

// 분야상세 값 변경
$("[name=PARENT_CODE_ID]").on('change',function(k){
	$('[name=CODE_ID]').empty();
	$('[name=CODE_ID]').append('<option value="">분야를 선택해주세요</option>');
	if( $(this).val() != '' ) fn_SelectOption($(this).val(), "CAT", "CODE_ID");
});
	
// // 체크박스 하나만 선택가능하게 
// $(document).on("click", '.chk', function(){
// 	$('.chk').prop('checked', false);	
// 	$(this).prop('checked', true);	
// });


var tabTemp = "";
function whatIsTab( tab ){
	if (tab == 'LECT'){
		tabTemp = "VOD";
		return "VOD";
	}
	else if (tab == 'FACE'){
		tabTemp = "1:1화상 상담";
		return "1:1화상 상담";
	}
	else if (tab == 'CHAT'){
		tabTemp = "1:1채팅 상담";
		return "1:1채팅 상담";
	}
	else if (tab == 'LIVE'){
		tabTemp = "라이브클래스";
		return "라이브클래스";
	}
	else if (tab == 'MAIL'){
		tabTemp = "1:1이메일 상담";
		return "1:1이메일 상담";
	}
	else
		return tabTemp;
}

// 팝업 데이터
let vodList = new Object;
var addList = [];

function fn_BtnFindVod( tab, pageNo ){

	if( $('[name=PARENT_CODE_ID]').val().length == 0 ) {
		fn_SelectOption("", "CAT", "PARENT_CODE_ID");
		$('[name=CODE_ID]').append('<option value="">분야를 선택해주세요</option>');
	}
	
	var htmlPopup = "";
	var listLengthTotal = 0;
	var listThisPage = 0;
	var params = unit_getParams('searchVod');
	
	params.query = 'selectMngMasterPopList';
	params.status = "PAGE";
	params.CATE_IDX = '${out.params.cateIdx }';
	params.PARENT_CODE_ID = $('[name=PARENT_CODE_ID]').val();
	params.CODE_ID = $('[name=CODE_ID]').val();
	
	$('#search_vod_Target > tr').remove();
	
	$.each(arr, function(key,val){
		
		params.masterTab = val;
		if( pageNo == -1 ) {
			if( $('#pagingActive').text() == '1') params.thisPage = 1;
			else params.thisPage = $('#pagingActive').text()*1 -1;
		}
		else if( pageNo == 0 ) params.thisPage = $('#pagingActive').text()*1 +1;
		else params.thisPage = pageNo;
		
		if (params.thisPage == 0 || params.thisPage == null || params.thisPage == "" || params.thisPage == undefined) params.thisPage = 1;
		
		var paging = fn_DataAjax2(params);
// 		$('#search_vod_Target').empty();
		vodList = paging.out.detail.data;
		addList.push(paging.out.detail.data);
		listThisPage = paging.out.detail.paging.thisPage;
		listLengthTotal += vodList.length;
		
		if( vodList.length ){
			$.each(  vodList, function(k, v){
				htmlPopup += '<tr>';
				htmlPopup += '	<td>';
	 			htmlPopup += '		<input type="checkbox" class="chk" name="chk">';
// 				htmlPopup += '<div class="designRadiobutton form-control-sm form-inline" >'; 
// 				htmlPopup += '<input type="radio" id="radio'+k+'" class="chk" name="chk" value="Y" checked />';
// 				htmlPopup += '<label for="radio'+k+'" class="label_txt"></label>';
// 				htmlPopup += '</div>';
				
				htmlPopup += '		<input type="hidden" name="targetVod" value="'+v.TAB_IDX+'">';
				htmlPopup += '	</td>';
//	 			htmlPopup += '	<td>'+v.MASTER_NM+'</td>';
				htmlPopup += '	<td>'+v.DIV+'</td>';
				htmlPopup += '	<td>'+v.PARENT_CODE_NM+'</td>';
				htmlPopup += '	<td>'+v.CODE_NM+'</td>';
				htmlPopup += '	<td>'+v.TAB_CD+'</td>';
//	 			htmlPopup += '	<td>'+v.TAB_NM+'</td>';
				htmlPopup += '	<td>'+v.TAB_STAT_CD+'</td>';
				htmlPopup += '</tr>';
			});
		}
		
		$('#search_vod_Target').append(htmlPopup);
		htmlPopup = '';

// 		var varHtml = "";	
// 		varHtml += '		<li><a id="pagingFirst" onclick="fn_BtnFindVod('+tab+','+ paging.out.detail.paging.prevStep +');"  aria-label="Previous"><i class="fa fa-angle-left"></i></a></li>   ';
		
// 		for (var i = paging.out.detail.paging.startPage; i <= paging.out.detail.paging.endPage; i++) {
// 			if (paging.out.detail.paging.thisPage == i) {
// 				varHtml += '<li><a id="pagingActive" onclick="fn_BtnFindVod('+tab+','+ i +');" class="active" style="cursor:pointer;">'+ i +'</a></li>   '
// 			}else{
// 				varHtml += '<li><a name="pagingPassiive" onclick="fn_BtnFindVod('+tab+','+ i +');" style="cursor:pointer;">'+ i +'</a></li>   ';
// 			}
// 		}
		
// 		varHtml += '		<li><a id="pagingLast" onclick="fn_BtnFindVod('+tab+','+ paging.out.detail.paging.nextStep +');"  aria-label="Next"><i class="fa fa-angle-right"></i></a></li>   ';
// 		$('#pagingVar').empty();
// 		$('#pagingVar').append( varHtml );
		
// 		else{
// 			var html = "";
// 			html += '<tr class="noValue">';
// 			html +=	'<td colspan="11">등록된 내용이 없습니다.</td>';
// 			html +=	'</tr>';
// 			$('#search_vod_Target').append(html);
// 		}
	});

	$('.chk').click(function(){
		if ( $('input[name="chk"]:checked').length == $('.chk').length ) $('#chk_all').prop("checked", true);
		else $('#chk_all').prop("checked", false);
	});
	
	var varHtml = "";	
	varHtml += '		<li><a id="pagingFirst" onclick="fn_BtnFindVod('+tab+',-1);"  aria-label="Previous"><i class="fa fa-angle-left"></i></a></li>   ';
	for (var i = 1; i <= (listLengthTotal/10)+1; i++) {
		if ( listThisPage == i ) varHtml += '<li><a id="pagingActive" onclick="fn_BtnFindVod('+tab+','+ i +');" class="active" style="cursor:pointer;">'+ i +'</a></li>   '
		else varHtml += '<li><a name="pagingPassiive" onclick="fn_BtnFindVod('+tab+','+ i +');" style="cursor:pointer;">'+ i +'</a></li>   ';
	}
	varHtml += '		<li><a id="pagingLast" onclick="fn_BtnFindVod('+tab+',0);"  aria-label="Next"><i class="fa fa-angle-right"></i></a></li>   ';
	
	$('#pagingVar').empty();
	$('#pagingVar').append( varHtml );
	
	if( $('#search_vod_Target > tr').length == 0 ) {
		var htmlPopupEmpty = "";
		htmlPopupEmpty += '<tr class="noValue">';
		htmlPopupEmpty +=	'<td colspan="11">등록된 내용이 없습니다.</td>';
		htmlPopupEmpty +=	'</tr>';
		$('#search_vod_Target').append(htmlPopupEmpty);
	}
}

// 붙여넣기
function fn_addVod(){
	var html = "";
	var overPrdtList = '';
	
	$('.chk').each(function(k){
		if ( $(this).is(':checked') ) {
			var chkVal = $('[name=targetVod]').eq(k).val();
			
			$.each(addList, function(keyParent,valParent){
				$.each(valParent, function(key,val){
					if( chkVal == val.TAB_IDX ) {
						var isc = true;
						if( val.TAB_CD.indexOf('VL') > -1) arrCdType = 'LECT';
						else if( val.TAB_CD.indexOf('FN') > -1) arrCdType = 'FACE';
						else if( val.TAB_CD.indexOf('CN') > -1) arrCdType = 'CHAT';
						else if( val.TAB_CD.indexOf('EN') > -1) arrCdType = 'MAIL';
						else if( val.TAB_CD.indexOf('LN') > -1) arrCdType = 'LIVE';
						
						$('#addVod_Target'+arrCdType+' tr').each(function(){
							if (this.id == val.TAB_CD) isc = false;
						});
						
						if ( $('#addVod_Target'+arrCdType+' tr').not('.noValue').length == 1 ) {
							if( val.TAB_CD.indexOf('VL') > -1) if( overPrdtList.indexOf('VOD') < 0 )overPrdtList += '[VOD]\n';
							if( val.TAB_CD.indexOf('FN') > -1) if( overPrdtList.indexOf('1:1 화상') < 0 ) overPrdtList += '[1:1 화상]\n';
							if( val.TAB_CD.indexOf('CN') > -1) if( overPrdtList.indexOf('1:1 채팅') < 0 ) overPrdtList += '[1:1 채팅]\n';
							if( val.TAB_CD.indexOf('EN') > -1) if( overPrdtList.indexOf('1:1 이메일') < 0 ) overPrdtList += '[1:1 이메일]\n';
							if( val.TAB_CD.indexOf('LN') > -1) if( overPrdtList.indexOf('LIVE CLASS') < 0 ) overPrdtList += '[LIVE CLASS]\n';
						}
						
						if ( isc ) {
							if( val.TAB_CD.length > 0 ) {
								html += '<tr id="'+val.TAB_CD+'">';
								html += '		<td>'+val.TAB_CD+'<input type="hidden" name="SALE_IDX" value="" /><input type="hidden" name="'+arrCdType+'_IDX" value="'+val.TAB_IDX+'" /></td>';//html += '		<td>'+val.TAB_NM+'</td>';
								html += '		<td>'+val.TAB_STAT_CD+'</td>';
								html += '		<td>'+val.SYS_REG_DTM+'</td>';
// 								html += '		<td><input type="text" name="ORDE" class="form-control form-control-sm col-8" /></td>';
								html += '		<td><a class="removeVod" >삭제</a></td>';
								html += '</tr>';
							}
						}
						isc = true;

						if ( $('#addVod_Target'+arrCdType+' tr.noValue').length == 1 ) {
							$('#addVod_Target'+arrCdType).empty();
							$('#addVod_Target'+arrCdType+'').append(html);
						}
						html = '';
					}
				});
			});
		}
	});
	
	if( overPrdtList != '' ) {
		alert( ''
				+ '※ "한 구분"에 "한 상품"만 등록 가능합니다.\n\n'
				+ '선택하신 상품 중, 아래의 상품에 대한 구분에는\n'
				+ '이미 등록된 상품이 있습니다.\n\n'
				+ overPrdtList +''
			);
	}
}

// 삭제
$(document).on("click",'.removeVod',function(k){
	if( confirm('정말로 삭제하시겠습니까?') ){
		
		var params = new Object();
		params.status = "EDIT";
		params.SALE_IDX = $(this).closest('tr').find('input[name=SALE_IDX]').val();
		params.query = "deleteMngMasterSaleData";
		params.masterTab = this.title;
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		var result = fn_DataAjax2( params );
		
		var htmlRemoveVod = "";
		if ( $(this).closest('tbody').find('tr').length == 1 ) {
			htmlRemoveVod += '<tr class="noValue">';
			htmlRemoveVod +=	'<td colspan="11">등록된 내용이 없습니다.</td>';
			htmlRemoveVod +=	'</tr>';
			$(this).closest('tbody').append( htmlRemoveVod );
		}
		
		$(this).closest('tr').remove();
	}
});

function fn_BtnRegist(){
		
// 		var ordeChk = false;
// 		$('[name=ORDE]').each(function(k){
// 			if ( $(this).val().trim() == '' || $(this).val().trim() == null ) {
// 				ordeChk = true;
// 				return ;
// 			}
// 		});
		
// 		if (ordeChk) return alert('순서를 전부 입력해 주세요.');
		
		var params = new Object();
		params.status = "WRITE";
		params.query = "insertMngMasterSaleData";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		params.CATE_IDX = '${out.params.cateIdx }';
		
		$.each(arr, function(k, v){
			params.MASTER_TAB = v;
			$('#addVod_Target'+v+' tr').not('.noValue').each(function(c){
				params.MASTER_TAB_IDX = $(this).find('input[name='+v+'_IDX]').val();
				params.SALE_IDX = $(this).find('input[name=SALE_IDX]').val();
// 				params.SALE_ORDE = $(this).find('input[name=ORDE]').val();
				var result = fn_DataAjax2( params );
			});
		});
		
		location.href='${unit.move("index", "" )}';
}

</script>
