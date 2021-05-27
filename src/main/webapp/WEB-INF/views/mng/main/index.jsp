<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'index', 'ajax')}" />

<style>
html{font-size: 14px;}

.h6, h6 {
    font-size: 1rem;
}
.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
    margin-bottom: .5rem;
    font-weight: 500;
    line-height: 1.2;
}
.display-4 {
    font-size: 3.5rem;
    font-weight: 300;
    line-height: 1.2;
}
.text-write{
	color: white;
	font-weight: 500;
	line-height: 1.2;
}
.tbl_list{border:0px !important;}
table{border:0px !important;}
tbody{border:1px solid #ccc !important;}
tr{border:0px !important;}
th{border:0px !important;}
td{border:0px !important;}
table.list_tbl01 > thead > tr > th, table.list_tbl01 > thead > tr > td{height: 30px;}
/* table.list_tbl01 > tbody > tr > td:nth-child(1)  { text-align:left;padding-left:40px; } */
table.list_tbl01 > tbody > tr > td  { text-align:left;}
th.active{background-color: #337ab7;color:white;}

.adminDiv{display:none;}
.masterDiv{display:none;}



</style>

<div class="col main mt-3">
	<div class="row mb-3">
		<span class="loginedUser" style=""></span>
	</div>
	
	<div class="row mb-3">
	
		<div class="col-xl-6 col-sm-12 placeholder text-center adminDiv">
			<div class="title_wrap">
				<h4 class="floatL">플랫폼 전체현황 &nbsp;&nbsp;&nbsp;</h4>
			</div>
			<div class="tbl_list">
				<table class="list_tbl01 servTbl1" summary="" >
					<colgroup>	
						<col style="width: 7%;" />
						<col style="width: 7%;" />
						<col style="width: 7%;" />
						<col style="width: 7%;" />
						<col style="width: 7%;" />
						
						<col style="width: 7%;" />
						<col />
						<col />
						<col />
						<col />
					</colgroup>
					<thead>
						<tr>
							<th scope="col" onclick="fn_PlatformList( 1 );" style="cursor:pointer;">오늘</th>
							<th class="active" scope="col" onclick="fn_PlatformList( 2 );" style="cursor:pointer;">어제</th>
							<th scope="col" onclick="fn_PlatformList( 3 );" style="cursor:pointer;">지난 1주</th>
							<th scope="col" onclick="fn_PlatformList( 4 );" style="cursor:pointer;">지난 달</th>
							<th scope="col" onclick="fn_PlatformList( 5 );" style="cursor:pointer;">지난 1년</th>
							
							<th scope="col" style="background-color: white;"></th>
							<th scope="col" style="background-color: white;" class="saveTimeArea"></th>
							<th scope="col" style="background-color: white;" ></th>
							<th scope="col" style="background-color: white;" ></th>
							<th scope="col" style="background-color: white;"></th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		
		<div class="col-xl-6 col-sm-12 placeholder text-center adminDiv">
			<div class="tbl_list">
				<table class="list_tbl01" summary="" style="width: 70%;">
					<colgroup>	
						<col style="width: 15%;" />	
						<col style="width: 15%;" />
						<col style="width: 15%;" />
						<col style="width: 15%;" />
						<col style="width: 15%;" />
						
						<col />
						<col />
						<col />
						<col />
						<col />
					</colgroup>
					<tbody id="dataList1">
					</tbody>
				</table>
			</div>
		</div>
	
		<div class="col-xl-6 col-sm-12 placeholder text-center adminDiv">
			<div class="title_wrap">
				<h4 class="floatL">서비스 현황 &nbsp;&nbsp;&nbsp;</h4>
			</div>
			<div class="tbl_list">
				<table class="list_tbl01 servTbl2" summary="" >
					<colgroup>	
						<col style="width: 7%;" />
						<col style="width: 7%;" />
						<col style="width: 7%;" />
						<col style="width: 7%;" />
						<col style="width: 7%;" />
						
						<col style="width: 7%;" />
						<col />
						<col />
						<col />
						<col />
					</colgroup>
					<thead>
						<tr>
							<th scope="col" onclick="fn_ServiceList( 1 );" style="cursor:pointer;">오늘</th>
							<th class="active" scope="col" onclick="fn_ServiceList( 2 );" style="cursor:pointer;">어제</th>
							<th scope="col" onclick="fn_ServiceList( 3 );" style="cursor:pointer;">지난 1주</th>
							<th scope="col" onclick="fn_ServiceList( 4 );" style="cursor:pointer;">지난 달</th>
							<th scope="col" onclick="fn_ServiceList( 5 );" style="cursor:pointer;">지난 1년</th>
							
							<th scope="col" style="background-color: white;"></th>
							<th scope="col" style="background-color: white;"></th>
							<th scope="col" style="background-color: white;" class="saveTimeArea"></th>
							<th scope="col" style="background-color: white;"></th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		
		<div class="col-xl-6 col-sm-12 placeholder text-center adminDiv">
			<div class="tbl_list">
				<table class="list_tbl01" summary="" style="width: 80%;">
					<colgroup>	
						<col style="width: 15%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: 9%;" />
						
						<col style="width: 9%;" />
						<col style="width: 9%;" />
						<col style="width: 9%;" />
						<col style="width: 9%;" />
						<col style="width: 10%;" />
					</colgroup>
					<tbody id="dataList2">
					</tbody>
				</table>
			</div>
		</div>
	
		<div class="col-xl-6 col-sm-12 placeholder text-center masterDiv">
			<div class="title_wrap">
				<h4 class="floatL" style="    font-weight: bold !important;">마스터 상담 및 클래스 현황 &nbsp;&nbsp;&nbsp;</h4>
			</div>
			<div class="tbl_list" style="float: left;overflow:visible;width:30%;">
				<div class="title_wrap" style="    text-align: initial;">
					<div class="cnfnDiv" style="margin-top: 30px;padding-bottom:20px;">
						<h4>아직 확정되지 않은 상담이&nbsp;<a href="/mng/wait/index"><span>0</span>건</a>이 있습니다.</h4>
						<span>회원님께서 마스터님의 확정을 기다리고 있습니다.</span><br>
						<span>미확정시 , 원활한 상담이 이루어질 수 없으니,</span><br>
						<span>일자와 시간을 확인하시고 확정해주시기 바랍니다 .</span>
					</div>
					<div class="consDiv" style="margin-top: 30px;padding-bottom:20px;">
						<h4>금일 상담예정은&nbsp;<a href="/mng/wait/index"><span>0</span>건</a>입니다.</h4>
						<span>마스터님께서는 상담예정시간보다 조금 일찍</span><br>
						<span>상담시작버튼을 클릭하시고 대기해주시기 바랍니다.</span>
					</div>
					
					<div class="reviDiv" style="margin-top: 30px;padding-bottom:20px;">
						<h4>작성하실 마스터 후기는&nbsp;<a href="/mng/past/index"><span>0</span>건</a>입니다.</h4>
						<span>해당 상담이 끝나고 나면 , 간략하게 요약내용과 함께</span><br>
						<span>전하실 내용을 입력해주시면 됩니다.</span><br>
						<span>작성하신 내용은 회원의 인맥히스토리에 저장되어</span><br>
						<span>지속적으로 노출이 되므로 회원관리차원에서 </span><br>
						<span>좀더 친근한 마스터가 되실 수 있습니다. </span>
					</div>
				</div>
			</div>
			<div class="tbl_list" style="float: left;overflow:visible;width: 65%;">
				<table class="list_tbl01 servTbl3" summary="" >
					<colgroup>	
						<col style="width: 25%;" />
						<col style="width: 25%;" />
						<col style="width: 25%;" />
						<col />
						<col />
						
						<col />
						<col />
						<col />
						<col />
						<col />
					</colgroup>
					<thead>
						<tr>
							<th class="active" scope="col" onclick="fn_ConsultList( 1 );" style="cursor:pointer;">오늘</th>
							<th scope="col" onclick="location.href='/mng/wait/index';" style="cursor:pointer;">대기중인상담</th>
							<th scope="col" onclick="location.href='/mng/past/index';" style="cursor:pointer;">지난상담</th>
							<th scope="col" style="background-color: white;"></th>
							<th scope="col" style="background-color: white;"></th>
							
							<th scope="col" style="background-color: white;"></th>
							<th scope="col" style="background-color: white;"></th>
							<th scope="col" style="background-color: white;"></th>
							<th scope="col" style="background-color: white;"></th>
						</tr>
					</thead>
				</table>
				<table class="list_tbl01" summary="" >
					<caption>신규 회원 리스트 테이블</caption>
					<colgroup>	
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col />
						
						<col />
						<col />
						<col />
						<col />
						<col />
					</colgroup>
					<tbody id="dataList3">
					</tbody>
				</table>
			</div>
		</div>
		
	</div>
</div>
		
<!-- 리스트  끝-->

<script type="text/javascript">
//////////////////////////////////////////////////////////
//1. 변수 초기화
//////////////////////////////////////////////////////////
var now = new Date();	// 현재 날짜 및 시간
var sysDateValue = formatDate(new Date(now.setDate(now.getDate())));	// 어제
var yesterDateValue = formatDate(new Date(now.setDate(now.getDate() - 1)));	// 어제
var aweekagoValue = formatDate(new Date(now.setDate(now.getDate() - 7)));	// 1주
var amonthagoValue = formatDate(new Date(now.setDate(now.getDate() - 30)));	// 1달
var ayearagoValue = formatDate(new Date(now.setDate(now.getDate() - 365)));	// 1년
	
	
//////////////////////////////////////////////////////////
// 2. onload 함수
//////////////////////////////////////////////////////////
$(function(){
// 	fn_SelctOption( "", "CAT", "selectText" );
	
// 	표의 날짜 활성기능
	$('.servTbl1 th').click(function(){
		$('.servTbl1 th').removeClass('active');
		$(this).addClass('active');
	});
	
	$('.servTbl2 th').click(function(){
		$('.servTbl2 th').removeClass('active');
		$(this).addClass('active');
	});
	
	$('.servTbl3 th').click(function(){
		$('.servTbl3 th').removeClass('active');
		$(this).addClass('active');
	});
	
	if( localStorage.getItem('mngUserType') == 'A' ) {
		setTimeout(function(){
			$('.header-title').html( '안녕하세요 ' + localStorage.getItem('mngLoginNm') + ' 관리자님 환영합니다.');
		}, 1000);
		fn_PlatformList();
		fn_ServiceList();
		$('.adminDiv').show();
	} else {
		setTimeout(function(){
			$('.header-title').html( '안녕하세요 ' + localStorage.getItem('mngLoginNm') + ' 마스터님 환영합니다.');
		}, 1000);
		fn_ConsultList();
		$('.masterDiv').show();
	}
	
});

//////////////////////////////////////////////////////////
//3. 서비스 함수
//////////////////////////////////////////////////////////

function getTime() {
  var d = new Date();
  var s =
	  getTimeEdit(d.getFullYear(), 4) + '-' +
	  getTimeEdit(d.getMonth() + 1, 2) + '-' +
	  getTimeEdit(d.getDate(), 2) + ' ' +

	  getTimeEdit(d.getHours(), 2);// + ':' +
// 	  getTimeEdit(d.getMinutes(), 2) + ':' +
// 	  getTimeEdit(d.getSeconds(), 2);

  return s;
}

function getMidNight() {
  var d = new Date();
  var s =
	  getTimeEdit(d.getFullYear(), 4) + '-' +
	  getTimeEdit(d.getMonth() + 1, 2) + '-' +
	  getTimeEdit(d.getDate(), 2) + ' ' +

	  '00';// + ':' +
// 	  getTimeEdit(d.getMinutes(), 2) + ':' +
// 	  getTimeEdit(d.getSeconds(), 2);

  return s;
}

function getTimeEdit(n, digits) {
  var zero = '';
  n = n.toString();

  if (n.length < digits) {
    for (i = 0; i < digits - n.length; i++)
      zero += '0';
  }
  return zero + n;
}

function fn_PlatformList( SEARCH_TYPE ) {
	
	if( SEARCH_TYPE == 1 ) {
		var params = new Object();
		params.status = "DELETE";
		params.query = "deleteDashPlatform";
		var jsonDetail = ${unit.ajax( ajaxUrl, "ajax", "params")};
		
		var params = new Object();
		params.status = "WRITE";
		params.query = "insertDashPlatform";
		var jsonDetail = ${unit.ajax( ajaxUrl, "ajax", "params")};
		
		$('.saveTimeArea').eq(0).text(getTime() + '시 기준');
	}
	else $('.saveTimeArea').eq(0).text(getMidNight() + '시 기준');
	
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectMngMainPlatform";
	params.mngLoginIdx = localStorage.getItem('mngLoginIdx');
	params.SEARCH_TYPE = SEARCH_TYPE;
	
	if( SEARCH_TYPE == 1 ) params.searchDate = sysDateValue;
	else if( SEARCH_TYPE == 2 ) params.searchDate = yesterDateValue;
	else if( SEARCH_TYPE == 3 ) params.searchDate = aweekagoValue;
	else if( SEARCH_TYPE == 4 ) params.searchDate = amonthagoValue;
	else if( SEARCH_TYPE == 5 ) params.searchDate = ayearagoValue;
	else {
		params.SEARCH_TYPE = 2;
		params.searchDate = yesterDateValue;
	}
	
	var jsonDetail = ${unit.ajax( ajaxUrl, "ajax", "params")};
	jsonDetail = jsonDetail.out.detail.data;
	
	var inTag = '';
	
	$('#dataList1').empty();
	
	$.each(jsonDetail, function(key,val){
		inTag += '	<tr>';	
		inTag += '		<td >회원</td>';	
		inTag += '		<td>가입    '+val.USER_JOIN+'</td>';
		inTag += '		<td>탈퇴    '+val.USER_LEAV+'</td>';	
		inTag += '		<td>휴면   '+val.USER_REST+'</td>';	
		inTag += '		<td></td>';	
		inTag += '	</tr>';		
		$('#dataList1').append( inTag );
		inTag = '';
		inTag += '	<tr>';	
		inTag += '		<td >마스터</td>';	
		inTag += '		<td>지원 '+val.M_USER_APPL+'</td>';
		inTag += '		<td>보완 '+val.M_USER_CHK+'</td>';	
		inTag += '		<td>거절 '+val.M_USER_RJT+'</td>';	
		inTag += '		<td>승인 '+val.M_USER_DONE+'</td>';	
		inTag += '	</tr>';	
		$('#dataList1').append( inTag );
		inTag = '';
		inTag += '	<tr>';	
		inTag += '		<td >매출</td>';	
		inTag += '		<td>건수 '+val.USER_BUY+'</td>';
		inTag += '		<td>환불 '+numberWithCommas(val.USER_REFU)+'</td>';	
		inTag += '		<td>매출 '+numberWithCommas(val.USER_DONE)+'</td>';	
		inTag += '		<td></td>';	
		inTag += '	</tr>';	
		$('#dataList1').append( inTag );
		inTag = '';
		inTag += '	<tr>';	
		inTag += '		<td >1:1문의</td>';	
		inTag += '		<td>건수 '+val.QNA_DONE+'</td>';
		inTag += '		<td>미답변 '+val.QNA_WAIT+'</td>';	
		inTag += '		<td></td>';	
		inTag += '		<td></td>';	
		inTag += '	</tr>';	
		$('#dataList1').append( inTag );
		inTag = '';
	});
	
}

function fn_ServiceList( SEARCH_TYPE ) {
	
	if( SEARCH_TYPE == 1 ) {
		var params = new Object();
		params.status = "DELETE";
		params.query = "deleteDashService";
		var jsonDetail = ${unit.ajax( ajaxUrl, "ajax", "params")};
		
		var params = new Object();
		params.status = "WRITE";
		params.query = "insertDashService";
		var jsonDetail = ${unit.ajax( ajaxUrl, "ajax", "params")};
		
		$('.saveTimeArea').eq(1).text(getTime() + '시 기준');
	}
	else $('.saveTimeArea').eq(1).text(getMidNight() + '시 기준');
	
	var params = new Object();
	params.status = "LIST";
	params.query = "selectMngMainService";
	params.mngLoginIdx = localStorage.getItem('mngLoginIdx');
	params.SEARCH_TYPE = SEARCH_TYPE;
	
	if( SEARCH_TYPE == 1 ) params.searchDate = sysDateValue;
	else if( SEARCH_TYPE == 2 ) params.searchDate = yesterDateValue;
	else if( SEARCH_TYPE == 3 ) params.searchDate = aweekagoValue;
	else if( SEARCH_TYPE == 4 ) params.searchDate = amonthagoValue;
	else if( SEARCH_TYPE == 5 ) params.searchDate = ayearagoValue;
	else {
		params.SEARCH_TYPE = 2;
		params.searchDate = yesterDateValue;
	}
	
	var jsonDetail = ${unit.ajax( ajaxUrl, "ajax", "params")};
	jsonDetail = jsonDetail.out.detail.data;
	
	var inTag = '';

	$('#dataList2').empty();
	
	$.each(jsonDetail, function(key,val){
		inTag += '	<tr>';	
		if( val.SERV_TYPE == 'FN' ) inTag += '		<td style="">화상</td>';	
		else if( val.SERV_TYPE == 'CN' ) inTag += '		<td >채팅</td>';	
		else if( val.SERV_TYPE == 'EN' ) inTag += '		<td >이메일</td>';	
		else if( val.SERV_TYPE == 'VL' ) inTag += '		<td >VOD</td>';	
		else if( val.SERV_TYPE == 'LN' ) inTag += '		<td >라이브클래스</td>';	
		else if( val.SERV_TYPE == 'LN_A' ) inTag += '		<td >라이브아카데미</td>';
		
		if( val.BUY != null ) inTag += '		<td>구매    '+val.BUY+'</td>';
		else inTag += '		<td></td>';
		if( val.BUY_RSV != null ) inTag += '		<td>예약    '+val.BUY_RSV+'</td>';
		else {
			if( val.SERV_TYPE == 'VL' ) inTag += '		<td></td>';
			else inTag += '		<td>예약    0</td>';
		}
		if( val.BUY_CNFM != null ) inTag += '		<td>확정    '+val.BUY_CNFM+'</td>';
		else inTag += '		<td></td>';
		if( val.BUY_NOT_CNFM != null ) inTag += '		<td>미확정    '+val.BUY_NOT_CNFM+'</td>';
		else inTag += '		<td></td>';
		if( val.BUY_DONE != null ) inTag += '		<td>완료    '+val.BUY_DONE+'</td>';
		else inTag += '		<td></td>';
		if( val.USER_REVI != null ) inTag += '		<td>후기    '+val.USER_REVI+'</td>';
		else inTag += '		<td></td>';
		if( val.M_USER_REVI != null ) inTag += '		<td>마스터후기    '+val.M_USER_REVI+'</td>';
		else inTag += '		<td></td>';
// 		inTag += '		<td>예약    '+val.BUY_RSV+'</td>';	
// 		inTag += '		<td>확정   '+val.BUY_CNFM+'</td>';		
// 		inTag += '		<td>미확정   '+val.BUY_NOT_CNFM+'</td>';	
// 		inTag += '		<td>완료   '+val.BUY_DONE+'</td>';	
// 		inTag += '		<td>후기   '+val.USER_REVI+'</td>';	
// 		inTag += '		<td>마스터후기   '+val.M_USER_REVI+'</td>';
		inTag += '	</tr>';
		$('#dataList2').append( inTag );
		inTag = '';	
	});
}

function fn_ConsultList( SEARCH_TYPE ) {
	
	var params = new Object();
	params.status = "LIST";
	params.query = "selectMngMainConsult";
	params.mngLoginIdx = localStorage.getItem('mngLoginIdx');
	
	if( SEARCH_TYPE != null ) params.SEARCH_TYPE = SEARCH_TYPE;
	else params.SEARCH_TYPE = 1;
	
	var jsonDetail = ${unit.ajax( ajaxUrl, "ajax", "params")};
	jsonDetail = jsonDetail.out.detail.data;
	
	var inTag = '';

	$('#dataList3').empty();
	
	$.each(jsonDetail, function(key,val){
// 		if( val.NOT_CNFM_CNT != 0 ) {
			$('.cnfnDiv h4 a span').text(val.NOT_CNFM_CNT);
// 			$('.cnfnDiv').show();
// 		} else $('.cnfnDiv').hide();

// 		if( val.NOT_CNFM_CNT != 0 ) {
			$('.consDiv h4 a span').text(val.FN_CONS_CNT+val.CN_CONS_CNT+val.LN_CONS_CNT+val.LN_A_CONS_CNT);
// 			$('.reviDiv').show();
// 		} else $('.reviDiv').hide();

// 		if( val.NOT_CNFM_CNT != 0 ) {
			$('.reviDiv h4 a span').text(val.M_NOT_REVI_CNT);
// 			$('.reviDiv').show();
// 		} else $('.reviDiv').hide();
		
		inTag += '	<tr>';	
		inTag += '		<td >확정여부</td>';
		inTag += '		<td>확정    '+val.CNFM_CNT+'</td>';
		inTag += '		<td>미확정    '+val.NOT_CNFM_CNT+'</td>';
		inTag += '		<td></td>';
		inTag += '	</tr>';
		$('#dataList3').append( inTag );
		inTag = '';	
		inTag += '	<tr>';	
		inTag += '		<td >상담</td>';
		inTag += '		<td>화상    '+val.FN_CONS_TOTAL+'(완료'+val.FN_CONS_CNT+')</td>';
		inTag += '		<td>채팅    '+val.CN_CONS_TOTAL+'(완료'+val.CN_CONS_CNT+')</td>';
		inTag += '		<td>이메일    '+val.EN_CONS_CNT+'</td>';	
		inTag += '	</tr>';
		$('#dataList3').append( inTag );
		inTag = '';	
		inTag += '	<tr>';	
		inTag += '		<td >라이브클래스</td>';
		inTag += '		<td>강의    '+val.LN_CONS_TOTAL+'(완료'+val.LN_CONS_CNT+')</td>';
		inTag += '		<td></td>';
		inTag += '		<td></td>';
		inTag += '	</tr>';
		$('#dataList3').append( inTag );
		inTag = '';	
		inTag += '	<tr>';	
		inTag += '		<td >라이브아카데미</td>';
		inTag += '		<td>강의    '+val.LN_A_CONS_TOTAL+'(완료'+val.LN_A_CONS_CNT+')</td>';
		inTag += '		<td></td>';
		inTag += '		<td></td>';
		inTag += '	</tr>';
		$('#dataList3').append( inTag );
		inTag = '';	
		inTag += '	<tr>';	
		inTag += '		<td >마스터후기</td>';
// 		inTag += '		<td>작성    '+val.M_REVI_CNT+'</td>';
		inTag += '		<td>미작성    '+val.M_NOT_REVI_CNT+'</td>';
		inTag += '		<td></td>';
		inTag += '		<td></td>';
		inTag += '	</tr>';
		inTag += '	<tr>';	
		inTag += '		<td >회원후기</td>';
		inTag += '		<td>작성    '+val.U_REVI_CNT+'</td>';
		inTag += '		<td></td>';
		inTag += '		<td></td>';
		inTag += '	</tr>';
		$('#dataList3').append( inTag );
		inTag = '';	
	});
}

function formatDate(date) {
	var d = new Date(date),
		month = '' + (d.getMonth() + 1),
		day = '' + d.getDate(),
		year = d.getFullYear();
	
	if (month.length < 2) month = '0' + month;
	if (day.length < 2) day = '0' + day;
	
	return [year, month, day].join('-');
}


</script>










