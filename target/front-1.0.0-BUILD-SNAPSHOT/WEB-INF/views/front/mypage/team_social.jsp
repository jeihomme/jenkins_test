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
		<div class="mypage_team mypage_socialProject">
			<h3>과제선택</h3>
			<p class="team_sortGroup">
				<button class="btn_fff btn_team_common" onclick="fn_toTeamContest();">공모전</button>
				<button class="btn_blk btn_team_common" onclick="fn_toTeamSocial();">사회문제</button>
			</p>
			<h3>모집 위치</h3>
			<p class="team_socialLocation">
				<select name="socialLoc">
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
			<h3>프로젝트 명</h3>
			<p>
				<input type="text" name="socialProjectName" title="프로젝트 이름" placeholder="프로젝트 이름을 입력하세요."/>
			</p>
			<h3>팀 이름</h3>
			<p>
				<input type="text" name="socialTeamName" title="팀 이름" maxlength="15" placeholder="팀 이름을 입력하세요. (15자 이내)"/>
			</p>
			<h3>카테고리 선택</h3>
			<ul class="team_category team_socialCategory">
				<li class="team_socialCategory_active">
					<a href="#none" title="사회약자" onclick="category='S';">
						<i>
							<img src="/resources/images/category_socialissue_01.png" alt="사회약자"/>
							<img class="team_socialCategory_active_img" src="/resources/images/category_socialissue_01_over.png" alt="사회약자"/>
						</i>
						<p>사회약자</p>
					</a>
				</li>
				<li>
					<a href="#none" title="지역문제" onclick="category='R';">
						<i>
							<img src="/resources/images/category_socialissue_02.png" alt="지역문제"/>
							<img class="team_socialCategory_active_img" src="/resources/images/category_socialissue_02_over.png" alt="지역문제"/>
						</i>
						<p>지역문제</p>
					</a>
				</li>
				<li>
					<a href="#none" title="동물문제" onclick="category='A';">
						<i>
							<img src="/resources/images/category_socialissue_03.png" alt="동물문제"/>
							<img class="team_socialCategory_active_img" src="/resources/images/category_socialissue_03_over.png" alt="동물문제"/>
						</i>
						<p>동물문제</p>
					</a>
				</li>
				<li>
					<a href="#none" title="세계문제" onclick="category='W';">
						<i>
							<img src="/resources/images/category_socialissue_04.png" alt="세계문제"/>
							<img class="team_socialCategory_active_img" src="/resources/images/category_socialissue_04_over.png" alt="세계문제"/>
						</i>
						<p>세계문제</p>
					</a>
				</li>
				<li>
					<a href="#none" title="환경문제" onclick="category='E';">
						<i>
							<img src="/resources/images/category_socialissue_05.png" alt="환경문제"/>
							<img class="team_socialCategory_active_img" src="/resources/images/category_socialissue_05_over.png" alt="환경문제"/>
						</i>
						<p>환경문제</p>
					</a>
				</li>
				<li>
					<a href="#none" title="행사도움" onclick="category='H';">
						<i>
							<img src="/resources/images/category_socialissue_06.png" alt="행사도움"/>
							<img class="team_socialCategory_active_img" src="/resources/images/category_socialissue_06_over.png" alt="행사도움"/>
						</i>
						<p>행사도움</p>
					</a>
				</li>
				<li>
					<a href="#none" title="기타" onclick="category='Z';">
						<i>
							<img src="/resources/images/category_socialissue_07.png" alt="기타"/>
							<img class="team_socialCategory_active_img" src="/resources/images/category_socialissue_07_over.png" alt="기타"/>
						</i>
						<p>기타</p>
					</a>
				</li>
			</ul>
			<h3>팀원 추가</h3>
			<div class="team_contestMember">
				<ul id="selectedUserList">
					<li class="team_add"><a class="fn_teamAdd" href="#none" title="팀원 추가"><img src="/resources/images/profile_team_add.png" alt="팀원 추가"/></a></li>
				</ul>
			</div>
			<h3>프로젝트 종료일</h3>
			<p class="wd400 datepicker_wrap pdb50">
				<input id="datepicker_team_socialDate" type="text" name="socialProjectEndDate" title="프로젝트 종료일" placeholder="프로젝트 종료일을 입력하세요."/>
			</p>
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
var category = 'S';


//////////////////////////////////////////////////////////
//2. onload 함수
//////////////////////////////////////////////////////////
//달력기능_datepicker
$(function() {
	$("#datepicker_team_socialDate").datepicker();
	
	fn_BtnUserSearch();
});

//////////////////////////////////////////////////////////
//3. 서비스 함수
//////////////////////////////////////////////////////////
	function fn_BtnSave() {
		
	//	1. 유효성 검사
		var params = new Object();
		params.sLoc = $('[name=socialLoc]').val();
		params.sTitle = $('[name=socialProjectName]').val();
		params.sNm = $('[name=socialTeamName]').val();
		params.sCategory = category;
		params.sDeadline = $('[name=socialProjectEndDate]').val();
		params.status = 'WRITE'; 
		
		if( params.sLoc == "") return alert("모집 위치를 선택하세요.");
		if( params.sTitle == "") return alert("타이틀을 입력하세요.");
		if( params.sNm == "") return alert("팀 이름을 입력하세요.");
		if( params.sDeadline == "") return alert("프로젝트 종료일을 입력하세요.");
		
		var length = $('#selectedUserList input').length;
		 
		params.userEmail = '';
		
		if( length != 0) {
			for( var i = 0 ; i < length; i++ ) {
				params.userEmail += $('#selectedUserList input')[i].value + ',';
			}
		}
		
	//	2. 유효성 검사 서비스로 이동
		var result = ${unit.ajax("team_social", "params")};
		
		if ( unit_isComplete(result) ){
			location.href="/front/mypage/myteam_detail";
		} else {
			alert("필수값을 입력해주세요.");
		}
	}
	
	function fn_BtnUserSearch() {

		//  1. 유효성 검사를 위한 파라미터값
		var params = new Object();
		params.status = 'SEARCH';
		
		//	2. 유효성 검사 서비스로 이동
		var result = ${unit.ajax("team_social", "params")};

		if ( unit_isComplete(result) ){
			
// 			2-1. 진행중인공모전 데이터 삽입
// 			$('#searchUser li').remove();
			
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
		
		$("#modal_teamAdd").hide(0);
		$("#screenCover").hide(0);
	}
	
</script>












