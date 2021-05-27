<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" />
<style>


.prdt_tab_lists.is-sticky {
	height: 80px;
	padding-top: 10px;
    width: 100% !important;
    padding-left: 30px;
    position: fixed;
    top: -10px;
    left: 0;
    z-index: 999;
    width: calc(100% - 360px);
}
/* .player-number{display:block;} */
/* .prdt_tab_lists{display:none;} */
/* .prdt_tab_lists.is-sticky{display:none;} */
.footer{display:none !important;}
.topbar{display:none;}

#header{padding: 0 50px;}


@media screen and (max-width: 750px) {

	#header{padding: 0 26px;}

}

@media screen and (max-width: 480px) {

	.prdt_tab_lists.is-sticky {height: 50px;}

}
</style>
<div id="wrap" class="vod vod-player" style="position:absolute; top:0; left:0; width: 100%; background: #000;     z-index: 99999;" >

    <div id="header" class="header">
        <div class="section_inner" style=" max-width: 100%; padding: 0px;" >
            <div class="header_top">
                <h1 class="header_logo"><a href="javascript:;">PEOPLEMADE</a></h1>

<!--                 <div class="header_mypeople"> -->
<!--                     <a href="/front/mypeoplemade/network"> -->
<!--                         <span class="hm_title">마이피플</span> -->
<!--                     </a> -->
<!--                     <div class="hm_box"> -->
<!--                         <span class="hm_name"> -->
<!--                             <span>남주혁</span>님 -->
<!--                         </span> -->
<!--                         <span class="hm_thumb" style="background-image: url(/resources/assets/images/dummy/dummy13.png);"> -->
<!--                             <span class="hm_arrow"></span> -->
<!--                         </span> -->
<!--                     </div> -->
<!--                     <div class="hm_dropdown"> -->
<!--                         <ul class="hm_list"> -->
<!--                             <li><a href="/front/mypeoplemade/network" >마이피플</a></li> -->
<!--                             <li><a href="/front/mypage/payment">주문내역</a></li> -->
<!--                             <li><a href="/front/mypage/cart">장바구니</a></li> -->
<!--                             <li><a href="/front/main/index_logout">로그아웃</a></li> -->
<!--                         </ul> -->
<!--                     </div> -->
<!--                 </div> -->
            </div>
        </div>
    </div><!-- // #header -->

    <div id="container">
        <div class="player-inner player-header">
            <p id="vodPartNm"></p>
      		<h2 class=" prdt_tab_lists is-sticky"><span class="player-number"></span></h2>
        </div>
        <div class="player-area">
            <div class="video-area">
                <div class="video-wrap">
            		<iframe id="vodPlayer" name="vodPlayer" src="" width="100%;" height="100%;" style="width:100%;height:100%; max-height: 600px; background-size: cover;" allowfullscreen ></iframe>
<!--                     <button type="button" class="btn-video-play"></button> -->
                </div>
                <div class="btn-inner player-inner">
                    <div class="btn-lecture">
                        <button type="button" class="lecture-prev" DATA_IDX="" onclick="fn_BtnVodPlay('', $(this).attr('DATA_IDX'), 'P');"><i class="ico-arrow-left"></i>이전 강의</button>
                        <button type="button" class="lecture-next" DATA_IDX="" onclick="fn_BtnVodPlay('', $(this).attr('DATA_IDX'), 'N');">다음 강의<i class="ico-arrow-right"></i></button>
                    </div>
                    <button type="button" class="btn-data" onclick="fn_BtnFileDown();">강의자료<i class="ico-data"></i></button>
                </div>
            </div>
            <div class="curriculum">
            </div>
        </div>
    </div><!-- // #container -->
</div>

<script src="https://player.yozii.com/js/jquery.js"></script>
<script src="https://player.yozii.com/fiveplayer/fiveplayer-phone.js"></script>
<script src="https://player.yozii.com/fiveplayer-webinterface.js"></script>
<iframe id='iframe_mobile_player' name='iframe_mobile_player' style='display:none;' ></iframe>
<iframe id='iframe_modal' name='iframe_modal' style='display:none;'></iframe>
<div id="applinkDiv" style="display:none;"></div>

<script>
if ( ! isMobile() ) $('h2.prdt_tab_lists').removeClass( 'is-sticky' );

var dataIdx = '${ out.params.dataIdx }';
var fileArr = [];
var fileExistsArr = [];

$(function(){
	if( localStorage.getItem("frontLoginIdx") == null ) return location.href = "/front/account/login";
	selectFrontVodInfo();
	selectFrontVodPlayList();
	
	if ( isMobile() ) {
		$('#vodPlayer').hide();
		$('.video-wrap').css('background', 'url(/resources/assets/images/common/vod_player_default_img.png) no-repeat center');
	}
	
	if ( !isMobile() ) {
		$('[name="vodUrl"]').each(function(key,val){
			if( $(this).attr('DATA_IDX') == dataIdx ){ $(this).trigger('click'); }
			
		});
	}
	
	$( '#now_loading' ).hide();
});

function selectFrontVodInfo(){
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectFrontVodPlayerInfo";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.buyIdx = '${ out.params.buyIdx }';
	params.prdtCd = '${ out.params.prdtCd }';
	params.cateIdx = '${ out.params.cateIdx }';
	
	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var jsonData = result.out.detail.data[0];
	var progPer = 0;
	var inTag = '';
	
	$('.curriculum').append('<span class="mf_cate" style="padding-top: 0px;">'+jsonData.P_CODE_NM+'·'+jsonData.M_USER_NM+'</span>');
	$('.curriculum').append('<h3>'+jsonData.INFO_PRDT_TITL1+'<br>'+jsonData.INFO_PRDT_TITL2+'</h3>');
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
	
	var test = 0;
	if( params.buyIdx == 'null' ) test = 1; 
	
	if( jsonData.length > 0 ) {
		
		if( test != 1 ) {
			$.each(jsonData, function(key, val){
				inTag += '<div class="curr-part" name="vod-part'+val.DATA_PART_IDX+'" DATA_IDX="'+val.DATA_IDX+'">';
				inTag += '	<h4>'+val.DATA_PART_NM+'</h4>';
				inTag += '	<ul>';
				inTag += '		<li>';
				
				if ( isMobile() ) {// MOBI!!
					inTag += '			<a name="vodUrl" href="javascript:;" onclick="open_fiveplayer(\''+val.PLAYER_URL+'\',document.location.href);" DATA_IDX="'+val.DATA_IDX+'" DATA_PART_IDX="'+val.DATA_PART_IDX+'">'+val.DATA_TITL+' ( '+val.DATA_RUNN_TOTAL+' )';
				}else{// PC!!
					inTag += '			<a name="vodUrl" href="javascript:;" onclick="fn_BtnVodPlay(\''+val.PLAYER_URL+'\', \''+val.DATA_IDX+'\', \'\');" DATA_IDX="'+val.DATA_IDX+'" DATA_PART_IDX="'+val.DATA_PART_IDX+'">'+val.DATA_TITL+' ( '+val.DATA_RUNN_TOTAL+' )';
				}
				
				if( val.DATA_FREE_YN == 'Y') inTag += '				<span class="curr-label">무료공개</span>'; 
				inTag += '			</a>';

				if( val.DATA_UUID != '' ) {
					inTag += '				<button type="button" class="btn-data-hidden" title="강의자료" DATA_IDX="'+val.DATA_IDX+'" style="hidden" onclick="';
					
					fileArr = [];
					fileExistsArr = [];
					var nofileMsg = "";
					
					setUuid( val.DATA_UUID );
					imgIdValue = 'DATA_UUID_FILE'+val.DATA_PART_IDX+'';
					unit_fileGet( imgIdValue , "fn_fileUpload");
					
					$.each(fileArr, function(key1,val1){
						if (fileExistsArr[key1] == 'Y') {
							inTag += 'unit_fileDown(\''+fileArr[key1]+'\');';
						}else{
							if ( nofileMsg == "" ) {
								inTag += 'alert(\'파일이 존재하지 않습니다.\');return false;';
								nofileMsg = " ";
							}
						}
					});
					
					inTag += '				"></button>';
				}
				
				inTag += '		</li>';
				inTag += '	</ul>';
				inTag += '</div>';
			});
			$('.curriculum').append( inTag );
		} else {
			console.log(111);
			$.each(jsonData, function(key, val){
				if( val.DATA_FREE_YN == 'Y') {
					inTag += '<div class="curr-part" name="vod-part'+val.DATA_PART_IDX+'" DATA_IDX="'+val.DATA_IDX+'">';
					inTag += '	<h4>'+val.DATA_PART_NM+'</h4>';
					inTag += '	<ul>';
					inTag += '		<li>';
					
					if ( isMobile() ) {// MOBI!!
						inTag += '			<a name="vodUrl" href="javascript:;" onclick="open_fiveplayer(\''+val.PLAYER_URL+'\',document.location.href);" DATA_IDX="'+val.DATA_IDX+'" DATA_PART_IDX="'+val.DATA_PART_IDX+'">'+val.DATA_TITL+' ( '+val.DATA_RUNN_TOTAL+' )';
					}else{// PC!!
						inTag += '			<a name="vodUrl" href="javascript:;" onclick="fn_BtnVodPlay(\''+val.PLAYER_URL+'\', \''+val.DATA_IDX+'\', \'\');" DATA_IDX="'+val.DATA_IDX+'" DATA_PART_IDX="'+val.DATA_PART_IDX+'">'+val.DATA_TITL+' ( '+val.DATA_RUNN_TOTAL+' )';
					}
					
					inTag += '				<span class="curr-label">무료공개</span>'; 
					inTag += '			</a>';

					if( val.DATA_UUID != '' ) {
						inTag += '				<button type="button" class="btn-data-hidden" title="강의자료" DATA_IDX="'+val.DATA_IDX+'" style="hidden" onclick="';
						
						fileArr = [];
						fileExistsArr = [];
						var nofileMsg = "";
						
						setUuid( val.DATA_UUID );
						imgIdValue = 'DATA_UUID_FILE'+val.DATA_PART_IDX+'';
						unit_fileGet( imgIdValue , "fn_fileUpload");
						
						$.each(fileArr, function(key1,val1){
							if (fileExistsArr[key1] == 'Y') {
								inTag += 'unit_fileDown(\''+fileArr[key1]+'\');';
							}else{
								if ( nofileMsg == "" ) {
									inTag += 'alert(\'파일이 존재하지 않습니다.\');return false;';
									nofileMsg = " ";
								}
							}
						});
						
						inTag += '				"></button>';
					}
					
					inTag += '		</li>';
					inTag += '	</ul>';
					inTag += '</div>';
				}
			});
			$('.curriculum').append( inTag );
			$('.curr-label').trigger('click');
		}

		
		$('[name^=vod-part]').each(function(key,val){
			$('[name='+$(this).attr('name')+']').each(function(key,val){
				if( key > 0 ) $(this).children('h4').remove();
			});
		});
	}
}

function fn_BtnVodPlay( PLAYER_URL, DATA_IDX, UPDOWN ){
	if( PLAYER_URL != '' & DATA_IDX != '' ) {
		$('iframe').attr('src', 'https://player.yozii.com/fiveplayer/fiveplayer-streaming.php?token='+PLAYER_URL);
		$('iframe').attr('id', DATA_IDX);
		$('iframe').attr('name', DATA_IDX);
		$('.lecture-prev').attr('DATA_IDX', DATA_IDX);
		$('.lecture-next').attr('DATA_IDX', DATA_IDX);

		$('.curr-part').each(function(key,val){
			if( $(this).attr('DATA_IDX') == DATA_IDX ) {
				$('#vodPartNm').text( $('[name=vod-part'+$('[name=vodUrl]').eq(key).attr('DATA_PART_IDX')+']').eq(0).find('h4').html() );
				$('.prdt_tab_lists').text( $('[name=vodUrl]').eq(key).text() );
				$('.player-number').text( $('[name=vodUrl]').eq(key).text().slice(0,1) );
			}
		});
			
		
	} else {
		if( UPDOWN == 'P' ){
			$('.lecture-prev').attr('DATA_IDX', DATA_IDX);

			$('.curr-part').each(function(key,val){
				if( $(this).attr('DATA_IDX') == DATA_IDX ) {
					if( key != 0 ) {
						$('[name=vodUrl]').eq(key-1).trigger('click');
						$('#vodPartNm').text( $('[name=vod-part'+$('[name=vodUrl]').eq(key-1).attr('DATA_PART_IDX')+']').eq(0).find('h4').html() );
						$('.prdt_tab_lists').text( $('[name=vodUrl]').eq(key-1).text() );
						$('.player-number').text( $('[name=vodUrl]').eq(key-1).text().slice(0,1) );
					} 
				}
			});
		} else {
			$('.lecture-next').attr('DATA_IDX', DATA_IDX);
			
			$('.curr-part').each(function(key,val){
				if( $(this).attr('DATA_IDX') == DATA_IDX ) {
					if( $('.curr-part').length > key ) {
						$('[name=vodUrl]').eq(key+1).trigger('click');
						$('#vodPartNm').text( $('[name=vod-part'+$('[name=vodUrl]').eq(key+1).attr('DATA_PART_IDX')+']').eq(0).find('h4').html() );
						$('.prdt_tab_lists').text( $('[name=vodUrl]').eq(key+1).text() );
						$('.player-number').text( $('[name=vodUrl]').eq(key+1).text().slice(0,1) );
					} 
				}
			});
			
		}
	}
	
// 	fileArrArr
// 	fileExistsArrArr
// 	fileCountArr
	
}

$(document).on('click', '[name=vodUrl]', function(){
	
	$('[name=vodUrl]').css('color','');
	$(this).css('color','white');
	
});

function fn_BtnFileDown(){
	
	var dataIdx = '';
	var isDown = false;
	$('.btn-data-hidden').each(function(key,val){
		if( $(this).attr('DATA_IDX') == $('.lecture-next').attr('DATA_IDX') ){
			$(this).trigger('click');
			dataIdx = $(this).attr('DATA_IDX');
			// 실제 파일을 다운로드 받았을때만 로그가 쌓일수 있도록
			if( $(this).attr('onclick').indexOf('unit_fileDown') > -1 ){
				isDown = true;
			}else{
				isDown = false;
			}
		}
	});

	if (dataIdx == '') {
		return alert( '해당강의에는 자료가 없습니다.' );
	}else{
		if ( isDown ) {
			// 파일 다운 받을시 다운기록 데이터 저장
			var params = new Object();
			params.status = "WRITE";
			params.query = "insertFrontVodDownloadData";
			params.frontLoginIdx = localStorage.getItem('frontLoginIdx');
			params.DATA_IDX = dataIdx;
			
			var ajaxDetail = ${unit.ajax( ajaxUrl, "ajax", "params")};
		}
	}
	
// 	console.log( ajaxDetail );
}
			
</script>












