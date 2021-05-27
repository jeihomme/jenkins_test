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
			<h3 class="team_coverTitle">기본 정보 입력</h3>
			<h3>모집 위치</h3>
			<p class="team_socialLocation">
				<select>
					<option selected>모집 지역 선택</option>
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
					<option>전국</option>
				</select>
			</p>
			<h3>팀원 모집 마감일</h3>
			<p class="wd400 datepicker_wrap">
				<input id="datepicker_team_memberProjectEnd" type="text" name="memberProjectEndDate" title="프로젝트 종료일" placeholder="프로젝트 종료일을 입력하세요."/>
			</p>
			<h3>모집 자격 선택(복수 선택 가능)</h3>
			<ul class="team_category team_memberCategory">
				<li class="team_memberCategory_active">
					<a href="#none" title="무관">
						<i>
							<img src="/resources/images/job_05.png" alt="무관"/>
							<img class="team_memberCategory_active_img" src="/resources/images/job_05_over.png" alt="무관"/>
						</i>
						<p>무관</p>
					</a>
				</li>
				<li>
					<a href="#none" title="중학생">
						<i>
							<img src="/resources/images/job_01.png" alt="중고등학생"/>
							<img class="team_memberCategory_active_img" src="/resources/images/job_01_over.png" alt="중학생"/>
						</i>
						<p>중학생</p>
					</a>
				</li>
				<li>
					<a href="#none" title="고등학생">
						<i>
							<img src="/resources/images/job_01.png" alt="중고등학생"/>
							<img class="team_memberCategory_active_img" src="/resources/images/job_01_over.png" alt="고등학생"/>
						</i>
						<p>고등학생</p>
					</a>
				</li>
				<li>
					<a href="#none" title="대학생">
						<i>
							<img src="/resources/images/job_02.png" alt="대학생"/>
							<img class="team_memberCategory_active_img" src="/resources/images/job_02_over.png" alt="대학생"/>
						</i>
						<p>대학생</p>
					</a>
				</li>
				<li>
					<a href="#none" title="대학원생">
						<i>
							<img src="/resources/images/job_03.png" alt="대학원생"/>
							<img class="team_memberCategory_active_img" src="/resources/images/job_03_over.png" alt="대학원생"/>
						</i>
						<p>대학원생</p>
					</a>
				</li>
				<li>
					<a href="#none" title="일반성인">
						<i>
							<img src="/resources/images/job_04.png" alt="일반성인"/>
							<img class="team_memberCategory_active_img" src="/resources/images/job_04_over.png" alt="일반성인"/>
						</i>
						<p>일반성인</p>
					</a>
				</li>
			</ul>
			<h3 class="team_coverTitle">세부 내용 입력</h3>
			<h3>세부 내용</h3>
			<ul class="member_detail">
				<li>
					<strong>메인 노출 제목</strong>
					<input type="text" name="memberTeamMainTitle" title="메인 노출 제목" placeholder="예) 서울권 공모전 팀원 구함"/>
				</li>
				<li>
					<strong>모임 장소</strong>
					<input type="text" name="memberTeamPlace" title="모임 장소" placeholder="예) 홍대 인근"/>
				</li>
				<li>
					<strong>모집 인원 수</strong>
					<input type="text" name="memberTeamNumber" title="모집 인원 수"/>
				</li>
			</ul>
			<h3>행사 일정</h3>
			<ul class="member_event">
				<li>
					<p class="member_eventDate"><input id="datepicker_team_member_eventDate01" type="text" name="teamMemberDate" title="행사 날짜" placeholder="행사 날짜를 입력하세요."/></p>
					<p class="member_eventInput"><input type="text" name="teamMemberEvent" title="행사 일정" placeholder="결과발표 등 주요 일정을 입력하세요."/></p>
				</li>
				<li>
					<p class="member_eventDate"><input id="datepicker_team_member_eventDate02" type="text" name="teamMemberDate" title="행사 날짜" placeholder="행사 날짜를 입력하세요."/></p>
					<p class="member_eventInput"><input type="text" name="teamMemberEvent" title="행사 일정" placeholder="결과발표 등 주요 일정을 입력하세요."/></p>
					<a class="member_eventDelete" href="#none" title="삭제"><img src="/resources/images/icon_member_delete.png" alt="삭제"/></a>
				</li>
				<li>
					<p class="member_eventDate"><input id="datepicker_team_member_eventDate03" type="text" name="teamMemberDate" title="행사 날짜" placeholder="행사 날짜를 입력하세요."/></p>
					<p class="member_eventInput"><input type="text" name="teamMemberEvent" title="행사 일정" placeholder="결과발표 등 주요 일정을 입력하세요."/></p>
					<a class="member_eventDelete" href="#none" title="삭제"><img src="/resources/images/icon_member_delete.png" alt="삭제"/></a>
				</li>
				<li>
					<p class="member_eventDate"><input id="datepicker_team_member_eventDate04" type="text" name="teamMemberDate" title="행사 날짜" placeholder="행사 날짜를 입력하세요."/></p>
					<p class="member_eventInput"><input type="text" name="teamMemberEvent" title="행사 일정" placeholder="결과발표 등 주요 일정을 입력하세요."/></p>
					<a class="member_eventDelete" href="#none" title="삭제"><img src="/resources/images/icon_member_delete.png" alt="삭제"/></a>
				</li>
			</ul>
			<p class="btn_memberInfoAdd"><button class="btn_fff btn_team_common fn_addSchedule">항목 추가 +</button></p>
			<h3>팀 소개</h3>
			<ul class="member_info">
				<li>
					<p class="member_infoTitle"><input type="text" name="memberTeamIntroduce" title="팀 소개" placeholder="팀 소개"/></p>
					<p class="member_infoContent"><textarea placeholder="내용을 입력하세요."></textarea></p>
				</li>
				<li>
					<p class="member_infoTitle"><input type="text" name="memberTeamTime" title="모임 시간/방식" placeholder="모임 시간/방식"/></p>
					<p class="member_infoContent"><textarea placeholder="내용을 입력하세요."></textarea></p>
					<a class="member_infoDelete" href="#none" title="삭제"><img src="/resources/images/icon_member_delete.png" alt="삭제"/></a>
				</li>
				<li>
					<p class="member_infoTitle"><input type="text" name="memberTeamCategory" title="모집 분야/인원" placeholder="모집 분야/인원"/></p>
					<p class="member_infoContent"><textarea placeholder="내용을 입력하세요."></textarea></p>
					<a class="member_infoDelete" href="#none" title="삭제"><img src="/resources/images/icon_member_delete.png" alt="삭제"/></a>
				</li>
				<li>
					<p class="member_infoTitle"><input type="text" name="memberTeamLocation" title="모임 장소" placeholder="모임 장소"/></p>
					<p class="member_infoContent"><textarea placeholder="내용을 입력하세요."></textarea></p>
					<a class="member_infoDelete" href="#none" title="삭제"><img src="/resources/images/icon_member_delete.png" alt="삭제"/></a>
				</li>
			</ul>
			<p class="btn_memberInfoAdd"><button class="btn_fff btn_team_common fn_addTeamInfo">항목 추가 +</button></p>
			<div class="team_submitWrap">
				<button class="btn_grn btn_team_common btn_team_submit">팀원 모집하기</button>
			</div>
		</div>
	</div>
</div>
<div class="m_footerDummy"></div>
<script type="text/javascript">
	//달력기능_datepicker
	$("#datepicker_team_memberProjectEnd").datepicker();
	$("#datepicker_team_member_eventDate").datepicker();
	$("#datepicker_team_member_eventDate01").datepicker();
	$("#datepicker_team_member_eventDate02").datepicker();
	$("#datepicker_team_member_eventDate03").datepicker();
	$("#datepicker_team_member_eventDate04").datepicker();
</script>