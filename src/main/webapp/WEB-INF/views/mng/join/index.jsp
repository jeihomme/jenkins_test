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
			<col />
			<col style="width: 5%;" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">기간</th>
				<td>
					<input type="hidden" name="searchRange" value="${out.params.searchRange}">
					<button class="btn btn-light <c:if test="${out.params.searchRange eq '' or out.params.searchRange eq null}">btn-grayblack</c:if>  ml11 form-control-sm" onclick="$('[name=searchRange]').val('');$('[name=timeDtmSrt]').val('${sysDateValue}');$('[name=timeDtmEnd]').val('${sysDateValue}');fn_BtnSearch();" >오늘</button>
					<button class="btn btn-light <c:if test="${out.params.searchRange eq 'WEEK'}">btn-grayblack</c:if>  ml11 form-control-sm" onclick="$('[name=searchRange]').val('WEEK');$('[name=timeDtmSrt]').val('${agoDateValue}');$('[name=timeDtmEnd]').val('${yesterDateValue}');fn_BtnSearch();" >최근 7일</button>
					<button class="btn btn-light <c:if test="${out.params.searchRange eq 'MONTH'}">btn-grayblack</c:if>  ml11 form-control-sm" onclick="$('[name=searchRange]').val('MONTH');$('[name=timeDtmSrt]').val(getMonthDate());$('[name=timeDtmEnd]').val('${yesterDateValue}');fn_BtnSearch();" >최근 1개월</button>
					<button class="btn btn-light <c:if test="${out.params.searchRange eq 'ALL'}">btn-grayblack</c:if>  ml11 form-control-sm" onclick="$('[name=searchRange]').val('ALL');$('[name=timeDtmSrt]').val('');$('[name=timeDtmEnd]').val('');fn_BtnSearch();" >전체</button>
					<input id="timeDtmSrt" name="timeDtmSrt" readonly="readonly" onChange="inputDateComparison(this, 'timeDtmSrt', 'timeDtmEnd' );" onclick="$('[name=searchRange]').val('SEARCH');" type="text" class="form-control form-control-sm datepicker " value="<c:if test="${out.params.timeDtmSrt ne null}">${out.params.timeDtmSrt}</c:if>"  style="width:20%;display: inline-block;"/>
					<span style="padding: 8px;display: inline-block;">~</span>
					<input id="timeDtmEnd" name="timeDtmEnd" readonly="readonly" onChange="inputDateComparison(this, 'timeDtmSrt', 'timeDtmEnd' );" onclick="$('[name=searchRange]').val('SEARCH');" type="text" class="form-control form-control-sm datepicker " value="<c:if test="${out.params.timeDtmEnd ne null}">${out.params.timeDtmEnd}</c:if>"  style="width:20%;display: inline-block;" /> 
				</td>
				<td rowspan="2"><a id="btnSearch" onClick="fn_BtnSearch();" class="btn btn-md btn-black">검색</a></td>
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
			 params.query = "selectMngJoinList";
			 params.searchRange = $('[name=searchRange]').val();
			 var jsonDetail = fn_DataAjax2( params );
			
			 jsonDetail = jsonDetail.out.detail.data

		      var chartArray = [];
		      var chartInnerArray = ['date','JOIN_CNT','JOIN_SLEE_CNT','JOIN_DEL_CNT'];
		      $.each( jsonDetail, function( k, v ){
// 		    	if (k == 0) { chartArray.push( chartInnerArray );    }
		      	chartInnerArray = [];
		      	chartInnerArray.push( v.MAIN_DTM );
		      	chartInnerArray.push( 1* v.JOIN_CNT );
		      	chartInnerArray.push( 1*v.JOIN_SLEE_CNT );
		      	chartInnerArray.push( 1*v.JOIN_DEL_CNT );
		      	chartArray.push( chartInnerArray );   	  
		      });
		      
// 		      var data = google.visualization.arrayToDataTable( chartArray ); 
		      var data = new google.visualization.DataTable();
		      data.addColumn('string', '일수');
		      data.addColumn('number', '가입수');
		      data.addColumn('number', '휴면수');
		      data.addColumn('number', '탈퇴수');

		      data.addRows( chartArray );

		      var options = {
		    		  series: {
		    	          0: {curveType: 'function'}
		    	        },
		    	        hAxis: {
		    	            format: 'yy/M/d',
		    	            gridlines: {count: jsonDetail.length}
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
		<span class="listCount" style="display:inline-block;">전체 <span style="color:#ff8939;"><span style="color:#ff8939">${out.list.paging.totalCnt }</span></span></span>		
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
		<caption>가입 통계 리스트 테이블</caption>
		<colgroup>
			<col style="width: 10%;" />	
			<col style="width: 5%;" />				
			<col style="width: 10%;" />			
			<col style="width: 10%;" />			
			<col style="width: 10%;" />		
			<col style="width: 10%;" />		
			<col>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">일자</th>
				<th scope="col">요일</th>
				<th scope="col">누적 회원수</th>
				<th scope="col">가입</th>
				<th scope="col">휴면</th>
				<th scope="col">탈퇴</th>
				<th scope="col">이슈사항</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${not empty out.list.data[0].ALL_JOIN_CNT }">
			<tr>
				<td>총합</td>
				<td> - </td>
				<td>${out.list.data[0].ALL_JOIN_CNT - out.list.data[0].ALL_JOIN_DEL_CNT }</td>
				<td>${out.list.data[0].ALL_JOIN_CNT }</td>
				<td>${out.list.data[0].ALL_JOIN_SLEE_CNT }</td>
				<td>${out.list.data[0].ALL_JOIN_DEL_CNT }</td>
				<td > - </td>
			</tr>
			</c:if>
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row">
					<tr>
						<td>${row.MAIN_DTM }</td>
						<td>${ row.WDAY }</td>
						<td>${ row.NOW_USERS }</td>
						<td>
							${row.JOIN_CNT }
							<c:if test="${empty row.JOIN_CNT }">-</c:if>
						</td>
						<td>
							${row.JOIN_SLEE_CNT }
							<c:if test="${empty row.JOIN_SLEE_CNT }">-</c:if>
						</td>
						<td>
							${row.JOIN_DEL_CNT }
							<c:if test="${empty row.JOIN_DEL_CNT }">-</c:if>
						</td>
						<c:set var="newLine" value="\n"/>
						<td class="issu_area" issu-idx="<c:if test = "${empty row.JOIN_IDX}">0</c:if><c:if test = "${not empty row.JOIN_IDX}">${row.JOIN_IDX}</c:if>" >${row.JOIN_ISSU} </td>
					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="9">등록된 내용이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
	<c:set value="${out.list.paging}"  var="paging" />
	<%@ include file="/WEB-INF/views/shared/mng_paging.jspf" %>
<style type="text/css">
	.issu_area{ text-align: left!important; }
	.issu_area textarea{width: 100%;}
</style>
<script type="text/javascript">

function getMonthDate(){
	var date = new Date();
	date.setMonth( date.getMonth()-1 );
	return date.getFullYear() + '-' + ('0'+(date.getMonth()+1)).slice(-2) + '-' +('0'+date.getDate()).slice(-2);
}
//////////////////////////////////////////////////////////
// 1. 변수 초기화
//////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////
// 2. 첫 실행 함수
//////////////////////////////////////////////////////////
var issu_idx = null;

// 이슈사항
$(document).on('click','.issu_area',function(){
//     console.log(event.target);
//     console.log( event.currentTarget);
	const issuTemp = $(this).attr('issu-idx');
	if ( issu_idx != null ) {
		if ( issu_idx != issuTemp ) {
			const issuVal = $('.issu_area[issu-idx='+issu_idx+'] textarea').val();
			// 가장 최근에 누른 issu_area의 textarea를 찾아 그 값을 db에 업데이트 
			if ( issuVal != undefined ) {

				$('.issu_area[issu-idx='+issu_idx+']').html( issuVal.replace(/\n/g,"<br/>") );
				var params = new Object();
				params.query = "updateMngJoinIssuData";
				params.status ="WRITE";
				params.JOIN_ISSU = issuVal;
				params.JOIN_IDX = issu_idx;
				params.mngLoginIdx = localStorage.getItem('mngLoginIdx');
				
				fn_DataAjax2(params);
				
				if ( issu_idx == 0 ) {
					var params = new Object();
					params.query = "selectNearIssuDataIdx";
					params.status = "DETAIL";
					params.JOIN_ISSU = issuVal2;
					params.mngLoginIdx = localStorage.getItem('mngLoginIdx');
					var detail = fn_DataAjax2(params);
					$('.issu_area[issu-idx='+issu_idx+']').attr( 'issu-idx',detail.out.detail.data[0].JOIN_IDX );
				}
				
				issu_idx = null;
			}
		}
	}
	
	if ( issu_idx != issuTemp ) {
		issu_idx = issuTemp;
		console.log(  $(this).text());
		$(this).html( '<textarea>'+$(this).html().replace(/<br>/g,"\n")+'</textarea>' );
	}
	
});

var body = document.querySelector("body");
body.addEventListener('click', clickBodyEvent);
// issu_area를 제외한 화면 클릭시 동작 
function clickBodyEvent(event) {
    var target = event.target;
//     console.log( target.tagName );
// 	console.log($(target));
	// issu_idx 가 있고
	if ( issu_idx != null ) {
		// 클릭한 태그가 TEXTAREA, INPUT 아니면서
		if(target.tagName != 'TEXTAREA' && target.tagName != 'INPUT'){
			// 클릭한 태그가 issu_area를 클래스로 가지지 않는다면
		    if( target.className.indexOf('issu_area') == -1 ){
		    	
				var issuVal2 = $('.issu_area[issu-idx='+issu_idx+'] textarea').val();
				// 가장 최근에 누른 issu_area의 textarea를 찾아 그 값을 db에 업데이트 
				if ( issuVal2 != undefined ) {
					
					$('.issu_area[issu-idx='+issu_idx+']').html( issuVal2.replace(/\n/g,"<br/>") );
					
					var params = new Object();
					params.query = "updateMngJoinIssuData";
					params.status ="WRITE";
					params.JOIN_ISSU = issuVal2;
					params.JOIN_IDX = issu_idx;
					params.mngLoginIdx = localStorage.getItem('mngLoginIdx');
					
					fn_DataAjax2(params);
					
					if ( issu_idx == 0 ) {
						var params = new Object();
						params.query = "selectNearIssuDataIdx";
						params.status = "DETAIL";
						params.JOIN_ISSU = issuVal2;
						params.mngLoginIdx = localStorage.getItem('mngLoginIdx');
						var detail = fn_DataAjax2(params);
						$('.issu_area[issu-idx='+issu_idx+']').attr( 'issu-idx',detail.out.detail.data[0].JOIN_IDX );
					}
					
					issu_idx = null;
				}
		    }
		}
	}
	
}

//////////////////////////////////////////////////////////
//3. 사용자 함수
//////////////////////////////////////////////////////////
	
</script>



