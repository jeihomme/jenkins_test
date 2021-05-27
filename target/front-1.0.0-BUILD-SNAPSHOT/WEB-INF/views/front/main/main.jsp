<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<h2 class="hideHeading">컨텐츠</h2>
<div class="main_swiper swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide">
			<div class="main_slide">
				<p>
					뉴스타터와 함께하는 ${stat.USER_STAT}  <br/>
					공모전 도전! 사회문제 도전!	
				</p>
				<span>
					함께하면 힘이 되요!<br/>
					성공하면 기쁨이 두배가 되죠! 지금 시작해요!!
				</span>
				<button class="btn_transp" onclick="fn_toContest();">공모전 도전하기</button>
			</div>
		</div>
		<div class="swiper-slide">
			<div class="main_slide">
				<p>
					뉴스타터와 함께하는<br/>
					공모전 도전! 사회문제 도전!
				</p>
				<span>
					함께하면 힘이 되요!<br/>
					성공하면 기쁨이 두배가 되죠! 지금 시작해요!!
				</span>
				<button class="btn_transp" onclick="fn_toContest();">공모전 도전하기</button>
			</div>
		</div>
		<div class="swiper-slide">
			<div class="main_slide">
				<p>
					뉴스타터와 함께하는<br/>
					공모전 도전! 사회문제 도전!
				</p>
				<span>
					함께하면 힘이 되요!<br/>
					성공하면 기쁨이 두배가 되죠! 지금 시작해요!!
				</span>
				<button class="btn_transp" onclick="fn_toContest();">공모전 도전하기</button>
			</div>
		</div>
		<div class="swiper-slide">
			<div class="main_slide">
				<p>
					뉴스타터와 함께하는<br/>
					공모전 도전! 사회문제 도전!
				</p>
				<span>
					함께하면 힘이 되요!<br/>
					성공하면 기쁨이 두배가 되죠! 지금 시작해요!!
				</span>
				<button class="btn_transp" onclick="fn_toContest();">공모전 도전하기</button>
			</div>
		</div>
	</div>
	<div class="swiper-pagination"></div>
</div>


<div class="main_recruit">
	<div class="sectionWrap">
		<h2 class="main_sectionTitle">뉴-스타터 모집</h2>
		<div class="recruit_gong main_recruit_listWrap">
			<h3><a href="/front/contest/index" title="공모전 뉴스타터 더보기"><span>공모전 뉴스타터 더보기<i class="far fa-arrow-alt-circle-right"></i></span></a></h3>
			<ul id="contestNstr">
			</ul>
		</div>
		<div class="recruit_social main_recruit_listWrap">
			<h3><a href="/front/social/index" title="사회문제 뉴스타터 더보기"><span>사회문제 뉴스타터 더보기<i class="far fa-arrow-alt-circle-right"></i></span></a></h3>
			<ul id="socialList">
			</ul>
		</div>
	</div>
</div>
<div class="sub_swiper swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide">
			<div class="sub_slide">
				<p>사회문제를 함께 할 여러분을 찾습니다!</p>
				<span>여러분을 기다리고 있어요. 지금 바로 만나보세요!!</span>
				<button class="btn_transp" onclick="fn_toSocial();">사회문제 도전하기</button>
			</div>
		</div>
		<div class="swiper-slide">
			<div class="sub_slide">
				<p>사회문제를 함께 할 여러분을 찾습니다!</p>
				<span>여러분을 기다리고 있어요. 지금 바로 만나보세요!!</span>
				<button class="btn_transp" onclick="fn_toSocial();">사회문제 도전하기</button>
			</div>
		</div>
		<div class="swiper-slide">
			<div class="sub_slide">
				<p>사회문제를 함께 할 여러분을 찾습니다!</p>
				<span>여러분을 기다리고 있어요. 지금 바로 만나보세요!!</span>
				<button class="btn_transp" onclick="fn_toSocial();">사회문제 도전하기</button>
			</div>
		</div>
	</div>
	<!-- Add Arrows -->
	<div class="sub_swiperNext swiper-button-next"></div>
	<div class="sub_swiperPrev swiper-button-prev"></div>
</div>
<div class="recruit_hot">
	<h2 class="main_sectionTitle" style="padding-bottom: 0">HOT한 공모전</h2>
	<div class="hot_swiper swiper-container">
		<div id="contestSlider" class="swiper-wrapper">
			<div class="swiper-slide"><ul class="recruit_hot_listWrap"><li></li></ul></div>
			<div class="swiper-slide"><ul class="recruit_hot_listWrap"><li></li></ul></div>
			<div class="swiper-slide"><ul class="recruit_hot_listWrap"><li></li></ul></div>
		</div>
		<!-- Add Arrows -->
		<div class="hot_swiperNext swiper-button-next"></div>
		<div class="hot_swiperPrev swiper-button-prev"></div>
	</div>
</div>
<div class="recruit_recent">
	<div class="sectionWrap">
		<h2 class="main_sectionTitle">최근 본 프로젝트</h2>
		<ul class="recruit_hot_listWrap">
			<li>
				<a href="/front/contest/contest" title="최근 본 프로젝트 상세보기">
					<p class="main_recruit_img"><img src="/resources/images/recruit_img01.png" alt="공모전 이미지"/></p>
					<div class="main_recruit_txt">
						<p class="main_hot_cate">디자인</p>
						<span>제 3회 서울시 도서관 꿈을담다 벽화 디자인 공모전</span>
						<p class="main_recruit_txt_detail">
							<span>by 서울시도서관</span>
							<b>500만원</b>
							<strong>D-5</strong>
						</p>
					</div>
				</a>
			</li>
			<li>
				<a href="/front/contest/contest" title="최근 본 프로젝트 상세보기">
					<p class="main_recruit_img"><img src="/resources/images/recruit_img02.png" alt="공모전 이미지"/></p>
					<div class="main_recruit_txt">
						<p class="main_hot_cate">디자인</p>
						<span>제 3회 서울시 도서관 꿈을담다 벽화 디자인 공모전</span>
						<p class="main_recruit_txt_detail">
							<span>by 서울시도서관</span>
							<b>500만원</b>
							<strong>D-5</strong>
						</p>
					</div>
				</a>
			</li>
			<li>
				<a href="/front/contest/contest" title="최근 본 프로젝트 상세보기">
					<p class="main_recruit_img"><img src="/resources/images/recruit_img03.png" alt="공모전 이미지"/></p>
					<div class="main_recruit_txt">
						<p class="main_hot_cate">디자인</p>
						<span>제 3회 서울시 도서관 꿈을담다 벽화 디자인 공모전</span>
						<p class="main_recruit_txt_detail">
							<span>by 서울시도서관</span>
							<b>500만원</b>
							<strong>D-5</strong>
						</p>
					</div>
				</a>
			</li>
			<li>
				<a href="/front/contest/contest" title="최근 본 프로젝트 상세보기">
					<p class="main_recruit_img"><img src="/resources/images/recruit_img04.png" alt="공모전 이미지"/></p>
					<div class="main_recruit_txt">
						<p class="main_hot_cate">디자인</p>
						<span>제 3회 서울시 도서관 꿈을담다 벽화 디자인 공모전</span>
						<p class="main_recruit_txt_detail">
							<span>by 서울시도서관</span>
							<b>500만원</b>
							<strong>D-5</strong>
						</p>
					</div>
				</a>
			</li>
			<li>
				<a href="/front/contest/contest" title="최근 본 프로젝트 상세보기">
					<p class="main_recruit_img"><img src="/resources/images/recruit_img01.png" alt="공모전 이미지"/></p>
					<div class="main_recruit_txt">
						<p class="main_hot_cate">디자인</p>
						<span>제 3회 서울시 도서관 꿈을담다 벽화 디자인 공모전</span>
						<p class="main_recruit_txt_detail">
							<span>by 서울시도서관</span>
							<b>500만원</b>
							<strong>D-5</strong>
						</p>
					</div>
				</a>
			</li>
		</ul>
	</div>
</div>
<div class="recruit_on">
	<div class="sectionWrap">
		<h2 class="ongoing_title">
			<a href="/front/contest/index#recruit_gong_onList" title="진행중인 공모전 전체보기">
				<p>진행중인 공모전<strong>마감임박순</strong></p>
				<p id="contestCnt"><span id="cnt"></span>개 더 보러가기<i class="far fa-arrow-alt-circle-right"></i></p>
			</a>
		</h2>
		<ul id="contestList" class="recruit_on_listWrap">
		</ul>
	</div>
</div>
<div class="m_footerDummy"></div>
<script type="text/javascript">
//////////////////////////////////////////////////////////
//1. 변수 초기화
//////////////////////////////////////////////////////////
var cnt = 4;



//////////////////////////////////////////////////////////
//2. 시작 함수
//////////////////////////////////////////////////////////
	$(function(){
		//swiper init
		var swiper1 = new Swiper('.main_swiper', {
			loop : true,
			pagination : {
				el : '.swiper-pagination',
				clickable : true,
			},
		});
		var swiper2 = new Swiper('.sub_swiper', {
			loop : true,
			navigation: {
				nextEl: '.sub_swiperNext',
				prevEl: '.sub_swiperPrev',
			},
		});
		var swiper3 = new Swiper('.hot_swiper', {
			navigation : {
				nextEl : '.hot_swiperNext',
				prevEl : '.hot_swiperPrev',
			},
		});
		
		fn_ContestList();
		fn_SocialList();
		fn_ContestNstr();
	});
	
//////////////////////////////////////////////////////////
//3. 서비스 함수
//////////////////////////////////////////////////////////

	function fn_ContestList() {

		//  1. 유효성 검사를 위한 파라미터값
		var params = new Object();
		params.status = 'SEARCH_CONTEST';
		params.compPermission = 'Y';
		params.order = 1;

		//	2. 유효성 검사 서비스로 이동
		var result = ${unit.ajax("main", "params")};

		if ( unit_isComplete(result) ){
			
			$('#contestList li').remove();
			
			var jsonDetail = result.out.list.data;
			
			var inTag = '';
// 			2-1. 진행중인 공모전
			$.each( jsonDetail, function( key, val) {
				if( key > 9 ) return;
				if( key == 0 ) {
					$('#cnt').text( val.NO );
					if( val.NO < 10 ) $('#contestCnt').css('display', 'none' );
				}
				
				inTag += '<li>';
				inTag += '<a href="/front/contest/contest" title="진행중인 공모전 상세보기">';
				inTag += '<p class="main_recruit_img"><img src="/resources/images/recruit_img08.png" alt="공모전 이미지"/></p>';
				inTag += '<div class="main_recruit_txt">';
				inTag += '<span>'+val.COMP_NM+'</span>';
				inTag += '<p class="main_recruit_txt_detail">';
				
				if( val.COMP_CATEGORY == 'M' ) inTag += "<em>기획/마케팅</em>";
				else if( val.COMP_CATEGORY == 'F' ) inTag += "<em>사진/영상</em>";
				else if( val.COMP_CATEGORY == 'P' ) inTag += "<em>공학/컴퓨터</em>";
				else if( val.COMP_CATEGORY == 'T' ) inTag += "<em>논문</em>";
				else if( val.COMP_CATEGORY == 'D' ) inTag += "<em>디자인</em>";
				else if( val.COMP_CATEGORY == 'H' ) inTag += "<em>수기</em>";
				else if( val.COMP_CATEGORY == 'C' ) inTag += "<em>건축</em>";
				else if( val.COMP_CATEGORY == 'A' ) inTag += "<em>예체능</em>";
				else if( val.COMP_CATEGORY == 'E' ) inTag += "<em>체험</em>";
				else if( val.COMP_CATEGORY == 'Z' ) inTag += "<em>기타</em>";
				
				inTag += '<i>by '+val.COMP_SPONSOR+'</i>';
				inTag += '<b>'+val.COMP_REWARD.toLocaleString()+' 원</b>'; 
				
				if( val.COMP_DDAY == 0 ) inTag += '<strong>오늘마감</strong>';
				else inTag += '<strong>D'+val.COMP_DDAY+'</strong>';
// 				else if( val.COMP_DDAY > -31 ) inTag += '<strong>D'+val.COMP_DDAY+'</strong>';
// 				else inTag += '<strong></strong>';
				
				inTag += '</p>';
				inTag += '</div>';
				inTag += '</a>';
				inTag += '</li>';
				
			});

			$('#contestList').append( inTag );
			
// 			2-2. HOT한 공모전
			$('#contestSlider div').remove();
			
			var jsonDetail = result.out.list.data;
			
			inTag = '';
			inTag += '<div class="swiper-slide">';
			inTag += '<ul class="recruit_hot_listWrap">';
			
			$.each( jsonDetail, function( key, val) {
				if( key > 11 ) return;
				if( key != 0 && key%4 == 0 ) {
					inTag += '<div class="swiper-slide">';
					inTag += '<ul class="recruit_hot_listWrap">';
				}
				
				inTag += '<li>';
				inTag += '<a href="/front/contest/contest" title="HOT한 공모전 상세보기">';
				inTag += '<p class="main_recruit_img"><img src="/resources/images/recruit_img01.png" alt="공모전 이미지"/></p>';
				inTag += '<div class="main_recruit_txt">';
				
				if( val.COMP_CATEGORY == 'M' ) inTag += '<p class=main_hot_cate>기획/마케팅</p>';
				else if( val.COMP_CATEGORY == 'F' ) inTag += '<p class=main_hot_cate>사진/영상</p>';
				else if( val.COMP_CATEGORY == 'P' ) inTag += '<p class=main_hot_cate>공학/컴퓨터</p>';
				else if( val.COMP_CATEGORY == 'T' ) inTag += '<p class=main_hot_cate>논문</p>';
				else if( val.COMP_CATEGORY == 'D' ) inTag += '<p class=main_hot_cate>디자인</p>';
				else if( val.COMP_CATEGORY == 'H' ) inTag += '<p class=main_hot_cate>수기</p>';
				else if( val.COMP_CATEGORY == 'C' ) inTag += '<p class=main_hot_cate>건축</p>';
				else if( val.COMP_CATEGORY == 'A' ) inTag += '<p class=main_hot_cate>예체능</p>';
				else if( val.COMP_CATEGORY == 'E' ) inTag += '<p class=main_hot_cate>체험</p>';
				else if( val.COMP_CATEGORY == 'Z' ) inTag += '<p class=main_hot_cate>기타</p>';
				
				inTag += '<span>'+val.COMP_NM+'</span>';
				inTag += '<p class="main_recruit_txt_detail">';
				inTag += '<span>by '+val.COMP_SPONSOR+'</span>';
				inTag += '<b>'+val.COMP_REWARD.toLocaleString()+' 원</b>';
				
				if( val.COMP_DDAY == 0 ) inTag += '<strong>오늘마감</strong>';
				else inTag += '<strong>D'+val.COMP_DDAY+'</strong>';
// 				else if( val.COMP_DDAY > -31 ) inTag += '<strong>D'+val.COMP_DDAY+'</strong>';
// 				else inTag += '<strong></strong>';
				
				inTag += '</p>';
				inTag += '</div>';
				inTag += '</a>';
				inTag += '</li>';
				
				if( key != 0 && key%4 == 3 ) {
					inTag += '</ul>';
					inTag += '</div>';
				}
			});
			
			inTag += '</ul>';
			inTag += '</div>';

			$('#contestSlider').append( inTag );
			
		}
	}
	
	function fn_ContestNstr() {

	//  1. 유효성 검사를 위한 파라미터값
		var params = new Object();
		params.status = 'SEARCH_TEAM';
		params.cnt = 4;
		
//		2. 유효성 검사 서비스로 이동
		var result = ${unit.ajax("main", "params")};
		
		$('#contestNstr li').remove();
		
		var jsonDetail = result.out.list.data;
		
		inTag = '';
		
		$.each( jsonDetail, function( key, val) {

			inTag += '<li>';
			inTag += '<a href="/front/contest/team" title="공모전 뉴스타터 상세보기">';
			inTag += '<p class="main_recruit_img"><img src="/resources/images/recruit_img01.png" alt="공모전 이미지"/></p>';
			inTag += '<div class="main_recruit_txt">';
			inTag += '<strong>'+val.T_NM+'</strong>';
			inTag += '<span>'+val.T_TITLE+'</span>';
			inTag += '<p class="main_recruit_txt_detail">';
			inTag += '<span>by '+val.T_NM+'</span>';
			inTag += '<b><i class="fas fa-map-marker-alt"></i>'+val.T_LOC+'</b>';
			
			if( val.T_DDAY == 0 ) inTag += '<strong>오늘마감</strong>';
			else inTag += '<strong>D'+val.T_DDAY+'</strong>';
			
			inTag += '</p>';
			inTag += '</div>';
			inTag += '<p class="main_recruit_cate">공모전</p>';
			inTag += '</a>';
			inTag += '</li>';
		});

		$('#contestNstr').append( inTag );
	}
	
	function fn_SocialList() {

		//  1. 유효성 검사를 위한 파라미터값
		var params = new Object();
		params.status = 'SEARCH_SOCIAL';
		params.cnt = 4;
		
		//	2. 유효성 검사 서비스로 이동
		var result = ${unit.ajax("main", "params")};

		if ( unit_isComplete(result) ){
			
// 			2-3. 뉴-스타터 모집
			$('#socialList li').remove();
			
			var jsonDetail = result.out.list.data;
			
			inTag = '';
			
			$.each( jsonDetail, function( key, val) {

				inTag += '<li>';
				inTag += '<a href="/front/contest/team" title="사회문제 뉴스타터 상세보기">';
				inTag += '<p class="main_recruit_img"><img src="/resources/images/recruit_img05.png" alt="사회문제 이미지"/></p>';
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
				inTag += '<p class="main_recruit_cate cate_social">사회문제</p>';
				inTag += '</a>';
				inTag += '</li>';
				
			});

			$('#socialList').append( inTag );
		}
	}
	
</script>
















