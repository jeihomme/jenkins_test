<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
	

<style type="text/css">
/* .fileArea { margin-left:10px; margin-bottom:10px; } */
.fileList { background-color:#fcf3ec; border-radius:5px;padding: 7px; display:none; }
.fileList div { font-size:12px; line-height: 20px; }
.fileList span.close { font-size:11px; color:red; cursor:pointer; padding-top: 4.1px; padding-left: 5px;}
	.chkbutton{
		    position: relative;
		    display: inline-block;
		    float: right;
		    width: 18%;
		    margin-left: 2%;
		    
		    
		    height: 30px;
		    border-radius: 3px;
		    background-color: #fff;
		    border: 1px solid #848484;
		    color: #848484;
		    vertical-align: middle;
		    font-size: 13px;
		    cursor: pointer;
		    word-break: keep-all;
	}
</style>

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
				<th scope="col">제목</th>
				<td>${out.detail.data[0].NOTI_TITL}</td>
			</tr>
			<tr>
				<th scope="col">공지여부</th>
				<td>${out.detail.data[0].NOTI_OPEN_YN}</td>
			</tr>
			<tr>
				<th scope="col">공개여부</th>
				<td>${out.detail.data[0].NOTI_USE_YN}</td>
			</tr>
			<tr>
				<th scope="col">첨부파일</th>
				<td>
					<input type="hidden" name="unitUuid" value="${out.detail.data[0].NOTI_UUID}"/>
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
				<td>${out.detail.data[0].NOTI_CNTN}</td>
			</tr>
			<tr>
				<th scope="col">등록자</th>
				<td>${out.detail.data[0].SYS_REG_IDX}</td>
			</tr>
			<tr>
				<th scope="col">등록일</th>
				<td>${out.detail.data[0].SYS_REG_DTM}</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="btn_wrap">
	<a href="${ unit.move('index', '') }" class="btn btn-md btn-outline-dark">목록</a>
	<a href="${ unit.move('edit', out.detail.data[0].NOTI_IDX , 'mng' ) }" class="btn btn-md btn_key_color">수정</a>
</div>

<!-- 조회 끝 -->	
<script>
setUuid( $('[name=unitUuid]').val() );
imgIdValue = "NOTI_UUID_FILE";
unit_fileGet( imgIdValue, "fn_fileUpload");

</script>


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
