<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<div class="col main mt-3">
	<div class="row mb-3">
		<div class="col-xl-3 col-sm-6 py-2">
			<div class="card bg-success text-white h-100">
				<div class="card-body bg-success">
					<div class="rotate">
						<i class="fas fa-user"></i>
					</div>
					<h6 class="text-uppercase">Today New Member</h6>
					<h1 class="display-4">34</h1>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-sm-6 py-2">
			<div class="card text-white bg-danger h-100">
				<div class="card-body bg-danger">
					<div class="rotate">
						<i class="fas fa-list"></i>
					</div>
					<h6 class="text-uppercase">Today New Contest</h6>
					<h1 class="display-4">17</h1>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-sm-6 py-2">
			<div class="card text-white bg-info h-100">
				<div class="card-body bg-info">
					<div class="rotate">
						<i class="fab fa-twitter"></i>
					</div>
					<h6 class="text-uppercase">Today New Social Issue</h6>
					<h1 class="display-4">11</h1>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-sm-6 py-2">
			<div class="card text-white bg-warning h-100">
				<div class="card-body">
					<div class="rotate">
						<i class="fas fa-share"></i>
					</div>
					<h6 class="text-uppercase">Total New Team</h6>
					<h1 class="display-4">15</h1>
				</div>
			</div>
		</div>
	</div>

	<hr>
	<div class="row mb-3 mb50">
		
		<div class="col-xl-6 col-sm-12 placeholder text-center mb50">
			
			<div class="title_wrap">
				<h4 class="floatL">신규 회원 &nbsp;&nbsp;&nbsp;<a href="/mng/member/member_list"><span style="text-align:right!important;"><u>회원 &nbsp;전체보러가기</u></span></a></h4>
			</div>

			<div class="tbl_list">
				<table class="list_tbl01" summary="">
					<caption>신규 회원 리스트 테이블</caption>
					<colgroup>
						<col style="width: 7%;" />
						<col style="width: 10%;" />			
						<col>
						<col style="width: 12%;" />	
						<col style="width: 15%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />	
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">회원명</th>
							<th scope="col">ID</th>
							<th scope="col">닉네임</th>
							<th scope="col">이메일</th>
							<th scope="col">직업</th>
							<th scope="col">가입일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>5</td>	
							<td>김명수</td>					
							<td><a href="#" onclick="popupShow('700','','popup_member_view');"><u>myngsu</u></a></td>	
							<td>엘</td>
							<td>mskim11@naver.com</td>
							<td>일반성인</td>
							<td>07-20</td>
						</tr>
						<tr>
							<td>4</td>	
							<td>김명수</td>					
							<td><a href="#" onclick="popupShow('700','','popup_member_view');">myngsu</a></td>	
							<td>엘</td>
							<td>mskim11@naver.com</td>
							<td>일반성인</td>
							<td>07-20</td>
						</tr>
						<tr>
							<td>3</td>	
							<td>김명수</td>					
							<td><a href="#" onclick="popupShow('700','','popup_member_view');">myngsu</a></td>	
							<td>엘</td>
							<td>mskim11@naver.com</td>
							<td>일반성인</td>
							<td>07-20</td>
						</tr>
						<tr>
							<td>2</td>	
							<td>김명수</td>					
							<td><a href="#" onclick="popupShow('700','','popup_member_view');">myngsu</a></td>	
							<td>엘</td>
							<td>mskim11@naver.com</td>
							<td>일반성인</td>
							<td>07-20</td>
						</tr>
						<tr>
							<td>1</td>	
							<td>김명수</td>					
							<td><a href="#" onclick="popupShow('700','','popup_member_view');">myngsu</a></td>	
							<td>엘</td>
							<td>mskim11@naver.com</td>
							<td>일반성인</td>
							<td>07-20</td>
						</tr>		
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="col-xl-6 col-sm-12 placeholder text-center mb50">
		
			<div class="title_wrap">
				<h4 class="floatL">신규 팀 &nbsp;&nbsp;&nbsp;<a href="/mng/team/team_contest"><span style="text-align:right!important;"><u>공모전 팀 &nbsp;전체보러가기</u></span></a> &nbsp;&nbsp;&nbsp;<a href="/mng/team/team_socialissue"><span style="text-align:right!important;"><u>사회문제 팀 &nbsp;전체보러가기</u></span></a></h4>
			</div>

			<div class="tbl_list">
				<table class="list_tbl01" summary="">
					<caption>신규 팀 리스트 테이블</caption>
					<colgroup>
						<col style="width: 7%;" />
						<col style="width: 15%;" />			
						<col>
						<col style="width: 15%;" />	
						<col style="width: 10%;" />
						<col style="width: 10%;" />		
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>	
							<th scope="col">분류</th>				
							<th scope="col">제목</th>
							<th scope="col">팀명</th>	
							<th scope="col">등록자ID</th>					
							<th scope="col">등록일</th>				
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>5</td>	
							<td>공모전</td>					
							<td>제4회 아름드리 웹드라마 UCC공모전</td>	
							<td><a href="#" onclick="popupShow('700','','popup_team1_view');"><u>공모킬러팀</u></a></td>					
							<td>honggildong11</td>	
							<td>07-20</td>
						</tr>
						<tr>
							<td>4</td>	
							<td>공모전</td>					
							<td>제4회 아름드리 웹드라마 UCC공모전</td>	
							<td><a href="#" onclick="popupShow('700','','popup_team1_view');">공모킬러팀</a></td>				
							<td>honggildong11</td>	
							<td>07-20</td>
						</tr>
						<tr>
							<td>3</td>	
							<td>사회문제</td>					
							<td>서울 노인 복지프로그램 개발 프로젝트</td>	
							<td><a href="#" onclick="popupShow('700','','popup_team2_view');"><u>뉴스타터</u></a></td>					
							<td>xxyyzz12</td>	
							<td>07-20</td>
						</tr>
						<tr>
							<td>2</td>	
							<td>사회문제</td>					
							<td>서울 노인 복지프로그램 개발 프로젝트</td>	
							<td><a href="#" onclick="popupShow('700','','popup_team2_view');">뉴스타터</a></td>					
							<td>xxyyzz12</td>	
							<td>07-20</td>
						</tr>
						<tr>
							<td>1</td>	
							<td>사회문제</td>					
							<td>서울 노인 복지프로그램 개발 프로젝트</td>	
							<td><a href="#" onclick="popupShow('700','','popup_team2_view');">뉴스타터</a></td>					
							<td>xxyyzz12</td>	
							<td>07-20</td>
						</tr>		
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<hr>
	<div class="row mb-3 mb50">
		<div class="col-xl-6 col-sm-12 placeholder text-center mb50">
			<!-- 리스트  시작-->
			<div class="title_wrap">
				<h4 class="floatL">신규 공모전 &nbsp;&nbsp;&nbsp;<a href="/mng/project/contest"><span style="text-align:right!important;"><u>공모전 &nbsp;전체보러가기</u></span></a></h4>
			</div>

			<div class="tbl_list">
				<table class="list_tbl01" summary="">
					<caption>신규 공모전 리스트 테이블</caption>
					<colgroup>
						<col style="width: 7%;" />
						<col style="width: 15%;" />
						<col>
						<col style="width: 15%;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>	
							<th scope="col">카테고리명</th>
							<th scope="col">제목</th>
							<th scope="col">등록자ID</th>
							<th scope="col">마감일</th>
							<th scope="col">등록일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>5</td>	
							<td>기획/마케팅</td>
							<td><a href="#" onclick="popupShow('700','','popup_contest_view');"><u>산업통상부 아이디어 공모전</u></a></td>	
							<td>aabbcc12</td>
							<td>2019-09-22</td>
							<td>07-20</td>
						</tr>
						<tr>
							<td>4</td>	
							<td>기획/마케팅</td>
							<td><a href="#" onclick="popupShow('700','','popup_contest_view');">산업통상부 아이디어 공모전</a></td>	
							<td>aabbcc12</td>
							<td>2019-09-22</td>
							<td>07-20</td>
						</tr>
						<tr>
							<td>3</td>	
							<td>기획/마케팅</td>
							<td><a href="#" onclick="popupShow('700','','popup_contest_view');">산업통상부 아이디어 공모전</a></td>	
							<td>aabbcc12</td>
							<td>2019-09-22</td>
							<td>07-20</td>
						</tr>
						<tr>
							<td>2</td>	
							<td>기획/마케팅</td>
							<td><a href="#" onclick="popupShow('700','','popup_contest_view');">산업통상부 아이디어 공모전</a></td>	
							<td>aabbcc12</td>
							<td>2019-09-22</td>
							<td>07-20</td>
						</tr>
						<tr>
							<td>1</td>	
							<td>기획/마케팅</td>
							<td><a href="#" onclick="popupShow('700','','popup_contest_view');">산업통상부 아이디어 공모전</a></td>	
							<td>aabbcc12</td>
							<td>2019-09-22</td>
							<td>07-20</td>
						</tr>		
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-xl-6 col-sm-12 placeholder text-center mb50">
			<!-- 리스트  시작-->
			<div class="title_wrap">
				<h4 class="floatL">신규 사회문제 &nbsp;&nbsp;&nbsp;<a href="/mng/project/socialissue"><span style="text-align:right!important;"><u>사회문제 &nbsp;전체보러가기</u></span></a></h4>
			</div>

			<div class="tbl_list">
				<table class="list_tbl01" summary="">
					<caption>신규 사회문제 리스트 테이블</caption>
					<colgroup>
						<col style="width: 7%;" />
						<col style="width: 15%;" />			
						<col>
						<col style="width: 15%;" />	
						<col style="width: 15%;" />
						<col style="width: 10%;" />		
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>	
							<th scope="col">카테고리명</th>				
							<th scope="col">제목</th>
							<th scope="col">등록자ID</th>	
							<th scope="col">등록자명</th>					
							<th scope="col">등록일</th>				
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>5</td>	
							<td>사회약자</td>
							<td><a href="#" onclick="popupShow('700','','popup_socialissue_view');"><u>서울 노인 복지프로그램 개발 프로젝트</u></a></td>	
							<td>xxyyzz12</td>
							<td>2019-09-22</td>
							<td>07-20</td>
						</tr>
						<tr>
							<td>4</td>	
							<td>사회약자</td>
							<td><a href="#" onclick="popupShow('700','','popup_socialissue_view');">서울 노인 복지프로그램 개발 프로젝트</a></td>	
							<td>xxyyzz12</td>
							<td>2019-09-22</td>
							<td>07-20</td>
						</tr>
						<tr>
							<td>3</td>	
							<td>사회약자</td>
							<td><a href="#" onclick="popupShow('700','','popup_socialissue_view');">서울 노인 복지프로그램 개발 프로젝트</a></td>	
							<td>xxyyzz12</td>
							<td>2019-09-22</td>
							<td>07-20</td>
						</tr>
						<tr>
							<td>2</td>	
							<td>사회약자</td>
							<td><a href="#" onclick="popupShow('700','','popup_socialissue_view');">서울 노인 복지프로그램 개발 프로젝트</a></td>	
							<td>xxyyzz12</td>
							<td>2019-09-22</td>
							<td>07-20</td>
						</tr>
						<tr>
							<td>1</td>	
							<td>사회약자</td>
							<td><a href="#" onclick="popupShow('700','','popup_socialissue_view');">서울 노인 복지프로그램 개발 프로젝트</a></td>	
							<td>xxyyzz12</td>
							<td>2019-09-22</td>
							<td>07-20</td>
						</tr>		
					</tbody>
				</table>
			</div>
		</div>
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
			</div>
			<div class="dialog_content">
				<div class="scroll_area">
					<!-- Start 팝업 컨텐츠 -->
					<div class="tbl_view">
						<table class="view_tbl01" summary="">
							<caption>회원정보 상세보기 테이블</caption>
							<colgroup>
								<col style="width: 20%;" />
								<col style="width: 30%;" />
								<col style="width: 20%;" />							
								<col  />	
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">이메일</th>
									<td colspan="3">mskim11@naver.com</td>
								</tr>		
								<tr>
									<th scope="row">회원명</th>
									<td>김명수</td>				
									<th scope="row">닉네임</th>
									<td>엘</td>				
								</tr>
								<tr>
									<th scope="row">연락처</th>
									<td>010-1234-5678</td>
									<th scope="row">직업</th>
									<td>일반성인</td>
								</tr>								
								<tr>
									<th scope="row">가입방식</th>
									<td>페이스북</td>
									<th scope="row">등급</th>
									<td><img src="/resources/images/mng/level5.png" style="height:14px"></td>
								</tr>									
								<tr>
									<th scope="row">가입일</th>
									<td>2019-07-20</td>
									<th scope="row">최근 로그인</th>
									<td>2019-07-20 11:30</td>
								</tr>
								<tr>
									<th scope="row">승인여부</th>
									<td>
										<div class="designRadiobutton form-control-sm">
											<input type="radio" id="radio4_1" name="radio4" checked  />
											<label for="radio4_1" class="label_txt">Y</label>
										</div>
										<div class="designRadiobutton form-control-sm">
											<input type="radio" id="radio4_2" name="radio4" />
											<label for="radio4_2" class="label_txt">N</label>
										</div>
									</td>
									<th scope="row">승인정보</th>
									<td><input type="text"  class="form-control form-control-sm col-8" placeholder="예)승인거절 사유 작성" /></td>
								</tr>
								<tr>
									<th scope="row">비고</th>
									<td colspan="3"><textarea class="designTextarea form-control form-control-sm" name="ir1" style="width:100%; height:150px !important;" title="내용 입력"></textarea></td>
								</tr>								
							</tbody>
						</table>
					</div>
					<div class="btn_wrap">
						<a href="#" class="btn  btn-md btn-danger" data-action="popup_hide">저장</a>
						<a href="#" class="btn  btn-md btn-dark" data-action="popup_remove">취소</a>
					</div>				
					<!--// End 팝업 컨텐츠 -->
				</div><!--// End scroll_area -->
			</div><!--// End dialog_content -->
		</div><!--// End popup_inner -->
	</div><!--// End popup_layer -->
</div>

<!-- 팝업메뉴 -->
<div id="popup_team1_view" class="popup_wrap">
	<div class="popup_layer">
		<div class="popup_inner">
			<div class="popup_header">	
				<h1 class="title">팀 상세보기</h1>			
				<button class="btn btn_close_pop" data-action="popup_hide">닫기</button>
			</div>
			<div class="dialog_content">
				<div class="scroll_area">
					<!-- Start 팝업 컨텐츠 -->
					<div class="tbl_view">
						<table class="view_tbl01" summary="">
							<caption>팀 상세보기 테이블</caption>
							<colgroup>
								<col style="width: 20%;" />
								<col style="width: 30%;" />
								<col style="width: 20%;" />							
								<col  />	
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">팀명</th>
									<td>공모킬러팀</td>
									<th scope="row">팀장명</th>
									<td>홍길동</td>
								</tr>		
								<tr>
									<th scope="row">분류</th>
									<td>공모전</td>				
									<th scope="row">카테고리명</th>
									<td>기획/마케팅</td>				
								</tr>
								<tr>
									<th scope="row">등록자ID</th>
									<td>honggildong11</td>
									<th scope="row">등록일</th>
									<td>2019-07-20</td>
								</tr>
								<tr>
									<th scope="row">제목</th>
									<td colspan="3">제4회 아름드리 웹드라마 UCC공모전</td>
								</tr>
								<tr>
									<th scope="row">블라인드 여부</th>
									<td colspan="3">
										<div class="designRadiobutton form-control-sm">
											<input type="radio" id="radio4_1" name="radio4" checked  />
											<label for="radio4_1" class="label_txt">Y</label>
										</div>
										<div class="designRadiobutton form-control-sm">
											<input type="radio" id="radio4_2" name="radio4" />
											<label for="radio4_2" class="label_txt">N</label>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">비고</th>
									<td colspan="3"><textarea class="designTextarea form-control form-control-sm" name="ir1" style="width:100%; height:150px !important;" title="내용 입력"></textarea></td>
								</tr>								
							</tbody>
						</table>
					</div>
					<div class="btn_wrap">
						<a href="#" class="btn  btn-md btn-danger" data-action="popup_hide">저장</a>
						<a href="#" class="btn  btn-md btn-dark" data-action="popup_remove">취소</a>
					</div>				
					<!--// End 팝업 컨텐츠 -->
				</div><!--// End scroll_area -->
			</div><!--// End dialog_content -->
		</div><!--// End popup_inner -->
	</div><!--// End popup_layer -->
</div>

<!-- 팝업메뉴 -->
<div id="popup_team2_view" class="popup_wrap">
	<div class="popup_layer">
		<div class="popup_inner">
			<div class="popup_header">	
				<h1 class="title">팀 상세보기</h1>			
				<button class="btn btn_close_pop" data-action="popup_hide">닫기</button>
			</div>
			<div class="dialog_content">
				<div class="scroll_area">
					<!-- Start 팝업 컨텐츠 -->
					<div class="tbl_view">
						<table class="view_tbl01" summary="">
							<caption>팀 상세보기 테이블</caption>
							<colgroup>
								<col style="width: 20%;" />
								<col style="width: 30%;" />
								<col style="width: 20%;" />							
								<col  />	
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">팀명</th>
									<td>뉴스타터</td>
									<th scope="row">팀장명</th>
									<td>김철수</td>
								</tr>		
								<tr>
									<th scope="row">분류</th>
									<td>사회문제</td>				
									<th scope="row">카테고리명</th>
									<td>사회약자</td>				
								</tr>
								<tr>
									<th scope="row">등록자ID</th>
									<td>xxyyzz12</td>
									<th scope="row">등록일</th>
									<td>2019-07-20</td>
								</tr>
								<tr>
									<th scope="row">제목</th>
									<td colspan="3">서울 노인 복지프로그램 개발 프로젝트</td>
								</tr>
								<tr>
									<th scope="row">블라인드 여부</th>
									<td colspan="3">
										<div class="designRadiobutton form-control-sm">
											<input type="radio" id="radio4_1" name="radio4" checked  />
											<label for="radio4_1" class="label_txt">Y</label>
										</div>
										<div class="designRadiobutton form-control-sm">
											<input type="radio" id="radio4_2" name="radio4" />
											<label for="radio4_2" class="label_txt">N</label>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">비고</th>
									<td colspan="3"><textarea class="designTextarea form-control form-control-sm" name="ir1" style="width:100%; height:150px !important;" title="내용 입력"></textarea></td>
								</tr>								
							</tbody>
						</table>
					</div>
					<div class="btn_wrap">
						<a href="#" class="btn  btn-md btn-danger" data-action="popup_hide">저장</a>
						<a href="#" class="btn  btn-md btn-dark" data-action="popup_remove">취소</a>
					</div>				
					<!--// End 팝업 컨텐츠 -->
				</div><!--// End scroll_area -->
			</div><!--// End dialog_content -->
		</div><!--// End popup_inner -->
	</div><!--// End popup_layer -->
</div>

<!-- 팝업메뉴 -->
<div id="popup_contest_view" class="popup_wrap">
	<div class="popup_layer">
		<div class="popup_inner">
			<div class="popup_header">	
				<h1 class="title">공모전 상세보기</h1>			
				<button class="btn btn_close_pop" data-action="popup_hide">닫기</button>
			</div>
			<div class="dialog_content">
				<div class="scroll_area">
					<!-- Start 팝업 컨텐츠 -->
					<div class="tbl_view">
						<table class="view_tbl01" summary="">
							<caption>공모전 상세보기 테이블</caption>
							<colgroup>
								<col style="width: 20%;" />
								<col style="width: 30%;" />
								<col style="width: 20%;" />							
								<col  />	
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">제목</th>
									<td colspan="3">산업통상부 아이디어 공모전</td>
								</tr>		
								<tr>
									<th scope="row">카테고리명</th>
									<td>기획/마케팅</td>				
									<th scope="row">주최사</th>
									<td>산업통상부</td>				
								</tr>
								<tr>
									<th scope="row">등록자ID</th>
									<td>aabbcc12</td>
									<th scope="row">등록일</th>
									<td>2019-07-20</td>
								</tr>
								<tr>
									<th scope="row">시작일</th>
									<td>2019-07-22</td>
									<th scope="row">마감일</th>
									<td>2019-09-22</td>
								</tr>
								<tr>
									<th scope="row">승인여부</th>
									<td>
										<div class="designRadiobutton form-control-sm">
											<input type="radio" id="radio4_1" name="radio4" checked  />
											<label for="radio4_1" class="label_txt">Y</label>
										</div>
										<div class="designRadiobutton form-control-sm">
											<input type="radio" id="radio4_2" name="radio4" />
											<label for="radio4_2" class="label_txt">N</label>
										</div>
									</td>
									<th scope="row">승인정보</th>
									<td><input type="text"  class="form-control form-control-sm col-8" placeholder="예)승인거절 사유 작성" /></td>
								</tr>
								<tr>
									<th scope="row">비고</th>
									<td colspan="3"><textarea class="designTextarea form-control form-control-sm" name="ir1" style="width:100%; height:150px !important;" title="내용 입력"></textarea></td>
								</tr>								
							</tbody>
						</table>
					</div>
					<div class="btn_wrap">
						<a href="#" class="btn  btn-md btn-danger" data-action="popup_hide">저장</a>
						<a href="#" class="btn  btn-md btn-dark" data-action="popup_remove">취소</a>
					</div>				
					<!--// End 팝업 컨텐츠 -->
				</div><!--// End scroll_area -->
			</div><!--// End dialog_content -->
		</div><!--// End popup_inner -->
	</div><!--// End popup_layer -->
</div>

<!-- 팝업메뉴 -->
<div id="popup_socialissue_view" class="popup_wrap">
	<div class="popup_layer">
		<div class="popup_inner">
			<div class="popup_header">	
				<h1 class="title">사회문제 상세보기</h1>			
				<button class="btn btn_close_pop" data-action="popup_hide">닫기</button>
			</div>
			<div class="dialog_content">
				<div class="scroll_area">
					<!-- Start 팝업 컨텐츠 -->
					<div class="tbl_view">
						<table class="view_tbl01" summary="">
							<caption>사회문제 상세보기 테이블</caption>
							<colgroup>
								<col style="width: 20%;" />
								<col style="width: 30%;" />
								<col style="width: 20%;" />							
								<col  />	
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">제목</th>
									<td colspan="3">서울 노인 복지프로그램 개발 프로젝트</td>
								</tr>		
								<tr>
									<th scope="row">카테고리명</th>
									<td>사회약자</td>				
									<th scope="row">팀이름</th>
									<td>뉴스타터</td>				
								</tr>
								<tr>
									<th scope="row">등록자ID</th>
									<td>xxyyzz12</td>
									<th scope="row">등록일</th>
									<td>2019-07-20</td>
								</tr>
								<tr>
									<th scope="row">시작일</th>
									<td>2019-07-22</td>
									<th scope="row">마감일</th>
									<td>2019-09-22</td>
								</tr>
								<tr>
									<th scope="row">승인여부</th>
									<td>
										<div class="designRadiobutton form-control-sm">
											<input type="radio" id="radio4_1" name="radio4" checked  />
											<label for="radio4_1" class="label_txt">Y</label>
										</div>
										<div class="designRadiobutton form-control-sm">
											<input type="radio" id="radio4_2" name="radio4" />
											<label for="radio4_2" class="label_txt">N</label>
										</div>
									</td>
									<th scope="row">승인정보</th>
									<td><input type="text"  class="form-control form-control-sm col-8" placeholder="예)승인거절 사유 작성" /></td>
								</tr>
								<tr>
									<th scope="row">비고</th>
									<td colspan="3"><textarea class="designTextarea form-control form-control-sm" name="ir1" style="width:100%; height:150px !important;" title="내용 입력"></textarea></td>
								</tr>								
							</tbody>
						</table>
					</div>
					<div class="btn_wrap">
						<a href="#" class="btn  btn-md btn-danger" data-action="popup_hide">저장</a>
						<a href="#" class="btn  btn-md btn-dark" data-action="popup_remove">취소</a>
					</div>				
					<!--// End 팝업 컨텐츠 -->
				</div><!--// End scroll_area -->
			</div><!--// End dialog_content -->
		</div><!--// End popup_inner -->
	</div><!--// End popup_layer -->
</div>