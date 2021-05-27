<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" />


<style>
@media screen and (max-width: 960px){
.lnb_item:first-child {
    padding-left: 0px;
}
}
</style>

<div id="wrap" class="vod">

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
                    <li class="lnb_item "><a href="/front/mypeoplemade/network">내인맥<span class="text-point text-point-small"></span></a></li>
                    <li class="lnb_item is-active"><a href="/front/mypeoplemade/coaching?1">VOD<span class="text-point text-point-small"><span>0</span>개</span></a></li>
                    <li class="lnb_item"><a href="/front/mypeoplemade/coaching?2">1:1코칭<span class="text-point text-point-small"><span>0</span>개</span></a></li>
                    <li class="lnb_item"><a href="/front/mypeoplemade/coaching?3">LIVE CLASS<span class="text-point text-point-small"><span>0</span>개</span></a></li>
                    <li class="lnb_item "><a href="/front/mypeoplemade/follow">팔로잉<span class="text-point text-point-small"><span>0</span>개</span></a></li>
                    <li class="lnb_item"><a href="/front/mypeoplemade/myinfo">내 정보관리<span class="text-point text-point-small"></span></a></li>
                </ul>
            </div>

            <div class="vod-detail-info">
            	<div class="pcTumbnail" style="width: 10%; float: left;   margin-right: 10px; overflow: hidden;">
            		<img src="/resources/assets/images/common/service_home_default_img.png" alt="마스터이미지">
            	</div>
                <div class="info-title">
                </div>
                <ul class="info-detail">
                </ul>
            </div>
            
            <div class="btn-page-box">
                <a href="/front/mypeoplemade/coaching?1"><button type="button" class="btn-list">목록으로 이동</button></a>
            </div>
        </div>
    </div><!-- // #container -->


<script>
var fileArr = [];
var fileExistsArr = [];

var mVodMainImage = '';

$(document).ready(function(){
//     $(".vod-nav").slick({
//         slidesToScroll: 3,
//         variableWidth: true,
//         autoplay: false,
//         infinite: false,
//         dots: false,
//         arrows: false
//     });
});

$(function(){
	
	if( localStorage.getItem("frontLoginIdx") == null ) return location.href = "/front/account/login";
    
	selectFrontMypeoplemadePrdtCnt();
	selectFrontVodInfo();
	selectFrontVodPlayList();
	
	$( '#now_loading' ).hide();
	
	if (window.outerWidth <= 769) {
		$('.pcTumbnail').hide();
	}else{
		$('.pcTumbnail').show();
	}
	
// 	$('.pcTumbnail img').each(function(){
		
// 		$(this).load(function(){
			
// 			var imgHeight = this.naturalHeight;
// 			console.log( imgHeight );
// 		});
		
// 	});
	
	$('.pcTumbnail').css('max-height', $('.info-title').outerHeight(true) );
	
	$(window).resize(function (){
		// width값을 가져오기
		var width_size = window.outerWidth;
		// 800 이하인지 if문으로 확인
		if (width_size <= 769) {
			$('.pcTumbnail').hide();
			if (mVodMainImage != '') {
				$('.info-title').css( {'background':'url('+mVodMainImage+') no-repeat center','background-size':'cover', 'background-position':'center' } );
			}else{
				$('.info-title').css( {'background':'url(/resources/assets/images/common/vod_player_default_img.png) no-repeat center','background-size':'cover' , 'background-position':'center'} );
			}
		}else{
			$('.pcTumbnail').show();
			if (mVodMainImage != '') {
				$('.pcTumbnail img').attr('src',mVodMainImage);
			}else{
				$('.pcTumbnail img').attr('src','/resources/assets/images/common/service_home_default_img.png');
			}
			$('.pcTumbnail').css('max-height', $('.info-title').outerHeight(true) );
			$('.info-title').css( {'background':'none','background-size':'cover' } );
		}
	});
	
});

function selectFrontMypeoplemadePrdtCnt(){
	
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectFrontMypeoplemadePrdtCnt";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var prdtCntData = result.out.detail.data[0];
	$('.text-point-small span').eq(0).text( prdtCntData.VOD_CNT );
	$('.text-point-small span').eq(1).text( prdtCntData.COACH_CNT );
	$('.text-point-small span').eq(2).text( prdtCntData.LIVE_CNT );
	$('.text-point-small span').eq(3).text( prdtCntData.FOLL_CNT );
}


function selectFrontVodInfo(){
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectFrontVodInfo";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.buyIdx = '${ out.params.buyIdx }';
	params.prdtCd = '${ out.params.prdtCd }';
	params.cateIdx = '${ out.params.cateIdx }';
	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var prdtCntData = result.out.detail.data[0];
	var progPer = 0;
	var inTag = '';
	
	inTag += '<h3>'+prdtCntData.INFO_PRDT_TITL1+'<br class="mobile-br">'+prdtCntData.INFO_PRDT_TITL2+'</h3>';
	inTag += '<span class="name">'+prdtCntData.M_USER_NM+' 마스터</span>';
	$('.info-title').append(inTag);
	
	$('#imgTag').val('');
		
	setUuid( prdtCntData.INFO_PRDT_UUID );
		
	imgIdValue="INFO_PRDT_UUID_FILE";
	unit_fileGet( imgIdValue , "fn_fileUpload");

	if ( isMobile() ) {
		
		if ($('#imgTag').val() == '') {
			$('.info-title').css( {'background':'url(/resources/assets/images/common/vod_player_default_img.png) no-repeat center','background-size':'cover' , 'background-position':'center' } );
		}else{
			$('.info-title').css( {'background':'url('+$('#imgTag').val()+') no-repeat center','background-size':'cover' , 'background-position':'center'} );
			mVodMainImage = $('#imgTag').val();
		}
		
	}else{
		mVodMainImage = $('#imgTag').val();
		$('.pcTumbnail img').attr('src',mVodMainImage);
	}
	
	inTag = '';

	if( prdtCntData.LECT_PROG_CNT != 0 ) progPer = parseInt((prdtCntData.LECT_PROG_CNT/prdtCntData.LECT_TOTAL_CNT)*100);
	
	
	inTag += '<li>수강기간 : <span>'+prdtCntData.LECT_TERM_DIFF+'</span></li>';
	inTag += '<li>강의 수(시간) : <span>'+prdtCntData.LECT_TOTAL_CNT+'강 ( '+parseInt(prdtCntData.LECT_TOTAL_MIN_CNT/60)+' 분)</span></li>';
	inTag += '<li>진도율 : <span>'+progPer+'%</span><span>(<em class="text-point">'+prdtCntData.LECT_PROG_CNT+'</em>/'+prdtCntData.LECT_TOTAL_CNT+')</span>';
	inTag += '<div class="progress-bar"><div class="progress" style="width: '+progPer+'%;"></div></div>';
	if( prdtCntData.LECT_LAST_LOG != null ) inTag += '<p class="connection-time">(최종접속시간 <span>'+prdtCntData.LECT_LAST_LOG+'</span>)</p></li>';
	$('.info-detail').append( inTag );
}

function selectFrontVodPlayList(){
	var params = new Object();
	params.status = "LIST";
	params.query = "selectFrontVodPlayList";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.buyIdx = '${ out.params.buyIdx }';
	params.prdtCd = '${ out.params.prdtCd }';
	params.cateIdx = '${ out.params.cateIdx }';
	params.prdtUuidNm = "A";
	
	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var jsonData = result.out.detail.data;
	var progPer = 0;
	var inTag = '';
	
	if( jsonData.length > 0 ) {
		console.log( jsonData );
		$.each(jsonData, function(key, val){
			inTag += '<div class="vod-part" name="vod-part'+val.DATA_PART_IDX+'">';
			
			inTag += '	<h4>'+val.DATA_PART_NM+'</h4>';
// 			inTag += '	<div class="button-title">';
// 			inTag += '		<span>재생</span>';
// 			inTag += '		<span>강의자료</span>';
// 			inTag += '	</div>';
			inTag += '	<ul>';

			inTag += '		<li>';
			inTag += '			<h5 style="cursor:pointer;" onclick="window.open(\''+val.MOVE_URL+'\',\'_blank\',\'width=1440px, height=1000px, scrollbars=no, resizable=no, toolbars=no, menubar=no\')">'+val.DATA_TITL+' <span>( '+val.DATA_RUNN_TOTAL+' )</span></h5>';
			inTag += '			<div class="progress-bar running">';

			if( val.PROG_TIME != null ) progPer = parseInt((val.PROG_TIME/val.DATA_RUNN)*100);
			else progPer = 0;
			
			inTag += '				<div class="progress" style="width: '+progPer+'%"></div>';
			if( val.DATA_RUNN_PROG!= null ) inTag += '				<span class="time">'+val.DATA_RUNN_PROG+'</span>';
			else inTag += '				<span class="time"></span>';
			inTag += '			</div>';
			inTag += '			<div class="btn-box">';
			inTag += '				<button type="button" class="btn-play" title="강의재생" onclick="window.open(\''+val.MOVE_URL+'\',\'_blank\',\'width=1440px, height=1000px, scrollbars=no, resizable=no, toolbars=no, menubar=no\')"></button>';
			
			if( val.DATA_UUID != '' ) {
				inTag += '				<button type="button" DATA_IDX="'+val.DATA_IDX+'" class="btn-data fileName"  title="강의자료" onclick="';
				
				fileArr = [];
				fileExistsArr = [];
				var nofileMsg = "";
				setUuid( val.DATA_UUID );
				imgIdValue = 'DATA_UUID_FILE'+(key+1)+'';
				unit_fileGet( imgIdValue , "fn_fileUpload");
				
// 				alert( val.DATA_UUID );
				console.log(fileExistsArr);
				$.each(fileArr, function(key1,val1){
					if (fileExistsArr[key1] == 'Y') {
						inTag += 'unit_fileDown(\''+fileArr[key1]+'\');';
					}else{
						if ( nofileMsg == "" ) {
							inTag += 'alert(\'파일이 존재하지 않습니다.\');';
							nofileMsg = " ";
						}
					}
				});
				
				inTag += '"></button>';
			}
			
			inTag += '			</div>';
			inTag += '		</li>';
			inTag += '	</ul>';
			
			inTag += '</div>';
			
			console.log(val);
		});
		
		$('.vod-detail-info').after( inTag );
		
		$('[name^=vod-part]').each(function(key,val){
			$('[name='+$(this).attr('name')+']').each(function(key,val){
				if( key > 0 ) $(this).children('h4').remove();
			});
		});
		
		// 파일 다운 받을시 다운기록 데이터 저장
		$('.btn-data').on('click',function(){
			var params = new Object();
			params.status = "WRITE";
			params.query = "insertFrontVodDownloadData";
			params.frontLoginIdx = localStorage.getItem('frontLoginIdx');
			params.DATA_IDX = $(this).attr('DATA_IDX');
			
			var ajaxDetail = ${unit.ajax( ajaxUrl, "ajax", "params")};
			
		});
		
	}
}


</script>

