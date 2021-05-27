<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<div class="btn_wrap" style="text-align: left;">
	기본정보*
</div>
<!-- 조회  시작-->				
<div class="tbl_view">
	<table class="view_tbl01" summary="">
		<caption>공지사항 관리 테이블</caption>
		<colgroup>
			<col style="width: 15%;" />
			<col  />
			<col style="width: 15%;" />
			<col  />
		</colgroup>
		<tbody>
			<tr>
				<th scope="col">ID</th>
				<td colspan="3" id="USER_EMAIL"></td>
			</tr>
			<tr>
				<th scope="col">마스터명</th>
				<td id="USER_NM"></td>
				<th scope="col">닉네임</th>
				<td id="USER_NICK"></td>
			</tr>
			<tr>
				<th scope="col">연락처</th>
				<td colspan="3" id="USER_PHONE"></td>
			</tr>
			<tr>
				<th scope="col">희망활동분야</th>
				<td id="APPL_HOPE_PARENT"></td>
				<th scope="col">분야상세</th>
				<td id="APPL_HOPE"></td>
			</tr>
			<tr>
				<th scope="col">서비스영역</th>
				<td colspan="3" id="APPL_SVCE_CD"></td>
			</tr>
			<tr>
				<th scope="col">나를 표현하는 짧은 문구</th>
				<td colspan="3" id="APPL_SHORT_PR"></td>
			</tr>
			<tr>
				<th scope="col">마스터 신청자격</th>
				<td colspan="3" id="APPL_MAST_QUAL"></td>
			</tr>
			<tr>
				<th scope="col">마스터 활동유형</th>
				<td colspan="3" id="APPL_MAST_TYPE"></td>
			</tr>
			<tr>
				<th scope="row">입금계좌정보</th>
				<td colspan="3" >
					예금주 : <input class=" form-control-sm " name="APPL_BANK_OWN" id="APPL_BANK_OWN" style="" />
					<br class="pc" style="display: none;">
					계좌은행 : <input class=" form-control-sm pcMt10" name="APPL_BANK_NM" id="APPL_BANK_NM" style="" />
					<br class="pc" style="display: none;">
					계좌번호 : <input class=" form-control-sm pcMt10" name="APPL_BANK_ACNT" id="APPL_BANK_ACNT" style="" />
				</td>
			</tr>
			
		</tbody>
	</table>
</div>
<div class="btn_wrap" style="text-align: left;">
	마스터 활동
</div>
<div class="tbl_view">
	<table class="view_tbl01" summary="">
		<caption>공지사항 관리 테이블</caption>
		<colgroup>
			<col style="width: 15%;" />
			<col  />
			<col style="width: 15%;" />
			<col  />
		</colgroup>
		<tbody>
			<tr>
				<th scope="col">현재 운영중인 SNS</th>
				<td colspan="3" id="APPL_MAST_SNS"></td>
			</tr>
			<tr>
				<th scope="col">도서출판경험</th>
				<td id="APPL_BOOK"></td>
			</tr>
			<tr>
				<th scope="col">자격증</th>
				<td colspan="3" id="APPL_LICE"></td>
			</tr>
		</tbody>
	</table>
</div>
<div class="btn_wrap" style="text-align: left;">
	추가정보
</div>
<div class="tbl_view">
	<table class="view_tbl01" summary="">
		<caption>공지사항 관리 테이블</caption>
		<colgroup>
			<col style="width: 15%;" />
			<col  />
			<col style="width: 15%;" />
			<col  />
		</colgroup>
		<tbody>
			<tr>
				<th scope="col">첨부서류</th>
				<td colspan="3">
					<input type="hidden" id="APPL_UUID" name="APPL_UUID" />
					<div class="fileArea">
						<label for="APPL_UUID_FILE"></label>							
						<div class="fileList" id="APPL_UUID_FILEList"></div>
						<div id="APPL_UUID_FILEListClone" style="display:none;">
						<div><span class="fileName"></span> (<span class="fileSize"></span> MB)</div>
						</div>											
					</div>
				</td>
			</tr>
			<tr>
				<th scope="col">활동이유</th>
				<td colspan="3" id="APPL_REAS"></td>
			</tr>
			<tr>
				<th scope="col">클래스소개</th>
				<td colspan="3" id="APPL_OPEN_CLAS"></td>
			</tr>
			<tr>
				<th scope="col">강의 경력사항</th>
				<td colspan="3" id="APPL_LECT_CARE"></td>
			</tr>
			<tr>
				<th scope="col">승인상태</th>
				<td colspan="3" >
					<div class="form-inline">
						<div class="designRadiobutton form-control-sm">
							<input type="radio" id="radio2_1" name="APPL_CD" value="MAC01" />
							<label for="radio2_1" class="label_txt">승인검토</label>
						</div>
						<div class="designRadiobutton form-control-sm">
							<input type="radio" id="radio2_2" name="APPL_CD" value="MAC02" />
							<label for="radio2_2" class="label_txt">보완</label>
						</div>
						<div class="designRadiobutton form-control-sm">
							<input type="radio" id="radio2_3" name="APPL_CD" value="MAC03" />
							<label for="radio2_3" class="label_txt">승인완료</label>
						</div>
						<div class="designRadiobutton form-control-sm">
							<input type="radio" id="radio2_4" name="APPL_CD" value="MAC04" />
							<label for="radio2_4" class="label_txt">승인거절</label>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">승인상태 사유</th>
				<td>
					<textarea class="designTextarea form-control form-control-sm" name="APPL_CD_CNTN" id="APPL_CD_CNTN" style="width:100%; display:none;" title="내용 입력"></textarea>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="btn_wrap" style="text-align: right; position: relative;">
	<a href="${ unit.move('index', '') }" class="btn btn-md btn-outline-dark" style="position: absolute; left: 0;">목록</a>
	<a onclick="fn_BtnRegist();" class="btn btn-md btn_key_color">저장</a>
</div>

<style>
@media screen
and (max-device-width : 1200px) {
	.pc {display: block!important;}
	.pcMt10 { margin-top: 10px;}
} 
</style>
<!-- 조회 끝 -->
<script type="text/javascript">

$('[name=APPL_CD]').click(function(){
	if( $(this).val() == 'MAC02' || $(this).val() == 'MAC04' ) {
		$('[name=APPL_CD_CNTN]').show();
		$('[name=APPL_CD_CNTN]').val('');
	} else {
		$('[name=APPL_CD_CNTN]').hide();
		$('[name=APPL_CD_CNTN]').val('');
	}
});

$(function(){

	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectMngMasterapplDetail";
	params.applIdx = '${out.params.applIdx }';
	var jsonData = fn_DataDetail( params );

	$('[name=APPL_CD][value='+jsonData[0].APPL_CD+']').prop('checked',true);
	
	var APPL_HOPE = "";
	if (jsonData[0].APPL_HOPE_1 != '' && jsonData[0].APPL_HOPE_1 != null ) APPL_HOPE += jsonData[0].APPL_HOPE_1;
	if (jsonData[0].APPL_HOPE_2 != '' && jsonData[0].APPL_HOPE_2 != null ) APPL_HOPE += ', '+ jsonData[0].APPL_HOPE_2;
	if (jsonData[0].APPL_HOPE_3 != '' && jsonData[0].APPL_HOPE_3 != null ) APPL_HOPE += ', '+jsonData[0].APPL_HOPE_3;
	$('#APPL_HOPE').text(APPL_HOPE);
	
	var sns = "";
	if(jsonData[0].APPL_MAST_SNS_YOUT != '' && jsonData[0].APPL_MAST_SNS_YOUT != null ){ 
		if (sns.length > 0)
			sns += ', 유튜브';
		else
			sns += '유튜브';
	}if(jsonData[0].APPL_MAST_SNS_INST != '' && jsonData[0].APPL_MAST_SNS_INST != null ){
		if (sns.length > 0)
			sns += ', 인스타그램';
		else
			sns += '인스타그램';
	}if(jsonData[0].APPL_MAST_SNS_FACE != '' && jsonData[0].APPL_MAST_SNS_FACE != null ){ 
		if (sns.length > 0)
			sns += ', 페이스북';
		else
			sns += '페이스북';
	}if(jsonData[0].APPL_MAST_SNS_BLOG != '' && jsonData[0].APPL_MAST_SNS_BLOG != null ){
		if (sns.length > 0)
			sns += ', 블로그';
		else
			sns += '블로그';
	}if(jsonData[0].APPL_MAST_SNS_CAFE != '' && jsonData[0].APPL_MAST_SNS_CAFE != null ){ 
		if (sns.length > 0)
			sns += ', 카페';
		else
			sns += '카페';
	}if(jsonData[0].APPL_MAST_SNS_ETC  != '' && jsonData[0].APPL_MAST_SNS_ETC != null ){
		if (sns.length > 0)
			sns += ', 기타';
		else
			sns += '기타';
	}
	$('#APPL_MAST_SNS').text(sns);
	
	if (jsonData[0].APPL_MAST_QUAL == 'C' ) {
		$('#APPL_MAST_QUAL').text('자격증 및 경력인증');
	}else{
		$('#APPL_MAST_QUAL').text('제휴사 소속 : ' + jsonData[0].APPL_MAST_QUAL_CORP );
	}
	
	if (jsonData[0].APPL_BOOK_NM != '' && jsonData[0].APPL_BOOK_NM != null ) {
		$('#APPL_BOOK').text('도서명 : '+jsonData[0].APPL_BOOK_NM+' 출판사 : '+jsonData[0].APPL_BOOK_PUBL+' 출판일 : '+jsonData[0].APPL_BOOK_PUBL_DATE);
	}
	
	if (jsonData[0].APPL_LICE_NM1 != '' && jsonData[0].APPL_LICE_NM1 != null ) {
		if (jsonData[0].APPL_LICE_NM2 != '' && jsonData[0].APPL_LICE_NM2 != null ) {
			$('#APPL_LICE').html(jsonData[0].APPL_LICE_NM1+' / '+jsonData[0].APPL_LICE_ACQU_DATE1+' / '+jsonData[0].APPL_LICE_AGEN1+'<br>'+jsonData[0].APPL_LICE_NM2+' / '+jsonData[0].APPL_LICE_ACQU_DATE2+' / '+jsonData[0].APPL_LICE_AGEN2);
		}else{
			$('#APPL_LICE').text(jsonData[0].APPL_LICE_NM1+' / '+jsonData[0].APPL_LICE_ACQU_DATE1+' / '+jsonData[0].APPL_LICE_AGEN1);
		}
	}
	
	if( jsonData[0].APPL_CD == 'MAC02' || jsonData[0].APPL_CD == 'MAC04' ) {
		$('[name=APPL_CD_CNTN]').show();
	} else {
		$('[name=APPL_CD_CNTN]').hide();
		$('[name=APPL_CD_CNTN]').val('');
	}

	$('#APPL_BANK_OWN').val( jsonData[0].APPL_BANK_OWN );
	$('#APPL_BANK_NM').val( jsonData[0].APPL_BANK_NM );
	$('#APPL_BANK_ACNT').val( jsonData[0].APPL_BANK_ACNT );
});

function fn_BtnRegist(){
	var params = new Object();
	params.status = "EDIT";
	params.query = "updateMngMasterapplData";
	params.applIdx = '${out.params.applIdx }';
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.APPL_CD = $('[name=APPL_CD]:checked').val();
	params.APPL_BANK_OWN = $('[name=APPL_BANK_OWN]').val();
	params.APPL_BANK_NM = $('[name=APPL_BANK_NM]').val();
	params.APPL_BANK_ACNT = $('[name=APPL_BANK_ACNT]').val();
	params.APPL_CD_CNTN = $('[name=APPL_CD_CNTN]').val();
	
	if( params.APPL_CD == 'MAC03') {
		params.USER_TYPE = 'M';
	} else if( params.APPL_CD == 'MAC02' || params.APPL_CD == 'MAC04' ) {
		if( params.APPL_CD_CNTN.trim() == '' ) return alert('보안 또는 승인거절 시, 사유를 작성해야합니다.');
		params.USER_TYPE = 'U';
	} else {
		params.USER_TYPE = 'U';
	}
	fn_DataAjax( params );
	
	params.query = "updateMngUserMasterYn";
	fn_DataAjax( params );
	location.reload();
}

</script>













