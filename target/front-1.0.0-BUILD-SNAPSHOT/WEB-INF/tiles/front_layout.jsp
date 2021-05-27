<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8"/>
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css"/>
	<link rel="stylesheet" type="text/css" href="/resources/css/layout.css"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0"/>
	<link rel="shortcut icon" type="image/x-icon" href="/resources/images/eventso_favicon.ico" />
	<title>NEW STARTER</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/css/swiper.min.css">
	<link rel="stylesheet" href="/resources/css/chart.min.css">
	<script src="https://kit.fontawesome.com/35f90b3902.js"></script>
	<script src="/resources/js/swiper.min.js"></script>
	<script src="/resources/js/chart.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.7.3/dist/Chart.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.5.0"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/unit.iwonsoft.com/base.js"></script>
</head>
<body>
	<div id="wrap">
		<header id="header">
			<div class="topMenu">
				<h1><a href="/front/main/main"><img src="/resources/images/logo.png" alt="NEWSTARTER"/></a></h1>
				<p>
					<input type="text" title="검색" name="검색" placeholder="프로젝트, 공모전을 검색 해 보세요."/>
					<button class="btn_srch" onclick="fn_srch();"><img src="/resources/images/icon_srch.png" alt="검색"/></button>
				</p>
				<c:choose>
				<c:when test="${not empty sessionScope.loginEmail}">
				<div>
					<ul>
						<!-- <li><a href="/front/membership/logout" title="로그아웃">로그아웃</a></li> -->
						<!-- <li class="member_icon_function">
							<span class="member_icon"><a href="#none" title="멤버"><img src="/resources/images/member_icon.png" alt="멤버아이콘"/></a></span>
							<i><img src="/resources/images/member_noti.png" alt="알림"/></i>
							<span class="member_list"><img src="/resources/images/member_menu.png" alt="멤버용 리스트"/></span>
						</li> -->
						<li class="topMenu_loggedProfile">
							<a href="/front/mypage/profile">
								<img src="/resources/images/profile_picture.png" alt="프로필 사진"/><i></i>
							</a>
							<ul class="topMenu_loggedMenu">
								<li><a href="/front/mypage/index" title="최신 알림">최신 알림</a></li>
								<li><a href="/front/mypage/profile" title="프로필 수정">프로필 수정</a></li>
								<li><a href="/front/mypage/bookmark" title="관심 프로젝트">관심 프로젝트</a></li>
								<li><a href="/front/mypage/myteam_list" title="나의 팀 관리">나의 팀 관리</a></li>
							<c:choose>
									<c:when test="${sessionScope.loginStat eq 'K'}">
								<li><a href="/front/membership/kakaomodify" title="정보 수정">정보수정</a></li>
									</c:when>
								<c:otherwise>
			 					<li><a class="fn_profileEditAccess" href="#none" title="정보 수정">정보수정</a></li>
								</c:otherwise>
							</c:choose>
								<li><a href="/front/membership/logout" title="로그아웃">로그아웃</a></li>
							</ul>
						</li>
						<li><button onclick="fn_toGuide();">공모전 무료등록</button></li>
					</ul>
				</div>
				</c:when>
				<c:otherwise>
					<div>
					<ul>
						<li><a href="/front/membership/login" title="로그인">로그인</a><span>|</span></li>
						<li><a href="/front/membership/join" title="회원가입">회원가입</a></li>
						<li><button onclick="fn_toGuide();">공모전 무료등록</button></li>
					</ul>
				</div>
				</c:otherwise>
			</c:choose>
			</div>
			<div class="m_topMenu">
				<p class="m_topMenu_menu fn_openMenu"><a href="#none"><i class="far fa-bars"></i></a></p>
				<h1><a href="/front/main/main"><img src="/resources/images/logo_m.png" alt="LOGO"/></a></h1>
				<p class="m_topMenu_search fn_openSearch"><a href="#none"><i class="far fa-search"></i></a></p>
				<p class="m_topMenu_profile"><a href="/front/mypage/index"><i class="far fa-user-circle"></i></a></p>
			</div>
			<nav id="gnb">
				<ul>
					<li><a href="/front/contest/index" title="공모전 도전">공모전 도전</a></li>
					<li><a href="/front/social/index" title="사회문제 도전">사회문제 도전</a></li>
					<li><a href="https://www.instagram.com/loai_eventso" target="_blank" title="SNS">SNS</a></li>
					<li><a href="https://smartstore.naver.com/eventso" target="_blank" title="가치샵">가치샵</a></li>
					<c:choose>
				<c:when test="${not empty sessionScope.loginEmail}">
					<li><a href="/front/mypage/index" title="My Page">My Page</a></li>
					</c:when>
				<c:otherwise>
				<li><a href="/front/membership/login" title="My Page" onclick="if(!confirm('로그인 필요한 페이지 입니다.')) return false;">My Page</a></li>
				</c:otherwise>
				</c:choose>
				</ul>
			</nav>
		</header>
		<section id="section">
		
			<!-- START : Contents -->
			<tiles:insertAttribute name="body" />
			<!-- END : Contents -->
			
		</section>
		<footer id="footer">
			<div class="footerWrap">
				<ul class="footerMenu">
					<li><a href="/front/etc/privacy" title="개인정보취급방침">개인정보취급방침</a><span>|</span></li>
					<li><a href="/front/etc/policy" title="이용약관">이용약관</a><span>|</span></li>
					<li><a href="/front/info/guide" title="광고문의">광고문의</a></li>
				</ul>
				<ul class="footerLogo">
					<li><a href="#none" title="한국사회적기업진흥원"><img src="/resources/images/footer_logo0.png" alt="한국사회적기업진흥원"/></a></li>
					<li><a href="#none" title="LoAi"><img src="/resources/images/footer_logo1.png" alt="LoAi"/></a></li>
				</ul>
				<address>
					경기도 용인시 기흥구 동백5로 22,215호 A-03<br/>
					COPYRIGHT &copy; 뉴스타터.kr ALL RIGHTS RESERVED.
				</address>
			</div>
		</footer>
		<div class="m_footer">
			<ul>
				<li><a href="/front/contest/index" title="공모전 도전"><img src="/resources/images/icon_profile01_m.png" alt="공모전 도전"/></a></li>
				<li><a href="/front/social/index" title="사회문제"><i class="fal fa-hands-heart"></i></a></li>
				<li><a href="https://www.instagram.com/loai_eventso" target="_blank" title="SNS"><i class="fal fa-share-alt"></i></a></li>
				<li><a href="https://smartstore.naver.com/eventso" target="_blank" title="가치샵"><i class="fal fa-box-alt"></i></a></li>
				<li><a href="/front/mypage/profile" title="기타"><i class="fal fa-ellipsis-h"></i></a></li>
			</ul>
		</div>
	</div>
	<div id="screenCover"></div>
	<div id="menuSearch">
		<p>
			<input type="text" name="menuSearch" title="검색" placeholder="검색어를 입력하세요"/>
			<button class="btn_srch" onclick="fn_srch();"><img src="/resources/images/icon_srch.png" alt="검색"/></button>
		</p>
	</div>
	<div id="menuMobile">
		<div class="menuMobileWrap">
			<ul class="menuMobile_listM">
				<li><a href="/front/contest/index" title="공모전 도전"><img src="/resources/images/icon_mobile_01.png" alt="공모전 도전"/>공모전 도전</a></li>
				<li><a href="/front/social/index" title="사회문제 도전"><i class="far fa-hands-heart"></i>사회문제 도전</a></li>
				<li>
					<a href="/front/mypage/index" title="My Page"><img src="/resources/images/icon_mobile_03.png" alt="My Page"/>My Page</a>
					<ul class="menuMobile_listS">
						<li><a href="/front/mypage/team_contest" title="팀 만들기"><img src="/resources/images/icon_mobile_03_1.png" alt="팀 만들기"/>팀 만들기</a></li>
						<li><a href="/front/mypage/myteam_list" title="팀 관리"><i class="far fa-users-cog"></i>팀 관리</a></li>
						<li><a href="/front/mypage/bookmark" title="찜한 공모전"><img src="/resources/images/icon_mobile_03_3.png" alt="찜한 공모전"/>찜한 공모전</a></li>
						<li><a href="/front/mypage/notice" title="공지사항"><img src="/resources/images/icon_mobile_03_4.png" alt="공지사항"/>공지사항</a></li>
			 			<li><a class="fn_profileEditAccess" href="#none" title="정보 수정"><img src="/resources/images/icon_mobile_03_5.png" alt="정보 수정"/>정보 수정</a></li>
						<li><a href="#none" title="로그아웃"><img src="/resources/images/icon_mobile_03_6.png" alt="로그아웃"/>로그아웃</a></li>
					</ul>
				</li>
				<li><a href="/front/info/guide" title="공모전 등록/홍보"><img src="/resources/images/icon_mobile_04.png" alt="공모전 등록/홍보"/>공모전 등록/홍보</a></li>
			</ul>
		</div>
	</div>
	<div id="modal_guide_banner">
		<p class="modal_guide_banner_close"><a href="#none" title="닫기"><img src="/resources/images/info_guide_close.png" alt="닫기"/></a></p>
		<div class="modal_guide_bannerImg"><img src="/resources/images/info_guide_bannera.png" alt="배너 위치"/></div>
	</div>
	<div id="modal_teamAdd" class="modal_team_view">
		<p class="modal_guide_banner_close"><a href="#none" title="닫기"><img src="/resources/images/info_guide_close.png" alt="닫기"/></a></p>
		<div class="modal_team_viewWrap">
			<h3>팀원 추가하기</h3>
			<div class="modal_team_viewContents">
				<p class="teamAdd_search">
					<input type="text" name="teamAddTitle" title="아이디, 닉네임 검색" placeholder="닉네임을 검색해주세요."/>
					<button class="btn_srch" onclick="fn_BtnUserSearch();"><img src="/resources/images/icon_srch.png" alt="검색"/></button>
				</p>
				<p class="teamAdd_title">검색결과</p>
				<ul id="searchUser" class="teamAdd_list">
				</ul>
			</div>
			<p class="modal_submit_button">
				<a class="fn_modalSubmitCancel" href="#none" title="취소">취소</a>
				<a class="fn_modalLeaveQnaSubmit" href="#none" onclick="fn_BtnSelect();" title="선택">선택</a>
			</p>
		</div>
	</div>
	<div id="modal_showPolicy" class="modal_team_view">
		<p class="modal_guide_banner_close"><a href="#none" title="닫기"><img src="/resources/images/info_guide_close.png" alt="닫기"/></a></p>
		<div class="modal_team_viewWrap">
			<h3>이용약관</h3>
			<div class="modal_team_viewContents">
				<div class="modal_polpriv_wrap">
					제1장 총칙<br/><br/><br/>

					제1조 (목적)<br/><br/>

					이 약관은 (주)로아이와 공모전포털 사이트 &lt;뉴스타터&gt;(이하 회사)이 서비스 가입자(이하 회원)에게 제공하는 모든 서비스(이하 서비스)의 이용조건과 절차에 관한 사항과 그 밖의 이용에 필요한 제반사항을 규정함을 목적으로 합니다. <br/><br/>


					제2조 (약관의 효력과 변경)<br/><br/>


					1. 약관은 이용자가 등록절차를 거쳐서 &lt;가입 약관에 동의합니다&gt;라는 물음에 회원이 &lt;동의&gt; 버튼을 클릭하는 것으로 효력이 발생됩니다.<br/>
					2. 회사는 합리적 이유가 있는 경우 약관을 변경할 수 있으며, 변경된 약관은 서비스 화면에 게재하거나 기타 다른 방법으로 이용자에게 공지함으로써 효력을 발생합니다.<br/>
					3. 회원은 변경된 약관에 동의하지 않을 경우, 서비스 이용을 중단하고 탈퇴할 수 있습니다. 약관이 변경된 이후에도 계속적으로 서비스를 이용하는 경우에는 회원이 약관의 변경 사항에 동의한 것으로 봅니다.<br/><br/>



					제3조 (약관 외 준칙)<br/><br/>


					1. 이 약관에 명시되지 않은 사항이 국내 관계법령에 규정되어 있을 경우에는 그 규정에 따릅니다.<br/>
					2. 회사는 약관 이외에 개별 서비스에 대한 세부적인 사항을 정할 수 있으며, 그 내용은 개별 이용 동의 절차에 따릅니다.<br/><br/>


					제2장 회원 가입과 서비스 이용<br/><br/>



					제4조 (이용계약)<br/><br/>


					서비스 이용계약은 이용자가 회사가 정한 약관에 동의하고, 회사가 이를 승낙하는 것으로 이루어집니다.<br/><br/>

					제5조 (이용신청)<br/><br/>


					1. 본 서비스를 이용하기 위해서는 회사가 정한 소정의 가입신청서에 이용자의 개인 신상정보를 제공해야 합니다. 이용자가 제공한 개인정보는 개인정보보호정책에 따라 철저히 보호됩니다.<br/>
					2. 가입신청 양식에 기재된 모든 이용자 정보는 반드시 실제 정보와 동일해야 합니다. 실제 정보를 입력하지 않거나 사실과 다른 정보를 입력한 사용자는 법적인 보호를 받을 수 없습니다.<br/><br/>

					제6조 (이용신청의 승낙)<br/><br/>


					1. 회사는 회원이 모든 사항을 정확히 기재하여 신청할 경우 서비스 이용을 승낙합니다. 단, 아래의 경우는 승낙하지 아니할 수 있습니다.<br/>
					1) 이용신청 시 필요내용을 허위로 기재하여 신청한 경우<br/>
					2) 실명이 아니거나 다른 사람의 명의를 사용하여 신청한 경우<br/>
					3) 사회의 안녕 질서 또는 미풍양속을 저해할 목적으로 신청한 경우<br/>
					4) 고의적으로 시스템에 손상을 주거나 마비를 줄 수 있는 행위를 한 경우<br/>
					5) 기타 회사가 정한 이용 신청 요건이 미비 되었을 경우<br/>


					제7조 (서비스 이용)<br/><br/>


					1. 서비스 이용은 회사의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간을 원칙으로 합니다.<br/>
					2. 회사에서 제공하는 서비스 중 일부는 회원에 가입하여 회사에서 인정한 ID와 비밀번호를 통해서만 서비스를 받을 수 있습니다.<br/>

					제8조 (정보의 제공 및 광고의 게재)<br/><br/>


					1. 회사는 회원이 서비스 이용 중 필요한 사항에 대해 전자우편을 통해 회원에게 제공할 수 있습니다.<br/>
					2. 회사는 서비스의 운용과 관련하여 서비스 화면 또는 회원의 전자우편 등에 광고를 게재할 수 있습니다.<br/>

					제9조 (회원의 혜택)<br/><br/>

					회사의 회원 가입은 무료이며, 회원은 회사에서 주관하는 각종 이벤트나 행사에 참여하실 수 있는 혜택을 받을 수 있습니다.<br/><br/>

					제10조 (계약 사항의 변경)<br/><br/>

					회원은 서비스이용 신청 시 기재한 사항이 변경되었을 경우, 즉시 수정하여야 합니다.<br/><br/>


					제3장 계약 해지 및 서비스 이용 제한<br/><br/>

					제11조 (계약 해지 및 이용 제한)<br/><br/>

					1. 회원이 서비스 이용 계약을 해지하고자 할 때는 회원 본인이 직접 해지 신청을 해야 합니다.<br/>
					2. 회사가 보관하고 있는 탈퇴 회원의 정보는 회원의 가입이력관리와 지적재산권 관리, 개인정보보호를 위해서만 활용할 수 있습니다.<br/>

					제12조 (이용 제한 절차)<br/><br/>

					회사는 회원에게 제11조 각항에 의거 이용제한을 하고자 하는 경우에는 그 사유, 일시와 기간을 정하여 이용자의 전자우편 또는 전화 등의 방법에 의하여 해당 이용자 또는 대리인에게 통지합니다.<br/>
					다만, 회사가 긴급하게 이용을 정지할 필요가 있다고 인정하는 경우에는 그러하지 아니할 수 있습니다.<br/><br/>

					제13조 (자격상실)<br/><br/>

					다음 각항의 사유에 해당하는 경우 회사는 사전 통보 없이 이용계약을 해지하거나 기간을 정하여 서비스 이용을 중지할 수 있습니다.<br/><br/>

					1. 가입신청 시 허위 내용으로 등록한 경우<br/>
					2. 회사, 다른 회원 또는 제3자의 지적재산권을 침해하는 경우<br/>
					3. 사회의 안녕과 공공 질서, 미풍양속을 해치는 행위를 하는 경우<br/>
					4. 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우<br/>
					5. 같은 이용자가 다른 ID로 이중 등록을 한 경우<br/>
					6. 범죄 행위에 관련되는 경우<br/>
					7. 정보통신망에 장애를 일으킬 수 있는 행위를 하는 경우<br/>
					8. 회사의 허락 없이 회사의 서비스를 이용해 영리행위를 하는 경우<br/><br/>


					제4장 계약 당사자의 의무<br/><br/>

					제14조 (회사의 의무)<br/><br/>

					1. 회사는 서비스를 안정적, 지속적으로 제공할 의무가 있습니다.<br/>
					2. 회사는 서비스 제공과 관련된 설비에 장애가 발생할 경우 신속히 복구할 의무가 있습니다.<br/>
					3. 회사는 회원이 제기한 의견이나 불만이 정당하다고 인정할 경우에는 즉시 처리하여야 합니다.<br/>
					4. 회사는 개인정보를 회원의 동의없이 제3자에게 제공하지 않습니다. 단, 특정 개인의 신상이 노출되지 않는 통계작성, 학술연구등의 목적일 경우, 범죄에 대한 수사상의 목적인 경우 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우에는 예외로 합니다.<br/>
					5. 회사는 회원이 회사의 사이트를 편리하게 이용할 수 있도록 하기 위해 회사는 회원의 정보를 제휴 사이트들과 공유할 수 있으며, 공유를 위해 회사는 회원의 컴퓨터에 쿠키를 전송할 수 있습니다.<br/><br/>

					제15조 (회원의 의무)<br/><br/>

					1. 회원은 서비스 사용에 있어서 회사와의 약속을 준수합니다.<br/><br/>
					2. 회원은 서비스의 이용권한, 기타 이용계약상의 지위를 타인에게 양도, 증여할 수 없습니다. 회사의 사전 승인 없이 여타 개인 및 조직에 서비스를 재판매하는 것은 허용되지 않습니다.<br/>
					3. 회원은 회사로부터 허가받지 않은 광고물의 배포 및 게재를 금지합니다.<br/>
					4. 회원은 서비스와 연결된 모든 네트워크에 대한 접근시 해당 네트워크의 관련규칙을 성실히 준수해야 합니다.<br/>
					5 . 회원은 같은 서버를 이용하는 다른 고객에게 피해를 주어서는 안 됩니다.<br/>
					6 . 회원은 ID와 비밀번호에 관한 모든 관리의 책임은 회원에게 있습니다.<br/>
					7 . 회원은 회사에서 제공하는 서비스의 내용에 광고를 삽입할 수 있음을 동의하여야 합니다.<br/><br/>

					제5장 게시물<br/><br/>

					제16조 (회원의 게시물)<br/><br/>

					1. 게시물이라 함은 회사의 서비스에 회원이 게시한 게시물, 질문, 답변, 자료, 팀 활동 등을 모두 총칭합니다.<br/>
					2. 회사는 아래에 해당되는 회원 게시물일 경우 사전통지 없이 삭제 합니다.<br/>
					1) 타인을 비방하거나 중상 모략하여 명예를 손상시키는 경우<br/>
					2) 공공질서, 미풍양속에 저해되며 음란한 내용이나, 특정 종교를 선전하거나 비방하는 내용, 기타 비양식적인 내용을 게재하는 경우<br/>
					3) 회사의 저작권이나 제3자의 저작권등 기타 권리를 침해하는 내용인 경우<br/>
					4) 상업성이 있는 광고 게시물일 경우<br/>
					5) 회사에서 정하고 있는 게시기간을 초과한 경우<br/>
					6) 기타 관계법령에 위반된다고 판단되는 경우<br/>
					7) 정보통신 윤리위원회 등 관련 공공기관의 시정 요구가 있는 경우<br/><br/>

					3. 회사는 2항의 이유로 삭제한 게시물의 보관의무를 갖지 않습니다.<br/><br/>

					제17조 (게시물의 이용 및 회사의 책임)<br/><br/>

					1. 회사는 회원이 등록한 게시물을 이용해 가공, 판매 등을 할 수 있으며, 비즈니스 파트너 혹은 미디어에게 게시물의 내용을 제공할 수 있습니다.<br/>
					2. 회사는 1항과 같이 회원의 게시물을 이용시 회원의 동의 없이 회원의 ID를 제외한 개인정보를 제공하지 않습니다.<br/>
					3. 회사는 모든 게시물을 검사 또는 검열할 의무를 갖지 않습니다.<br/>
					4. 회원이 게시하는 게시물의 저작권은 회원에게 있으며 그 게시물로 인해 발생하는 손실이나 문제는 회원 개인의 책임이며, 회사는 이에 대하여 책임을 지지 않습니다. 단 회사의 고의에 의한 경우에는 그렇지 않습니다.<br/>
					5. 회원의 게시물로 인하여 제3자의 회사에 대한 청구, 소송, 기타 일체의 분쟁이 발생한 경우 회원은 그 해결에 소요되는 비용을 부담하고 회사를 위하여 분쟁을 처리하여야 하며, 회사가 제3자에게 배상하거나 회사에 손해가 발생한 경우 회원은 회사에 배상하여야 합니다.<br/><br/>

					제6장 기타<br/><br/>

					제18조 (면책)<br/><br/>

					1. 회사는 통신사의 서버의 과실로 인한 피해는 책임지지 않습니다.<br/>
					2. 회사는 회원이 유포한 불법 자료나 저작권과 관련된 자료로 입을 수 있는 피해에 대하여 일체의 책임을 지지 않습니다.<br/>
					3. 회사가 의무를 다했을 경우에 발생하는 피해에 대해서는 일체의 책임을 지지 않습니다.<br/>
					4. 회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스제공에 대한 책임이 없습니다.<br/>
					5. 회사는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 어떠한 책임도 지지 않습니다.<br/>
					6. 회사는 회원이 제휴사이트의 서비스를 이용하여 얻은 자료로 인한 손해, 회원과 제휴사이트간에 행해진 거래에 관하여는 어떠한 책임도 지지 않습니다.<br/><br/>

					제19조 (약관적용외 준칙)<br/><br/>
					이 약관에 명시되지 아니한 사항은 관계법령 및 상관행을 따르도록 합니다.<br/><br/>

					제20조 (관할법원)<br/><br/>
					본 약관은 대한민국 관련 법률의 적용을 받습니다.<br/>
					각종 서비스 이용으로 발생한 분쟁에 대해 소송이 제기될 경우 회사의 사업장 소재지를 관할하는 법원을 관할법원에 있음에 동의합니다.<br/><br/><br/>


					이 개인정보 처리방침은 2019. 8. 10.부터 적용됩니다.
				</div>
			</div>
			<p class="modal_submit_button">
				<a class="fn_modalSubmitCancel" href="#none" title="닫기">닫기</a>
				<a class="fn_modalPolPrivClose" href="#none" title="확인">확인</a>
			</p>
		</div>
	</div>
	<div id="modal_showPrivacy" class="modal_team_view">
		<p class="modal_guide_banner_close"><a href="#none" title="닫기"><img src="/resources/images/info_guide_close.png" alt="닫기"/></a></p>
		<div class="modal_team_viewWrap">
			<h3>개인정보취급방침</h3>
			<div class="modal_team_viewContents">
				<div class="modal_polpriv_wrap">
					정보통신망법 규정에 따라 ㈜로아이에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.<br/><br/>

					1. 수집하는 개인정보 항목<br/>
					가. 수집하는 개인정보 항목<br/>
					① 최초 회원가입시 회원식별 및 최적화된 서비스 제공을 위해 아래와 같은 정보를 수집합니다.<br/><br/>

					&lt; 일반 회원가입 시 &gt;<br/>
					필수항목 : 이메일, 비밀번호, 이름, 연락처, 닉네임, 직업<br/>
					선택사항 : 해당사항 없음<br/><br/>

					② 서비스 이용과정이나 사업 처리과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.<br/>
					서비스 이용기록, 접속로그, 쿠키, 접속IP 정보, 결제기록, 불량이용 기록<br/><br/>


					2. 개인정보의 수집 및 이용 목적<br/>
					개인정보는 생존하는 개인에 관한 정보로서 실명, 전화번호 등의 사항으로 당사 회원 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함)를 말합니다. 당사가 수집한 개인정보는 다음의 목적을 위해 활용합니다.<br/><br/>

					① 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산<br/>
					콘텐츠 제공, 물품배송 또는 청구서 등 발송, 금융거래 본인 인증 및 금융 서비스, 구매 및 요금 결제, 요금추심<br/><br/>

					② 회원 관리<br/>
					회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 가입 및 가입횟수 제한, 만14세 미만 아동 개인 정보 수집 시 법정 대리인 동의여부 확인, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달<br/><br/>

					③ 마케팅 및 광고에 활용<br/>
					신규 서비스(제품) 개발 및 특화, 인구통계학적 특성에 따른 서비스 제공 및 광고게재, 접속 빈도 파악, 회원의 서비스 이용에 대한 통계, 이벤트 등 광고성 정보 전달 (회원님의 개인정보는 광고를 의뢰한 개인이나 단체에는 제공되지 않습니다.)<br/><br/>


					3. 수집하는 개인정보의 보유 및 이용기간<br/>
					원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.<br/>
					단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.<br/><br/>

					회원탈퇴시 보존 개인정보<br/>
					① 회원탈퇴시 보존 개인정보<br/>
					보존항목 : 회원님께서 제공한 이름, 아이디, 비밀번호, 성별, 이메일주소, 주소, 전화번호, 휴대폰, 수신공모전 정보<br/>
					보존근거 : 불량 이용자의 재가입 방지, 명예훼손 등 권리침해 분쟁 및 수사협조<br/>
					보존기간 : 회원탈퇴 후 1년<br/><br/><br/>


					이 개인정보 처리방침은 2019. 8. 10.부터 적용됩니다.
				</div>
			</div>
			<p class="modal_submit_button">
				<a class="fn_modalSubmitCancel" href="#none" title="닫기">닫기</a>
				<a class="fn_modalPolPrivClose" href="#none" title="확인">확인</a>
			</p>
		</div>
	</div>
   <div class="m_footerDummy"></div>
		<div id="modal_profileEditAccess" class="modal_team_view" style="z-index:60">
		<p class="modal_guide_banner_close"><a href="#none" title="닫기"><img src="/resources/images/info_guide_close.png" alt="닫기"/></a></p>
		<div class="modal_team_viewWrap">
			<h3>정보 수정을 위한 인증</h3>
			<div class="modal_team_viewContents">
		
				<p><input id="profileEditAccessPW"  name="profileEditAccessPW" type="password" title="비밀번호 입력" placeholder="비밀번호를 입력하세요."/></p>
				<p><input id="profileEditAccessPWR" name="profileEditAccessPWR" type="password" title="비밀번호 재입력" placeholder="비밀번호를 다시 입력하세요."/></p>
	
			</div>
			<p class="modal_submit_button">
				<a class="fn_modalSubmitCancel" href="#none" title="취소">취소</a>
				<a onclick="fn_passck();" href="#none" title="확인">확인</a>
			</p>
		</div>
	</div>
	<div id="modal_estimate" class="modal_team_view">
		<p class="modal_guide_banner_close"><a href="#none" title="닫기"><img src="/resources/images/info_guide_close.png" alt="닫기"/></a></p>
		<div class="modal_team_viewWrap">
			<h3>견적서 받기</h3>
			<div class="modal_team_viewContents">
				<p class="estimate_package_name">신청 패키지: 메인 배너 A</p>
				<p class="pd6"><input type="text" name="commercialCompany" title="담당자 소속회사명 입력" placeholder="담당자 소속회사명을 입력해주세요"/></p>
				<p class="pd6"><input type="text" name="commercialUserName" title="담당자 이름 입력" placeholder="담당자 이름을 입력해주세요"/></p>
				<p class="pd6"><input type="text" name="commercialUserEmail" title="이메일 입력" placeholder="이메일을 입력해주세요"/></p>
				<p class="pd6"><input type="text" name="commercialUserPhone" title="핸드폰 번호 입력" placeholder="핸드폰 번호를 입력해주세요"/></p>
				<div class="estimate_commercial_date">
					<span>등록기간</span>
					<p class="datepicker_wrap">
						<input id="datepicker_commercialBegin" type="text" name="commercialBeginDate" title="광고 시작일"/>
					</p>
					<strong>-</strong>
					<p class="datepicker_wrap">
						<input id="datepicker_commercialEnd" type="text" name="commercialEndDate" title="광고 종료일"/>
					</p>
				</div>
				<p class="form_control estimate_checkbox">
					<input class="form_chkbox" id="join_form_chk_privacy" type="checkbox" name="join_form_chk_privacy" checked/>
					<label for="join_form_chk_privacy">개인정보 수집 및 이용에 대한 동의 (필수)</label>
					<button class="fn_showPolicy">상세보기</button>
				</p>
			</div>
			<p class="modal_submit_button">
				<a class="fn_modalSubmitCancel" href="#none" title="취소">취소</a>
				<a onclick="fn_toEstimate();" href="#none" title="신청">신청</a>
			</p>
		</div>
	</div>
</body>
<script>

//정보수정 로직
function fn_passck() {
	if( $('[name=profileEditAccessPW]').val() != $('[name=profileEditAccessPWR]').val() ){
		alert("비밀번호가 일치하지 않습니다"); 
		$('[name=profileEditAccessPW]').val('');
		$('[name=profileEditAccessPWR]').val('');
		return;
		}
		   $.ajax({
		    type : "POST",
		    dataType: "json",
		    data : {pass: $('[name=profileEditAccessPW]').val()},
		    url : "/front/mypage/passck",
		    success : function(data) {
		    	var result = data.result;
		    	if(Number(result) == 1){ 
		    		location.href='/front/membership/modify';
		    	}else{
		    		alert("비밀번호가 틀립니다.");
		    	}
		    }
		   });
}
	//달력기능_datepicker
	$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd'
		,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "/resources/images/icon_calendar.png" //버튼 이미지 경로
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        ,minDate: "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
	});
	
	$("#datepicker_commercialBegin").datepicker();
	$("#datepicker_commercialEnd").datepicker();
	
	$(document).ready(function(){
		$(".topMenu_loggedProfile a").mouseover(function(){
			$(".topMenu_loggedMenu").stop(0).slideDown(0);
		});
		$(".topMenu_loggedProfile").mouseleave(function(){
			$(".topMenu_loggedMenu").stop(0).slideUp(0);
		});
	});
	

</script>
</html>