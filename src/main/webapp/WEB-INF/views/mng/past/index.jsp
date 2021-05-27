<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDateValue"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'index', 'ajax')}" />

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
/* .alert_layer{width: 1200px !important;margin-left: -600px !important;height: 600px !important;margin-top: -400px !important;} */
.datepicker{z-index:1 !important;}

.faq_title_box {
    position: relative;
    padding: 10px 0;
}
.faq_title_box::after {
    content: '';
    display: block;
    clear: both;
}
.ft_title_box {
    float: left;
    padding-left: 20px;
}
.ft_cate {
    display: block;
    margin-bottom: 14px;
    color: #1eccb4;
    font-size: 17px;
}
.ft_title {
    font-size: 20px;
}
 .acco_toggle {
    position: absolute;
    bottom: 30px;
    right: 30px;
    width: 20px;
    height: 20px;
    background: url(/resources/assets/images/icon/icon_plus.png) center center / cover no-repeat;
    border: none;
}
 .active .acco_toggle {
    width: 20px;
    height: 20px;
    background: url(/resources/assets/images/icon/icon_minus.png) center center / 20px 2px no-repeat;
}

 .acco_toggle.acco_toggle_cntn {
    position: absolute;
    bottom: 30px;
    right: 30px;
    width: 20px;
    height: 20px;
    background: url(/resources/assets/images/icon/icon_minus.png) center center / 20px 2px no-repeat;
    border: none;
}
 .active .acco_toggle.acco_toggle_cntn {
    width: 20px;
    height: 20px;
    background: url(/resources/assets/images/icon/icon_plus.png) center center / cover no-repeat;
}

.acco_box.active > .acco_title{
/* 	display: none; */
}

.faq_content {
    padding: 10px;
}
.faq_content::after {
    content: '';
    display: block;
    clear: both;
}

.fc_text {
    float: left;
    width: calc(100% - 40px);
    padding-left: 10px;
    margin-top: 5px;
    font-size: 20px;
    font-weight: 300;
}
.acco_content {
    display: none;
    position: relative;
}

</style>

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
					<input id="timeDtmSrt" name="timeDtmSrt" readonly="readonly" onChange="inputDateComparison(this, 'timeDtmSrt', 'timeDtmEnd' );" type="text" class="form-control form-control-sm datepicker " value="${sysStrValue }"  style="width:45%;float:left;"/>
					<span style="padding: 8px;display: inline-block; float:left;">~</span>
					<c:choose>
						<c:when test='${out.params.timeDtmEnd eq "" or empty out.params.timeDtmEnd }'><c:set var="sysEndValue" value="${sysDateValue }"/></c:when>
						<c:otherwise><c:set var="sysEndValue" value="${out.params.timeDtmEnd}"/></c:otherwise>
					</c:choose>
					<input id="timeDtmEnd" name="timeDtmEnd" readonly="readonly" onChange="inputDateComparison(this, 'timeDtmSrt', 'timeDtmEnd' );" type="text" class="form-control form-control-sm datepicker " value="${sysEndValue }"  style="width:45%;float:left;" /> 
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
			<col style="width: 0.5%;" />
			<col style="width: 10%;" />	<!-- 제거 -->
			<col style="width: 7%;" />
			<col style="width: 10%;" />
			<col style="width: 10%;" />
			
			<col>						<!-- 제거 -->
			<col style="width: 8%;" />	<!-- 제거 -->
			<col style="width: 9%;" />	
			<col style="width: 5%;" />	<!-- 제거 -->
			<col style="width: 4%;" />	<!-- 제거 -->
	
			<col style="width: 5%;" />			
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
				<th scope="col">사전질문</th>
				<th scope="col">회원리뷰</th>
				
				<th scope="col" id="mobilePlus">상담내역</th>
				<th scope="col">마스터후기</th>
				
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row">
 
					<tr>
						<td>${row.NUM_DESC_ORDER }</td>
<%-- 						<td>${row.MASTER_NM }</td> --%>
						<td>${row.MASTER_ID }</td>
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
								<c:when test="${row.TIME_STR != ''}">
								<a class="btn " onclick='fn_BtnDatePopup("selectMngQuesList", "writeQuesTbody", "writeQues", ${row.PRDT_IDX }, "${row.PRDT_TYPE }", ${row.BUY_IDX }, ${row.USER_IDX });'>질문</a>
								</c:when>
								<c:otherwise>-</c:otherwise>
							</c:choose>
						</td>
						<td>
							<a class="btn "  onclick='fn_BtnDatePopup("selectMngUserReviList", "userReviTbody", "userRevi", ${row.PRDT_IDX }, "${row.PRDT_TYPE }", ${row.BUY_IDX }, ${row.USER_IDX });'>리뷰</a>
						</td>
						<td>
							<c:if test="${row.TIME_STR != ''}">
								<c:choose>
									<c:when test="${row.PRDT_TYPE == '화상'}">
										<c:if test="${ row.HIST_VOD_ADDR ne 'NOVOD' }">
											<button class="btn " onclick='window.open("${row.HIST_VOD_ADDR}")'>상담내역</button>
										</c:if>
										<c:if test="${ row.HIST_VOD_ADDR eq 'NOVOD' }">
											<button class="btn " onclick='alert("저장된 동영상이 없습니다.");'>상담내역</button>
										</c:if>
									</c:when>
									<c:when test="${row.PRDT_TYPE == '라이브클래스'}">
										<c:if test="${ row.HIST_VOD_ADDR ne 'NOVOD' }">
											<button class="btn " onclick='window.open("${row.HIST_VOD_ADDR}")'>상담내역</button>
										</c:if>
										<c:if test="${ row.HIST_VOD_ADDR eq 'NOVOD' }">
											<button class="btn " onclick='alert("저장된 동영상이 없습니다.");'>상담내역</button>
										</c:if>
									</c:when>
									<c:otherwise>
<%-- 										<a class="btn " onclick='fn_BtnDatePopup("selectMngBuyConsList", "buyConsTbody", "buyCons", ${row.PRDT_IDX }, "${row.PRDT_TYPE }", ${row.BUY_IDX }, ${row.USER_IDX }, "${row.PRDT_CD }", "${row.TIME_DTM }");'>상담내역</a> --%>
										<button class="btn " onclick="fn_BtnSolutionPopup( '${row.MOVE_URL}', '_blank','width=1440px, height=760px, scrollbars=no, resizable=no, toolbars=no, menubar=no');">상담내역</button>
									</c:otherwise>
								</c:choose>
							</c:if>
							
							<c:if test="${row.PRDT_TYPE == 'VOD'}">
								<a class="btn " onclick='fn_BtnDatePopup("selectMngBuyVodList", "vodListTbody", "vodList", ${row.PRDT_IDX }, "${row.PRDT_TYPE }", ${row.BUY_IDX }, ${row.USER_IDX }, "${row.PRDT_CD }");'>진행내역</a>
							</c:if>
							
							<c:if test="${row.PRDT_TYPE == '이메일'}">
								<button class="btn " onclick="fn_BtnSolutionPopup( '${row.MOVE_URL}', '_blank','width=1440px, height=760px, scrollbars=no, resizable=no, toolbars=no, menubar=no');">상담내역</button>
							</c:if>
						</td>
						<td>
							<a class="btn " onclick='fn_BtnDatePopup("selectMngMastReviList", "mastReviTbody", "mastRevi", ${row.PRDT_IDX }, "${row.PRDT_TYPE }", ${row.BUY_IDX }, ${row.USER_IDX });'>후기</a>
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

	<c:set value="${out.list.paging}"  var="paging" />
	<%@ include file="/WEB-INF/views/shared/mng_paging.jspf" %>

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
						<a class="btn   btn-outline-dark" data-action="popup_hide">닫기</a>
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
						<a class="btn   btn-outline-dark" data-action="popup_hide">닫기</a>
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
						<a class="btn   btn-outline-dark" data-action="popup_hide">닫기</a>
					</div>
					<!--// End 팝업 컨텐츠 -->
				</div>
			</div>
		</div>
	</div>
</div>

<div id="mastRevi" class="alert_wrap">
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
							<input name="REVI_IDX" type="hidden" />
							<input name="BUY_IDX" type="hidden" />
							<colgroup>
								<col style="width: 10%;" />
								<col />
								
							</colgroup>
							<thead>
								<tr>
									<th scope="col">등록일</th>
									<th scope="col">마스터후기</th>
								</tr>
							</thead>
							<tbody id="mastReviTbody">
								<td >${sysDateValue }</td>
								<td style="text-align: left !important;">
									<textArea id="REVI_CNTN" name="REVI_CNTN"></textArea>
								</td>
							</tbody>
						</table>
					</div>

					<div class="btn_wrap" style="text-align: right;">
						<a id="reviRegist" class="btn   btn_key_color" onclick="fn_BtnRegistMastRevi();" data-action="popup_hide">저장</a>
						<a class="btn   btn-outline-dark" data-action="popup_hide">닫기</a>
					</div>
					<!--// End 팝업 컨텐츠 -->
				</div>
			</div>
		</div>
	</div>
</div>

<div id="userRevi" class="alert_wrap">
	<div class="alert_layer">
		<div class="alert_inner">
			<div class="alert_header">
				<button class="btn btn_close_pop" style="display: block; top: 5px; right: 5px; border: none;" data-action="popup_hide"></button>
			</div>				
			<div class="dialog_content" >
				<div class="scroll_area">
					<h3>회원리뷰내역</h3>
					<div class="tbl_list" style="height: 450px;    overflow-y: scroll;">
						<table class="list_tbl01">
							<colgroup>
								<col style="width: 10%;" />
								<col />
								<col style="width: 10%;" />
								<col style="width: 10%;" />
								
							</colgroup>
							<thead>
								<tr>
									<th scope="col">회원</th>
									<th scope="col">내용</th>
									<th scope="col">평점</th>
									<th scope="col">공개여부</th>
								</tr>
							</thead>
							<tbody id="userReviTbody">
							</tbody>
						</table>
					</div>

					<div class="btn_wrap" style="text-align: right;">
						<a class="btn   btn-outline-dark" data-action="popup_hide">닫기</a>
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

//////////////////////////////////////////////////////////
// 2. 첫 실행 함수
//////////////////////////////////////////////////////////
$(function(){
// 	fn_SelectOption("CAT01","CAT","testSelect");
	fn_makeSummerNote( 'REVI_CNTN' );
	fn_SelectOption("", "CAT", "PARENT_CODE_ID");
	$('[name=PARENT_CODE_ID]').val( '${out.params.parentCodeId}');
	if( $('[name=PARENT_CODE_ID]').val() != '' ) {
		fn_SelectOption( $('[name=PARENT_CODE_ID]').val(), "CAT", "CODE_ID");
		$('[name=CODE_ID]').val( '${out.params.codeId}');
	}
	
	// 아코디언
	accoFc();

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
//		테스트용
//        isMobile = true; 
       
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

//	 		[진행] 1마스터, 2일자, 3시간, 4구분, 5상품명, 6상품코드, 7회원명, 8사전질문, 9리뷰확인, 10상담내역, 11마스터후기
//	    	필요한 td 아래로 분배
			$('.list_tbl01 > tbody > tr').each(function(key, val){ 
				$(this).after('<tr class="mobileTr'+key+'"></tr>');
				var mobileTr = 'mobileTr'+key+''; 
				// 상담시작 버튼 추가
				var clone9 = $(this).find('td:eq(10) button').text('상담내역');
				var clone9 = $(this).find('td:eq(10)').clone();
				$(this).find('td:eq(10)').empty().append('<label id="labelOpen'+key+'" for="btnOpen'+key+'">[+]</label><button id="btnOpen'+key+'" onclick="fn_BtnMobileList( \''+mobileTr+'\' );" style="display:none;">[+]</button>');


				var clone2_1 = $(this).find('td:eq(8) a').text().trim();
				var clone4 = $(this).find('td:eq(2)').text().trim();
				var clone5 = $(this).find('td:eq(3)').text().trim();
				var clone6 = $(this).find('td:eq(4)').text().trim();
				var clone7 = $(this).find('td:eq(10) button:eq(0)').text().trim();
				var clone8 = $(this).find('td:eq(7)').text().trim();
				var clone8_1 = $(this).find('td:eq(11) a').text().trim();

				$(this).find('td:eq(2)').text( clone4.substr(5,10));
				$(this).find('td:eq(3)').text( clone5.substr(0,5));
// 				$(this).find('td:eq(4)').text( clone6.substr(0,1));
				$(this).find('td:eq(4)').html( '<button class="btn btn-light ml11 form-control-sm" >'+clone6.substr(0,1)+'</button>' );
				$(this).find('td:eq(10) button:eq(0)').text( clone7.substr(0,2) + '\n' + clone7.substr(2,4));
				$(this).find('td:eq(10) button:eq(0)').css( 'white-space','break-spaces');
				$(this).find('td:eq(7)').html( is_too_long_word(clone8, '', 3, 'Y') );
// 				$(this).find('td:eq(8) a:eq(0)').text( clone2_1.substr(0,2) + '\n' + clone2_1.substr(2,4));
// 				$(this).find('td:eq(8) a:eq(0)').css( 'white-space','break-spaces');
// 				$(this).find('td:eq(11) a:eq(0)').text( clone8_1.substr(0,3) + '\n' + clone8_1.substr(3,5));
// 				$(this).find('td:eq(11) a:eq(0)').css( 'white-space','break-spaces');

				var clone1 = $(this).find('td:eq(5)').attr('colspan','3').clone();
				var clone2 = $(this).find('td:eq(8)').clone();
				var clone3 = $(this).find('td:eq(9)').clone();
				var clone3_1 = $(this).find('td:eq(11)').attr('colspan','99').clone();

				$(this).find('td:eq(11)').hide();
				$(this).find('td:eq(9)').hide();
				$(this).find('td:eq(8)').hide();
				$(this).find('td:eq(6)').hide();
				$(this).find('td:eq(5)').hide();
				$(this).find('td:eq(1)').hide();
				
				$('.mobileTr'+key+'').append( clone1 );//5상품명
// 				$('.mobileTr'+key+'').append( clone2 );//8사전질문
				$('.mobileTr'+key+'').append( clone9 );//10상담내역
				$('.mobileTr'+key+'').append( clone3 );//9리뷰확인
				$('.mobileTr'+key+'').append( clone3_1 );//11마스터후기
				
				$('.mobileTr'+key+' td').css('background-color','lightgrey');
				$('.mobileTr'+key+'').hide();
				$(this).find('td button').css( 'font-size','10px' );
				$(this).find('td').css( 'font-size','10px' );
				$('.mobileTr'+key+' td a').css( 'font-size','10px' );
				$('.mobileTr'+key+' td').css( 'font-size','10px' );
				$('.mobileTr'+key+' button').css( 'font-size','10px' );
			});

//	    	헤더 제거
			$('.list_tbl01 > colgroup > col:eq(11)').remove();//6상품코드
			$('.list_tbl01 > colgroup > col:eq(9)').remove();//6상품코드
			$('.list_tbl01 > colgroup > col:eq(8)').remove();//6상품코드 
			$('.list_tbl01 > colgroup > col:eq(6)').remove();//6상품코드
			$('.list_tbl01 > colgroup > col:eq(5)').remove();//1마스터아이디
			$('.list_tbl01 > colgroup > col:eq(1)').remove();//1마스터아이디

			$('.list_tbl01 > thead > tr > th:eq(11)').remove();
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

function fn_BtnDatePopup( QUERY, TBODY, POPUP, PRDT_IDX, PRDT_TYPE, BUY_IDX, USER_IDX, PRDT_CD, TIME_DTM ) {

	var chatId = "";
	
	var params = new Object();
	params.status = "LIST";
	params.query = QUERY;
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.PRDT_IDX = PRDT_IDX;
	params.PRDT_TYPE = PRDT_TYPE;
	
	if( TBODY == 'mastReviTbody' || TBODY == 'userReviTbody' ) {
		params.BUY_IDX = BUY_IDX; 
		params.USER_IDX = USER_IDX;
		if ( TBODY == 'mastReviTbody' ) {
			fn_DataListQues( params, TBODY, 5 );
		}else if( TBODY == 'userReviTbody' ){
			fn_DataListUserRevi( params, TBODY );
		}
	} else if( PRDT_CD != null) {
		params.BUY_IDX = BUY_IDX;
		params.USER_IDX = USER_IDX;
		params.PRDT_CD = PRDT_CD;
		if( PRDT_CD.indexOf("VL") > -1) fn_DataListVodList( params, TBODY, 5 );
		else chatId = fn_DataListBuyCons( params, TBODY, 5, TIME_DTM );
	} else {
		params.BUY_IDX = BUY_IDX; 
		params.USER_IDX = USER_IDX;
		fn_DataListQues( params, TBODY, 5 );
	}
	
	alertShow('70%','',POPUP);
	if ( chatId != "" && typeof chatId != 'undefined'  ) 
		$('.tbl_list').scrollTop( $('#'+chatId ).position().top );
		
}

function fn_DataListQues( PARAMS, OBJECT_ID, CNT ) {
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result.out.detail.data;
	var inTag = '';
	 

	 if( jsonData != null ) {
		 
		if( OBJECT_ID == 'mastReviTbody' ) {
// 			 INFO |---------|--------|---------|----------|----------|------------|--------------------|------------|--------------------| 
// 			 INFO |REVI_IDX |BUY_IDX |CATE_IDX |REVI_CNTN |REVI_UUID |SYS_REG_IDX |SYS_REG_DTM         |SYS_MOD_IDX |SYS_MOD_DTM         | 
// 			 INFO |---------|--------|---------|----------|----------|------------|--------------------|------------|--------------------| 
// 			 INFO |1        |5       |4        |후기        |[null]    |1           |2021-01-06 15:58:31 |1           |2021-01-06 15:58:31 | 
// 			 INFO |---------|--------|---------|----------|----------|------------|--------------------|------------|--------------------| 
			 
			$('[NAME=BUY_IDX]').val( PARAMS.BUY_IDX );
			$('[NAME=REVI_IDX]').val( '' );
			$('#REVI_CNTN').summernote('code', '' );
			
			var cntnChk = '';
			$.each(jsonData, function(key, val) {
				$('[NAME=REVI_IDX]').val( val.REVI_IDX );
				$('#REVI_CNTN').summernote('code', val.REVI_CNTN );
				$('#'+OBJECT_ID+' > td').eq(0).text( val.SYS_REG_DTM );

				cntnChk = val.REVI_CNTN;
			});

// 			if( cntnChk != '' ) $('#reviRegist').hide();
// 			else $('#reviRegist').show();
			
			
		} else {
			$('#'+OBJECT_ID+'').empty();
//		 	 INFO |---------|-----------------------|----------|---------|--------| 
//		 	 INFO |QUES_IDX |QUES_CNTN              |DATA_CNTN |NUM_DESC |NUM_ASC | 
//		 	 INFO |---------|-----------------------|----------|---------|--------| 
//		 	 INFO |6        |1. Are you sure &#63;  |확신합니다     |2        |1       | 
//		 	 INFO |5        |1. 온 몸이 부숴질거 같나요 &#63; |글세요       |1        |2       | 
//		 	 INFO |---------|-----------------------|----------|---------|--------| 

			$.each(jsonData, function(key, val) {
				inTag += '<tr>';
				inTag += '<td >'+ val.NUM_DESC + '</td>';
				inTag += '<td style="text-align: left;" >'+ val.QUES_CNTN + '</td>';
				inTag += '<td style="text-align: left;" >'+ val.DATA_CNTN + '</td>';
				inTag += '</tr>';
			});
			$('#'+OBJECT_ID+'').append( inTag );
		}
	 }
}


function fn_DataListBuyCons( PARAMS, OBJECT_ID, CNT, TIME_DTM ) {
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result.out.detail.data;
	var inTag = '';
	var buyIdx = '';
	var prdtType = '';
	
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
			prdtType = val.PRDT_TYPE;
			if( buyIdx != val.BUY_IDX ) {
				inTag += '<tr>';
				if( val.TIME_DTM != '' ) inTag += '<td colspan="3" id="'+val.PRDT_TYPE+val.TIME_DTM+'"><h3>'+ val.TIME_DTM + ' ' + val.TIME_STR +' ~ ' + val.TIME_END + '</h3></td>';
				else inTag += '<td colspan="3" id="'+val.PRDT_TYPE+TIME_DTM+'"><h3>'+ val.TIME_STR_DTM +' ~ ' + val.TIME_END_DTM + '</h3></td>';
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
		
// 		$('.tbl_list').animate({scrollTop : 200});
// 		$('.tbl_list').scrollTop( 200 );
		if ( $('[id^='+prdtType+TIME_DTM+']').length ) {
			
			if( $('[id^='+prdtType+TIME_DTM+']').attr('id').indexOf( TIME_DTM ) > -1 ) {
				var position = $('#'+prdtType+TIME_DTM ).position();
				return prdtType+TIME_DTM;
			}
			
		}
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

function fn_BtnRegistMastRevi() {
	var params = new Object();
	params.status = "EDIT";
	params.query = "insertMastRevi";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	
	params.REVI_IDX = $('[NAME=REVI_IDX]').val();
	params.BUY_IDX = $('[NAME=BUY_IDX]').val();
	params.REVI_CNTN = $('[NAME=REVI_CNTN]').val();
// 	params.REVI_UUID = $('[NAME=REVI_UUID]').val();
	
	var result = fn_DataAjax2( params );
	location.reload();
	
}

function fn_DataListUserRevi( PARAMS, OBJECT_ID ){
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result.out.detail.data;
	var inTag = '';
	var buyIdx = '';
	var prdtType = '';
	
	 if( jsonData != null ) {
		 
			if ( jsonData.length == 0 ) {
				inTag += '<tr><td colspan="9999"><h4><b>작성된 리뷰가 없습니다.</b></h4></td></tr>'; 
			}	
		 
		 	$('#'+OBJECT_ID+'').empty();
			 
			$.each(jsonData, function(key, val) {
				
				var type = '';
				type = 'style="text-align: left;"';
				
				inTag += '<tr>';
				inTag += '<td>'+ val.USER_NICK + '</td>';
// 				inTag += '<td '+ type +'>'+ val.REVI_CNTN + '<br><span style="font-size:10px;">'+ val.SYS_REG_DTM +'</span></td>';
				inTag += '<td '+ type +'>';
				
				inTag += '<div class="acco_box">';
				inTag += '<div class="acco_title">';
				inTag += '<div class="faq_title_box">';
				inTag += '<span class="ft_icon"></span>';
				inTag += '<div class="ft_title_box">';
				inTag += '<span class="ft_title">'+val.REVI_CNTN+'<br><span style="font-size:10px;">'+ val.SYS_REG_DTM +'</span></span>';
				inTag += '</div>';
				inTag += '<button type="button" class="acco_toggle"></button>';
				inTag += '</div>';
				inTag += '</div>';
				inTag += '<div class="acco_content">';
				inTag += '<div class="faq_content">';
				inTag += '<p class="fc_text">'+val.REVI_CNTN+'<br><span style="font-size:10px;">'+ val.SYS_REG_DTM +'</span></p>';
				inTag += '</div>';
				inTag += '<button type="button" class="acco_toggle acco_toggle_cntn"></button>';
				inTag += '</div>';
				inTag += '</div>';
				inTag += '</td>';
				
				inTag += '<td>'+ val.REVI_SCOR + '</td>';
				inTag += '<td>'+ val.REVI_PUBL_YN + '</td>';
				inTag += '</tr>';
			});
			
			$('#'+OBJECT_ID+'').append( inTag );
			
//	 		$('.tbl_list').animate({scrollTop : 200});
//	 		$('.tbl_list').scrollTop( 200 );
	}
			accoFc();
	
}

function accoFc() {
    var $btn = $('.acco_toggle');

    $btn.on( 'click', function(){
        $(this).parents('.acco_box').toggleClass('active').children('.acco_title').toggle();
        $(this).parents('.acco_box').toggleClass('active').children('.acco_content').slideToggle();
    });

    var $btnSingle = $('.acco_toggle_single');

    $btnSingle.on( 'click', function(){
    	$(this).parents('.acco_box').toggleClass('active').children('.acco_title').toggle();    	
        $(this).parents('.acco_box').toggleClass('active').children('.acco_content').slideToggle();
        $(this).parents('.acco_box').siblings('.acco_box').removeClass('active').children('.acco_content').slideUp();
    });
}

function fn_BtnSolutionPopup( url, IDX ){
	if ( url.indexOf('chat_solution') > -1 ) {
		url = url.replace('chat_solution', 'chat_review');
	}	
	 var winObj = window.open( url ,'tistory','width=1400px, height=800px, scrollbars=no, resizable=no, toolbars=no, menubar=no');
	
	  var loop = setInterval(function() {   
	      if(winObj.closed) {
				location.reload();
	      }  
	  }, 1000);
}


</script>



