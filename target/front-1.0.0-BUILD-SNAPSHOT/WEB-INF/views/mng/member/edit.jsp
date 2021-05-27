<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<div class="title_wrap mt5">
			
</div>
	
<!-- 수정  시작-->				
<div class="tbl_view">
	<table class="view_tbl01" summary="">
		<caption>공지사항 관리 테이블</caption>
		<colgroup>
			<col style="width: 15%;"/>
			<col/>
			<col style="width: 15%;"/>
			<col style="width: 7%;"/>
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">제목</th>
				<td>
					<div class="form-inline">
						<input type="text" name="ntcTitle" class="form-control form-control-sm col-8" value="뉴스타터의 공지사항을 알려드립니다." title="제목 입력" />
						<div class="designCheckbox form-control-sm ml20">
							<input type="checkbox" id="checkbox0" name="checkbox" />
							<label for="checkbox0" class="label_txt">공지</label>
						</div>
					</div>				
				</td>
			</tr>
			<tr>
				<th scope="row">구분</th>
				<td>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio1_1" name="radio1" checked  />
						<label for="radio1_1" class="label_txt">공지사항</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio1_2" name="radio1" />
						<label for="radio1_2" class="label_txt">이벤트</label>
					</div>				
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio1_3" name="radio1" />
						<label for="radio1_3" class="label_txt">보도자료</label>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">등록일</th>
				<td>
					<div class="form-inline">
						<input type="text"class="form-control form-control-sm datepicker col-2"value="2019-07-22" title="등록일" readonly="disabled"  />
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">공개여부</th>
				<td>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio2_1" name="radio2" checked  />
						<label for="radio2_1" class="label_txt">공개</label>
					</div>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio2_2" name="radio2" />
						<label for="radio2_2" class="label_txt">비공개</label>
					</div>				
				</td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td>
					<textarea class="designTextarea form-control form-control-sm" name="ir1" id="ir1" style="width:100%; height:300px !important;" title="내용 입력"></textarea>
				</td>
			</tr>					
		</tbody>
	</table>
</div>

<div class="btn_wrap">
	<a href="./notice" class="btn btn-md btn-dark">목록</a>
	<a onclick="fn_BtnSave()" class="btn btn-md btn-danger">저장</a>
	<a href="./notice" class="btn btn-md btn-outline-dark">취소</a>
	<a href="#" class="btn btn-md" style="background-color: #706e6d; color: #fff" onclick="alertShow('300','','alert_del');">삭제</a>	
</div>

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

<!-- 수정 끝 -->
<!--네이버 스마트에디터 2.0 스크립트-->
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<!--스마트에디터 2.0 적용 스크립트-->
<script type="text/javascript">
var oEditors = [];
$(function(){
    nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "/resources/se2/SmartEditor2Skin",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });    
});

	function fn_BtnSave() {
	
	// 	1. 유효성 검사를 위한 파라미터값
// 		var params = params = unit_getParams("section");
		var params = new Object();
		params.ntcTitle = $('[name=ntcTitle]').val();
		
	//	2. 유효성 검사 서비스로 이동
		var result = ${unit.ajax("notice_edit", "params")};
		
		if ( unit_isComplete(result) ){
// 			location.href='${unit.move("notice_write", "")}';
			location.href='/mng/customer/notice';
		} else {
			alert("제목을 입력해주세요.");
		}
	}
</script>