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
			<col style="width: 35%;" />	
			<col style="width: 10%;" />
			<col style="width: 35%;" />
			<col style="width: 5%;" />
			<col />					
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">기간</th>
				<td colspan="3">
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
				<th scope="row">마스터</th>
				<td>
					<div class="form-inline">
						<select id="MASTER_NM" name="MASTER_NM" class="form-control form-control-sm col-8" title="마스터" >
							<option value="">-- 구분 --</option>
						</select>
					</div>				
				</td>
			</tr>			
			<tr style="height:50px;">
				<th scope="row">서비스유형</th>
				<td colspan="3">
					<div class="form-inline">
						<select id="LIVE_ACAD_YN" name="LIVE_ACAD_YN" class="form-control form-control-sm col-2" title="서비스유형" style="display:none;">
							<option value="">전체</option>
							<option value="N">라이브클래스</option>
							<option value="Y">라이브아카데미</option>
						</select>
					</div>	
				</td>
			</tr>
			
		</tbody>
	</table>
</div>

<div>
	<span style="color:red;">*서비스유형 검색조건은 서비스구분의 [LIVE CLASS] 선택 시 활성됩니다.</span> 
</div>

<!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {packages: ['corechart', 'line']});
		google.charts.setOnLoadCallback(drawCurveTypes);		
		
		function drawCurveTypes() {
			 var params = unit_getParams('searchArea');
			 params.status = "LIST";
			 params.query = "selectMngSaleList";
			 params.searchRange = $('[name=searchRange]').val();
			 var jsonDetail = fn_DataAjax2( params );
			
			 jsonDetail = jsonDetail.out.detail.data

		      var chartArray = [];
		      var chartInnerArray = ['date','JOIN_CNT','JOIN_SLEE_CNT','JOIN_DEL_CNT'];
		      $.each( jsonDetail, function( k, v ){
// 		    	if (k == 0) { chartArray.push( chartInnerArray );    }
				if ( v.SALE_DTM != '총합' ) {
			      	chartInnerArray = [];
			      	chartInnerArray.push(v.SALE_DTM);
			      	chartInnerArray.push( 1* v.SALE_REAL_PAY );
	// 		      	chartInnerArray.push( 1*v.SALE_REFU_REFL );
	// 		      	chartInnerArray.push( 1*v.SALE_REFU_MONE );
			      	chartArray.push( chartInnerArray );   	  
				}
		      });
		      
		      console.log(chartArray);
// 		      var data = google.visualization.arrayToDataTable( chartArray ); 
		      var data = new google.visualization.DataTable();
		      data.addColumn('string', '일수');
		      data.addColumn('number', '실 결제금액');
// 		      data.addColumn('number', '취소/환불반영금액');
// 		      data.addColumn('number', '취소/환불금액');

		      data.addRows( chartArray );

		      var options = {
		    		  series: {
		    	          1: {curveType: 'function'}
		    	        },
		    	        hAxis: {
		    	            format: 'yy/M/d',
	    	            	gridlines: {count: chartArray.length}
// 		    	            viewWindowMode: 'pretty'
		    	          },
		              legend: { position: 'top', alignment:'center' },
		              width:'100%'
		      };

		      var chart = new google.visualization.LineChart(document.getElementById('chartDiv'));
		      chart.draw(data, options);
		      window.addEventListener('resize', drawCurveTypes, false);
		  }
		
	</script>
	<div id="chartDiv">
	
	</div>
	
<!-- 리스트  시작-->
	<div class="form-inline" style="display:flex; justify-content:space-between; padding-bottom:10px; margin-top: 30px;">	
		<span class="listCount" style="display:inline-block;">전체 <span class="ppm_key_color">${out.list.paging.totalCnt }</span><span id="searchData" style="margin-left: 20px;"></span></span>		
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
			<col />		
			
			<col style="width: 3%;" />	
			<col style="width: 5%;">
			<col style="width: 7%;" />				
			<col style="width: 7%;" />			
			<col style="width: 7%;" />		
				
<%-- 			<col style="width: 7%;" />		 --%>
			<col style="width: 7%;" />				
			<col style="width: 7%;" />			
			<col style="width: 6%;" />			
			<col style="width: 6%;" />		
			
			<col style="width: 6%;" />	
			<col style="width: 7%;" />			
			<col style="width: 6%;" />			
			<col style="width: 6%;" />			
			<col style="width: 6%;" />			
		</colgroup>
		<thead>
			<tr>
				<th scope="col">일자</th>
				
				<th scope="col">요일</th>
				<th scope="col">실 결제<br>건수</th>
				<th scope="col">실 결제<br>금액</th>
				<th scope="col">결제건수</th>
				<th scope="col">결제금액</th>

<!-- 				<th scope="col">취소/환불<br>반영금액</th> -->
				<th scope="col">취소/환불<br>건수</th>
				<th scope="col">취소/환불<br>금액</th>
				<th scope="col">VOD강좌</th>
				<th scope="col">라이브클래스<br>TOTAL</th>
				
				<th scope="col">라이브클래스</th>
				<th scope="col">라이브아카데미</th>
				<th scope="col">화상</th>
				<th scope="col">채팅</th>
				<th scope="col">이메일</th>
				
				
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row">
					<tr>
						<td>${row.SALE_DTM }</td>
						
						<td>${row.WDAY }</td>
						<td>${row.SALE_REAL_PAY_CNT }</td>
						<td>${row.SALE_REAL_PAY }</td>
						<td>${row.SALE_PAY_CNT }</td>
						<td>${row.SALE_PAY }</td>

<%-- 						<td>${row.SALE_REFU_REFL }</td> --%>
						<td>${row.SALE_REFU_CNT }</td>
						<td>${row.SALE_REFU_MONE }</td>
						
						<c:choose>
							<c:when test="${out.params.saleServType eq 'PRD02' || out.params.saleServType eq 'PRD03' || out.params.saleServType eq 'PRD04' || out.params.saleServType eq 'PRD05'  }">
								<td>0</td>
							</c:when>
							<c:otherwise>
								<td>${row.SALE_REAL_VOD }</td>
							</c:otherwise>
						</c:choose>
					
						<c:choose>
							<c:when test="${out.params.saleServType eq 'PRD02' || out.params.saleServType eq 'PRD03' || out.params.saleServType eq 'PRD04' || out.params.saleServType eq 'PRD06' || out.params.liveAcadYn ne '' }">
								<td>0</td>
							</c:when>
							<c:otherwise>
								<td>${row.SALE_REAL_LIVE_TOTAL }</td>
							</c:otherwise>
						</c:choose>
					
						<c:choose>
							<c:when test="${out.params.saleServType eq 'PRD02' || out.params.saleServType eq 'PRD03' || out.params.saleServType eq 'PRD04' || out.params.saleServType eq 'PRD06' || out.params.liveAcadYn ne 'N' }">
								<td>0</td>
							</c:when>
							<c:otherwise>
								<td>${row.SALE_REAL_LIVE }</td>
							</c:otherwise>
						</c:choose>
					
						<c:choose>
							<c:when test="${out.params.saleServType eq 'PRD02' || out.params.saleServType eq 'PRD03' || out.params.saleServType eq 'PRD04' || out.params.saleServType eq 'PRD06' || out.params.liveAcadYn ne 'Y' }">
								<td>0</td>
							</c:when>
							<c:otherwise>
								<td>${row.SALE_REAL_LIVE_ACAD }</td>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${out.params.saleServType eq 'PRD05' || out.params.saleServType eq 'PRD02' || out.params.saleServType eq 'PRD04' || out.params.saleServType eq 'PRD06'  }">
								<td>0</td>
							</c:when>
							<c:otherwise>
								<td>${row.SALE_REAL_FACE }</td>
							</c:otherwise>
						</c:choose>
					
						<c:choose>
							<c:when test="${out.params.saleServType eq 'PRD05' || out.params.saleServType eq 'PRD03' || out.params.saleServType eq 'PRD04' || out.params.saleServType eq 'PRD06'  }">
								<td>0</td>
							</c:when>
							<c:otherwise>
								<td>${row.SALE_REAL_CHAT }</td>
							</c:otherwise>
						</c:choose>
					
						<c:choose>
							<c:when test="${out.params.saleServType eq 'PRD05' || out.params.saleServType eq 'PRD03' || out.params.saleServType eq 'PRD02' || out.params.saleServType eq 'PRD06'  }">
								<td>0</td>
							</c:when>
							<c:otherwise>
								<td>${row.SALE_REAL_MAIL }</td>
							</c:otherwise>
						</c:choose>
					
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

	<c:set value="${out.list.paging}"  var="paging" />
	<%@ include file="/WEB-INF/views/shared/mng_paging.jspf" %>
<%-- 	<div class="col-4 btn_pagination" style="margin: 29px 0 0; float: right"><a href='${unit.move("write", "" )}' class="btn btn-md btn_key_color">신규등록</a></div>  --%>



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
	if( '${out.params.saleServType }' == 'PRD05') {
		$('#LIVE_ACAD_YN').show();
		$("[name=LIVE_ACAD_YN]").val('${out.params.liveAcadYn }');
	}
	
	if ('${out.params.parentCodeId }' != '') {
		fn_SelectOption('${out.params.parentCodeId }', "CAT", "CODE_ID");
		$('#CODE_ID').val('${out.params.codeId }');
	}
// 	fn_SelectOption("CAT01","CAT","testSelect");
	$('[name=SALE_SERV_TYPE] option[value="PRD01"]').remove();
	
	var searchData = '';
	
	if ( '${out.params.parentCodeId }' != '' ) {
		searchData += ' #'+$('#PARENT_CODE_ID option:selected').text();
	}
	if ( '${out.params.codeId }' != '' ) {
		searchData += ' #'+$('#CODE_ID option:selected').text();
	}
	if ( '${out.params.saleServType}' != '' ) {
		searchData += ' #'+$('#SALE_SERV_TYPE option:selected').text();
	}
	if ( '${out.params.masterNm}' != '' ) {
		searchData += ' #'+$('#MASTER_NM option:selected').text();
	}
	
	$('#searchData').text( searchData );
	$('#searchData').css('font-weight','bold');
	
	$('.list_tbl01 > tbody > tr > td').each(function(key,val){
		if( key%15 > 2 ) $(this).text( numberWithCommas( $(this).text() ) );
	});
});

$("[name=PARENT_CODE_ID]").on('change',function(k){
	fn_SelectOption($(this).val(), "CAT", "CODE_ID");
});

// 라이브아카데미 조건추가
$("[name=SALE_SERV_TYPE]").on('change',function(k){
	$("[name=LIVE_ACAD_YN]").val('');
	if( $(this).val() == 'PRD05') $('#LIVE_ACAD_YN').show();
	else $('#LIVE_ACAD_YN').hide();
});

//////////////////////////////////////////////////////////
//3. 사용자 함수
//////////////////////////////////////////////////////////
function getMonthDate(){
	var date = new Date();
	date.setMonth( date.getMonth()-1 );
	return date.getFullYear() + '-' + ('0'+(date.getMonth()+1)).slice(-2) + '-' +('0'+date.getDate()).slice(-2);
}

$('#today').on('click',function(){
	var params = new Object();
	params.status = "TODAY_SALE";
	params.query = "updateFrontTodayStatSaleData";
	fn_DataAjax2(params);
});
</script>



