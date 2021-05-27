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
 
 
   <div id="footer" class="footer">
        <div class="section_inner">
            <h2 class="footer_logo"><a href="/front/main/index">PEOPLEMADE</a></h2>
            <div class="footer_gnb_box">
                <ul class="footer_gnb">
                    <li><a href="/front/service/terms">서비스 이용약관</a></li>
<!--                     <li><a href="/front/service/privacy">개인정보처리방침</a></li> -->
                    <li><a href="/front/service/notice_paper">언론보도</a></li>
                    <li><a href="/front/service/event">이벤트</a></li>
                    <li><a href="/front/faq/faq">FAQ</a></li>
                    <li><a href="/front/service/inquiry">1:1문의하기</a></li>
                    <li><a href="/front/service/inquiry?1">제휴/협력문의</a></li>
                    <li><a href="/front/master_apply/door"  style="color:#27f1d5; font-weight: bold;">마스터지원</a></li>
                </ul>
                <ul class="footer_sns tablets_footer_sns">
                    <li><a onclick="alert('준비중입니다.')" class="insta">instagram</a></li>
                    <li><a onclick="alert('준비중입니다.')" class="face">facebook</a></li>
                    <li><a onclick="alert('준비중입니다.')" class="youtube">youtube</a></li>
<!--                     <li><a href="#" target="_blank" class="insta">instagram</a></li> -->
<!--                     <li><a href="#" target="_blank" class="face">facebook</a></li> -->
<!--                     <li><a href="#" target="_blank" class="youtube">youtube</a></li> -->
                </ul>
            </div>
            <p class="footer_text">
                <b>(주)피플메이드</b>
                <br>
                <span class="mo_block">대표자:함연식<span class="space"></span></span>
                <span class="mo_block">사업자등록번호:167-88-01576<span class="space"></span>
                <span class="mo_block">통신판매업신고번호:2020-서울서초-1641호<span class="space"></span></span>
                <span class="mo_block">고객센터:070-7732-7105<span class="space"></span></span>
                <br class="mo_none">
                서울특별시 서초구 서초대로 79길 40, 1001호
                <br><br>
                ⓒ2020(주)피플메이드. All rights reserved.
            </p>

            <div class="top_fixed">
<!--                 <button type="button" class="top_btn chat_btn"></button> -->
                <button type="button" class="top_btn phones_top_btn tablets_top_btn"></button>
            </div>
        </div>
    </div><!-- // #footer -->
   
	</div>
	
	<input type="hidden" id="imgTag" name="imgTag"/>
	
	
	<!-- SNS 회원가입 부족한 데이터 받는 팝업 -->
	<div id="snsDataPop" class="popup_wrap" style="display:none;">
                        <div class="popup_layer"></div>
                        <div class="popup_box">
                                <div class="popup_content register_popup_content2 tablets_register_popup_content2 phones_register_popup_content2">
                                    <button type="button" class="pop_close"></button>
                                    
                                    <div class="register_pop_box">
                                        <h4 class="rp_title">간편가입</h4>
                                        <p class="rp_text">
<!--                                         이메일과 휴대폰번호는 필수 항목입니다.  -->
                                        이메일과 휴대폰번호를 입력하여 주시기 바랍니다.
                                        </p>

                                        <div class="rp_box tablets_rp_box phones_rp_box" >
                                            <p class="rp_box_item tablets_rp_box_item phones_rp_box_item">
												<label for="" class="rp_label tablets_rp_label phones_rp_label">e-mail</label>
                                                <input type="text" id="SNS_MAIL" name="SNS_MAIL" class="rp_input2" placeholder="ex)abc@gmail.net" onchange="if( fn_emailTest(this.value)  > 0 ){ alert('이메일 형식이 아닙니다.');  this.value= '' ;}">
                                            </p>
                                             <p class="rp_box_item tablets_rp_box_item phones_rp_box_item" >
												<label for="" class="rp_label tablets_rp_label phones_rp_label">휴대폰</label>
                                                <input type="text" id="SNS_PHONE" name="SNS_PHONE" class="rp_input2" placeholder="ex)010********" maxlength="11" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                                            </p>
                                             <p class="rp_box_item tablets_rp_box_item phones_rp_box_item" >
												<label for="" class="rp_label tablets_rp_label phones_rp_label">닉네임</label>
                                                <input type="text"  id="SNS_NICK" name="SNS_NICK" class="rp_input2" placeholder="닉네임, 최대 12자" maxlength="12">
                                            </p>
										</div>
                                    </div>
                                    <div class="popup_bottom tablets_popup_bottom phones_popup_bottom">
                                        <button type="button" style="
                                                    min-width: 100px;
												    height: 30px;
												    margin-right: 2px;
												    font-size: 14px;
												    line-height: 30px;
												    color: #000;
												    letter-spacing: -.2px;
												    background-color: cyan;
												    text-align: center;
                                                " class="apply_pop_btn snsPop" >확인</button>
                                    </div>
                                </div>
                            </div>
    </div><!-- //#snsDataPop -->
	
	


<div id="applyStep1Pop" class="popup_wrap">
         <div class="popup_layer"></div>
         <div class="popup_box">
             <div class="popup_content apply_popup_content tablets_apply_popup_content phones_apply_popup_content" >
             </div>
         </div>
</div><!-- //#applyStep1Pop -->
	
	
</body>
<!-- Channel Plugin Scripts -->
<script  type="text/javascript">

// 매 페이지 회원이 탈퇴했는지 확인하여 로그아웃 시키기
if ( localStorage.getItem('frontLoginIdx') != null && localStorage.getItem('frontLoginIdx') != '' && localStorage.getItem('frontLoginIdx') != undefined ) {
	
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectFrontUserHasSecession";
	params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
	
	var userHasSecession = ${unit.ajax( '/front/main/ajax', "ajax", "params")};
	
	if ( userHasSecession.out.detail.data[0].USER_USE_YN == 'N' ) {
		fn_BtnLogout();
	}
	
}



var cateIdx = '${out.params.cateIdx}';
var prdtCd = '${out.params.prdtCd}';

//장바구니 토글 제어용 변수
var clickBtn = '';

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
var isMypageSetTime = 0;

if ( window.location.pathname.indexOf('/chat_review') == -1 && window.location.pathname.indexOf('solution') == -1 && window.location.pathname.indexOf('vod_player') == -1 && window.location.pathname.indexOf('master/detail') == -1 && window.location.pathname.indexOf('prdt/detail') == -1 ) {
	
	setTimeout(function(){
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
	}, 10000);
}

////////////////////////////////////////////
// 1. 변수 정의
////////////////////////////////////////////
// SNS 로그인 하면서 쓰게 될 값
var joinType = "";
var USER_SNS_TYPE = "";
var USR_ID = "";
var USR_NICK = "";
var USR_AGE = "";
var USR_BIRTHDAY = "";
var USR_GENDER = "";

////////////////////////////////////////////
// 2. 온로드 정의
////////////////////////////////////////////

    //로그인 회원가입 내프로필로 변경
	if ( localStorage.getItem("frontLoginIdx" ) == null || localStorage.getItem("frontLoginIdx" ) == "" ) {
		$('.hmlogin').show();
	} else {
		$('#LOGIN_USER_NICK').text( localStorage.getItem("frontLoginNick") );
		// 모바일친구들
		$('.mmi_name').text( localStorage.getItem("frontLoginNick") );
		$('.mmi_email').text( localStorage.getItem("frontLoginId") );
		
		$('.hmlogout').show();
		$('.hmlogin').hide();
		
	}


     //햄버거 버튼페이지 마이피플버튼
  	if ( localStorage.getItem("frontLoginIdx" ) == null || localStorage.getItem("frontLoginIdx" ) == "" ) {
		$('.mo_mypeople').hide();
	} else {
		$('#LOGIN_USER_NICK').text( localStorage.getItem("frontLoginNick") );
		$('.mo_mypeople').show();
	}
	//햄버거 버튼페이지 로그인
	if ( localStorage.getItem("frontLoginIdx" ) == null || localStorage.getItem("frontLoginIdx" ) == "" ) {
			$('.mo_my_info_logout').show();
			$('.mo_my_info_login').hide();
	} else {
		$('#LOGIN_USER_NICK').text( localStorage.getItem("frontLoginNick") );
		$('.mo_my_info_login').show();
		$('.mo_my_info_logout').hide();
	}
		
		
    // 팔로잉 버튼
//     var $follow = $('.mc_follow_btn');

//     $follow.on( 'click', function(){
//         $(this).toggleClass('active');
//         if( $(this).hasClass('active') ) $(this).text('팔로잉');
//         else $(this).text('팔로우');
//     });
    
    //마스터면, 마스터지원 가려주기
	if( localStorage.getItem("frontUserType") == 'M' ) $('.footer_gnb li a.fg_title').eq(7).hide();

	//배너
    $('.topbar_close').on('click',function(){
        $('.topbar').css( '<style>.topbar{display:none !important;}</style>' );
    });
	
	
	$(function(){
		if( localStorage.getItem("frontLoginUuid") != null &&  localStorage.getItem("frontLoginUuid") != undefined && localStorage.getItem("frontLoginUuid") != '' && localStorage.getItem("frontLoginUuid") != 'undefined' ) {
	    	fn_setUserUuid( localStorage.getItem("frontLoginUuid"), 'USER_UUID_FILE' );
			
			$('.profile > .img-area > img').attr( 'src', $('#imgTag').val() );
			$('.hm_thumb').css({'background-image': 'url('+$('#imgTag').val()+')'});
		    $('.myinfo_thumb_label').css({'background-image': 'url('+$('#imgTag').val()+')'});
		    $('.mmi_thumb').css({'background-image': 'url('+$('#imgTag').val()+')'});
		    
	     	imgIdValue = '';
			$('#imgTag').val('');
		}
    	
    	$('.hm_name').html( localStorage.getItem("frontLoginNm") );
    	$('.profile div.text-area > strong').html( localStorage.getItem("frontLoginNm") );
    	
    	if ( localStorage.getItem("frontUserInfo") != null &&  localStorage.getItem("frontUserInfo") != undefined && localStorage.getItem("frontUserInfo") != '' && localStorage.getItem("frontUserInfo") != 'undefined'  ) {
	    	$('.profile div.text-area > p.profile-info').html( localStorage.getItem("frontUserInfo") );
		}else{
	    	$('.profile div.text-area > p.profile-info').html( '' );
		}
    	
    	// samesite 쿠키 정책 때문에 세션 만료시 작동
    	if ( '${sessionScope.LOGIN_IDX}' == '' && localStorage.getItem("frontLoginIdx") != null ) {
    		var reissue = new Object();
    		reissue.status = "REISSUANCEID";
    		reissue.query = "selectReissuanceId";
    		reissue.USER_IDX = localStorage.getItem("frontLoginIdx");
    		fn_DataAjax2( reissue );	
    	}
    	
    });
    
    
    
    
//     간편로그인 시작//     간편로그인 시작//     간편로그인 시작//     간편로그인 시작//     간편로그인 시작//     간편로그인 시작//     간편로그인 시작
//     간편로그인 시작//     간편로그인 시작//     간편로그인 시작//     간편로그인 시작//     간편로그인 시작//     간편로그인 시작//     간편로그인 시작
//     간편로그인 시작//     간편로그인 시작//     간편로그인 시작//     간편로그인 시작//     간편로그인 시작//     간편로그인 시작//     간편로그인 시작
//     간편로그인 시작//     간편로그인 시작//     간편로그인 시작//     간편로그인 시작//     간편로그인 시작//     간편로그인 시작//     간편로그인 시작

	//카카오톡 간편로그인 API
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
								// 부족한 정보 입력 창 열기
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
											alert('이미 '+SNS_TYPE+' 으로 가입된 이메일입니다.');
											return location.href = "/front/account/login";
										}
									}
								}
								
								if ( USR_EMAIL != '' && USR_EMAIL != null && typeof USR_EMAIL != 'undefind'  ) {
									$('[name=SNS_MAIL]').val( USR_EMAIL );
									$('[name=SNS_MAIL]').prop('disabled',true);
									mailChk = true;
								}
								
								//가입 시
								$('[name=SNS_PHONE]').val( '' );
								$('[name=SNS_NICK]').val( USR_NICK );
								
								fn_BtnDupl( USR_NICK , 'NICK');
								if( idIsc ) {
									snsChk = true;
								}else{
									snsChk = false;
									setTimeout(function(){
										alert('사용 불가능한 닉네임입니다.');
										$('[name=SNS_NICK]').val('');
									}, 500);
								}
								
							} else if (window.location.pathname.indexOf('login') > -1) fn_loginChk(joinType);
						}
					});
				},
				fail : function(err) {
					alert('계정정보 수집에 실패하였습니다.');
				}
			});
			$('#create-kakao-login-btn').text('카카오계정으로 로그인');
		}
		if (window.location.pathname.indexOf('register') > -1 || ( window.location.pathname.indexOf('login') > -1 && window.location.pathname.indexOf('loginCallback') == -1  )) startApp();
		
	});

	//구글 간편로그인 API
	var googleUser = {};
	var startApp = function() {
		gapi.load( 'auth2', function() {
							// Retrieve the singleton for the GoogleAuth library and set up the client.
							auth2 = gapi.auth2.init({
									// 클라이언트 ID 설정하기
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
						alert('이미 '+SNS_TYPE+' 으로 가입된 이메일입니다.');
						return location.href = "/front/account/login";
					}
				}
				//가입 시
				$('[name=SNS_MAIL]').val( USR_EMAIL );
				$('[name=SNS_MAIL]').prop('disabled',true);
				mailChk = true;
				$('[name=SNS_PHONE]').val( '' );
				$('[name=SNS_NICK]').val( USR_NICK );
				
				// 부족한 정보 입력 창 열기
				$('.popup_wrap').hide();
		        $('#snsDataPop').show();
				
				setTimeout(function(){
		      	  fn_BtnDupl( USR_NICK , 'NICK');
					if( idIsc ) {
						snsChk = true;
					}else{
						snsChk = false;
						alert('사용 불가능한 닉네임입니다.');
						$('[name=SNS_NICK]').val('');
					}
				}, 100);// setTimeout			

			} else if (window.location.pathname.indexOf('login') > -1) {
				fn_loginChk(joinType);
			}

		}, function(error) {
			alert('계정정보 수집에 실패하였습니다.');
		});
	}

	//네이버 간편로그인 API
	if (window.location.href.indexOf('register_') > -1) {
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "W4yZZxviePKBNPpjyA8G",//로컬 용
// 			clientId : "cJME75uYUeMQFAzAHfZe",//beta.so 용
			
			callbackUrl : "https://"+location.host+"/front/account/joinCallback2",
			isPopup : false, /* 팝업을 통한 연동처리 여부 */
			loginButton : { color : "green", type : 3, height : 60 }
		/* 로그인 버튼의 타입을 지정 */
		});

		/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init(); 
		$('#naverIdLogin a img').after('네이버 아이디로 로그인');
		
	}else if (window.location.href.indexOf('register') > -1) {
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "W4yZZxviePKBNPpjyA8G",
			callbackUrl : "https://"+location.host+"/front/account/joinCallback",
			isPopup : false, /* 팝업을 통한 연동처리 여부 */
			loginButton : { color : "green", type : 3, height : 60 }
		/* 로그인 버튼의 타입을 지정 */
		});

		/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init(); 
		$('#naverIdLogin a img').after('네이버 아이디로 로그인');
		
	}else if (window.location.href.indexOf('login') > -1) {
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "W4yZZxviePKBNPpjyA8G",
			callbackUrl : "https://"+location.host+"/front/account/loginCallback",
			isPopup : false, /* 팝업을 통한 연동처리 여부 */
			loginButton : { color : "green", type : 3, height : 60 }
		/* 로그인 버튼의 타입을 지정 */
		});

		/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init();
		$('#naverIdLogin a img').after('네이버 아이디로 로그인');
	}else if (window.location.href.indexOf('door') > -1) {
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "W4yZZxviePKBNPpjyA8G",
			callbackUrl : "https://"+location.host+"/front/account/loginCallback2",
			isPopup : false, /* 팝업을 통한 연동처리 여부 */
			loginButton : { color : "green", type : 3, height : 60 }
		/* 로그인 버튼의 타입을 지정 */
		});

		/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init();
		$('#naverIdLogin a img').after('네이버 아이디로 로그인');
	}

	var referer = '${header.referer}';
	if (referer.indexOf('Callback') > -1) {
		naverLogin.getLoginStatus(function(status) {
			if (status) {
				/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
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
							alert('이미 '+SNS_TYPE+' 으로 가입된 이메일입니다.');
							return location.href = "/front/account/login";
						}
					}
					
					$('[name=SNS_MAIL]').val( USR_EMAIL );
					$('[name=SNS_MAIL]').prop('disabled',true);
					$('[name=SNS_PHONE]').val( '' );
					$('[name=SNS_NICK]').val( USR_NICK );
					mailChk = true;
					
					// 부족한 정보 입력 창 열기
					$('.popup_wrap').hide();
			        $('#snsDataPop').show();
			        setTimeout(function(){
			        	
						fn_BtnDupl( USR_NICK , 'NICK');
						if( idIsc ) {
							snsChk = true;
						}else{
							snsChk = false;
							alert('사용 불가능한 닉네임입니다.');
							$('[name=SNS_NICK]').val('');
						}
			        });
					
				} else if (window.location.pathname.indexOf('login') > -1) {
					fn_loginChk(joinType);
				}
				if (opener) window.open().self.close();
			} 
			else {
				alert('계정정보 수집에 실패하였습니다.');
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
// 				  console.log('Not logged in.');
				  return;
			}
			Kakao.Auth.logout();

		}else if (type == 'G') {
			
		}
	}
	
	//2. 유효성 검사 서비스로 이동
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
		$('[name='+OBJECT_ID+']').append('<option value="">선택해주세요</option>');
		
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
		$('[name='+OBJECT_ID+']').append('<option value="">선택해주세요</option>');
		$('[name='+OBJECT_ID+']').append('<option value="ALL">전체</option>');
		
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
		$('[name='+OBJECT_ID+']').append('<option value="">선택해주세요</option>');
		
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
						//첨부된 사진 데이터 출력
						$('[name='+key+']').val(val);
						setUuid( $('[name='+key+']').val() );
						imgIdValue = key+"_FILE";
						unit_fileGet( imgIdValue, "fn_fileUpload");
					} else if( key.indexOf('YN') > -1 ) {
						//체크박스 출력
						if( val == 'Y') $('input:checkbox[name='+key+']').prop('checked',true);
						else $('input:checkbox[name='+key+']').prop('checked',false);
						$('#'+key+'').html(val);
					} else {
						//일반 데이터 출력
						if( key.indexOf("IDX") > -1 ) $('#'+key+'').val(val);
						else $('#'+key+'').html(val);
					}
				} else if( result.pageCd == 'edit') {
					if( key.indexOf('YN') > -1 ) {
// 						$('input:radio[name='+key+']:radio[value='+val+']').prop('checked',true);
						if( val == 'Y') $('input:checkbox[name='+key+']').prop('checked',true);
						else $('input:checkbox[name='+key+']').prop('checked',false);
					} else {
						//일반 데이터 출력
						$('[name='+key+']').val(val);
						if( key.indexOf("UUID") > -1 ) {
							//첨부된 사진 데이터 출력
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
										alertVal = $('[name="'+key+'"]').parents('tr').children('th').text() + '을/를 입력해주세요';
									}
							} else {
								if( $('[name="'+key+'"]').is(':visible') ) {
									if( val == '' || val == null ) {
										returnVal = 1;
										alertKey = key;
										alertVal = $('[name="'+key+'"]').parents('tr').children('th').text() + '을/를 입력해주세요';
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
											alertVal = $('[name="'+key+'"]').parents('tr').children('th').text() + '을/를 입력해주세요';	
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
				height: 300,                 // 에디터 높이
				minHeight: null,             // 최소 높이
				maxHeight: null,             // 최대 높이
				focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				lang: "ko-KR",					// 한글 설정
				placeholder: '내용을 입력해주세요.',	//placeholder 설정
				defaultFontName: '돋음체',
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
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			});
	}

	//크로스사이트스크립트 문자 치환기능
	function ConvertSystemSourcetoHtml( PARAMS ){
		$.each(PARAMS, function(key, val){
			if( key.indexOf('TITL') > 0 ) {
				val = val.replace(/&/g,"&amp;");
				val = val.replace(/</g,"&lt;");   
				val = val.replace(/>/g,"&gt;");   
				val = val.replace(/\"/g,"&quot;");
				val = val.replace(/\'/g,"&#39;"); 
				val = val.replace(/\n/g,"<br/>");
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
	//페이징 한 페이지에 출력되는 게시물의 개수를 조절
	var listCnt = '${out.params.listCnt}';
	if( listCnt == "" ) $('#selectListCnt').val(10);
	else $('#selectListCnt').val( listCnt );

function chkMail( mail ){
    if( fn_emailTest( mail ) > 0 ){
    	alert('이메일 형식이 아닙니다.'); 
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
			alert('사용 불가능한 닉네임입니다.');
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
			alert('사용 불가능한 이메일입니다.');
		}
		
	}else{
		mailChk = false;
	}
});

var phChk = false;
$(document).on('change', '#SNS_PHONE', function(){
	if ( fn_isCelluar(this.value) ) {
		alert('전화번호 형식이 아닙니다.');
		this.value = '';
		return ;
	}	
	
	fn_BtnDupl( this.value , 'PHONE2');
	if( idIsc ) {
		phChk = true;
	}else{
		phChk = false;
		alert('사용 불가능한 전화번호입니다.');
	}
});

// SNS 회원가입
$(document).on('click' ,'.snsPop' ,function(){
	
	if( $('[name=SNS_MAIL]').val() == '' || $('[name=SNS_MAIL]').val() == null ) return alert('이메일을 입력해주세요.');
	if ( !mailChk ) return alert('이미 존재하는 이메일입니다. \n 다른 이메일을 설정해주세요.');
	if( $('[name=SNS_PHONE]').val() == '' || $('[name=SNS_PHONE]').val() == null ) return alert('휴대폰 번호를 입력해주세요.');
	if ( !phChk ) return alert('이미 존재하는 전화번호입니다. \n 다른 전화번호를 설정해주세요.');
	if( $('[name=SNS_NICK]').val() == '' || $('[name=SNS_NICK]').val() == null ) return alert('닉네임을 입력해주세요.');
	if ( !snsChk ) return alert('이미 존재하는 닉네임입니다. \n 다른 닉네임을 설정해주세요.');
	
//	1. 유효성 검사를 위한 파라미터값
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
		alert('회원가입이 완료되었습니다.');
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
				if( confirm( "회원정보가 없습니다. \n회원가입하시겠습니까?") ){
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
// SNS 로그인
function fn_loginChk( joinType ){
// 	1. 유효성 검사를 위한 파라미터값
if ( joinType == "SNS" && USER_SNS_TYPE != "" ) {
	
	var params = new Object();
	params.USER_SNS_ID = USR_ID;
	params.status = "CHECK";
	params.query = "selectFrontLoginCheck";
	params.SNS_TYPE = USER_SNS_TYPE;
}

//	2. 유효성 검사 서비스로 이동
	var result = fn_DataAjax2( params );
	if ( unit_isComplete(result) ){
		
		var jsonDetail = result.out.detail.data;
		if( !jsonDetail.length ){
			if( confirm( "회원정보가 없습니다. \n회원가입하시겠습니까?") ){
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


// 등록/수정 버튼클릭 시 중복방지를 위한 숨김처리 
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

//신청하기 버튼----------------------------------------------------------------------------------------
$(document).on('click',  '.prdt_apply_btn.masterHomeDetail', function(){
	if ( localStorage.getItem("frontLoginIdx" ) == null || localStorage.getItem("frontLoginIdx" ) == "" ){
		alert('로그인이 필요한 기능입니다.');
		return location.href = '/front/account/login';
	}
	
	var path = window.location.pathname;
	path = path.split('/');
	path = '/'+path[1]+'/'+path[2]+'/'+path[3];
	
	if ( path.indexOf('/front/master/detail') > -1 ) {
		if ( !$(this).hasClass('noSelect') ) 
			if ( $('div.prdt_select_result > div.prdt_select_item').length == 0 ) return alert('상품을 선택해 주세요.');
		
		queryAdd = 'selectFrontMaster';
		
	} else {
		if ( ( prdtCd.indexOf('COACHING') > -1 || prdtCd.indexOf('CN') > -1 || prdtCd.indexOf('FN') > -1 )  && $('div.prdt_select_result > div.prdt_select_item').length == 0 ) return alert('상품을 선택해 주세요.');
		queryAdd = 'selectFrontPrdt';
	}
	
	$('#applyStep1Pop').show();
	
	dataQues = [];
	timeStr = [];
	timeDtm = [];
	timeWeek = [];
	timeIdx = [];
	
	fn_PrdtBuyDetail();
});

//즉시코칭가능 버튼
$('.badge_red').on('click',function(){
	
	if ( localStorage.getItem("frontLoginIdx" ) == null || localStorage.getItem("frontLoginIdx" ) == "" ) {
		alert('로그인이 필요한 기능입니다.');
		return location.href = '/front/account/login';
	}
	
	var path = window.location.pathname;
	path = path.split('/');
	path = '/'+path[1]+'/'+path[2]+'/'+path[3];
	
	if ( path.indexOf('/front/master/detail') > -1 ) queryAdd = 'selectFrontMaster';

	$('.popup_content').css('height','auto !important');
	$('#applyStep1Pop').show();
	
	dataQues = [];
	timeStr = [];
	timeDtm = [];
	timeWeek = [];
	timeIdx = [];
	
	fn_PrdtBuyDetail( "NOW" );
	
//     var popup = $(this).data('popup');
//     popupFc(popup);
});


function fn_PrdtBuyDetail( NOW, DETAIL ) {
  	var params = new Object();
  	params.status = "LIST";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.cateIdx = cateIdx;
  	
    if( NOW != null  &&( DETAIL == null || DETAIL == '' ) ) {
      	params.query = queryAdd+"BuyList";
    	params.NOW = NOW;
    } else if( NOW != null && DETAIL != null && DETAIL != '' ) {
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
   	
   	if ( jsonDetailInfo.length == 0 ) {
   		$('#applyStep1Pop').hide();
		return alert(' 즉시 코칭가능한 시간이 없습니다. ');
	}
   	
   	$('#applyStep1Pop .apply_popup_content').empty();
   	
	if( NOW != null && DETAIL == null ) {
// 		inTag += '   <button type="button" class="pop_close"></button>';
        
		inTag += '	<span class="mds_pay" style="position:absolute; top:20px; left:30px;">';
		inTag += '		<span>즉시 코칭가능</span>';
		inTag += '	</span>';
	   	inTag += '<button type="button" class="pop_close"></button>';
	   	
		inTag += '	<ul class="mds_list2">';
		 
	   	if( jsonDetailInfo.length > 0 ) {
	   		$.each(jsonDetailInfo,function(key,val){
	   			inTag += '		<li class="mds_item2">';

	   			if( val.PRDT_CD.indexOf('FN') > -1 ) inTag += '			<span class="mds_cate">1:1화상코칭</span>';
	   			if( val.PRDT_CD.indexOf('CN') > -1 ) inTag += '			<span class="mds_cate">1:1채팅코칭</span>';
	   			if( val.PRDT_CD.indexOf('LN') > -1 ) inTag += '			<span class="mds_cate">라이브클래스</span>';
	   			
	   			inTag += '			<div class="mds_top">';
	   			inTag += '			<span>가장 빠른 예약시간</span><span class="mastetdot">·</span>';
	   			inTag += '			<span class="mds_time2">'+val.LATELY_TIME+'</span>';
	   			inTag += '			</div>';
	   			inTag += '			<span class="mds_title">';
	   			inTag += '					   <div class="prdt_price_inn">';
	   			inTag += '							<span class="sale">'+val.PRDT_DISC+''+val.DISC_CODE_NM+'</span>';
	   			inTag += '							<strong class="pay"><span>'+val.PRDT_PRIC_REAL+'</span> 원</strong>';
	   			inTag += '						</div>';
	   			inTag += '			</span>';
	   			inTag += '			 <button type="button" class="pop_open mds_btn prdt_apply_btn noSelect" onclick="prdtCd=\''+val.PRDT_CD+'\';">신청하기</button>';
	   			inTag += '		</li>';
			});
	   	}
		
		inTag += '	</ul>';
		
		$('.popup_content').css('height','auto');
		
	} else if( prdtCd.indexOf('VL') > -1 || prdtCd.indexOf('EN') > -1 ) {
		
		inTag += '<button type="button" class="pop_close"></button>';
		inTag += '<div class="apply_top">';
		inTag += '	<h3 class="pop_title">'+ jsonDetailInfo[0].INFO_PRDT_TITL1 + '<br>' + jsonDetailInfo[0].INFO_PRDT_TITL2 +'</h3>';
		inTag += '	<span class="apply_select_category">'+ '#'+jsonDetailInfo[0].P_CODE_NM + ' ' + '#'+jsonDetailInfo[0].M_CODE_NM +'</span>';
		inTag += '</div>';
		inTag += '<div class="apply_content">';
		inTag += '	<h4 class="apply_title">결제 정보 확인</h4>';
		inTag += '	<div class="apply_complete_box">';
		
		inTag += '  <div class="">';
			
		inTag += '  <table class="payTable">';
		inTag += '  <caption>결제</caption>';
		inTag += '  <tr>';
			inTag += '  <td style="vertical-align:baseline;">상&nbsp; 품&nbsp; 명';
			inTag += '  </td>';
			inTag += '  <td class="w20"> ';
			inTag += '  </td>';
			inTag += '  <td>'+ jsonDetailInfo[0].INFO_PRDT_TITL1 + ' <br>' + jsonDetailInfo[0].INFO_PRDT_TITL2;
			inTag += '  </td>';
		inTag += '  </tr>';
		inTag += '  <tr>';
			inTag += '  <td colspan="3" class="mb10"></td>';
		inTag += '  </tr>';
		inTag += '  <tr>';
			inTag += '  <td>구매 일자';
			inTag += '  </td>';
			inTag += '  <td class="w20"> ';
			inTag += '  </td>';
			inTag += '  <td>'+ jsonDetailInfo[0].SYS_REG_DTM + ' (' + jsonDetailInfo[0].SYS_REG_DTM_WEEK + ')';
			inTag += '  </td>';
		inTag += '  </tr>';
		inTag += '  <tr>';
			inTag += '  <td colspan="3" class="mb10"></td>';
		inTag += '  </tr>';
		inTag += '  <tr>';
			inTag += '  <td>사용 기간';
			inTag += '  </td>';
			inTag += '  <td class="w20"> ';
			inTag += '  </td>';
			if( prdtCd.indexOf('VL') > -1 ) inTag += '<td>' + jsonDetailInfo[0].PRDT_CNT + '일 / 총 ' + jsonDetailInfo[0].LECT_TOTAL_CNT + '개 / 총 ' + (((jsonDetailInfo[0].LECT_TOTAL_MIN_CNT*1)/60)+'').split('.')[0] + '분</td>';
	 		else inTag += '<td>' + jsonDetailInfo[0].MAIL_DTM_CNT + '일 / ' + jsonDetailInfo[0].PRDT_CNT + '회' + '</td>';
// 			inTag += '  <td>';
// 			inTag += '  </td>';
		inTag += '  </tr>';
		inTag += '  <tr>';
			inTag += '  <td colspan="3" class="noMb" style="height:25px;"></td>';
		inTag += '  </tr>';
		inTag += '  <tr>';
			inTag += '  <td class="total" colspan="3"><span style="margin-right:20px;">결제 금액</span>';
			inTag +=  jsonDetailInfo[0].PRDT_PRIC_REAL+ "원";
			inTag += '  </td>';
		inTag += '  </tr>';
		inTag += '  <tr>';
			inTag += '  <td colspan="3" class="noMb" style="height:25px;"></td>';
		inTag += '  </tr>';
						
		inTag += '  </table>';
		
		inTag += '  </div>';
// 		inTag += '		<dl class="acb_list">';
// 		inTag += '			<dt>상품명</dt><dd>'+ jsonDetailInfo[0].INFO_PRDT_TITL1 + ' ' + jsonDetailInfo[0].INFO_PRDT_TITL2 + '</dd>';
// 		inTag += '			<dt>구매일자</dt><dd>'+ jsonDetailInfo[0].SYS_REG_DTM + ' (' + jsonDetailInfo[0].SYS_REG_DTM_WEEK + ')' + '</dd>';
// 		if( prdtCd.indexOf('VL') > -1 ) inTag += '			<dt>사용기간</dt><dd>' + jsonDetailInfo[0].PRDT_CNT + '일 / 총 ' + jsonDetailInfo[0].LECT_TOTAL_CNT + '개 / 총 ' + (((jsonDetailInfo[0].LECT_TOTAL_MIN_CNT*1)/60)+'').split('.')[0] + '분</dd>';
// 		else inTag += '			<dt>사용기간</dt><dd>' + jsonDetailInfo[0].MAIL_DTM_CNT + '일 / ' + jsonDetailInfo[0].PRDT_CNT + '회' + '</dd>';
// 		inTag += '			<dt class="total">결제 금액</dt><dd class="total">'+ jsonDetailInfo[0].PRDT_PRIC_REAL+ "원" +'</dd>';
// 		inTag += '		</dl>';

		inTag += '		<p class="acb_text">※결제 전, 취소/환불 규정을 확인하여 주시기 바랍니다.</p>';
		inTag += '	</div>';
		inTag += '</div>';
		inTag += '<div class="popup_bottom">';
		inTag += '		<a href="javascript:;"> <button class="apply_pop_btn_01 " >바로 결제</button></a>';
		inTag += '</div>';
		
		$('.popup_content').removeClass('tablets_now_coaching'); 
		
	} else {
		
		$('.popup_content').css('height','90%');
		
		var params = new Object();
	  	params.status = "LIST";
	  	params.query = queryAdd + "BuyTimeList";
		params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
		params.prdtCd = prdtCd;
		params.cateIdx = cateIdx;
	      	
	   	var jsonDetail = fn_DataAjax2( params );
	   	jsonDetail = jsonDetail.out.detail.data;
        
// 	   	console.log(jsonDetail);
	   	
	   	if ( jsonDetail.length == 0 ) {
			$('.pop_close').trigger('click');
			$('.popup_content').css('height','auto !important');
			return alert('상담가능한 시간이 없습니다.');
		}
	   	
	   	
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
		inTag += '		<span></span>분 / <span></span>원';
		inTag += '	</span>';
		inTag += '	<p class="apply_text">';
		if( prdtCd.indexOf('FN') > -1 ) inTag += '		지정된 시간 동안 마스터와 1:1 화상코칭을 통해<br> 깊이 있는 질문을 주고받을 수 있습니다.';
		if( prdtCd.indexOf('CN') > -1 ) inTag += '		지정된 시간 동안 마스터와 1:1 채팅코칭을 통해<br> 깊이 있는 질문을 주고받을 수 있습니다.';
		if( prdtCd.indexOf('LN') > -1 ) inTag += '		지정된 시간 동안 마스터와 라이브클래스를 통해<br> 깊이 있는 질문을 주고받을 수 있습니다.';
		inTag += '	</p>';
		inTag += '</div>';
		inTag += '<div class="apply_content">';
		inTag += '	<h4 class="apply_title">';
		inTag += '		<br class="m_show">';
		inTag += '		<b>(가장 빠른 예약 시간은 <span class="firstTimeStr"></span>)</b>';
		inTag += '	</h4>';
		inTag += '	<div class="apply_select_date">';
		inTag += '<div class="asd_box">';
		inTag += '	<div class="asd_date_box tables_asd_date_box phones_asd_date_box">';
		inTag += '			 <!-- <button type="button" class="asd_btn asd_btn_prev"></button> -->';

		var date = new Date();
		var btnCnt = 0;
		var dayOfWeek = ['일','월','화','수','목','금','토'];
	   	
		var weekCnt = 0;

	   	for (var i = 0; i < 7; i++) {
	   		if ( i > 0) 
	   			date.setDate( date.getDate() + 1 );
	   		inTag += '		<button type="button" class="asd_date_item">';
			inTag += '			<input name="asd_date_item" type="hidden" value="'+(''+date.getFullYear()+'-'+('0'+(date.getMonth()+1) ).slice(-2) +'-'+ ('0'+date.getDate() ).slice(-2) )+'"/>';
			inTag += '			<span class="day">'+('0'+date.getDate() ).slice(-2)+'</span>';
			inTag += '			<span>'+dayOfWeek[date.getDay()]+'</span>';
			inTag += '		</button>';
			
			// 일주일 안에 시간이 없다면 수업이 없는거임
		   	$.each(jsonDetail,function(key,val){
		 		if( val.TIME_DTM == (''+date.getFullYear()+'-'+('0'+(date.getMonth()+1) ).slice(-2) +'-'+ ('0'+date.getDate() ).slice(-2) ) ) {
		 			weekCnt++;
		 		}
		 	});
		}
	   	
		inTag += '	</div>';
		inTag += '</div>';

		inTag += '	</div>';
		inTag += '</div>';
		inTag += '<div class="popup_bottom">';
		inTag += '	<button type="button" class="apply_pop_btn_02 applyStep2InputPop" >다음</button>';
		inTag += '</div>';

		if ( weekCnt == 0 ) {
			$('.pop_close').trigger('click');
			$('.popup_content').css('height','auto !important');
			return alert('상담가능한 시간이 없습니다.');
		}
		
		$('.popup_content').removeClass('tablets_now_coaching');
	}
// 	inTag = '';
	$('#applyStep1Pop .apply_popup_content').append( inTag );
	
	
	if( NOW != null && DETAIL == null ) {
		$('.prdt_apply_btn.noSelect').on('click',function(){
			if ( localStorage.getItem("frontLoginIdx" ) == null || localStorage.getItem("frontLoginIdx" ) == "" ){
				alert('로그인이 필요한 기능입니다.');
				return location.href = '/front/account/login';
			}
			
			var path = window.location.pathname;
			path = path.split('/');
			path = '/'+path[1]+'/'+path[2]+'/'+path[3];
			
			$('#applyStep1Pop').show();
			fn_PrdtBuyDetail( "NOW", "DETAIL" );
		});
		
	} else if( prdtCd.indexOf('VL') > -1 || prdtCd.indexOf('EN') > -1 ) {

		//신청하기1----------------------------------------------------------------------------------------
		$('.apply_pop_btn_01').on('click', function(){
			baskArr.push(prdtCd);
			localStorage.setItem('baskArr',baskArr);
			 
			if( isMobile() ) location.href = '/front/payment/payment'; 
			else location.href = '/front/payment/payment2'; 

			var presentUrl = window.location.pathname;
			
			if ( isMobile() ) location.href="/front/payment/cart_payment_mobile";
        	else location.href="/front/payment/cart_payment";
		});
		
	} else {
	    
		$('#applyStep1Pop .apply_top > .pop_title').html( jsonDetailInfo[0].INFO_PRDT_TITL1 + '<br>' + jsonDetailInfo[0].INFO_PRDT_TITL2 );
		$('#applyStep1Pop .apply_top > .apply_select_category').text( '#'+jsonDetailInfo[0].P_CODE_NM + ' ' + '#'+jsonDetailInfo[0].M_CODE_NM );
		$('#applyStep1Pop .apply_top > .apply_info > span').eq(0).text( jsonDetailInfo[0].PRDT_CNT );
		$('#applyStep1Pop .apply_top > .apply_info > span').eq(1).text( jsonDetailInfo[0].PRDT_PRIC_REAL );
		
		prdtNm = jsonDetailInfo[0].INFO_PRDT_TITL1 + ' <br>' + jsonDetailInfo[0].INFO_PRDT_TITL2;
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
		
	   	//신청하기 팝업 2
	   	$('.apply_pop_btn_02.applyStep2InputPop').on('click', function(){
	   		timeStr = [];
	   		timeDtm = [];
	   		timeWeek = [];
	   		timeIdx = [];
	
	   		var timeIdxTemp = '';
	   		
// 			timeStr.push( $('#applyStep1Pop .asd_time_item.active').text()+',' );
			timeDtm.push( $('#applyStep1Pop .asd_date_item.active > input').val().slice(-2) );
			timeWeek.push( $('#applyStep1Pop .asd_date_item.active > span').eq(1).text() );
			$('#applyStep1Pop .asd_time_item.active > input').each(function(key,val){
				timeIdxTemp = this.value;
				timeIdx.push( $(this).val() );
				timeStr.push( $('#applyStep1Pop .asd_time_item.active').eq(key).text() );
			});
	   		
	   		var returnVal = 0;
	   		if( timeIdx[0] == null ) returnVal = 1;
	   		if( timeDtm[0] == null ) returnVal = 1;
	   		if( timeWeek[0] == null ) returnVal = 1;
	   		if( timeStr[0] == null ) returnVal = 1; 
	   		
	   		if( returnVal == 1 ) return alert('날짜/시간을 선택해주세요.');
	
		    $('.ap_item').removeClass('current');
		    
		    var msg = '';
			var params = new Object();
			params.status = "LIST";
			params.query = "selectUserBuyTimeIdx";
			// 초기화
			params.PRDT_CD = prdtCd;
			params.TIME_IDX = timeIdxTemp;
			
			var timeIdxResult = fn_DataAjax2( params );
			if( prdtCd.indexOf('LN') < 0 ) {
				if ( timeIdxResult.out.detail.data.length > 0 ) {
					msg = timeIdxResult.out.detail.data[0].NO_TITL+ timeIdxResult.out.detail.data[0].NO_TIME + '\n해당 수업은 다른사용자가 이미 구매했습니다.';
					alert( msg );
					$('input[name=TIME_IDX][value='+timeIdxTemp+']').closest('button.asd_time_item').removeClass('active');
					return ;
				}
			}else{
				if ( timeIdxResult.out.detail.data.length > 0 ) {
					if ( timeIdxResult.out.detail.data.length >= timeIdxResult.out.detail.data[0].LIVE_CNT ) {
						msg = timeIdxResult.out.detail.data[0].NO_TITL+ timeIdxResult.out.detail.data[0].NO_TIME + '\n해당 수업의 수강인원수를 초과했습니다.';
						alert( msg );
						$('input[name=TIME_IDX][value='+timeIdxTemp+']').closest('button.asd_time_item').removeClass('active');
						return ;
					}
				}
			}
		    
	   		fn_PrdtBuyQuesList( timeStr, timeDtm, timeIdx );

			$.each(dataQues,function(key, val){
				$('[name=DATA_CNTN]').eq(key).val( val );
			});
	   	});
	}

    $('.pop_close').on( 'click', function(){
        $('.popup_wrap').hide();
		if (clickBtn != '') {
			clickBtn.removeClass('is-active');
		}
		$('.popup_content').css('height','auto !important');
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
		
		// 팝업 _ 달력 선택 버튼 toggle
		$('.asd_time_item').on( 'click', function(){
// 			$('.asd_time_item').removeClass('active');
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
   	}else{
   	 	// 가장빠른 예약시간 초기화
   		$('.firstTimeStr').text( '' );
   		inTag += '<div class="asd_time_box" style="text-align:center;"> <p style="margin:10%;">상담가능한 시간이 없습니다.</p>';
   		
   		inTag += '</div>';
   		$('#applyStep1Pop .apply_select_date').append( inTag );
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

	$('.popup_content').css('height','auto !important');
   	$('#applyStep1Pop .apply_popup_content').empty();

   	var inTag = '';
   	inTag += '<button type="button" class="pop_close"></button>';
   	inTag += '<div class="apply_process_box">';
   	inTag += '	<span class="ap_item ">1</span>';
   	inTag += '	<span class="ap_item current">2</span>';
   	inTag += '	<span class="ap_item">3</span>';
   	inTag += '</div>';
   	
   	inTag += '<div class="apply_content">';
   	inTag += '    <h4 class="apply_title">';
   	inTag += '        코칭에 필요한 질문에 답해주세요.';
   	inTag += '    </h4>';
   	inTag += '    <div class="apply_form_box">';
	
   	if( jsonDetail.length > 0 ) {
		
   		$.each(jsonDetail,function(key,val){
   			inTag += '<p class="apply_form_item">';
   			inTag += '    <label for="afi'+key+'">'+val.QUES_CNTN+'</label>';
   			inTag += '    <input type="hidden" name="QUES_IDX" value="'+val.QUES_IDX+'">';
   			inTag += '    <input type="text" id="afi'+key+'" name="DATA_CNTN" class="afi_input">';
   			inTag += '</p>';
   			dataQuesIdx.push( val.QUES_IDX );
   			console.log(dataQuesIdx[key]);
		});
   	}
   	
   	inTag += '    </div>';
   	inTag += '</div>';
   	inTag += '';
   	inTag += '<div class="popup_bottom">';
   	inTag += '    <button type="button" class="apply_pop_btn_02 apply_pop_btn_02_gray_border prdt_apply_btn phones_prdt_apply_btn">이전</button>';
   	inTag += '    <button type="button" class="apply_pop_btn_02 applyStep2TextPop phones_applyStep2TextPop" >다음</button>';
   	inTag += '</div>';
		
	$('#applyStep1Pop .apply_popup_content').append( inTag );
	inTag = '';
	
	$('.firstTimeStr').text( $('.asd_time_item').eq(0).text() );
	
    $('.pop_close').on( 'click', function(){
        $('.popup_wrap').hide();
		if (clickBtn != '') {
			clickBtn.removeClass('is-active');
		}
		$('.popup_content').css('height','auto !important');
    });
    
	//신청하기 팝업 3
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
		
		if( cntTag > cntArr ) return alert('질문을 모두 작성해주세요.');
	    fn_PrdtBuyPayList();
	});

	$('.apply_pop_btn_02_gray_border').on('click',function(){
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

	$('.popup_content').css('height','auto !important');
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
   	inTag += '            결제 정보를 확인해주세요.';
   	inTag += '        </span>';
   	inTag += '    </div>';
   	inTag += '</div>';
   	inTag += '<div class="apply_content">';
   	inTag += '    <h4 class="apply_title">';
   	inTag += '        결제 정보 확인';
   	inTag += '    </h4>';
   	inTag += '    <div class="apply_complete_box">';
   	
//    	inTag += '        <dl class="acb_list tablets_acb_list phones_acb_list">';
//    	inTag += '            <dt>상품명</dt>';
//    	inTag += '            <dd>'+prdtNm+'</dd>';
//    	inTag += '            <dt>선택 일정</dt>';
//    	inTag += '            <dd>'+timeDtm[0]+'(금)</dd>';
//    	inTag += '            <dt>선택 시간</dt>';
//    	inTag += '            <dd>'+timeStr[0]+'</dd>';
//    	inTag += '            <dt class="total">결제 금액</dt>';
//    	inTag += '            <dd class="total">'+timePrice+'원</dd>';
//    	inTag += '        </dl>';
   	inTag += '  <div class="">';
			
		inTag += '  <table class="payTable">';
		inTag += '  <caption>결제</caption>';
		inTag += '  <tr>';
			inTag += '  <td style="vertical-align:baseline;">상&nbsp; 품&nbsp; 명';
			inTag += '  </td>';
			inTag += '  <td class="w20"> ';
			inTag += '  </td>';
			inTag += '  <td>'+ prdtNm;
			inTag += '  </td>';
		inTag += '  </tr>';
		inTag += '  <tr>';
			inTag += '  <td colspan="3" class="mb10"></td>';
		inTag += '  </tr>';
		inTag += '  <tr>';
			inTag += '  <td>선택 일정';
			inTag += '  </td>';
			inTag += '  <td class="w20"> ';
			inTag += '  </td>';
			inTag += '  <td>'+timeDtm[0]+'('+timeWeek[0]+')';
			inTag += '  </td>';
		inTag += '  </tr>';
		inTag += '  <tr>';
			inTag += '  <td colspan="3" class="mb10"></td>';
		inTag += '  </tr>';
		inTag += '  <tr>';
			inTag += '  <td>선택 시간';
			inTag += '  </td>';
			inTag += '  <td class="w20"> ';
			inTag += '  </td>';
			var timeStrTemp = timeStr;
			var timeString = '';
			$.each(timeStrTemp, function(key,val){
				timeString += val + ', '
			});
			timeString = timeString.slice(0,-2);
			inTag += '<td>' + timeString + '</td>';
// 			inTag += '  <td>';
// 			inTag += '  </td>';
		inTag += '  </tr>';
		inTag += '  <tr>';
			inTag += '  <td colspan="3" class="noMb" style="height:25px;"></td>';
		inTag += '  </tr>';
		inTag += '  <tr>';
			inTag += '  <td class="total" colspan="3"><span style="margin-right:20px;">결제 금액</span>';
			inTag +=  numberWithCommas( timePrice.replace(',','')*timeStr.length )+ "원";
			inTag += '  </td>';
		inTag += '  </tr>';
		inTag += '  <tr>';
			inTag += '  <td colspan="3" class="noMb" style="height:25px;"></td>';
		inTag += '  </tr>';
						
		inTag += '  </table>';
		
		inTag += '  </div>';
   	
   	
   	
   	inTag += '        <p class="acb_text">';
   	inTag += '            ※결제 전, 취소/환불 규정을 확인하여 주시기 바랍니다.';
   	inTag += '        </p>';
   	inTag += '    </div>';
   	inTag += '</div>';
   	inTag += '<div class="popup_bottom">';
   	inTag += '    <button type="button" class="apply_pop_btn_02 apply_pop_btn_02_gray_border applyStep2InputPop">이전</button>';
   	if( isMypageSetTime == 1 ) inTag += '    <a href="javascript:;"> <button class="apply_pop_btn_02 applyStep2PayPop">선택 완료</button></a>';
   	else inTag += '    <a href="javascript:;"> <button class="apply_pop_btn_02 applyStep2PayPop">바로 결제</button></a>';
   	inTag += '</div>';
	
	$('#applyStep1Pop .apply_popup_content').append( inTag );
	inTag = '';

    $('.pop_close').on( 'click', function(){
        $('.popup_wrap').hide();
		if (clickBtn != '') {
			clickBtn.removeClass('is-active');
		}
		$('.popup_content').css('height','auto !important');
    });
	
   	//신청하기 팝업 2
   	$('.apply_pop_btn_02.applyStep2InputPop').on('click', function(){
   		fn_PrdtBuyQuesList( timeStr, timeDtm, timeIdx );

		$.each(dataQues,function(key, val){
			$('[name=DATA_CNTN]').eq(key).val( val );
		});
   	});
    
	//신청하기 팝업 3
	$('.apply_pop_btn_02.applyStep2PayPop').on('click', function(){
		
		// ppm_prdt_ques_data 테이블의 buy_idx에 저장하기 위해 세션에 담을 변수를 만든다
		var ques_ques_idxs = '';
		
		if ( localStorage.getItem('ques_ques_idxs') != '' && 
			localStorage.removeItem('ques_ques_idxs') != null && 
			localStorage.removeItem('ques_ques_idxs') != undefined ) 
		{
			ques_ques_idxs = localStorage.getItem('ques_ques_idxs');
		}
		
// 		질문값 저장로직
		$.each(dataQues,function(key, val){
			
			var params = unit_getParams("searchArea");
			params.status = "WRITE";
			
			if( queryAdd.indexOf('Prdt') > -1 ) params.query = "insertFrontPrdtQuesData";
			else params.query = "insertFrontMasterQuesData";
			
			params.QUES_IDX = dataQuesIdx[key];
			params.DATA_CNTN = val;
			params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
			
			var result = fn_DataAjax( params );
			
			/////////////////////////////////////////////////////
			ques_ques_idxs += dataQuesIdx[key] + ',';
// 			location.href='${unit.move("index", "" )}';
			
		});
		localStorage.removeItem('ques_ques_idxs');
		localStorage.setItem( 'ques_ques_idxs', ques_ques_idxs );
		
		var arrEnchant = '';
		if( prdtCd.indexOf('VL') < 0 || prdtCd.indexOf('EN') < 0 ) {
			$.each(timeIdx, function(key,val){
				arrEnchant = prdtCd+'_'+val;
				var baskArrStr = localStorage.getItem('baskArr')+'';
// 				console.log( timeIdx );
// 				console.log( val );
				if( baskArrStr != '' || baskArrStr != 'null' ) {
					if( baskArrStr.indexOf(arrEnchant) < 0 ) {
// 						console.log( arrEnchant );
						baskArr.push(arrEnchant);
						localStorage.setItem('baskArr',baskArr);
					}
				} else {
					baskArr.push(arrEnchant);
					localStorage.setItem('baskArr',baskArr);
				}
				
			});
		}
		
		if (clickBtn != '') {
			clickBtn.addClass('is-active');
		}
		
// 		baskTimeIdxArr.push(timeIdx);
// 		localStorage.setItem('baskTimeIdxArr',baskTimeIdxArr);
		
		var presentUrl = window.location.pathname;
		if ( presentUrl.indexOf( '/front/mypage/cart' ) == -1 ) {
			if ( isMobile() ) location.href="/front/payment/cart_payment_mobile";
        	else location.href="/front/payment/cart_payment";
			isMypageSetTime = 0;
		}else{
			
			if( isMypageSetTime == 0 ) {
				if( prdtCd.indexOf('VL') + prdtCd.indexOf('LN') == -2) {
					$('.popup_wrap').hide();
				} else {
					if ( isMobile() ) location.href="/front/payment/cart_payment_mobile";
		        	else location.href="/front/payment/cart_payment";
				}
			} else {
				if ( isMobile() ) location.href="/front/payment/cart_payment_mobile";
	        	else location.href="/front/payment/cart_payment";
				isMypageSetTime = 0;
			}
			
		}
		
	});
}
 
//탑배너 메인에만 생성
if ( window.location.pathname == '/front/main/index' ) { document.write( '<style>.topbar{display:block;}</style>' ); }

// if (( window.location.pathname == '/' )||( window.location.pathname == '/guestbook' )) { document.write( '<style>#outer_btn_left,#outer_btn_right{display:none !important;}</style>' ); }

function btnSearchKeyWord( val ){
	location.href="/front/main/search?keyword="+val;
}

//글자가 너무길면 ..... 처리
function is_too_long_word(TITLE1, TITLE2, LENGTH, BR_YN) {
	// 	console.log( title1 );
	// 	console.log( title2 );
	if (TITLE1.length > LENGTH)
		TITLE1 = TITLE1.substring(0, LENGTH) + '...';
	if (TITLE2.length > LENGTH)
		TITLE2 = TITLE2.substring(0, LENGTH) + '...';
	if (BR_YN == 'Y')
		return TITLE1 + '<br>' + TITLE2;
	else
		return TITLE1 + ' ' + TITLE2;
}

function fn_BtnPrdtLink( PRDT_TYPE ) {
	localStorage.setItem("frontPrdtType", PRDT_TYPE );
	if( window.location.pathname != '/front/prdt/index' ) location.href="/front/prdt/index";
}

</script>
</html>
