<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

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
				<th scope="col">구분</th>
				<td id=NOTI_CDNM></td>
			</tr>
			<tr>
				<th scope="col">제목</th>
				<td id="NOTI_TITL"></td>
			</tr>
			<tr>
				<th scope="col">공지여부</th>
				<td id="NOTI_OPEN_YN"></td>
			</tr>
			<tr>
				<th scope="col">공개여부</th>
				<td id="NOTI_USE_YN"></td>
			</tr>
			<tr>
				<th scope="col">첨부파일</th>
				<td>
					<input type="hidden" id="NOTI_UUID" name="NOTI_UUID" />
					<div class="fileArea">
						<label for="NOTI_UUID_FILE"></label>							
						<div class="fileList" id="NOTI_UUID_FILEList"></div>
						<div id="NOTI_UUID_FILEListClone" style="display:none;">
						<div><span class="fileName"></span> (<span class="fileSize"></span> MB)</div>
						</div>											
					</div>
				</td>
			</tr>
			<tr>
				<th scope="col">내용</th>
				<td id="NOTI_CNTN"></td>
			</tr>
			<tr>
				<th scope="col">등록자</th>
				<td id="SYS_REG_NM"></td>
			</tr>
			<tr>
				<th scope="col">등록일</th>
				<td id="SYS_REG_DTM"></td>
			</tr>
		</tbody>
	</table>
</div>

<div class="btn_wrap">
	<a href="${ unit.move('index', '') }" class="btn btn-md btn-outline-dark">목록</a>
	<a href="${ unit.move('edit', out.params.notiIdx , 'noti' ) }" class="btn btn-md btn_key_color">수정</a>
</div>

<!-- 조회 끝 -->	
<script type="text/javascript">

$(function(){

	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectMngNotiDetail";
	params.notiIdx = '${out.params.notiIdx }';
	fn_DataDetail( params );
});

</script>
