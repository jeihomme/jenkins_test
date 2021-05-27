<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDateValue"><fmt:formatDate value="${now}" pattern="yyyyMM" /></c:set> 
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'index', 'ajax')}" />

<!-- 쓰기  시작-->	
<div class="remark" style="font-size:13px; padding-bottom:7px; margin-left:0;">'*'은 필수입력 항목입니다.</div>
<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<colgroup>
			<col style="width: 20%;"/>
			<col/>
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
						<input type="radio" id="radio0_Y" name="MAIL_STAT_CD" value="SAL01" checked/>
						<label for="radio0_Y" class="label_txt">판매대기</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio0_N" name="MAIL_STAT_CD" value="SAL02" />
						<label for="radio0_N" class="label_txt">판매중</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio1_N" name="MAIL_STAT_CD" value="SAL03" />
						<label for="radio1_N" class="label_txt">판매완료</label>
					</div>
				</td>
			</tr>
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
				<th scope="row">마스터</th>
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
				<th scope="row">사용기한(일)</th>
				<td colspan="3" >
					<div class="form-inline">
						<input type="text" name="MAIL_DTM_CNT" class="form-control form-control-sm col-8" placeholder="숫자만 입력" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
					</div>				
				</td>
			</tr>
			<tr>
				<th scope="row">이용가능 횟수</th>
				<td colspan="3" >
					<div class="form-inline">
						<input type="text" name="MAIL_CNT" class="form-control form-control-sm col-8" placeholder="숫자만 입력" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
					</div>				
				</td>
			</tr>		
			<tr>
				<th scope="row">대한민국공휴일 진행여부</th>
				<td colspan="3" >
					<select id="MAIL_REST" name="MAIL_REST" class="form-control form-control-sm col-1">
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
						<input type="text" name="MAIL_PRIC" class="form-control form-control-sm col-8" placeholder="ex)50000" onchange="fn_CalcPrice();" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
					</div>
					<div class="form-inline">
						<span style="padding: 8px;display: inline-block;">할인종류 : </span> 
						<select id="MAIL_DISC_CD" name="MAIL_DISC_CD" class="form-control form-control-sm col-2" onchange="fn_CalcPrice();" >
							<option value="">전체</option>
						</select>
					<input type="text" name="MAIL_DISC" value="0" class="form-control form-control-sm col-6-2" placeholder="" onchange="fn_CalcPrice();" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" style="    margin-left:4px; ">			</div>
					<div class="form-inline">
						<span style="padding: 8px;display: inline-block;">판매금액 : </span> 
						<input type="text" name="MAIL_PRIC_REAL" class="form-control form-control-sm col-8" placeholder="" READONLY /> 
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

<script type="text/javascript">
$(function(){
// 	fn_SelectOptionNotCode( 'selectMasterNameList', 'CATE_IDX');
	fn_SelectOption("", "CAT", "PARENT_CODE_ID");
	fn_SelectOption("","SAL","MAIL_STAT_CD");
// 	fn_SelectOption("","CAT","CATE_PARENT_CD");
// 	fn_SelectOption("CAT01","","CATE_CD");
	fn_SelectOption("","DIS","MAIL_DISC_CD"); 
	
	
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectMngMailDetail";
	params.mailIdx = '${out.params.mailIdx }';
	
	if( params.mailIdx != '' ) {
		fn_DataDetail( params );

		var jsonData = fn_DataAjax2(params);
		$('[name=MAIL_STAT_CD]').eq(0).val('SAL01');
		$('[name=MAIL_STAT_CD]').eq(1).val('SAL02');
		$('[name=MAIL_STAT_CD]').eq(2).val('SAL03');
		$('[name=MAIL_STAT_CD]:radio[value="'+jsonData.out.detail.data[0].MAIL_STAT_CD+'"]').prop('checked',true);
		
	 	var codeIdStr = $('[name=CODE_ID]').val()+'';
		fn_SelectOption( codeIdStr.substr(0,5), "CAT", "MAIN_CODE_ID");
		$('#PARENT_CODE_ID').val( codeIdStr.substring(0,5) );
		$('#MAIN_CODE_ID').val( codeIdStr );
	}
	
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
	if( $(this).val() != '' ) fn_SelectOptionNotCode( 'selectMasterNameList', 'CATE_IDX', $(this).val());
});

// $("#CATE_PARENT_CD").change(function(){
// 	fn_SelectOption( $(this).val().substring(0,5),"CAT","CATE_CD");
// });

$("#MAIL_PW_YN").click(function(){
	if( $('input:checkbox[name=MAIL_PW_YN]').is(':checked') ) {
		$('[name=MAIL_PW]').prop('disabled', false);
	} else {
		$('[name=MAIL_PW]').val('');
		$('[name=MAIL_PW]').attr('disabled', true);
	}
});

function fn_CalcPrice() {
	var price = "";
	var MAIL_DISC = $('[name=MAIL_DISC]').val()*1;
	
// 	if( $('#MAIL_DISC_CD').val() == '' ) alert('할인 종류를 선택해주세요.');

	if( $('#MAIL_DISC_CD').val() == 'DIS01') {
		//% 단위 계산
		if( MAIL_DISC > 100 ) MAIL_DISC = 100;
		price = $('[name=MAIL_PRIC]').val() - ($('[name=MAIL_PRIC]').val() * MAIL_DISC*0.01);
	} else if( $('#MAIL_DISC_CD').val() == 'DIS02') {
		//원 단위 계산
		if ($('[name=MAIL_PRIC]').val()*1 < MAIL_DISC ) MAIL_DISC = $('[name=MAIL_PRIC]').val();
		price = $('[name=MAIL_PRIC]').val() - MAIL_DISC;
	}
	
	$('[name=MAIL_PRIC_REAL]').val( Math.floor(price/10) * 10 );
	$('[name=MAIL_DISC]').val( Number($('[name=MAIL_DISC]').val()) );
}

function fn_BtnRegist(){
	if ( confirm('저장 후에는 마스터 선택란을 변경할 수 없습니다') ) {
		
	// 	if ( $('[name=NOTI_TITL]').val().trim() == '' || $('[name=NOTI_TITL]').val().trim() == null ) return alert('제목을 입력해 주세요.');
	// 	if ( $('[name=NOTI_CNTN]').val().trim() == '' || $('[name=NOTI_CNTN]').val().trim() == null ) return alert('내용을 입력해 주세요.');
		
		var params = unit_getParams("searchArea");
		params.status = "WRITE";
		params.query = "insertMngMailData";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		params.MAIL_CD = '${sysDateValue}'+'EN';
		params.MAIL_PW = btoa( params.MAIL_PW );
		params.MAIL_STAT_CD = $('input[name="MAIL_STAT_CD"]:checked').val();
		
		// 노출여부 공개
		if( $('input:checkbox[name=MAIL_MAIL_YN]').is(':checked') ) params.MAIL_MAIL_YN = 'Y';
		else params.MAIL_MAIL_YN = 'N';
		if( $('input:checkbox[name=MAIL_SMS_YN]').is(':checked') ) params.MAIL_SMS_YN = 'Y';
		else params.MAIL_SMS_YN = 'N';
		
		fn_paramsNameTagTest( params );
		
		var result = fn_DataAjax( params );
		if (result) {
			location.href='${unit.move("index", "" )}';
			
		}
	}
}

</script>

