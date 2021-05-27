<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" />

<style>
#reviewPop{
display:none;
}
#screen{
	display:none;
	position: absolute;
    width: 100%;
    height: 200%;
    background-color: black;
    opacity: 0.6;
    z-index:9999;
}

.mnc_btn_box::before {
content: '';
    position: absolute;
    top: -9.4px;
    left: 48.2%;
/*     background: url(../assets/images/icon/icon_talk_tail.png) center center / cover no-repeat; */
    transform: translateX(-50%) ;
width: 0px;
    height: 0px;
    border-left: 4px solid transparent;
    border-right: 4px solid transparent;
    border-top: 9px solid #444;
    transform: rotate(180deg);
} 

.codeId{ cursor: pointer; }

@media(max-width : 1310px){
	.mnc_btn_box::before {
/* 		left: 20%; */
	}
	
	.mnc_btn_box{display:none;}
	
}
@media(max-width : 1250px){

.mnc_btn_box{display:none;}

}

.linkMainDiv {left: 50% !important;
/* top: 210px !important; */
}
.linkMainA {color:#27f1d5; font-weight: bold;position: absolute;top: 190px;left: -35px  !important;font-size: 30px;width: 200px;}

@media screen and (max-width: 960px){
	.lnb_item:first-child {padding-left: 0px;}
	.linkMainDiv {top: 70px !important;}
	.linkMainA {color:#27f1d5; font-weight: bold;position: absolute;top: 70px;left: -62px  !important;font-size: 30px;width: 200px;}
}


</style>

    <div id="container">
        <div class="sub-inner">
            <div class="profile">
                <div class="img-area">
                    <img src="/resources/assets/images/sub/profile_default_img.png" alt="profile img">
                </div>
                <div class="text-area">
                    <strong></strong>
                    <div class="btn-box">
                        <a href="/front/mypeoplemade/myinfo"><button type="button" class="" onclick="location.href='/front/mypeoplemade/myinfo' ">프로필 편집</button></a>
                        <div class="btn-profile-more">
                            <button type="button" class="btn-more"><i class="ico-profile-more"></i></button>
                            <ul class="more-menu">
                                <li>
                                    <a href="/front/mypage/payment">결제내역</a>
                                </li>
                                <li>
                                    <a href="/front/mypage/mycoupon">내 쿠폰</a>
                                </li>
                                <li>
                                    <a href="/front/mypage/refund">취소/환불내역</a>
                                </li>
                                <li>
                                    <a href="/front/mypeoplemade/myinfo">내정보관리</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <p class="profile-info">
                    </p>
                </div>
            </div>
            <div class="lnb" style="margin-top:20px;">
                <ul class="vod-nav">
                    <li class="lnb_item is-active" style="    display: inline-flex;"><a href="/front/mypeoplemade/network" style="    margin-right: 0;">내인맥</a><a href="/front/mypeoplemade/network_list" style="    padding-top: 2px;"><span class="text-point text-point-small"><span>0</span>명</span></a></li>
                    <li class="lnb_item"><a class="lnbExtraClass" href="/front/mypeoplemade/coaching?1">VOD<span class="text-point text-point-small"><span>0</span>개</span></a></li>
                    <li class="lnb_item"><span class="hm_mail_alarm hm_mail_alarm_mypeople"></span><a href="/front/mypeoplemade/coaching?2">1:1코칭<span class="text-point text-point-small"><span>0</span>개</span></a></li>
                    <li class="lnb_item"><a class="lnbExtraClass" href="/front/mypeoplemade/coaching?3">LIVE CLASS<span class="text-point text-point-small"><span>0</span>개</span></a></li>
                    <li class="lnb_item"><a href="/front/mypeoplemade/follow">팔로잉<span class="text-point text-point-small"><span>0</span>개</span></a></li>
                    <li class="lnb_item"><a href="/front/mypeoplemade/myinfo">내 정보관리<!-- <span class="text-point text-point-small"></span> --></a></li>
                </ul>
            </div>
            
            <div class="my_network_box phone_my_network_box" style="    margin-top: 0px;">
				<div class="list-title">
	                <ul class="sub-nav">
	                	<span style="color:white;font-size:14px;">내 인맥도에는 최근 만나 보셨던 마스터 중 8명만 보여요.</span>
	                </ul> 
				    <div class="select" data-role="selectBox">
				        <span date-value="optValue" class="selected-option"><a href="#">전체</a><!-- 선택된 옵션 값이 출력되는 부분 --></span>
				        <!-- 옵션 영역 -->
				        <ul class="hide">
				            <li class="codeId" ><a codeId="">전체</a></li>
				            <li class="codeId"><a codeId="VL">VOD</a></li>
				            <li class="codeId" ><a codeId="FN">1:1 화상</a></li>
				            <li class="codeId" ><a codeId="CN">1:1 채팅</a></li>
				            <li class="codeId" ><a codeId="EN">1:1 이메일</a></li>
				            <li class="codeId" ><a codeId="LN">LIVE CLASS</a></li>
				        </ul>
				    </div>
				</div>
	            <div class="circle_margin">
	                <div class="my_network_circle phone_my_network_circle">
	                	<div id="dataList" style="position: relative;">
							<div class="mnc_btn me linkMainDiv tablet_linkMainDiv" >
								<span class="mnc_name" onclick='location.href="/front/main/index";'>피플메이드에서 새로운 인맥을 만들어 보시는 건 어떠세요?</span>
<!-- 								<a class="linkMainA" href="/front/main/index" >메인 바로가기</a> -->
							</div>
	                	</div>
	                </div>
                </div>
	            <div class="phone_circle_margin" style="display: none; text-align: center; padding: 100px 0;">
						<span style="font-size: 14px;" onclick='location.href="/front/main/index";'>피플메이드에서 새로운 인맥을 만들어 보시는 건 어떠세요?</span>
<!-- 								<a class="linkMainA" href="/front/main/index" >메인 바로가기</a> -->
                </div>
            </div>
        </div>
            


        <div id="reviewPop" class="popup_wrap">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content review_content phone_review_content tablet_review_content" style="    padding: 20px;     width: 250px; margin-top:10px;">
                    <button type="button" class="pop_close"></button>
                    <div>
                        <h2 class="rpc_title">영어 스타강사</h2>
                        <p class="rpc_text">
                         분야 : 커리어 
                        </p>
						<p class="mnc_tag">1일 전 대화<br>화상상담(3), 채팅상담(1), 동영상(10)<br></p>
                      <button type="button" class="rpc_submit" style="background-color:#27f1d5; width: 180px; margin-top:10px;" class="" onclick="location.href='/front/mypeoplemade/network_history' ">히스토리 보기</button>
                    </div>
                </div>
            </div>
        </div><!-- //#reviewPop -->
    </div><!-- // #container -->



<!-- <script type="text/javascript" src="/resources/assets/js/jquery-1.12.4.min.js"></script> -->
<!-- <script type="text/javascript" src="/resources/assets/js/slick.min.js"></script> -->
<!-- <script type="text/javascript" src="/resources/assets/js/jquery.waypoints.min.js"></script> -->
<!-- <script type="text/javascript" src="/resources/assets/js/common.js"></script> -->
<script>

if( localStorage.getItem('frontLoginIdx') == null ) location.href = '/front';

$(document).ready(function(){
//     $(".vod-nav").slick({
//         slidesToScroll: 2,
//         variableWidth: true,
//         autoplay: false,
//         infinite: false,
//         dots: false,
//         arrows: false
//     });
});

var body = document.querySelector('body');
var select = document.querySelector('[data-role="selectBox"]');
var values = select.querySelector('[date-value="optValue"]');
var option = select.querySelector('ul');
var opts = option.querySelectorAll('li');

/* 셀렉트영역 클릭 시 옵션 숨기기, 보이기 */
function selects(e){
    e.stopPropagation();
    if(option.classList.contains('hide')){
        option.classList.remove('hide');
        option.classList.add('show');
    }else{
        option.classList.add('hide');
        option.classList.remove('show');
    }
    selectOpt();
}

/* 옵션선택 */
function selectOpt(){
	$.each(opts, function(key,val){
		const innerValue = opt.innerHTML;
		function changeValue(){
            values.innerHTML = innerValue;
        }
        opt.addEventListener('click',changeValue)
	});
	
//     opts.forEach(opt=>{
//         const innerValue = opt.innerHTML;
//         function changeValue(){
//             values.innerHTML = innerValue;
//         }
//         opt.addEventListener('click',changeValue)
//     });
}

/* 렌더링 시 옵션의 첫번째 항목 기본 선택 */
function selectFirst(){
    const firstValue = opts[0].innerHTML;
    values.innerHTML = firstValue;
}

/* 옵션밖의 영역(=바디) 클릭 시 옵션 숨김 */
function hideSelect(){
    if(option.classList.contains('show')){
        option.classList.add('hide');
        option.classList.remove('show');
    }
}

selectFirst();
select.addEventListener('click',selects);
body.addEventListener('click',hideSelect);

// 마스터 카테고리 버튼 select
$('.mf_cate_btn').on('click', function(){
    $(this).addClass('active').parent('li').siblings().children('.mf_cate_btn').removeClass('active');
});

$(window).resize(function (){
	  // width값을 가져오기
	  var width_size = window.outerWidth;
	  // 800 이하인지 if문으로 확인
	  if (width_size <= 1250) {
	  	$(document).on('click', '.masterCard', function(){
	  		fn_DataInfo_Mobile( $(this).children('.mnc_btn_box') );
	    	$('#reviewPop').show();
	    });
	  }
});
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////

fn_setUserUuid( localStorage.getItem("frontLoginUuid"), 'USER_UUID_FILE' );

$(function(){
	fn_BtnChnageListCnt("", "");
});

$(function(){
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectFrontMypeoplemadePrdtCnt";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var prdtCntData = result.out.detail.data[0];
	$('.text-point-small span').eq(0).text( prdtCntData.NET_CNT );
	$('.text-point-small span').eq(1).text( prdtCntData.VOD_CNT );
	$('.text-point-small span').eq(2).text( prdtCntData.COACH_CNT );
	$('.text-point-small span').eq(3).text( prdtCntData.LIVE_CNT );
	$('.text-point-small span').eq(4).text( prdtCntData.FOLL_CNT );
	
	$( '#now_loading' ).hide();
});

$(".codeId").click(function(){	
	fn_BtnChnageListCnt("", $(this).children('a').attr('codeId'));
});

function fn_BtnChnageListCnt( PAGE_NO, DATA_CD ) {
	paymentCnt = 0;
	
	var params = new Object();
	params.status = "LIST";
	params.query = "selectFrontMypeoplemadeList";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.codeId = DATA_CD;
	
	if( PAGE_NO.length > 0 ) params.thisPage = PAGE_NO;
	else params.thisPage = 1;
	
	fn_DataList( params, "dataList", 7 );
			
}

function fn_DataList( PARAMS, OBJECT_ID, CNT ) {
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result.out.detail.data;
	var inTag = '';
	var masterNm = '';
	var codeNm = '';
	var isStart = 0;
	var inHtml = '';
	
	 if( jsonData.length > 0 ) {
		$('#'+OBJECT_ID+'').empty();

		setUuid( jsonData[0].USER_UUID );
		unit_fileGet( 'USER_UUID_FILE' , "fn_fileUpload");
		
		if( $('#imgTag').val() != null && $('#imgTag').val() != "" && $('#imgTag').val() != undefined ) inTag += '<div class="mnc_btn me" onclick="location.href=\'/front/mypeoplemade/myinfo\'" style="background-image: url('+$('#imgTag').val()+')">';
		else inTag += '<div class="mnc_btn me" onclick="location.href=\'/front/mypeoplemade/myinfo\'" style="background-image: url(/resources/assets/images/sub/profile_default_img.png)">';

		$('#imgTag').val('');
		
		inTag += '<span class="mnc_name">'+jsonData[0].USER_NM+'</span>';
		inTag += '</div>';
		inTag += '</div>';
		$('#'+OBJECT_ID+'').append( inTag );
		
		inTag = '';
		
		$.each(jsonData, function(key, val) {
			setUuid( val.MASTER_UUID );
			unit_fileGet( 'USER_UUID_FILE' , "fn_fileUpload");
			if( $('#imgTag').val() != null ) inTag += '<div class="mnc_btn masterCard" style="background-image: url('+$('#imgTag').val()+')">';
			else inTag += '<div class="mnc_btn masterCard" style="background-image: url(/resources/assets/images/sub/profile_default_img.png)">';
			
			$('#imgTag').val('');
			
			inTag += '<span class="mnc_name">'+val.CODE_NM+' | '+val.MASTER_NM+'</span>';
			
			inTag += '<div class="mnc_btn_box" CATE_IDX="'+val.CATE_IDX+'">';
				inTag += '<span class="mnc_title"></span>';
				inTag += '<span class="mnc_category"></span></span>';
				inTag += '<p class="mnc_tag">';
				inTag += '</p>';
				inTag += '<a href="/front/mypeoplemade/network_history" class="mnc_link">히스토리 보기</a>';
			inTag += '</div>';
			
			inTag += '</div>';
			inTag += '</div>';
			
			$('#'+OBJECT_ID+'').append( inTag );
			inTag = '';
		});
		
		$('.mnc_btn_box').hide();
		$('.mnc_btn').hide();

// 		$('.masterCard').hover(function(key ,val){
// 			$(this).children('.mnc_btn_box').show();
// 			$(this).css( 'background-size','110%' );
// 		},
// 		function(){
// 			if ( window.screen.width > 1310 ) $(this).css( 'background-size','100%' );
// 			else $(this).css( 'background-size','100%' );
// 		});
		
	    $('.masterCard').click(function(key,val){
	    	var width_size = window.outerWidth;
			if (width_size > 1250) {
					fn_DataInfo( $(this).children('.mnc_btn_box') );
					
// 					$('.masterCard' ).css( 'background-size','100%' );
// 					$(this).css( 'background-size','110%' );
// 					$('.masterCard' ).hide();
// 					$(this).show();
				
			}else{
				fn_DataInfo_Mobile( $(this).children('.mnc_btn_box') );
				$(this).children('.mnc_btn_box').hide();
				$('.masterCard' ).show();
			}
			
	    });
		
		setTimeout(function(){
			fn_roration();
		}, 2000);
	}else{
// 		$('.codeId').eq(0).trigger('click');
		event.stopPropagation();
		event.stopImmediatePropagation();
		if ( screen.width < 800 ) {
			$('.circle_margin').hide();
			$('.phone_circle_margin').show();
			/* .circle_margin{ display: none;  } */
			/* .phone_circle_margin{ display: block!important;  } */
		}
		
	}
}

function fn_DataInfo( CATE_IDX ) {
	
	var params = new Object();
	params.status = "LIST";
	params.query = "selectFrontMypeoplemadeDetail";
	
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.CATE_IDX = CATE_IDX.attr('CATE_IDX');
	
	var jsonData = fn_DataDetail( params );
	
	if( jsonData.length > 0 ) {
		$.each(jsonData, function(key, val) {
			CATE_IDX.children('.mnc_title').html( val.INFO_MAST_TITL1+'<br>'+val.INFO_MAST_TITL2 );
			CATE_IDX.children('.mnc_category').html( '분야 : <span>'+val.CODE_NM );
			CATE_IDX.children('.mnc_tag').html( val.BUY_COMP_DTM+'일 전 <br>' );
			CATE_IDX.children('.mnc_tag').append( val.BUY_MAIL+'<br>');
			CATE_IDX.children('.mnc_tag').append( val.BUY_VOD+'<br>');
			CATE_IDX.children('.mnc_tag').append( val.BUY_FACE+'<br>');
			CATE_IDX.children('.mnc_tag').append( val.BUY_CHAT+'<br>');
			CATE_IDX.children('.mnc_tag').append( val.BUY_LIVE+'<br>');
			CATE_IDX.children('a').attr( 'href', val.MOVE_URL.replace('prdt/detail','mypeoplemade/network_history') );
		});
	}
}

function fn_DataInfo_Mobile( CATE_IDX ) {
	
	var params = new Object();
	params.status = "LIST";
	params.query = "selectFrontMypeoplemadeDetail";
	
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.CATE_IDX = CATE_IDX.attr('CATE_IDX');
	
	var jsonData = fn_DataDetail( params );
	
	var pop = $('#reviewPop');
	if( jsonData.length > 0 ) {
		$.each(jsonData, function(key, val) {
			pop.find('.rpc_title').html( val.INFO_MAST_TITL1+'<br>'+val.INFO_MAST_TITL2 );
			pop.find('.rpc_title').css('font-size', '18px');
			pop.find('.rpc_text').html( '분야 : <span>'+val.CODE_NM );
			pop.find('.mnc_tag').html( val.BUY_COMP_DTM+'일 전 <br>' );
			pop.find('.mnc_tag').append( val.BUY_MAIL+'<br>');
			pop.find('.mnc_tag').append( val.BUY_VOD+'<br>'); 
			pop.find('.mnc_tag').append( val.BUY_FACE+'<br>');
			pop.find('.mnc_tag').append( val.BUY_CHAT+'<br>');
			pop.find('.mnc_tag').append( val.BUY_LIVE+'<br>');
			pop.find('button.rpc_submit').on( 'click', function(){
				location.href=val.MOVE_URL.replace('prdt/detail','mypeoplemade/network_history'); 
			}); 
		});
	}
}

function fn_roration(){
	$('.mnc_btn').show();
	    
    $('body').on( 'click', function(e){
        if( !$(e.target).hasClass('mnc_btn') ) {
			$('.masterCard' ).show();
        	$('.mnc_btn_box').hide();
        }
    });
    
    $('.masterCard').click(function(key,val){

		if( $(this).children('.mnc_btn_box').css('display') == 'block') {
			$(this).children('.mnc_btn_box').hide();
			$('.masterCard' ).show();
		}
		else {
			$(this).css( 'background-size','110%' );
			$('.masterCard' ).hide();
			$(this).show();
			$(this).children('.mnc_btn_box').show();
		}
    });
    
	$('.masterCard' ).hover(function(key ,val){
		var width_size = window.outerWidth;
			 if (width_size > 1250) {
			 
				fn_DataInfo( $(this).children('.mnc_btn_box') );
				
				$(this).css( 'background-size','110%' );
				$('.masterCard' ).hide();
				$(this).show();
				$(this).children('.mnc_btn_box').show();
				
			}
		 },
			 
			function(){
				if ( window.screen.width > 1310 ) $(this).css( 'background-size','100%' );
				else $(this).css( 'background-size','100%' );
			}
	);
    
    $.each($('.mnc_btn.masterCard'), function(key,val){
    	var val = Math.round( Math.random()*100 );
    	if ( key < 6 ) {
            if( val%2 == 0 ) $('.mnc_btn').eq(key).addClass('orangeJin');
            else $('.mnc_btn').eq(key).addClass('grayJin');
    	} else {
            if( val%2 == 0 ) $('.mnc_btn').eq(key).addClass('orange');
            else $('.mnc_btn').eq(key).addClass('gray');
    	}
    });
	
    var setDeg = 0;
    var setDegOut = 0;
    var setOpacity = 0;
    var str1 = '';
    var str2 = '';
    
    setDeg = Math.round( Math.random()*360 );
	str1 = 'rotate('+setDeg + 'deg)';
	str2 = 'rotate('+ ( setDeg*-1 ) + 'deg)';
	str3 = 'rotate(0deg)';
	$('.my_network_circle').css('transform', str1);
	$('.mnc_btn').css('transform', str2);

    var end = setInterval(endFn, 10);
		
    function endFn() {
		setDeg += 0.2;
	   	setOpacity  += 0.005;

	   	str1 = 'rotate('+setDeg + 'deg)';
		str2 = 'rotate('+ ( setDeg*-1 ) + 'deg)';
		str3 = 'rotate(0deg)';

		$('.my_network_circle').css('transform', str1);
		$('.mnc_btn').css('transform', str2);
		$('.mnc_btn').css('opacity', setOpacity);
    }
    
    setTimeout(function(){
        clearInterval(end);
		
		setUuid( localStorage.getItem("frontLoginUuid") );
		imgIdValue="USER_UUID_FILE";
		unit_fileGet( imgIdValue , "fn_fileUpload");
    }, 3000);
}
</script>














