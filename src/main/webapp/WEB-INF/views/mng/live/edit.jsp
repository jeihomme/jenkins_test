<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDateValue"><fmt:formatDate value="${now}" pattern="yyyyMM" /></c:set>
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'index', 'ajax')}" />

<style>
.ui-timepicker-container.ui-timepicker-standard{z-index: 2002!important;}

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
.tbl_view::-webkit-scrollbar, .tbl_list::-webkit-scrollbar {display:block;}
</style> 
<!-- 쓰기  시작-->	
<div class="remark" style="font-size:13px; padding-bottom:7px; margin-left:0;">모든값은 필수입력 항목입니다.</div>			
<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>공지사항 관리 테이블</caption>
		<colgroup>
			<col style="width: 10%;"/>
			<col style="width: 40%;"/>
			<col style="width: 10%;"/>
			<col style="width: 40%;"/>
		</colgroup>
		<tbody>
			<input type="hidden" name="LIVE_IDX" class="form-control form-control-sm col-8"/>
			<tr>
				<th scope="row">상품코드</th>
				<td colspan="3" style="text-align:left;">
						<input type="text" name="LIVE_CD" class="form-control form-control-sm col-8" DISABLED />	
				</td>
			</tr>	
			<tr>
				<th scope="row">라이브유형</th>
				<td colspan="3" style="text-align:left;" >
					<span id="LIVE_ACAD_YN"></span>
					<div class="designRadiobutton form-control-sm" style="display:none;">
						<input type="radio" id="radio_LIVE_ACAD_CD_N" name="LIVE_ACAD_YN" value="N" checked/>
						<label for="radio_LIVE_ACAD_CD_N" class="label_txt">라이브클래스</label>
					</div>
					<div class="designRadiobutton form-control-sm" style="display:none;">
						<input type="radio" id="radio_LIVE_ACAD_CD_Y" name="LIVE_ACAD_YN" value="Y" />
						<label for="radio_LIVE_ACAD_CD_Y" class="label_txt">라이브아카데미</label>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">판매상태<span class="red">*</span></th>
				<td>
					<div class="form-inline">
						<div class="designRadiobutton form-control-sm">
							<input type="radio" id="radio1_2" name="LIVE_STAT_CD" value="SAL01" checked/>
							<label for="radio1_2" class="label_txt">판매대기</label>
						</div>
						<div class="designRadiobutton form-control-sm">
							<input type="radio" id="radio1_1" name="LIVE_STAT_CD" value="SAL02" />
							<label for="radio1_1" class="label_txt">판매중</label>
						</div>
						<div class="designRadiobutton form-control-sm">
							<input type="radio" id="radio1_3" name="LIVE_STAT_CD" value="SAL03" />
							<label for="radio1_3" class="label_txt">판매종료</label>
						</div>
					</div>				
				</td>
			</tr>
<!-- 			<tr> -->
<!-- 				<th scope="row">판매상태</th> -->
<!-- 				<td colspan="3" style="text-align:left;"> -->
<!-- 					<select id="LIVE_STAT_CD" name="LIVE_STAT_CD" class="form-control form-control-sm col-8" autocomplete="new-password" autocomplete__wrapper> -->
<!-- 						<option value="">전체</option> -->
<!-- 					</select> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th scope="row">상품명</th> -->
<!-- 				<td colspan="3" style="text-align:left;"> -->
<!-- 						<input type="text" name="LIVE_NM" class="form-control form-control-sm col-8" title="제목 입력" /> -->
<!-- 				</td> -->
<!-- 			</tr> -->
			<tr>
				<th scope="row">분야</th>
				<td>
					<div class="form-inline">
						<select id="PARENT_CODE_ID" name="PARENT_CODE_ID" disabled class="form-control form-control-sm col-8" title="마스터 영역" >
							<option value="">선택해주세요</option>
						</select>
					</div>	
				</td>
			<tr>
			<tr>
				<th scope="row">분야상세</th>
				<td >
					<input type="hidden" name="CODE_ID" />
					<div class="form-inline">
						<select id="MAIN_CODE_ID" name="MAIN_CODE_ID" disabled class="form-control form-control-sm col-8" title="마스터 영역" >
							<option value="">분야를 선택해주세요</option>
						</select>
					</div>	
				</td>
			</tr>
			<tr>
				<th scope="row">마스터<span class="red">*</span></th>
				<td>
					<div class="remark" style="font-size:13px; padding-bottom:7px; margin-left:0;">* 마스터는 변경할 수 없습니다.</div>
					<div class="form-inline" >
						<select id="CATE_IDX" name="CATE_IDX"  disabled="disabled" class="form-control form-control-sm col-8">
							<option value="">분야상세를 선택해주세요</option>
						</select>
					</div>				
				</td>
			</tr>
<!-- 			<tr> -->
<!-- 				<th>라이브클래스 이미지</th> -->
<!-- 				<td colspan="3"> -->
<!-- 					<div class="fileArea">				 -->
<!-- 						<input type="file" id="LIVE_IMG_UUID_FILE" name="LIVE_IMG_UUID_FILE" style="display:none;margin-left:0px;" maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload"  -->
<!-- 								maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다." -->
<!-- 								maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다." -->
<!-- 								totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다." -->
<!-- 								onclick="imgIdValue = $(this).attr('id');" -->
<!-- 								onchange="checkFileTypeImg(this.value);" -->
<!-- 						/>	 -->
<!-- 						<label class="btn btn-sm btn-outline-secondary" for="LIVE_IMG_UUID_FILE" >파일선택</label> -->
<!-- 											<span class="file_possible" style="color:red !important;">( 이미지 파일만 )</span>							 -->
<!-- 						<div class="fileList" id="LIVE_IMG_UUID_FILEList"></div> -->
<!-- 						<input id="LIVE_IMG_UUID" name="LIVE_IMG_UUID" type="hidden" /> -->
<!-- 						<div id="LIVE_IMG_UUID_FILEListClone" style="display:none;"> -->
<!-- 						<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div> -->
<!-- 						</div>											 -->
<!-- 					</div> -->
<!-- 				</td> -->
<!-- 			</tr> -->
			<tr>
				<th scope="row">수용인원</th>
				<td colspan="3" style="text-align:left;">
					<div class="form-inline">
						<input type="text" name="LIVE_CNT" class="form-control form-control-sm col-8" title="제목 입력" maxlength="3" value="100" onkeyup="if(this.value*1 >= 100) this.value = 100; this.value=this.value.replace(/[^0-9]/g,'');"/>
						<span style="padding: 8px;display: inline-block;">( * 최대 인원 : 100명 )</span>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">수강시간</th>
				<td colspan="3" style="text-align:left;">
					<a class="btn btn-md btn_key_color" onclick='fn_BtnWrite("selectMngTimeList", "writeTimeTbody", "writeTime");'>시간설정</a>
					<span id="timeCnt" ></span>
				</td>
			</tr>	
			<tr>
				<th scope="row">사전질문</th>
				<td colspan="3" style="text-align:left;">
					<a class="btn btn-md btn_key_color" onclick='fn_BtnWrite( "selectMngQuesList", "writeQuesTbody", "writeQues" );'>사전질문</a>
					<span id="quesCnt" ></span>
				</td>
			</tr>		
			<tr rowspan="3" >
				<th scope="row">판매금액</th>
				<td colspan="3" >
					<div class="form-inline">
						<span style="padding: 8px;display: inline-block;">상품금액 : </span> 
						<input type="text" name="LIVE_PRIC" class="form-control form-control-sm col-8" placeholder="ex)50000" onchange="fn_CalcPrice();" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
					</div>
					<div class="form-inline">
						<span style="padding: 8px;display: inline-block;">할인종류 : </span> 
						<select id="LIVE_DISC_CD" name="LIVE_DISC_CD" class="form-control form-control-sm col-2" onchange="fn_CalcPrice();" >
							<option value="">전체</option>
						</select>
					<input type="text" name="LIVE_DISC" value="0" class="form-control form-control-sm col-6-2" placeholder="" onchange="fn_CalcPrice();" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" style="    margin-left:4px; ">			</div>
					<div class="form-inline">
						<span style="padding: 8px;display: inline-block;">판매금액 : </span> 
						<input type="text" name="LIVE_PRIC_REAL" class="form-control form-control-sm col-8" placeholder="" READONLY /> 
						<span style="padding: 8px;display: inline-block;">( * 10원 단위 절삭 )</span>
					</div>
				</td>
			</tr>
<!-- 			<tr> -->
<!-- 				<th scope="row">스트리밍 경로</th> -->
<!-- 				<td colspan="3" > -->
<!-- 					<div class="form-inline"> -->
<!-- 						<select id="LIVE_PLAY" name="LIVE_PLAY" class="form-control form-control-sm col-2"style=" margin-bottom: 4px;"> -->
<!-- 							<option value="">전체</option> -->
<!-- 						</select> -->
<!-- 						<input type="text" name="LIVE_PLAY_ID" class="form-control form-control-sm col-6-2"style=" margin-bottom: 4px; display: block; margin-left: 4px;" placeholder="매체 ID를 입력하세요."/> 	 -->
<!-- 						<input type="text" name="LIVE_PLAY_KEY" class="form-control form-control-sm col-8" placeholder="매체 KEY를 입력하세요."/> 	 -->
<!-- 					</div> -->
<!-- <!-- 					<div class="form-inline"> --> 
<!-- 						<input type="text" name="LIVE_PLAY_LINK" class="form-control form-control-sm col-8" placeholder="매체 링크, ex) https://event.so/survey"/>  -->
<!-- <!-- 					</div> --> 
<!-- 				</td> -->
<!-- 			</tr>		 -->
<!-- 			<tr> -->
<!-- 				<th scope="row">메일알람예약</th> -->
<!-- 				<td colspan="3" style="text-align:left;"> -->
<%-- 					<input id="LIVE_MAIL_DTM" name="LIVE_MAIL_DTM" type="text" class="form-control form-control-sm datepicker" value="<c:if test="${out.params.LIVE_MAIL_DTM ne null}">${out.params.LIVE_MAIL_DTM}</c:if><c:if test="${out.params.LIVE_MAIL_DTM eq null}">${sysDate}</c:if>"  style="width:45%;display: inline-block;z-index: 1 !important;" autocomplete= "new-password" autocomplete__wrapper autocomplete/> --%>
<!-- 					<input id="LIVE_SENDTIME" name="LIVE_SENDTIME" class="timepicker form-control form-control-sm" style="width:22.5%;display: inline-block;"  type="text" > -->
<!-- 				</td> -->
<!-- 			</tr>	 -->
		</tbody>
	</table>
</div>

<div class="btn_wrap">
	<a href='${unit.move("index", "" )}' class="btn  btn-md btn-outline-dark">목록</a>
	<a class="btn btn-md btn_key_color" onclick="fn_BtnRegist();">저장</a>
	<a class="btn  btn-md btn-danger" onclick="fn_BtnDelete();" style="margin-left:10px;">삭제</a>
</div>

<div id="writeTime" class="alert_wrap">
	<div class="alert_layer">
		<div class="alert_inner">
			<div class="alert_header">
				<button class="btn btn_close_pop" style="display: block; top: 5px; right: 5px; border: none;" data-action="popup_hide"></button>
			</div>				
			<div class="dialog_content">
				<div class="scroll_area" style="    height: 785px;">
					<!-- Start 팝업 컨텐츠 -->
					<div id="searchVod" >
						<h3>수강시간설정</h3>
						<div class="title_wrap mt5">
							※ 등록을 클릭하시면 임시 저장됩니다.
						</div>
						<div class="title_wrap mt5">
							※ 현재 팝업창을 닫으신 후, 본페이지에서 '저장'하기를 하셔야 최종 저장됩니다.
						</div>
						<div class="tbl_view" style="height:210px;overflow-y:auto;">
							<table class="view_tbl01" summary="" id="searchAreaTime">
								<colgroup>
									<col style="width: 30%;"/>
									<col />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">수업일</th> 
										<td style="text-align:left;">
											<input class="datepickerLect form-control form-control-sm" type="text" style="display: inline-block;cursor:pointer;" readonly="readonly"/>
										</td>
									</tr>
									<tr>
										<th id="totalLectCnt" scope="row">총 수업</th>
										<td style="text-align:left;">
											<div id="TIME_DTM_DIV" style="width:100%;display: inline-block;">
											
											</div>
											<textArea id="TIME_DTM" name="TIME_DTM" class="form-control form-control-sm col-8" type="text" style="display:none;" disabled>
											
											</textArea>
										</td>
									</tr>
									<tr>
										<th scope="row">시작</th>
										<td colspan="3" style="text-align:left;">
											<div class="form-inline">
												<input type="text" name="" class="timepickerHour form-control form-control-sm col-2 addTimeHour"  placeholder="시"/>
												<span>&nbsp시&nbsp &nbsp</span>
												<select id="TIME_STR_MIN" name="" class="form-control form-control-sm col-2 addTimeMin" autocomplete="new-password" autocomplete__wrapper></select>
												<span>&nbsp분</span>
												<a class="addTime" >등록</a>
											</div>
										</td>
									</tr>
									<tr>
										<th id="totalTimeCnt" scope="row">총 시간</th>
										<td style="text-align:left;">
											<div id="TIME_STR_DIV" style="display: inline-block;"></div>
											<textArea id="TIME_STR" name="TIME_STR" class="form-control form-control-sm col-8" type="text" style="display:none;" disabled></textArea>
										</td>
									</tr>
									<tr>
										<th scope="row">진행</th>
										<td colspan="3" style="text-align:left;">
											<div class="form-inline">
												<select id="TIME_RUN" name="TIME_RUN" class="form-control form-control-sm col-2" autocomplete="new-password" autocomplete__wrapper></select>
												<span> &nbsp 분</span>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						
						<div class="btn_wrap" style="text-align: right;">
							<a class="btn btn-md btn_key_color" onclick="fn_BtnRegistTime();">등록</a>
						</div>
					</div>
	
					
					<div class="btn_wrap" style="text-align: left;display: flex;">
						<h3>수강시간</h3> 
						<button type="button" onclick="fn_BtnDeleteTime();" class="btn_td2" style="margin: 0px 10px;">선택 삭제</button>					
					</div>
					
					<div class="tbl_list" style="overflow-y: scroll;height: 330px;">
						<table class="list_tbl01">
							<colgroup>
								<col style="width: 5%;" />
								<col style="width: 5%;" />
								<col style="width: 20%;" />
								<col style="width: 20%;" />
								<col style="width: 20%;" />
								
								<col style="width: 15%;" />
								<col style="width: 15%;" />			
							</colgroup>
							<thead>
								<tr>
									<th scope="col">
										<input type="checkbox" id="chk_all">
									</th>
									<th scope="col">No.</th>
									<th scope="col">수업일</th>
									<th scope="col">시작시간</th>
									<th scope="col">진행시간</th>
								</tr>
							</thead>
							<tbody id="writeTimeTbody">
							</tbody>
						</table>
					</div>

					<!--// End 팝업 컨텐츠 -->
				</div>
			</div>
		</div>
	</div>
</div>

<div id="writeQues" class="alert_wrap">
	<div class="alert_layer">
		<div class="alert_inner">
			<div class="alert_header">
				<button class="btn btn_close_pop" style="display: block; top: 5px; right: 5px; border: none;" data-action="popup_hide"></button>
			</div>				
			<div class="dialog_content" >
				<div class="scroll_area">
					<!-- Start 팝업 컨텐츠 -->
					<div id="searchVod" class="mb30">
						<h3>사전질문설정</h3>
						<div class="title_wrap mt5">
							※ 등록을 클릭하시면 임시 저장됩니다.
						</div>
						<div class="title_wrap mt5">
							※ 현재 팝업창을 닫으신 후, 본페이지에서 '저장'하기를 하셔야 최종 저장됩니다.
						</div>
						<div class="tbl_view">
							<table class="view_tbl01" summary="" id="searchAreaQues">
								<colgroup>
									<col style="width: 30%;"/>
									<col />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">질문</th> 
										<td style="text-align:left;">
											<input name="QUES_CNTN" class="form-control form-control-sm col-8" type="text" style="display: inline-block;"/>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						
						<div class="btn_wrap" style="text-align: right;">
							<a class="btn btn-md btn_key_color" onclick="fn_BtnRegistQues();">등록</a>
						</div>
					</div>
	
					<h3>사전질문</h3>
					
					<div class="btn_wrap" style="text-align: left;">
						<button type="button" onclick="fn_BtnDeleteQues();" class="btn_td2">선택 삭제</button>					
					</div>
					
					<div class="tbl_list" style="overflow-y: scroll;height: 200px;">
						<table class="list_tbl01">
							<colgroup>
								<col style="width: 10%;" />
								<col style="width: 10%;" />
								<col />
								
							</colgroup>
							<thead>
								<tr>
									<th scope="col">
										<input type="checkbox" id="chk_all_ques"> 
									</th>
									<th scope="col">No.</th>
									<th scope="col">사전질문</th>
								</tr>
							</thead>
							<tbody id="writeQuesTbody">
							</tbody>
						</table>
					</div>

					<!--// End 팝업 컨텐츠 -->
				</div>
			</div>
		</div>
	</div>
</div>

<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<script type="text/javascript">

var arrDtm = [];
var arrStr = [];

$('#chk_all').click(function(){
	if ( $('#chk_all').is(':checked') ) $('.chk').prop('checked', true);	
	else	$('.chk').prop('checked', false);	
});

$('.chk').click(function(){
	if ( $('input[name="chk"]:checked').length == $('.chk').length ) 	$('#chk_all').prop("checked", true);
	else	$('#chk_all').prop("checked", false);
});

$('#chk_all_ques').click(function(){
	if ( $('#chk_all_ques').is(':checked') ) $('.chk').prop('checked', true);	
	else	$('.chk').prop('checked', false);	
});

$('.chk').click(function(){
	if ( $('input[name="chk"]:checked').length == $('.chk').length ) 	$('#chk_all_ques').prop("checked", true);
	else	$('#chk_all_ques').prop("checked", false);
});


$(function(){
// 	fn_makeSummerNote('NOTI_CNTN');
	fn_SelectOptionNotCode( 'selectMasterNameList', 'CATE_IDX');
	fn_SelectOption("", "CAT", "PARENT_CODE_ID");
	fn_SelectOption("","SAL","LIVE_STAT_CD");
// 	fn_SelectOption("","CAT","CATE_PARENT_CD");
// 	fn_SelectOption("CAT01","","CATE_CD");
	fn_SelectOption("","DIS","LIVE_DISC_CD"); 
// 	fn_SelectOption("","PLA","LIVE_PLAY"); 
	
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectMngLiveDetail";
	params.liveIdx = '${out.params.liveIdx }';
	fn_DataDetail( params );

	var jsonData = fn_DataAjax2(params);
	$('[name=LIVE_STAT_CD]').eq(0).val('SAL01');
	$('[name=LIVE_STAT_CD]').eq(1).val('SAL02');
	$('[name=LIVE_STAT_CD]').eq(2).val('SAL03');
	$('[name=LIVE_STAT_CD]:radio[value="'+jsonData.out.detail.data[0].LIVE_STAT_CD+'"]').prop('checked',true);
	if( jsonData.out.detail.data[0].LIVE_ACAD_YN == 'Y') $('#LIVE_ACAD_YN').html( '라이브아카데미' );
	if( jsonData.out.detail.data[0].LIVE_ACAD_YN == 'N') $('#LIVE_ACAD_YN').html( '라이브클래스' );
// 	$('[name=LIVE_ACAD_YN]:radio[value="'+jsonData.out.detail.data[0].LIVE_ACAD_YN+'"]').prop('checked',true);

 	var codeIdStr = $('[name=CODE_ID]').val()+'';
	fn_SelectOption( codeIdStr.substr(0,5), "CAT", "MAIN_CODE_ID");
	$('#PARENT_CODE_ID').val( codeIdStr.substring(0,5) );
	$('#MAIN_CODE_ID').val( codeIdStr );
	
// 	if( $('#LIVE_PLAY').val() == 'PLA01') {
// 		$('[NAME=LIVE_PLAY_ID]').show();
// 		$('[name=LIVE_PLAY_KEY]').show();
// 	} else {
// 		$('[NAME=LIVE_PLAY_ID]').hide();
// 		$('[name=LIVE_PLAY_KEY]').hide();
// 		$('[NAME=LIVE_PLAY_ID]').val("");
// 		$('[name=LIVE_PLAY_KEY]').val("");
// 	}
	fn_SelectTime('5', 'TIME_STR_MIN,TIME_RUN');
	
	fn_BtnWrite("selectMngTimeList", "writeTimeTbody", "writeTime", "1");
	fn_BtnWrite( "selectMngQuesList", "writeQuesTbody", "writeQues", "1");
	fn_timeQuesStatus(); 
});

var inputDate = $(".datepickerLect");
inputDate.each(function(){
	var inputDate = $(this)
	var changeYearButtons = function() {
		setTimeout(function() {
			var widgetHeader = inputDate.datepicker("widget").find(".ui-datepicker-header");
			var prevYrBtn = $('<a class="prevYear" title="prevYear">Prev Year</a>');
			prevYrBtn.on("click", function() {
				$.datepicker._adjustDate(inputDate, -1, 'Y');
			});
			var nextYrBtn = $('<a class="nextYear" title="nextYear">Next year</a>');
			nextYrBtn.on("click", function() {
				$.datepicker._adjustDate(inputDate, +1, 'Y');
			});
			prevYrBtn.appendTo(widgetHeader);
			nextYrBtn.appendTo(widgetHeader);
		}, 1);
	};
	inputDate.datepicker({
		showMonthAfterYear : true,
		changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
		changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
		isRTL: true,
		language: 'ko',
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		dateFormat: "yy-mm-dd",
		beforeShow: function(input) {
			changeYearButtons();
			var input_offset= $(input).offset();
			setTimeout(function(){
				inputDate.addClass('focus');
				inputDate.after('<span class="date_arrow"><span class="arrow"></span></span>');
				inputDate.next('span.date_arrow').fadeIn('fast');
			    $('#ui-datepicker-div').css({'top':input_offset.top, 'bottom':''}); 					
			});				
		},
		
		onClose: function(input) {
		},
		onChangeMonthYear: changeYearButtons,
	});
});

$('.timepicker').timepicker({
    timeFormat: 'HH:mm',
    interval: 5,
    defaultTime: '00:00',
    startTime: '00:00',
    dynamic: true,
    dropdown: true,
    scrollbar: true,
});

$('.timepickerHour').timepicker({
    timeFormat: 'HH',
    interval: 60,
    defaultTime: '00:00',
    startTime: '00:00',
    dynamic: true,
    dropdown: true,
    scrollbar: true,
//	    change: function( data ) {
//         $('[NAME=TIME_END]').val( $(this).val() );
//         $('[NAME=TIME_REST]').val( $(this).val() );
//     }
});

// $("#CATE_PARENT_CD").change(function(){
// 	fn_SelectOption( $(this).val().substring(0,5),"CAT","CATE_CD");
// });

// $('#LIVE_PLAY').change(function(){
// 	if( $('#LIVE_PLAY').val() == 'PLA01') {
// 		$('[NAME=LIVE_PLAY_ID]').show();
// 		$('[name=LIVE_PLAY_KEY]').show();
// 	} else {
// 		$('[NAME=LIVE_PLAY_ID]').hide();
// 		$('[name=LIVE_PLAY_KEY]').hide();
// 		$('[NAME=LIVE_PLAY_ID]').val("");
// 		$('[name=LIVE_PLAY_KEY]').val("");
// 	}
// });

$('.datepickerLect').change(function( event ) {
	if( $('#TIME_DTM').val().indexOf( $(this).val() ) > -1 ) {
	} else {
		var val = $(this).val()+',';
		var val_org = $(this).val();
		$('#TIME_DTM').val( $('#TIME_DTM').val() + val );
							
		var arrCnt = $('#TIME_DTM').val().split(','); 
		var cnt = arrCnt.length-1;
		
		$('#TIME_DTM_DIV').append( '<a class="dtm'+cnt+' btn btn_td4"  onclick="fn_BtnDeleteDtm( \'TIME_DTM\', \''+val+'\', this );">'+val_org+'<span class="btn_xxx" >x</span></a>' );
		if( cnt != 0 ) $('#totalLectCnt').text( '총 '+ cnt +'건' );
	}
	event.eventpreventDefault(); 
});


$('.addTime').click(function() {
// 	if( $('#TIME_STR').val().indexOf( $('.addTimeHour').val()+':'+$('.addTimeMin').val() ) > -1 ) {
// 	} else if( $('#writeTimeTbody').html().indexOf( $('.addTimeHour').val()+':'+$('.addTimeMin').val() ) > -1 ) {
// 	} else {
		var val = $('.addTimeHour').val()+':'+$('.addTimeMin').val()+',';
		var val_org = $('.addTimeHour').val()+':'+$('.addTimeMin').val();
		
		$('#TIME_STR').val( $('#TIME_STR').val() + val );
		var arrCnt = $('#TIME_STR').val().split(','); 
		var cnt = arrCnt.length-1;

		$('#TIME_STR_DIV').append( '<a class="dtm'+cnt+' btn btn_td4"  onclick="fn_BtnDeleteDtm( \'TIME_STR\', \''+val+'\',  this );">'+val_org+'<span class="btn_xxx"  >x</span></a>' );
		$('#totalTimeCnt').text( '총 '+ cnt +'건' );
// 	}
});

function fn_BtnDeleteDtm( DEL_OBJ, DEL_VAL, DEL_TAG ) {
	$('#'+DEL_OBJ+'').val( $('#'+DEL_OBJ+'').val().replace(DEL_VAL, '') );
	DEL_TAG.remove();
}

function fn_CalcPrice() {
	var price = "";
	var LIVE_DISC = $('[name=LIVE_DISC]').val()*1;
	
// 	if( $('#LIVE_DISC_CD').val() == '' ) alert('할인 종류를 선택해주세요.');

	if( $('#LIVE_DISC_CD').val() == 'DIS01') {
		//% 단위 계산
		if( LIVE_DISC > 100 ) LIVE_DISC = 100;
		price = $('[name=LIVE_PRIC]').val() - ($('[name=LIVE_PRIC]').val() * LIVE_DISC*0.01);
	} else if( $('#LIVE_DISC_CD').val() == 'DIS02') {
		//원 단위 계산
		if ($('[name=LIVE_PRIC]').val()*1 < LIVE_DISC ) LIVE_DISC = $('[name=LIVE_PRIC]').val();
		price = $('[name=LIVE_PRIC]').val() - LIVE_DISC;
	}
	
	$('[name=LIVE_PRIC_REAL]').val( Math.floor(price/10) * 10 );
	$('[name=LIVE_DISC]').val( Number($('[name=LIVE_DISC]').val()) );
}

var dataTimeDtm = [];
var dataTimeStr = [];
function fn_DataListTime( PARAMS, OBJECT_ID, CNT ) {
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result.out.detail.data;
	var inTag = '';
	
	var timeDtm = [];
	var timeStr = [];
	
// 	|--------------|----------|-----------|----------|----------|---------|--------| 
// 	 INFO |TIME_IDX_CHK1 |TIME_IDX2 |TIME_DTM3  |TIME_STR4 |TIME_RUN5 |NUM_DESC |NUM_ASC | 
// 	 INFO |--------------|----------|-----------|----------|----------|---------|--------| 
// 	 INFO |57            |57        |2020-11-02 |11:20     |30        |6        |1       | 
// 	 INFO |--------------|----------|-----------|----------|----------|---------|--------| 

	 if( jsonData != null ) {
		$('#'+OBJECT_ID+'').empty();
		 
		$.each(jsonData, function(key, val) {
			inTag += '<tr>';
			inTag += '<td>';
			inTag += '<input type="checkbox" class="chk TIME_IDX" name="chk" value="'+val.TIME_IDX_CHK1+'">';
			inTag += '</td>';
			inTag += '<td>'+ val.NUM_DESC + '</td>';
			inTag += '<td>'+ val.TIME_DTM3 + '</td>';
			inTag += '<td>'+ val.TIME_STR4 + '</td>';
			inTag += '<td>'+ val.TIME_RUN5 + '</td>';
			inTag += '</tr>';
			
			timeDtm.push( val.TIME_DTM3 );
			timeStr.push( val.TIME_STR4 );
			
		});
		
		$('#'+OBJECT_ID+'').append( inTag );
		fn_timeQuesStatus();
		
		dataTimeDtm = timeDtm;
		dataTimeStr = timeStr;
		
	 }
}

function fn_DataListQues( PARAMS, OBJECT_ID, CNT ) {
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result.out.detail.data;
	var inTag = '';
	
// 	INFO |---------|------------------|---------|--------| 
// 	 INFO |QUES_IDX |QUES_CNTN         |NUM_DESC |NUM_ASC | 
// 	 INFO |---------|------------------|---------|--------| 
// 	 INFO |1        |1. 회원님의 정체성은&#63; |1        |1       | 
// 	 INFO |---------|------------------|---------|--------| 

	 if( jsonData != null ) {
		$('#'+OBJECT_ID+'').empty();
		 
		$.each(jsonData, function(key, val) {
			inTag += '<tr>';
			inTag += '<td>';
			inTag += '<input type="checkbox" class="chk QUES_IDX" name="chk" value="'+val.QUES_IDX+'">';
			inTag += '</td>';
			inTag += '<td>'+ val.NUM_DESC + '</td>';
			inTag += '<td>'+ val.QUES_CNTN + '</td>';
			inTag += '</tr>';
		});
		
		$('#'+OBJECT_ID+'').append( inTag );
		fn_timeQuesStatus(); 
	 }
}

function fn_BtnWrite( QUERY, TBODY, POPUP, POPUP_YN ) {

// 	fn_SelectOption("","TIM","TIME_CD");

	var params = new Object();
	params.status = "LIST";
	params.query = QUERY;
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.liveIdx = $('[name=LIVE_IDX]').val();
// 	params.liveIdx = '0';
	
	if( QUERY.indexOf("Time") > -1 ) fn_DataListTime( params, TBODY, 5 );
	else fn_DataListQues( params, TBODY, 5 );
	
	if( POPUP_YN != "1" ) alertShow('70%','',POPUP);
}


function fn_BtnRegistTime(){
	
	arrDtm = [];
	arrStr = [];
	var params = unit_getParams("searchAreaTime");
	params.status = "WRITE";
	params.query = "insertMngTimeData";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.liveIdx = $('[name=LIVE_IDX]').val();
	arrDtm = params.TIME_DTM.split(',');
	arrStr = params.TIME_STR.split(',');
	
	if( params.TIME_DTM.trim() == '' ) return alert('시작날짜를 등록해주세요.');
	if( params.TIME_STR.trim() == '' ) return alert('시작시간을 등록해주세요');
	if( $('input[name="LIVE_ACAD_YN"]:checked').val() == 'Y')
		if( arrDtm.length < 2 )
			return alert('라이브아카데미는 최소 두 개 이상의 날짜를 등록해야합니다.');

	if( arrDtm.length > 0 ) {
		$.each(arrDtm, function(key, val){
			params.TIME_DTM = val.trim();
			$.each(arrStr, function(key1, val1){
				
				params.TIME_STR = val1;
				var dtmStr = dataTimeDtm+'';
				var strStr = dataTimeStr+'';
				if( dtmStr.indexOf( params.TIME_DTM ) > -1 ) {
					if( strStr.indexOf( params.TIME_STR ) > -1 ) {
						if( dtmStr.indexOf( params.TIME_DTM )> -1 && strStr.indexOf( params.TIME_STR ) > -1 ) {
// 							console.log(dtmStr + ', ' + dtmStr.indexOf( params.TIME_DTM ) );
// 							console.log(strStr + ', ' + strStr.indexOf( params.TIME_DTM ) );
						}
						else {
							if( params.TIME_DTM != '' && params.TIME_STR != '') var result = fn_DataAjax( params, "N" );
						}
					} else {
						if( params.TIME_DTM != '' && params.TIME_STR != '') var result = fn_DataAjax( params, "N" );
					}
				} else {
					if( params.TIME_DTM != '' && params.TIME_STR != '') var result = fn_DataAjax( params, "N" );
				}
				
			});
		});
		
		params.status = "EDIT";
		params.query = "updateMngTimeEqualData";
		var result = fn_DataAjax2( params, "N" ); 
	
		params.status = "LIST";
		params.query = "selectMngTimeList";
		fn_DataListTime( params, 'writeTimeTbody', 7 );
	}
	
	alert('시간설정이 완료되었습니다.');
	
}

function fn_BtnDeleteTime(){
	
	$('.TIME_IDX').each(function(key, val){
		if( $(this).is(':checked') ) {
			var params = new Object();
			params.status = "DELETE";
			params.query = "deleteMngTimeData";
			params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
			params.liveIdx = $('[name=LIVE_IDX]').val();
			params.TIME_IDX = $(this).val();
			var result = fn_DataAjax( params );
		}
	});

	var params = new Object();
	params.status = "LIST";
	params.query = "selectMngTimeList";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.liveIdx = $('[name=LIVE_IDX]').val();
// 	params.liveIdx = '0';
	fn_DataListTime( params, 'writeTimeTbody', 7 );
}

function fn_BtnRegistQues(){
	
	var params = unit_getParams("searchAreaQues");
	params.status = "WRITE";
	params.query = "insertMngQuesData";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.liveIdx = $('[name=LIVE_IDX]').val();
// 	params.liveIdx = '0';
	var result = fn_DataAjax( params );

	var params = new Object();
	params.status = "LIST";
	params.query = "selectMngQuesList";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.liveIdx = $('[name=LIVE_IDX]').val();
// 	params.liveIdx = '0';
	fn_DataListQues( params, 'writeQuesTbody', 7 );
	
	alert('사전질문 등록이 완료되었습니다.');
	
}

function fn_BtnDeleteQues(){
	
	$('.QUES_IDX').each(function(key, val){
		if( $(this).is(':checked') ) {
			var params = new Object();
			params.status = "DELETE";
			params.query = "deleteMngQuesData";
			params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		 	params.liveIdx = $('[name=LIVE_IDX]').val();
// 			params.liveIdx = '0';
			params.QUES_IDX = $(this).val();
			var result = fn_DataAjax( params );
		}
	});

	var params = new Object();
	params.status = "LIST";
	params.query = "selectMngQuesList";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.liveIdx = $('[name=LIVE_IDX]').val();
// 	params.liveIdx = '0';
	fn_DataListQues( params, 'writeQuesTbody', 7 );
}


function fn_timeQuesStatus() {
	if( $('.TIME_IDX').length == 0 ) {
		$('#timeCnt').text('시간설정 누락');
		$('#timeCnt').css('color','red');
	} else {
		$('#timeCnt').text('시간설정 완료 ('+ $('.TIME_IDX').length+' 건)');
		$('#timeCnt').css('color','black');
	}

	if( $('.QUES_IDX').length == 0 ) {
		$('#quesCnt').text('사전질문 누락');
		$('#quesCnt').css('color','red');
	} else {
		$('#quesCnt').text('사전질문 완료 ('+$('.QUES_IDX').length+' 건)');
		$('#quesCnt').css('color','black');
	}
}


function fn_BtnRegist(){
	
	var params = unit_getParams("searchArea");
	params.status = "EDIT";
	params.query = "updateMngLiveData";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
// 	params.LIVE_MAIL_DTM = params.LIVE_MAIL_DTM+" "+params.LIVE_SENDTIME;
	params.LIVE_STAT_CD = $('input[name="LIVE_STAT_CD"]:checked').val();
	params.LIVE_ACAD_YN = $('input[name="LIVE_ACAD_YN"]:checked').val();
	
// 	if( params.LIVE_MAIL_DTM.length != 16 ) return alert('메일알림예약을 입력해주세요.');
	if( $('.TIME_IDX').length == 0 ) return alert('시간설정을 완료해주세요.');
// 	if( $('.QUES_IDX').length == 0 ) return alert('사전질문을 완료해주세요.');

	if( $('input[name="LIVE_ACAD_YN"]:checked').val() == 'Y')
		if( $('.TIME_IDX').length < 2 )
			return alert('라이브아카데미는 최소 두 개 이상의 날짜를 등록해야합니다.');
	
	var result = fn_DataAjax( params );

	if( ! result ) return;
	
	var params = new Object();
	params.status = "EDIT";
	params.query = "updateMngTimeData";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.liveIdx = $('[name=LIVE_IDX]').val();
	var result = fn_DataAjax( params );
	
	var params = new Object();
	params.status = "EDIT";
	params.query = "updateMngQuesData";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.liveIdx = $('[name=LIVE_IDX]').val();
	var result = fn_DataAjax( params );
	
	if( result ) location.href='${unit.move("index", "" )}';
	
}


function fn_BtnDelete(){

	if( confirm('해당 게시글을 삭제하시겠습니까?') ) {

		var params = unit_getParams("searchArea");
		params.status = "DELETE";
		params.query = "deleteMngLiveData";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		
		var result = fn_DataAjax( params );
		location.href='${unit.move("index", "" )}';
	}
}


// $(document).on('change','[name=LIVE_PLAY_LINK]',function(){
// 	if ( !checkDetailUrl( this.value ) ) {
// 		alert('URL 형식으로 입력해주세요.');
// 		this.value = '';
// 	} 
// });

</script>

