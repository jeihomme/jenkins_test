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
		<li><a href="/front/mypage/team_contest" title="팀 만들기">팀 만들기</a></li>
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
<div class="sub_common">
	<div class="sectionWrap">
		<div class="sub_common_left">
			<div id="social_content" class="sub_box contest_content">
				<div class="sub_box sub_common_title sub_common_title_m">
					<h3>뉴스타터팀</h3>
					<h4>제 6회 산업통상부 마케팅 아이디어 공모전</h4>
					<ul class="myteam_detail_category">
						<li><i class="fas fa-map-marker-alt"></i>서울 전역</li>
						<li><i><img src="/resources/images/icon_social01.png" alt="사회약자"/></i>사회약자</li>
					</ul>
					<ul class="myteam_detail_option">
						<li><a href="/front/mypage/team_member" title="팀원 모집하기"><img src="/resources/images/myteam_detail_01.png" alt="팀원 모집하기"/><span>팀원 모집하기</span></a></li>
						<li><a href="#none" title="팀 나가기" onclick="fn_myteamLeave();"><img src="/resources/images/myteam_detail_02.png" alt="팀 나가기"/><span>팀 나가기</span></a></li>
						<li><a href="#none" title="팀 활동 종결" onclick="fn_myteamTerminate();"><img src="/resources/images/myteam_detail_03.png" alt="팀 활동 종결"/><span>팀 활동 종결</span></a></li>
						<li><a href="#none" title="공모전 사이트"><img src="/resources/images/myteam_detail_04.png" alt="공모전 사이트"/><span>공모전 사이트</span></a></li>
						<li><a class="fn_contestPosterPopup" href="#none" title="공모전 포스터"><img src="/resources/images/myteam_detail_05.png" alt="공모전 포스터"/><span>공모전 포스터</span></a></li>
						<li><a href="#none" title="공모전 공고문"><img src="/resources/images/myteam_detail_06.png" alt="공모전 공고문"/><span>공모전 공고문</span></a></li>
					</ul>
				</div>
				<div class="sub_titleImg myteam_addImg">
					<div class="myteam_addImg_guide">
						<a href="#none" title="이미지 추가">
							<img id="myteam_detail_addImg" src="/resources/images/btn_add.png" alt="이미지 추가"/>
							<input id="myteam_detail_addImg_dummy" type="file" title="이미지 추가" hidden/>
						</a>
						<p>우리팀의 대표 이미지를 등록해보세요.</p>
					</div>
				</div>
				<ul class="mypage_notice_category myteam_detail_notice_category">
					<li class="mypage_notice_active"><a href="#myteam_todolist" title="내가 해야할 일">내가 해야할 일</a></li>
					<li><a href="#myteam_schedule" title="일정 및 진행 상태">일정 및 진행 상태</a></li>
					<li><a href="#sub_common_qna" title="QNA">우리팀 Q&amp;A</a></li>
				</ul>
				<ul class="mypage_notice_category_scroll">
					<li class="mypage_notice_scroll_active"><a href="#myteam_todolist" title="내가 해야할 일">내가 해야할 일</a></li>
					<li><a href="#myteam_schedule" title="일정 및 진행 상태">일정 및 진행 상태</a></li>
					<li><a href="#sub_common_qna" title="QNA">우리팀 Q&amp;A</a></li>
				</ul>
				<div id="myteam_todolist" class="myteam_todolist">
					<h3 class="myteam_areaTitle">내가 해야할 일</h3>
					<table class="form_control myteam_todolistTable">
						<tbody>
							<tr>
								<td><span>사전조사</span></td>
								<td><span>도널드</span></td>
								<td class="collapseCol">3/22까지</td>
								<td>
									<input class="form_chkbox" id="myteam_form_chk01" type="checkbox" name="myteam_form_chk01"/>
									<label for="myteam_form_chk01">완료</label>
								</td>
							</tr>
							<tr>
								<td><span>사전조사</span></td>
								<td><span>도널드</span></td>
								<td class="collapseCol">3/22까지</td>
								<td>
									<input class="form_chkbox" id="myteam_form_chk02" type="checkbox" name="myteam_form_chk02"/>
									<label for="myteam_form_chk02">완료</label>
								</td>
							</tr>
							<tr>
								<td><span>사전조사</span></td>
								<td><span>도널드</span></td>
								<td class="collapseCol">3/22까지</td>
								<td>
									<input class="form_chkbox" id="myteam_form_chk03" type="checkbox" name="myteam_form_chk03"/>
									<label for="myteam_form_chk03">완료</label>
								</td>
							</tr>
							<tr>
								<td><span>사전조사</span></td>
								<td><span>도널드</span></td>
								<td class="collapseCol">3/22까지</td>
								<td>
									<input class="form_chkbox" id="myteam_form_chk04" type="checkbox" name="myteam_form_chk04"/>
									<label for="myteam_form_chk04">완료</label>
								</td>
							</tr>
							<tr>
								<td><span>사전조사</span></td>
								<td><span>도널드</span></td>
								<td class="collapseCol">3/22까지</td>
								<td>
									<input class="form_chkbox" id="myteam_form_chk05" type="checkbox" name="myteam_form_chk05"/>
									<label for="myteam_form_chk05">완료</label>
								</td>
							</tr>
							<tr>
								<td><span>사전조사</span></td>
								<td><span>도널드</span></td>
								<td class="collapseCol">3/22까지</td>
								<td>
									<input class="form_chkbox" id="myteam_form_chk06" type="checkbox" name="myteam_form_chk06"/>
									<label for="myteam_form_chk06">완료</label>
								</td>
							</tr>
							<tr>
								<td><span>사전조사</span></td>
								<td><span>도널드</span></td>
								<td class="collapseCol">3/22까지</td>
								<td>
									<input class="form_chkbox" id="myteam_form_chk07" type="checkbox" name="myteam_form_chk07"/>
									<label for="myteam_form_chk07">완료</label>
								</td>
							</tr>
							<tr>
								<td><span>사전조사</span></td>
								<td><span>도널드</span></td>
								<td class="collapseCol">3/22까지</td>
								<td>
									<input class="form_chkbox" id="myteam_form_chk08" type="checkbox" name="myteam_form_chk08"/>
									<label for="myteam_form_chk08">완료</label>
								</td>
							</tr>
							<tr>
								<td><span>사전조사</span></td>
								<td><span>도널드</span></td>
								<td class="collapseCol">3/22까지</td>
								<td>
									<input class="form_chkbox" id="myteam_form_chk09" type="checkbox" name="myteam_form_chk09"/>
									<label for="myteam_form_chk09">완료</label>
								</td>
							</tr>
							<tr>
								<td><span>사전조사</span></td>
								<td><span>도널드</span></td>
								<td class="collapseCol">3/22까지</td>
								<td>
									<input class="form_chkbox" id="myteam_form_chk10" type="checkbox" name="myteam_form_chk10"/>
									<label for="myteam_form_chk10">완료</label>
								</td>
							</tr>
							<tr>
								<td><span>사전조사</span></td>
								<td><span>도널드</span></td>
								<td class="collapseCol">3/22까지</td>
								<td>
									<input class="form_chkbox" id="myteam_form_chk11" type="checkbox" name="myteam_form_chk11"/>
									<label for="myteam_form_chk11">완료</label>
								</td>
							</tr>
							<tr>
								<td><span>사전조사</span></td>
								<td><span>도널드</span></td>
								<td class="collapseCol">3/22까지</td>
								<td>
									<input class="form_chkbox" id="myteam_form_chk12" type="checkbox" name="myteam_form_chk12"/>
									<label for="myteam_form_chk12">완료</label>
								</td>
							</tr>
						</tbody>
					</table>
					<p class="myteam_todolist_more">
						<button class="btn_fff btn_team_common btn_myteam_todolist_more">더보기 +</button>
						<button class="btn_fff btn_team_common btn_myteam_todolist_less">접기 -</button>
					</p>
				</div>
				<h3 class="myteam_areaTitle">일정 및 진행상태</h3>
				<div class="myteam_schedule_chart">
					<canvas id="myteamsch01" height="70"></canvas>
				</div>
				<ul id="myteam_schedule" class="sub_contest_calendar_list">
					<li class="sche_blank sche_chk">
						<i></i>
						<strong>3/20</strong>
						<span>도전 시작</span>
					</li>
					<li class="sche_blank sche_chk">
						<i></i>
						<strong>3/21</strong>
						<span>접수 시작</span>
					</li>
					<li class="sche_blank sche_chk">
						<i></i>
						<strong>3/20</strong>
						<span>팀 모집 마감</span>
					</li>
					<li class="sche_blank sche_chk sche_comment">
						<i></i>
						<strong>3/25</strong>
						<b class="sche_comment_control sche_comment_open"><span>과제제출</span><img src="/resources/images/sche_down.png" alt="더보기"/></b>
						<b class="sche_comment_control sche_comment_close"><span>과제제출</span><img src="/resources/images/sche_up.png" alt="닫기"/></b>
						<div class="sche_memo">
							<p class="sche_memo_option">
								<a href="#none" title="수정">수정</a><span>|</span><a href="#none" title="삭제">삭제</a>
							</p>
							<p class="sche_memo_content">
								공모전 과제 제출하는 날 담당자는 한동 여신님
							</p>
						</div>
					</li>
					<li class="sche_blank sche_special sche_comment">
						<i></i>
						<b class="sche_comment_control sche_comment_open"><span>인쇄비 사용</span><img src="/resources/images/sche_down.png" alt="더보기"/></b>
						<b class="sche_comment_control sche_comment_close"><span>인쇄비 사용</span><img src="/resources/images/sche_up.png" alt="닫기"/></b>
						<div class="sche_memo">
							<p class="sche_memo_option">
								<a href="#none" title="수정">수정</a><span>|</span><a href="#none" title="삭제">삭제</a>
							</p>
							<p class="sche_memo_content">
								인쇄비 사용
							</p>
						</div>
					</li>
					<li class="sche_blank">
						<i></i>
						<strong>4/21</strong>
						<span>접수 마감</span>
					</li>
					<li class="sche_blank">
						<i></i>
						<strong>4/31</strong>
						<span>평가 및 심사</span>
					</li>
					<li class="sche_blank">
						<i></i>
						<strong>5/3</strong>
						<span>결과 발표</span>
					</li>
				</ul>
			</div>
			<div id="sub_common_qna" class="sub_box sub_common_qna myteam_detail_qna">
				<h3>우리팀 <strong>Q&amp;A</strong></h3>
				<ul class="sub_common_qna_list">
					<li>
						<h4><a href="#none" title="QnA"><strong><img src="/resources/images/sub_content_q.png" alt="Q"/></strong>모임 시간은 어떻게 되나요?<i class="fas fa-chevron-down"></i></a></h4>
						<p class="sub_common_qna_a">
							<strong><img src="/resources/images/sub_content_a.png" alt="A"/></strong><span>답변 내용이 들어갑니다. 답변 내용이 들어갑니다.</span>
							<b><button class="btn_team_common btn_lightblue">수정</button><button class="btn_team_common btn_lightblue">삭제</button></b>
						</p>
					</li>
					<li>
						<h4><a href="#none" title="QnA"><strong><img src="/resources/images/sub_content_q.png" alt="Q"/></strong>모임 시간은 어떻게 되나요?<i class="fas fa-chevron-down"></i></a></h4>
						<p class="sub_common_qna_a">
							<strong><img src="/resources/images/sub_content_a.png" alt="A"/></strong><span>답변 내용이 들어갑니다. 답변 내용이 들어갑니다.</span>
							<b><button class="btn_team_common btn_lightblue">수정</button><button class="btn_team_common btn_lightblue">삭제</button></b>
						</p>
					</li>
				</ul>
				<p class="sub_box_button"><button class="btn_grn btn_team_common btn_team_leaveAnswer">답변하기</button></p>
			</div>
			<div class="sub_box myteam_detail_applicants">
				<h3 class="myteam_areaTitle">팀원 지원자 현황: <strong>2</strong>명</h3>
				<ul class="myteam_applicant_list">
					<li>
						<div class="mypage_myInfo">
							<p class="myInfo_pic"><a href="#none" title="프로필 사진"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></a></p>
							<div class="myInfo_content">
								<strong>하나왕</strong>
								<span>onething@naver.com</span>
							</div>
							<ul class="myteam_applicant_actives">
								<li>
									<p class="myActive_img"><i><img src="/resources/images/icon_profile01.png" alt="공모전 참여"/></i></p>
									<p class="myActive_txt">
										<strong>공모전 참여</strong>
										<span>5회</span>
									</p>
								</li>
								<li>
									<p class="myActive_img"><i><img src="/resources/images/icon_profile02.png" alt="팀 활동"/></i></p>
									<p class="myActive_txt">
										<strong>팀 활동</strong>
										<span>2회</span>
									</p>
								</li>
								<li>
									<p class="myActive_img"><i><img src="/resources/images/icon_profile03.png" alt="수상경력"/></i></p>
									<p class="myActive_txt">
										<strong>수상 경력</strong>
										<span>3회</span>
									</p>
								</li>
							</ul>
							<p class="myteam_applicant_invite myteam_applicant_refuse">
								<a href="#none" title="거절">
									<i><img src="/resources/images/profile_team_remove.png" alt="거절"/></i>
									<span>거절</span>
								</a>
							</p>
							<p class="myteam_applicant_invite">
								<a href="#none" title="승인">
									<i><img src="/resources/images/profile_team_add.png" alt="승인"/></i>
									<span>승인</span>
								</a>
							</p>
						</div>
						<div class="myteam_applicant_stat_control">
							<a class="applicant_open" href="#none" title="접어보기">
								<span>접어보기</span>
								<b class="sche_comment_control"><img src="/resources/images/sche_down.png" alt="더보기"/></b>
							</a>
							<a class="applicant_close" href="#none" title="접어보기">
								<span>접어보기</span>
								<b class="sche_comment_control"><img src="/resources/images/sche_up.png" alt="닫기"/></b>
							</a>
						</div>
						<div class="myteam_applicant_stat">
							<div class="mypage_chart">
								<canvas id="profile_radar01"></canvas>
							</div>
							<div class="myteam_applicant_descWrap">
								<div class="myteam_applicant_desc">
									안녕하세요. 저는 마케팅을 전공하고 있습니다. 저는 다양한 프로젝트와 공모전에 참여하여 수상한 경험이 있습니다. 이 프로젝트에 함께하면 열심히 하겠습니다.
									<p><i><img src="/resources/images/icon_tel.png" alt="전화"/></i>010-1234-1234</p>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="mypage_myInfo">
							<p class="myInfo_pic"><a href="#none" title="프로필 사진"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></a></p>
							<div class="myInfo_content">
								<strong>도널드</strong>
								<span>onething@naver.com</span>
							</div>
							<ul class="myteam_applicant_actives">
								<li>
									<p class="myActive_img"><i><img src="/resources/images/icon_profile01.png" alt="공모전 참여"/></i></p>
									<p class="myActive_txt">
										<strong>공모전 참여</strong>
										<span>5회</span>
									</p>
								</li>
								<li>
									<p class="myActive_img"><i><img src="/resources/images/icon_profile02.png" alt="팀 활동"/></i></p>
									<p class="myActive_txt">
										<strong>팀 활동</strong>
										<span>2회</span>
									</p>
								</li>
								<li>
									<p class="myActive_img"><i><img src="/resources/images/icon_profile03.png" alt="수상경력"/></i></p>
									<p class="myActive_txt">
										<strong>수상 경력</strong>
										<span>3회</span>
									</p>
								</li>
							</ul>
							<p class="myteam_applicant_invite myteam_applicant_refuse">
								<a href="#none" title="거절">
									<i><img src="/resources/images/profile_team_remove.png" alt="거절"/></i>
									<span>거절</span>
								</a>
							</p>
							<p class="myteam_applicant_invite">
								<a href="#none" title="승인">
									<i><img src="/resources/images/profile_team_add.png" alt="승인"/></i>
									<span>승인</span>
								</a>
							</p>
						</div>
						<div class="myteam_applicant_stat_control">
							<a class="applicant_open" href="#none" title="접어보기">
								<span>접어보기</span>
								<b class="sche_comment_control"><img src="/resources/images/sche_down.png" alt="더보기"/></b>
							</a>
							<a class="applicant_close" href="#none" title="접어보기">
								<span>접어보기</span>
								<b class="sche_comment_control"><img src="/resources/images/sche_up.png" alt="닫기"/></b>
							</a>
						</div>
						<div class="myteam_applicant_stat">
							<div class="mypage_chart">
								<canvas id="profile_radar02"></canvas>
							</div>
							<div class="myteam_applicant_descWrap">
								<div class="myteam_applicant_desc">
									안녕하세요. 저는 마케팅을 전공하고 있습니다. 저는 다양한 프로젝트와 공모전에 참여하여 수상한 경험이 있습니다. 이 프로젝트에 함께하면 열심히 하겠습니다.
									<p><i><img src="/resources/images/icon_tel.png" alt="전화"/></i>010-1234-1234</p>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="sub_common_right">
			<div class="sub_box sub_common_title">
				<h3>뉴스타터팀</h3>
				<h4>제 6회 산업통상부 마케팅 아이디어 공모전</h4>
				<ul class="myteam_detail_category">
					<li><i class="fas fa-map-marker-alt"></i>서울 전역</li>
					<li><i><img src="/resources/images/icon_social01.png" alt="사회약자"/></i>사회약자</li>
				</ul>
				<ul class="myteam_detail_option">
					<li><a href="/front/mypage/team_member" title="팀원 모집하기"><img src="/resources/images/myteam_detail_01.png" alt="팀원 모집하기"/><span>팀원 모집하기</span></a></li>
					<li><a href="#none" title="팀 나가기" onclick="fn_myteamLeave();"><img src="/resources/images/myteam_detail_02.png" alt="팀 나가기"/><span>팀 나가기</span></a></li>
					<li><a href="#none" title="팀 활동 종결" onclick="fn_myteamTerminate();"><img src="/resources/images/myteam_detail_03.png" alt="팀 활동 종결"/><span>팀 활동 종결</span></a></li>
					<li><a href="#none" title="공모전 사이트"><img src="/resources/images/myteam_detail_04.png" alt="공모전 사이트"/><span>공모전 사이트</span></a></li>
					<li><a class="fn_contestPosterPopup" href="#none" title="공모전 포스터"><img src="/resources/images/myteam_detail_05.png" alt="공모전 포스터"/><span>공모전 포스터</span></a></li>
					<li><a href="#none" title="공모전 공고문"><img src="/resources/images/myteam_detail_06.png" alt="공모전 공고문"/><span>공모전 공고문</span></a></li>
				</ul>
			</div>
			<div class="sub_box sub_common_teams myteam_detail_members">
				<h3><strong>우리팀 멤버</strong> (3명)</h3>
				<ul class="myteam_detail_memberlist">
					<li class="team_add">
						<a class="fn_teamAdd" href="#none" title="팀원 추가">
							<p class="sub_common_teams_img"><img src="/resources/images/btn_add.png" alt="팀원 추가"/></p>
							<p class="sub_common_teams_txt"><strong>초대하기</strong></p>
						</a>
					</li>
					<li>
						<a href="/front/mypage/profile_other" title="팀원 프로필 보기">
							<p class="sub_common_teams_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
							<p class="sub_common_teams_txt"><strong>도널드</strong></p>
							<p class="sub_common_teams_leader"><i class="fas fa-crown"></i></p>
						</a>
					</li>
					<li>
						<a href="/front/mypage/profile_other" title="팀원 프로필 보기">
							<p class="sub_common_teams_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
							<p class="sub_common_teams_txt"><strong>도널드</strong></p>
						</a>
					</li>
					<li>
						<a href="/front/mypage/profile_other" title="팀원 프로필 보기">
							<p class="sub_common_teams_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
							<p class="sub_common_teams_txt"><strong>도널드</strong></p>
						</a>
					</li>
				</ul>
			</div>
			<div class="sub_box myteam_detail_memo">
				<h3>'할일 추가'를 통해서 해야 하는 업무를 팀원에게 분배해 보세요.</h3>
				<p class="sub_box_button"><button class="btn_grn btn_team_common fn_addTodoList">할일 추가</button></p>
				<h3 class="myteam_detail_memo_title">우리팀의 '일정'과 '메모'를 공유해 보세요!</h3>
				<p class="sub_box_button">
					<button class="btn_lightblue btn_team_common fn_addSchedulePopup">일정 추가</button>
					<button class="btn_lightblue btn_team_common fn_addMemoPopup">메모 추가</button>
				</p>
			</div>
		</div>
	</div>
</div>
<div class="m_footerDummy"></div>
<div id="modal_leaveAnswer" class="modal_team_view">
	<p class="modal_guide_banner_close"><a href="#none" title="닫기"><img src="/resources/images/info_guide_close.png" alt="닫기"/></a></p>
	<div class="modal_team_viewWrap">
		<h3>답변하기</h3>
		<div class="modal_team_viewContents">
			<p><textarea placeholder="답변을 입력하세요."></textarea></p>
		</div>
		<p class="modal_submit_button">
			<a class="fn_modalSubmitCancel" href="#none" title="취소">취소</a>
			<a class="fn_modalLeaveAnswerSubmit" href="#none" title="등록">등록</a>
		</p>
	</div>
</div>
<div id="modal_addTodoList" class="modal_team_view">
	<p class="modal_guide_banner_close"><a href="#none" title="닫기"><img src="/resources/images/info_guide_close.png" alt="닫기"/></a></p>
	<div class="modal_team_viewWrap">
		<h3>할 일 추가하기</h3>
		<div class="modal_team_viewContents">
			<p><input type="text" name="addTodoTitle" title="제목 입력" placeholder="제목을 입력하세요."/></p>
			<p><textarea placeholder="내용을 입력하세요."></textarea></p>
			<div class="modal_addTodoList_list">
				<h4>담당자 선택</h4>
				<ul>
					<li>
						<a class="todoList_active" href="#none" title="담당자 선택">
							<p class="todoList_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
							<p class="todoList_txt"><strong>도널드</strong></p>
						</a>
					</li>
					<li>
						<a href="#none" title="담당자 선택">
							<p class="todoList_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
							<p class="todoList_txt"><strong>도널드</strong></p>
						</a>
					</li>
					<li>
						<a href="#none" title="담당자 선택">
							<p class="todoList_img"><img src="/resources/images/profile_picture.png" alt="프로필 사진"/></p>
							<p class="todoList_txt"><strong>도널드</strong></p>
						</a>
					</li>
				</ul>
			</div>
			<p class="datepicker_wrap">
				<input id="datepicker_addTodo" type="text" name="addTodoDateTitle" title="기한일" placeholder="기한일"/>
			</p>
		</div>
		<p class="modal_submit_button">
			<a class="fn_modalSubmitCancel" href="#none" title="취소">취소</a>
			<a class="fn_modalAddTodoSubmit" href="#none" title="등록">등록</a>
		</p>
	</div>
</div>
<div id="modal_addMemo" class="modal_team_view">
	<p class="modal_guide_banner_close"><a href="#none" title="닫기"><img src="/resources/images/info_guide_close.png" alt="닫기"/></a></p>
	<div class="modal_team_viewWrap">
		<h3>메모 추가하기</h3>
		<div class="modal_team_viewContents">
			<p><input type="text" name="addTodoTitle" title="제목 입력" placeholder="제목을 입력하세요."/></p>
			<p><textarea placeholder="내용을 입력하세요."></textarea></p>
			<p class="datepicker_wrap">
				<input id="datepicker_addMemo" type="text" title="날짜" placeholder="날짜"/>
			</p>
		</div>
		<p class="modal_submit_button">
			<a class="fn_modalSubmitCancel" href="#none" title="취소">취소</a>
			<a class="fn_modalAddMemoSubmit" href="#none" title="등록">등록</a>
		</p>
	</div>
</div>
<div id="modal_addSchedule" class="modal_team_view">
	<p class="modal_guide_banner_close"><a href="#none" title="닫기"><img src="/resources/images/info_guide_close.png" alt="닫기"/></a></p>
	<div class="modal_team_viewWrap">
		<h3>일정 추가하기</h3>
		<div class="modal_team_viewContents">
			<p><input type="text" name="addTodoTitle" title="제목 입력" placeholder="제목을 입력하세요."/></p>
			<p><textarea placeholder="내용을 입력하세요."></textarea></p>
			<p class="datepicker_wrap">
				<input id="datepicker_addSchedule" type="text" title="기한일" placeholder="기한일"/>
			</p>
		</div>
		<p class="modal_submit_button">
			<a class="fn_modalSubmitCancel" href="#none" title="취소">취소</a>
			<a class="fn_modalAddScheduleSubmit" href="#none" title="등록">등록</a>
		</p>
	</div>
</div>
<div id="modal_contestPoster" class="modal_team_view">
	<p class="modal_guide_banner_close"><a href="#none" title="닫기"><img src="/resources/images/info_guide_close.png" alt="닫기"/></a></p>
	<div class="modal_team_viewWrap">
		<h3>공모전 포스터 확인</h3>
		<div class="modal_team_viewContents modal_posterContents">
			<div class="modal_profileAward_imgWrap">
				<img src="/resources/images/sub_contest_sample01.png" alt="공모전 이미지"/>
			</div>
		</div>
		<p class="modal_submit_button">
			<a class="fn_modalSubmitCancel" href="#none" title="닫기">닫기</a>
			<a class="fn_modalSubmitCancel" href="#none" title="확인">확인</a>
		</p>
	</div>
</div>
<script>
	var ctx = document.getElementById("profile_radar01");
	var myChart = new Chart(ctx, {
		type : "radar",
		data : {
			labels: ["역할 성실도", "전문성", "창의력", "배려심", "시간약속"]
			,datasets: [{
				label: "하나왕"
				, data: [4, 5, 2, 4, 4]
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
			legend: {
				display: false
			},
			layout: {
				padding: {
					top: 20
				}
			},
			tooltips: {
				enabled: true,
				callbacks: {
					label: function(tooltipItem, data) {
						return data.datasets[tooltipItem.datasetIndex].label + ' : ' + data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
					}
				}
			},
			plugins: {
				datalabels: {
					backgroundColor: function(context) {
						return context.dataset.borderColor;
					},
					color: 'white',
					padding: 4,
					font: {
						size: 10,
						weight: 'bold'
					},
					anchor: 'start'
				}
			}
		}
	});
	
	var ctx = document.getElementById("profile_radar02");
	var myChart = new Chart(ctx, {
		type : "radar",
		data : {
			labels: ["역할 성실도", "전문성", "창의력", "배려심", "시간약속"]
			,datasets: [{
				label: "도널드"
				, data: [2, 4, 3, 5, 5]
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
			legend: {
				display: false
			},
			layout: {
				padding: {
					top: 20
				}
			},
			tooltips: {
				enabled: true,
				callbacks: {
					label: function(tooltipItem, data) {
						return data.datasets[tooltipItem.datasetIndex].label + ' : ' + data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
					}
				}
			},
			plugins: {
				datalabels: {
					backgroundColor: function(context) {
						return context.dataset.borderColor;
					},
					color: 'white',
					padding: 4,
					font: {
						size: 10,
						weight: 'bold'
					},
					anchor: 'start'
				}
			}
		}
	});
	
	var ctx = document.getElementById("myteamsch01");
	var barChart = new Chart(ctx, {
		type: 'horizontalBar',
		labels: ["진행률"],
		data: {
			datasets: [{
				label: "진행률(%)",
				data: [91],
				backgroundColor: "rgba(209, 234, 234, 0.5)",
				borderColor: "rgba(53, 171, 173, 1)",
				borderWidth : 1
			}]
		},
		options: {
			responsive: true,
			maintainAspectRatio: false,
			legend: {
				display: false
			},
			scales: {
				xAxes: [{
					ticks: {
						min: 0,
						max: 100
					}
				}],
				yAxes: [{
					barThickness: 10,
					ticks: {
						beginAtZero: true,
					}
				}]
			},
			plugins: {
				datalabels: {
					backgroundColor: function(context) {
						return context.dataset.borderColor;
					},
					color: 'white',
					padding: 4,
					font: {
						size: 12,
						weight: 'bold'
					},
					align: 'center',
					anchor: 'end',
					formatter: function(value, context){
						return Math.round(value) + '%';
					}
				}
			}
		}
	});
	
	//상단 고정바 리사이즈
	$(window).resize(function(){
		var cateWidth = $(".contest_content .mypage_notice_category").width();
		var offset = $(".contest_content .mypage_notice_category").offset();
		$(".mypage_notice_category_scroll").css("width", ""+cateWidth+"px");
	}).resize();
	
	//스크롤 기능
	$(window).scroll(function(){
		var scrollPos = $(document).scrollTop();
		var offset = $(".contest_content .mypage_notice_category").offset();
		//console.log(scrollPos);
		if( scrollPos > 770 ){
			$(".mypage_notice_category_scroll").css({"left":""+ offset.left +"px", "opacity":"1"});
		}
		else{
			$(".mypage_notice_category_scroll").css("left", "-9999px");
		}
	});
	
	$(".fn_contestPosterPopup").click(function(){
		$("#screenCover").show(0);
		$("#modal_contestPoster").show(0);
		
		$(".fn_modalSubmitCancel").click(function(){
			$("#modal_contestPoster").hide(0);
			$("#screenCover").hide(0);
		});
	});
	
	/* 모달팝업_팀 소개_답변하기 */
	$(".btn_team_leaveAnswer").click(function(){
		$("#screenCover").show(0);
		$("#modal_leaveAnswer").show(0);
		
		$(".fn_modalSubmitCancel").click(function(){
			$("#modal_leaveAnswer").hide(0);
			$("#screenCover").hide(0);
		});
	});
	$(".fn_modalLeaveAnswerSubmit").click(function(){
		if( confirm("답변을 등록하시겠습니까?") ){
			alert("답변이 등록되었습니다.");
			$("#modal_leaveAnswer").hide(0);
			$("#screenCover").hide(0);
			return false;
		}
		else{
			return false;
		}
	});
	
	
	
	
	
	/* 모달팝업_할일추가 */
	$(".fn_addTodoList").click(function(){
		$("#screenCover").show(0);
		$("#modal_addTodoList").show(0);
		
		$(".fn_modalSubmitCancel").click(function(){
			$("#modal_addTodoList").hide(0);
			$("#screenCover").hide(0);
		});
	});
	//담당자 선택
	$(".modal_addTodoList_list ul li a").click(function(){
		$(this).toggleClass("todoList_active");
	});
	$(".fn_modalAddTodoSubmit").click(function(){
		if( confirm("할 일을 등록하시겠습니까?") ){
			alert("할 일이 등록되었습니다.");
			$("#modal_addTodoList").hide(0);
			$("#screenCover").hide(0);
			return false;
		}
		else{
			return false;
		}
	});
	

	
	
	
	/* 모달팝업_메모추가 */
	$(".fn_addMemoPopup").click(function(){
		$("#screenCover").show(0);
		$("#modal_addMemo").show(0);
		
		$(".fn_modalSubmitCancel").click(function(){
			$("#modal_addMemo").hide(0);
			$("#screenCover").hide(0);
		});
	});
	$(".fn_modalAddMemoSubmit").click(function(){
		if( confirm("메모를 등록하시겠습니까?") ){
			alert("메모가 등록되었습니다.");
			$("#modal_addMemo").hide(0);
			$("#screenCover").hide(0);
			return false;
		}
		else{
			return false;
		}
	});
	

	
	
	
	/* 모달팝업_일정추가 */
	$(".fn_addSchedulePopup").click(function(){
		$("#screenCover").show(0);
		$("#modal_addSchedule").show(0);
		
		$(".fn_modalSubmitCancel").click(function(){
			$("#modal_addSchedule").hide(0);
			$("#screenCover").hide(0);
		});
	});
	$(".fn_modalAddScheduleSubmit").click(function(){
		if( confirm("일정을 등록하시겠습니까?") ){
			alert("일정이 등록되었습니다.");
			$("#modal_addSchedule").hide(0);
			$("#screenCover").hide(0);
			return false;
		}
		else{
			return false;
		}
	});
	
	
	$("#datepicker_addTodo").datepicker();
	$("#datepicker_addMemo").datepicker();
	$("#datepicker_addSchedule").datepicker();
</script>