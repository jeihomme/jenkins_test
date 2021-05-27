<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<div class="tbl_view">
	<table class="view_tbl01" summary="">
		<caption>회원 조회</caption>
		<colgroup>
			<col style="width: 10%;" />
			<col  />	
			<col style="width: 10%;" />
			<col style="width: 45%;" />	
			<col style="width: 10%;" />			
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">회원명</th>
				<td><input type="text" name=userName class="form-control form-control-sm col-8"  placeholder="회원명을 입력하세요" /></td>
				<th scope="row">탈퇴여부</th>
				<td>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio3_0" name=userStat value="" checked />
						<label for="radio3_0" class="label_txt">전체</label>
					</div>				
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio3_1" name=userStat value="U" />
						<label for="radio3_1" class="label_txt">회원</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio3_2" name=userStat value="P" />
						<label for="radio3_2" class="label_txt">중지</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio3_3" name=userStat value="L" />
						<label for="radio3_3" class="label_txt">탈퇴</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio3_4" name=userStat value="F" />
						<label for="radio3_4" class="label_txt">강제탈퇴</label>
					</div>					
				</td>					
				<td rowspan="3"><a onClick="fn_BtnSearch();" class="btn btn-md btn-black" style="color:white;">검색</a></td>				
			</tr>
			<tr>
				<th scope="row">닉네임</th>
				<td><input type="text" name=userNick class="form-control form-control-sm col-8"  placeholder="닉네임를 입력하세요" /></td>				
				<th scope="row">연락처</th>
				<td><input type="text" name=userTel class="form-control form-control-sm col-8"  placeholder="연락처를 입력하세요" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/></td>
			</tr>
			<tr>		
				<th scope="row">직업</th>
				<td colspan="3">
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio0_0" name=userJob value="" checked />
						<label for="radio0_0" class="label_txt">전체</label>
					</div>				
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio0_2" name=userJob value="M" />
						<label for="radio0_2" class="label_txt">중학생</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio0_3" name=userJob value="H" />
						<label for="radio0_3" class="label_txt">고등학생</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio0_4" name=userJob value="U" />
						<label for="radio0_4" class="label_txt">대학생</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio0_5" name=userJob value="G" />
						<label for="radio0_5" class="label_txt">대학원생</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio0_6" name=userJob value="A" />
						<label for="radio0_6" class="label_txt">일반인</label>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>
	
<!-- 리스트  시작-->
<div class="title_wrap">
	<h4 class="floatL">회원 리스트</h4>
</div>

<div class="tbl_list">
	<table class="list_tbl01" summary="">
		<caption>회원 리스트 테이블</caption>
		<colgroup>
			<col style="width: 10px;" />
			<col style="width: 100px" />
			<col style="width: 100px" />
			<col style="width: 150px" />	
			<col style="width: 150px" />
			<col style="width: 250px" />
			<col style="width: 200px" />
			<col style="width: 100px" />
			<col style="width: 100px" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No.</th>	
				<th scope="col">회원명</th>
				<th scope="col">직업</th>				
				<th scope="col">닉네임</th>
				<th scope="col">연락처</th>
				<th scope="col">이메일</th>
				<th scope="col">가입일</th>
				<th scope="col">장기간활성</th>
				<th scope="col">회원상태</th>
			</tr>
		</thead>
		<tbody id="memberList">
		</tbody>
	</table>
</div>

<div class="row">
	<div class="offset-4 col-4 text-center">		
		<ul class="pagination justify-content-center">
			<li><a href="" aria-label="Previous"><i class="fa fa-angle-left"></i></a></li>
			<li class="active"><a>1</a></li>
			<li><a href="">2</a></li>
			<li><a href="">3</a></li>
			<li><a href="">4</a></li>
			<li><a href="">5</a></li>			
			<li><a href="" aria-label="Next"><i class="fa fa-angle-right"></i></a></li>
		</ul>
	</div>	
</div>
<!-- 리스트  끝-->

<!-- 팝업메뉴 -->
<div id="popup_member_view" class="popup_wrap">
	<div class="popup_layer">
		<div class="popup_inner">
			<div class="popup_header">	
				<h1 class="title">회원정보 상세보기</h1>			
				<button class="btn btn_close_pop" data-action="popup_hide">닫기</button>
				<input id="userEditIdx" type="hidden" />
			</div>
			<div class="dialog_content">
				<div class="scroll_area">
					<!-- Start 팝업 컨텐츠 -->
					<div class="tbl_view">
						<table class="view_tbl01" summary="">
							<caption>회원정보 상세보기 테이블</caption>
							<colgroup>
								<col style="width: 15%;" />
								<col style="width: 35%;" />
								<col style="width: 15%;" />							
								<col  />	
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" rowspan="4">프로필 사진</th>
									<td rowspan="4"><div class="profile_img"><img src="/resources/images/profile_picture.png"></div></td>
									<th scope="row">회원명</th>
									<td id=userEditName></td>
								</tr>
								<tr>
									<th scope="row">직업</th>
									<td id=userEditJob></td>				
								</tr>
								<tr>
									<th scope="row">연락처</th>
									<td id=userEditTel></td>
								</tr>
								<tr>									
									<th scope="row">이메일</th>
									<td id=userEditEmail></td>
								</tr>
							</tbody>
						</table>
					</div>
									
					<div class="tbl_list mt10">
						<table class="list_tbl01" summary="">
							<caption>상호평가 관리 테이블</caption>
							<colgroup>
								<col style="width: 15%;" />
								<col style="width: 15%;" />							
								<col />						
							</colgroup>
							<tbody>
								<tr >		
									<td style="background-color:rgba(209, 234, 234, 0.5);">평점</td>					
									<td id="EVAL_AVG" style="background-color:rgba(209, 234, 234, 0.5);">4.5</td>					
									<td rowspan="6">
										<div class="mypage_layout mypage_chart">
											<canvas id="profile_radar"></canvas>
										</div>
									</td>
								</tr>							
								<tr>		
									<td>역할 성실도</td>					
									<td id="EVAL_ACT_SINC">4.5</td>									
								</tr>
								<tr>	
									<td>시간약속</td>					
									<td id="EVAL_TIME_APP">4.5</td>					
								</tr>
								<tr>	
									<td>배려심</td>					
									<td id="EVAL_PROFESSIONAL">4.5</td>					
								</tr>
								<tr>	
									<td>창의력</td>					
									<td id="EVAL_CONSIDERATION">4.5</td>					
								</tr>
								<tr>	
									<td>전문성</td>					
									<td id="EVAL_CREATIVITY">4.5</td>					
								</tr>								
							</tbody>
						</table>
					</div>					

					<div class="title_wrap">
						<h4>공모전 참여 기록</h4>
					</div>					
					<div class="tbl_list">
						<table class="list_tbl01" summary="">
							<caption>공모전 참여 테이블</caption>
							<colgroup>
								<col style="width: 7%;" />								
								<col />								
								<col style="width: 15%;" />
								<col style="width: 15%;" />							
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>								
									<th scope="col">공모전 제목</th>				
									<th scope="col">역할</th>
									<th scope="col">등록일</th>						
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>4</td>									
									<td>부산시 공공 디자인 공모전</td>					
									<td>팀장</td>					
									<td>2019-07-22</td>					
								</tr>							
								<tr>		
									<td>3</td>									
									<td>부산시 공공 디자인 공모전</td>					
									<td>팀원</td>					
									<td>2019-07-22</td>											
								</tr>
								<tr>	
									<td>2</td>									
									<td>부산시 공공 디자인 공모전</td>					
									<td>팀원</td>					
									<td>2019-07-22</td>							
								</tr>
								<tr>	
									<td>1</td>									
									<td>산업통상부 디자인 공모전</td>					
									<td>개인</td>					
									<td>2019-07-22</td>						
								</tr>								
							</tbody>
						</table>
					</div>										

					<div class="title_wrap">
						<h4>팀활동 기록</h4>
					</div>					
					<div class="tbl_list">
						<table class="list_tbl01" summary="">
							<caption>팀활동 기록 테이블</caption>
							<colgroup>
								<col style="width: 7%;" />								
								<col />								
								<col style="width: 15%;" />	
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>								
									<th scope="col">공모전 제목</th>				
									<th scope="col">평점</th>					
								</tr>
							</thead>
							<tbody>
								<tr>	
									<td>2</td>									
									<td>부산시 공공 디자인 공모전</td>					
									<td>4.5</td>												
								</tr>
								<tr>	
									<td>1</td>									
									<td>산업통상부 디자인 공모전</td>					
									<td>4.0</td>											
								</tr>								
							</tbody>
						</table>
					</div>

					<div class="title_wrap">
						<h4>수상 및 자격증 인증 기록</h4>
					</div>					
					<div class="tbl_list">
						<table class="list_tbl01" summary="">
							<caption>수상 및 자격증 인증 기록 테이블</caption>
							<colgroup>
								<col style="width: 7%;" />								
								<col />								
								<col style="width: 15%;" />	
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>								
									<th scope="col">공모전 제목</th>				
									<th scope="col">수상</th>					
								</tr>
							</thead>
							<tbody>
								<tr>	
									<td>1</td>									
									<td>산업통상부 디자인 공모전</td>					
									<td>금상</td>											
								</tr>								
							</tbody>
						</table>
					</div>

					
					<div class="title_wrap">
						<h4>회원상태</h4>
					</div>						
					<div class="tbl_view">						
						<table class="view_tbl01" summary="">
							<caption>회원상태 선택 테이블</caption>
							<colgroup>
								<col style="width: 15%;" />													
								<col style="width: auto;" />		
								<col style="width: 15%;" />
								<col style="width: auto;" />
								<col style="width: 15%;" />
								<col style="width: auto;" />
							</colgroup>
							<tbody>	
								<tr>
									<th scope="row">회원상태</th>
									<td>
										<div class="designRadiobutton form-control-sm">
											<input type="radio" id="radio1_U" name=userEditStat value="U" checked />
											<label for="radio1_U" class="label_txt">회원</label>
										</div>				
										<div class="designRadiobutton form-control-sm">
											<input type="radio" id="radio1_P" name=userEditStat value="P" />
											<label for="radio1_P" class="label_txt">중지</label>
										</div>
										<div class="designRadiobutton form-control-sm">
											<input type="radio" id="radio1_L" name=userEditStat value="L" />
											<label for="radio1_L" class="label_txt">탈퇴</label>
										</div>
										<div class="designRadiobutton form-control-sm">
											<input type="radio" id="radio1_F" name=userEditStat value="F" />
											<label for="radio1_F" class="label_txt">강제탈퇴</label>
										</div>
									</td>
								</tr>
								
								<tr>
									<th scope="row">회원상태 정보</th>
									<td><input type=text name=userEditStatDetail class="form-control form-control-sm col-8"  placeholder="중지/탈퇴/강제탈퇴 일 경우의 사유입니다." /></td>
								</tr>
								
								<tr id="userStatPause" >
									<th scope="row">중지 기간</th>
									<td>
										<input id="startDate" type="text" name="teamMemberDate" title="시작 날짜"  onChange="inputDateComparison(this);" placeholder="시작 날짜를 입력하세요."/>
										<input id="endDate" type="text" name="teamMemberDate" title="종료 날짜"  onChange="inputDateComparison(this);" placeholder="종료 날짜를 입력하세요."/>
									</td>
								</tr>
								
							</tbody>
						</table>						
					</div>				
					
					<div class="btn_wrap">
						<a href="#" onclick="fn_BtnEditSave();" class="btn  btn-md btn-danger" data-action="popup_hide">저장</a>						
						<a href="#" class="btn  btn-md btn-dark" data-action="popup_hide">취소</a>
					</div>				
					<!--// End 팝업 컨텐츠 -->
				</div><!--// End scroll_area -->
			</div><!--// End dialog_content -->
		</div><!--// End popup_inner -->
	</div><!--// End popup_layer -->
</div>

<script type="text/javascript">
//////////////////////////////////////////////////////////
//1. 변수 초기화
//////////////////////////////////////////////////////////
var ctx = document.getElementById("profile_radar");
var userEval = [];
var userName = '';


//////////////////////////////////////////////////////////
// 2. onload 함수
//////////////////////////////////////////////////////////
$(function(){
	 fn_BtnSearch();
});

// $("#startDate").datepicker({ dateFormat: 'yy-mm-dd' }).datepicker("setDate", new Date());
// $("#endDate").datepicker({ dateFormat: 'yy-mm-dd' }).datepicker("setDate", new Date());

$("#startDate").datepicker({ dateFormat: 'yy-mm-dd' });
$("#endDate").datepicker({ dateFormat: 'yy-mm-dd' });

$("#startDate").on("change", function(){
	
});

$('input:radio[name=userEditStat]').on("change", function(){
	
	 $('[name=userEditStatDetail]').val('');
	 
	if( $('input:radio[name=userEditStat]:checked').val() == 'P' ) {
		
		$('#startDate').prop('disabled', false);
		$('#endDate').prop('disabled', false);
		
	} else if( $('input:radio[name=userEditStat]:checked').val() != 'P' ) {
		
		$('#startDate').prop('disabled', true);
		$('#endDate').prop('disabled', true);
		
		$('#startDate').val('');
		$('#endDate').val('');
	}
		
});

function fn_UserStat() {
	
	if( $('input:radio[name=userEditStat]:checked').val() == 'P' ) {
		
		$('#startDate').prop('disabled', false);
		$('#endDate').prop('disabled', false);
		
	} else if( $('input:radio[name=userEditStat]:checked').val() != 'P' ) {
		$('#startDate').prop('disabled', true);
		$('#endDate').prop('disabled', true);
		
	}
}


//////////////////////////////////////////////////////////
//3. 서비스 함수
//////////////////////////////////////////////////////////
function fn_BtnSearch() {

// 	1. 유효성 검사를 위한 파라미터값
	var params = new Object();
	params.userName = $('[name=userName]').val();
	params.userStat = $('[name=userStat]:checked').val();
	params.userNick = $('[name=userNick]').val();
	params.userTel = $('[name=userTel]').val();
	params.userJob = $('[name=userJob]:checked').val();
	params.status = "SEARCH";
	
//	2. 유효성 검사 서비스로 이동
	var result = ${unit.ajax("member_list", "params")};
	
	if ( unit_isComplete(result) ){
		
		var jsonDetail = result.out.list.data;
		var inTag = '';
		
		$('#memberList tr').remove();
		
		if( jsonDetail[0] == null ) return;
		
		$.each( jsonDetail, function( key, val) {
			
			inTag += '<tr>';
			inTag += '<td>'+val.NO+'</td>';
			inTag += '<td><a href="#" onclick="fn_BtnDetail('+val.USER_IDX+', \''+val.USER_EMAIL+'\');">'+val.USER_NAME+'</a></td>';
			if( val.USER_JOB == 'M' ) inTag += '<td>중학생</td>';
			else if( val.USER_JOB == 'H' ) inTag += '<td>고등학생</td>';
			else if( val.USER_JOB == 'U' ) inTag += '<td>대학생</td>';
			else if( val.USER_JOB == 'G' ) inTag += '<td>대학원생</td>';
			else if( val.USER_JOB == 'A' ) inTag += '<td>일반인</td>';
			
			inTag += '<td>'+val.USER_NICK+'</td>';
			inTag += '<td>'+val.USER_TEL+'</td>';
			inTag += '<td>'+val.USER_EMAIL+'</td>';
			inTag += '<td>'+val.SYS_REG_DTM+'</td>';
			
			if( val.LONG_NOT_CONT_YN == 'Y' ) inTag += '<td>활성</td>';
			else inTag += '<td>비활성</td>';
			
			if( val.USER_STAT == 'U' ) inTag += '<td>회원</td>';
			else if( val.USER_STAT == 'P' ) inTag += '<td>중지</td>';
			else if( val.USER_STAT == 'L' ) inTag += '<td>탈퇴</td>';
			else if( val.USER_STAT == 'F' ) inTag += '<td>강제탈퇴</td>';
			else if( val.USER_STAT == 'K' ) inTag += '<td>카톡연동</td>';
			
			inTag += '</tr>';
		});
		
		$('#memberList').append( inTag );
	}
}


function fn_BtnDetail(USER_IDX, USER_EMAIL) {
		
//  1. 유효성 검사를 위한 파라미터값
	var params = new Object();
	params.userIdx = USER_IDX;
	params.userEmail = USER_EMAIL;
	params.status = "DETAIL";
	
//  2. 유효성 검사 서비스로 이동
	var result = ${unit.ajax("member_list", "params")};
	
	if ( unit_isComplete(result) ){
		var jsonDetail = result.out.detail.data;
		
		if( jsonDetail[0] == null ) return;
		
		$.each( jsonDetail, function( key, val) {
			
			$('#userEditIdx').val(USER_IDX);
			
//  		1. 상세 개요정보
			$('#userEditName').text(val.USER_NAME);
			
			if( val.USER_JOB == 'M' ) $('#userEditJob').text("중학생");
			else if( val.USER_JOB == 'H' ) $('#userEditJob').text("고등학생");
			else if( val.USER_JOB == 'U' ) $('#userEditJob').text("대학생");
			else if( val.USER_JOB == 'G' ) $('#userEditJob').text("대학원생");
			else if( val.USER_JOB == 'A' ) $('#userEditJob').text("일반인");
			
			$('#EVAL_AVG').text(val.EVAL_AVG);
			$('#EVAL_ACT_SINC').text(val.EVAL_ACT_SINC);
			$('#EVAL_TIME_APP').text(val.EVAL_TIME_APP);
			$('#EVAL_PROFESSIONAL').text(val.EVAL_PROFESSIONAL);
			$('#EVAL_CONSIDERATION').text(val.EVAL_CONSIDERATION);
			$('#EVAL_CREATIVITY').text(val.EVAL_CREATIVITY);
			
			$('#userEditTel').text(val.USER_TEL);
			$('#userEditEmail').text(val.USER_EMAIL);
			
			$('input:radio[name=userEditStat]:radio[value='+val.USER_STAT+']').prop('checked',true);
			
			$('[name=userEditStatDetail]').val(val.USER_STAT_DETAIL);

			$('#startDate').val( val.USER_STR_DATE );
			$('#endDate').val( val.USER_END_DATE );
			
//  		2. 차트 정보
			userName = val.USER_NAME;
			
			userEval[0] = val.EVAL_ACT_SINC;
			userEval[1] = val.EVAL_TIME_APP;
			userEval[2] = val.EVAL_PROFESSIONAL;
			userEval[3] = val.EVAL_CONSIDERATION;
			userEval[4] = val.EVAL_CREATIVITY;
			
			userEvalChart();
			
			// 3. 회원상태
			fn_UserStat();
		});

		popupShow("900","","popup_member_view");
	}
}

function fn_BtnEditSave() {
	
// 	1. 유효성 검사를 위한 파라미터값
	var params = new Object();
	params.userIdx = $('#userEditIdx').val();
	params.userStat = $('[name=userEditStat]:checked').val();
	params.userStatDetail = $('[name=userEditStatDetail]').val();
	params.userStrDate = $('#startDate').val();
	params.userEndDate = $('#endDate').val();
	
	params.status = "EDIT";
	
//	2. 유효성 검사 서비스로 이동
	var result = ${unit.ajax("member_list", "params")}; 
	
	if ( unit_isComplete(result) ){
		location.href='/mng/member/member_list';
		
	} else {
		alert("필수사항을 입력해주세요.");
	}
}
//////////////////////////////////////////////////////////
//4. 차트 함수
//////////////////////////////////////////////////////////

function userEvalChart() {

	var myChart = new Chart(ctx, {
		type : "radar",
		data : {
			labels: ["역할 성실도", "시간약속", "전문성", "배려심", "창의력"]
			,datasets: [{
				label: userName
				, data: userEval
				, backgroundColor: "rgba(209, 234, 234, 0.5)"
				, borderColor: "rgba(53, 171, 173, 1)"
				, borderWidth : 1
			}]
		}
		, options : {
			scale : {
				ticks : {
					beginAtZero : true,
					max: 5,
					min: 0,
					stepSize: 1
				}
			},
			 tooltips: {
				enabled: true,
				callbacks: {
					label: function(tooltipItem, data) {
						return data.datasets[tooltipItem.datasetIndex].label + ' : ' + data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
					}
				}
			}
		}
	});
}
//////////////////////////////////////////////////////////
//5. 날짜 함수
//////////////////////////////////////////////////////////

function inputDateSplit(obj) {
	
    var dateArray = obj.split("-");
    return dateArray[0] + dateArray[1] + dateArray[2];
}

function inputDateComparison(obj) {

    // 날짜 입력 엘리먼트 ID는 startDate(시작일), endDate(종료일)로 동일해야 한다.
    var startDate = inputDateSplit(document.getElementById("startDate").value);    // 시작일
    var endDate = inputDateSplit(document.getElementById("endDate").value);        // 종료일
    
    var objDate = inputDateSplit(obj.value);    // 입력한 엘리먼트의 일자
    // 입력일을 확인하는 이유는 현재 작성한 일자가 시작일인지 종료일인지 확인하기 위해서이다.
    
    if(startDate == objDate && startDate > endDate) {

        alert("시작일이 종료일보다 이 후 일수는 없습니다.\n다시 선택하여 주시기 바랍니다.");
        obj.value = document.getElementById("	").value;
        obj.focus();
    } else if(endDate == objDate && endDate < startDate) {

        alert("종료일이 시작일보다 이 전 일수는 없습니다.\n다시 선택하여 주시기 바랍니다.");
        obj.value = document.getElementById("startDate").value;
        obj.focus();
    } else {
        return false;
    }
}


</script>








