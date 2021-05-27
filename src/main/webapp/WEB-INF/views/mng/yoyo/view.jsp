<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*, java.text.*"  %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
	
<%
	String userId = request.getParameter("userId");
	if(userId == null){
		userId = "free-"+request.getRemoteAddr();
	}
	
%>
<%! 
	// http://210.113.36.169:1935/vodservice/_definst_/test/13.mp4/playlist.m3u8 의 재생주소의 uri는 test/13.mp4 입니다.
	// user id와 uri 부분만 token으로 묶어서 open_fiveplayer 스크립트를 사용하여 전달하시면 됩니다. run_keeper 값은 1이어야 합니다.
	public String makeFiveplayerToken(HttpServletRequest request, String userid, String uri, String run_keeper){
		System.out.println( uri + "  :sssss sss" );
		String ip = request.getRemoteAddr();					//user-ip
		String agent = request.getHeader("User-Agent");	//user-agent
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date nowDate = new java.util.Date();
		String now	= sf.format(nowDate);			//yyyy-mm-dd HH:ii:ss
		String domain =request.getServerName();				//server name or ip
		String drm_valid  = sf.format(new java.util.Date(nowDate.getTime() + ((long)86400*30)));	// 다운로드화일은 1달만 재생되게
		String drm_playlimit = "-1";									// 다운로드화일의 재생횟수는 무제한
		String drm_viewtimelimit = "-1";							// 다운로드화일의 재생시간은 무제한
		String seek = "";											// 이어보기를 위한 초기 seek position 값(int)
		String adaptive = "";									// 값 예시 ("1M,2M,700k"), 비어있을경우 일반 스킨 적용;
		String preToken = userid+"|"+uri+"|"+run_keeper+"|"+ip+"|"+agent+"|"+now+"|"+domain+"|"+drm_valid+"|"+drm_playlimit+"|"+drm_viewtimelimit+"|"+seek+"|"+adaptive;			
		return Base64.encodeBase64String(preToken.getBytes());
	}
		
%>

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
	<h4 class="floatL">yoyo 상세보기</h4>		
</div>

<!-- 조회  시작-->				
<div class="tbl_view">
	<table class="view_tbl01" summary="">
		<caption>공지사항 관리 테이블</caption>
		<colgroup>
			<col style="width: 15%;" />
			<col  />
		</colgroup>
		<tbody id="yoyo">
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row">
					<tr>
						<td>${row.DATA_ORDE } 번째</td>
						<td>${row.VOD_NM }</td>
						<td>${row.DATA_TITL }</td>
						<c:set var="DATA_PC_URL" value="${row.DATA_PC_URL }" />
						<td onclick='open_fiveplayer("<%=makeFiveplayerToken(request, userId, "video/peoplemade/"+(String)pageContext.getAttribute("DATA_PC_URL")+"\"","1") %>",document.location.href);'>시청</td>
						<td onclick='open_fiveplayer_downloader("<%=makeFiveplayerToken(request, userId, "video/peoplemade/"+(String)pageContext.getAttribute("DATA_PC_URL")+"\"","1") %>",document.location.href);'>저장</td>
						<td>${row.LECT_PLAY_LINK }</td>
						<td>${row.LECT_DTM } 회</td>
					
					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="99">등록된 내용이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>

<!-- fiveplayer 구동용 자바 라이브러리 스크립트 시작-->

<script src="https://player.yozii.com/js/jquery.js"></script>
<script src="https://player.yozii.com/fiveplayer/fiveplayer-phone.js"></script>
<script src="https://player.yozii.com/fiveplayer-webinterface.js"></script>
<iframe id='iframe_mobile_player' name='iframe_mobile_player' style='display:none;' ></iframe>
<iframe id='iframe_modal' name='iframe_modal' style='display:none;'></iframe>
<div id="applinkDiv" style="display:none;"></div>
<!--
iframe 용 플레이어 구현 가이드
1. 새창띄우자마자 해당강의는 iframe 태그의 src에 다음값설정 http://player.yozii.com/fiveplayer/fiveplayer-streaming.php?token=$token
2. 플레이리스트 각 강의목록에 token값 미리설정
3. 클릭 이벤트 함수 iframe_srcchange_fiveplayer를 사용하여 iframe src 속성값 변경 스크립트에 token값 전달하여 iframe src 변경
-->


<div class="btn_wrap">
	<a href="${ unit.move('index', '') }" class="btn btn-md btn-outline-dark">목록</a>
</div>
${out }
<!-- 조회 끝 -->	
<script>

$(function(){
	console.log('<%=userId%>');
	
	var params = new Object();
	params.status = "LIST";	
	params.query = 'selectMngYoyoDetailList';
	params.LECT_IDX = '${out.params.lectIdx}';	
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	
	var jsonDetail =  fn_DataAjax2( params );
	var lisr = jsonDetail.out.detail.data;
	console.log( jsonDetail );
	
	console.log( lisr );
	var html = "";
	
	$.each(lisr, function(k, v){
		html += '<tr>';
		html += '<td>'+v.DATA_ORDE+'</td>';
		html += '<td>'+v.DATA_TITL+'</td>';
		html += '<td>'+v.LECT_DTM+'</td>';
		html += '<td>'+v.LECT_PLAY+'</td>';
		html += '<td>'+v.LECT_PLAY_LINK+'</td>';
		html += '<td>'+v.SALE_IDX+'</td>';
		html += '</tr>';
	});
	
// 	console.log( html );	
// 	$('tbody#yoyo').append( html );
	
	
});

</script>
