<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" />
<style>


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
    top: -14px;
    left: 50%;
    width: 20px;
    height: 19px;
    background: url(/resources/assets/images/icon/icon_talk_tail.png) center center / cover no-repeat;
    transform: translateX(-50%) ;
} 

@media(max-width : 1310px){
	.mnc_btn_box::before {
		left: 20%;
	}
}
@media screen and (max-width: 960px){
	.lnb_item:first-child {
	    padding-left: 0px;
	}
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
                    <li class="lnb_item is-active" style="    display: inline-flex;"><a href="/front/mypeoplemade/network" style="    margin-right: 0;">내인맥</a><a href="/front/mypeoplemade/network_list" style="    padding-top: 2px;"><span class="text-point text-point-small"><span>0</span>명</span></a></li>
                    <li class="lnb_item"><a class="lnbExtraClass" href="/front/mypeoplemade/coaching?1">VOD<span class="text-point text-point-small"><span>0</span>개</span></a></li>
                    <li class="lnb_item"><span class="hm_mail_alarm hm_mail_alarm_mypeople"></span><a href="/front/mypeoplemade/coaching?2">1:1코칭<span class="text-point text-point-small"><span>0</span>개</span></a></li>
                    <li class="lnb_item"><a class="lnbExtraClass" href="/front/mypeoplemade/coaching?3">LIVE CLASS<span class="text-point text-point-small"><span>0</span>개</span></a></li>
                    <li class="lnb_item "><a href="/front/mypeoplemade/follow">팔로잉<span class="text-point text-point-small"><span>0</span>개</span></a></li>
                    <li class="lnb_item"><a href="/front/mypeoplemade/myinfo">내 정보관리<!-- <span class="text-point text-point-small"></span> --></a></li>
                </ul>
            </div>
     
			<div class="board_search_box board_search_box_f">
			    <input type="text" name="searchVal" class="board_search_input" placeholder="검색어를 입력 하세요" onkeypress="if(event.keyCode==13){fn_DataList();}">
			    <input type="button" class="board_search_submit board_search_submit_f" onclick="fn_DataList();">
				<!-- <button type="button" class="board_search_btn" onclick="fn_DataList();">검색</button> 210520 수정 -->
    
            </div>
        <div class="main_find main_section main_section_f phone_main_section_f">
            <div class="section_inner" style=" padding:0px;">

    
                <div class="mf_item_box mf_item_box_f">
                    <div class="mf_item_list" id="my_consult_box">
                    </div>
                </div>
            </div>
        </div>
        </div>

        
        
        
    </div><!-- // #container -->

<script>

if( localStorage.getItem('frontLoginIdx') == null ) location.href = '/front';

$('.list-sort > li > a').click(function(){
	$('.list-sort > li').removeClass('active'); 
	$(this).parent('li').addClass('active');
	if( $(this).text() == '최신순') fn_DataList( "", "", "" );
	else fn_DataList( "", "", "POP" );
});
$(document).ready(function(){
//     $(".vod-nav").slick({
//         slidesToScroll: 2,
//         variableWidth: true,
//         autoplay: false,
//         infinite: false,
//         dots: false,
//         arrows: false
//     });
//     $('.vod-nav').slick('slickGoTo', 4);
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
	
	fn_DataList( "","","" );
	
	$('.lnb_item').click(function(){
		$('.lnb_item').removeClass("active");
		$(this).addClass("active");
	});
	
	$( '#now_loading' ).hide();
	
});

function fn_DataList( TYPE, PRDT_DONE, ORDER ) {

	var params = new Object();
	params.status = "LIST";
	params.query = "selectFrontMypeoplemadeNetList";
	params.prdtDone = PRDT_DONE;
	params.FRONT_LOGIN_IDX = localStorage.getItem("frontLoginIdx");
	params.searchVal = $('[name=searchVal]').val();
// 	params.ORDER = ORDER;
	
	var result = fn_DataAjax2( params );	
	result = result.out.detail.data;

	$('#my_consult_box').empty();

	var html = "";
	 
	if ( result.length ) {
		$.each( result, function( k, v ){
			imgIdValue = 'CATE_MASTEROPEN_UUID_FILE';
			setUuid(v.CATE_MASTEROPEN_UUID); 
			unit_fileGet( 'CATE_MASTEROPEN_UUID_FILE' , "fn_fileUpload");
            
	        html += '<div class="mf_item" >';
	        html += '	<div class="mf_item_inner" >';
	        html += '		<a style="cursor:auto;">'; 
	        html += '			<div class="mf_thumb" onclick="location.href=\''+v.MOVE_URL.replace('prdt','master')+'\'" style="cursor:pointer;background-image: url('+$('#imgTag').val()+'); background-size: cover;" >';
	        html += '			</div>';
	        html += '			<div class="mf_info" onclick="location.href=\''+v.MOVE_URL.replace('prdt','master')+'\'" style="cursor:pointer;">';
// 	        html += '			<div class="mf_info" >';
	        html += '				<span class="mf_cate">'+v.P_CODE_NM+'·'+v.USER_NM+'</span>';
	        html += '				<span class="mf_title mf_title_f">';
	        html += '					'+v.INFO_MAST_TITL1+'';
	        html += '					<br>';
	        html += '					 '+v.INFO_MAST_TITL2+'';
	        html += '				</span>';
	        html += '				<div class="mf_tag_box">';
	        
	        if( v.PRDT_TYPE != null ) {
//					$.each(masterTimeCntResult, function(key1,val1){

					var coachingChk = 0;
					var removeDiv = 0;
					
//						var masterCateIdx = val1.CATE_IDX;
//						var masterTimeCnt = val1.TIME_CNT.split(',');
//						var masterPrdtCd = val1.PRDT_CD.split(',');
//						var masterPrdtInfoCd = val1.PRDT_INFO_CD;
					
					var masterCateIdx = v.CATE_IDX;
					var masterTimeCnt = v.TIME_CNT.split(',');
					var masterPrdtCd = v.TIME_PRDT.split(',');
					var masterPrdtInfoCd = v.PRDT_VL_CHK;
					
//						if( val.CATE_IDX == masterCateIdx ) {
						
						$.each(masterPrdtCd, function(key2,val2){
							
							if( val2 == 'VL' ) {
								if( masterPrdtInfoCd != null && masterPrdtInfoCd.indexOf('VL') > -1 ){
									html += '<button  type="button" class="mf_btn" onclick="location.href=\''+makeUrl(masterCateIdx,val2 )+'\'">VOD</button>';
									removeDiv = 1;
								}
							} else if( val2 == 'EN' ) {
								if( coachingChk == 0 ) {
									html += '<button  type="button" class="mf_btn active" onclick="location.href=\''+makeUrl(masterCateIdx,val2 )+'\'">1:1 코칭</button>';
									removeDiv = 1;
									coachingChk = 1;
								}
							} else if( ( val2 == 'CN' ) || ( val2 == 'FN' ) ){
								if( masterTimeCnt[key2] != '0' ) {
									if( coachingChk == 0 ) {
										if( val2.indexOf('CN') > -1 ) {
											html += '<button type="button" class="mf_btn active" onclick="location.href=\''+makeUrl(masterCateIdx,val2 )+'\'">1:1 코칭</button>';
											removeDiv = 1;
										}
										else if( val2.indexOf('FN') > -1 ) {
											html += '<button type="button" class="mf_btn active" onclick="location.href=\''+makeUrl(masterCateIdx,val2 )+'\'">1:1 코칭</button>';
											removeDiv = 1;
										}
										coachingChk = 1;
									}
								}
							} else if( val2 == 'LN' ) {
								if( masterTimeCnt[key2] != '0' ) {
									html += '<button type="button" class="mf_btn" onclick="location.href=\''+makeUrl(masterCateIdx,val2 )+'\'">LIVE CLASS</button>';
									removeDiv = 1;
								}
							}
						});
						
						html += '</div>';
						html += '</div>';
						html += '</div>';
						html += '</div>';

						if( removeDiv == 1 ) {
//								console.log( 22222 );
//								console.log( removeDiv );
//								console.log( masterTimeCnt );
//								console.log( val.CATE_IDX + ' : ' + masterCateIdx);
// 							$('.ready').append( html );
// 							over8cnt++;
						}
						
// 						html = '';
//						}
//					});
			}
	        
	        html += '				</div>';
	        html += '			</div>';
	        html += '		</a>';
	        html += '	</div>';
	        html += '</div>';
	        
		});
	}else{
		html += ' <div style="display: table; height: 200px; margin:auto; cursor:pointer;"> <h2 class="phone_nodataDiv tablet_nodataDiv" style="text-align:center;vertical-align: middle;display: table-cell;cursor:pointer;" onclick="location.href=\'/front/main/index\';">현재 팔로우하고 계신 마스터님이 안 계시네요. <br>내게 맞는 전문가를 찾아보실까요?</h2> </div> ';
	}
	
	$('#my_consult_box').append( html );

	$('.follow_btn').click(function(){
		if( ! $(this).hasClass("active") ) $(this).addClass("active");
		else $(this).removeClass("active");
		
		var params = new Object();
		params.idx = $(this).attr('FOLL_IDX');
		
		if ( $(this).hasClass('active') ) params.useYn = 'Y';
		else params.useYn = 'N';
		
		params.status = "EDIT";
		params.query = 'updateFrontFollData';
		params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
		
		fn_DataAjax( params );
		
	});
	
}

function makeUrl( cateIdx, prdt ){
	var params = new Object();
	params.status = "LIST";
	params.query = "selectPrdtDetailLink";
	params.cateIdx = cateIdx;
	params.prdtCd = prdt;
	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var jsonData = result.out.detail.data;
	
	if (jsonData.length > 0) {
		return jsonData[0].MAIN_PRDT_BTN_URL.replace('/front/master/detail', '/front/prdt/detail');
	}
	else return '#';
	
}

$(document).ready(function(){
	lnbEvent();
});

</script>
