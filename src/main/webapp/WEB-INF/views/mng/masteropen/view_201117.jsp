<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'index', 'ajax')}" />

 
<style>
.infoView{ border: 1px solid #222; margin-bottom: 10px; }
.infoView > div{padding: 5px; position: relative;}
.gnb_box { margin-bottom: 0; }
.gnb_list>li {width: 50%!important;}
.gnb_list>li.active { background-color: #a2a2a2; }
.note-toolbar {background-color: #fff!important; border: none!important;}
.panel-default{flex: 0 0 91.666667%;   max-width: 91.666667%;}
.tool_box{position: absolute; top: 50%; right: 2.5%;}
</style>

<!-- 조회  시작-->				
<div class="tbl_view" style="margin-bottom: 20px;">
	<table class="view_tbl01" summary="">
		<colgroup>
			<col style="width: 15%;" />
			<col  />
			<col style="width: 15%;" />
			<col  />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">이름</th>
				<td id="USER_NM"></td>
				<th scope="row">계정</th>
				<td id="USER_EMAIL"></td>
			</tr>
			<tr>
				<th scope="row">가입일</th>
				<td id="SYS_REG_DTM"></td>
				<th scope="row">마스터등록일</th>
				<td id="USER_MAST_JOIN_DTM"></td>
			</tr>
			<tr>
				<th scope="row">최근로그인</th>
				<td id="USER_LOGIN_DTM"></td>
				<th scope="row">최근상담일</th>
				<td id="USER_CONS_DTM"></td>
			</tr>
		</tbody>
	</table>
</div>	


<div class="gnb_box">
                <ul class="gnb_list">
                    <li class="active">
                      <a href="${unit.url('/mng/member/index', 'view', out.detail.data[0].USER_IDX, 'user' ) }">
                            소개영역
                      </a>
                    </li>
                    <li>
                      <a href="${unit.url('/mng/member/index', 'index', out.detail.data[0].USER_IDX, 'user' ) }">
                            판매 상품 영역
                      </a>
                    </li>
                </ul>
</div>

<div class="btn_wrap" style="text-align: right;">
	<a href="" class="btn  btn-md btn-outline-dark">페이지 미리 보기</a>
</div>

<div id="masteropenList" style="position: relative; overflow-y: auto;">
	
			<div class="infoView TITL" >
				<div>
					<h3 class="handle">여기를 드래그하면 움직입니다.</h3>
<!-- 					<div class="form-inline"> -->
						<select id="INFO_CD" name="INFO_CD" class="form-control form-control-sm col-8">
						</select>
<!-- 					</div>		 -->
					<input name="TITL_CNTN" placeholder="제목을 입력하세요" class=" form-control form-control-sm col-11">
					<textarea  name="CNTN_CNTN" placeholder="내용을 입력하세요" class=" form-control form-control-sm col-11"></textarea>
						<div class="fileArea">				
							<input type="file" id="DATA_UUID_FILE1" name="DATA_UUID_FILE1" style="display:none;margin-left:0px;" multiple maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" 
									maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."
									maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."
									totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."
									onclick="imgIdValue = $(this).attr('id');"
							/>	
							<label class="btn btn-sm btn-outline-secondary" for="DATA_UUID_FILE1" >파일선택</label>
								<span class="file_possible" style="color:red !important;">( 이미지 파일만 )</span>							 
							<div class="fileList" id="DATA_UUID_FILE1List"></div>
							<input id="DATA_UUID1" name="DATA_UUID1" type="hidden" />
							<div id="DATA_UUID_FILE1ListClone" style="display:none;">
							<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>
							</div>											
						</div>
					<div class="tool_box">
						<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span>
						<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span>
					</div>
				</div>
			</div>
			
<!-- 			<div class="infoView CNTN" > -->
<!-- 				<div> -->
<!-- 					<h3 class="handle">본문</h3> -->
<!-- 					<textarea  name="CNTN_CNTN" placeholder="내용을 입력하세요" class=" form-control form-control-sm col-11"></textarea> -->
<!-- 					<div class="tool_box"> -->
<!-- 						<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span> -->
<!-- 						<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="infoView RECO" > -->
<!-- 				<div> -->
<!-- 					<h3 class="handle">추천대상</h3> -->
<!-- 					<div class="col-11" style="padding: 0; display: flex;"> -->
<!-- 						<div class="fileArea">				 -->
<!-- 											<input type="file" id="DATA_UUID_FILE1" name="DATA_UUID_FILE1" style="display:none;margin-left:0px;" multiple maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload"  -->
<!-- 													maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다." -->
<!-- 													maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다." -->
<!-- 													totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다." -->
<!-- 													onclick="imgIdValue = $(this).attr('id');" -->
<!-- 											/>	 -->
<!-- 											<label class="btn btn-sm btn-outline-secondary" for="DATA_UUID_FILE1" >파일선택</label> -->
<!-- 											<div class="fileList" id="DATA_UUID_FILE1List"></div> -->
<!-- 											<input id="DATA_UUID1" name="DATA_UUID1" type="hidden" /> -->
<!-- 											<div id="DATA_UUID_FILE1ListClone" style="display:none;"> -->
<!-- 											<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div> -->
<!-- 											</div>											 -->
<!-- 						</div> -->
<!-- 						<input name="RECO_CNTN" placeholder="내용을 입력하세요" class="form-control form-control-sm col-8"> -->
<!-- 					</div> -->
					
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="infoView CONS" > -->
<!-- 				<div> -->
<!-- 					<h3 class="handle">상담진행</h3> -->
<!-- 					<div class="col-11" style="padding: 0; display: flex;"> -->
<!-- 						<div class="fileArea">				 -->
<!-- 											<input type="file" id="DATA_UUID_FILE1" name="DATA_UUID_FILE1" style="display:none;margin-left:0px;" multiple maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload"  -->
<!-- 													maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다." -->
<!-- 													maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다." -->
<!-- 													totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다." -->
<!-- 													onclick="imgIdValue = $(this).attr('id');" -->
<!-- 											/>	 -->
<!-- 											<label class="btn btn-sm btn-outline-secondary" for="DATA_UUID_FILE1" >파일선택</label> -->
<!-- 											<div class="fileList" id="DATA_UUID_FILE1List"></div> -->
<!-- 											<input id="DATA_UUID1" name="DATA_UUID1" type="hidden" /> -->
<!-- 											<div id="DATA_UUID_FILE1ListClone" style="display:none;"> -->
<!-- 											<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div> -->
<!-- 											</div>											 -->
<!-- 						</div> -->
<!-- 						<input name="CONS_CNTN" placeholder="내용을 입력하세요" class="form-control form-control-sm col-8"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="infoView USES" > -->
<!-- 				<div> -->
<!-- 					<h3 class="handle">활용법</h3> -->
<!-- 					<div class="col-11" style="padding: 0; display: flex;"> -->
<!-- 						<div class="fileArea">				 -->
<!-- 											<input type="file" id="DATA_UUID_FILE1" name="DATA_UUID_FILE1" style="display:none;margin-left:0px;" multiple maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload"  -->
<!-- 													maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다." -->
<!-- 													maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다." -->
<!-- 													totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다." -->
<!-- 													onclick="imgIdValue = $(this).attr('id');" -->
<!-- 											/>	 -->
<!-- 											<label class="btn btn-sm btn-outline-secondary" for="DATA_UUID_FILE1" >파일선택</label> -->
<!-- 											<div class="fileList" id="DATA_UUID_FILE1List"></div> -->
<!-- 											<input id="DATA_UUID1" name="DATA_UUID1" type="hidden" /> -->
<!-- 											<div id="DATA_UUID_FILE1ListClone" style="display:none;"> -->
<!-- 											<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div> -->
<!-- 											</div>											 -->
<!-- 						</div> -->
<!-- 						<input name="USES_CNTN" placeholder="내용을 입력하세요" class="form-control form-control-sm col-8"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="infoView FREE" > -->
<!-- 				<div class="handle"> -->
<!-- 					<input name="FREE_TITL" placeholder="직접 입력" class="mb10 form-control form-control-sm col-11 "> -->
<!-- 					<div class="col-11" style="padding: 0; display: flex;"> -->
<!-- 						<div class="fileArea">				 -->
<!-- 											<input type="file" id="DATA_UUID_FILE1" name="DATA_UUID_FILE1" style="display:none;margin-left:0px;" multiple maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload"  -->
<!-- 													maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다." -->
<!-- 													maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다." -->
<!-- 													totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다." -->
<!-- 													onclick="imgIdValue = $(this).attr('id');" -->
<!-- 											/>	 -->
<!-- 											<label class="btn btn-sm btn-outline-secondary" for="DATA_UUID_FILE1" >파일선택</label> -->
<!-- 											<div class="fileList" id="DATA_UUID_FILE1List"></div> -->
<!-- 											<input id="DATA_UUID1" name="DATA_UUID1" type="hidden" /> -->
<!-- 											<div id="DATA_UUID_FILE1ListClone" style="display:none;"> -->
<!-- 											<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div> -->
<!-- 											</div>											 -->
<!-- 						</div> -->
<!-- 						<input name="FREE_CNTN" placeholder="내용을 입력하세요" class="form-control form-control-sm col-8"> -->
<!-- 					</div> -->
<!-- 					<div class="tool_box"> -->
<!-- 						<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span> -->
<!-- 						<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="infoView HIGH" > -->
<!-- 				<div> -->
<!-- 					<h3 class="handle">하이라이트 영상</h3> -->
<!-- 					<select name="HIGH_PLAYER" style="display: inline-block;" class="form-control form-control-sm col-2"> -->
<!-- 						<option value="">플레이어 선택</option> -->
<!-- 						<option value="YouTube">YouTube</option> -->
<!-- 						<option value="NaverTv">NaverTv</option> -->
<!-- 					</select> -->
<!-- 					<input name="HIGH_CNTN" style="display: inline-block;" placeholder="내용을 입력하세요" class=" form-control form-control-sm col-9"> -->
<!-- 					<div class="tool_box"> -->
<!-- 						<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span> -->
<!-- 						<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="infoView CURR" > -->
<!-- 				<div> -->
<!-- 					<h3 class="handle">커리큘럼</h3> -->
<!-- 					<input name="CURR_CNTN" placeholder="상품코드를 입력하세요( , 로 구분)" class=" form-control form-control-sm col-11"> -->
<!-- 					<div class="tool_box"> -->
<!-- 						<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span> -->
<!-- 						<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->


</div>

<div class="btn_wrap" style="text-align: right;">
	<a href="${ unit.move('index', '') }" class="btn btn-md btn-outline-dark">목록</a>
	<a onclick="fn_BtnRegist();" class="btn btn-md btn_key_color">저장</a>
</div>

<!-- 조회 끝 -->	
<script>
// setUuid( $('[name=unitUuid]').val() );
// imgIdValue = "NOTI_UUID_FILE";
// unit_fileGet( imgIdValue, "fn_fileUpload");
$(function(){

	fn_SelectOption("","INF","INFO_CD");

	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectMngMasterDetail";
	params.cateIdx = '${out.params.cateIdx }';
	fn_DataDetail( params );
	
	var params = new Object();
	params.status = "LIST";
	params.query = "selectMngMasteropenDetail";
	params.cateIdx = '${out.params.cateIdx }';
	fn_DataDetail2( params );
	
	fn_summernoteMasterOpen();
	
	// 드래그로 위치바꾸기
	$("#masteropenList").sortable({
		handle: ".handle",
		cursor:"move",
		axis:"y", //x축은 가로 y축은 세로
		stop: function( event , ui ){
			fn_summernoteMasterOpen();
		}
	});
});

function fn_summernoteMasterOpen(){
	$('[name=CNTN_CNTN]').summernote({
		height: 300,                 // 에디터 높이
		minHeight: null,             // 최소 높이
		maxHeight: null,             // 최대 높이
		focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		placeholder: '내용을 입력해주세요.',	//placeholder 설정
		defaultFontName: '돋음체',
		toolbar: [
		    // [groupName, [list of button]]
		    ['fontsize', ['fontsize']],
		    ['style', ['bold', 'italic', 'clear']],
		    ['color', ['forecolor','color']],
		    ['height', ['height']],
		    ['insert',['link','video']],
 		    ['view', ['codeview']]
			],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
	});
}

$(document).on("click", '.del_infoView', function(){
	var copy = $(this).closest('div.infoView');	
	
	var cClass = copy.attr('class').replace('infoView', '').replace(/ /g,'.');
	
	if (($('div'+cClass).length) > 1) {
		copy.remove();
	}
	
});

$(document).on("click",'.add_infoView',function(){
	var copy = $(this).closest('div.infoView');	
	
	var html = "";
	var isc = false;
	if( copy.attr('class').indexOf('CNTN') > -1 ){
		isc = true;
		html += "<div class='"+copy.attr('class')+"'>";
		html += '<div>';
		html += '	<h3 class="handle">본문</h3>';
		html += '	<textarea  name="CNTN_CNTN" placeholder="내용을 입력하세요" class=" form-control form-control-sm col-11"></textarea>';
		html += '	<div class="tool_box">';
		html += '		<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span>';
		html += '		<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span>';
		html += '	</div>';
		html += '</div>	';
		html += "</div>";
	}else{
		html += "<div class='"+copy.attr('class')+"'>";
		html += copy.html();
		html += "</div>";
	}
	copy.after(html);
	
	if (isc) fn_summernoteMasterOpen();
});


function fn_BtnRegist(){
	
	var isc = false;
	var messege = "";
	
	$('#masteropenList div.infoView').each(function(k){
		var targetClass = $(this).attr('class').replace('infoView','').trim();
		var params = new Object();
		params.status = "DELETE";
		params.cateIdx = '${out.params.cateIdx }';
		params.query = "deleteMngMasteropenData";
		params.tab = targetClass;
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		fn_DataAjax( params );
		
		var params = new Object();
		params.status = "WRITE";
		params.cateIdx = '${out.params.cateIdx }';
		params.query = "insertMngMasteropen"+targetClass;
		params.cntn = $(this).find('[name*="CNTN"]').val();
// 		params.cntn = $(this).html();
		if ( targetClass == 'FREE' ) {
			params.titl = $(this).find('[name=FREE_TITL]').val(); 
		}
		if ( targetClass == 'FREE' || targetClass == 'USES' || targetClass == 'RECO' || targetClass == 'CONS' ) {
			params.uuid = $(this).find('[name*=UUID]').val(); 
		}
		if ( targetClass == 'HIGH' ) {
			params.player = $(this).find('[name=HIGH_PLAYER]').val(); 
		}

		params.orde = k;
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		
		fn_DataAjax( params );
		
	});
	
	
	
	if ( isc ) {	return alert( messege );	}
	
	location.href = "${unit.move('index','')}";
	
	
}

//재정의
function fn_DataDetail2( PARAMS ) {
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result.out.detail.data;
	var jsonDataConvert = jsonData;
	
// 	console.log( result );
// 	console.log( jsonDataConvert );
	if ( jsonDataConvert.length ) {
		$('#masteropenList').empty();
	}
	$.each(jsonDataConvert ,function(key, val) {
		console.log( jsonDataConvert[key].TAB );
		var html = "";
		if ( jsonDataConvert[key].TAB  == "TITL" ) {
			html += '<div class="infoView TITL" >';
			html += '	<div>';
			html += '		<h3 class="handle">제목</h3>';
			html += '		<input name="TITL_CNTN" value="'+jsonDataConvert[key].CNTN+'" placeholder="내용을 입력하세요" class=" form-control form-control-sm col-11">';
			html += '		<div class="tool_box">';
			html += '			<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span>';
			html += '			<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span>';
			html += '		</div>';
			html += '	</div>';
			html += '</div>';
			$('#masteropenList').append( html );
			
		}else if ( jsonDataConvert[key].TAB == 'CNTN'  ) {
			html += '<div class="infoView CNTN" >';
			html += '<div>';
			html += '	<h3 class="handle">본문</h3>'; 
			html += '	<textarea  name="CNTN_CNTN"  placeholder="내용을 입력하세요" class=" form-control form-control-sm col-11">'+jsonDataConvert[key].CNTN+'</textarea>';       
			html += '	<div class="tool_box">';
			html += '		<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span>';
			html += '		<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span>';
			html += '	</div>';
			html += '</div>';
			html += '</div>';
			$('#masteropenList').append( html );
			
			fn_summernoteMasterOpen();
			
		}else if ( jsonDataConvert[key].TAB == 'CONS'  ) {
			
			html += '<div class="infoView CONS" >';
			html += '	<div>';
			html += '		<h3 class="handle">상담진행</h3>';
			html += '		<div class="col-11" style="padding: 0; display: flex;">';
			html += '			<div class="fileArea">				';
			html += '								<input type="file" id="DATA_UUID_FILE1" name="DATA_UUID_FILE1" style="display:none;margin-left:0px;" multiple maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload"'; 
			html += '										maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."';
			html += '										maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."';
			html += '										totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."';
			html += '										onclick="imgIdValue = $(this).attr(\'id\');"';
			html += '								/>	';
			html += '								<label class="btn btn-sm btn-outline-secondary" for="DATA_UUID_FILE1" >파일선택</label>';
			html += '								<div class="fileList" id="DATA_UUID_FILE1List"></div>';
			html += '								<input id="DATA_UUID1" name="DATA_UUID1" type="hidden" />';
			html += '								<div id="DATA_UUID_FILE1ListClone" style="display:none;">';
			html += '								<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>';
			html += '								</div>											';
			html += '			</div>';
			html += '			<input name="CONS_CNTN" value="'+jsonDataConvert[key].CNTN+'" placeholder="내용을 입력하세요" class="form-control form-control-sm col-8">';
			html += '		</div>';
			html += '	</div>';
			html += '</div>';
			$('#masteropenList').append( html );
				
		}else if ( jsonDataConvert[key].TAB == 'CURR'  ) {
			
			html += '<div class="infoView CURR" >';
			html += '	<div>';
			html += '		<h3 class="handle">커리큘럼</h3>';
			html += '		<input name="CURR_CNTN" value="'+jsonDataConvert[key].CNTN+'" placeholder="상품코드를 입력하세요( , 로 구분)" class=" form-control form-control-sm col-11">';
			html += '		<div class="tool_box">';
			html += '			<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span>';
			html += '			<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span>';
			html += '		</div>';
			html += '	</div>';
			html += '</div>';
			$('#masteropenList').append( html );
			
		}else if ( jsonDataConvert[key].TAB == 'FREE'  ) {
			
			html += '	<div class="infoView FREE" >';
			html += '		<div class="handle">';
			html += '			<input name="FREE_TITL" value="'+jsonDataConvert[key].TITL+'" placeholder="직접 입력" class="mb10 form-control form-control-sm col-11 ">';
			html += '			<div class="col-11" style="padding: 0; display: flex;">';
			html += '				<div class="fileArea">				';
			html += '									<input type="file" id="DATA_UUID_FILE1" name="DATA_UUID_FILE1" style="display:none;margin-left:0px;" multiple maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload"'; 
			html += '											maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."';
			html += '											maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."';
			html += '											totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."';
			html += '											onclick="imgIdValue = $(this).attr(\'id\');"';
			html += '									/>	';
			html += '									<label class="btn btn-sm btn-outline-secondary" for="DATA_UUID_FILE1" >파일선택</label>';
			html += '									<div class="fileList" id="DATA_UUID_FILE1List"></div>';
			html += '									<input id="DATA_UUID1" name="DATA_UUID1" type="hidden" />';
			html += '									<div id="DATA_UUID_FILE1ListClone" style="display:none;">';
			html += '									<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>';
			html += '									</div>											';
			html += '				</div>';
			html += '				<input name="FREE_CNTN" value="'+jsonDataConvert[key].CNTN+'" placeholder="내용을 입력하세요" class="form-control form-control-sm col-8">';
			html += '			</div>';
			html += '			<div class="tool_box">';
			html += '				<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span>';
			html += '				<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span>';
			html += '			</div>';
			html += '		</div>';
			html += '	</div>';
			$('#masteropenList').append( html );
			
		}else if ( jsonDataConvert[key].TAB == 'HIGH'  ) {
			var selected = "";
			html += '<div class="infoView HIGH" >';
			html += '	<div>';
			html += '		<h3 class="handle">하이라이트 영상</h3>';
			html += '		<select name="HIGH_PLAYER" style="display: inline-block;" class="form-control form-control-sm col-2">';
			html += '			<option value="">플레이어 선택</option>';
			
			if (jsonDataConvert[key].TITL == 'YouTube') {
				html += '			<option value="YouTube" selected >YouTube</option>';
			}else{
				html += '			<option value="YouTube">YouTube</option>';
			}

			if (jsonDataConvert[key].TITL == 'NaverTv') {
				html += '			<option value="NaverTv">NaverTv</option>';
			}else{
				html += '			<option value="NaverTv">NaverTv</option>';
			}
			
			html += '		</select>';
			html += '		<input name="HIGH_CNTN"  value="'+jsonDataConvert[key].CNTN+'"  style="display: inline-block;" placeholder="내용을 입력하세요" class=" form-control form-control-sm col-9">';
			html += '		<div class="tool_box">';
			html += '			<span class="del_infoView" ><img style="margin-right:10px;" alt="" src="/resources/images/common/garbagecan.png"></span>';
			html += '			<span class="add_infoView" ><img alt="" src="/resources/images/common/plus.png"></span>';
			html += '		</div>';
			html += '	</div>';
			html += '</div>';
			$('#masteropenList').append( html );
			
		}else if ( jsonDataConvert[key].TAB == 'RECO'  ) {
			
			html += '<div class="infoView RECO" >';
			html += '	<div>';
			html += '		<h3 class="handle">추천대상</h3>';
			html += '		<div class="col-11" style="padding: 0; display: flex;">';
			html += '			<div class="fileArea">';
			html += '								<input type="file" id="DATA_UUID_FILE1" name="DATA_UUID_FILE1" style="display:none;margin-left:0px;" multiple maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" ';
			html += '										maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."';
			html += '										maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."';
			html += '										totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."';
			html += '										onclick="imgIdValue = $(this).attr(\'id\');"';
			html += '								/>	';
			html += '								<label class="btn btn-sm btn-outline-secondary" for="DATA_UUID_FILE1" >파일선택</label>';
			html += '								<div class="fileList" id="DATA_UUID_FILE1List"></div>';
			html += '								<input id="DATA_UUID1" name="DATA_UUID1" type="hidden" />';
			html += '								<div id="DATA_UUID_FILE1ListClone" style="display:none;">';
			html += '								<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>';
			html += '								</div>';
			html += '			</div>';
			html += '			<input  value="'+jsonDataConvert[key].CNTN+'" name="RECO_CNTN" placeholder="내용을 입력하세요" class="form-control form-control-sm col-8">';
			html += '		</div>';
			html += '	</div>';
			html += '</div>';
			$('#masteropenList').append( html );
			
		}else if ( jsonDataConvert[key].TAB == 'USES'  ) {
			
			html += '<div class="infoView USES" >';
			html += '	<div>';
			html += '		<h3 class="handle">활용법</h3>';
			html += '		<div class="col-11" style="padding: 0; display: flex;">';
			html += '			<div class="fileArea">				';
			html += '								<input type="file" id="DATA_UUID_FILE1" name="DATA_UUID_FILE1" style="display:none;margin-left:0px;" multiple maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" ';
			html += '										maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."';
			html += '										maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."';
			html += '										totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."';
			html += '										onclick="imgIdValue = $(this).attr(\'id\');"';
			html += '								/>	';
			html += '								<label class="btn btn-sm btn-outline-secondary" for="DATA_UUID_FILE1" >파일선택</label>';
			html += '								<div class="fileList" id="DATA_UUID_FILE1List"></div>';
			html += '								<input id="DATA_UUID1" name="DATA_UUID1" type="hidden" />';
			html += '								<div id="DATA_UUID_FILE1ListClone" style="display:none;">';
			html += '								<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>';
			html += '								</div>											';
			html += '			</div>';
			html += '			<input name="USES_CNTN"  value="'+jsonDataConvert[key].CNTN+'"  placeholder="내용을 입력하세요" class="form-control form-control-sm col-8">';
			html += '		</div>';
			html += '	</div>';
			html += '</div>';
			$('#masteropenList').append( html );
			
		}
		
		
	});
	
	
	
}

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
