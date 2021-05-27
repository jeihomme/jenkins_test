<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" />

<style>
.slick-track{left: 20px;}
.slick-slide{width:50px !important;}
.asd_date_box{width:100%;left: -10px;}
.slick-arrow{display:none;}
.asd_btn_prev{left:0px;top:440px;}
.asd_btn_next{top:440px;}


@media screen and (max-width: 400px){
	.coachPrdtCardPeriod { 
	    right: 10px !important;
	    top: 95px !important;
	    width: 140px !important;
	}
	.img-area img {
		height: 120px !important;
	}
	
}

</style>

<!-- 화상 솔루션 추가헤더 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset={_GLOBALS['G_BROWSER_CHARACTERSET']}">
<meta content="requiresActiveX=true" http-equiv="X-UA-Compatible">

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/><!-- 화면비율(뷰포트) 설정 -->

<title>{_GLOBALS['G_BROWSER_TITLE']}</title>

<link rel="stylesheet" href="https://asppm.gonts.net/emeetplus6/empl6_one/empcmcurl.css" type="text/css">
<link rel="stylesheet" type="text/css" href="https://asppm.gonts.net/pm/Html/CSS/flick/jquery-ui-1.8.13.custom.css" />	
<!-- <script type="text/javascript" src="https://asppm.gonts.net/emeetplus6/empl6_one/jquery-1.4.2.min.js"></script> -->
<script type="text/javascript" src="https://asppm.gonts.net/pm/Html/JS/jquery-ui-1.8.13.custom.min.js"></script>
<script type="text/javascript" src="https://asppm.gonts.net/pm/Html/Js/Common.js"></script>

<!--화상 연결시 필요-->
<script type="text/javascript" src="https://asppm.gonts.net/emeetplus6/empl6_one/empcm6.js?v=20210430"></script>
<script type="text/javascript" src="https://asppm.gonts.net/emeetplus6/empl6_one/empcmcurl.js?v=20210430"></script>

<!--pc버전 필요 js-->
<script type="text/javascript" src="https://asppm.gonts.net/emeetplus6/empl6_one/empcmcurldetector.js"></script> 
<script type="text/javascript" src="https://asppm.gonts.net/emeetplus6/empl6_one/empcmcurlwidget.js"></script>
<script type="text/javascript" src="https://asppm.gonts.net/configurations/PM.js?v=20201221" charset='utf-8'></script>

</head>
<!-- 화상 솔루션 추가헤더 end -->
<!--연동-->



    <div id="container">
        <div class="sub-inner">
            <div class="profile">
                <div class="img-area">
                    <img src="/resources/assets/images/sub/profile_default_img.png" alt="profile img">
                </div>
                <div class="text-area">
                    <strong></strong>
                    <div class="btn-box">
                       <button type="button" class="" onclick="location.href='/front/mypeoplemade/myinfo' ">프로필 편집</button>
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
                    <li class="lnb_item" style="    display: inline-flex;"><a href="/front/mypeoplemade/network" style="    margin-right: 0;">내인맥</a><a href="/front/mypeoplemade/network_list" style="    padding-top: 2px;"><span class="text-point text-point-small"><span>0</span>명</span></a></li>
                    <li class="lnb_item"><a class="lnbExtraClass" href="javascript:;" onclick='fn_DataList( "VL", "" );'>VOD<span class="text-point text-point-small"><span>0</span>개</span></a></li>
                    <li class="lnb_item"><span class="hm_mail_alarm hm_mail_alarm_mypeople"></span><a href="javascript:;" onclick='fn_DataList( "A", "" );'>1:1코칭<span class="text-point text-point-small"><span>0</span>개</span></a></li>
                    <li class="lnb_item"><a class="lnbExtraClass" href="javascript:;" onclick='fn_DataList( "LN", "" );'>LIVE CLASS<span class="text-point text-point-small"><span>0</span>개</span></a></li>
                    <li class="lnb_item"><a href="/front/mypeoplemade/follow">팔로잉<span class="text-point text-point-small"><span>0</span>개</span></a></li>
                    <li class="lnb_item"><a href="/front/mypeoplemade/myinfo">내 정보관리<!-- <span class="text-point text-point-small"></span> --></a></li>
                </ul>
            </div>
                
            <div class="list-title">
                <ul class="sub-nav">
                </ul>
                <div class="select" data-role="selectBox">
                    <span date-value="optValue" class="selected-option"></span>
			        <ul class="hide" id="cateList">
<!-- 			            <li onclick="fn_DataList( prdtType, '', '' );" ><a href="javascript:;" >전체</a></li> -->
<!-- 			            <li onclick="fn_DataList( prdtType, '', 'CAT01' );" ><a href="javascript:;" >건강</a></li> -->
<!-- 			            <li onclick="fn_DataList( prdtType, '', 'CAT02' );"><a href="javascript:;"  >뷰티·스타일</a></li> -->
<!-- 			            <li onclick="fn_DataList( prdtType, '', 'CAT03' );"><a href="javascript:;"  >취미·라이프</a></li> -->
<!-- 			            <li onclick="fn_DataList( prdtType, '', 'CAT04' );"><a href="javascript:;"  >재테크·금융</a></li> -->
<!-- 			            <li onclick="fn_DataList( prdtType, '', 'CAT05' );" ><a href="javascript:;" >법률</a></li> -->
<!-- 			            <li onclick="fn_DataList( prdtType, '', 'CAT06' );" ><a href="javascript:;" >커리어</a></li> -->
<!-- 			            <li onclick="fn_DataList( prdtType, '', 'CAT07' );" ><a href="javascript:;" >외국어</a></li> -->
<!-- 			            <li onclick="fn_DataList( prdtType, '', 'CAT08' );" ><a href="javascript:;" >교육</a></li> -->
			        </ul>
                </div>
            </div>
            <span class="listCount" style="display:inline-block;"><span class="ppm_key_color" style="color:red !important;">※ 웹페이지에서 화상솔루션  프로그램이 실행되지 않으면 <span class="ppm_key_color" style="color:#27f1d5;cursor:pointer;" onclick='location.href="https://asppm.gonts.net/emeetplus6/empl6_one/files_3_0_curl/eMEETPlus4Launcher_3.5.2.exe";'>여기</span>를 클릭 후, 설치를 진행해주세요.</span></span>
            <ul class="vod-list" id="my_consult_box">
            </ul>
        </div>
    </div><!-- // #container -->


<div class="maf_table" style="border-top:2px solid #373737;display:none;">
    <div class="maf_th"><span>희망활동분야</span></div>
    <div class="maf_td">
        <select name="APPL_HOPE_PARENT_CD" class="maf_select"></select>
    </div>
</div>


<div id="reviewPop" class="popup_wrap">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content review_content">
                    <button type="button" class="pop_close" onclick="closeReview();"></button>
                    
                    <div id="reviewStar">
                        <h2 class="rpc_title"style="margin-bottom:24px;">리뷰작성</h2>
                        <div class="review-star review-star_mci">
                        <span class="revi_scor star"></span>
                        <span class="revi_scor star"></span>
                        <span class="revi_scor star"></span>
                        <span class="revi_scor star"></span>
                        <span class="revi_scor star-empty"></span>
                    </div>
                        <p class="rpc_text" style="margin-top:10px;">
                            만족스러우셨나요?
                            <br>
                            마스터님께 리뷰를 남겨 주세요.
                        </p>

                        <div class="rpc_review">
                            <textarea name="REVI_CNTN" id=""></textarea>
                        </div>
                        <div class="rpc_file">
                            <input type="file" id="rpcFile" class="file_input">
<!--                             <label for="rpcFile" class="file_input_label">파일 선택</label> -->
                            <span class="rpc_file_text pps_per"></span>
                        </div>
                        
                        <button type="button" class="rpc_submit" name="reviewBtn" onclick="writeReview();">작성완료</button>
                    </div>
                </div>
            </div>
        </div><!-- //#reviewPop -->
<script>

if( localStorage.getItem('frontLoginIdx') == null ) location.href = '/front';

// 화상 솔루션
var titles = {Eng:'PEOPLEMADE LIVE',
	       Kor:'PEOPLEMADE LIVE'};


var body = document.querySelector('body');
var select = document.querySelector('[data-role="selectBox"]');
var values = select.querySelector('[date-value="optValue"]');
var option = select.querySelector('ul');
//	var opts = option.querySelectorAll('li');
var opts = $('#cateList > li');

	$(function(){
		EMPCM.ASP.Init();
	});
$(document).ready(function(){
	// 화상 솔루션	

	fn_SelectOption("", "CAT", "APPL_HOPE_PARENT_CD");
	var htmlTagVal = '';
	var htmlTagText = '';
	var inTag = '';
	
	$('[name=APPL_HOPE_PARENT_CD] option').each(function(key,val){
		htmlTagVal = $(this).attr('value');
		htmlTagText = $(this).text();
		htmlTagText = htmlTagText.replace('선택해주세요','전체');
		
		inTag += '<li onclick="fn_DataList( prdtType, \'\', \''+htmlTagVal+'\' );" ><a href="javascript:;" >'+htmlTagText+'</a></li>'; 
	});
	
	$('#cateList').append(inTag);
	
	lnbEvent();
	
	select.addEventListener('click',selects);
	body.addEventListener('click',hideSelect);
	$('.selected-option').text( '전체' );
});

function lnbEvent(){
    var $lnb = $('.lnb');
    var $lnbItems = $lnb.find('.lnb_item');
    
    $lnbItems.each(function(i,e){
        if($(e).hasClass('is-active')){
            $lnb.scrollLeft( $(e).offset().left-100 );
        }
    });
    
    $lnbItems.on('mouseenter', function(e){
        $lnb.stop().animate({scrollLeft: $(this).offset().left-100}, 1000);
    });
    
}

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
	$.each(opts, function(key, val){
        $('.selected-option').text( $(this).text() );
    });
	$('#cateList > li').click(function(){
		console.log( $(this).children('a').text() );
		$('.selected-option').text( $(this).children('a').text() );
	});
}

/* 옵션밖의 영역(=바디) 클릭 시 옵션 숨김 */
function hideSelect(){
    if(option.classList.contains('show')){
        option.classList.add('hide');
        option.classList.remove('show');
    }
}
    
    
//리뷰팝업
// $(document).on('click' , '.mci_link_pop', function(){
//   $('#reviewPop').show();       
// });
$(document).on('click','.mci_link_popx',function(){
    $('#reviewPop').hide();       
});

////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////

var urlParam = window.location.search.replace('?','');
var prdtType = '';

$(function(){
	
	if( localStorage.getItem("frontLoginIdx") == null ) return location.href = "/front/account/login";
	
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
	
	fn_SelectOptionNotCode( 'selectMypeoplemadePrdtCateList', 'codeId'); 
	
	$('.lnb_item').removeClass("is-active");
	
	if( urlParam == 1 ) {
		fn_DataList( "VL","" );
		$('.lnb_item').eq(1).addClass("is-active");
	} else if( urlParam == 2 ) {
		fn_DataList( "A","" );
		$('.lnb_item').eq(2).addClass("is-active");
	} else if( urlParam == 3 ) {
		fn_DataList( "LN","" );
		$('.lnb_item').eq(3).addClass("is-active");
	}
	
	$('.lnb_item').click(function(){
		$('.lnb_item').removeClass("is-active");
		$(this).addClass("is-active");
	})
	
	$('.vod-nav-list').removeClass("active");
	$('.vod-nav-list').eq(urlParam).addClass("active");
	
	$('.vod-nav-list').click(function(){
		$('.vod-nav-list').removeClass("active");
		$(this).addClass("active");
	});
	
	$( '#now_loading' ).hide();
});

$('.pop_close').on( 'click', function(){
    $('.popup_wrap').hide();
    $('[name=BUY_IDX]').val( '' );
    
});
$('.mci_link.star').on('click',function(){
	$(this).find('.star5').width();
	$('#reviewPop').show();
});

function fn_DataList( TYPE, PRDT_DONE, CATE_TYPE ) {
	prdtType = TYPE;
	
	var params = new Object();
	params.status = "LIST";
	params.query = "selectFrontMypeoplemadePrdtList";
	params.prdtUuidNm = TYPE;
	params.prdtDone = PRDT_DONE;
	params.cateIdx = $('#codeId').val();
	params.CATE_TYPE = CATE_TYPE;
	
	params.FRONT_LOGIN_IDX = localStorage.getItem("frontLoginIdx");

	var result = fn_DataAjax2( params );	
	result = result.out.detail.data;

	var rsvChk = 0;
	var vlChk = 0;
	var timeChk = 0;
	var enChk = 0;
	var prdtCdTemp = '';
	$('#my_consult_box').empty();
	var html = "";
	if ( result.length ) {
		$.each( result, function( k, v ){
			if( k == 0 ) prdtCdTemp = v.PRDT_CD;
			else {
				if( v.PRDT_CD == prdtCdTemp ) rsvChk = 1;
				else rsvChk = 0;
				if( v.TIME_IDX == '0' ) timeChk = 1;
				else timeChk = 0;
			}
			if( v.PRDT_CD.indexOf('VL') > -1 ) vlChk = 1;
			else vlChk = 0;
			if( v.PRDT_CD.indexOf('EN') > -1 ) enChk = 1;
			else enChk = 0;

			if( vlChk == 1 || ( vlChk == 0 && rsvChk == 0 ) || timeChk == 0 || enChk == 1 ) {
				
				setUuid( v.INFO_TUMB_UUID );
				unit_fileGet( v.INFO_TUMB_UUID_NM+'_FILE' , "fn_fileUpload");
		        html += '<li>';
		        if ( v.PRDT_STATUS != '코칭완료' && v.PRDT_STATUS != '수강완료') {
		        	if( v.PRDT_CD.indexOf('VL') > -1 ) {
		        		html += '<a href="'+v.MOVE_URL+'" >';
			        	html += '		<div class="img-area myPeoplePrdt">';	 
			        	html += '			<div class="label date-box">';
			        	html += '				<span>'+v.PRDT_STATUS+'</span>';
			        	html += '			</div>';
			        	html += '			<img style="width:100%;height:210px;" src="'+$('#imgTag').val()+'">';
			        	if( v.COUP_IDX != 0 ) {
				        	html += '			<div class="label date-box" style="    left: auto;right: 10px;    top: 170px;color: #27f1d5;background: #fff;">';
				 			html += '				<span>쿠폰</span>';
				        	html += '			</div>';
			        	}
			        	html += '		</div>';
			        	html += '	</a>';       		
		        	} else if( v.PRDT_CD.indexOf('EN') > -1 ) {
		        		html += "<a onclick=\"window.open('"+v.MOVE_URL+"','_blank','width=1440px, height=814px, scrollbars=no, resizable=no, toolbars=no, menubar=no')\" >";
			        	html += '		<div class="img-area myPeoplePrdt">';
			        	html += '			<div class="label date-box">';
			        	html += '				<span>'+v.PRDT_STATUS+'</span>';
			        	html += '			</div>';
			        	
			        	if( emailReadYn.length > 0 ) {
			        		if( emailReadYn[0].BUY_PRDT_CD != null ) {
					        	if( emailReadYn[0].BUY_IDX.indexOf(v.BUY_IDX) > -1 ) {
						        	if( emailReadYn[0].BUY_PRDT_CD.indexOf(v.PRDT_CD) > -1 ) {
						        		html += '			<div class="label date-box" style="    left: auto;right: 10px;color: #666;background: white;">';
						        		html += '				<span class="hm_mail_alarm hm_mail_alarm_coach"></span>';
							        	html += '			</div>';
						        	}
					        	}
			        		}
			        	}
			        	
			        	html += '			<img style="width:100%;height:210px;" src="'+$('#imgTag').val()+'">';
			        	if( v.COUP_IDX != 0 ) {
				        	html += '			<div class="label date-box" style="    left: auto;right: 10px;    top: 170px;color: #27f1d5;background: #fff;">';
				 			html += '				<span>쿠폰</span>';
				        	html += '			</div>';
			        	}
			        	html += '		</div>';
			        	html += '	</a>';
		        	} else {
			        	if( v.TIME_IDX == '0' ) {
				        	if( v.PRDT_CD.indexOf('LN') > -1 ){
				        		if( v.LIVE_ACAD_YN == 'Y') {
			        				html += "<a class='MobileChromeCk' style=\"curser:pointer;\" onclick=\"isHwackJung('"+v.SANG_DAM_HWACK_JUNG_YN+"'); eMEETplus(3,0,'"+localStorage.getItem('frontLoginId')+"','"+localStorage.getItem('frontLoginNm')+"','"+v.MASTER_ID+"', '"+(v.INFO_PRDT_TITL1+' '+v.INFO_PRDT_TITL2)+"', '"+makeHistUrl(v.HIST_URL, v.CATE_IDX, v.USER_IDX)+"','"+v.BUY_IDX+"' ); userStart('"+v.BUY_IDX+"', '"+localStorage.getItem('frontLoginId')+"');\" >";
						        	html += '		<div class="img-area">';
						        	html += '			<div class="label date-box">';
						        	html += '				<span>'+v.PRDT_STATUS+'</span>';
						        	html += '			</div>';
						        	html += '			<img style="width:100%;height:210px;" src="'+$('#imgTag').val()+'">';
						        	if( v.COUP_IDX != 0 ) {
							        	html += '			<div class="label date-box" style="    left: auto;right: 10px;    top: 170px;color: #27f1d5;background: #fff;">';
							 			html += '				<span>쿠폰</span>';
							        	html += '			</div>';
						        	}
						        	html += '		</div>';
						        	html += '	</a>';
				        		} else {
				        			html += "<a style=\"curser:pointer;\" onclick=\"cateIdx="+v.CATE_IDX+";prdtCd='"+v.PRDT_CD+"';\">";
				        			html += '		<div class="img-area myPeoplePrdt">';	
						        	html += '			<div class="label date-box" style="    left: auto;right: 10px;color: #666;background: #27f1d5;">';
						        	html += '				<span>예약하기('+v.PRDT_CD_CNT+')</span>';
						        	html += '			</div>';
						        	html += '			<img style="width:100%;height:210px;" src="'+$('#imgTag').val()+'">';
						        	if( v.COUP_IDX != 0 ) {
							        	html += '			<div class="label date-box" style="    left: auto;right: 10px;    top: 170px;color: #27f1d5;background: #fff;">';
							 			html += '				<span>쿠폰</span>';
							        	html += '			</div>';
						        	}
						        	html += '		</div>';
						        	html += '	</a>';
			        			}
				        	} else if( v.PRDT_CD.indexOf('FN') > -1 ) {
			        			html += "<a style=\"curser:pointer;\" onclick=\"cateIdx="+v.CATE_IDX+";prdtCd='"+v.PRDT_CD+"';\">";
				        		html += '		<div class="img-area myPeoplePrdt">';	
					        	html += '			<div class="label date-box" style="    left: auto;right: 10px;color: #666;background: #27f1d5;">';
					        	html += '				<span>예약하기('+v.PRDT_CD_CNT+')</span>';
					        	html += '			</div>';
					        	html += '			<img style="width:100%;height:210px;" src="'+$('#imgTag').val()+'">';
					        	if( v.COUP_IDX != 0 ) {
						        	html += '			<div class="label date-box" style="    left: auto;right: 10px;    top: 170px;color: #27f1d5;background: #fff;">';
						 			html += '				<span>쿠폰</span>';
						        	html += '			</div>';
					        	}
					        	html += '		</div>';
					        	html += '	</a>';			        		
				        	} else {
			        			html += "<a style=\"curser:pointer;\" onclick=\"cateIdx="+v.CATE_IDX+";prdtCd='"+v.PRDT_CD+"';\">";
				        		html += '		<div class="img-area myPeoplePrdt">';	
					        	html += '			<div class="label date-box" style="    left: auto;right: 10px;color: #666;background: #27f1d5;">';
					        	html += '				<span>예약하기('+v.PRDT_CD_CNT+')</span>';
					        	html += '			</div>';
					        	html += '			<img style="width:100%;height:210px;" src="'+$('#imgTag').val()+'">';
					        	if( v.COUP_IDX != 0 ) {
						        	html += '			<div class="label date-box" style="    left: auto;right: 10px;    top: 170px;color: #27f1d5;background: #fff;">';
						 			html += '				<span>쿠폰</span>';
						        	html += '			</div>';
					        	}
					        	html += '		</div>';
					        	html += '	</a>';
				        	}
			        	} else {
				        	if( v.PRDT_CD.indexOf('LN') > -1 )
				        		html += "<a class='MobileChromeCk' style=\"curser:pointer;\" onclick=\"isHwackJung('"+v.SANG_DAM_HWACK_JUNG_YN+"'); eMEETplus(3,0,'"+localStorage.getItem('frontLoginId')+"','"+localStorage.getItem('frontLoginNm')+"','"+v.MASTER_ID+"', '"+(v.INFO_PRDT_TITL1+' '+v.INFO_PRDT_TITL2)+"', '"+makeHistUrl(v.HIST_URL, v.CATE_IDX, v.USER_IDX)+"','"+v.BUY_IDX+"' ); userStart('"+v.BUY_IDX+"', '"+localStorage.getItem('frontLoginId')+"');\" >";
				        	else if( v.PRDT_CD.indexOf('FN') > -1 )
				        		html += "<a class='MobileChromeCk' style=\"curser:pointer;\" onclick=\"isHwackJung('"+v.SANG_DAM_HWACK_JUNG_YN+"'); eMEETplus(1,0,'"+localStorage.getItem('frontLoginId')+"','"+localStorage.getItem('frontLoginNm')+"','"+v.MASTER_ID+"', '"+(v.INFO_PRDT_TITL1+' '+v.INFO_PRDT_TITL2)+"', '"+makeHistUrl(v.HIST_URL, v.CATE_IDX, v.USER_IDX)+"','"+v.BUY_IDX+"' ); userStart('"+v.BUY_IDX+"', '"+localStorage.getItem('frontLoginId')+"');\" >";
			        		else if( v.PRDT_CD.indexOf('CN') > -1 )
				        		html += "<a onclick=\"isHwackJung('"+v.SANG_DAM_HWACK_JUNG_YN+"'); fn_OpenSolution('"+v.MOVE_URL.replace('chat_solution','chat_review')+"','"+v.BUY_IDX+"')\" >";
				        	else
				        		html += "<a onclick=\"isHwackJung('"+v.SANG_DAM_HWACK_JUNG_YN+"'); window.open('"+v.MOVE_URL+"','_blank','width=1440px, height=800px, scrollbars=no, resizable=no, toolbars=no, menubar=no')\" >";
							
				        	html += '		<div class="img-area">';
				        	html += '			<div class="label date-box">';
				        	html += '				<span>'+v.PRDT_STATUS+'</span>';
				        	html += '			</div>';
				        	html += '			<img style="width:100%;height:210px;" src="'+$('#imgTag').val()+'">';
				        	if( v.COUP_IDX != 0 ) {
					        	html += '			<div class="label date-box" style="    left: auto;right: 10px;    top: 170px;color: #27f1d5;background: #fff;">';
					 			html += '				<span>쿠폰</span>';
					        	html += '			</div>';
				        	}
				        	html += '		</div>';
				        	html += '	</a>';
			        	}
		        	}
		        	
		        } else {
		        	html += '	<div class="my_consult_item">';
		        	html += '		<div class="img-area mci_inner">';
		        	html += '			<div class="label state-complete">'+v.PRDT_STATUS+'</div>';
		        	html += '			<div class="label state-complete coachPrdtCardPeriod" style="right: 40px;color: #fff;background: #000;top: 90px;text-align: center;">'+v.PRDT_DTM+'</div>';
		        	html += '			<img style="width:100%;height:210px;" src="'+$('#imgTag').val()+'">';
		        	html += '			<div class="mci_hover_box">';
		        	html += '				<div class="mic_hover_btn_box">';
		        	
		        	html += '					<a class="mci_link mci_link_pop reviewPopup" id="review'+v.BUY_IDX+'">후기';
		        	html += '						<div class="review-star review-star_mci">';
		        	
		        	for( var a = 0; a< v.REVI_SCOR; a++ ) {
			        	html += '							<span class="star"></span>';
		        	}
		        	for( var a = 5; v.REVI_SCOR - a < 0; a-- ) {
			        	html += '							<span class="star-empty"></span>';
		        	}
		        	
		        	html += '						</div>';		
		        	html += '					</a>';
		        	
		        	if( v.PRDT_CD.indexOf('EN') > -1 ) html += "<a class=\"mci_link mci_link_pop\" onclick=\"window.open('"+v.MOVE_URL+"','_blank','width=1440px, height=760px, scrollbars=no, resizable=no, toolbars=no, menubar=no')\" >다시보기</a>";
		        	if( v.PRDT_CD.indexOf('CN') > -1 ) html += "<a class=\"mci_link mci_link_pop\" onclick=\"window.open('"+v.MOVE_URL.replace('chat_solution','chat_review')+"','_blank','width=1440px, height=760px, scrollbars=no, resizable=no, toolbars=no, menubar=no')\" >다시보기</a>";
	
		        	html += '				</div>';
		        	html += '			</div>';
		        	html += '		</div>';
		        	html += '	</div>';
		        }
		        
		        // 각각의 서비스 상세로 이동
		        html += '	<a href="'+( '/front/prdt/detail'+'?'+v.DETAIL_URL.split('?')[1] )+'" >';
		        
		        html += '		<div class="category">';
		        html += '			<span>'+v.PRDT_TYPE+'</span>';
		        html += '			<span>'+v.P_CODE_NM+'</span>';
		        html += '			<span>'+v.USER_NM+'</span>';
		        html += '		</div>';
		        html += '		<p>'+v.INFO_PRDT_TITL1+'<br>'+v.INFO_PRDT_TITL2+'</p>';
		        
		        html += '	</a>';
		        html += '</li>';
			}
		});
	}else{
		if( TYPE == 'VL' )
			html += ' <div style="display: table; height: 200px; margin:auto;cursor:pointer;"> <h2 class="phone_nodataDiv tablet_nodataDiv" onclick="fn_BtnPrdtLink( \'VOD\' );" style="text-align:center; vertical-align: middle;display: table-cell;">수강하신 VOD강의가 없으시네요. <br>원하시는 전문가의 강의를 들어 보시는 건 어떠세요?</h2> </div> ';
		else if( TYPE == 'LN' )
			html += ' <div style="display: table; height: 200px; margin:auto;cursor:pointer;"> <h2 class="phone_nodataDiv tablet_nodataDiv" onclick="fn_BtnPrdtLink( \'LIVE CLASS\' );" style="text-align:center; vertical-align: middle;display: table-cell;">전문가들의 생생한 라이브현장으로 가 보시죠^^</h2> </div> ';
		else
			html += ' <div style="display: table; height: 200px; margin:auto;cursor:pointer;"> <h2 class="phone_nodataDiv tablet_nodataDiv" onclick="fn_BtnPrdtLink( \'1:1 코칭\' );" style="text-align:center; vertical-align: middle;display: table-cell;">지금은 1:1코칭을 받고 계시지 않군요^^ <br>자세한 상담과 코칭을 받아보시겠어요?</h2> </div> ';
	}

	$('#my_consult_box').append( html );
	$(".sub-nav").empty();
	
	html = '';
	
	if( TYPE == 'LN' || TYPE == 'VL' ) {
		html += '<li class="active"><a class="reloadClick" href="javascript:;" onclick=\'fn_DataList( "'+TYPE+'", "" );fn_chageCurr( 0 );\'>전체</a></li>';
        html += '<li><a href="javascript:;" onclick=\'fn_DataList( "'+TYPE+'", "N" );fn_chageCurr( 1 );\'>수강 중</a></li>';
        html += '<li><a href="javascript:;" onclick=\'fn_DataList( "'+TYPE+'", "Y" );fn_chageCurr( 2 );\'>수강완료</a></li>';
	} else {
	    html += '<li class="active"><a class="reloadClick" href="javascript:;" onclick=\'fn_DataList( "A", "" );fn_chageCurr( 0 );\'>전체</a></li>';
	    html += '<li><a href="javascript:;" onclick=\'fn_DataList( "FN", "" );fn_chageCurr( 1 );\'>1:1 화상</a></li>';
	    html += '<li><a href="javascript:;" onclick=\'fn_DataList( "CN", "" );fn_chageCurr( 2 );\'>1:1 채팅</a></li>';
	    html += '<li><a href="javascript:;" onclick=\'fn_DataList( "EN", "" );fn_chageCurr( 3 );\'>1:1 이메일</a></li>';
	    html += '<li><a href="javascript:;" onclick=\'fn_DataList( "A", "Y" );fn_chageCurr( 4 );\'>코칭완료</a></li>';
	}
	
	$(".sub-nav").append( html );

}

function calcScor( REVI_SCOR ){
	if ( typeof REVI_SCOR == 'number' ||  typeof REVI_SCOR == 'string' ) {
		return REVI_SCOR/5 *62; 
		// 100% width 가 아니기때문
	}else{
		return 0;
	}
}

function fn_chageCurr( THIS ) {
	$('.sub-nav li').removeClass("active");
	$('.sub-nav li').eq( THIS ).addClass("active");
}


var calcProgress = function ( maxCnt, haveCnt ){
	return Math.round(haveCnt/maxCnt *100);
}

// function fn_BtnPopup( BUY_IDX, REVI_IDX, THIS ){
//     if( REVI_IDX != null ) {
//     	var params = new Object();
//     	params.status = "DETAIL";
//     	params.query = "selectFrontMypeoplemadeReviDetail";
    	
//     	params.REVI_IDX = REVI_IDX;
//     	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
    	
//     	var jsonData = fn_DataDetail( params );
    	
//     	if( jsonData.length > 0 ) {
//     		$('.rpc_title').text('후기');
//     		$('.rpc_text').text( jsonData[0].REVI_CNTN );
    		
//     		$('.rpc_review').hide();
//         	$('.rpc_submit').hide();
//     	}
    	
//     } else {
// 		$('.rpc_title').text('후기작성');
// 		$('.rpc_text').html( '만족스러우셨나요?<br>마스터님께 후기를 남겨 주세요.' );
		
//         $('[name=BUY_IDX]').val( BUY_IDX );
// 		$('.rpc_review').show();
//     	$('.rpc_submit').show();
//     }
    
//     $('.popup_wrap').hide();
//     $('#reviewPop').show();
    
// }

// function fn_BtnRegist(){
// 	if ( $('[name=REVI_CNTN]').val().trim() == '' || $('[name=REVI_CNTN]').val().trim() == null ) return alert('내용을 입력해 주세요.');
	
// 	var params = unit_getParams("searchArea");
// 	params.status = "WRITE";
// 	params.query = "insertFrontReviData";
	
// 	params.BUY_IDX = $('[name=BUY_IDX]').val();
// 	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
// 	params.REVI_SCOR = $('[name=REVI_SCOR]').val();
// 	params.REVI_CNTN = $('[name=REVI_CNTN]').val();
	
// 	var result = fn_DataAjax( params, "N" );
// 	alert('정상적으로 등록되었습니다.');
	
// 	$('.popup_wrap').hide();
//     $('[name=BUY_IDX]').val( '' );
//     $('[name=REVI_SCOR]').val( '' );
//     $('[name=REVI_CNTN]').val( '' );

// 	$('li.current a').trigger("click");
// }

function fn_OpenSolution( link, BUY_IDX ){
	 var winObj = window.open( link ,'tistory','width=1400px, height=800px, scrollbars=no, resizable=no, toolbars=no, menubar=no');
		
	  var loop = setInterval(function() {
	      if(winObj.closed) {

				var params = new Object();
				params.status = "WRITE";
				params.query = "insertChatEnd";
				params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
				params.BUY_IDX = BUY_IDX;
				var result = fn_DataAjax2( params );
				
				location.reload();
	      }  
	  }, 1000);
}


//리뷰팝업
$(document).on('click', '.reviewPopup', function(){
	$('.revi_scor').css( 'cursor','pointer' );
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectFrontMypagePaymentUserReview";
	params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
	params.BUY_IDX = this.id.replace( 'review','');
	
	var detail  = fn_DataAjax2( params );
	if ( detail.out.detail.data.length  ) {
		return alert('이미 작성한 리뷰가 있습니다.');
	}
	
	$('[name=reviewBtn]').attr( 'onclick', "writeReview("+this.id.replace( 'review','')+")" );
	
	$('.revi_scor').addClass('star-empty');
	$('#reviewPop').show();
});


// 별찍기
$('.revi_scor').on('click', function(){
	var scrIdx = $(this).index();
	$('.revi_scor').removeClass('star');
	
	$('.revi_scor').each(function( k ){
		if ( k > scrIdx ) {
			$(this).addClass('star-empty');
		}else{
			$(this).removeClass('star-empty');
		}
	});
});

function closeReview(){
	$('[name=reviewBtn]').attr( 'onclick', '' );
	$('.revi_scor').removeClass('star');
	$('.revi_scor').addClass('star-empty');
}

function writeReview( idx ){
	if ( confirm( "한번 작성한 리뷰는 수정할수 없습니다. \n작성하시겠습니까?" ) ) {
		var params = unit_getParams('reviewPop');
		params.status = "WRITE";
		params.query = "insertFrontMypagePaymentReview";
		params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
		params.BUY_IDX = idx;
		params.REVI_SCOR = $('.revi_scor:not(.star-empty)').length;
		var write  = fn_DataAjax2( params );
		if (write.out.resultCnt > 0) {
			alert('리뷰가 등록되었습니다.');
			location.reload();
		}
	}
}

function userStart( buy_idx , user_idx ){
	
	var params = new Object();
	params.status = "WRITE";
	params.query = "insertFrontUserBuyCons";
	params.BUY_IDX = buy_idx;
	
	var insertDetail = fn_DataAjax2( params );
	
}

function isHwackJung( isY ){
	if ( isY != 'Y' ) {
		alert('확정처리되지 않았습니다.');
		event.preventDefault();
		event.stopPropagetion();
		event.stopImmediatePropagation();
		
		return false;
	}
}

function makeHistUrl( url, cateIdx, userIdx ){
	var urlArr = url.split('?');
	return "https://peoplemade.net/front/mypeoplemade/face_history_list?"+urlArr[1];
// 	return "https://peoplemade.net/front/mypeoplemade/face_history_list?cateIdx="+cateIdx+"&userIdx="+userIdx;
}
</script>













