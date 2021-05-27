<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="yesterDay" value="<%=new java.util.Date(new java.util.Date().getTime() - 60*60*24*1000*1)%>" />
<c:set var="aweekago" value="<%=new java.util.Date(new java.util.Date().getTime() - 60*60*24*1000*7)%>" />
<c:set var="sysDateValue"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
<c:set var="yesterDateValue"><fmt:formatDate value="${yesterDay}" pattern="yyyy-MM-dd" /></c:set>
<c:set var="agoDateValue"><fmt:formatDate value="${aweekago}" pattern="yyyy-MM-dd" /></c:set>
<style>
#btnSearch:hover{	color: white!important;}
</style>
<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>관리자 리스트 조회</caption>
		<colgroup>
			<col style="width: 10%;" />
			<col style="width: 20%;" />	
			<col style="width: 10%;" />
			<col style="width: 20%;" />
			<col style="width: 10%;" />
			<col style="width: 20%;" />
			<col style="width: 5%;" />
			<col />					
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">기간</th>
				<td colspan="5">
					<input type="hidden" name="searchRange" value="${out.params.searchRange}">
					<button id="today" class="btn btn-light <c:if test="${out.params.searchRange eq '' or out.params.searchRange eq null}">btn-grayblack</c:if>  ml11 form-control-sm" onclick="$('[name=searchRange]').val('');$('[name=timeDtmSrt]').val('${sysDateValue}');$('[name=timeDtmEnd]').val('${sysDateValue}');fn_BtnSearch();" >오늘</button>
					<button class="btn btn-light <c:if test="${out.params.searchRange eq 'WEEK'}">btn-grayblack</c:if>  ml11 form-control-sm" onclick="$('[name=searchRange]').val('WEEK');$('[name=timeDtmSrt]').val('${agoDateValue}');$('[name=timeDtmEnd]').val('${yesterDateValue}');fn_BtnSearch();" >최근 7일</button>
					<button class="btn btn-light <c:if test="${out.params.searchRange eq 'MONTH'}">btn-grayblack</c:if>  ml11 form-control-sm" onclick="$('[name=searchRange]').val('MONTH');$('[name=timeDtmSrt]').val(getMonthDate());$('[name=timeDtmEnd]').val('${yesterDateValue}');fn_BtnSearch();" >최근 1개월</button>
					<button class="btn btn-light <c:if test="${out.params.searchRange == 'ALL'}">btn-grayblack</c:if>  ml11 form-control-sm" onclick="$('[name=searchRange]').val('ALL');$('[name=timeDtmSrt]').val('');$('[name=timeDtmEnd]').val('');fn_BtnSearch();" >전체</button>
					<input id="timeDtmSrt" name="timeDtmSrt" readonly="readonly" onChange="inputDateComparison(this, 'timeDtmSrt', 'timeDtmEnd' );" onclick="$('[name=searchRange]').val('SEARCH');" type="text" class="form-control form-control-sm datepicker " value="<c:if test="${out.params.timeDtmSrt ne null}">${out.params.timeDtmSrt}</c:if>"  style="width:20%;display: inline-block;"/>
					<span style="padding: 8px;display: inline-block;">~</span>
					<input id="timeDtmEnd" name="timeDtmEnd" readonly="readonly" onChange="inputDateComparison(this, 'timeDtmSrt', 'timeDtmEnd' );" onclick="$('[name=searchRange]').val('SEARCH');" type="text" class="form-control form-control-sm datepicker " value="<c:if test="${out.params.timeDtmEnd ne null}">${out.params.timeDtmEnd}</c:if>"  style="width:20%;display: inline-block;" /> 
				</td>
				<td rowspan="4"><a id="btnSearch" onClick="fn_BtnSearch();" class="btn btn-md btn-black">검색</a></td>
			</tr>
			<tr>
				<th scope="row">분야</th>
				<td>
					<div class="form-inline">
						<select id="PARENT_CODE_ID" name="PARENT_CODE_ID" class="form-control form-control-sm col-8" title="분야" >
							<option value="">-- 구분 --</option>
						</select>
					</div>				
				</td>
				<th scope="row">분야상세</th>
				<td>
					<div class="form-inline">
						<select id="CODE_ID" name=CODE_ID class="form-control form-control-sm col-8" title="분야상세" >
							<option value="">-- 구분 --</option>
						</select>
					</div>	
				</td>
				<th scope="row">마스터</th>
				<td>
					<div class="form-inline">
						<select id="MASTER_NM" name="MASTER_NM" class="form-control form-control-sm col-8" title="마스터" >
							<option value="">-- 구분 --</option>
						</select>
					</div>				
				</td>
			</tr>	
			<tr>
				<th scope="row">서비스구분</th>
				<td>
					<div class="form-inline">
						<select id=SALE_SERV_TYPE name="SALE_SERV_TYPE" class="form-control form-control-sm col-8" title="서비스구분" >
							<option value="">-- 구분 --</option>
						</select>
					</div>	
				</td>
				<th scope="row">상품명</th>
				<td colspan="3">
					<div class="form-inline">
						<input id="PRDT_NM" name="PRDT_NM" type="text" class="form-control form-control-sm col-10" title="상품"  >
					</div>				
				</td>
			</tr>
			<tr id="LIVESHOW" style="display: none;">
				<th scope="row">서비스유형</th>
				<td>
					<div class="form-inline">
						<select id=SALE_LIVE_TYPE name="SALE_LIVE_TYPE" class="form-control form-control-sm col-8" title="서비스유형" >
							<option value="">전체</option>
							<option value="L1">LIVE CLASS</option>
							<option value="L2">LIVE ACADEMY</option>
						</select>
					</div>	
				</td>
				<td colspan="3" style="border-left: none;"></td>
			</tr>					
		</tbody>
	</table>
</div>

<!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {packages: ['corechart', 'line']});
		google.charts.setOnLoadCallback(drawCurveTypes);		
		
		function drawCurveTypes() {
			 var params = unit_getParams('searchArea');
			 params.status = "LIST";
			 params.query = "selectMngPrdtList_chart";
			 params.searchRange = $('[name=searchRange]').val();
			 var jsonDetail = fn_DataAjax2( params );
			
			 if ( jsonDetail.out.detail.data.length > 0 ) {
			 
				 jsonDetail = jsonDetail.out.detail.data
			      var chartArray = [];
			      var chartInnerArray = ['date','JOIN_CNT','JOIN_SLEE_CNT','JOIN_DEL_CNT'];
			      $.each( jsonDetail, function( k, v ){
	// 		    	if (k == 0) { chartArray.push( chartInnerArray );    }
			      	chartInnerArray = [];
			      	chartInnerArray.push(new Date( v.PRDT_DTM ));
			      	chartInnerArray.push( 1* v.PRDT_REAL_PAY );
	// 		      	chartInnerArray.push( 1*v.SALE_REFU_REFL );
	// 		      	chartInnerArray.push( 1*v.SALE_REFU_MONE );
			      	chartArray.push( chartInnerArray );   	  
			      });
			      
			      console.log(chartArray);
	// 		      var data = google.visualization.arrayToDataTable( chartArray ); 
			      var data = new google.visualization.DataTable();
			      data.addColumn('datetime', '일수');
			      data.addColumn('number', '실 결제금액');
	// 		      data.addColumn('number', '취소/환불반영금액');
	// 		      data.addColumn('number', '취소/환불금액');
	
			      data.addRows( chartArray );
	
			      var options = {
			    		  series: {
			    	          1: {curveType: 'function'}
			    	        },
			    	        hAxis: {
			    	            format: 'yy/M/d'
	// 		    	            viewWindowMode: 'pretty'
			    	          },
			              legend: { position: 'bottom' },
			              width:'100%'
			      };
	
			      var chart = new google.visualization.LineChart(document.getElementById('chartDiv'));
			      chart.draw(data, options);
			      window.addEventListener('resize', drawCurveTypes, false);
			      
			 }
		  }
		
 	</script> 
	<div id="chartDiv">
	
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
		<caption>관리자 리스트 테이블</caption>
		<colgroup>
			<col style="width: 7%;" />	
			<col style="width: 5%;" />				
			<col style="width: 5%;" />				
			<col>
			<col style="width: 5%;" />				
			<col style="width: 5%;" />				
			<col style="width: 7%;" />				
			<col style="width: 7%;" />				
			<col style="width: 7%;" />				
			<col style="width: 7%;" />				
			<col style="width: 3%;" />				
			<col style="width: 3%;" />				
			<col style="width: 3%;" />				
			<col style="width: 3%;" />				
			<col style="width: 7%;" />			
			<col style="width: 3%;" />			
			<col style="width: 3%;" />		
		</colgroup>
		<thead>
			<tr>
				<th scope="col">일자</th>
				<th scope="col">요일</th>
				<th scope="col">구분</th>
				<th scope="col">상품명</th>
				<th scope="col">마스터명</th>
				<th scope="col">회원명</th>
				<th scope="col">기간/수량</th>
				<th scope="col">결제수단</th>
				<th scope="col">결제금액</th>
				<th scope="col">취소/환불</th>
				<th scope="col">예약대기</th>
				<th scope="col">상담대기</th>
				<th scope="col">상담확정</th>
				<th scope="col">상담완료</th>
				<th scope="col">상담시간</th>
				<th scope="col">후기</th>
				<th scope="col">평점</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 1}">
					<c:forEach items="${out.list.data}" var="row" varStatus="vs">
					<tr>
						<td>
							<c:if test="${vs.index eq 0 }">총계</c:if>
							<c:if test="${vs.index ne 0 }">${row.PRDT_DTM }</c:if>
						</td>
						<td>${ row.PRDT_WEEK } </td>
						<td>${row.PRDT_TYPE }</td>
						<td>${row.PRDT_NM }</td>
						<td>${row.MASTER_NM }</td>
						<td>${row.USER_NM }</td>
						<td>${row.PRDT_TERM }</td>
						<td>${row.PRDT_PAY_TYPE }</td>
						<td>${row.PRDT_REAL_PAY }</td>
						<td>${row.PRDT_REFU }</td>
						<td>${row.PRDT_RESERVE_PREV }</td>
						<td>${row.PRDT_CONS_WAIT }</td>
						<td>${row.PRDT_CONS_CONF }</td>
						<td>${row.PRDT_CONS_COMP }</td>
						<td>${row.PRDT_CONS_TIME }</td>
						<td>${row.PRDT_REVI_CNT }</td>
						<td>${row.PRDT_GRAD }</td>
					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach items="${out.list.data}" var="row" varStatus="vs">
					<tr>
						<td>
							<c:if test="${vs.index eq 0 }">총계</c:if>
							<c:if test="${vs.index ne 0 }">${row.PRDT_DTM }</c:if>
						</td>
						<td>${ row.PRDT_WEEK } </td>
						<td>${row.PRDT_TYPE }</td>
						<td>${row.PRDT_NM }</td>
						<td>${row.MASTER_NM }</td>
						<td>${row.USER_NM }</td>
						<td>${row.PRDT_TERM }</td>
						<td>${row.PRDT_PAY_TYPE }</td>
						<td>${row.PRDT_REAL_PAY }</td>
						<td>${row.PRDT_REFU }</td>
						<td>${row.PRDT_RESERVE_PREV }</td>
						<td>${row.PRDT_CONS_WAIT }</td>
						<td>${row.PRDT_CONS_CONF }</td>
						<td>${row.PRDT_CONS_COMP }</td>
						<td>${row.PRDT_CONS_TIME }</td>
						<td>${row.PRDT_REVI_CNT }</td>
						<td>${row.PRDT_GRAD }</td>
					</tr>
					</c:forEach>
					<tr>
						<td colspan="20">등록된 내용이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>

	<c:set value="${out.list.paging}"  var="paging" />
	<%@ include file="/WEB-INF/views/shared/mng_paging.jspf" %>

<!-- <head> -->
<!--   <meta charset="utf-8"> -->
<!--   <meta name="google-signin-client_id" content="1014044573098-4trfs1qn5epan5qh9jti61umb1sqek0f.apps.googleusercontent.com"> -->
<!--   <meta name="google-signin-scope" content="https://www.googleapis.com/auth/analytics.readonly"> -->
<!-- </head> -->

<!-- <h1>Hello Analytics Reporting API V4</h1> -->

<!-- <p class="g-signin2" data-onsuccess="queryReports"></p> -->
<!-- <textarea cols="80" rows="20" id="query-output"></textarea> -->

<!-- <iframe src="https://analytics.google.com/"></iframe> -->
<!-- <script src="https://apis.google.com/js/api.js"></script> -->
  

<!-- <script src="https://apis.google.com/js/client:platform.js"></script> -->

<!-- <button onclick="btn()">눌러</button> -->
<script type="text/javascript">

//////////////////////////////////////////////////////////
// 1. 변수 초기화
//////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////
// 2. 첫 실행 함수
//////////////////////////////////////////////////////////
$(function(){
	fn_SelectOptionNotCode( 'selectMasterNameList', 'MASTER_NM');
	fn_SelectOption("", "PRD", "SALE_SERV_TYPE");
	fn_SelectOption("", "CAT", "PARENT_CODE_ID");
	$('#PARENT_CODE_ID').val('${out.params.parentCodeId}');
	$('#MASTER_NM').val('${out.params.masterNm}');
	
	$('#SALE_SERV_TYPE').val('${out.params.saleServType }');
	if ('${out.params.saleServType }' == 'PRD05') {
		$('#LIVESHOW').show();		
		$('#SALE_LIVE_TYPE').val('${out.params.saleLiveType }');
	}
	if ('${out.params.parentCodeId }' != '') {
		fn_SelectOption('${out.params.parentCodeId }', "CAT", "CODE_ID");
		$('#CODE_ID').val('${out.params.codeId }');
	}
// 	fn_SelectOption("CAT01","CAT","testSelect");
	$('[name=SALE_SERV_TYPE] option[value="PRD01"]').remove();
});

$("[name=PARENT_CODE_ID]").on('change',function(k){
	fn_SelectOption($(this).val(), "CAT", "CODE_ID");
});
$('[name=SALE_SERV_TYPE]').on('change',function(k){
	if (this.value == 'PRD05') {
		$('#LIVESHOW').show();		
		$('#SALE_LIVE_TYPE').val('');
	}else{
		$('#LIVESHOW').hide();		
	}
	
});

$('#today').on('click',function(){
	var params = unit_getParams('searchArea');
	 params.status = "TODAY_PRDT";
	 var jsonDetail = fn_DataAjax2( params );
});

//////////////////////////////////////////////////////////
//3. 사용자 함수
//////////////////////////////////////////////////////////
	
	
//   var VIEW_ID = '238000897';

//   function queryReports() {
//     gapi.client.request({
//       path: '/v4/reports:batchGet',
//       root: 'https://analyticsreporting.googleapis.com/',
//       method: 'POST',
//       body: {
//         reportRequests: [
//           {
//             viewId: VIEW_ID,
//             dateRanges: [
//               {
//                 startDate: '7daysAgo',
//                 endDate: 'today'
//               }
//             ],
//             metrics: [
//               {
//                 expression: 'ga:sessions'
//               }
//             ]
//           }
//         ]
//       }
//     }).then(displayResults, console.error.bind(console));
//   }

//   function displayResults(response) {
//     var formattedJson = JSON.stringify(response.result, null, 2);
//     document.getElementById('query-output').value = formattedJson;
//   }
function getMonthDate(){
	var date = new Date();
	date.setMonth( date.getMonth()-1 );
	return date.getFullYear() + '-' + ('0'+(date.getMonth()+1)).slice(-2) + '-' +('0'+date.getDate()).slice(-2);
}
</script>



