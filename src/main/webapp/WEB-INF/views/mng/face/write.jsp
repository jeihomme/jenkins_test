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
<div class="remark" style="font-size:13px; padding-bottom:7px; margin-left:0;">'*'은 필수입력 항목입니다.</div>			
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
			<tr>
				<th scope="row">상품코드</th>
				<td>
					<div class="form-inline">(자동발번)</div>				
				</td>
			</tr>
			<tr>
				<th scope="row">판매상태</th>
				<td colspan="3" style="text-align:left;">
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio0_Y" name="FACE_STAT_CD" value="SAL01" checked/>
						<label for="radio0_Y" class="label_txt">판매대기</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio0_N" name="FACE_STAT_CD" value="SAL02" />
						<label for="radio0_N" class="label_txt">판매중</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio1_N" name="FACE_STAT_CD" value="SAL03" />
						<label for="radio1_N" class="label_txt">판매완료</label>
					</div>
				</td>
			</tr>
<!-- 			<tr> -->
<!-- 				<th scope="row">판매상태<span style="color:red">*</span></th> -->
<!-- 				<td> -->
<!-- 					<select id="FACE_STAT_CD" name="FACE_STAT_CD" class="form-control form-control-sm col-8"> -->
<!-- 					</select> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th scope="row">상품명<span style="color:red">*</span></th> -->
<!-- 				<td> -->
<!-- 					<div class="form-inline"> -->
<!-- 						<input type="text" name="FACE_NM" class="form-control form-control-sm col-8" title="제목 입력" /> -->
<!-- 					</div>				 -->
<!-- 				</td> -->
<!-- 			</tr> -->
			<tr>
				<th scope="row">분야</th>
				<td>
					<div class="form-inline">
						<select id="PARENT_CODE_ID" name="PARENT_CODE_ID" class="form-control form-control-sm col-8" title="마스터 영역" >
							<option value="">선택해주세요</option>
						</select>
					</div>	
				</td>
			<tr>
			</tr>
				<th scope="row">분야상세</th>
				<td >
					<input type="hidden" name="CODE_ID" />
					<div class="form-inline">
						<select id="MAIN_CODE_ID" name="MAIN_CODE_ID" class="form-control form-control-sm col-8" title="마스터 영역" >
							<option value="">분야를 선택해주세요</option>
						</select>
					</div>	
				</td>
			</tr>
			<tr>
				<th scope="row">마스터<span style="color:red">*</span></th>
				<td>
					<div class="remark" style="font-size:13px; padding-bottom:7px; margin-left:0;">* 마스터는 등록 후 변경할 수 없습니다.</div>
					<div class="form-inline">
						<select name="CATE_IDX" id="CATE_IDX" class="form-control form-control-sm col-8">
							<option value="">분야상세를 선택해주세요</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">수강시간<span style="color:red">*</span></th>
				<td colspan="3" style="text-align:left;">
					<a class="btn btn-md btn_key_color" onclick='fn_BtnWrite("selectMngTimeList", "writeTimeTbody", "writeTime");'>시간설정</a>
					<span id="timeCnt" ></span>
				</td>
			</tr>	
			<tr>
				<th scope="row">사전질문<span style="color:red">*</span></th>
				<td colspan="3" style="text-align:left;">
					<a class="btn btn-md btn_key_color" onclick='fn_BtnWrite( "selectMngQuesList", "writeQuesTbody", "writeQues" );'>사전질문</a>
					<span id="quesCnt" ></span>
				</td>
			</tr>	
			<tr>
				<th scope="row">대한민국공휴일 진행여부<span style="color:red">*</span></th>
				<td  >
					<select id="FACE_REST" name="FACE_REST" class="form-control form-control-sm col-1">
						<option value="">선택해주세요</option>
						<option value="Y">진행</option>
						<option value="N">미진행</option>
					</select>
				</td>
			</tr>
			<tr rowspan="3" >
				<th scope="row">판매금액</th>
				<td colspan="3" >
					<div class="form-inline">
						<span style="padding: 8px;display: inline-block;">상품금액 : </span> 
						<input type="text" name="FACE_PRIC" class="form-control form-control-sm col-8" placeholder="ex)50000" onchange="fn_CalcPrice();" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
					</div>
					<div class="form-inline">
						<span style="padding: 8px;display: inline-block;">할인종류 : </span> 
						<select id="FACE_DISC_CD" name="FACE_DISC_CD" class="form-control form-control-sm col-2" onchange="fn_CalcPrice();" >
							<option value="">전체</option>
						</select>
					<input type="text" name="FACE_DISC" value="0" class="form-control form-control-sm col-6-2" placeholder="" onchange="fn_CalcPrice();" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" style="    margin-left:4px; ">			</div>
					<div class="form-inline">
						<span style="padding: 8px;display: inline-block;">판매금액 : </span> 
						<input type="text" name="FACE_PRIC_REAL" class="form-control form-control-sm col-8" placeholder="" READONLY /> 
						<span style="padding: 8px;display: inline-block;">( * 10원 단위 절삭 )</span>
					</div>
				</td>
			</tr>		
		</tbody>
	</table>
</div>

<div class="btn_wrap">
	<a href='${unit.move("index", "" )}' class="btn  btn-md btn-outline-dark">목록</a>
	<a class="btn btn-md btn_key_color" onclick="fn_BtnRegist();">저장</a>
</div>

<div id="writeTime" class="alert_wrap">
	<div class="alert_layer">
		<div class="alert_inner">
			<div class="alert_header">
				<button class="btn btn_close_pop" style="display: block; top: 5px; right: 5px; border: none;" data-action="popup_hide"></button>
			</div>				
			<div class="dialog_content" >
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
							<caption>동영상강좌 리스트 테이블</caption>
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
// 	fn_SelectOptionNotCode( 'selectMasterNameList', 'CATE_IDX');
	fn_SelectOption("", "CAT", "PARENT_CODE_ID");
	fn_SelectOption("","SAL","FACE_STAT_CD");
// 	fn_SelectOption("","CAT","CATE_PARENT_CD");
// 	fn_SelectOption("CAT01","","CATE_CD");
	fn_SelectOption("","DIS","FACE_DISC_CD"); 
	
	
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectMngFaceDetail";
	params.faceIdx = '${out.params.faceIdx }';

	if( params.faceIdx != '' ) {
		fn_DataDetail( params );
		
		var jsonData = fn_DataAjax2(params);
		$('[name=FACE_STAT_CD]').eq(0).val('SAL01');
		$('[name=FACE_STAT_CD]').eq(1).val('SAL02');
		$('[name=FACE_STAT_CD]').eq(2).val('SAL03');
		$('[name=FACE_STAT_CD]:radio[value="'+jsonData.out.detail.data[0].FACE_STAT_CD+'"]').prop('checked',true);
		
	 	var codeIdStr = $('[name=CODE_ID]').val()+'';
		fn_SelectOption( codeIdStr.substr(0,5), "CAT", "MAIN_CODE_ID");
		$('#PARENT_CODE_ID').val( codeIdStr.substring(0,5) );
		$('#MAIN_CODE_ID').val( codeIdStr );
		
		
		fn_BtnWrite("selectMngTimeList", "writeTimeTbody", "writeTime", "1");
		fn_BtnWrite( "selectMngQuesList", "writeQuesTbody", "writeQues", "1");
	}
	
		fn_SelectTime('5', 'TIME_STR_MIN,TIME_RUN');
		fn_timeQuesStatus(); 
// 	fn_SelectOption("", "CAT", "PARENT_CODE_ID");
// 	$('#PARENT_CODE_ID').val('${out.params.parentCodeId }');
	
// 	if ('${out.params.parentCodeId }' != '') {
// 		fn_SelectOption('${out.params.parentCodeId }', "CAT", "CODE_ID");
// 		$('#CODE_ID').val('${out.params.codeId }');
// 	}
	
});

$("[name=PARENT_CODE_ID]").on('change',function(k){
	$("[name=MAIN_CODE_ID]").empty();
	$("[name=MAIN_CODE_ID]").append('<option value="">분야를 선택해주세요</option>');
	if( $(this).val() != '' ) fn_SelectOption($(this).val(), "CAT", "MAIN_CODE_ID");
});

$("[name=MAIN_CODE_ID]").on('change',function(k){
	$("[name=CATE_IDX]").empty();
	$("[name=CATE_IDX]").append('<option value="">분야상세를 선택해주세요</option>');
	console.log( $(this).val() );
	if( $(this).val() != '' ) fn_SelectOptionNotCode( 'selectMasterNameList', 'CATE_IDX', $(this).val());
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
//	    defaultTime: '00',
//	    startTime: '00:00',
    dynamic: true,
    dropdown: true,
    scrollbar: true
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

$("#FACE_PW_YN").click(function(){
	if( $('input:checkbox[name=FACE_PW_YN]').is(':checked') ) {
		$('[name=FACE_PW]').show();
	} else {
		$('[name=FACE_PW]').val('');
		$('[name=FACE_PW]').hide();
	}
});

$('.datepickerLect').change(function( event ) {
	if( $('#TIME_DTM').val().indexOf( $(this).val() ) > -1 ) {
	} else {
		var val = $(this).val()+',';
		var val_org = $(this).val();
		$('#TIME_DTM').val( $('#TIME_DTM').val() + val );
							
		var arrCnt = $('#TIME_DTM').val().split(','); 
		var cnt = arrCnt.length-1;
		
		$('#TIME_DTM_DIV').append( '<a class="dtm'+cnt+' btn btn_td4" onclick="fn_BtnDeleteDtm( \'TIME_DTM\', \''+val+'\',this );">'+val_org+'<span class="btn_xxx">x</span></a>' );
		$('#totalLectCnt').text( '총 '+ cnt +'건' );
	}
	event.eventpreventDefault();
});


$('.addTime').click(function() {
	if( $('#TIME_STR').val().indexOf( $('.addTimeHour').val()+':'+$('.addTimeMin').val() ) > -1 ) {
	} else if( $('#writeTimeTbody').html().indexOf( $('.addTimeHour').val()+':'+$('.addTimeMin').val() ) > -1 ) {
	} else {
		var val = $('.addTimeHour').val()+':'+$('.addTimeMin').val()+',';
		var val_org = $('.addTimeHour').val()+':'+$('.addTimeMin').val();
		
		$('#TIME_STR').val( $('#TIME_STR').val() + val );
		var arrCnt = $('#TIME_STR').val().split(','); 
		var cnt = arrCnt.length-1;

		$('#TIME_STR_DIV').append( '<a class="dtm'+cnt+' btn btn_td4" onclick="fn_BtnDeleteDtm( \'TIME_STR\', \''+val+'\',this );">'+val_org+'<span class="btn_xxx">x</span></a>' );
		$('#totalTimeCnt').text( '총 '+ cnt +'건' );
	}
});


function fn_BtnDeleteDtm( DEL_OBJ, DEL_VAL, DEL_TAG ) {
	$('#'+DEL_OBJ+'').val( $('#'+DEL_OBJ+'').val().replace(DEL_VAL, '') );
	DEL_TAG.remove();
}

function fn_CalcPrice() {
	var price = "";
	var FACE_DISC = $('[name=FACE_DISC]').val()*1;
	
// 	if( $('#FACE_DISC_CD').val() == '' ) alert('할인 종류를 선택해주세요.');

	if( $('#FACE_DISC_CD').val() == 'DIS01') {
		//% 단위 계산
		if( FACE_DISC > 100 ) FACE_DISC = 100;
		price = $('[name=FACE_PRIC]').val() - ($('[name=FACE_PRIC]').val() * FACE_DISC*0.01);
	} else if( $('#FACE_DISC_CD').val() == 'DIS02') {
		//원 단위 계산
		if ($('[name=FACE_PRIC]').val()*1 < FACE_DISC ) FACE_DISC = $('[name=FACE_PRIC]').val();
		price = $('[name=FACE_PRIC]').val() - FACE_DISC;
	}
	
	$('[name=FACE_PRIC_REAL]').val( Math.floor(price/10) * 10 );
	$('[name=FACE_DISC]').val( Number($('[name=FACE_DISC]').val()) );
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
// 	params.faceIdx = $('[name=FACE_IDX]').val();
	params.faceIdx = '0';
	
	if( QUERY.indexOf("Time") > -1 ) fn_DataListTime( params, TBODY, 5 );
	else fn_DataListQues( params, TBODY, 5 );
	
	if( POPUP_YN != "1" ) alertShow('70%','',POPUP);
}

function fn_BtnRegistTime(){
	var arrDtm = [];
	var arrStr = [];
	var params = unit_getParams("searchAreaTime");
	params.status = "WRITE";
	params.query = "insertMngTimeData";
// 	params.faceIdx = $('[name=FACE_IDX]').val();
	params.faceIdx = '0';
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	arrDtm = params.TIME_DTM.split(',');
	arrStr = params.TIME_STR.split(',');
	
	if( params.TIME_DTM.trim() == '' ) return alert('시작날짜를 등록해주세요.');
	if( params.TIME_STR.trim() == '' ) return alert('시작시간을 등록해주세요');
	
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
	//							console.log(dtmStr + ', ' + dtmStr.indexOf( params.TIME_DTM ) );
	//							console.log(strStr + ', ' + strStr.indexOf( params.TIME_DTM ) );
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
			params.TIME_IDX = $(this).val();
			var result = fn_DataAjax( params );
		}
	});

	var params = new Object();
	params.status = "LIST";
	params.query = "selectMngTimeList";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
// 	params.faceIdx = $('[name=FACE_IDX]').val();
	params.faceIdx = '0';
	fn_DataListTime( params, 'writeTimeTbody', 7 );
}

function fn_BtnRegistQues(){
	
	var params = unit_getParams("searchAreaQues");
	params.status = "WRITE";
	params.query = "insertMngQuesData";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
// 	params.faceIdx = $('[name=FACE_IDX]').val();
	params.faceIdx = '0';
	var result = fn_DataAjax( params );

	var params = new Object();
	params.status = "LIST";
	params.query = "selectMngQuesList";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
// 	params.faceIdx = $('[name=FACE_IDX]').val();
	params.faceIdx = '0';
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
//		 	params.faceIdx = $('[name=FACE_IDX]').val();
			params.faceIdx = '0';
			params.QUES_IDX = $(this).val();
			var result = fn_DataAjax( params );
		}
	});

	var params = new Object();
	params.status = "LIST";
	params.query = "selectMngQuesList";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
// 	params.faceIdx = $('[name=FACE_IDX]').val();
	params.faceIdx = '0';
	fn_DataListQues( params, 'writeQuesTbody', 7 );
}


function fn_timeQuesStatus() {
	if( $('.TIME_IDX').length == 0 ) {
		$('#timeCnt').text('시간설정 누락');
		$('#timeCnt').css('color','red');
	} else {
		$('#timeCnt').text('사전질문 완료 ('+ $('.TIME_IDX').length+' 건)');
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
	
	if ( confirm('저장 후에는 마스터 선택란을 변경할 수 없습니다') ) {
		
	
// 	if ( $('[name=NOTI_TITL]').val().trim() == '' || $('[name=NOTI_TITL]').val().trim() == null ) return alert('제목을 입력해 주세요.');
// 	if ( $('[name=NOTI_CNTN]').val().trim() == '' || $('[name=NOTI_CNTN]').val().trim() == null ) return alert('내용을 입력해 주세요.');
	
		var params = unit_getParams("searchArea");
		params.status = "WRITE";
		params.query = "insertMngFaceData";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		params.FACE_CD = '${sysDateValue}'+'FN';
		params.FACE_PW = btoa( params.FACE_PW );
		params.FACE_STAT_CD = $('input[name="FACE_STAT_CD"]:checked').val();
		
// 		if( $('input:checkbox[name=FACE_MAIL_YN]').is(':checked') ) params.FACE_MAIL_YN = 'Y';
// 		else params.FACE_MAIL_YN = 'N';
// 		if( $('input:checkbox[name=FACE_SMS_YN]').is(':checked') ) params.FACE_SMS_YN = 'Y';
// 		else params.FACE_SMS_YN = 'N';
		
		if( $('.TIME_IDX').length == 0 ) return alert('시간설정을 완료해주세요.');
// 		if( $('.QUES_IDX').length == 0 ) return alert('사전질문을 완료해주세요.');
		var result = fn_DataAjax( params );

		if( ! result ) return;
	
		var params = new Object();
		params.status = "EDIT";
		params.query = "updateMngTimeData";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		var result = fn_DataAjax( params );
		
		var params = new Object();
		params.status = "EDIT";
		params.query = "updateMngQuesData";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		params.faceIdx = $('[name=FACE_IDX]').val();
		var result = fn_DataAjax( params );
		
		location.href='${unit.move("index", "" )}';
	}
}

</script>

