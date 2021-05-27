<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("userId");
	if (userId == null) {
		userId = "free-" + request.getRemoteAddr();
	}
%>
<%!// http://210.113.36.169:1935/vodservice/_definst_/test/13.mp4/playlist.m3u8 의 재생주소의 uri는 test/13.mp4 입니다.
	// user id와 uri 부분만 token으로 묶어서 open_fiveplayer 스크립트를 사용하여 전달하시면 됩니다. run_keeper 값은 1이어야 합니다.
	public String makeFiveplayerToken(HttpServletRequest request, String userid, String uri, String run_keeper) {
		System.out.println("request.getServerName() : " + request.getServerName());
		String ip = request.getRemoteAddr(); //user-ip
		String agent = request.getHeader("User-Agent"); //user-agent
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date nowDate = new java.util.Date();
		String now = sf.format(nowDate); //yyyy-mm-dd HH:ii:ss
		String domain = request.getServerName(); //server name or ip 
		String drm_valid = sf.format(new java.util.Date(nowDate.getTime() + ((long) 86400 * 30))); // 다운로드화일은 1달만 재생되게
		String drm_playlimit = "-1"; // 다운로드화일의 재생횟수는 무제한
		String drm_viewtimelimit = "-1"; // 다운로드화일의 재생시간은 무제한
		String seek = ""; // 이어보기를 위한 초기 seek position 값(int)
		String adaptive = ""; // 값 예시 ("1M,2M,700k"), 비어있을경우 일반 스킨 적용;
		String preToken = userid + "|" + uri + "|" + run_keeper + "|" + ip + "|" + agent + "|" + now + "|" + domain
				+ "|" + drm_valid + "|" + drm_playlimit + "|" + drm_viewtimelimit + "|" + seek + "|" + adaptive;
		return Base64.encodeBase64String(preToken.getBytes());
	}%>
<%
	
%>

<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
body, td, input, .my_button {
	font-size: 13px;
}

table {
	width: 600px;
}

td {
	padding: 2px;
	font-family: Tahoma;
	border-bottom: dotted 1px #cecece;
}

input {
	padding: 4px;
}

.my_button {
	width: 45%;
	color: white;
	font-size: 12px;
	border: #cccccc;
	background: #559955;
	padding: 2px;
	height: 28px;
	cursor: pointer;
}
</style>

<body>
	<center>

		<table padding=0 margin=0>
			<tr>
				<td colspan=2
					style='text-align: center; background: #999999; padding-top: 10px; color: white'><h3>Fiveplayer
						DEMO</td>
			</tr>
			<tr>
				<td colspan=2 height=20></td>
			</tr>
			<tr>
				<td style='text-align: right'>User ID </font> &nbsp;&nbsp;<input
					type=text id='userid' name='userid' value='<%=userId%>' size=25>
				</td>
				<td>

					<button class='my_button' onclick='changeid()'
						style='background: #555555; width: 90%'>ID변경</button> <script>function changeid()	{ document.location.href='/mng/yoyo/sample?userId='+document.getElementById('userid').value;}</script>
				</td>
			</tr>
			<tr height=20></tr>
			<tr>
				<td width=60%>[파일경로]</td>
				<td width=40% align=center>
					<button
						onclick='open_fiveplayer("<%=makeFiveplayerToken(request, userId, "video/peoplemade/demo-01.mp4", "1")%>",document.location.href)'
						title='streaming'>play</button>
					<button
						onclick='open_fiveplayer_downloader("<%=makeFiveplayerToken(request, userId, "video/peoplemade/demo-01.mp4", "1")%>",document.location.href)'
						title='streaming'>save</button>
				</td>
			</tr>
			<tr>
				<td width=60%>[파일경로]</td>
				<td width=40% align=center>
					<button
						onclick='open_fiveplayer("<%=makeFiveplayerToken(request, userId, "video/peoplemade/demo-01.mp4", "1")%>",document.location.href)'
						title='streaming'>play</button>
					<button
						onclick='open_fiveplayer_downloader("<%=makeFiveplayerToken(request, userId, "video/peoplemade/demo-01.mp4", "1")%>",document.location.href)'
						title='streaming'>save</button>
				</td>

			</tr>

			<tr>
				<td style='text-align: left; border: none'></td>
				<td style='text-align: left; border: none'><br>
					<button class=my_button onclick='open_fiveplayer_installer()'
						style='background: #555555; width: 90%'>
						<i class='fa fa-download' alt='Fiveplayer 설치'></i>&nbsp;설치&nbsp;
					</button> <br>
				<br></td>
			</tr>


		</table>
</body>
</html>

	<!-- fiveplayer 구동용 자바 라이브러리 스크립트 시작-->

		<script src="https://player.yozii.com/js/jquery.js"></script>
		<script src="https://player.yozii.com/fiveplayer/fiveplayer-phone.js"></script>
		<script src="https://player.yozii.com/fiveplayer-webinterface.js"></script>
		<iframe id='iframe_mobile_player' name='iframe_mobile_player'
			style='display: none;'></iframe>
		<iframe id='iframe_modal' name='iframe_modal' style='display: none;'></iframe><di
	v id="applinkDiv" style="display: none;"></div>
	<!--
iframe 용 플레이어 구현 가이드
1. 새창띄우자마자 해당강의는 iframe 태그의 src에 다음값설정 http://player.yozii.com/fiveplayer/fiveplayer-streaming.php?token=$token
2. 플레이리스트 각 강의목록에 token값 미리설정
3. 클릭 이벤트 함수 iframe_srcchange_fiveplayer를 사용하여 iframe src 속성값 변경 스크립트에 token값 전달하여 iframe src 변경
-->
	<script>

		