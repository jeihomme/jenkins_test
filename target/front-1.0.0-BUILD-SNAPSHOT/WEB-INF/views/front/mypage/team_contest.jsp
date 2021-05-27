<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<h2 class="hideHeading">컨텐츠</h2>
<div class="mypage_subGnb">
	<ul>
		<li><a href="/front/mypage/profile" title="프로필">프로필</a></li>
		<li><a href="/front/mypage/bookmark" title="나의 관심 프로젝트">나의 관심 프로젝트</a></li>
		<li class="active"><a href="/front/mypage/team_contest" title="팀 만들기">팀 만들기</a></li>
		<li><a href="/front/mypage/myteam_list" title="나의 팀 관리">나의 팀 관리</a></li>
		<li><a href="/front/mypage/awards" title="수상인증">수상인증</a></li>
		<c:choose>
				<c:when test="${sessionScope.loginStat eq 'K'}">
					<li><a href="/front/membership/kakaomodify" title="정보 수정">정보수정</a></li>
				</c:when>
				<c:otherwise>
			 <li><a class="fn_profileEditAccess" href="#none" title="정보 수정">정보수정</a></li>
				</c:otherwise>
		</c:choose>
		<li><a href="/front/mypage/notice" title="공지사항">공지사항</a></li>
	</ul>
</div>
<div class="mypage_wrap">
	<div class="mypage_teamWrap">
		<h2>
			<p><img src="/resources/images/teamwork.png" alt="팀워크"/><span>뉴-스타터에서 다양한 도전을 경험해보세요!</span></p>
		</h2>
		<div class="mypage_team">
			<h3>과제선택</h3>
			<p class="team_sortGroup">
				<button class="btn_blk btn_team_common" onclick="fn_toTeamContest();">공모전</button>
				<button class="btn_fff btn_team_common" onclick="fn_toTeamSocial();">사회문제</button>
			</p>
			<h3>모집 위치</h3>
			<p class="team_socialLocation">
				<select name="contestLoc">
					<option value="" selected>모집 지역 선택</option>
					<option>서울</option>
					<option>부산</option>
					<option>인천</option>
					<option>대구</option>
					<option>광주</option>
					<option>대전</option>
					<option>울산</option>
					<option>세종</option>
					<option>경기</option>
					<option>강원</option>
					<option>충남</option>
					<option>충북</option>
					<option>경남</option>
					<option>경북</option>
					<option>전남</option>
					<option>전북</option>
					<option>제주</option>
				</select>
			</p>
			<h3>도전 공모전 명칭</h3>
			<p class="team_contestName">
				<input type="text" name="contestName" title="공모전 명칭" placeholder="공모전 명칭을 입력하세요." disabled /><button class="btn_blk btn_team_common" onclick="fn_BtnSearch();">검색</button>
			</p>
			
			<div id="modal_contestAdd" class="modal_team_view">
				<p class="modal_guide_banner_close"><a href="#none" title="닫기"><img src="/resources/images/info_guide_close.png" alt="닫기"/></a></p>
				<div class="modal_team_viewWrap">
					<h3>공모전 검색</h3>
					<div class="modal_team_viewContents">
						<p class="teamAdd_search">
							<input type="text" name="teamAddTitle" style="width:360px;" title="아이디, 닉네임 검색" placeholder="공모전 명을 입력해주세요."/>
							<button class="btn_srch" onclick="fn_BtnSearchContest();"><img src="/resources/images/icon_srch.png" alt="검색"/></button>
						</p>
						<p class="teamAdd_title">검색결과</p>
						<ul id="searchContest" class="teamAdd_list">
						</ul>
					</div>
					<p class="modal_submit_button">
						<a class="fn_modalSubmitCancel" href="#none" title="취소">취소</a>
						<a class="fn_modalLeaveQnaSubmit" href="#none" onclick="fn_BtnSelect();" title="선택">선택</a>
					</p>
				</div>
			</div>
			
			<h3>팀 이름</h3>
			<p>
				<input type="text" name="contestTeamName" title="팀 이름" maxlength="15" placeholder="팀 이름을 입력하세요. (15자 이내)"/>
			</p>
			<h3>팀원 추가</h3>
			<div class="team_contestMember pdb50">
				<ul id="selectedUserList">
					<li class="team_add"><a class="fn_teamAdd" href="#none" title="팀원 추가"><img src="/resources/images/profile_team_add.png" alt="팀원 추가"/></a></li>
				</ul>
			</div>
			<div class="team_submitWrap">
				<button class="btn_grn btn_team_common" onclick="fn_BtnSave();">팀 결성</button>
			</div>
		</div>
	</div>
</div>
<div class="m_footerDummy"></div>
<script type="text/javascript">
//////////////////////////////////////////////////////////
//1. 변수 초기화
//////////////////////////////////////////////////////////
var compIdx = 0;
var tTitle = '';

//////////////////////////////////////////////////////////
//2. onload 함수
//////////////////////////////////////////////////////////

$(function(){
	fn_BtnUserSearch();
	fn_BtnSearchContest();
});

$(".fn_modalSubmitCancel").click(function(){
	$("#modal_contestAdd").hide(0);
	$("#screenCover").hide(0);
});

$('#searchContest li').click(function(){
	
	
});
//////////////////////////////////////////////////////////
//3. 서비스 함수
//////////////////////////////////////////////////////////
	function fn_BtnSave() {
		
	//	1. 유효성 검사
		var params = new Object();
		params.tLoc = $('[name=contestLoc]').val();
		params.compIdx = compIdx;
		params.tNm = $('[name=contestTeamName]').val();
		params.tTitle = tTitle;
		params.status = 'WRITE'; 
		
		if( params.tLoc == "") return alert("모집 위치를 선택하세요.");
		if( params.compIdx == "") return alert("공모전을 검색하세요.");
		if( params.tNm == "") return alert("팀 이름을 입력하세요.");
		
		var length = $('#selectedUserList input').length;
		 
		params.userEmail = '';
		
		if( length != 0) {
			for( var i = 0 ; i < length; i++ ) {
				params.userEmail += $('#selectedUserList input')[i].value + ',';
			}
		}
		
	//	2. 유효성 검사 서비스로 이동
		var result = ${unit.ajax("team_contest", "params")};
		
		if ( unit_isComplete(result) ){
			location.href="/front/mypage/myteam_detail";
		} else {
			alert("필수값을 입력해주세요.");
		}
	}
	
	function fn_BtnUserSearch() {

		//  1. 유효성 검사를 위한 파라미터값
		var params = new Object();
		params.status = 'SEARCH_USER';
		
		//	2. 유효성 검사 서비스로 이동
		var result = ${unit.ajax("team_contest", "params")};

		if ( unit_isComplete(result) ){
			
// 			2-1. 진행중인공모전 데이터 삽입
			$('#searchUser li').remove();
			
			var jsonDetail = result.out.list.data;
			
			var inTag = '';
			
			$.each( jsonDetail, function( key, val) {  
				
				inTag += '<li onclick="$(this).toggleClass(\'teamAdd_list_active\');">';
				inTag += '<input type="hidden" value="'+val.USER_EMAIL+'"/>';
				inTag += '<a href="#none" title="사용자 프로필" >';
				inTag += '<p class="alarm_pic"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>';
				inTag += '<p class="alarm_txt">';
				inTag += '<span name=selectedUserNick style="font-weight:bold;">'+val.USER_NICK+'</span>';
				inTag += '<br><span name=selectedUserEmail >'+val.USER_EMAIL+'</span>';
				inTag += '</p>';
				inTag += '</a>';
				inTag += '</li>';
				
			});

			$('#searchUser').append( inTag );
		}
	}
	
	function fn_BtnSearchContest() {

		//  1. 유효성 검사를 위한 파라미터값
		var params = new Object();
		params.status = 'SEARCH_CONTEST';
		
		//	2. 유효성 검사 서비스로 이동
		var result = ${unit.ajax("team_contest", "params")};

		if ( unit_isComplete(result) ){
			
// 			2-1. 진행중인공모전 데이터 삽입
			$('#searchContest li').remove();
			
			var jsonDetail = result.out.list.data;
			
			var inTag = '';
			
			$.each( jsonDetail, function( key, val) {  
				
				inTag += '<li onclick="$(this).toggleClass(\'contestAdd_list_active\');fn_BtnSelectContest();">';				inTag += '<input type="hidden" value="'+val.COMP_IDX+'"/>';
				inTag += '<a href="#none" title="사용자 프로필" >';
				inTag += '<p class="alarm_txt">';
				inTag += '<span name=selectedContest style="font-weight:bold;">'+val.COMP_NM+'</span>';
				if( val.COMP_DDAY == 0 )inTag += '<br><span name=selectedUserEmail >오늘마감</span>';
				else inTag += '<br><span name=selectedUserEmail >D'+val.COMP_DDAY+'</span>';
				inTag += '</p>';
				inTag += '</a>';
				inTag += '</li>';
				
			});

			$('#searchContest').append( inTag );
		}
	}

//////////////////////////////////////////////////////////
//4. 사용자 함수
//////////////////////////////////////////////////////////
	function fn_BtnSearch() {
		$('.contestAdd_list_active').removeClass('contestAdd_list_active');
		$("#screenCover").show(0);
		$("#modal_contestAdd").show(0);
	}

	function fn_BtnSelect() {
		var length = $('.teamAdd_list_active').length;
		
		if ( length == 0 ) return alert("추가하려면 한 명이라도 선택되어야합니다.");
		
		var inTag = '';
		
		for( var i = 0; i< length; i++ ) {
			var userEmail = $('.teamAdd_list_active input')[i].value;
			
// 		중복 제거
			if( $('#selectedUserList').find('input').val() !=  userEmail ) {
				inTag += '<li><a href="/front/mypage/profile_other" title="사용자 프로필 보기"><input type="hidden" value="'+userEmail+'"/><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></a></li>';
			}
		}
		
		$('#selectedUserList .team_add').before( inTag );

		$("#screenCover").hide(0);
		$("#modal_teamAdd").hide(0);
		$("#modal_contestAdd").hide(0);
	}
	
	function fn_BtnSelectContest() {
		var length = $('.contestAdd_list_active').length;
		if ( length == 0 ) return alert("공모전을 선택해주세요.");
		
		compIdx = $('.contestAdd_list_active input').val();
		tTitle = $('.contestAdd_list_active [name=selectedContest]').text();
		$('[name=contestName]').val( tTitle );

		$("#screenCover").hide(0);
		$("#modal_teamAdd").hide(0);
		$("#modal_contestAdd").hide(0);
	}
	
</script>







