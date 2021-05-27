<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'index', 'ajax')}" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="yesterDay" value="<%=new java.util.Date(new java.util.Date().getTime() - 60*60*24*1000*1)%>" />
<c:set var="aweekago" value="<%=new java.util.Date(new java.util.Date().getTime() - 60*60*24*1000*7)%>" />
<c:set var="sysDateValue"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
<c:set var="yesterDateValue"><fmt:formatDate value="${yesterDay}" pattern="yyyy-MM-dd" /></c:set>
<c:set var="agoDateValue"><fmt:formatDate value="${aweekago}" pattern="yyyy-MM-dd" /></c:set>

<style>

/* 스크롤 바 넓이 16px */
::-webkit-scrollbar{width: 6px; border-radius:40px; }
/* 스크롤 바 기본 색상 */
::-webkit-scrollbar-track {background-color:#fff;}
/* 스크롤 구간 배경 색상 */
::-webkit-scrollbar-thumb {background-color:#999 ; border-radius:40px;} 
/* 스크롤 바 위에 마우스 올렸을 때(hover) 색상 */
::-webkit-scrollbar-thumb:hover {background-color:#999;} 
/* 스크롤 상하단 버튼 넓이와 색상 */
/* ::-WEBKIT-SCROLLBAR-BUTTON:START:DECREMENT, ::-WEBKIT-SCROLLBAR-BUTTON:END:INCREMENT { */
/* WIDTH:16PX; HEIGHT:16PX; BACKGROUND-COLOR: MEDIUMPURPLE; */

#btnSearch:hover{	color: white!important;}
.alert_layer{width: 1200px !important;margin-left: -600px !important;height: 600px !important;margin-top: -400px !important;}
.datepicker{z-index:1 !important;}
.tbl_list {
	overflow:auto;
    -ms-overflow-style: none; /* IE and Edge */
    scrollbar-width: none; /* Firefox */
}
.tbl_list::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}
</style>

<!-- 화상 솔루션 추가헤더 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset={_GLOBALS['G_BROWSER_CHARACTERSET']}">
<meta content="requiresActiveX=true" http-equiv="X-UA-Compatible">

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/><!-- 화면비율(뷰포트) 설정 -->

<title>{_GLOBALS['G_BROWSER_TITLE']}</title>

<link rel="stylesheet" href="https://asppm.gonts.net/emeetplus6/empl6_one/empcmcurl.css" type="text/css">
<script type="text/javascript" src="https://asppm.gonts.net/pm/Html/JS/jquery-ui-1.8.13.custom.min.js"></script>
<script type="text/javascript" src="https://asppm.gonts.net/pm/Html/Js/Common.js"></script>

<!--화상 연결시 필요-->
<script type="text/javascript" src="https://asppm.gonts.net/emeetplus6/empl6_one/empcm6.js?v=20210504"></script>
<script type="text/javascript" src="https://asppm.gonts.net/emeetplus6/empl6_one/empcmcurl.js?v=20210504"></script>

<!--pc버전 필요 js-->
<script type="text/javascript" src="https://asppm.gonts.net/emeetplus6/empl6_one/empcmcurldetector.js"></script> 
<script type="text/javascript" src="https://asppm.gonts.net/emeetplus6/empl6_one/empcmcurlwidget.js"></script>
<script type="text/javascript" src="https://asppm.gonts.net/configurations/PM.js?v=20210504" charset='utf-8'></script>

</head>
<!-- 화상 솔루션 추가헤더 end -->

<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>관리자 리스트 조회</caption>
		<colgroup>
			<col style="width: 10%;" />
			<col style="width: 37.5%;" />	
			<col style="width: 10%;" />
			<col />	
			<col style="width: 5%;" />
		</colgroup>
		<tbody>
			<tr class="mobileCss1" >
				<th scope="row" align="justify">분야</th>
				<td style="text-align:center;" >
					<select id="PARENT_CODE_ID" name="PARENT_CODE_ID" class="form-control form-control-sm col-8" title="분야" >
						<option value="">선택해주세요.</option>
					</select>
				</td>
				<th scope="row">분야상세</th>
				<td style="text-align:center;" >
					<select id="CODE_ID" name="CODE_ID" class="form-control form-control-sm col-8">
						<option value="">분야를 선택해주세요.</option>
					</select>
				</td>
				<td style="text-align:center;" rowspan="4"><a id="btnSearch" onClick="fn_BtnSearch();" class="btn  btn-black">검색</a></td>
			</tr>
			<tr class="mobileCss1" >
				<th scope="row">마스터/회원명</th>
				<td style="text-align:center;" >
					<input id="MASTER_NM" name="MASTER_NM" type="text" onkeypress="if(event.keyCode==13){fn_BtnSearch();}" class="form-control form-control-sm col-8" value="${out.params.masterNm}"/>
				</td>
				<th scope="row">마스터ID</th>
				<td style="text-align:center;" >
					<input id="MASTER_ID" name="MASTER_ID"  type="text" onkeypress="if(event.keyCode==13){fn_BtnSearch();}" class="form-control form-control-sm col-8" value="${out.params.masterId}"/> 
				</td>
			</tr>	
			<tr class="mobileCss2" >
				<th scope="row">상담일</th>
				<td style="text-align:center;" colspan="3">
					<c:choose>
						<c:when test='${out.params.timeDtmSrt eq "" or empty out.params.timeDtmSrt }'><c:set var="sysStrValue" value="${sysDateValue }"/></c:when>
						<c:otherwise><c:set var="sysStrValue" value="${out.params.timeDtmSrt}"/></c:otherwise>
					</c:choose>
					<input id="timeDtmSrt" name="timeDtmSrt" readonly="readonly" onChange="inputDateComparison(this, 'timeDtmSrt', 'timeDtmEnd' );" type="text" class="form-control form-control-sm datepicker " value="${sysStrValue}"  style="width:45%;float:left;"/>
					<span style="padding: 8px;display: inline-block; float:left;">~</span>
					<c:choose>
						<c:when test='${out.params.timeDtmEnd eq "" or empty out.params.timeDtmEnd }'><c:set var="sysEndValue" value="${sysDateValue }"/></c:when>
						<c:otherwise><c:set var="sysEndValue" value="${out.params.timeDtmEnd}"/></c:otherwise>
					</c:choose>
					<input id="timeDtmEnd" name="timeDtmEnd" readonly="readonly" onChange="inputDateComparison(this, 'timeDtmSrt', 'timeDtmEnd' );" type="text" class="form-control form-control-sm datepicker " value="${sysEndValue}"  style="width:45%;float:left;" /> 
				</td>
			</tr>	
			<tr class="mobileCss3" >
				<th scope="row">구분</th>
				<td colspan="3">
					<button class="btn btn-light <c:if test="${out.params.prdtType == '' or out.params.prdtType == null}">btn-grayblack</c:if>  ml11 form-control-sm" onclick="$('[name=prdtType]').val('');fn_BtnSearch();" >전체</button>
					<button class="btn btn-light <c:if test="${out.params.prdtType == '채팅'}">btn-grayblack</c:if>  ml11 form-control-sm" onclick="$('[name=prdtType]').val('채팅');fn_BtnSearch();" >채팅</button>
					<button class="btn btn-light <c:if test="${out.params.prdtType == '화상'}">btn-grayblack</c:if>  ml11 form-control-sm" onclick="$('[name=prdtType]').val('화상');fn_BtnSearch();" >화상</button>
					<button class="btn btn-light <c:if test="${out.params.prdtType == '이메일'}">btn-grayblack</c:if>  ml11 form-control-sm" onclick="$('[name=prdtType]').val('이메일');fn_BtnSearch();" >이메일</button>
					<button class="btn btn-light <c:if test="${out.params.prdtType == '라이브클래스'}">btn-grayblack</c:if>  ml11 form-control-sm" onclick="$('[name=prdtType]').val('라이브클래스');fn_BtnSearch();" >라이브클래스</button> 
					<input name="prdtType" type="hidden" value="${out.params.prdtType}"/>
				</td>
			</tr>			
		</tbody>
	</table>
</div>

	
<!-- 리스트  시작-->
	<div class="form-inline" style="display:flex; justify-content:space-between; padding-bottom:10px; margin-top: 30px;">
		<span class="listCount" style="display:inline-block;">전체 <span class="ppm_key_color">${out.list.paging.totalCnt }</span></span>		
		<div id="sub-form-inline">
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
			<col style="width: 1%;" />
			<col style="width: 20%;" />	<!-- 제거 -->
			<col style="width: 7%;" />
			<col style="width: 10%;" />
			<col style="width: 6%;" />
			
			<col>						<!-- 제거 -->
			<col style="width: 8%;" />	<!-- 제거 -->
			<col style="width: 6%;" />	
			<col style="width: 5%;" />	<!-- 제거 -->
			<col style="width: 4%;" />	<!-- 제거 -->
	
			<col style="width: 5%;" />			
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No.</th>
<!-- 				<th scope="col">마스터명</th> -->
				<th scope="col">마스터ID</th>
				<th scope="col">일자</th>
				<th scope="col">시간</th>
				<th scope="col">구분</th>
				
				<th scope="col">상품명</th>
				<th scope="col">상품코드</th>
				<th scope="col">회원명</th>
				<th scope="col">확정여부</th>
				<th scope="col">사전질문</th>
<!-- 				<th scope="col">상담내역</th> -->
				<th scope="col" id="mobilePlus">시작</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row">
					<tr>
						<td>${row.NUM_DESC_ORDER }</td>
						<td>${row.MASTER_NM } (${row.MASTER_ID })</td>
						<td> 
							<c:choose>
								<c:when test='${fn:indexOf( row.PRDT_CD ,"EN") ne -1}'>${row.BUY_COMP_DTM }</c:when>
								<c:when test='${not empty row.TIME_DTM and  row.TIME_DTM ne ""}'>${row.TIME_DTM }</c:when>	
								<c:otherwise>-</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${row.TIME_STR != ''}">${row.TIME_STR } ~ ${row.TIME_END }</c:when>
								<c:otherwise>-</c:otherwise>
							</c:choose>
						</td>
						<td>${row.PRDT_TYPE }</td>
						<td class="prdtTitle">${row.PRDT_NM }</td>
						<td>${row.PRDT_CD }</td>
						<td>${row.USER_NM }</td>
						<td>
							<c:choose>
							<c:when test='${row.PRDT_TYPE != "이메일"}'>
								<a class="btn " onclick='fn_BtnPrdtConfirm( "${row.BUY_IDX }");'><c:if test="${row.SANG_DAM_HWACK_JUNG_YN eq 'Y' }">확정</c:if><c:if test="${row.SANG_DAM_HWACK_JUNG_YN ne 'Y' }">미확정</c:if></a>
							</c:when>
							<c:otherwise>-</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${row.TIME_STR != ''}">
									<a class="btn " onclick='fn_BtnDatePopup("selectMngQuesList", "writeQuesTbody", "writeQues", ${row.PRDT_IDX }, "${row.PRDT_TYPE }", ${row.BUY_IDX });'>질문</a>
								</c:when>
								<c:otherwise>-</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test='${row.PRDT_TYPE == "화상"}'>
									<button class="btn MobileChromeCk" onclick="eMEETplus(1,0,'${row.MASTER_ID}','${row.MASTER_NM}','${row.MASTER_ID}', '${row.PRDT_NM}', '${row.HIST_URL}', '${row.BUY_IDX}' );">상담시작</button>
								</c:when>
								<c:when test='${row.PRDT_TYPE == "라이브클래스"}'>
									<button class="btn MobileChromeCk" onclick="eMEETplus(3,0,'${row.MASTER_ID}','${row.MASTER_NM}','${row.MASTER_ID}',  '${row.PRDT_NM}', '${row.HIST_URL}', '${row.BUY_IDX}' );">상담시작</button>
								</c:when>
								<c:otherwise>
									<button class="btn MobileChromeCk" onclick="fn_BtnSolutionPopup( '${row.MOVE_URL}', '${row.BUY_IDX }', '_blank','width=1440px, height=760px, scrollbars=no, resizable=no, toolbars=no, menubar=no');">상담시작</button>
								</c:otherwise>
							</c:choose>
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
<span class="listCount" style="display:inline-block;"><span class="ppm_key_color" style="color:red !important;">※ 웹페이지에서 화상솔루션 프로그램이 실행되지 않으면 <span class="ppm_key_color" style="cursor:pointer;" onclick='location.href="https://asppm.gonts.net/emeetplus6/empl6_one/files_3_0_curl/eMEETPlus4Launcher.exe";'>여기</span>를 클릭 후, 설치를 진행해주세요.</span></span>

	<c:set value="${out.list.paging}"  var="paging" />
	<%@ include file="/WEB-INF/views/shared/mng_paging.jspf" %>
<!-- 	<div class="col-4 btn_pagination" style="margin: 29px 0 0; float: right"><a href='javascript:;' class="btn btn-md btn_key_color" onclick='location.href="https://asppm.gonts.net/emeetplus6/empl6_one/files_3_0_curl/eMEETPlus4Launcher.exe";'>설치파일</a></div> -->
	
<div id="writeQues" class="alert_wrap">
	<div class="alert_layer">
		<div class="alert_inner">
			<div class="alert_header">
				<button class="btn btn_close_pop" style="display: block; top: 5px; right: 5px; border: none;" data-action="popup_hide"></button>
			</div>				
			<div class="dialog_content" >
				<div class="scroll_area">
					<h3>질문목록</h3>
					<div class="tbl_list" style="height: 450px;">
						<table class="list_tbl01">
							<colgroup>
								<col style="width: 5%;" />
								<col style="width: 25%;" />
								<col />
								
							</colgroup>
							<thead>
								<tr>
									<th scope="col">No.</th>
									<th scope="col">사전질문</th>
									<th scope="col">질문답변</th>
								</tr>
							</thead>
							<tbody id="writeQuesTbody">
							</tbody>
						</table>
					</div>

					<div class="btn_wrap" style="text-align: right;">
						<a class="btn   btn-outline-dark" onclick="fn_BtnRegistQues();" data-action="popup_hide">닫기</a>
					</div>
					<!--// End 팝업 컨텐츠 -->
				</div>
			</div>
		</div>
	</div>
</div>

<div id="buyCons" class="alert_wrap">
	<div class="alert_layer">
		<div class="alert_inner">
			<div class="alert_header">
				<button class="btn btn_close_pop" style="display: block; top: 5px; right: 5px; border: none;" data-action="popup_hide"></button>
			</div>				
			<div class="dialog_content" >
				<div class="scroll_area">
					<h3>상담내역</h3>
					<div class="tbl_list" style="height: 450px;    overflow-y: scroll;">
						<table class="list_tbl01">
							<colgroup>
								<col style="width: 10%;" />
								<col />
								<col style="width: 10%;" />
								
							</colgroup>
							<thead>
								<tr>
									<th scope="col">회원</th>
									<th scope="col">내용</th>
									<th scope="col">마스터</th>
								</tr>
							</thead>
							<tbody id="buyConsTbody">
							</tbody>
						</table>
					</div>

					<div class="btn_wrap" style="text-align: right;">
						<a class="btn   btn-outline-dark" onclick="fn_BtnRegistQues();" data-action="popup_hide">닫기</a>
					</div>
					<!--// End 팝업 컨텐츠 -->
				</div>
			</div>
		</div>
	</div>
</div>


<div id="vodList" class="alert_wrap">
	<div class="alert_layer">
		<div class="alert_inner">
			<div class="alert_header">
				<button class="btn btn_close_pop" style="display: block; top: 5px; right: 5px; border: none;" data-action="popup_hide"></button>
			</div>				
			<div class="dialog_content" >
				<div class="scroll_area">
					<h3 id="vodTotal"></h3>
					<div class="tbl_list" style="height: 450px;    overflow-y: scroll;">
						<table class="list_tbl01">
							<colgroup>
								<col />
								<col />
								<col />
								<col />
								<col style="width: 10%;" />
								
							</colgroup>
							<thead>
								<tr>
									<th scope="col">마스터</th>
									<th scope="col">강좌</th>
									<th scope="col">강의</th>
									<th scope="col">영상</th>
									<th scope="col">상품코드</th>
								</tr>
							</thead>
							<tbody id="vodListTbody">
							</tbody>
						</table>
					</div>

					<div class="btn_wrap" style="text-align: right;">
						<a class="btn   btn-outline-dark" onclick="fn_BtnRegistQues();" data-action="popup_hide">닫기</a>
					</div>
					<!--// End 팝업 컨텐츠 -->
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

//////////////////////////////////////////////////////////
// 1. 변수 초기화
//////////////////////////////////////////////////////////
	// 화상 솔루션
var titles = {Eng:'PEOPLEMADE LIVE',
					Kor:'PEOPLEMADE LIVE'};

//////////////////////////////////////////////////////////
// 2. 첫 실행 함수
//////////////////////////////////////////////////////////
$(function(){
// 	fn_SelectOption("CAT01","CAT","testSelect");
	fn_SelectOption("", "CAT", "PARENT_CODE_ID");
	$('[name=PARENT_CODE_ID]').val( '${out.params.parentCodeId}');
	if( $('[name=PARENT_CODE_ID]').val() != '' ) {
		fn_SelectOption( $('[name=PARENT_CODE_ID]').val(), "CAT", "CODE_ID");
		$('[name=CODE_ID]').val( '${out.params.codeId}');
	}

	// 화상 솔루션	
	EMPCM.ASP.Init();

	$('.prdtTitle').each(function(){
		$(this).text( fn_LegnthOver( $(this).text(), 30 ) ); 
	});
	
	 var uAgent = navigator.userAgent.toLowerCase();
	    //< 모바일 기기 추가시 등록
	    var mobilePhones = new Array('iphone', 'ipod', 'android', 'blackberry', 'windows ce', 'nokia', 'webos', 'opera mini', 'sonyericsson', 'opera mobi', 'iemobile', 'windows phone');
	     
	    var isMobile = false;
	     
	    for( var i = 0 ; i < mobilePhones.length ; ++i )
	    {
	        if( uAgent.indexOf(mobilePhones[i]) > -1)
	        {
	            isMobile = true;
	             
	            break;
	        }
	    }
// 		테스트용
//         isMobile = true; 
        
	    //< 모바일인 경우
	    if( isMobile )
	    {
			
	    	$('#mobilePlus').text('더보기[+]');
	    	$('.mobileCss1').remove();
	    	$('#selectListCnt').remove();
	    	
	    	var inTag = '';
	    	inTag += '<tr>';
	    	inTag += '	<th scope="row" align="justify">분야</th>';
	    	inTag += '	<td class="mobileCss1" style="text-align:center;" colspan="2">';
	    	inTag += '		<select id="PARENT_CODE_ID" name="PARENT_CODE_ID" class="form-control form-control-sm col-8" title="분야" >';
	    	inTag += '			<option value="">선택해주세요.</option>';
	    	inTag += '		</select>';
	    	inTag += '	</td>';
	    	inTag += '</tr>';
	    	inTag += '<tr>';
	    	inTag += '	<th scope="row">분야상세</th>';
	    	inTag += '	<td style="text-align:center;"  colspan="2">';
	    	inTag += '		<select id="CODE_ID" name="CODE_ID" class="form-control form-control-sm col-8">';
	    	inTag += '			<option value="">분야를 선택해주세요.</option>';
	    	inTag += '		</select>';
	    	inTag += '	</td>';
	    	inTag += '</tr>';
	    	inTag += '<tr>';
	    	inTag += '	<th scope="row">마스터/회원명</th>';
	    	inTag += '	<td class="mobileCss1" style="text-align:center;"  colspan="2">';
	    	inTag += '		<input id="MASTER_NM" name="MASTER_NM" type="text" onkeypress="if(event.keyCode==13){fn_BtnSearch();}" class="form-control form-control-sm col-8" value="${out.params.masterNm}"/>';
	    	inTag += '	</td>';
	    	inTag += '</tr>';
	    	
	    	$('.mobileCss2').before( inTag );

	    	inTag = '<tr>';
	    	inTag += '	<th scope="row"></th>';
	    	inTag += '	<td style="text-align:center;" ><a id="btnSearch" onClick="fn_BtnSearch();" class="btn  btn-black">검색</a></td>';
	    	inTag += '</tr>	';

	    	$('.mobileCss3').after( inTag );

	    	$('.ml11').eq(0).text('ALL');
	    	$('.ml11').eq(1).text('채');
	    	$('.ml11').eq(2).text('화');
	    	$('.ml11').eq(3).text('이');
	    	$('.ml11').eq(4).text('라');

//	 		[진행] 1마스터, 2일자, 3시간, 4구분, 5상품명, 6상품코드, 7회원명, 8확정여부, 9사전질문, 10시작
//	    	필요한 td 아래로 분배
			$('.list_tbl01 > tbody > tr').each(function(key, val){ 
				$(this).after('<tr class="mobileTr'+key+'"></tr>');
				var mobileTr = 'mobileTr'+key+''; 
				// 상담시작 버튼 추가
				var clone9 = $(this).find('td:eq(10) button').text('상담');
				var clone9 = $(this).find('td:eq(10)').clone();
				$(this).find('td:eq(10)').empty().append('<label id="labelOpen'+key+'" for="btnOpen'+key+'">[+]</label><button id="btnOpen'+key+'" onclick="fn_BtnMobileList( \''+mobileTr+'\' );" style="display:none;">[+]</button>');

				var clone1 = $(this).find('td:eq(5)').attr('colspan','3').clone();
				var clone2 = $(this).find('td:eq(8)').clone();
				var clone3 = $(this).find('td:eq(9)').clone();
				var clone4 = $(this).find('td:eq(2)').text().trim();
				var clone5 = $(this).find('td:eq(3)').text().trim();
				var clone6 = $(this).find('td:eq(4)').text().trim();
				var clone7 = $(this).find('td:eq(10) button:eq(0)').text().trim();
				var clone8 = $(this).find('td:eq(7)').text().trim();
				
				$(this).find('td:eq(9)').hide();
				$(this).find('td:eq(8)').hide();
				$(this).find('td:eq(6)').hide();
				$(this).find('td:eq(5)').hide();
				$(this).find('td:eq(1)').hide();

				$(this).find('td:eq(2)').text( clone4.substr(5,10));
				$(this).find('td:eq(3)').text( clone5.substr(0,5));
				$(this).find('td:eq(4)').html( '<button class="btn btn-light ml11 form-control-sm" >'+clone6.substr(0,1)+'</button>' );
				$(this).find('td:eq(10) button:eq(0)').text( clone7.substr(0,2) + '\n' + clone7.substr(2,4));
				$(this).find('td:eq(10) button:eq(0)').css( 'white-space','break-spaces');
				$(this).find('td:eq(7)').html( is_too_long_word(clone8, '', 3, 'Y') );
				
				
				$('.mobileTr'+key+'').append( clone1 );//5상품명
				$('.mobileTr'+key+'').append( clone2 );//8확정여부
				$('.mobileTr'+key+'').append( clone3 );//9사전질문
				$('.mobileTr'+key+'').append( clone9 );//11상담시작
				$('.mobileTr'+key+' td').css('background-color','lightgrey');
				$('.mobileTr'+key+'').hide();
				$(this).find('td button').css( 'font-size','10px' );
				$(this).find('td').css( 'font-size','10px' );
				$('.mobileTr'+key+' td a').css( 'font-size','10px' );
				$('.mobileTr'+key+' td').css( 'font-size','10px' );
				$('.mobileTr'+key+' button').css( 'font-size','10px' );
			});

// 	    	헤더 제거
			$('.list_tbl01 > colgroup > col:eq(9)').remove();//6상품코드
			$('.list_tbl01 > colgroup > col:eq(8)').remove();//6상품코드 
			$('.list_tbl01 > colgroup > col:eq(6)').remove();//6상품코드
			$('.list_tbl01 > colgroup > col:eq(5)').remove();//1마스터아이디
			$('.list_tbl01 > colgroup > col:eq(1)').remove();//1마스터아이디
			
			$('.list_tbl01 > thead > tr > th:eq(9)').remove();
			$('.list_tbl01 > thead > tr > th:eq(8)').remove();
			$('.list_tbl01 > thead > tr > th:eq(6)').remove();
			$('.list_tbl01 > thead > tr > th:eq(5)').remove();  
			$('.list_tbl01 > thead > tr > th:eq(1)').remove();

	    }
});

//분야상세 값 변경
$("[name=PARENT_CODE_ID]").on('change',function(k){
	$('[name=CODE_ID]').empty();
	$('[name=CODE_ID]').append('<option value="">분야를 선택해주세요.</option>');
	if( $(this).val() != '' ) fn_SelectOption($(this).val(), "CAT", "CODE_ID");
});

//////////////////////////////////////////////////////////
//3. 사용자 함수
//////////////////////////////////////////////////////////
function fn_BtnMobileList( CLASS ){
	var labelOpen = 'labelOpen' + CLASS.slice(CLASS.length-1,CLASS.length);
	if( $('.'+CLASS+'').css('display') == 'none' ) {
		$('.'+CLASS+'').show();
		$('#'+labelOpen+'').text('[-]');
	} else {
		$('.'+CLASS+'').hide();
		$('#'+labelOpen+'').text('[+]');
	}
}

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


function fn_DataListQues( PARAMS, OBJECT_ID, CNT ) {
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result.out.detail.data;
	var inTag = '';

//	 INFO |---------|-----------------------|----------|---------|--------| 
//	 INFO |QUES_IDX |QUES_CNTN              |DATA_CNTN |NUM_DESC |NUM_ASC | 
//	 INFO |---------|-----------------------|----------|---------|--------| 
//	 INFO |6        |1. Are you sure &#63;  |확신합니다     |2        |1       | 
//	 INFO |5        |1. 온 몸이 부숴질거 같나요 &#63; |글세요       |1        |2       | 
//	 INFO |---------|-----------------------|----------|---------|--------| 
	 
	 if( jsonData != null ) {
		$('#'+OBJECT_ID+'').empty();
		 
		$.each(jsonData, function(key, val) {
			inTag += '<tr>';
			inTag += '<td>'+ val.NUM_DESC + '</td>';
			inTag += '<td style="text-align: left;" >'+ val.QUES_CNTN + '</td>';
			inTag += '<td style="text-align: left;" >'+ val.DATA_CNTN + '</td>';
			inTag += '</tr>';
		});
		
		$('#'+OBJECT_ID+'').append( inTag );
	 }
}


function fn_DataListBuyCons( PARAMS, OBJECT_ID, CNT, BUY_TIME ) {
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result.out.detail.data;
	var inTag = '';
	var buyIdx = '';
// 	 INFO |--------------|---------|----------|--------|-----------------|----------|--------------------| 
// 	 INFO |MAST_USER_IDX |USER_IDX |MASTER_NM |USER_NM |HIST_CNTN        |HIST_UUID |SYS_REG_DTM         | 
// 	 INFO |--------------|---------|----------|--------|-----------------|----------|--------------------| 
// 	 INFO |1             |0        |마스터1      |        |안녕하세요, 수퍼 마스터입니다 |[null]    |2020-11-25 14:44:18 | 
// 	 INFO |0             |4        |          |회원1     |안녕하세요 마스터님!      |[null]    |2020-11-25 14:44:19 | 
// 	 INFO |1             |0        |마스터1      |        |수고하셨습니다          |[null]    |2020-11-26 15:16:15 | 
// 	 INFO |0             |4        |          |회원1     |다음에 또 신청할게요~     |[null]    |2020-11-26 15:16:29 | 
// 	 INFO |--------------|---------|----------|--------|-----------------|----------|--------------------| 

	 if( jsonData != null ) {
		$('#'+OBJECT_ID+'').empty();
		$.each(jsonData, function(key, val) {
			if( buyIdx != val.BUY_IDX ) {
				inTag += '<tr>';
				if( val.TIME_DTM != '' ) inTag += '<td colspan="3" id="'+val.BUY_IDX+'"><h3>'+ val.TIME_DTM + ' ' + val.TIME_STR +' ~ ' + val.TIME_END + '</h3></td>';
				else inTag += '<td colspan="3" id="'+val.BUY_IDX+'"><h3>'+ val.TIME_STR_DTM +' ~ ' + val.TIME_END_DTM + '</h3></td>';
				inTag += '</tr>';
				buyIdx = val.BUY_IDX;
			}
			
			var type = '';
			if( val.USER_NM != '' ) type = 'style="text-align: left;"';
			else if( val.USER_NM == '' ) type = 'style="text-align: right;"';
			
			inTag += '<tr>';
			inTag += '<td>'+ val.USER_NM + '</td>';
			inTag += '<td '+ type +'>'+ val.HIST_CNTN + '<br><span style="font-size:10px;">'+ val.SYS_REG_DTM +'</span></td>';
			inTag += '<td>'+ val.MASTER_NM + '</td>';
			inTag += '</tr>';
		});
		
		$('#'+OBJECT_ID+'').append( inTag );
	 }
}


function fn_DataListVodList( PARAMS, OBJECT_ID, CNT ) {
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result.out.detail.data;
	var inTag = '';
// 	 INFO |--------------|---------|----------|--------|-----------------|----------|--------------------| 
// 	 INFO |MAST_USER_IDX |USER_IDX |MASTER_NM |USER_NM |HIST_CNTN        |HIST_UUID |SYS_REG_DTM         | 
// 	 INFO |--------------|---------|----------|--------|-----------------|----------|--------------------| 
// 	 INFO |1             |0        |마스터1      |        |안녕하세요, 수퍼 마스터입니다 |[null]    |2020-11-25 14:44:18 | 
// 	 INFO |0             |4        |          |회원1     |안녕하세요 마스터님!      |[null]    |2020-11-25 14:44:19 | 
// 	 INFO |1             |0        |마스터1      |        |수고하셨습니다          |[null]    |2020-11-26 15:16:15 | 
// 	 INFO |0             |4        |          |회원1     |다음에 또 신청할게요~     |[null]    |2020-11-26 15:16:29 | 
// 	 INFO |--------------|---------|----------|--------|-----------------|----------|--------------------| 

	 if( jsonData != null ) {
		$('#'+OBJECT_ID+'').empty();
		 
		$.each(jsonData, function(key, val) {
			var vodTotal = '['+val.LECT_NM+'] 강좌진행 : '+(val.NUM_DESC+'')+'/'+(val.VOD_TOTAL+'');
			$('#vodTotal').text( vodTotal );

			inTag += '<tr>';
			inTag += '<td>'+ val.USER_NM + '</td>';
			inTag += '<td>'+ val.LECT_NM + '</td>';
			inTag += '<td>'+ val.VOD_NM + '</td>';
			inTag += '<td>'+ val.DATA_TITL + '</td>';
			inTag += '<td>'+ val.DATA_CD + '</td>';
			inTag += '</tr>';
		});
		
		$('#'+OBJECT_ID+'').append( inTag );
	 }
}

function fn_BtnSolutionPopup( url, BUY_IDX ){
	 var winObj = window.open( url ,'tistory','width=1400px, height=800px, scrollbars=no, resizable=no, toolbars=no, menubar=no');
	
	  var loop = setInterval(function() {
	      if(winObj.closed) {

				var params = new Object();
				params.status = "WRITE";
				params.query = "insertChatEnd";
				params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
				params.BUY_IDX = BUY_IDX;
				var result = fn_DataAjax2( params );
				
		// 	 	결제완료 SMS 통보
				var params = new Object();
				params.status = "EDIT_SMS";
				params.query = "selectPaySmsList";
				params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
				params.BUY_IDX = BUY_IDX;
			 	var result = fn_DataAjax2( params );
				

				location.reload();
	      }  
	  }, 1000);
}

function fn_BtnPrdtConfirm( BUY_IDX ){
	
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectHwackjungDetail";
	params.BUY_IDX = BUY_IDX;
	
	var hwackjungYn = fn_DataAjax2( params );
	if ( hwackjungYn.out.detail.data[0].SANG_DAM_HWACK_JUNG_YN != 'Y' ) {
		
		params.status = "EDIT";
		params.query = "updateHwackjungYn";
		
		fn_DataAjax2( params );
		
		var params = new Object();
		params.status = "EDIT_SMS";
		params.query = "selectPaySmsList";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		params.BUY_IDX = BUY_IDX;
		params.PrdtConfirm = 1;
		
	 	var result = fn_DataAjax2( params );
	 	
	 	alert('확정 SMS을 발송했습니다.');
	}else{
		
		if ( confirm('이미 확정처리된 상담입니다. SMS를 다시 발송하시겠습니까?') ) {
			
			var params = new Object();
			params.status = "EDIT_SMS";
			params.query = "selectPaySmsList";
			params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
			params.BUY_IDX = BUY_IDX;
			params.PrdtConfirm = 1;
			
		 	var result = fn_DataAjax2( params );
		 	
		 	alert('확정 SMS을 발송했습니다.');
		}
	}

	location.reload();
		
}


function makeHistUrl( url, cateIdx, userIdx ){
	var urlArr = url.split('?');
	return "https://peoplemade.net/front/mypeoplemade/face_history_list?"+urlArr[1];
}

</script>



