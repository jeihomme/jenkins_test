<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'index', 'ajax')}" />

<!-- 화상 솔루션 추가헤더 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset={_GLOBALS['G_BROWSER_CHARACTERSET']}">

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/><!-- 화면비율(뷰포트) 설정 -->

<title>{_GLOBALS['G_BROWSER_TITLE']}</title>

<link rel="stylesheet" href="https://asppm.gonts.net/emeetplus6/empl6_one/empcmcurl.css" type="text/css">
<!-- <link rel="stylesheet" type="text/css" href="https://asppm.gonts.net/pm/Html/CSS/flick/jquery-ui-1.8.13.custom.css" />	 -->
<!-- <script type="text/javascript" src="https://asppm.gonts.net/emeetplus6/empl6_one/jquery-1.4.2.min.js"></script> -->
<script type="text/javascript" src="https://asppm.gonts.net/pm/Html/JS/jquery-ui-1.8.13.custom.min.js"></script>
<script type="text/javascript" src="https://asppm.gonts.net/pm/Html/Js/Common.js"></script>

<!--화상 연결시 필요-->
<script type="text/javascript" src="https://asppm.gonts.net/emeetplus6/empl6_one/empcm6.js?v=20200916"></script>
<script type="text/javascript" src="https://asppm.gonts.net/emeetplus6/empl6_one/empcmcurl.js?v=20200916"></script>

<!--pc버전 필요 js-->
<script type="text/javascript" src="https://asppm.gonts.net/emeetplus6/empl6_one/empcmcurldetector.js"></script> 
<script type="text/javascript" src="https://asppm.gonts.net/emeetplus6/empl6_one/empcmcurlwidget.js"></script>
<script type="text/javascript" src="https://asppm.gonts.net/configurations/PM.js?v=20201221" charset='utf-8'></script>

</head>
<!-- 화상 솔루션 추가헤더 end -->


<div class="gnb_box">
                <ul class="gnb_list">
                    <li onclick="location.href='${unit.move('view', out.params.userIdx, 'user' ) }'">
                        <a href="${unit.move('view', out.params.userIdx, 'user' ) }">
                            기본
                        </a>
                    </li>
                    <li onclick="location.href='${unit.move('tab', out.params.userIdx, 'user', 'network' ) }'">
                        <a href="${unit.move('tab', out.params.userIdx, 'user', 'network' ) }">
                            인맥
                        </a>
                    </li>
                    <li onclick="location.href='${unit.move('tab', out.params.userIdx, 'user', 'lect' ) }'">
                        <a href="${unit.move('tab', out.params.userIdx, 'user', 'lect' ) }">
                            수강
                        </a>
                    </li>
                    <li class="active" onclick="location.href='${unit.move('tab', out.params.userIdx, 'user', 'cons' ) }'">
                        <a href="${unit.move('tab', out.params.userIdx, 'user', 'cons' ) }">
                            상담
                        </a>
                    </li>
                </ul>
</div>
	

<div class="form-inline" style="display:flex; justify-content:space-between; padding-bottom:10px; margin-top: 30px;">	
	<span class="listCount" style="display:inline-block;">전체<span style="color:#ff8939">${out.list.paging.totalCnt }</span></span>		
	<div id="sub-form-inline">
		<select id="listCnt" class="designSelectBox form-control form-control-sm mr10" title="셀렉트박스" onchange="fn_BtnChnageListCnt();">
			<option value="10" selected="">10</option>
			<option value="50">50</option>
			<option value="100">100</option>
			<option value="300">300</option>
		</select>
	</div>		
</div>

<!-- 조회  시작-->				
<div class="tbl_list">
	<table class="list_tbl01" summary="" id="searchArea">
		<input id="USER_IDX" type="hidden" />
		<caption>회원정보 관리 테이블</caption>
		<colgroup>
			<col style="width: 3%;" />
			<col style="width: 6%;" />
			<col style="width: 8%;" />
			<col style="width: 10%;" />
			<col  />
			
			<col  style="width: 7%;"/>
			<col  style="width: 7%;"/>
			<col  style="width: 7%;"/>
			<col  style="width: 10%;"/>
			<col  style="width: 10%;"/>
			<col  style="width: 7%;"/>
			
			<col  style="width: 7%;"/>
			<col  style="width: 5%;"/>
			<col  style="width: 5%;"/>
		</colgroup>
		<thead>
			<th scope="col">번호</th>
			<th scope="col">구분</th>
			<th scope="col">마스터명</th>
			<th scope="col">상품코드</th>
			<th scope="col">상품명</th>
			
			<th scope="col">분야</th>
			<th scope="col">분야상세</th>
			<th scope="col">결제일자</th>
			<th scope="col">시작</th>
			<th scope="col">종료</th>
			<th scope="col">상담진행</th>
			
			<th scope="col">진행여부</th>
			<th scope="col">후기평점</th>
			<th scope="col">다시보기</th>
		</thead>
		<tbody id="dataList">
		</tbody>
	</table>
</div>
	
<div class="pagination justify-content-center paging">
	<ul style="justify-content:space-between;" id="pagingVar">
	
	</ul>
</div>



<div class="btn_wrap">
	<a href="${ unit.move('index', '') }" class="btn btn-md btn-outline-dark">목록</a>
</div>
<!-- 조회 끝 -->	
<script>

// 화상 솔루션
var titles = {Eng:'PEOPLEMADE LIVE',
					Kor:'PEOPLEMADE LIVE'};

var chk = 0;
$(function(){
	fn_BtnChnageListCnt();
	chk = 1;
	
	// 화상 솔루션	
	EMPCM.ASP.Init();
});

function fn_BtnChnageListCnt( pageNo ){
	var params = new Object();
	params.status = "PAGE";
	params.query = "selectMngMemberConsList";
	params.userIdx = '${out.params.userIdx }';
	params.listCnt = $('#listCnt').val();
	params.thisPage = pageNo;
	params.prdtUuidNm = 'EN';
	if (params.thisPage == 0 || params.thisPage == null || params.thisPage == "" || params.thisPage == undefined) {
		params.thisPage = 1;
	}
// 	if (tab == 'sreach' ||typeof tab == 'undefined') {
// 		params.masterTab = masterTab;
// 	}else{
// 		params.masterTab = tab;
// 		masterTab = tab;
// 	}
	fn_DataList( params, "dataList", 7 );
}

function fn_DataList( PARAMS, OBJECT_ID, CNT ) {
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result.out.detail.data;
	var inTag = '';

	 if( jsonData.length > 0 ) {
		$('#'+OBJECT_ID+'').empty();
		 
		$.each(jsonData, function(key, val) {
			inTag += '<tr>';
			inTag += '<td>'+ val.NUM_DESC + '</td>';
			inTag += '<td>'+ val.PRDT_TYPE + '</td>';
			inTag += '<td>'+ val.MASTER_NM + '</td>';
			inTag += '<td>'+ val.PRDT_CD + '</td>';
			
			inTag += '<td>'+fn_LegnthOver( val.PRDT_NM, 15 ) + '</td>';
			inTag += '<td>'+ val.CODE_PARENT_NM + '</td>';
			inTag += '<td>'+ val.CODE_NM + '</td>';
			inTag += '<td>'+ val.BUY_COMP_DTM + '</td>';
			if( val.PRDT_STR != null ) inTag += '<td>'+ val.PRDT_STR + '</td>';
			else inTag += '<td> - </td>';
			if( val.PRDT_END != null ) inTag += '<td>'+ val.PRDT_END + '</td>';
			else inTag += '<td> - </td>';
			
// 			if (val.PRDT_TYPE == '이메일') {
// 				var popvent = "";
// 				console.log( val );
// 				popvent = "onclick='fn_mailList(\""+val.MOVE_URL+"\")' ";
// 			}
			
			inTag += '<td >'+ val.PRDT_PROG_MIN + '</td>';
			
			
			inTag += '<td>'+ val.PRDT_PROG_YN + '</td>';
			inTag += '<td>'+ val.PRDT_SCOR_AVG + '</td>';
			inTag += '<td>';
			
			if ( val.PRDT_CD.indexOf('CN') > -1 ) {
				inTag += '<a class="btn" onclick="fn_BtnSolutionPopup( makeUrlForChat(\''+val.MOVE_URL+'\'), '+val.BUY_IDX+' )"><span >'+ val.PRDT_REPL + '</span></a>';
			}else if ( val.PRDT_CD.indexOf('FN') > -1 || val.PRDT_CD.indexOf('LN') > -1 ) {
				if ( val.REWATCH == null || val.REWATCH == '' || val.REWATCH == undefined ) {
// 					inTag += '<a class="btn " onclick="alert(\'저장된 동영상이 없습니다.\')"><span >'+ val.PRDT_REPL + '</span></a>';
					inTag += '-';
				}else{
					inTag += '<a class="btn " onclick="window.open(\''+val.REWATCH+'\')"><span >'+ val.PRDT_REPL + '</span></a>';
				}
			}else{
				inTag += '<a class="btn " onclick="fn_BtnSolutionPopup(\''+val.MOVE_URL+'\', '+val.BUY_IDX+' )"><span >'+ val.PRDT_REPL + '</span></a>';
			}
			
// 			eMEETplus(3,0,'${row.BUY_IDX},${row.MASTER_ID}','${row.MASTER_NM}','${row.BUY_IDX},${row.MASTER_ID}', '${row.PRDT_NM}','http://peoplemade.html.so/front/peoplemade/network.html' )
	
			inTag += '</td>';
			inTag += '</tr>';
		});
		
	 } else {
		inTag += '<tr>';
		inTag += '<td colspan="99">등록된 내용이 없습니다.</td>';
		inTag += '</tr>';
	 }
		$('#'+OBJECT_ID+'').append( inTag );
		
		var varHtml = "";	
		varHtml += '		<li><a id="pagingFirst" onclick="fn_BtnChnageListCnt('+ result.out.detail.paging.prevStep +');"  aria-label="Previous"><i class="fa fa-angle-left"></i></a></li>   ';
		for (var i = result.out.detail.paging.startPage; i <= result.out.detail.paging.endPage; i++) {
			if (result.out.detail.paging.thisPage == i) varHtml += '<li><a id="pagingActive" onclick="fn_BtnChnageListCnt('+ i +');" class="active" style="cursor:pointer;">'+ i +'</a></li>   ';
			else varHtml += '<li><a name="pagingPassiive" onclick="fn_BtnChnageListCnt('+ i +');" style="cursor:pointer;">'+ i +'</a></li>   ';
		}
		varHtml += '		<li><a id="pagingLast" onclick="fn_BtnChnageListCnt('+ result.out.detail.paging.nextStep +');"  aria-label="Next"><i class="fa fa-angle-right"></i></a></li>   ';
		
		$('#pagingVar').empty();
		$('#pagingVar').append( varHtml );
		$('.listCount').html('전체 <span class="ppm_key_color">' + result.out.totalCnt + '</span>' );
		
// 		if( chk == 1 ) alert('페이지 개수 변환에 성공하였습니다.');
}

function makeUrlForChat( url ){
	return url.replace('chat_solution','chat_review');
// 	return "https://peoplemade.net/front/mypeoplemade/face_history_list?cateIdx="+cateIdx+"&userIdx="+userIdx;
}

function fn_OpenSolution( IDX ){
	var winObj = window.open('/front/mypeoplemade/email_solution?buyIdx='+IDX,'tistory','width=1400px, height=800px, scrollbars=no, resizable=no, toolbars=no, menubar=no');
	  
	  var loop = setInterval(function() {   
	      if(winObj.closed) {  
	         	clearInterval(loop);  
		    	fn_DataAjax2( updateConn );	
	      }  
	  }, 1000);     

}

function fn_mailList( url ){
	var param = '';
	var pathTemp = "";
	
	url = url.split('?');
	param = '?'+ url[1];
	
	pathTemp = url[0].split('/')[0];
	
	
	 var winObj = window.open( pathTemp+'/front/mypeoplemade/email_solution'+param ,'tistory','width=1400px, height=800px, scrollbars=no, resizable=no, toolbars=no, menubar=no');
		
	 var loop = setInterval(function() {   
		 if(winObj.closed) {
			location.reload();
		 }  
	}, 1000);
	
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////// 다시보기 관련 펑크션 들어갈 자리 START
function fn_BtnDatePopup( QUERY, TBODY, POPUP, PRDT_IDX, PRDT_TYPE, BUY_IDX, USER_IDX, PRDT_CD, BUY_TIME ) {

	var params = new Object();
	params.status = "LIST";
	params.query = QUERY;
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.PRDT_IDX = PRDT_IDX;
	params.PRDT_TYPE = PRDT_TYPE;
	
	if( PRDT_CD != null) {
		params.BUY_IDX = BUY_IDX;
		params.USER_IDX = USER_IDX;
		params.PRDT_CD = PRDT_CD;
		if( PRDT_CD.indexOf("VL") > -1) fn_DataListVodList( params, TBODY, 5 );
		else fn_DataListBuyCons( params, TBODY, 5, BUY_TIME );
		
	} else {
		params.BUY_IDX = BUY_IDX; 
		params.USER_IDX = USER_IDX;
		fn_DataListQues( params, TBODY, 5 );
	}
	
	alertShow('70%','',POPUP);
	$('.tbl_list').scrollTop( 0 );
}

function fn_BtnSolutionPopup( url, BUY_IDX ){
	
// 	url.replace('/mng/member', '/front/mypeoplemade');
	
	 var winObj = window.open( url.replace('/mng/member', '/front/mypeoplemade') ,'tistory','width=1400px, height=800px, scrollbars=no, resizable=no, toolbars=no, menubar=no');
	
	  var loop = setInterval(function() {   
	      if(winObj.closed) {

		// 	 	결제완료 SMS 통보
				var params = new Object();
				params.status = "EDIT_SMS";
				params.query = "selectPaySmsList";
				params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
				params.BUY_IDX = BUY_IDX;
			 	var result = fn_DataAjax2( params );
				
// 				location.reload();
	      }  
	  }, 1000);
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////// 다시보기 관련 펑크션 들어갈 자리 END
</script>



