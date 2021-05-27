<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDateValue"><fmt:formatDate value="${now}" pattern="yyyyMM" /></c:set> 
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
 
		.wd150{width: 130px;}
		
		#searchVod{
			padding: 20px 10px;
			border: 2px solid #222;
		}
		#searchVod span{
			display: inline-block;
    		width: 20%;  
    		font-weight: bold;
    	}
		#searchVod input{
			display: inline-block;
    		width: 80%;  
    	}
		#search_vod_Target td{
    		padding: 0!important;  
    	}
    	#searchVod .btn_wrap{
    		padding: 10px 0 0 0;
    	}
    	
		#addVod_Target input { margin: auto; }
    	
    	.btn-dark{
    		color: #fff;
    		background-color: #343a40;
   			border-color: #343a40;
   		}
    	
    	input[type=checkbox]{margin-top: 0;}
/*     	.fileList span.close { */
   
/*     margin-top: 6px;} */
	</style>
<!-- 쓰기  시작-->	
<div class="remark" style="font-size:13px; padding-bottom:7px; margin-left:0;">'*'은 필수입력 항목입니다.</div>			
<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>동영상강좌 관리 테이블</caption>
		<colgroup>
			<col style="width: 15%;"/>
			<col/>
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">상품코드</th>
				<td>
					<div class="form-inline">
						(자동 발번)
					</div>				
				</td>
			</tr>
			<tr>
				<th scope="row">판매상태<span class="red">*</span></th>
				<td>
					<div class="form-inline">
						<div class="designRadiobutton form-control-sm">
							<input type="radio" id="radio1_2" name="LECT_STAT_CD" value="SAL01" checked />
							<label for="radio1_2" class="label_txt">판매대기</label>
						</div>
						<div class="designRadiobutton form-control-sm">
							<input type="radio" id="radio1_1" name="LECT_STAT_CD" value="SAL02" />
							<label for="radio1_1" class="label_txt">판매중</label>
						</div>
						<div class="designRadiobutton form-control-sm">
							<input type="radio" id="radio1_3" name="LECT_STAT_CD" value="SAL03" />
							<label for="radio1_3" class="label_txt">판매종료</label>
						</div>
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
				<th scope="row">마스터<span class="red">*</span></th>
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
				<th scope="row">수강기간<span class="red">*</span></th>
				<td colspan="3">
					<div class="designRadiobutton  form-inline" style="display: block;">
						<label for="radio2_2" class="label_txt" >수강일</label>
						<input type="text" name="LECT_DTM" class="form-control form-control-sm col-8"  placeholder="" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
					</div>
				</td>
			</tr>
			<tr rowspan="3" >
				<th scope="row">판매금액<span class="red">*</span></th>
				<td colspan="3" >
					<div class="form-inline">
						<span style="padding: 8px;display: inline-block;">상품금액 : </span> 
						<input type="text" name="LECT_PRIC" class="form-control form-control-sm col-8" placeholder="ex)50000" onchange="fn_CalcPrice();" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
					</div>
					<div class="form-inline">
						<span style="padding: 8px;display: inline-block;">할인종류 : </span> 
						<select id="LECT_DISC_CD" name="LECT_DISC_CD" class="form-control form-control-sm col-2" onchange="fn_CalcPrice();" >
							<option value="">전체</option>
						</select>
					<input type="text" name="LECT_DISC" value="0" class="form-control form-control-sm col-6-2" placeholder="" onchange="fn_CalcPrice();" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" style="    margin-left:4px; ">			</div>
					<div class="form-inline">
						<span style="padding: 8px;display: inline-block;">판매금액 : </span> 
						<input type="text" name="LECT_PRIC_REAL" class="form-control form-control-sm col-8" placeholder="" READONLY /> 
						<span style="padding: 8px;display: inline-block;">( * 10원 단위 절삭 )</span>
					</div>
				</td>
			</tr>
			<tr>
				<th>OT</th>
				<td colspan="3">
					<div class=" form-control-sm">
						<select id="LECT_PLAY" name="LECT_PLAY" style="display: inline-block;" class="form-control form-control-sm col-2">
							<option value="">선택</option>
						</select>
						<input type="text" id="LECT_PLAY_LINK" name="LECT_PLAY_LINK" style="display: inline-block;" placeholder="ex) http://peoplemade.com" class="form-control form-control-sm col-8">
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">강의<span class="red">*</span></th>
				<td colspan="3">
					<div class="btn_wrap" style="text-align: right; padding: 0px 0 10px;">
						<a class="btn btn-md btn_key_color" onclick="alertShow('70%','','search_vod');fn_BtnFindVod();">추가</a>
					</div>
					<div class="tbl_list">
						<table class="list_tbl01" summary="">
							<caption>강의 리스트 테이블</caption>
							<colgroup>
								<col style="width: 15%;" />				
								<col />			
<%-- 								<col style="width: 10%;" />		 --%>
								<col style="width: 10%;" />		
								<col style="width: 10%;" />		
<%-- 								<col style="width: 10%;" />		 --%>
								<col style="width: 10%;" />		
							</colgroup>
							<thead>
								<tr>
									<th scope="col">강의코드</th>
									<th scope="col">강의명</th>
<!-- 									<th scope="col">진행 상태</th> -->
									<th scope="col">강의 상태</th>
									<th scope="col">등록일</th>
<!-- 									<th scope="col">순서</th> -->
									<th scope="col">관리</th>
								</tr>
							</thead>
							<tbody id="addVod_Target">
										<tr class="noValue">
											<td colspan="11">등록된 내용이 없습니다.</td>
										</tr>
							</tbody>
						</table>
					</div>
				</td>
			</tr>					
			<tr>
				<th scope="row">준비물</th>
				<td colspan="3">
					<div class="btn_wrap" style="text-align: right; padding: 0px 0 10px;">
						<a class="btn btn-md btn_key_color" onclick="fn_addmatePop();">추가</a>
					</div>
					<div class="tbl_list">
						<table class="list_tbl01" summary="">
							<caption>강의 리스트 테이블</caption>
							<colgroup>
								<col style="width: 25%;" />				
								<col style="width: 25%;" />			
								<col style="width: 25%;" />		
								<col style="width: 25%;" />		
							</colgroup>
							<thead>
								<tr>
									<th scope="col">준비물명</th>
									<th scope="col">준비물 코드</th>
<!-- 									<th scope="col">진행 상태</th> -->
									<th scope="col">판매가</th>
									<th scope="col">관리</th>
								</tr>
							</thead>
							<tbody id="addMate_Target">
										<tr class="noValue">
											<td colspan="11">등록된 내용이 없습니다.</td>
										</tr>
							</tbody>
						</table>
					</div>
				</td>
			</tr>					
		</tbody>
	</table>
</div>

<div class="btn_wrap" style="text-align: right;">
	<a href='${unit.move("index", "" )}' class="btn  btn-md btn-outline-dark">목록</a>
	<a class="btn btn-md btn_key_color" onclick="fn_BtnRegist();">저장</a>
</div>


<!-- 데이타 삭제 -->
<div id="search_vod" class="alert_wrap">
	<div class="alert_layer">
		<div class="alert_inner">
			<div class="alert_header">
				<button class="btn btn_close_pop" style="display: block; top: 5px; right: 5px; border: none;" data-action="popup_hide"></button>
			</div>				
			<div class="dialog_content">
				<div class="scroll_area">
					<!-- Start 팝업 컨텐츠 -->
					<div id="searchVod" class="mb30">
						<span>코드/강의명/마스터명</span><input type="text" name="selectVodSearch" class="form-control form-control-sm col-6"  onkeypress="if(event.keyCode==13){fn_BtnFindVod();}"/>
						<div class="btn_wrap" style="text-align: right;display: contents;">
							<a class="btn  btn-md btn-dark" onclick="fn_BtnFindVod();">검색</a>
						</div>
					</div>
	
					<div class="tbl_list" style="max-height: 450px; overflow: auto;">
						<table class="list_tbl01">
							<caption>동영상강좌 리스트 테이블</caption>
							<colgroup>
								<col style="width: 10%;" />
								<col style="width: 15%;" />
								<col style="width: 20%;" />
								<col style="width: 20%;" />
								<col style="width: 10%;" />			
								<col style="width: 15%;" />			
							</colgroup>
							<thead>
								<tr>
									<th scope="col">
										<input type="checkbox" id="chk_all">
									</th>
									<th scope="col">마스터명</th>
									<th scope="col">강의코드</th>
									<th scope="col">강의명</th>
<!-- 									<th scope="col">진행상태</th> -->
									<th scope="col">시간(분)</th>
								</tr>
							</thead>
							<tbody id="search_vod_Target">
								<c:forEach begin="0" end="10" step="1">
									<tr>
										<td>
											<input type="checkbox" class="chk" name="chk">
										</td>
										<td></td>
										<td></td>
										<td></td>
<!-- 										<td></td> -->
										<td></td>
									</tr>
								</c:forEach>	
							</tbody>
						</table>
					</div>
					<div class="pagination justify-content-center paging">
										<ul style="justify-content:space-between;" id="pagingVar">
										
										</ul>
					</div>
					<div class="btn_wrap" style="text-align: right;">
						<button type="button" onclick="fn_addVod();" class="btn  btn-md btn-outline-dark" style="width: 140px;">선택상품 추가</button>					
					</div>

					<!--// End 팝업 컨텐츠 -->
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 준비물 가져오기 -->
<div id="add_Mate" class="alert_wrap">
	<div class="alert_layer">
		<div class="alert_inner">
			<div class="alert_header">
				<h4 style="position: absolute; top: 10px; left: 30px;width:140px;"><b id="titleTarget">준비물 등록</b></h4>
				<button class="btn btn_close_pop" style="display: block; top: 5px; right: 5px; border: none;" data-action="popup_hide"></button>
			</div>				
			<div class="dialog_content">
				<div class="scroll_area">
					<!-- Start 팝업 컨텐츠 -->
					<div class="tbl_list" style="max-height: 450px; overflow: auto;">
						<table class="list_tbl01">
							<caption>준비물 리스트 테이블</caption>
							<colgroup>
								<col style="width: 20%;" />
								<col />
							</colgroup>
							<tbody id="mate_Target">
									<tr>
										<th scope="row">준비물명<span class="red">*</span></th>
										<td>
											<div>
												<input type="text" name="MATE_NM" class="form-control form-control-sm col-8"  placeholder="내용을 입력해주세요."/>
												<input type="hidden" name="MATE_IDX" value=""/>
											</div>				
										</td>
									</tr>
									<tr>
										<th scope="row">준비물코드<span class="red">*</span></th>
										<td>
											<div>
												<input type="text" name="MATE_CD" class="form-control form-control-sm col-8"  readonly="readonly" disabled="disabled" value="(자동발번)"/>
											</div>				
										</td>
									</tr>
									<tr>
										<th scope="row">준비물 이미지<span class="red">*</span></th>
										<td >
											<div class="fileArea" style="text-align: left;">				
												<input type="file" id="MATE_UUID_FILE" name="MATE_UUID_FILE" style="display:none;margin-left:0px;" multiple maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" 
														maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."
														maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."
														totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."
														onclick="imgIdValue = $(this).attr('id');"
														onchange="checkFileTypeImg(this.value);"
												/>	
												<label class="btn btn-sm btn-outline-secondary" for="MATE_UUID_FILE" >파일선택</label>
																	<span class="file_possible" style="color:red !important;">( 이미지 파일만 )</span>							
												<div class="fileList" id="MATE_UUID_FILEList"></div>
												<input id="MATE_UUID" name="MATE_UUID" type="hidden" />
												<div id="MATE_UUID_FILEListClone" style="display:none;">
												<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>
												</div>											
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">판매금액<span class="red">*</span></th>
										<td >
											<div class="form-inline">
												<span style="padding: 8px;display: inline-block;">상품금액 : </span> 
												<input type="text" name="MATE_PRIC" class="form-control form-control-sm col-8" placeholder="ex)50000" onchange="fn_CalcPriceMATE();" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
											</div>
											<div class="form-inline">
												<span style="padding: 8px;display: inline-block;">할인종류 : </span> 
												<select id="MATE_DISC_CD" name="MATE_DISC_CD" class="form-control form-control-sm col-8" onchange="fn_CalcPriceMATE();">
												</select>
												<input type="text" name="MATE_DISC" value="0" class="form-control form-control-sm col-8" placeholder="" onchange="fn_CalcPriceMATE();"style="margin-top: 4px; margin-left: 70px" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
											</div>
											<div class="form-inline">
												<span style="padding: 8px;display: inline-block;">판매금액 : </span> 
												<input type="text" name="MATE_PRIC_REAL" class="form-control form-control-sm col-8" placeholder="" READONLY /> 
												<span style="padding: 8px;display: inline-block;padding: 8px 70px;">(* 10원 단위 절삭)</span>
											</div>
										</td>
									</tr>
									<tr>
										<th>준비물 설명<span class="red">*</span></th>
										<td>
											<div class=" form-control-sm">
												<textarea rows="5" cols="" style="resize: none;"  id="MATE_CTNT" name="MATE_CTNT" placeholder="내용을 입력하세요" class=" form-control form-control-sm "></textarea>
											</div>
										</td>
									</tr>	
							</tbody>
						</table>
					</div>
					
					<div class="btn_wrap" style="text-align: right;">
						<a onclick="fn_deleteMate();" id="mateDelBtn" class="btn  btn-md btn-danger"  style="width: 140px;">준비물 삭제</a>
						<button type="button" onclick="fn_addMate();" id="mateWriBtn" class="btn btn-md btn_key_color" style=" width:140px;">준비물 등록</button>					
					</div>

					<!--// End 팝업 컨텐츠 -->
				</div>
			</div>
		</div>
	</div>
</div>




<script type="text/javascript">
$('#chk_all').click(function(){
	if ( $('#chk_all').is(':checked') ) $('.chk').prop('checked', true);	
	else	$('.chk').prop('checked', false);	
});

$('.chk').click(function(){
	if ( $('input[name="chk"]:checked').length == $('.chk').length ) 	$('#chk_all').prop("checked", true);
	else	$('#chk_all').prop("checked", false);
});


$(function(){
// 	fn_SelectOptionNotCode( 'selectMasterNameList', 'CATE_IDX');
	fn_SelectOption("", "CAT", "PARENT_CODE_ID");
	fn_SelectOption("","DIS","LECT_DISC_CD"); 
	fn_SelectOption("","DIS","MATE_DISC_CD"); 
	fn_SelectOption("", "PLAY", "LECT_PLAY");
	
	
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectMngLectDetail";
	params.lectIdx = '${out.params.lectIdx }';
	
	if( params.lectIdx != '' ) {
		fn_DataDetail( params );

		var jsonData = fn_DataAjax2(params);
		$('[name=LECT_STAT_CD]').eq(0).val('SAL01');
		$('[name=LECT_STAT_CD]').eq(1).val('SAL02');
		$('[name=LECT_STAT_CD]').eq(2).val('SAL03');
		$('[name=LECT_STAT_CD]:radio[value="'+jsonData.out.detail.data[0].LECT_STAT_CD+'"]').prop('checked',true);	
		
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

function fn_CalcPrice() {
	var price = "";
	var LECT_DISC = $('[name=LECT_DISC]').val()*1;
	
// 	if( $('#LECT_DISC_CD').val() == '' ) alert('할인 종류를 선택해주세요.');

	if( $('#LECT_DISC_CD').val() == 'DIS01') {
		//% 단위 계산
		if( LECT_DISC > 100 ) LECT_DISC = 100;
		price = $('[name=LECT_PRIC]').val() - ($('[name=LECT_PRIC]').val() * LECT_DISC*0.01);
	} else if( $('#LECT_DISC_CD').val() == 'DIS02') {
		//원 단위 계산
		if ($('[name=LECT_PRIC]').val()*1 < LECT_DISC ) LECT_DISC = $('[name=LECT_PRIC]').val();
		price = $('[name=LECT_PRIC]').val() - LECT_DISC;
	}
	
	$('[name=LECT_PRIC_REAL]').val( Math.floor(price/10) * 10 );
	$('[name=LECT_DISC]').val( Number($('[name=LECT_DISC]').val()) );
}

function fn_CalcPriceMATE() {
	var price = "";
		var MATE_DISC = 0;
	
	//% 단위 계산
	if( $('#MATE_DISC_CD').val() == 'DIS01') {
		if ($('[name=MATE_DISC]').val() > 100) 
			MATE_DISC = 100;
		else
			MATE_DISC = $('[name=MATE_DISC]').val();
		
		price = $('[name=MATE_PRIC]').val() - ($('[name=MATE_PRIC]').val() * MATE_DISC*0.01);
		$('[name=MATE_PRIC_REAL]').val( Math.floor(price/100) * 100 );
	//원 단위 계산
	} else if( $('#MATE_DISC_CD').val() == 'DIS02') {
		if ($('[name=MATE_PRIC]').val()*1 < $('[name=MATE_DISC]').val()*1 ) 
			MATE_DISC = $('[name=MATE_PRIC]').val();
		else
			MATE_DISC = $('[name=MATE_DISC]').val();
		
		price = $('[name=MATE_PRIC]').val() - MATE_DISC;
		$('[name=MATE_PRIC_REAL]').val( Math.floor(price/100) * 100 );
	} else {
		alert('할인 종류를 선택해주세요.');
	}
	
	$('[name=MATE_DISC]').val( Number($('[name=MATE_DISC]').val()) );
	
}


function fn_BtnRegist(){
	
	if ( confirm('저장 후에는 마스터 선택란을 변경할 수 없습니다') ) {
		
// 		if ( $('[name=LECT_NM]').val().trim() == '' || $('[name=LECT_NM]').val().trim() == null ) return alert('상품명을 입력해 주세요.');
		if ( $('[name=CATE_IDX]').val().trim() == '' || $('[name=CATE_IDX]').val().trim() == null ) return alert('마스터를 선택해 주세요.');
// 		if ( $('[name=LECT_STR_DTM]').val().trim() == '' || $('[name=LECT_STR_DTM]').val().trim() == null ) return alert('수강 시작일을 입력해 주세요.');
// 		if ( $('[name=LECT_END_DTM]').val().trim() == '' || $('[name=LECT_END_DTM]').val().trim() == null ) return alert('수강 종료일을 입력해 주세요.');
		if ( $('[name=LECT_DTM]').val().trim() == '' || $('[name=LECT_DTM]').val().trim() == null ) return alert('수강일을 입력해 주세요.');
		if ( $('[name=LECT_PRIC]').val().trim() == '' || $('[name=LECT_PRIC]').val().trim() == null ) return alert('상품금액을 입력해 주세요.');
		if ( $('[name=LECT_PRIC_REAL]').val().trim() == '' || $('[name=LECT_PRIC_REAL]').val().trim() == null ) return alert('판매금액을 입력해 주세요.');
// 		if ( $('[name=LECT_PLAY]').val().trim() == '' || $('[name=LECT_PLAY]').val().trim() == null ) return alert('OT 플레이어를 선택해 주세요');
// 		if ( $('[name=LECT_PLAY_LINK]').val().trim() == '' || $('[name=LECT_PLAY_LINK]').val().trim() == null ) return alert('OT 링크를 입력해 주세요.');
		if ( $('#addVod_Target tr.noValue').length == 1 ) return alert('강의를 등록해 주세요');
		
		var ordeChk = false;
// 		$('[name=ORDE]').each(function(k){
// 			if ( $(this).val().trim() == '' || $(this).val().trim() == null ) {
// 				ordeChk = true;
// 				return ;
// 			}
// 		});
// 		if (ordeChk) return alert('강의 순서를 전부 입력해 주세요.');
		
		var params = unit_getParams("searchArea");
		params.status = "WRITE";
		params.query = "insertMngLectData";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		params.LECT_CD = '${sysDateValue}' + 'VL';
		params.LECT_STAT_CD = $('input[name="LECT_STAT_CD"]:checked').val();
		
		var result = fn_DataAjax2( params );
		
		var params = new Object();
		params.status = "WRITE";
		params.query = "updateMngLectDataDataOnDuplicate";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		
		$('#addVod_Target tr').not('.noValue').each(function(k){
			params.VOD_IDX = $(this).find('input[name=VOD_IDX]').val();
			params.DATA_IDX = $(this).find('input[name=DATA_IDX]').val();
			params.DATA_ORDE = $(this).find('input[name=ORDE]').val();
			var result = fn_DataAjax( params );
			
		});
		
		var params = new Object();
		params.status = "EDIT";
		params.query = "updateMngLectMateDataLectIdx";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	
		$('#addMate_Target tr').not('.noValue').each(function(k){
			params.MATE_IDX = $(this).attr('id').replace('mate','');
			fn_DataAjax( params );
		});
		
		
		location.href='${unit.move("index", "" )}';
	}
}

let vodList = new Object;

function fn_BtnFindVod( pageNo ){
	var params = unit_getParams('searchVod');
	params.query = 'selectMngVodPopList';
	params.status = "PAGE";
	params.CATE_IDX = $('[name=CATE_IDX]').val();
	params.thisPage = pageNo;
	if (params.thisPage == 0 || params.thisPage == null || params.thisPage == "" || params.thisPage == undefined) {
		params.thisPage = 1;
	}
	
	var html = "";
	
	// 언젠가 aJax로 페이징을 넣어야 함 지금은 스크롤로 대체
	var paging = fn_DataAjax2(params);
	$('#search_vod_Target').empty();
	vodList = paging.out.detail.data;

	 if( vodList.length > 0 ) {

		$.each(  vodList, function(k, v){
			html += '<tr>';
			html += '	<td>';
			html += '		<input type="checkbox" class="chk" name="chk">';
			html += '		<input type="hidden" name="targetVod" value="'+v.VOD_IDX+'">';
			html += '	</td>';
			html += '	<td>'+v.MASTER_NM+'</td>';
			html += '	<td>'+v.VOD_CD+'</td>';
			html += '	<td>'+v.VOD_NM+'</td>';
//	 		html += '	<td>'+v.VOD_PROG_CD+'</td>';
			// 1분이 안될경우
			if ( v.TOTAL_RUNN_DETAIL != '0:' ) {
				html += '	<td>'+v.TOTAL_RUNN_DETAIL+'</td>';
			}else{
				html += '	<td>'+v.TOTAL_RUNN_DETAIL+v.TOTAL_RUNN+'</td>';
			}
			html += '</tr>';
			
		});
		
	 } else {
		 html += '<tr>';
		 html += '<td colspan="99">등록된 내용이 없습니다.</td>';
		 html += '</tr>';
	 }
	 
	$('#search_vod_Target').append(html);
		
	var varHtml = "";	
	varHtml += '		<li><a id="pagingFirst" onclick="fn_BtnFindVod('+ paging.out.detail.paging.prevStep +');"  aria-label="Previous"><i class="fa fa-angle-left"></i></a></li>   ';
	
	for (var i = paging.out.detail.paging.startPage; i <= paging.out.detail.paging.endPage; i++) {
		if (paging.out.detail.paging.thisPage == i) {
			varHtml += '<li><a id="pagingActive" onclick="fn_BtnFindVod('+ i +');" class="active" style="cursor:pointer;">'+ i +'</a></li>   '
		}else{
			varHtml += '<li><a name="pagingPassiive" onclick="fn_BtnFindVod('+ i +');" style="cursor:pointer;">'+ i +'</a></li>   ';
		}
		
	}
	
	varHtml += '		<li><a id="pagingLast" onclick="fn_BtnFindVod('+ paging.out.detail.paging.nextStep +');"  aria-label="Next"><i class="fa fa-angle-right"></i></a></li>   ';
	$('#pagingVar').empty();
	$('#pagingVar').append( varHtml );
	
}

function fn_addVod(){
	if ( $('#addVod_Target tr.noValue').length == 1 ) 
		$('#addVod_Target').empty();
	
	var html = "";
	let isc = true;
	$('.chk').each(function(k){
		if ($(this).is(':checked')) {
			
			$('#addVod_Target tr').each(function(){
				if (this.id == vodList[k].VOD_CD) {	isc = false;}
			});
			if ( isc ) {
				
				html += '<tr id="'+vodList[k].VOD_CD+'">';
				html += '		<td>'+vodList[k].VOD_CD+'<input type="hidden" name="VOD_IDX" value="'+vodList[k].VOD_IDX+'" /></td>';
				html += '		<td>'+vodList[k].VOD_NM+'</td>';
// 				html += '		<td>'+vodList[k].VOD_STAT_CD+'</td>';
				html += '		<td>'+vodList[k].VOD_PROG+'</td>';
				html += '		<td>'+vodList[k].SYS_REG_DTM+'</td>';
// 				html += '		<td><input type="text" name="ORDE" class="form-control form-control-sm col-8" onkeyup="this.value=this.value.replace(/[^0-9]/g,\'\');" /><input type="hidden" name="DATA_IDX" value="" /></td>';
				html += '		<td><a class="removeVod">삭제</a></td>';
				html += '</tr>';
			}
				
			isc = true;
		}
	});
	
	// 종결코드
	$('#addVod_Target').append(html);
}

function fn_addMate(){
	if ( $('[name=MATE_NM]').val() == '' || $('[name=MATE_NM]').val() == null ) return alert('준비물명을 입력해주세요');
	if ( $('[name=MATE_UUID]').val() == '' || $('[name=MATE_UUID]').val() == null ) return alert('준비물 이미지를 입력해주세요');
	if ( $('[name=MATE_PRIC]').val() == '' || $('[name=MATE_PRIC]').val() == null ) return alert('상품금액을 입력해주세요');
	if ( $('[name=MATE_DISC_CD]').val() == '' || $('[name=MATE_DISC_CD]').val() == null ) return alert('할인종류를 선택해주세요');
	if ( $('[name=MATE_DISC]').val() == '' || $('[name=MATE_DISC]').val() == null ) return alert('할인금액을 입력해주세요');
	if ( $('[name=MATE_CTNT]').val() == '' || $('[name=MATE_CTNT]').val() == null ) return alert('준비물 설명을 입력해주세요');
	
	
	if ( $('#addMate_Target tr.noValue').length == 1 ) 
		$('#addMate_Target').empty();
	
	var params = unit_getParams('mate_Target');
	params.query = "updateMngLectMate";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.LECT_IDX = '${out.params.lectIdx }';
	params.DATA_IDX = '';
	params.status = "WRITE";
	params.MATE_CD = '${sysDateValue}' +  "VM";
	
	fn_DataAjax( params );
	
	var newMateIdx = new Object();
	newMateIdx.query = "getMyMateIdx";
	newMateIdx.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	newMateIdx.LECT_IDX = '${out.params.lectIdx }';
	newMateIdx.status = "DETAIL";
	
	var resultJson = fn_DataAjax2( newMateIdx );
	
	var html = "";

	html += '<tr id="mate'+resultJson.out.detail.data[0].MATE_IDX+'">';
	html += '		<td>'+params.MATE_NM+'</td>';
	html += '		<td>'+resultJson.out.detail.data[0].MATE_CD+'</td>';
	html += '		<td>'+params.MATE_PRIC_REAL+'</td>';
	html += '		<td><a class="editMate">관리</a></td>';
	html += '</tr>';
	
	// 종결코드
	$('#addMate_Target').append(html);
	$('.btn_close_pop').trigger("click");
}

function fn_editMate(){
	if ( $('[name=MATE_NM]').val() == '' || $('[name=MATE_NM]').val() == null ) return alert('준비물명을 입력해주세요');
	if ( $('[name=MATE_UUID]').val() == '' || $('[name=MATE_UUID]').val() == null ) return alert('준비물 이미지를 입력해주세요');
	if ( $('[name=MATE_PRIC]').val() == '' || $('[name=MATE_PRIC]').val() == null ) return alert('상품금액을 입력해주세요');
	if ( $('[name=MATE_DISC_CD]').val() == '' || $('[name=MATE_DISC_CD]').val() == null ) return alert('할인종류를 선택해주세요');
	if ( $('[name=MATE_DISC]').val() == '' || $('[name=MATE_DISC]').val() == null ) return alert('할인금액을 입력해주세요');
	if ( $('[name=MATE_CTNT]').val() == '' || $('[name=MATE_CTNT]').val() == null ) return alert('준비물 설명을 입력해주세요');
	
	
	var params = unit_getParams('mate_Target');
	params.query = "updateMngLectMateOnlyUpdate";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.LECT_IDX = '${out.params.lectIdx }';
	params.MATE_IDX = $('[name=MATE_IDX]').val();
	params.status = "WRITE";
	params.MATE_CD = '${sysDateValue}' + "VM";
	fn_DataAjax( params );
	
	$('#mate'+params.MATE_IDX+' td').eq(0).text( params.MATE_NM );
	$('#mate'+params.MATE_IDX+' td').eq(1).text( $('[name=MATE_CD]').val() );
	$('#mate'+params.MATE_IDX+' td').eq(2).text( params.MATE_PRIC_REAL );
	
	$('.btn_close_pop').trigger("click");
}

function fn_deleteMate(){
	if (confirm('정말로 삭제하시겠습니까?')) {
		
		var params = unit_getParams('mate_Target');
		params.query = "deleteMngLectMate";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		params.LECT_IDX = '${out.params.lectIdx }';
		params.MATE_IDX = $('[name=MATE_IDX]').val();
		params.status = "DELETE";
		fn_DataAjax( params );
		
		$('#mate'+params.MATE_IDX).remove();
		
		let html = "";
		if ( !$('#addMate_Target tr').length ) {
			html += '<tr class="noValue">';
			html +=	'<td colspan="11">등록된 내용이 없습니다.</td>';
			html +=	'</tr>';
			$('#addMate_Target').append( html );
		}
		
		$('.btn_close_pop').trigger("click");
	}
	
}


// $(this).closest('tr').find('[name=ORDE]').val() 
$(document).on("click",'.removeVod',function(k){
	var params = new Object();
	params.status = "EDIT";
	params.DATA_IDX = $(this).closest('tr').find('input[name=DATA_IDX]').val();
	params.query = "DeleteMngLectDataData";
	var result = fn_DataAjax( params );
	
	let html = "";
	if ( $(this).closest('tbody').find('tr').length == 1 ) {
		html += '<tr class="noValue">';
		html +=	'<td colspan="11">등록된 내용이 없습니다.</td>';
		html +=	'</tr>';
		$(this).closest('tbody').append( html );
	}
	
	$(this).closest('tr').remove();
});

$(document).on("click",'#LECT_UUID_FILE',function(k){
	setUuid( $('#LECT_UUID').val() );
});

$(document).on("click",'.editMate',function(k){
	$('#titleTarget').text('준비물 수정');
	$('#mateDelBtn').show();
	$('#mateWriBtn').text('준비물 수정');
	$('#mateWriBtn').removeAttr('onclick');
	$('#mateWriBtn').attr('onclick','fn_editMate();');
	var params = new Object();
	params.status = "DETAIL";
	params.MATE_IDX = $(this).closest('tr').attr('id').replace('mate','');
	params.query = "selectMngLectMateData";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	var result = fn_DataAjax2( params );
	console.log(result);
	
	var mateDetail = result.out.detail.data[0];
	
	$('[name=MATE_NM]').val(mateDetail.MATE_NM);
	$('[name=MATE_CD]').val(mateDetail.MATE_CD);
	$('[name=MATE_PRIC_REAL]').val(mateDetail.MATE_PRIC_REAL);
	$('[name=MATE_PRIC]').val(mateDetail.MATE_PRIC);
	$('[name=MATE_DISC_CD]').val(mateDetail.MATE_DISC_CD);
	$('[name=MATE_DISC]').val(mateDetail.MATE_DISC);
	$('[name=MATE_CTNT]').val(mateDetail.MATE_CTNT);
	$('[name=MATE_IDX]').val(mateDetail.MATE_IDX);
	$('[name=MATE_UUID]').val(mateDetail.MATE_UUID);
	
	setUuid( mateDetail.MATE_UUID );
	imgIdValue = 'MATE_UUID'+"_FILE";
	unit_fileGet( imgIdValue, "fn_fileUpload");
	
	alertShow('70%','','add_Mate');
	
});

function fn_addmatePop(){
	$('#titleTarget').text('준비물 등록');
	$('#mateWriBtn').text('준비물 등록');
	$('#mateWriBtn').removeAttr('onclick');
	$('#mateWriBtn').attr('onclick','fn_addMate();');
	$('#mateDelBtn').hide();
	$('[name=MATE_NM]').val('');
	$('[name=MATE_CD]').val('(자동발번)');
	$('[name=MATE_PRIC_REAL]').val('');
	$('[name=MATE_PRIC]').val('');
	$('[name=MATE_DISC_CD]').val('');
	$('[name=MATE_DISC]').val('');
	$('[name=MATE_CTNT]').val('');
	$('[name=MATE_IDX]').val('');
	$('[name=MATE_UUID]').val('');
	
	setUuid( fn_GetUuid() );
	imgIdValue = 'MATE_UUID'+"_FILE";
	unit_fileGet( imgIdValue, "fn_fileUpload");
	
	alertShow('70%','','add_Mate');
}

// $(document).on('change','[name=LECT_PLAY_LINK]',function(){
// 	if ( !checkDetailUrl( this.value ) ) {
// 		alert('URL 형식으로 입력해주세요.');
// 		this.value = '';
// 	}
// });

</script>

