<%@ page language="java" contentType="text/html;charset=euc-kr" %>

<html>
<head>
<title>�������α׷�[www.dbtool.co.kr]</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">   
<style type="text/css">
<!--
a { text-decoration:none; color: black; font-family: "����"; font-size: 9pt;}
a:Visited {}
a:Active {}
a:Hover { text-decoration:none; color:black; font-family: "����"; font-size: 9pt;}
BODY,TABLE,TR,TD,FORM {  font-family: "����"; font-size: 9pt; font-style: normal; color: black;}
INPUT2 {font-family: "����";border:solid 1;border-color:999999;font-size:9pt;color:black;background-color:white;height:19px;padding-top:2px;}
TEXTAREA {font-family: "����";border:solid 1;border-color:999999;font-size:9pt;color:black;background-color:white;width:100%;height:100%;}
SELECT2 {font-family: "����";border:solid 1;border-color:999999;font-size:9pt;color:black;background-color:white;height:20px;line-height:100%;}
.black {  font-family: "����"; font-size: 9pt; font-style: normal; color: black}
.link {  font-family: "����"; font-size: 9pt; font-style: normal; color: black;text-decoration:underline;}
.link:hover {  font-family: "����"; font-size: 9pt; font-style: normal; color: blue;text-decoration:underline;}
.gray {  font-family: "����"; font-size: 9pt; font-style: normal; color: gray}
.red {  font-family: "����"; font-size: 9pt; font-style: normal; color: red}
.blue {  font-family: "����"; font-size: 9pt; font-style: normal; color: blue}
.style1 {background-color:#ffffff;text-decoration:none;color:black;font-family:"����";font-size:10pt;line-height:100%}
.style2 {background-color:#EAE8E8;text-decoration:none;color:black;font-family:"����";font-size:11pt;line-height:100%}
.style3 {background-color:#000000;text-decoration:none;color:white;font-family:"����";font-size:11pt;line-height:100%}
.topmenu { font-family:"����"; font-size:13px; font-weight:bold; color:white; cursor:hand;}
.frm_checkbox {margin:-1 -1 -1 -1;}
.nav1 {  font-family: "����"; font-size: 12px; font-style: normal; line-height: 130%; color: #333333;}
.nav1:hover {color: black; font-weight:bold;}
.nav2 {  font-family: "����"; font-size: 12px; font-style: normal; line-height: 130%; color: #333333;}
.nav2:hover {color: black; font-weight:bold;}
.login_button {font-family: "����";border:solid 1;border-color:aaaaaa;font-size:9pt;color:white;background-color:#39597D;width:43px;height:38px;}
.logout_button {font-family: "����";border:solid 1;border-color:aaaaaa;font-size:9pt;color:white;background-color:#39597D;width:54px;height:38px;}
.button1 {font-family: "����";border:solid 1;border-color:black;background-color:#CECECE;font-size:9pt;color:black;width:60px;height:20px;}
.button2 {cursor:hand;margin:0 0 1 0;font-family: "����";border:solid 1;border-color:black;background-color:white;font-size:12px;color:black;width:100%;height:100%;padding-top:1px;}
.button3 {font-family: "����";border:solid 1;border-color:black;background-color:#CECECE;font-size:9pt;color:black;width:60px;height:20px;}
.icon_button1 {margin:2 3 2 8;font-family: "����";border:solid 1;border-color:#EBEBEB;font-size:6pt;color:#A5B4C4;background-color:#5985A3;width:12px;height:12px;}
.icon_button2 {margin:2 3 2 8;font-family: "����";border:solid 1;border-color:#EBEBEB;font-size:6pt;color:#39597D;background-color:#5985A3;width:12px;height:12px;}
.radiobox1 {  font-family: "����"; font-size: 9pt; font-style: normal; color: black; border:solid 0;background-color:#EAE8E8;}
.blank {margin:0 0 -2 0;font-family: "����";border:solid 0;font-size:9pt;color:black;background-color:white;}

.icon_button_board {margin:0 3 2 3;border:solid 1;border-color:#eeeeee;font-size:6pt;color:#bbbbbb;background-color:#666666;width:12px;height:12px;}

.view_title1 {font-family:verdana;font-size:8pt;font-weight:bold;color:#888888}
.view_title2 {font-family:Arial;font-size:19px;letter-spacing:-1px;font-weight:bold;color=#eeeeee}


.textbox {font-family:"����";border:solid 1;border-color:888888;font-size:9pt;color:black;background-color:white;height:19px;padding-top:2px;}
.textbutton {font-family:"����";font-size:12px;height:20px;padding-top:2px;background-color:#CECECE;cursor:hand;border-style:solid; border-width:1;border-color:#FFFFFF #808080 #808080 #FFFFFF; color:black; text-align:center;}
.commentbutton {font-family:"����";font-size:12px;width:45px;height:40px;background-color:#CECECE;cursor:hand;border-style:solid; border-width:1;border-color:#FFFFFF #808080 #808080 #FFFFFF; color:black; text-align:center;}
.selectbox {font-family:"����";border:solid 1;border-color:888888;margin-top:1px;height:16px;font-size:12px;padding-top:1px;}
.checkbox {font-family:"����";margin:0 0 -1 1;border:solid 1;border-color:white;background-color:white;width:16px;height:16px;}
.radiobox {font-family:"����";margin:1 0 -2 0;}
.titlebox {font-family:"����";border:solid 1;border-color:333333;background-color:888888;width:100%;height:18px;padding:0;font-size:12px;color:white;font-weight:bold;padding-top:2px;padding-bottom:0px;}
.td_head {background-color:#DDDDDD;color:black;font-family:"����";font-size:12px;}
.dbtool_scroll {
SCROLLBAR-FACE-COLOR: #A5B4C4; 
SCROLLBAR-SHADOW-COLOR: #868F97; 
SCROLLBAR-HIGHLIGHT-COLOR: #A5B4C4; 
SCROLLBAR-3DLIGHT-COLOR: #B2B9BF; 
SCROLLBAR-DARKSHADOW-COLOR: #5E666D;
SCROLLBAR-TRACK-COLOR: #39597D;
SCROLLBAR-ARROW-COLOR: #ffffff;
}
#access_list {width:100%; height:100%; overflow:scroll; overflow-x:hidden; padding:1px; border:0; border-style:solid; border-color:black}

-->
</style> 
</head>
<body>

<table width=100% border="0" cellspacing="0" cellpadding="10" valign=top> 
	<tr>
		<td width=150>
			<table border="0" cellspacing=0 cellpadding=0 width="150" height="100" style="border:solid 1px black;" align=center>
				<tr valign=top>
					<td bgcolor="#dddddd">
						<DIV id="access_list" class="dbtool_scroll">
						<table border="0" cellspacing=1 cellpadding=0 width="100%">
							<tr>
								<td>
								���������� : Loading
								</td>
							</tr>
						</table>
						</DIV>
					</td>
				</tr>
			</table>
		</td>
		<td>
			<table border="0" cellspacing=0 cellpadding=2>
			<%if(session.getAttribute("ex_user_id")!=null){%>
			<form name="logoutform" method="post" action="logout_process">
				<tr>
					<td>
					<%=session.getAttribute("ex_user_name")%>(<%=session.getAttribute("ex_user_id")%>)���� �α��� �Ͽ����ϴ�.
					</td>
				</tr>
				<tr>
					<td align=center>
					<input type=submit value="�α׾ƿ�">
					</td>
				</tr>
			</form>
			<%}else{%>
			<form name="loginform" method="post" action="login_process" onsubmit="return check_login(this)">
				<tr>
					<td>
					���̵�: <input type=text name="user_id" size="12" value="test">
					�̸�: <input type=text name="user_name" size="12" value="�׽�Ʈ">
					</td>
				</tr>
				<tr>
					<td align=center>
					<input type=submit value="�α���">
					</td>
				</tr>
			</form>
			<%}%>
			</table>
		</td>
		<td>
			&nbsp;
		</td>
	</tr>
	<tr>
		<td colspan=3>
			* �������� ���� ������ ��� �׽�Ʈ�ϸ� �˴ϴ�.<br>
		</td>
	</tr>
</table>


<script language="javascript">

	$(function(){
// 		access_list();
	});

	
	
	function getXmlHttpRequest(){
		var xmlhttp = false;
		console.log(6);
	
		// Mozilla/Safari
		if (window.xmlhttpuest) {
			console.log(7);
				xmlhttp = new xmlhttpuest();
		}
		// IE
		else if (window.ActiveXObject) {
			console.log(8);
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		console.log(9);
		return xmlhttp;
	}
	
	function check_login(form){
		console.log(1);
		if(form.user_id.value==""){
			console.log(2);
			alert('���̵� �Է��ϼ���.');
			form.user_id.focus();
		}else if(form.user_name.value==""){
			console.log(3);
			alert('�̸��� �Է��ϼ���.');
			form.user_name.focus();
		}else{
			console.log(4);
			form.submit();
		}
		console.log(5);
		return false;
	}
		
		
	function access_list(){
		console.log(10);
		var xmlhttp = getXmlHttpRequest();
		var url = "./ajax_user.jsp";
	
		console.log(11);
		if(url){
			console.log(12);
			xmlhttp.open("GET", url, true);
	
			console.log(13);
			xmlhttp.onreadystatechange = function() {
				if(xmlhttp.readyState == 4) {
					if(xmlhttp.status == 200) {
						var respTxt = xmlhttp.responseText;
						document.getElementById("access_list").innerHTML = respTxt;
					} else {
						//alert("Error loading "+url+", "+xmlhttp.status+"("+xmlhttp.statusText+")");
					}
					xmlhttp = null; // <-- �̰��� �߰� 
				}
			}
			xmlhttp.send(null);
		}
		setTimeout("access_list()", 3000);//3�� ���� ������ �����
		return false;
	}
		
	function include_exit(msg) { 
		var xmlhttp = getXmlHttpRequest();
		var url = 'user_exit.jsp?msg='+msg;
		
		if(url){
			xmlhttp.open("GET", url, true);
			xmlhttp.onreadystatechange = function() {
				if(xmlhttp.readyState == 4) {
					if(xmlhttp.status == 200) {
						var respTxt = xmlhttp.responseText;
					} else {
						//alert("Error loading "+url+", "+xmlhttp.status+"("+xmlhttp.statusText+")");
					}
					xmlhttp = null; // <-- �̰��� �߰� 
				}
			}
			xmlhttp.send(null);
		}
		return false;
	}
	
	function Exit() { 
	    if (self.screenTop > 9000) { 
			// ����������
			include_exit('����������');
	    } else { 
	        if(document.readyState == "complete") { 
	            // ���ΰ�ħ 
				include_exit('���ΰ�ħ');
	        } else if(document.readyState == "loading") { 
	            // �ٸ�����Ʈ�̵� 
				include_exit('�������̵�');
	        } 
	    } 
	}

</script> 

<script language="javascript" event="onunload" for="window"> 
    Exit(); 
</script> 

</body>
</html>
