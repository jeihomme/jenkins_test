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
			<ul>
				<li>
					<a href="/front/contest/team" title="공모전 뉴스타터 상세보기">
						<p class="main_recruit_img"><img src="/resources/images/recruit_img01.png" alt="공모전 이미지"/></p>
						<div class="main_recruit_txt">
							<strong>서울권 공모전 팀원구함</strong>
							<span>제 4회 아름드리 웹드라마 UCC공모전</span>
							<p class="main_recruit_txt_detail">
								<span>by 공모킬러팀</span>
								<b><i class="fas fa-map-marker-alt"></i>홍대역 인근</b>
								<strong>D-5</strong>
							</p>
						</div>
						<p class="main_recruit_cate">공모전</p>
					</a>
				</li>
				<li>
					<a href="/front/contest/team" title="공모전 뉴스타터 상세보기">
						<p class="main_recruit_img"><img src="/resources/images/recruit_img02.png" alt="공모전 이미지"/></p>
						<div class="main_recruit_txt">
							<strong>서울권 공모전 팀원구함</strong>
							<span>제 4회 아름드리 웹드라마 UCC공모전</span>
							<p class="main_recruit_txt_detail">
								<span>by 공모킬러팀</span>
								<b><i class="fas fa-map-marker-alt"></i>홍대역 인근</b>
								<strong>D-5</strong>
							</p>
						</div>
						<p class="main_recruit_cate">공모전</p>
					</a>
				</li>
				<li>
					<a href="/front/contest/team" title="공모전 뉴스타터 상세보기">
						<p class="main_recruit_img"><img src="/resources/images/recruit_img03.png" alt="공모전 이미지"/></p>
						<div class="main_recruit_txt">
							<strong>서울권 공모전 팀원구함</strong>
							<span>제 4회 아름드리 웹드라마 UCC공모전</span>
							<p class="main_recruit_txt_detail">
								<span>by 공모킬러팀</span>
								<b><i class="fas fa-map-marker-alt"></i>홍대역 인근</b>
								<strong>D-5</strong>
							</p>
						</div>
						<p class="main_recruit_cate">공모전</p>
					</a>
				</li>
				<li>
					<a href="/front/contest/team" title="공모전 뉴스타터 상세보기">
						<p class="main_recruit_img"><img src="/resources/images/recruit_img04.png" alt="공모전 이미지"/></p>
						<div class="main_recruit_txt">
							<strong>서울권 공모전 팀원구함</strong>
							<span>제 4회 아름드리 웹드라마 UCC공모전</span>
							<p class="main_recruit_txt_detail">
								<span>by 공모킬러팀</span>
								<b><i class="fas fa-map-marker-alt"></i>홍대역 인근</b>
								<strong>D-5</strong>
							</p>
						</div>
						<p class="main_recruit_cate">공모전</p>
					</a>
				</li>
			</ul>
		</div>
		<div class="recruit_social main_recruit_listWrap">
			<h3><a href="/front/social/index" title="사회문제 뉴스타터 더보기"><span>사회문제 뉴스타터 더보기<i class="far fa-arrow-alt-circle-right"></i></span></a></h3>
			<ul>
				<li>
					<a href="/front/social/team" title="사회문제 뉴스타터 상세보기">
						<p class="main_recruit_img"><img src="/resources/images/recruit_img05.png" alt="사회문제 이미지"/></p>
						<div class="main_recruit_txt">
							<strong>서울권 공모전 팀원구함</strong>
							<span>제 4회 아름드리 웹드라마 UCC공모전</span>
							<p class="main_recruit_txt_detail">
								<span>by 공모킬러팀</span>
								<b><i class="fas fa-map-marker-alt"></i>홍대역 인근</b>
								<strong>D-5</strong>
							</p>
						</div>
						<p class="main_recruit_cate cate_social">사회문제</p>
					</a>
				</li>
				<li>
					<a href="/front/social/team" title="사회문제 뉴스타터 상세보기">
						<p class="main_recruit_img"><img src="/resources/images/recruit_img06.png" alt="사회문제 이미지"/></p>
						<div class="main_recruit_txt">
							<strong>서울권 공모전 팀원구함</strong>
							<span>제 4회 아름드리 웹드라마 UCC공모전</span>
							<p class="main_recruit_txt_detail">
								<span>by 공모킬러팀</span>
								<b><i class="fas fa-map-marker-alt"></i>홍대역 인근</b>
								<strong>D-5</strong>
							</p>
						</div>
						<p class="main_recruit_cate cate_social">사회문제</p>
					</a>
				</li>
				<li>
					<a href="/front/social/team" title="사회문제 뉴스타터 상세보기">
						<p class="main_recruit_img"><img src="/resources/images/recruit_img07.png" alt="사회문제 이미지"/></p>
						<div class="main_recruit_txt">
							<strong>서울권 공모전 팀원구함</strong>
							<span>제 4회 아름드리 웹드라마 UCC공모전</span>
							<p class="main_recruit_txt_detail">
								<span>by 공모킬러팀</span>
								<b><i class="fas fa-map-marker-alt"></i>홍대역 인근</b>
								<strong>D-5</strong>
							</p>
						</div>
						<p class="main_recruit_cate cate_social">사회문제</p>
					</a>
				</li>
				<li>
					<a href="/front/social/team" title="사회문제 뉴스타터 상세보기">
						<p class="main_recruit_img"><img src="/resources/images/recruit_img08.png" alt="사회문제 이미지"/></p>
						<div class="main_recruit_txt">
							<strong>서울권 공모전 팀원구함</strong>
							<span>제 4회 아름드리 웹드라마 UCC공모전</span>
							<p class="main_recruit_txt_detail">
								<span>by 공모킬러팀</span>
								<b><i class="fas fa-map-marker-alt"></i>홍대역 인근</b>
								<strong>D-5</strong>
							</p>
						</div>
						<p class="main_recruit_cate cate_social">사회문제</p>
					</a>
				</li>
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
	<h2 class="main_sectionTitle">HOT한 공모전</h2>
	<div class="hot_swiper swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<ul class="recruit_hot_listWrap">
					<li>
						<a href="/front/contest/contest" title="HOT한 공모전 상세보기">
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
						<a href="/front/contest/contest" title="HOT한 공모전 상세보기">
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
						<a href="/front/contest/contest" title="HOT한 공모전 상세보기">
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
						<a href="/front/contest/contest" title="HOT한 공모전 상세보기">
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
				</ul>
			</div>
			<div class="swiper-slide">
				<ul class="recruit_hot_listWrap">
					<li>
						<a href="/front/contest/contest" title="HOT한 공모전 상세보기">
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
						<a href="/front/contest/contest" title="HOT한 공모전 상세보기">
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
						<a href="/front/contest/contest" title="HOT한 공모전 상세보기">
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
						<a href="/front/contest/contest" title="HOT한 공모전 상세보기">
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
				</ul>
			</div>
			<div class="swiper-slide">
				<ul class="recruit_hot_listWrap">
					<li>
						<a href="/front/contest/contest" title="HOT한 공모전 상세보기">
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
						<a href="/front/contest/contest" title="HOT한 공모전 상세보기">
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
						<a href="/front/contest/contest" title="HOT한 공모전 상세보기">
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
						<a href="/front/contest/contest" title="HOT한 공모전 상세보기">
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
				</ul>
			</div>
		</div>
		<!-- Add Arrows -->
		<div class="hot_swiperNext swiper-button-next"></div>
		<div class="hot_swiperPrev swiper-button-prev"></div>
	</div>
</div>
<div class="recruit_recent">
	<div class="sectionWrap">
		<h2 class="main_sectionTitle">최근 본 프로젝트</h2>
		<ul class="recruit_hot_listWrap mgb15">
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
		</ul>
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
					<p class="main_recruit_img"><img src="/resources/images/recruit_default.png" alt="공모전 이미지"/></p>
					<div class="main_recruit_txt">
						<!--<p class="main_hot_cate"></p>-->
						<span></span>
						<p class="main_recruit_txt_detail">
							<span></span>
							<b></b>
							<strong></strong>
						</p>
					</div>
				</a>
			</li>
			<li>
				<a href="/front/contest/contest" title="최근 본 프로젝트 상세보기">
					<p class="main_recruit_img"><img src="/resources/images/recruit_default.png" alt="공모전 이미지"/></p>
					<div class="main_recruit_txt">
						<!--<p class="main_hot_cate"></p>-->
						<span></span>
						<p class="main_recruit_txt_detail">
							<span></span>
							<b></b>
							<strong></strong>
						</p>
					</div>
				</a>
			</li>
			<li>
				<a href="/front/contest/contest" title="최근 본 프로젝트 상세보기">
					<p class="main_recruit_img"><img src="/resources/images/recruit_default.png" alt="공모전 이미지"/></p>
					<div class="main_recruit_txt">
						<!--<p class="main_hot_cate"></p>-->
						<span></span>
						<p class="main_recruit_txt_detail">
							<span></span>
							<b></b>
							<strong></strong>
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
				<p>진행중인 공모전<strong>마감임박</strong></p>
				<p><span>270</span>개 더 보러가기<i class="far fa-arrow-alt-circle-right"></i></p>
			</a>
		</h2>
		<ul class="recruit_on_listWrap">
			<li>
				<a href="/front/contest/contest" title="진행중인 공모전 상세보기">
					<p class="main_recruit_img"><img src="/resources/images/recruit_img01.png" alt="공모전 이미지"/></p>
					<div class="main_recruit_txt">
						<span>제 6회 산업통상부 마케팅 아이디어 공모전</span>
						<p class="main_recruit_txt_detail">
							<em>기획/마케팅</em>
							<i>by 공모킬러팀</i>
							<b>500만원</b>
							<strong>D-5</strong>
						</p>
					</div>
					<!--<p class="main_recruit_cate">공모전</p>-->
				</a>
			</li>
			<li>
				<a href="/front/contest/contest" title="진행중인 공모전 상세보기">
					<p class="main_recruit_img"><img src="/resources/images/recruit_img01.png" alt="공모전 이미지"/></p>
					<div class="main_recruit_txt">
						<span>제 6회 산업통상부 마케팅 아이디어 공모전</span>
						<p class="main_recruit_txt_detail">
							<em>기획/마케팅</em>
							<i>by 공모킬러팀</i>
							<b>500만원</b>
							<strong>D-5</strong>
						</p>
					</div>
					<!--<p class="main_recruit_cate">공모전</p>-->
				</a>
			</li>
			<li>
				<a href="/front/contest/contest" title="진행중인 공모전 상세보기">
					<p class="main_recruit_img"><img src="/resources/images/recruit_img01.png" alt="공모전 이미지"/></p>
					<div class="main_recruit_txt">
						<span>제 6회 산업통상부 마케팅 아이디어 공모전</span>
						<p class="main_recruit_txt_detail">
							<em>기획/마케팅</em>
							<i>by 공모킬러팀</i>
							<b>500만원</b>
							<strong>D-5</strong>
						</p>
					</div>
					<!--<p class="main_recruit_cate">공모전</p>-->
				</a>
			</li>
			<li>
				<a href="/front/contest/contest" title="진행중인 공모전 상세보기">
					<p class="main_recruit_img"><img src="/resources/images/recruit_img01.png" alt="공모전 이미지"/></p>
					<div class="main_recruit_txt">
						<span>제 6회 산업통상부 마케팅 아이디어 공모전</span>
						<p class="main_recruit_txt_detail">
							<em>기획/마케팅</em>
							<i>by 공모킬러팀</i>
							<b>500만원</b>
							<strong>D-5</strong>
						</p>
					</div>
					<!--<p class="main_recruit_cate">공모전</p>-->
				</a>
			</li>
			<li>
				<a href="/front/contest/contest" title="진행중인 공모전 상세보기">
					<p class="main_recruit_img"><img src="/resources/images/recruit_img01.png" alt="공모전 이미지"/></p>
					<div class="main_recruit_txt">
						<span>제 6회 산업통상부 마케팅 아이디어 공모전</span>
						<p class="main_recruit_txt_detail">
							<em>기획/마케팅</em>
							<i>by 공모킬러팀</i>
							<b>500만원</b>
							<strong>D-5</strong>
						</p>
					</div>
					<!--<p class="main_recruit_cate">공모전</p>-->
				</a>
			</li>
		</ul>
		<ul class="recruit_on_listWrap">
			<li>
				<a href="/front/contest/contest" title="진행중인 공모전 상세보기">
					<p class="main_recruit_img"><img src="/resources/images/recruit_img01.png" alt="공모전 이미지"/></p>
					<div class="main_recruit_txt">
						<span>제 6회 산업통상부 마케팅 아이디어 공모전</span>
						<p class="main_recruit_txt_detail">
							<em>기획/마케팅</em>
							<i>by 공모킬러팀</i>
							<b>500만원</b>
							<strong>D-5</strong>
						</p>
					</div>
					<!--<p class="main_recruit_cate cate_social">사회문제</p>-->
				</a>
			</li>
			<li>
				<a href="/front/contest/contest" title="진행중인 공모전 상세보기">
					<p class="main_recruit_img"><img src="/resources/images/recruit_img01.png" alt="공모전 이미지"/></p>
					<div class="main_recruit_txt">
						<span>제 6회 산업통상부 마케팅 아이디어 공모전</span>
						<p class="main_recruit_txt_detail">
							<em>기획/마케팅</em>
							<i>by 공모킬러팀</i>
							<b>500만원</b>
							<strong>D-5</strong>
						</p>
					</div>
					<!--<p class="main_recruit_cate cate_social">사회문제</p>-->
				</a>
			</li>
			<li>
				<a href="/front/contest/contest" title="진행중인 공모전 상세보기">
					<p class="main_recruit_img"><img src="/resources/images/recruit_img01.png" alt="공모전 이미지"/></p>
					<div class="main_recruit_txt">
						<span>제 6회 산업통상부 마케팅 아이디어 공모전</span>
						<p class="main_recruit_txt_detail">
							<em>기획/마케팅</em>
							<i>by 공모킬러팀</i>
							<b>500만원</b>
							<strong>D-5</strong>
						</p>
					</div>
					<!--<p class="main_recruit_cate cate_social">사회문제</p>-->
				</a>
			</li>
			<li>
				<a href="/front/contest/contest" title="진행중인 공모전 상세보기">
					<p class="main_recruit_img"><img src="/resources/images/recruit_img01.png" alt="공모전 이미지"/></p>
					<div class="main_recruit_txt">
						<span>제 6회 산업통상부 마케팅 아이디어 공모전</span>
						<p class="main_recruit_txt_detail">
							<em>기획/마케팅</em>
							<i>by 공모킬러팀</i>
							<b>500만원</b>
							<strong>D-5</strong>
						</p>
					</div>
					<!--<p class="main_recruit_cate cate_social">사회문제</p>-->
				</a>
			</li>
			<li>
				<a href="/front/contest/contest" title="진행중인 공모전 상세보기">
					<p class="main_recruit_img"><img src="/resources/images/recruit_img01.png" alt="공모전 이미지"/></p>
					<div class="main_recruit_txt">
						<span>제 6회 산업통상부 마케팅 아이디어 공모전</span>
						<p class="main_recruit_txt_detail">
							<em>기획/마케팅</em>
							<i>by 공모킬러팀</i>
							<b>500만원</b>
							<strong>D-5</strong>
						</p>
					</div>
					<!--<p class="main_recruit_cate cate_social">사회문제</p>-->
				</a>
			</li>
		</ul>
	</div>
</div>
<script>
	$(document).ready(function(){
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
			loop : true,
			navigation : {
				nextEl : '.hot_swiperNext',
				prevEl : '.hot_swiperPrev',
			},
		});
	});
</script>