<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<div class="title_wrap mt5">
	<h4 class="floatL">공지사항 상세보기</h4>		
</div>
	
<!-- 조회  시작-->				
<div class="tbl_view">
	<table class="view_tbl01" summary="">
		<caption>공지사항 관리 테이블</caption>
		<colgroup>
			<col style="width: 15%;" />
			<col  />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">제목</th>
				<td>[공지] 뉴스타터의 공지사항을 알려드립니다. </td>
			</tr>
			<tr>
				<th scope="row">구분</th>
				<td>공지사항</td>
			</tr>
			<tr>
				<th scope="row">등록자ID</th>
				<td>admin2</td>
			</tr>
			<tr>
				<th scope="row">등록일</th>
				<td>2019-07-22</td>
			</tr>
			<tr>
				<th scope="row">공개여부</th>
				<td>공개</td>
			</tr>			
			<tr>
				<th scope="row">내용</th>
				<td colspan="3">본문 내용 입력 공간</td>
			</tr>		
		</tbody>
	</table>
</div>

<div class="btn_wrap">
	<a href="./notice" class="btn  btn-md btn-dark">목록</a>
	<a href="./notice_edit" class="btn btn-md btn_key_color">수정</a>
	<a href="./notice" class="btn btn-md btn-outline-dark">취소</a>
	<a href="#" class="btn btn-md btn-danger" style="background-color: #706e6d; color: #fff" onclick="alertShow('300','','alert_del');">삭제</a>	
</div>

<!-- 조회 끝 -->	

<!-- 데이타 삭제 -->
<div id="alert_del" class="alert_wrap">
	<div class="alert_layer">
		<div class="alert_inner">
			<div class="alert_header">
				<button class="btn btn_close_pop" data-action="popup_hide">X</button>
			</div>				
			<div class="dialog_content">
				<div class="scroll_area">
					<!-- Start 팝업 컨텐츠 -->

					<div class="alert_msg_area">
						<div class="alert_msg">
							삭제하시겠습니까?
						</div>
					</div>

					<div class="btn_wrap">
						<button type="button" onclick="location.href='./notice'" class="btn  btn-md btn-dark" data-action="popup_hide">확인</button>					
						<button type="button" class="btn  btn-md btn-outline-dark" data-action="popup_hide">취소</button>
					</div>

					<!--// End 팝업 컨텐츠 -->
				</div>
			</div>
		</div>
	</div>
</div>
