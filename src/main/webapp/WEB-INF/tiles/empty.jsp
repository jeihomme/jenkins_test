<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="baseURL" value="${fn:replace(req.requestURL, fn:substring(req.requestURI, 0, fn:length(req.requestURI)), req.contextPath)}" />
<c:set var="pathUrl" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" /> 
<c:set var="excelUrl" value="/${fn:split( pathUrl ,'/')[0]}/${fn:split( pathUrl ,'/')[1]}/excel" /> 

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=10" />
  <meta name="format-detection" content="telephone=no"/>
  <meta name="naver-site-verification" content="bf91e717d6fba07cec6ee668bce6943d9d6f0251"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, user-scalable=no" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
<!--   <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0"/> -->
  <meta name="google-signin-client_id" content="29882695424-nkp55onmr849eop3av67qernr2fapc1n.apps.googleusercontent.com">
  <link rel="shortcut icon" type="image/x-icon" href="/resources/assets/images/ico/favicon.ico" /> 
  
  <c:if test="${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] eq 'payment' }">
		<meta http-equiv="Cache-Control" content="no-cache"> 
		<meta http-equiv="Pragma" content="no-cache"> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </c:if>
  <title>???????????????</title>
  
  <!--Basic Scripts-->
<!--   <script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script> -->
<script type="text/javascript" src="/resources/assets/js/jquery-1.12.4.min.js"></script>
  <script type="text/javascript"  src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>

  <!-- UNIT -->
   <script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
    <link href="/resources/css/font-awesome.min.css" rel="stylesheet" />
  <script type="text/javascript" src="https://kit.fontawesome.com/35f90b3902.js"></script>
  <script type="text/javascript" src="/resources/js/jquery.slimscroll.min.js"></script> 
  <script type="text/javascript" src="${root}/unit.iwonsoft.com/base.js?uid=${uid}"></script> 
  
  <!-- JS -->
  <script type="text/javascript" src="/resources/assets/js/common.js"></script>
  <script type="text/javascript" src="/resources/assets/js/slick.min.js"></script>
  <script type="text/javascript" src="/resources/assets/js/jquery.waypoints.min.js"></script>
  <script src="/resources/js/common.js"></script>
  
  <!--CSS   -->
  <link href="/resources/assets/css/slick.css" rel="stylesheet" type="text/css" />
  <link href="/resources/assets/css/base.css" rel="stylesheet" type="text/css" />
  <link href="/resources/assets/css/common.css" rel="stylesheet" type="text/css" />
  <link href="/resources/assets/css/main.css" rel="stylesheet" type="text/css" />
  <link href="/resources/assets/css/sub.css" rel="stylesheet" type="text/css" />
<!--     <link href="/resources/css/bootstrap.min.css" rel="stylesheet" /> -->
<!--   <link href="/resources/css/common_mng.css" rel="stylesheet"> -->
<!--   <link href="/resources/css/layout_mng.css" rel="stylesheet"> -->
<!--   <link href="/resources/css/beyond.css" rel="stylesheet"> -->

<!--   ????????? api -->
  <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!--   ?????? api -->
  <script src="https://apis.google.com/js/api:client.js"></script>
<!--   ????????? api -->
  <script type="text/javascript" src="/resources/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
  
	<!--   ??????????????? css -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, user-scalable=no" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet"><!-- font-family: 'Noto Sans KR', sans-serif; -->
    <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@600&display=swap" rel="stylesheet"><!-- font-family: 'Titillium Web', sans-serif; -->
  
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
  
<!-- ???????????? -->
<!-- 	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> -->
<!-- 	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> -->
<!-- 	<script type="text/javascript" src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script> -->
  
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-84NRC0X9LL"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag(){dataLayer.push(arguments);}
	gtag('js', new Date());
	
	gtag('config', 'G-84NRC0X9LL');
</script>

</head>
<style>
.banner{
	display:none;
}

.hmlogout{
display:none;
}
.mo_my_info_login{
display:none;
}
.mo_mypeople{
display:none;
}
</style>
	
	<input type="hidden" id="imgTag" name="imgTag"/>
		
	<body class="popupBody">
		<!-- START : Contents -->
		<tiles:insertAttribute name="body" ignore="true"/>
		<!-- END : Contents -->
	</body>
</html>

<script>

var cateIdx = '${out.params.cateIdx}';
var prdtCd = '${out.params.prdtCd}';

var prdtNm = '';
var prdtType = '';
var timeIdx = [];
var timeDtm = [];
var timeStr = [];
var timeRun = '';
var timePrice = '';
var dataQuesIdx = [];
var dataQues = [];
var baskArr = [];
var baskTimeIdxArr = [];
var queryAdd = 'selectFrontPrdt';

if (window.location.pathname.indexOf('_solution') == -1 ) {
	
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "ea75c923-a123-4db2-98e0-651b77e03f94"
  });
}

////////////////////////////////////////////
// 1. ?????? ??????
////////////////////////////////////////////
// SNS ????????? ????????? ?????? ??? ???
var joinType = "";
var USER_SNS_TYPE = "";
var USR_ID = "";
var USR_NICK = "";
var USR_AGE = "";
var USR_BIRTHDAY = "";
var USR_GENDER = "";

////////////////////////////////////////////
// 2. ????????? ??????
////////////////////////////////////////////

    //????????? ???????????? ??????????????? ??????
	if ( localStorage.getItem("frontLoginIdx" ) == null || localStorage.getItem("frontLoginIdx" ) == "" ) {
		$('.hmlogin').show();
	} else {
		$('#LOGIN_USER_NICK').text( localStorage.getItem("frontLoginNick") );
		$('.hmlogout').show();
		$('.hmlogin').hide();
//  		$('.pop_close.banner2').hide();
// 		$('.banner').hide();
		
	}


     //????????? ??????????????? ??????????????????
  	if ( localStorage.getItem("frontLoginIdx" ) == null || localStorage.getItem("frontLoginIdx" ) == "" ) {
		$('.mo_mypeople').hide();
	} else {
		$('#LOGIN_USER_NICK').text( localStorage.getItem("frontLoginNick") );
		$('.mo_mypeople').show();
	}
	//????????? ??????????????? ?????????
	if ( localStorage.getItem("frontLoginIdx" ) == null || localStorage.getItem("frontLoginIdx" ) == "" ) {
			$('.mo_my_info_logout').show();
	} else {
		$('#LOGIN_USER_NICK').text( localStorage.getItem("frontLoginNick") );
		$('.mo_my_info_login').show();
		$('.mo_my_info_logout').hide();
	}
		
		
    // ????????? ??????
    var $follow = $('.mc_follow_btn');

    $follow.on( 'click', function(){
        $(this).toggleClass('active');
        if( $(this).hasClass('active') ) $(this).text('?????????');
        else $(this).text('?????????');
    });
    
    //????????????, ??????????????? ????????????
	if( localStorage.getItem("frontUserType") == 'M' ) $('.footer_gnb li a.fg_title').eq(7).hide();

	//??????
    $('.topbar_close').on('click',function(){
        $('.topbar').css( '<style>.topbar{display:none !important;}</style>' );
    });
	
	
	$(function(){
//     	fn_setUserUuid( localStorage.getItem("frontLoginUuid"), 'USER_UUID_FILE' );
    	
    	$('.hm_name').html( localStorage.getItem("frontLoginNm") );
    	$('.profile div.text-area > strong').html( localStorage.getItem("frontLoginNm") );
    	$('.profile div.text-area > p.profile-info').html( localStorage.getItem("frontUserInfo") );
    	
    	// samesite ?????? ?????? ????????? ?????? ????????? ??????
    	if ( '${sessionScope.LOGIN_IDX}' == '' && localStorage.getItem("frontLoginIdx") != null ) {
    		var reissue = new Object();
    		reissue.status = "REISSUANCEID";
    		reissue.query = "selectReissuanceId";
    		reissue.USER_IDX = localStorage.getItem("frontLoginIdx");
    		fn_DataAjax2( reissue );	
    	}
    	
    });
    
    
    
    
//     ??????????????? ??????//     ??????????????? ??????//     ??????????????? ??????//     ??????????????? ??????//     ??????????????? ??????//     ??????????????? ??????//     ??????????????? ??????
//     ??????????????? ??????//     ??????????????? ??????//     ??????????????? ??????//     ??????????????? ??????//     ??????????????? ??????//     ??????????????? ??????//     ??????????????? ??????
//     ??????????????? ??????//     ??????????????? ??????//     ??????????????? ??????//     ??????????????? ??????//     ??????????????? ??????//     ??????????????? ??????//     ??????????????? ??????
//     ??????????????? ??????//     ??????????????? ??????//     ??????????????? ??????//     ??????????????? ??????//     ??????????????? ??????//     ??????????????? ??????//     ??????????????? ??????

	//???????????? ??????????????? API
	$(function() {
		Kakao.init('625dd9d4348f689932842a4a6c30558d');
		if ($('#create-kakao-login-btn').attr('id')) {
			Kakao.Auth.createLoginButton({
				container : '#create-kakao-login-btn',
				success : function(token) {
// 			console.log( JSON.stringify(loginToken) );
				Kakao.API.request({
						url : '/v2/user/me',
						success : function(data) {
							//console.log(JSON.stringify(data));
							USR_NICK = data.kakao_account.profile.nickname;
							USR_ID = data.id;
							USR_EMAIL = data.kakao_account.email;
							joinType = 'SNS';
							USER_SNS_TYPE = 'K';
								// ????????? ?????? ?????? ??? ??????
							if (window.location.pathname.indexOf('register') > -1) {
								$('.popup_wrap').hide();
							    $('#snsDataPop').show();
								fn_BtnSNSDupl( USR_ID , USER_SNS_TYPE );
								if ( !snsIsc ) return fn_loginChk(joinType);
								
								if ( USR_EMAIL != '' && USR_EMAIL != null && typeof USR_EMAIL != 'undefind' ) {
									var SNS_TYPE = fn_BtnDupl( USR_EMAIL , 'EMAIL');
									if( !idIsc ){
										if ( SNS_TYPE == '' || SNS_TYPE == null || typeof SNS_TYPE == 'undefind' ) {
											return fn_loginChk(joinType);
										}else{
											alert('?????? '+SNS_TYPE+' ?????? ????????? ??????????????????.');
											return location.href = "/front/account/login";
										}
									}
								}
								
								if ( USR_EMAIL != '' && USR_EMAIL != null && typeof USR_EMAIL != 'undefind'  ) {
									$('[name=SNS_MAIL]').val( USR_EMAIL );
									$('[name=SNS_MAIL]').prop('disabled',true);
									mailChk = true;
								}
								
								//?????? ???
								$('[name=SNS_PHONE]').val( '' );
								$('[name=SNS_NICK]').val( USR_NICK );
								
								fn_BtnDupl( USR_NICK , 'NICK');
								if( idIsc ) {
									snsChk = true;
								}else{
									snsChk = false;
									setTimeout(function(){
										alert('?????? ???????????? ??????????????????.');
										$('[name=SNS_NICK]').val('');
									}, 500);
								}
								
							} else if (window.location.pathname.indexOf('login') > -1) fn_loginChk(joinType);
						}
					});
				},
				fail : function(err) {
					alert('???????????? ????????? ?????????????????????.');
				}
			});
			$('#create-kakao-login-btn').text('????????????????????? ?????????');
		}
		if (window.location.pathname.indexOf('register') > -1 || ( window.location.pathname.indexOf('login') > -1 && window.location.pathname.indexOf('loginCallback') == -1  )) startApp();
		
	});

	//?????? ??????????????? API
	var googleUser = {};
	var startApp = function() {
		gapi.load( 'auth2', function() {
							// Retrieve the singleton for the GoogleAuth library and set up the client.
							auth2 = gapi.auth2.init({
									// ??????????????? ID ????????????
									client_id : '29882695424-nkp55onmr849eop3av67qernr2fapc1n.apps.googleusercontent.com',
									cookiepolicy : 'single_host_origin'
									// Request scopes in addition to 'profile' and 'email'
									//scope: 'additional_scope'
									});
							attachSignin(document.getElementById('googleLoginBtn'));
							
						});
	};

	function attachSignin(element) {
		auth2.attachClickHandler(element, {}, function(googleUser) {
			//console.log( googleUser.getBasicProfile().getId() );
			USR_NICK = googleUser.getBasicProfile().getName();
			USR_ID = googleUser.getBasicProfile().getId();
			USR_EMAIL = googleUser.getBasicProfile().getEmail();
			joinType = 'SNS';
			USER_SNS_TYPE = 'G';
			if (window.location.pathname.indexOf('register') > -1) {
				fn_BtnSNSDupl( USR_ID , USER_SNS_TYPE );
				if ( !snsIsc ) return fn_loginChk(joinType);
				var SNS_TYPE = fn_BtnDupl( USR_EMAIL , 'EMAIL');
				
				if( !idIsc ){
					if ( SNS_TYPE == '' || SNS_TYPE == null || typeof SNS_TYPE == 'undefind' ) {
						return fn_loginChk(joinType);
					}else{
						alert('?????? '+SNS_TYPE+' ?????? ????????? ??????????????????.');
						return location.href = "/front/account/login";
					}
				}
				//?????? ???
				$('[name=SNS_MAIL]').val( USR_EMAIL );
				$('[name=SNS_MAIL]').prop('disabled',true);
				mailChk = true;
				$('[name=SNS_PHONE]').val( '' );
				$('[name=SNS_NICK]').val( USR_NICK );
				
				// ????????? ?????? ?????? ??? ??????
				$('.popup_wrap').hide();
		        $('#snsDataPop').show();
				
				setTimeout(function(){
		      	  fn_BtnDupl( USR_NICK , 'NICK');
					if( idIsc ) {
						snsChk = true;
					}else{
						snsChk = false;
						alert('?????? ???????????? ??????????????????.');
						$('[name=SNS_NICK]').val('');
					}
				}, 100);// setTimeout			

			} else if (window.location.pathname.indexOf('login') > -1) {
				fn_loginChk(joinType);
			}

		}, function(error) {
			alert('???????????? ????????? ?????????????????????.');
		});
	}

	//????????? ??????????????? API
	if (window.location.href.indexOf('register_') > -1) {
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "Yy3VYgU3VeQz48IxqqLD",//?????? ???
// 			clientId : "cJME75uYUeMQFAzAHfZe",//beta.so ???
			
			callbackUrl : "https://localhost:8443/front/account/joinCallback2",
			isPopup : false, /* ????????? ?????? ???????????? ?????? */
			loginButton : { color : "green", type : 3, height : 60 }
		/* ????????? ????????? ????????? ?????? */
		});

		/* ??????????????? ??????????????? ????????? ?????? */
		naverLogin.init(); 
		$('#naverIdLogin a img').after('????????? ???????????? ?????????');
		
	}else if (window.location.href.indexOf('register') > -1) {
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "Yy3VYgU3VeQz48IxqqLD",
			callbackUrl : "https://localhost:8443/front/account/joinCallback",
			isPopup : false, /* ????????? ?????? ???????????? ?????? */
			loginButton : { color : "green", type : 3, height : 60 }
		/* ????????? ????????? ????????? ?????? */
		});

		/* ??????????????? ??????????????? ????????? ?????? */
		naverLogin.init(); 
		$('#naverIdLogin a img').after('????????? ???????????? ?????????');
		
	}else if (window.location.href.indexOf('login') > -1) {
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "Yy3VYgU3VeQz48IxqqLD",
			callbackUrl : "https://localhost:8443/front/account/loginCallback",
			isPopup : false, /* ????????? ?????? ???????????? ?????? */
			loginButton : { color : "green", type : 3, height : 60 }
		/* ????????? ????????? ????????? ?????? */
		});

		/* ??????????????? ??????????????? ????????? ?????? */
		naverLogin.init();
		$('#naverIdLogin a img').after('????????? ???????????? ?????????');
	}else if (window.location.href.indexOf('door') > -1) {
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "Yy3VYgU3VeQz48IxqqLD",
			callbackUrl : "https://localhost:8443/front/account/loginCallback2",
			isPopup : false, /* ????????? ?????? ???????????? ?????? */
			loginButton : { color : "green", type : 3, height : 60 }
		/* ????????? ????????? ????????? ?????? */
		});

		/* ??????????????? ??????????????? ????????? ?????? */
		naverLogin.init();
		$('#naverIdLogin a img').after('????????? ???????????? ?????????');
	}

	var referer = '${header.referer}';
	if (referer.indexOf('Callback') > -1) {
		naverLogin.getLoginStatus(function(status) {
			if (status) {
				/* (5) ??????????????? ??????????????? ????????? ????????? ????????? callback?????? ????????? ?????? */
				var email = naverLogin.user.email;
				var name = naverLogin.user.name;
				USR_NM = naverLogin.user.name;
				USR_ID = naverLogin.user.id;
				USR_EMAIL = naverLogin.user.email;
				USR_EMAIL = USR_EMAIL.replace('never', 'naver');
				USR_NICK = naverLogin.user.nickname;
				joinType = 'SNS';
				USER_SNS_TYPE = 'N';
				
				if (window.location.pathname.indexOf('register') > -1) {
					
					fn_BtnSNSDupl( USR_ID , USER_SNS_TYPE );
					if ( !snsIsc ) return fn_loginChk(joinType);
					var SNS_TYPE = fn_BtnDupl( USR_EMAIL , 'EMAIL');
					if( !idIsc ){
						if ( SNS_TYPE == '' || SNS_TYPE == null || typeof SNS_TYPE == 'undefind' ) {
							return fn_loginChk(joinType);
						}else{
							alert('?????? '+SNS_TYPE+' ?????? ????????? ??????????????????.');
							return location.href = "/front/account/login";
						}
					}
					
					$('[name=SNS_MAIL]').val( USR_EMAIL );
					$('[name=SNS_MAIL]').prop('disabled',true);
					$('[name=SNS_PHONE]').val( '' );
					$('[name=SNS_NICK]').val( USR_NICK );
					mailChk = true;
					
					// ????????? ?????? ?????? ??? ??????
					$('.popup_wrap').hide();
			        $('#snsDataPop').show();
			        setTimeout(function(){
			        	
						fn_BtnDupl( USR_NICK , 'NICK');
						if( idIsc ) {
							snsChk = true;
						}else{
							snsChk = false;
							alert('?????? ???????????? ??????????????????.');
							$('[name=SNS_NICK]').val('');
						}
			        });
					
				} else if (window.location.pathname.indexOf('login') > -1) {
					fn_loginChk(joinType);
				}
				if (opener) window.open().self.close();
			} 
			else {
				alert('???????????? ????????? ?????????????????????.');
			}
		});
	}
	
	function fn_BtnLogout() {
		snsLogout( localStorage.getItem("frontUserSnsType" ) );

	    localStorage.removeItem("frontLoginIdx" ); 
		localStorage.removeItem("frontLoginId" ); 
		localStorage.removeItem("frontUserType" ); 
		localStorage.removeItem("frontUserSnsType" ); 
		localStorage.removeItem("frontLoginNm" ); 
		localStorage.removeItem("frontLoginNick" ); 
		localStorage.removeItem("frontLoginUuid" ); 
		localStorage.removeItem("frontUserInfo" ); 
		localStorage.removeItem("frontUserPhone" ); 
	    
	    location.href='/front/main/index';
	}
	
	function snsLogout( type ){
		if (type == 'K') {
			if (!Kakao.Auth.getAccessToken()) {
				  console.log('Not logged in.');
				  return;
			}
			Kakao.Auth.logout();

		}else if (type == 'G') {
			
		}
	}
	
	//2. ????????? ?????? ???????????? ??????
	var path = window.location.pathname;
	path = path.split('/');
	path = '/'+path[1]+'/'+path[2]+'/ajax.json';

	function fn_SelectOption( PARENT_CODE, CODE, OBJECT_ID ) {
		var params = new Object();
		params.status = "CODE";
		params.parentCode = PARENT_CODE;
		params.code = CODE;
		params.query = "selectCode";
		var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
		var jsonData = result.out.detail.data;
		$('[name='+OBJECT_ID+']').empty();
		$('[name='+OBJECT_ID+']').append('<option value="">??????????????????</option>');
		
		$.each(jsonData,function(key1, val1) {
			var name = '';
			var value = '';
			
	    	$.each(val1,function(key, val) {
	    		if( key.indexOf('ID') > -1 ) value = val;
	    		else if( key.indexOf('NM') > -1 ) name = val;
				});
			$('[name='+OBJECT_ID+']').append('<option value="'+value+'">'+name+'</option>');
		});
	}

	function fn_SelectAllOption(  CODE, OBJECT_ID ) {
		var params = new Object();
		params.status = "CODE";
		params.code = CODE;
		params.query = "selectAllCode";
		
		var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
		var jsonData = result.out.detail.data;
		$('[name='+OBJECT_ID+']').empty();
		$('[name='+OBJECT_ID+']').append('<option value="">??????????????????</option>');
		$('[name='+OBJECT_ID+']').append('<option value="ALL">??????</option>');
		
		$.each(jsonData,function(key1, val1) {
			var name = '';
			var value = '';
			
	    	$.each(val1,function(key, val) {
	    		if( key.indexOf('ID') > -1 ) value = val;
	    		else if( key.indexOf('NM') > -1 ) name = val;
				});
			$('[name='+OBJECT_ID+']').append('<option value="'+value+'">'+name+'</option>');
		});
		
		return jsonData;
	}

	function fn_SelectOptionNotCode( query, OBJECT_ID ) {
		var params = new Object();
		params.status = "CODE";
		params.query = query;
		params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
		
		var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
		var jsonData = result.out.detail.data;
		$('[name='+OBJECT_ID+']').empty();
		$('[name='+OBJECT_ID+']').append('<option value="">??????????????????</option>');
		
		$.each(jsonData,function(key1, val1) {
			var name = '';
			var value = '';
			
		  	$.each(val1,function(key, val) {
		  		if( key.indexOf('ID') > -1 ) value = val;
		  		else if( key.indexOf('NM') > -1 ) name = val;
			});
			$('[name='+OBJECT_ID+']').append('<option value="'+value+'">'+name+'</option>');
		});
	}

	function fn_DataDetail( PARAMS ) {
		var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
		var jsonData = result.out.detail.data;
		jsonData =  ConvertHtmltoSystemSource( jsonData );
		
		$.each(jsonData ,function(key1, val1) {
			$.each(val1,function(key, val) {
				if( result.pageCd == 'view' || result.pageCd == 'tab' ) {
					if( key.indexOf("UUID") > -1 ) {
						//????????? ?????? ????????? ??????
						$('[name='+key+']').val(val);
						setUuid( $('[name='+key+']').val() );
						imgIdValue = key+"_FILE";
						unit_fileGet( imgIdValue, "fn_fileUpload");
					} else if( key.indexOf('YN') > -1 ) {
						//???????????? ??????
						if( val == 'Y') $('input:checkbox[name='+key+']').prop('checked',true);
						else $('input:checkbox[name='+key+']').prop('checked',false);
						$('#'+key+'').html(val);
					} else {
						//?????? ????????? ??????
						if( key.indexOf("IDX") > -1 ) $('#'+key+'').val(val);
						else $('#'+key+'').html(val);
					}
				} else if( result.pageCd == 'edit') {
					if( key.indexOf('YN') > -1 ) {
						$('input:radio[name='+key+']:radio[value='+val+']').prop('checked',true);
						if( val == 'Y') $('input:checkbox[name='+key+']').prop('checked',true);
						else $('input:checkbox[name='+key+']').prop('checked',false);
					} else {
						//?????? ????????? ??????
						$('[name='+key+']').val(val);
						if( key.indexOf("UUID") > -1 ) {
							//????????? ?????? ????????? ??????
							setUuid( $('[name='+key+']').val() );
							imgIdValue = key+"_FILE";
							unit_fileGet( imgIdValue, "fn_fileUpload");
						}
					}
				}
			});
		});
		return jsonData;
	}


	function fn_DataAjax2( PARAMS, NO_CONVERT ) {
		if ( NO_CONVERT == 'RECOMMEND' ) {
		}else{
			PARAMS = ConvertSystemSourcetoHtml( PARAMS );
		}
		var returnVal = 0;
		var alertVal = '';
		var alertKey = '';
		var url = window.location.pathname;
		return ${unit.ajax( ajaxUrl, "ajax", "PARAMS")}; 
	}

	function fn_DataAjax( PARAMS, CHECK_PARAMS ) {
		
		PARAMS = ConvertSystemSourcetoHtml( PARAMS );
		
		if( CHECK_PARAMS != 'N' ) if( fn_paramsNameTagTest( PARAMS ) != '' ) return alert( fn_paramsNameTagTest( PARAMS ) );
		
		var returnVal = 0;
		var alertVal = '';
		var alertKey = '';
		var url = window.location.pathname;
		if( PARAMS.status != 'WRITE' && PARAMS.status != 'EDIT' ) {
			${unit.ajax( ajaxUrl, "ajax", "PARAMS")}
			return 1; 
		} else {
			if( CHECK_PARAMS != 'N' ) {
				$.each(PARAMS, function(key, val){
					if( returnVal == 0 ) {
						if( '${pathUrl}'.indexOf('lect') > -1 || '${pathUrl}'.indexOf('live') > -1 || '${pathUrl}'.indexOf('face') > -1 || '${pathUrl}'.indexOf('chat') > -1 || '${pathUrl}'.indexOf('mail') > -1 ) {
							if( key.indexOf('UUID') > -1 ) {
									if( val == '' || val == null ) {
										returnVal = 1;
										alertKey = key;
										alertVal = $('[name="'+key+'"]').parents('tr').children('th').text() + '???/??? ??????????????????';
									}
							} else {
								if( $('[name="'+key+'"]').is(':visible') ) {
									if( val == '' || val == null ) {
										returnVal = 1;
										alertKey = key;
										alertVal = $('[name="'+key+'"]').parents('tr').children('th').text() + '???/??? ??????????????????';
									}
								}
								
							}
						} else {
							if( $('[name="'+key+'"]').is(':visible') ) {
								if( key.indexOf('UUID') < 0 ) {
									if( $('[name="'+key+'"]').is(':visible') ) {
										if( val == '' || val == null ) {
											returnVal = 1;
											alertKey = key;
											alertVal = $('[name="'+key+'"]').parents('tr').children('th').text() + '???/??? ??????????????????';
										}
									}
								}
							}
						}
					}
				});
				if( alertVal != '' ) {
					$('[name='+alertKey+']').focus();
					alert( alertVal );
					return 0; 
				} else {
					${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
					return 1; 
				}
			} else {
				${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
				return 1; 
			}
		}
	}

	function fn_BtnSearch( SEARCH_VAL ){
		var params = unit_getParams("searchArea");
		params.SEARCH_VAL = SEARCH_VAL;
		${unit.setValue( pathUrl, "params"  )};
	}

	function fn_makeSummerNote( id ){
		
		$('#'+id).summernote({
				height: 300,                 // ????????? ??????
				minHeight: null,             // ?????? ??????
				maxHeight: null,             // ?????? ??????
				focus: true,                  // ????????? ????????? ???????????? ????????? ??????
				lang: "ko-KR",					// ?????? ??????
				placeholder: '????????? ??????????????????.',	//placeholder ??????
				defaultFontName: '?????????',
				toolbar: [
				    // [groupName, [list of button]]
				    ['fontname', ['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    ['color', ['forecolor','color']],
				    ['table', ['table']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['insert',['link','video']],
		//  		    ['view', ['fullscreen', 'help']],
					['code', ['fullscreen', 'codeview']]
					],
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','?????? ??????','??????','?????????','??????','?????????','?????????'],
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			});
	}

	//?????????????????????????????? ?????? ????????????
	function ConvertSystemSourcetoHtml( PARAMS ){
		$.each(PARAMS, function(key, val){
			if( key.indexOf('TITL') > 0 ) {
				val = val.replace(/&/g,"&amp;");
				val = val.replace(/</g,"&lt;");   
				val = val.replace(/>/g,"&gt;");   
				val = val.replace(/\"/g,"&quot;");
				val = val.replace(/\'/g,"&#39;"); 
				val = val.replace(/\n/g,"<br />");
				PARAMS[key] = val.replace(/[?]/g,"&#63;");
			}
		});
		
		return PARAMS;
	}

	function ConvertHtmltoSystemSource( PARAMS ){
		$.each(PARAMS[0], function(key, val){
			if( key.indexOf('TITL') > 0 ) {
				val = val.replace(/&amp;/g,"&");
				val = val.replace(/&lt;/g,"<");   
				val = val.replace(/&gt;/g,">");   
				val = val.replace(/&quot;/g,'"');
				val = val.replace(/&#39;/g,"'"); 
				val = val.replace(/<br \/>/g,"\n");
				PARAMS[0][key] = val.replace(/&#63;/g,"?");
			}
		});
		return PARAMS;
	}


	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//????????? ??? ???????????? ???????????? ???????????? ????????? ??????
	var listCnt = '${out.params.listCnt}';
	if( listCnt == "" ) $('#selectListCnt').val(10);
	else $('#selectListCnt').val( listCnt );

function chkMail( mail ){
    if( fn_emailTest( mail ) > 0 ){
    	alert('????????? ????????? ????????????.'); 
    	$(this).val('');
    }
}

var snsChk = false;
$(document).on('change', '#SNS_NICK', function(){
	if ( this.value != '' ) {

		fn_BtnDupl( this.value , 'NICK');
		if( idIsc ) {
			snsChk = true;
		}else{
			snsChk = false;
			alert('?????? ???????????? ??????????????????.');
		}
		
	}else{
		snsChk = false;
	}
});

var mailChk = false;
$(document).on('change', '#SNS_MAIL', function(){
	if ( this.value != '' ) {

		fn_BtnDupl( this.value , 'EMAIL');
		if( idIsc ) {
			mailChk = true;
		}else{
			mailChk = false;
			alert('?????? ???????????? ??????????????????.');
		}
		
	}else{
		mailChk = false;
	}
});

var phChk = false;
$(document).on('change', '#SNS_PHONE', function(){
	if ( fn_isCelluar(this.value) ) {
		alert('???????????? ????????? ????????????.');
		this.value = '';
		return ;
	}	
	
	fn_BtnDupl( this.value , 'PHONE2');
	if( idIsc ) {
		phChk = true;
	}else{
		phChk = false;
		alert('?????? ???????????? ?????????????????????.');
	}
});

// SNS ????????????
$(document).on('click' ,'.snsPop' ,function(){
	
	if( $('[name=SNS_MAIL]').val() == '' || $('[name=SNS_MAIL]').val() == null ) return alert('???????????? ??????????????????.');
	if ( !mailChk ) return alert('?????? ???????????? ??????????????????. \n ?????? ???????????? ??????????????????.');
	if( $('[name=SNS_PHONE]').val() == '' || $('[name=SNS_PHONE]').val() == null ) return alert('????????? ????????? ??????????????????.');
	if ( !phChk ) return alert('?????? ???????????? ?????????????????????. \n ?????? ??????????????? ??????????????????.');
	if( $('[name=SNS_NICK]').val() == '' || $('[name=SNS_NICK]').val() == null ) return alert('???????????? ??????????????????.');
	if ( !snsChk ) return alert('?????? ???????????? ??????????????????. \n ?????? ???????????? ??????????????????.');
	
//	1. ????????? ????????? ?????? ???????????????
	var params = unit_getParams('insertAccount');
	params.status = "WRITE";
	params.query = "insertFrontAccountData";
	
// 	params.USER_NICK = USR_ID;
	if (USR_EMAIL == '' || USR_EMAIL == null || typeof USR_EMAIL == 'undefind' ) {
		params.USER_EMAIL = $('[name=SNS_MAIL]').val();
	}else{
		params.USER_EMAIL = USR_EMAIL;
	}
	params.USER_PHONE = $('[name=SNS_PHONE]').val();
		
	params.USER_LONG_NON_CONN_YN = 'N';
	params.USER_MAIL_YN = 'N';
	params.USER_PUSH_YN = 'N';
	params.USER_SMS_YN = 'N';
	params.USER_SNS_TYPE = USER_SNS_TYPE;
	params.USER_NICK = $('[name=SNS_NICK]').val();
	params.USER_NM = params.USER_NICK;

	params.USER_SNS_ID = USR_ID;
	
	var result = fn_DataAjax2( params );
	if ( result.out.resultCnt > 0 ) {
		alert('??????????????? ?????????????????????.');
		$('.popup_wrap').hide();
		var params = new Object();
		params.userEmail = USR_EMAIL;
		params.status = "CHECK";
		params.query = "selectFrontLoginCheck";
		params.SNS_TYPE = USER_SNS_TYPE;
		params.USER_SNS_ID = USR_ID;
		var result = fn_DataAjax2( params );
		if ( unit_isComplete(result) ){
			
			var jsonDetail = result.out.detail.data;
			if( !jsonDetail.length ){
				if( confirm( "??????????????? ????????????. \n???????????????????????????????") ){
					return location.href = "/front/account/register_select";
				}
			}
			
			var params = new Object();
			params.status = "WRITE";
			params.query = "insertFrontJoinCoup";
			params.USER_IDX = jsonDetail[0].USER_IDX;
			
			fn_DataAjax2( params );
			
			
			localStorage.setItem("frontLoginIdx", jsonDetail[0].USER_IDX ); 
			localStorage.setItem("frontLoginId", jsonDetail[0].USER_EMAIL ); 
			localStorage.setItem("frontUserType", jsonDetail[0].USER_TYPE ); 
			localStorage.setItem("frontUserPhone", jsonDetail[0].USER_PHONE ); 
			localStorage.setItem("frontUserSnsType", jsonDetail[0].USER_SNS_TYPE ); 
			localStorage.setItem("frontLoginNm", jsonDetail[0].USER_NM ); 
			localStorage.setItem("frontLoginNick", jsonDetail[0].USER_NICK ); 
			localStorage.setItem("frontLoginUuid", jsonDetail[0].USER_UUID ); 
			
			location.href='/front/main/index';
		}
	}
		
});
    
// var joinType = "";
// var USER_SNS_TYPE = "";
var USR_EMAIL = "";
// SNS ?????????
function fn_loginChk( joinType ){
// 	1. ????????? ????????? ?????? ???????????????
if ( joinType == "SNS" && USER_SNS_TYPE != "" ) {
	
	var params = new Object();
	params.USER_SNS_ID = USR_ID;
	params.status = "CHECK";
	params.query = "selectFrontLoginCheck";
	params.SNS_TYPE = USER_SNS_TYPE;
}
	
//	2. ????????? ?????? ???????????? ??????
	var result = fn_DataAjax2( params );
	if ( unit_isComplete(result) ){
		
		var jsonDetail = result.out.detail.data;
		if( !jsonDetail.length ){
			if( confirm( "??????????????? ????????????. \n???????????????????????????????") ){
				return location.href = "/front/account/register_select";
			}
		}
		
		localStorage.setItem("frontLoginIdx", jsonDetail[0].USER_IDX ); 
		localStorage.setItem("frontLoginId", jsonDetail[0].USER_EMAIL ); 
		localStorage.setItem("frontUserType", jsonDetail[0].USER_TYPE ); 
		localStorage.setItem("frontUserPhone", jsonDetail[0].USER_PHONE ); 
		localStorage.setItem("frontUserSnsType", jsonDetail[0].USER_SNS_TYPE ); 
		localStorage.setItem("frontLoginNm", jsonDetail[0].USER_NM ); 
		localStorage.setItem("frontLoginNick", jsonDetail[0].USER_NICK ); 
		localStorage.setItem("frontLoginUuid", jsonDetail[0].USER_UUID ); 
		if('${header.referer}'.indexOf('/front/mypeoplemade') > -1){
			location.replace('${header.referer}');
		}else{
			location.replace('/front/main/index');
		}
	}
}


// ??????/?????? ???????????? ??? ??????????????? ?????? ???????????? 
$('a').click(function(){
	var clickVal = $(this).attr('onclick')+'';
	clickVal = clickVal.replace('undefined','');
	if( clickVal != '' ) {
		if( $(this).attr('onclick').indexOf('fn_BtnRegist') > -1 ) {
			var tag = $(this);
			$(this).hide();
			
			setTimeout(function(){
				tag.show();
			}, 1000);
		}
	}
});

//???????????? ??????----------------------------------------------------------------------------------------
$('.prdt_apply_btn').on('click',function(){
	if ( localStorage.getItem("frontLoginIdx" ) == null || localStorage.getItem("frontLoginIdx" ) == "" ) return alert('???????????? ????????? ???????????????.');
	
	var path = window.location.pathname;
	path = path.split('/');
	path = '/'+path[1]+'/'+path[2]+'/'+path[3];
	
	if ( path.indexOf('/front/master/detail') > -1 ) {
		if ( $('div.prdt_select_result > div.prdt_select_item').length == 0 ) return alert('????????? ????????? ?????????.');
// 		if( prdtCd == null || prdtCd == '' ) {
// 			prdtCd = prdtCdSelect;
// 		}
		queryAdd = 'selectFrontMaster';
		
	} else {
		queryAdd = 'selectFrontPrdt';
	}
	
	$('#applyStep1Pop').show();
	fn_PrdtBuyDetail();
});

//?????????????????? ??????
$('.badge_red').on('click',function(){
	if ( localStorage.getItem("frontLoginIdx" ) == null || localStorage.getItem("frontLoginIdx" ) == "" ) {
		return alert('???????????? ????????? ???????????????.');
	}
	
	var path = window.location.pathname;
	path = path.split('/');
	path = '/'+path[1]+'/'+path[2]+'/'+path[3];
	
	if ( path.indexOf('/front/master/detail') > -1 ) queryAdd = 'selectFrontMaster';
	
	$('#applyStep1Pop').show();
	fn_PrdtBuyDetail( "NOW" );
	
//     var popup = $(this).data('popup');
//     popupFc(popup);
});


function fn_PrdtBuyDetail( NOW, DETAIL ) {
  	var params = new Object();
  	params.status = "LIST";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.cateIdx = cateIdx;
  	
    if( NOW != null && DETAIL == null ) {
      	params.query = queryAdd+"BuyList";
    	params.NOW = NOW;
    } else if( NOW != null && DETAIL != null ) {
      	params.query = queryAdd+"BuyDetail";
    	params.NOW = NOW;
    	params.prdtCd = prdtCd;
    } else {
      	params.query = queryAdd+"BuyDetail";
    	params.prdtCd = prdtCd;
    }
    
   	var jsonDetailInfo = fn_DataAjax2( params );
   	jsonDetailInfo = jsonDetailInfo.out.detail.data;
   	
   	var inTag = '';
   	
   	$('#applyStep1Pop .apply_popup_content').empty();
   	
	if( NOW != null && DETAIL == null ) {
// 		inTag += '   <button type="button" class="pop_close"></button>';
        
		inTag += '	<span class="mds_pay" style="position:absolute; top:20px; left:30px;">';
		inTag += '		<span>?????? ????????????</span>';
		inTag += '	</span>';
	   	inTag += '<button type="button" class="pop_close"></button>';
	   	
		inTag += '	<ul class="mds_list2">';
		 
	   	if( jsonDetailInfo.length > 0 ) {
	   		$.each(jsonDetailInfo,function(key,val){
//	 			imgIdValue = 'REVI_UUID';
//	 			setUuid( val.REVI_UUID );
//	 			unit_fileGet( imgIdValue + '_FILE' , "fn_fileUpload");
	   			inTag += '		<li class="mds_item2">';

	   			if( val.PRDT_CD.indexOf('FN') > -1 ) inTag += '			<span class="mds_cate">1:1????????????</span>';
	   			if( val.PRDT_CD.indexOf('CN') > -1 ) inTag += '			<span class="mds_cate">1:1????????????</span>';
	   			if( val.PRDT_CD.indexOf('LN') > -1 ) inTag += '			<span class="mds_cate">??????????????????</span>';
	   			
	   			inTag += '			<div class="mds_top">';
	   			inTag += '			<span>?????? ?????? ????????????</span><span class="mastetdot">??</span>';
	   			inTag += '			<span class="mds_time2">'+val.LATELY_TIME+'</span>';
	   			inTag += '			</div>';
	   			inTag += '			<span class="mds_title">';
	   			inTag += '					   <div class="prdt_price_inn">';
	   			inTag += '							<span class="sale">'+val.PRDT_DISC+''+val.DISC_CODE_NM+'</span>';
	   			inTag += '							<strong class="pay"><span>'+val.PRDT_PRIC_REAL+'</span> ???</strong>';
	   			inTag += '						</div>';
	   			inTag += '			</span>';
	   			inTag += '			 <button type="button" class="pop_open mds_btn prdt_apply_btn" onclick="prdtCd=\''+val.PRDT_CD+'\';">????????????</button>';
// 	   			inTag += '	<button type="button" class="apply_pop_btn_02 applyStep2InputPop" >??????</button>';
	   			inTag += '		</li>';
			});
	   	}
		
		inTag += '	</ul>';
		
	} else if( prdtCd.indexOf('VL') > -1 || prdtCd.indexOf('EN') > -1 ) {
		
		inTag += '<button type="button" class="pop_close"></button>';
		inTag += '<div class="apply_top">';
		inTag += '	<h3 class="pop_title">'+ jsonDetailInfo[0].INFO_PRDT_TITL1 + ' ' + jsonDetailInfo[0].INFO_PRDT_TITL2 +'</h3>';
		inTag += '	<span class="apply_select_category">'+ '#'+jsonDetailInfo[0].P_CODE_NM + ' ' + '#'+jsonDetailInfo[0].M_CODE_NM +'</span>';
		inTag += '</div>';
		inTag += '<div class="apply_content">';
		inTag += '	<h4 class="apply_title">?????? ?????? ??????</h4>';
		inTag += '	<div class="apply_complete_box">';
		inTag += '		<dl class="acb_list">';
		inTag += '			<dt>?????????</dt><dd>'+ jsonDetailInfo[0].INFO_PRDT_TITL1 + ' ' + jsonDetailInfo[0].INFO_PRDT_TITL2 + '</dd>';
		inTag += '			<dt>????????????</dt><dd>'+ jsonDetailInfo[0].SYS_REG_DTM + ' (' + jsonDetailInfo[0].SYS_REG_DTM_WEEK + ')' + '</dd>';
		inTag += '			<dt>????????????</dt><dd>' + jsonDetailInfo[0].PRDT_CNT + "???" + '</dd>';
		inTag += '			<dt class="total">?????? ??????</dt><dd class="total">'+ jsonDetailInfo[0].PRDT_PRIC_REAL+ "???" +'</dd>';
		inTag += '		</dl>';
		inTag += '		<p class="acb_text">????????? ???, ??????/?????? ????????? ???????????? ????????? ????????????.</p>';
		inTag += '	</div>';
		inTag += '</div>';
		inTag += '<div class="popup_bottom">';
		inTag += '		<a href="javascript:;"> <button class="apply_pop_btn_01 " >?????? ??????</button></a>';
		inTag += '</div>';
		
	} else {
	  	var params = new Object();
	  	params.status = "LIST";
	  	params.query = queryAdd + "BuyTimeList";
		params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
		params.prdtCd = prdtCd;
		params.cateIdx = cateIdx;
	      	
	   	var jsonDetail = fn_DataAjax2( params );
	   	jsonDetail = jsonDetail.out.detail.data;
        
	   	inTag += '<button type="button" class="pop_close"></button>';
	   	inTag += '<div class="apply_process_box">';
	   	inTag += '	<span class="ap_item current">1</span>';
	   	inTag += '	<span class="ap_item">2</span>';
	   	inTag += '	<span class="ap_item">3</span>';
	   	inTag += '</div>';
	   	
		inTag += '<div class="apply_top">';
		inTag += '	<h3 class="pop_title"></h3>';
		inTag += '	<span class="apply_select_category"></span>';
		inTag += '	<span class="apply_info">';
		inTag += '		<span></span>??? / <span></span>???';
		inTag += '	</span>';
		inTag += '	<p class="apply_text">';
		if( prdtCd.indexOf('FN') > -1 ) inTag += '		????????? ?????? ?????? ???????????? 1:1 ??????????????? ??????<br> ?????? ?????? ????????? ???????????? ??? ????????????.';
		if( prdtCd.indexOf('CN') > -1 ) inTag += '		????????? ?????? ?????? ???????????? 1:1 ??????????????? ??????<br> ?????? ?????? ????????? ???????????? ??? ????????????.';
		if( prdtCd.indexOf('LN') > -1 ) inTag += '		????????? ?????? ?????? ???????????? ????????????????????? ??????<br> ?????? ?????? ????????? ???????????? ??? ????????????.';
		inTag += '	</p>';
		inTag += '</div>';
		inTag += '<div class="apply_content">';
		inTag += '	<h4 class="apply_title">';
// 		inTag += '		???????????? ????????? ???????????????. ';
		inTag += '		<br class="m_show">';
		inTag += '		<b>(?????? ?????? ?????? ????????? <span class="firstTimeStr"></span>)</b>';
		inTag += '	</h4>';
		inTag += '	<div class="apply_select_date">';
		inTag += '<div class="asd_box">';
		inTag += '	<div class="asd_date_box">';
		inTag += '			 <!-- <button type="button" class="asd_btn asd_btn_prev"></button> -->';
		
	   	if( jsonDetail.length > 0 ) {
	   		var btnCnt = 0;
	   		$.each(jsonDetail,function(key,val){
//	 			imgIdValue = 'REVI_UUID';
//	 			setUuid( val.REVI_UUID );
//	 			unit_fileGet( imgIdValue + '_FILE' , "fn_fileUpload");
				
				if( key == 0 ) {
					inTag += '		<button type="button" class="asd_date_item">';
					inTag += '			<input name="asd_date_item" type="hidden" value="'+val.TIME_DTM+'"/>';
					inTag += '			<span class="day">'+val.TIME_DTM.slice(-2)+'</span>';
					inTag += '			<span>'+val.TIME_DTM_WEEK+'</span>';
					inTag += '		</button>';
					btnCnt++;
				} else {
					if( btnCnt < 7 ) {
						if( jsonDetail[key-1].TIME_DTM_WEEK != jsonDetail[key].TIME_DTM_WEEK ) {
							inTag += '		<button type="button" class="asd_date_item">';
							inTag += '			<input name="asd_date_item" type="hidden" value="'+val.TIME_DTM+'"/>';
							inTag += '			<span class="day">'+val.TIME_DTM.slice(-2)+'</span>';
							inTag += '			<span>'+val.TIME_DTM_WEEK+'</span>';
							inTag += '		</button>';
							btnCnt++;
						}
					}
				}
			});
	   	}

		inTag += '	</div>';
		inTag += '	<button type="button" class="asd_btn asd_btn_next"></button>';
		inTag += '</div>';

		inTag += '	</div>';
		inTag += '</div>';
		inTag += '<div class="popup_bottom">';
		inTag += '	<button type="button" class="apply_pop_btn_02 applyStep2InputPop" >??????</button>';
		inTag += '</div>';
	}
// 	inTag = '';
	$('#applyStep1Pop .apply_popup_content').append( inTag );
	
	if( NOW != null && DETAIL == null ) {
		$('.prdt_apply_btn').on('click',function(){
			if ( localStorage.getItem("frontLoginIdx" ) == null || localStorage.getItem("frontLoginIdx" ) == "" ) return alert('???????????? ????????? ???????????????.');
			
			var path = window.location.pathname;
			path = path.split('/');
			path = '/'+path[1]+'/'+path[2]+'/'+path[3];
			
			$('#applyStep1Pop').show();
			fn_PrdtBuyDetail( "NOW", "DETAIL" );
		});
		
	} else if( prdtCd.indexOf('VL') > -1 || prdtCd.indexOf('EN') > -1 ) {

		//????????????1----------------------------------------------------------------------------------------
		$('.apply_pop_btn_01').on('click', function(){
			baskArr.push(prdtCd);
			localStorage.setItem('baskArr',baskArr);
			
			baskArr.push(prdtCd);
			localStorage.setItem('baskArr',baskArr);
			 
// 			if( isMobile() ) location.href = '/front/payment/payment'; 
// 			else location.href = '/front/payment/payment2'; 

			var presentUrl = window.location.pathname;
			
			if( presentUrl.indexOf('cart') < 0 ) {
				if( isMobile() ) location.href = '/front/payment/payment'; 
				else location.href = '/front/payment/payment2'; 	
			} else {
				$('.popup_wrap').hide();
			}
		});
		
	} else {
	    
		$('#applyStep1Pop .apply_top > .pop_title').text( jsonDetailInfo[0].INFO_PRDT_TITL1 + ' ' + jsonDetailInfo[0].INFO_PRDT_TITL2 );
		$('#applyStep1Pop .apply_top > .apply_select_category').text( '#'+jsonDetailInfo[0].P_CODE_NM + ' ' + '#'+jsonDetailInfo[0].M_CODE_NM );
		$('#applyStep1Pop .apply_top > .apply_info > span').eq(0).text( jsonDetailInfo[0].PRDT_CNT );
		$('#applyStep1Pop .apply_top > .apply_info > span').eq(1).text( jsonDetailInfo[0].PRDT_PRIC_REAL );
		
		prdtNm = jsonDetailInfo[0].INFO_PRDT_TITL1 + ' ' + jsonDetailInfo[0].INFO_PRDT_TITL2;
		prdtType = '#'+jsonDetailInfo[0].P_CODE_NM + ' ' + '#'+jsonDetailInfo[0].M_CODE_NM;
		timeRun = jsonDetailInfo[0].PRDT_CNT;
		timePrice = jsonDetailInfo[0].PRDT_PRIC_REAL;
	
		if( timeDtm != null ) fn_PrdtBuyTimeList( timeDtm, timeIdx );
		else fn_PrdtBuyTimeList( $('.asd_date_item').eq(0).children('input').val() );
		
		$('.asd_date_item').on( 'click', function(){
		    $('.asd_date_box button').removeClass('active');
		    $(this).toggleClass('active');
		    
		 	fn_PrdtBuyTimeList( $(this).children('input').val() );
		});
		
	   	//???????????? ?????? 2
	   	$('.apply_pop_btn_02.applyStep2InputPop').on('click', function(){
	   		timeStr = [];
	   		timeDtm = [];
	   		timeWeek = [];
	   		timeIdx = [];
	
			timeStr.push( $('#applyStep1Pop .asd_time_item.active').text() );
			timeDtm.push( $('#applyStep1Pop .asd_date_item.active > input').val().slice(-2) );
			timeWeek.push( $('#applyStep1Pop .asd_date_item.active > span').eq(1).text() );
			$('#applyStep1Pop .asd_time_item.active > input').each(function(key,val){
				timeIdx.push( $(this).val() );
			});
	   		
	   		var returnVal = 0;
	   		if( timeIdx[0] == null ) returnVal = 1;
	   		if( timeDtm[0] == null ) returnVal = 1;
	   		if( timeWeek[0] == null ) returnVal = 1;
	   		if( timeStr[0] == null ) returnVal = 1; 
	   		
	   		if( returnVal == 1 ) return alert('??????/????????? ??????????????????.');
	
		    $('.ap_item').removeClass('current');
	   		fn_PrdtBuyQuesList( timeStr, timeDtm, timeIdx );
	   	});
	}

    $('.pop_close').on( 'click', function(){
        $('.popup_wrap').hide();
    });
	
	$('.asd_date_box button:eq(0)').trigger('click');
}

function fn_PrdtBuyTimeList( TIMEDTM, TIMEIDX ) {
  	var params = new Object();
  	params.status = "LIST";
  	params.query = queryAdd + "BuyTimeList";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.prdtCd = prdtCd;
	params.cateIdx = cateIdx;
	params.TIME_DTM = TIMEDTM;
    
   	var jsonDetail = fn_DataAjax2( params );
   	jsonDetail = jsonDetail.out.detail.data;

   	var inTag = '';
   	var inTimeVal = '';
   	$('.asd_time_box').empty();

   	if( jsonDetail.length > 0 ) {
		inTag += '<div class="asd_time_box">';
		
   		$.each(jsonDetail,function(key,val){
   			var timeIdxStr = timeIdx+'';
   			
   			if( key == 0 ) {
   				inTimeVal = val.TIME_STR;

   	   			inTag += '	<span class="asd_time">';
   	   			if( timeIdx.length == 0 ) inTag += '		<button type="button" class="asd_time_item">'+val.TIME_STR+'<input name="TIME_IDX" type="hidden" value="'+val.TIME_IDX+'"/></button>';
   	   			else {
   		   	   			if( timeIdxStr.indexOf( val.TIME_IDX ) > -1 ) inTag += '		<button type="button" class="asd_time_item active">'+val.TIME_STR+'<input name="TIME_IDX" type="hidden" value="'+val.TIME_IDX+'"/></button>';
   		   	   			else inTag += '		<button type="button" class="asd_time_item">'+val.TIME_STR+'<input name="TIME_IDX" type="hidden" value="'+val.TIME_IDX+'"/></button>';
   	   			}
   	   			inTag += '	</span>';
   	   			
   			} else {
   				if( inTimeVal != val.TIME_STR ) {
   	   	   			inTag += '	<span class="asd_time">';

   	   	   			if( timeIdx.length == 0 ) inTag += '		<button type="button" class="asd_time_item">'+val.TIME_STR+'<input name="TIME_IDX" type="hidden" value="'+val.TIME_IDX+'"/></button>';
   	   	   			else {
   	   					if( timeIdxStr.indexOf( val.TIME_IDX ) > -1 )  inTag += '		<button type="button" class="asd_time_item active">'+val.TIME_STR+'<input name="TIME_IDX" type="hidden" value="'+val.TIME_IDX+'"/></button>';
   		   	   			else inTag += '		<button type="button" class="asd_time_item">'+val.TIME_STR+'<input name="TIME_IDX" type="hidden" value="'+val.TIME_IDX+'"/></button>';
   	   	   			}
   	   	   			
   	   	   			inTag += '	</span>';
   				}
   			}
		});
   		
		inTag += '</div>';
		$('#applyStep1Pop .apply_select_date').append( inTag );
		inTag = '';

		$('.firstTimeStr').text( $('.asd_time_item').eq(0).text() );
		
		// ?????? _ ?????? ?????? ?????? toggle
		$('.asd_time_item').on( 'click', function(){
			$(this).toggleClass('active'); 
		});
		
		if( TIMEDTM != null ) {
			$('#applyStep1Pop .asd_date_item').each(function(){
				if( $(this).children('input').val() == TIMEDTM[0] ) {
					$(this).trigger('click');
				}
			});
		}
		
		if( TIMEIDX != null ) {
			$('#applyStep1Pop .asd_time_item').each(function(){
				if( $(this).children('input').val() == TIMEIDX[0] ) {
					$(this).addClass('active');
				}
			});
		}
   	}
}

function fn_PrdtBuyQuesList( TIMESTR, TIMEDTM, TIMEIDX ) {
  	var params = new Object();
  	params.status = "LIST";
  	params.query = queryAdd + "BuyQuesList";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.prdtCd = prdtCd;
	params.cateIdx = cateIdx;
    
   	var jsonDetail = fn_DataAjax2( params );
   	jsonDetail = jsonDetail.out.detail.data;

   	$('#applyStep1Pop .apply_popup_content').empty();

   	var inTag = '';
   	inTag += '<button type="button" class="pop_close"></button>';
   	inTag += '<div class="apply_process_box">';
   	inTag += '	<span class="ap_item ">1</span>';
   	inTag += '	<span class="ap_item current">2</span>';
   	inTag += '	<span class="ap_item">3</span>';
   	inTag += '</div>';
   	
   	inTag += '<div class="apply_top">';
   	inTag += '    <h3 class="pop_title"></h3>';
   	inTag += '    <span class="apply_select_category"></span>';
   	inTag += '    ';
   	inTag += '    <div class="apply_info_box">';
   	inTag += '        <span class="apply_info_item">';
   	inTag += '            ????????? ?????? <b>'+TIMEDTM[0]+' '+TIMESTR[0]+'</b>';
   	inTag += '        </span>';
   	inTag += '        <span class="apply_info_item"><input name="TIME_IDX" type="hidden" value="'+TIMEIDX[0]+'"/>';
   	inTag += '        		<span>'+timeRun+'</span>??? / <span>'+timePrice+'</span>???';
   	inTag += '        </span>';
   	inTag += '    </div>';
   	inTag += '</div>';
   	inTag += '';
   	inTag += '<div class="apply_content">';
   	inTag += '    <h4 class="apply_title">';
   	inTag += '        ????????? ????????? ????????? ???????????????.';
   	inTag += '    </h4>';
   	inTag += '';
   	inTag += '    <div class="apply_form_box">';
	
   	if( jsonDetail.length > 0 ) {
		
   		$.each(jsonDetail,function(key,val){
   			inTag += '<p class="apply_form_item">';
   			inTag += '    <label for="afi'+key+'">'+val.QUES_CNTN+'</label>';
   			inTag += '    <input type="hidden" name="QUES_IDX" value="'+val.QUES_IDX+'">';
   			inTag += '    <input type="text" id="afi'+key+'" name="DATA_CNTN" class="afi_input">';
   			inTag += '</p>';
   			dataQuesIdx.push( val.QUES_IDX );
		});
   	}
   	
   	inTag += '    </div>';
   	inTag += '</div>';
   	inTag += '';
   	inTag += '<div class="popup_bottom">';
   	inTag += '    <button type="button" class="apply_pop_btn_02 apply_pop_btn_02_gray_border prdt_apply_btn">??????</button>';
   	inTag += '    <button type="button" class="apply_pop_btn_02 applyStep2TextPop" >??????</button>';
   	inTag += '</div>';
		
	$('#applyStep1Pop .apply_popup_content').append( inTag );
	inTag = '';
	
	$('.firstTimeStr').text( $('.asd_time_item').eq(0).text() );


	    $('.pop_close').on( 'click', function(){
	        $('.popup_wrap').hide();
	    });
	//???????????? ?????? 3
	$('.apply_pop_btn_02.applyStep2TextPop').on('click', function(){
		var cntArr = 0;
		var cntTag = 0;
		dataQues = [];
		
		$('[name=DATA_CNTN]').each(function(key,val){
			cntTag++;
			if( $(this).val() != '') {
				dataQues.push( $(this).val() );
				cntArr++;
			}
		});
		
		if( cntTag > cntArr ) return alert('????????? ?????? ??????????????????.');
	    fn_PrdtBuyPayList();
	});

	$('.prdt_apply_btn').on('click',function(){
		$('#applyStep1Pop').show();
		fn_PrdtBuyDetail();
	});
}

function fn_PrdtBuyPayList( ) {
  	var params = new Object();
  	params.status = "LIST";
  	params.query = queryAdd + "BuyQuesList";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.prdtCd = prdtCd;
	params.cateIdx = cateIdx;
    
   	var jsonDetail = fn_DataAjax2( params );
   	jsonDetail = jsonDetail.out.detail.data;

   	$('#applyStep1Pop .apply_popup_content').empty();

   	var inTag = '';
   	inTag += '<button type="button" class="pop_close"></button>';
   	inTag += '<div class="apply_process_box">';
   	inTag += '	<span class="ap_item ">1</span>';
   	inTag += '	<span class="ap_item ">2</span>';
   	inTag += '	<span class="ap_item current">3</span>';
   	inTag += '</div>';
   	
   	inTag += '<div class="apply_top">';
   	inTag += '    <h3 class="pop_title">'+prdtNm+'</h3>';
   	inTag += '    <span class="apply_select_category">'+prdtType+'</span>';
   	inTag += '    <div class="apply_info_box no_category">';
   	inTag += '        <span class="apply_info_item">';
   	inTag += '            ?????? ????????? ??????????????????.';
   	inTag += '        </span>';
   	inTag += '    </div>';
   	inTag += '</div>';
   	inTag += '<div class="apply_content">';
   	inTag += '    <h4 class="apply_title">';
   	inTag += '        ?????? ?????? ??????';
   	inTag += '    </h4>';
   	inTag += '    <div class="apply_complete_box">';
   	inTag += '        <dl class="acb_list">';
   	inTag += '            <dt>?????????</dt>';
   	inTag += '            <dd>'+prdtNm+'</dd>';
   	inTag += '            <dt>?????? ??????</dt>';
   	inTag += '            <dd>'+timeDtm[0]+'(???)</dd>';
   	inTag += '            <dt>?????? ??????</dt>';
   	inTag += '            <dd>'+timeStr[0]+'</dd>';
   	inTag += '            <dt class="total">?????? ??????</dt>';
   	inTag += '            <dd class="total">'+timePrice+'???</dd>';
   	inTag += '        </dl>';
   	inTag += '        <p class="acb_text">';
   	inTag += '            ????????? ???, ??????/?????? ????????? ???????????? ????????? ????????????.';
   	inTag += '        </p>';
   	inTag += '    </div>';
   	inTag += '</div>';
   	inTag += '<div class="popup_bottom">';
   	inTag += '    <button type="button" class="apply_pop_btn_02 apply_pop_btn_02_gray_border applyStep2InputPop">??????</button>';
   	inTag += '    <a href="javascript:;"> <button class="apply_pop_btn_02 applyStep2PayPop">?????? ??????</button></a>';
   	inTag += '</div>';
	
	$('#applyStep1Pop .apply_popup_content').append( inTag );
	inTag = '';

    $('.pop_close').on( 'click', function(){
        $('.popup_wrap').hide();
    });
	
   	//???????????? ?????? 2
   	$('.apply_pop_btn_02.applyStep2InputPop').on('click', function(){
   		fn_PrdtBuyQuesList( timeStr, timeDtm, timeIdx );

		$.each(dataQues,function(key, val){
			$('[name=DATA_CNTN]').eq(key).val( val );
		});
   	});
    
	//???????????? ?????? 3
	$('.apply_pop_btn_02.applyStep2PayPop').on('click', function(){

// 		????????? ????????????
		$.each(dataQues,function(key, val){
			
			var params = unit_getParams("searchArea");
			params.status = "WRITE";
			
			if( queryAdd.indexOf('Prdt') > -1 ) params.query = "insertFrontPrdtQuesData";
			else params.query = "insertFrontMasterQuesData";

			params.QUES_IDX = dataQuesIdx[key];
			params.DATA_CNTN = val;
			params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
			
			var result = fn_DataAjax( params );
// 			location.href='${unit.move("index", "" )}';
			
		});

		var arrEnchant = '';
		if( prdtCd.indexOf('VL') < 0 || prdtCd.indexOf('EN') < 0 ) {
			$.each(timeIdx, function(key,val){
				arrEnchant = prdtCd+'_'+val;
				var baskArrStr = localStorage.getItem('baskArr')+'';
				
				if( baskArrStr != '' || baskArrStr != 'null' ) {
					if( baskArrStr.indexOf(arrEnchant) < 0 ) {
						console.log( arrEnchant );
						baskArr.push(arrEnchant);
						localStorage.setItem('baskArr',baskArr);
					}
				} else {
					baskArr.push(arrEnchant);
					localStorage.setItem('baskArr',baskArr);
				}
				
			});
		}

// 		baskTimeIdxArr.push(timeIdx);
// 		localStorage.setItem('baskTimeIdxArr',baskTimeIdxArr);
		
		var presentUrl = window.location.pathname;
		
		if( presentUrl.indexOf('cart') < 0 ) {
			if( isMobile() ) location.href = '/front/payment/payment'; 
			else location.href = '/front/payment/payment2'; 	
		} else {
			$('.popup_wrap').hide();
		}
		
	});
}


</script>






