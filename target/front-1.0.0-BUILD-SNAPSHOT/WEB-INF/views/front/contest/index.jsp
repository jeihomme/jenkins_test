<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<h2 class="hideHeading">컨텐츠</h2>
<div class="main_swiper swiper-container contest_main_visual">
	<div class="swiper-wrapper">
		<div class="swiper-slide">
			<div class="main_slide">
				<p>
					뉴스타터와 함께하는<br/>
					공모전 도전!
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
					공모전 도전!
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
					공모전 도전!
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
					공모전 도전!
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
		<div class="main_recruit_listWrap recruit_gong_sub">
			<div class="recruit_categoryMenu">
				<ol class="team_category team_socialOnCategory">
					<li class="team_socialOnCategory_active">
						<a href="#none" title="전체" onclick="fn_ContestNstrList(null, 1);">
							<i>
								<img src="/resources/images/category_contest_00.png" alt="전체"/>
								<img class="team_socialOnCategory_active_img" src="/resources/images/category_contest_00_over.png" alt="전체"/>
							</i>
							<p>전체</p>
						</a>
					</li>
					<li>
						<a href="#none" title="기획/마케팅" onclick="fn_ContestNstrList('M', 1);">
							<i>
								<img src="/resources/images/category_contest_01.png" alt="기획/마케팅"/>
								<img class="team_socialOnCategory_active_img" src="/resources/images/category_contest_01_over.png" alt="기획/마케팅"/>
							</i>
							<p>기획/마케팅</p>
						</a>
					</li>
					<li>
						<a href="#none" title="사진/영상" onclick="fn_ContestNstrList('F', 1);">
							<i>
								<img src="/resources/images/category_contest_02.png" alt="사진/영상"/>
								<img class="team_socialOnCategory_active_img" src="/resources/images/category_contest_02_over.png" alt="사진/영상"/>
							</i>
							<p>사진/영상</p>
						</a>
					</li>
					<li>
						<a href="#none" title="공학/컴퓨터" onclick="fn_ContestNstrList('P', 1);">
							<i>
								<img src="/resources/images/category_contest_03.png" alt="공학/컴퓨터"/>
								<img class="team_socialOnCategory_active_img" src="/resources/images/category_contest_03_over.png" alt="공학/컴퓨터"/>
							</i>
							<p>공학/컴퓨터</p>
						</a>
					</li>
					<li>
						<a href="#none" title="논문" onclick="fn_ContestNstrList('T', 1);">
							<i>
								<img src="/resources/images/category_contest_04.png" alt="논문"/>
								<img class="team_socialOnCategory_active_img" src="/resources/images/category_contest_04_over.png" alt="논문"/>
							</i>
							<p>논문</p>
						</a>
					</li>
					<li>
						<a href="#none" title="디자인" onclick="fn_ContestNstrList('D', 1);">
							<i>
								<img src="/resources/images/category_contest_05.png" alt="디자인"/>
								<img class="team_socialOnCategory_active_img" src="/resources/images/category_contest_05_over.png" alt="디자인"/>
							</i>
							<p>디자인</p>
						</a>
					</li>
					<li>
						<a href="#none" title="수기" onclick="fn_ContestNstrList('H', 1);">
							<i>
								<img src="/resources/images/category_contest_06.png" alt="수기"/>
								<img class="team_socialOnCategory_active_img" src="/resources/images/category_contest_06_over.png" alt="수기"/>
							</i>
							<p>수기</p>
						</a>
					</li>
					<li>
						<a href="#none" title="건축" onclick="fn_ContestNstrList('C', 1);">
							<i>
								<img src="/resources/images/category_contest_07.png" alt="건축"/>
								<img class="team_socialOnCategory_active_img" src="/resources/images/category_contest_07_over.png" alt="건축"/>
							</i>
							<p>건축</p>
						</a>
					</li>
					<li>
						<a href="#none" title="예체능" onclick="fn_ContestNstrList('A', 1);">
							<i>
								<img src="/resources/images/category_contest_08.png" alt="예체능"/>
								<img class="team_socialOnCategory_active_img" src="/resources/images/category_contest_08_over.png" alt="예체능"/>
							</i>
							<p>예체능</p>
						</a>
					</li>
					<li>
						<a href="#none" title="체험" onclick="fn_ContestNstrList('E', 1);">
							<i>
								<img src="/resources/images/category_contest_09.png" alt="체험"/>
								<img class="team_socialOnCategory_active_img" src="/resources/images/category_contest_09_over.png" alt="체험"/>
							</i>
							<p>체험</p>
						</a>
					</li>
					<li>
						<a href="#none" title="기타" onclick="fn_ContestNstrList('Z', 1);">
							<i>
								<img src="/resources/images/category_contest_10.png" alt="기타"/>
								<img class="team_socialOnCategory_active_img" src="/resources/images/category_contest_10_over.png" alt="기타"/>
							</i>
							<p>기타</p>
						</a>
					</li>
				</ol>
			</div>
			<div class="main_recruit_area">
				<div class="main_recruit_areaListWrap">
					<p class="main_recruit_areaList_btn">지역 <i class="fas fa-angle-down"></i></p>
					<button class="main_recruit_areaToTeam btn_fff btn_team_common" >팀만들기 <i class="fal fa-plus"></i></button>
					<ul class="main_recruit_areaList">
						<li><a href="#none" title="전국" onclick="local='전국';">전국</a></li>
						<li><a href="#none" title="서울" onclick="local='서울';">서울</a></li>
						<li><a href="#none" title="부산" onclick="local='부산';">부산</a></li>
						<li><a href="#none" title="대구" onclick="local='대구';">대구</a></li>
						<li><a href="#none" title="광주" onclick="local='광주';">광주</a></li>
						<li><a href="#none" title="대전" onclick="local='대전';">대전</a></li>
						<li><a href="#none" title="울산" onclick="local='울산';">울산</a></li>
						<li><a href="#none" title="세종" onclick="local='세종';">세종</a></li>
						<li><a href="#none" title="경기" onclick="local='경기';">경기</a></li>
						<li><a href="#none" title="강원" onclick="local='강원';">강원</a></li>
						<li><a href="#none" title="충남" onclick="local='충남';">충남</a></li>
						<li><a href="#none" title="충북" onclick="local='충북';">충북</a></li>
						<li><a href="#none" title="경남" onclick="local='경남';">경남</a></li>
						<li><a href="#none" title="경북" onclick="local='경북';">경북</a></li>
						<li><a href="#none" title="전남" onclick="local='전남';">전남</a></li>
						<li><a href="#none" title="전북" onclick="local='전북';">전북</a></li>
						<li><a href="#none" title="제주" onclick="local='제주';">제주</a></li>
					</ul>
				</div>
			</div>
			<ul id="contestNstr">
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
				<button class="btn_transp">사회문제 도전하기</button>
			</div>
		</div>
		<div class="swiper-slide">
			<div class="sub_slide">
				<p>사회문제를 함께 할 여러분을 찾습니다!</p>
				<span>여러분을 기다리고 있어요. 지금 바로 만나보세요!!</span>
				<button class="btn_transp">사회문제 도전하기</button>
			</div>
		</div>
		<div class="swiper-slide">
			<div class="sub_slide">
				<p>사회문제를 함께 할 여러분을 찾습니다!</p>
				<span>여러분을 기다리고 있어요. 지금 바로 만나보세요!!</span>
				<button class="btn_transp">사회문제 도전하기</button>
			</div>
		</div>
	</div>
	<!-- Add Arrows -->
	<div class="sub_swiperNext swiper-button-next"></div>
	<div class="sub_swiperPrev swiper-button-prev"></div>
</div>
<div class="recruit_gong_onList">
	<div class="sectionWrap">
		<h2 class="main_sectionTitle">진행중인 공모전</h2>
		<ul class="recruit_gong_onList_sort">
			<li class="sort_active"><a href="#none" title="마감 임박 순" onclick="fn_ContestList(category, 1);">마감 임박 순</a><span>|</span></li>
			<li><a href="#none" title="등록 순" onclick="fn_ContestList(category, 2);">등록 순</a><span>|</span></li>
			<li><a href="#none" title="최신 순" onclick="fn_ContestList(category, 3);">최신 순</a><span>|</span></li>
			<li><a href="#none" title="높은 상금 순" onclick="fn_ContestList(category, 4);">높은 상금 순</a><span>|</span></li>
<!-- 			<li><a href="#none" title="인기 순" onclick="fn_ContestList('', 5);">인기 순</a></li> -->
		</ul>
		<div class="recruit_categoryMenu">
		<ol class="team_category team_socialOnCategory">
			<li class="team_socialOnCategory_active">
				<a href="#none" title="전체" onclick="fn_ContestList(null, order);">
					<i>
						<img src="/resources/images/category_contest_00.png" alt="전체"/>
						<img class="team_socialOnCategory_active_img" src="/resources/images/category_contest_00_over.png" alt="전체"/>
					</i>
					<p>전체</p>
				</a>
			</li>
			<li>
				<a href="#none" title="기획/마케팅" onclick="fn_ContestList('M', order);">
					<i>
						<img src="/resources/images/category_contest_01.png" alt="기획/마케팅"/>
						<img class="team_socialOnCategory_active_img" src="/resources/images/category_contest_01_over.png" alt="기획/마케팅"/>
					</i>
					<p>기획/마케팅</p>
				</a>
			</li>
			<li>
				<a href="#none" title="사진/영상" onclick="fn_ContestList('F', order);">
					<i>
						<img src="/resources/images/category_contest_02.png" alt="사진/영상"/>
						<img class="team_socialOnCategory_active_img" src="/resources/images/category_contest_02_over.png" alt="사진/영상"/>
					</i>
					<p>사진/영상</p>
				</a>
			</li>
			<li>
				<a href="#none" title="공학/컴퓨터" onclick="fn_ContestList('P', order);">
					<i>
						<img src="/resources/images/category_contest_03.png" alt="공학/컴퓨터"/>
						<img class="team_socialOnCategory_active_img" src="/resources/images/category_contest_03_over.png" alt="공학/컴퓨터"/>
					</i>
					<p>공학/컴퓨터</p>
				</a>
			</li>
			<li>
				<a href="#none" title="논문" onclick="fn_ContestList('T', order);">
					<i>
						<img src="/resources/images/category_contest_04.png" alt="논문"/>
						<img class="team_socialOnCategory_active_img" src="/resources/images/category_contest_04_over.png" alt="논문"/>
					</i>
					<p>논문</p>
				</a>
			</li>
			<li>
				<a href="#none" title="디자인" onclick="fn_ContestList('D', order);">
					<i>
						<img src="/resources/images/category_contest_05.png" alt="디자인"/>
						<img class="team_socialOnCategory_active_img" src="/resources/images/category_contest_05_over.png" alt="디자인"/>
					</i>
					<p>디자인</p>
				</a>
			</li>
			<li>
				<a href="#none" title="수기" onclick="fn_ContestList('H', order);">
					<i>
						<img src="/resources/images/category_contest_06.png" alt="수기"/>
						<img class="team_socialOnCategory_active_img" src="/resources/images/category_contest_06_over.png" alt="수기"/>
					</i>
					<p>수기</p>
				</a>
			</li>
			<li>
				<a href="#none" title="건축" onclick="fn_ContestList('C', order);">
					<i>
						<img src="/resources/images/category_contest_07.png" alt="건축"/>
						<img class="team_socialOnCategory_active_img" src="/resources/images/category_contest_07_over.png" alt="건축"/>
					</i>
					<p>건축</p>
				</a>
			</li>
			<li>
				<a href="#none" title="예체능" onclick="fn_ContestList('A', order);">
					<i>
						<img src="/resources/images/category_contest_08.png" alt="예체능"/>
						<img class="team_socialOnCategory_active_img" src="/resources/images/category_contest_08_over.png" alt="예체능"/>
					</i>
					<p>예체능</p>
				</a>
			</li>
			<li>
				<a href="#none" title="체험" onclick="fn_ContestList('E', order);">
					<i>
						<img src="/resources/images/category_contest_09.png" alt="체험"/>
						<img class="team_socialOnCategory_active_img" src="/resources/images/category_contest_09_over.png" alt="체험"/>
					</i>
					<p>체험</p>
				</a>
			</li>
			<li>
				<a href="#none" title="기타" onclick="fn_ContestList('Z', order);">
					<i>
						<img src="/resources/images/category_contest_10.png" alt="기타"/>
						<img class="team_socialOnCategory_active_img" src="/resources/images/category_contest_10_over.png" alt="기타"/>
					</i>
					<p>기타</p>
				</a>
			</li>
		</ol>
	</div>
		<table id="recruit_gong_onList">
			<tbody id="contestList">
			</tbody>
		</table>
		<ul class="recruit_paging">
			<li class="chev"><a href="#none" title="left"><i class="far fa-chevron-left"></i></a></li>
			<li class="paging_active"><a href="#none" title="1">1</a></li>
			<li><a href="#none" title="2">2</a></li>
			<li><a href="#none" title="3">3</a></li>
			<li><a href="#none" title="4">4</a></li>
			<li><a href="#none" title="5">5</a></li>
			<li class="chev"><a href="#none" title="right"><i class="far fa-chevron-right"></i></a></li>
		</ul>
	</div>
</div>
<div class="m_footerDummy"></div>
<script type="text/javascript">

//////////////////////////////////////////////////////////
//1. 변수 초기화
//////////////////////////////////////////////////////////
var category = '';
var order = 0;
var cnt = 8;
var local = '';

//////////////////////////////////////////////////////////
//2. onload 함수
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
		
		$(".recruit_gong_onList_sort li").click(function(){
			$(".recruit_gong_onList_sort li").removeClass("sort_active");
			$(this).addClass("sort_active");
		});
		
		// 지역 마우스오버
		$(".main_recruit_areaList_btn").mouseenter(function(){
			$(".main_recruit_areaList").stop().slideDown(500);
		});

		$(".main_recruit_area").mouseleave(function(){
			$(".main_recruit_areaList").stop().slideUp(500);
		});
		
		fn_ContestList('', 0);
		fn_ContestNstrList('', 1);
	});
	
	$('.main_recruit_areaList li a').click(function(){
		fn_ContestNstrList(category, order);
	});
	

//////////////////////////////////////////////////////////
//3. 서비스 함수
//////////////////////////////////////////////////////////
	function fn_ContestList( cate, ord ) {

		//  1. 유효성 검사를 위한 파라미터값
		var params = new Object();
		params.status = 'SEARCH_COMP';
		params.compPermission = 'Y';
		
// 		if( cate == '' ) params.compCategory = category;
// 		else
		params.compCategory = cate;
		category = cate;
		
		if( ord == 0 ) params.order = 1;
		else params.order = ord;
		order = ord;
		
		//	2. 유효성 검사 서비스로 이동
		var result = ${unit.ajax("index", "params")};

		if ( unit_isComplete(result) ){
			
// 			2-1. 진행중인공모전 데이터 삽입
			$('#contestList tr').remove();
			
			var jsonDetail = result.out.list.data;
			
			var inTag = '';
			
			inTag += '<tr>';
			inTag += '<th class="tdwidth50">공모전 제목</th>';
			inTag += '<th class="collapseCol">지원한 뉴-스타터</th>';
			inTag += '<th>1등 상금</th>';
			inTag += '<th class="collapseCol">주최사</th>';
			inTag += '</tr>';
			
			$.each( jsonDetail, function( key, val) {
				
				inTag += '<tr>';
				inTag += '<td class="tdwidth50">';
				inTag += '<a href="/front/contest/contest?idx='+val.COMP_IDX + '" title="공모전 제목">';
				
				if( val.COMP_CATEGORY == 'M' ) inTag += "<b>[기획/마케팅]</b>";
				else if( val.COMP_CATEGORY == 'F' ) inTag += "<b>[사진/영상]</b>";
				else if( val.COMP_CATEGORY == 'P' ) inTag += "<b>[공학/컴퓨터]</b>";
				else if( val.COMP_CATEGORY == 'T' ) inTag += "<b>[논문]</b>";
				else if( val.COMP_CATEGORY == 'D' ) inTag += "<b>[디자인]</b>";
				else if( val.COMP_CATEGORY == 'H' ) inTag += "<b>[수기]</b>";
				else if( val.COMP_CATEGORY == 'C' ) inTag += "<b>[건축]</b>";
				else if( val.COMP_CATEGORY == 'A' ) inTag += "<b>[예체능]</b>";
				else if( val.COMP_CATEGORY == 'E' ) inTag += "<b>[체험]</b>";
				else if( val.COMP_CATEGORY == 'Z' ) inTag += "<b>[기타]</b>";
				
				if( val.COMP_DDAY == 0 ) inTag += '<span>'+val.COMP_NM+'</span><strong>오늘마감</strong>';
				else if( val.COMP_DDAY > -31 ) inTag += '<span>'+val.COMP_NM+'</span><strong>D'+val.COMP_DDAY+'</strong>';
				else inTag += '<span>'+val.COMP_NM+'</span>';
				
				inTag += '</a>';
				inTag += '</td>';
				inTag += '<td class="collapseCol">';
				inTag += '<i class="fal fa-users"></i>';
				inTag += '<span>2</span>';//지원한 뉴스타터 수
				inTag += '</td>';
				inTag += '<td>'+val.COMP_REWARD.toLocaleString()+' 원</td>';
				inTag += '<td class="collapseCol">';
				inTag += '<span>'+val.COMP_SPONSOR+'</span>';
				inTag += '</td>';
				inTag += '</tr>';
				
			});

			$('#contestList').append( inTag );
		}
	}
	
	function fn_ContestNstrList( cate, ord ) {

		//  1. 유효성 검사를 위한 파라미터값
		var params = new Object();
		params.status = 'SEARCH_TEAM';
		params.cnt = cnt;
		if( local != '전국') params.tLoc = local;
		
		if( cate == '' || cate != null ) params.compCategory = cate;
		else {
			params.compCategory = cate;
			category = cate;
		}
		
		if( ord == 0 || ord != null ) params.order = 1;
		else {
			params.order = ord;
			order = ord;
		}
		
		//	2. 유효성 검사 서비스로 이동
		var result = ${unit.ajax("index", "params")};

		if ( unit_isComplete(result) ){
// 			2-2. 뉴-스타터 모집
			$('#contestNstr li').remove();
			
			var jsonDetail = result.out.list.data;
			
			var inTag = '';
			
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
				
				if( val.T_DDAY == 0 ) inTag += '<p class="main_recruit_cate">오늘마감</p>';
				else if( val.T_DDAY > -31 ) inTag += '<p class="main_recruit_cate">D'+val.T_DDAY+'</p>';
				else inTag += '';
				
				inTag += '</a>';
				inTag += '</li>';
			});

			$('#contestNstr').append( inTag );
		}
	}
</script>















