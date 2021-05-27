<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<h2 class="hideHeading">컨텐츠</h2>
<div class="main_swiper swiper-container social_main_visual">
	<div class="swiper-wrapper">
		<div class="swiper-slide">
			<div class="main_slide">
				<p>
					뉴스타터와 함께하는<br/>
					사회문제 도전!
				</p>
				<span>
					함께하면 힘이 되요!<br/>
					성공하면 기쁨이 두배가 되죠! 지금 시작해요!!
				</span>
				<button class="btn_transp" onclick="fn_toSocial();">사회문제 도전하기</button>
			</div>
		</div>
		<div class="swiper-slide">
			<div class="main_slide">
				<p>
					뉴스타터와 함께하는<br/>
					사회문제 도전!
				</p>
				<span>
					함께하면 힘이 되요!<br/>
					성공하면 기쁨이 두배가 되죠! 지금 시작해요!!
				</span>
				<button class="btn_transp" onclick="fn_toSocial();">사회문제 도전하기</button>
			</div>
		</div>
		<div class="swiper-slide">
			<div class="main_slide">
				<p>
					뉴스타터와 함께하는<br/>
					사회문제 도전!
				</p>
				<span>
					함께하면 힘이 되요!<br/>
					성공하면 기쁨이 두배가 되죠! 지금 시작해요!!
				</span>
				<button class="btn_transp" onclick="fn_toSocial();">사회문제 도전하기</button>
			</div>
		</div>
		<div class="swiper-slide">
			<div class="main_slide">
				<p>
					뉴스타터와 함께하는<br/>
					사회문제 도전!
				</p>
				<span>
					함께하면 힘이 되요!<br/>
					성공하면 기쁨이 두배가 되죠! 지금 시작해요!!
				</span>
				<button class="btn_transp" onclick="fn_toSocial();">사회문제 도전하기</button>
			</div>
		</div>
	</div>
	<div class="swiper-pagination"></div>
</div>
<div class="main_recruit">
	<div class="sectionWrap">
		<h2 class="main_sectionTitle">사회문제 뉴-스타터 모집</h2>
		<div class="main_recruit_listWrap recruit_gong_sub">
			<div class="recruit_categoryMenu social_categoryMenu">
				<h4>카테고리 선택</h4>
				<ol class="team_category team_socialCategory">
					<li class="team_socialCategory_active">
						<a href="#none" title="전체" onclick="fn_SocialNstrList(null, local);">
							<i>
								<img src="/resources/images/category_contest_00.png" alt="전체"/>
								<img class="team_socialCategory_active_img" src="/resources/images/category_contest_00_over.png" alt="전체"/>
							</i>
							<p>전체</p>
						</a>
					</li>
					<li >
						<a href="#none" title="사회약자" onclick="fn_SocialNstrList('S', local);">
							<i>
								<img src="/resources/images/category_socialissue_01.png" alt="사회약자"/>
								<img class="team_socialCategory_active_img" src="/resources/images/category_socialissue_01_over.png" alt="사회약자"/>
							</i>
							<p>사회약자</p>
						</a>
					</li>
					<li>
						<a href="#none" title="지역문제" onclick="fn_SocialNstrList('R', local);">
							<i>
								<img src="/resources/images/category_socialissue_02.png" alt="지역문제"/>
								<img class="team_socialCategory_active_img" src="/resources/images/category_socialissue_02_over.png" alt="지역문제"/>
							</i>
							<p>지역문제</p>
						</a>
					</li>
					<li>
						<a href="#none" title="동물문제" onclick="fn_SocialNstrList('A', local);">
							<i>
								<img src="/resources/images/category_socialissue_03.png" alt="동물문제"/>
								<img class="team_socialCategory_active_img" src="/resources/images/category_socialissue_03_over.png" alt="동물문제"/>
							</i>
							<p>동물문제</p>
						</a>
					</li>
					<li>
						<a href="#none" title="세계문제" onclick="fn_SocialNstrList('W', local);">
							<i>
								<img src="/resources/images/category_socialissue_04.png" alt="세계문제"/>
								<img class="team_socialCategory_active_img" src="/resources/images/category_socialissue_04_over.png" alt="세계문제"/>
							</i>
							<p>세계문제</p>
						</a>
					</li>
					<li>
						<a href="#none" title="환경문제" onclick="fn_SocialNstrList('E', local);">
							<i>
								<img src="/resources/images/category_socialissue_05.png" alt="환경문제"/>
								<img class="team_socialCategory_active_img" src="/resources/images/category_socialissue_05_over.png" alt="환경문제"/>
							</i>
							<p>환경문제</p>
						</a>
					</li>
					<li>
						<a href="#none" title="행사도움" onclick="fn_SocialNstrList('H', local);">
							<i>
								<img src="/resources/images/category_socialissue_06.png" alt="행사도움"/>
								<img class="team_socialCategory_active_img" src="/resources/images/category_socialissue_06_over.png" alt="행사도움"/>
							</i>
							<p>행사도움</p>
						</a>
					</li>
					<li>
						<a href="#none" title="기타" onclick="fn_SocialNstrList('Z', local);">
							<i>
								<img src="/resources/images/category_socialissue_07.png" alt="기타"/>
								<img class="team_socialCategory_active_img" src="/resources/images/category_socialissue_07_over.png" alt="기타"/>
							</i>
							<p>기타</p>
						</a>
					</li>
				</ol>
			</div>
			<div class="main_recruit_area">
				<div class="main_recruit_areaListWrap">
					<p class="main_recruit_areaList_btn">지역 <i class="fas fa-angle-down"></i></p>
					<button class="main_recruit_areaToTeam btn_fff btn_team_common" onclick="fn_toTeamSocial();">팀만들기 <i class="fal fa-plus"></i></button>
					<ul class="main_recruit_areaList">
						<li><a onclick="fn_SocialNstrList(category, null);" title="전국">전국</a></li>
						<li><a onclick="fn_SocialNstrList(category, '서울');" title="서울">서울</a></li>
						<li><a onclick="fn_SocialNstrList(category, '부산');" title="부산">부산</a></li>
						<li><a onclick="fn_SocialNstrList(category, '대구');" title="대구">대구</a></li>
						<li><a onclick="fn_SocialNstrList(category, '광주');" title="광주">광주</a></li>
						<li><a onclick="fn_SocialNstrList(category, '대전');" title="대전">대전</a></li>
						<li><a onclick="fn_SocialNstrList(category, '울산');" title="울산">울산</a></li>
						<li><a onclick="fn_SocialNstrList(category, '세종');" title="세종">세종</a></li>
						<li><a onclick="fn_SocialNstrList(category, '경기');" title="경기">경기</a></li>
						<li><a onclick="fn_SocialNstrList(category, '강원');" title="강원">강원</a></li>
						<li><a onclick="fn_SocialNstrList(category, '충남');" title="충남">충남</a></li>
						<li><a onclick="fn_SocialNstrList(category, '충북');" title="충북">충북</a></li>
						<li><a onclick="fn_SocialNstrList(category, '경남');" title="경남">경남</a></li>
						<li><a onclick="fn_SocialNstrList(category, '경북');" title="경북">경북</a></li>
						<li><a onclick="fn_SocialNstrList(category, '전남');" title="전남">전남</a></li>
						<li><a onclick="fn_SocialNstrList(category, '전북');" title="전북">전북</a></li>
						<li><a onclick="fn_SocialNstrList(category, '제주');" title="제주">제주</a></li>
					</ul>
				</div>
			</div>
			<ul id="socialNstrList" >
			</ul>
			<div class="social_loadMore">
				<button class="btn_social_loadMore" >더보기<i class="fas fa-chevron-down"></i></button>
				<button class="btn_social_loadLess" style="display:none;">접기<i class="fas fa-chevron-up"></i></button>
			</div>
		</div>
	</div>
</div>
<div class="m_footerDummy"></div>
<script>

//////////////////////////////////////////////////////////
//1. 변수 초기화
//////////////////////////////////////////////////////////
var category = '';
var local = '';
var cnt = 8;

//////////////////////////////////////////////////////////
//2. onload 함수
//////////////////////////////////////////////////////////

$(function() {
	
	//swiper init
	var swiper1 = new Swiper('.main_swiper', {
		loop : true,
		pagination : {
			el : '.swiper-pagination',
			clickable : true,
		},
	});

	fn_SocialNstrList(category, local);
	
	
	/* social_index */
// 	indexList_size = $("#socialNstrList li").size();
// 	console.log(indexList_size);
// 	$(".btn_social_loadLess").hide(0);
	
// 	var x = 8;
// 	$("#socialNstrList li:lt("+x+")").show();
	
// 	$(".btn_social_loadMore").click(function(){
// 		x = ( x+100 <= indexList_size ) ? x+100 : indexList_size;
// 		$("#socialNstrList li:lt("+x+")").show(0);
// 		$(this).hide(0);
// 		$(".btn_social_loadLess").show(0);
// 	});
	
// 	$(".btn_social_loadLess").click(function(){
// 		$("#socialNstrList li:gt(7)").hide(0);
// 		$(this).hide(0);
// 		$(".btn_social_loadMore").show(0);
// 	});
	
});


// 지역 마우스오버
$(".main_recruit_areaList_btn").mouseenter(function(){
	$(".main_recruit_areaList").stop().slideDown(500);
});

$(".main_recruit_area").mouseleave(function(){
	$(".main_recruit_areaList").stop().slideUp(500);
});

// 더보기 / 접기
$('.btn_social_loadMore').click(function() {
	cnt = '';
	fn_SocialNstrList(category, local);
	$(this).hide(0);
	$(".btn_social_loadLess").show(0);
});

$('.btn_social_loadLess').click(function() {
	cnt = 8;
	fn_SocialNstrList(category, local);
	$(this).hide(0);
	$(".btn_social_loadMore").show(0);
});

//////////////////////////////////////////////////////////
//3. 서비스 함수
//////////////////////////////////////////////////////////
	function fn_SocialNstrList( cate, loc ) {

		//  1. 유효성 검사를 위한 파라미터값
		var params = new Object();
		params.status = 'SEARCH';
		params.cnt = cnt;
		params.sCategory = cate;
		params.sLoc = loc;

		category = cate;
		local = loc;
		
		//	2. 유효성 검사 서비스로 이동
		var result = ${unit.ajax("index", "params")};

		if ( unit_isComplete(result) ){
// 			2-2. 뉴-스타터 모집
			$('#socialNstrList li').remove(); 
			
			var jsonDetail = result.out.list.data;
			
			var inTag = '';
			
			$.each( jsonDetail, function( key, val) {
				
				inTag += '<li>';
				inTag += '<a href="/front/social/team" title="사회문제 뉴스타터 상세보기">';
				inTag += '<p class="main_recruit_img"><img src="/resources/images/recruit_img01.png" alt="사회문제 이미지"/></p>';
				inTag += '<div class="main_recruit_txt">';
				inTag += '<strong>'+val.S_NM+'</strong>';
				inTag += '<span>'+val.S_TITLE+'</span>';
				inTag += '<p class="main_recruit_txt_detail">';
				inTag += '<span>by '+val.S_NM+'</span>';
				inTag += '<b><i class="fas fa-map-marker-alt"></i>'+val.S_LOC+'</b>';
				
				if( val.S_DDAY == 0 ) inTag += '<strong>오늘마감</strong>';
				else inTag += '<strong>D'+val.S_DDAY+'</strong>';
				
				inTag += '</p>'; 
				inTag += '</div>';
				
				if( val.S_DDAY == 0 ) inTag += '<p class="main_recruit_cate">오늘마감</p>';
				else if( val.S_DDAY > -31 ) inTag += '<p class="main_recruit_cate">D'+val.S_DDAY+'</p>';
				else inTag += '';
				
				inTag += '</a>'; 
				inTag += '</li>'; 
				
			});

			$('#socialNstrList').append( inTag );
			
// 			$("#socialNstrList li").show();
		}
	}
</script>
















