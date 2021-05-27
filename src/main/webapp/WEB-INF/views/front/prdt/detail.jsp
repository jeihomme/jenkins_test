<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<style>
.select.select_white {
    background: none;
}

  .reviewHide{display: none;}
  .prdt_tab li:nth-child(2){display:block;}
  /* 신고팝업시작 */


.review_content {
    width: calc(100% - 30px);
    max-width: 520px;
    padding: 40px;
    color: #fff;
    text-align: center;
}


.popup_content {
    position: absolute;
    top: 50%;
    left: 50%;
/*     background-color: #000; */
/*     border: 1px solid #fff; */
    transform: translate(-50%, -50%);
}
.rpc_review textarea {
    width: 100%;
    height: 56px;
    color: #fff !important;
    background-color: transparent;
    font-size: 17px;
    font-weight: 300;
    resize: none;
}

.rpc_file_text {
    display: block;
    margin: 5px 0 35px;
    text-align: left;
    font-size: 15px;
    font-weight: 300;
}

.rpc_star {
    display: block;
    width: 120px;
    height: 22px;
    margin: 0 auto 30px;
    background-size: cover;
    background-position: center center;
    background-repeat: no-repeat;
}

.rpc_text {
  color:#909090;
    margin-bottom: 25px;
    font-size: 17px;
    font-weight: 300;
}

.rpc_review {
    border: 1px solid #141414;
    border-radius: 0px;
}


.rpc_submit {
  display: block;
    width: 100px;
    height: 40px;
    margin: 0 auto;
    color: #000;
    /* border: 2px solid #ff8939; */
    background-color: #fff;
    font-size: 15px;
    font-weight: 500;
    border-radius: 5px;
  margin-top: 10px;
}

.rpc_star.star1, .mci_link.star1::after {
    background-image: url(../images/sub/star_img_1.png);
}

.rpc_title {
    margin-bottom: 25px;
    font-size: 20px;
    font-weight: 500;
}

/* 신고팝업 끝 */
@media screen and (max-width: 1250px) {
	.rpc_submit {
	  width: 90px;
	}
	  .rpc_title{
	  font-size:17px;
	}
	.rpc_text{
	  font-size:14px;
	}
	.review-star_mci{
	  margin-top: -7px;
	}
	.mci_link {
	  max-width: 114px;
	  line-height: 25px;
	  margin: 10px auto;
	  font-size: 12px;
	}
}

.prdt_recommend_img-area {min-height: 143px;}
 
.like_btn.active {background: url(/resources/assets/images/icon/icon_heart_active.png) center center / cover no-repeat;}

.prdt_like_btn.like_btn_master{position:static; float:left; width:50px; height:50px; line-height:50px; margin-right:8px; border:0; border-radius:.25em; text-indent:-9999em; overflow:hidden;background:#141414 url('/resources/assets/images/icon/icon_heart.png') no-repeat center; background-size:23px 20px; outline:none;} 
.prdt_like_btn.like_btn_master.active{background:#141414 url('/resources/assets/images/icon/icon_heart_active.png') no-repeat center; background-size:23px 20px;}

@media screen and (max-width:1200px){
    .prdt_like_btn.like_btn_master{width:40px;height:40px;}
}
@media screen and (max-width:960px){
    .m_prdt_fold_contents{max-height: 400px;    overflow-y: scroll;}
}


p, div{
    font-family: 'Montserrat', 'Noto Sans KR', 'Malgun Gothic', Dotum, "돋움",Gulim, "굴림", Verdana, Tahoma, AppleGothic, sans-serif;
}

/* 추천상품 pc에서 가운데 정렬 안되게 */
.slick-track{ margin-left: inherit; }
/* .prdt_title:first-of-type{ margin-top: 1em; }; .prdt_title{ font-size: 1rem; }; 210520 수정 */
.prdt_title:first-of-type{ margin-top: 0.15em; }
.prdt_title{ font-size: 1.2rem; font-weight: 800; }

.prdt_price .amount { position: absolute; bottom: 0; }

button.timeDealDay{
    position: relative;
    top: 10px;
    right: 95px;
	height: 20px;
    border-radius: 40px;
    width: 70px;
    background-color: #aa00ff;
    color: white;
    }
button.timeDealTime{
    position: relative;
	top: 10px;
    right: 90px;
    width: 140px;
    background-color: black;
    color: white;
}
    
</style>
    <div id="container" class="phones_container" style="overflow-x:hidden;">
        <section class="section_prdt section_prdt_main">
            <div class="section_inner">
                <div class="prdt_layout">
                    <div class="prdt_contents">
                        <figure class="prdt_figure">
                            <img class="prdt_img" src="" alt="">
                        </figure>
                        <div class="prdt_title_area phones_prdt_title_area">
                        </div>
                    </div>
                    
                    <div class="prdt_info_area ">
                        <div class="prdt_info_layout">
                            <div class="prdt_info">
                                <div class="prdt_info_top">
                                </div>
                            
<!--                                 <div class="prdt_info_sta"> -->
<!--                                     <div class="prdt_info_sta_inner"> -->
<!--                                         <button type="button" class="prdt_like_btn like_btn_master toggle_btn">좋아요</button> -->
<!--                                         <button type="button" class="prdt_basket_btn">장바구니</button> -->
<!--                                         <button type="button" class="prdt_apply_btn">신청하기</button> -->
<!--                                         <button type="button" class="prdt_apply_btn" data-popup="applyStep3TextPopV1">신청하기</button> -->
<!--                                     </div> -->
<!--                                 </div> -->
                            </div>
                            <div class="prdt_list">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="prdt_tab_area">
            <div class="section_inner">
                <div class="prdt_layout " >
                    <div class="prdt_contents">
                        <ul class="prdt_tab_lists" style="overflow-x: auto; -ms-overflow-style: none; scrollbar-width: none;">
                            <li class="prdt_tab"><a href="javascript:;" data-idx="0">상세정보</a></li> 
                            <li class="prdt_tab"><a href="javascript:;" data-idx="1">커리큘럼</a></li> 
                            <li class="prdt_tab"><a href="javascript:;" data-idx="2">리뷰</a></li> 
                            <li class="prdt_tab"><a href="javascript:;" data-idx="3">추천상품</a></li> 
                            <li class="prdt_tab"><a href="javascript:;" data-idx="4">FAQ</a></li> 
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        
        <section class="section_prdt" data-idx="0">
            <div class="section_inner">
                <div class="prdt_layout">
                    <div class="prdt_contents">
                        <h3 class="prdt_section_title" style="    margin-bottom: 0;">상세정보</h3>
                        <div class="prdt_detail prdt_detail_up_curr" style="white-space: pre-line;">
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="section_prdt" data-idx="1" name="currSection">
            <div class="section_inner">
                <div class="prdt_layout">
                    <div class="prdt_contents">
                        <h3 class="prdt_section_title">커리큘럼</h3>
                        <div class="prdt_curriculum">
                        </div>
                        <div class="prdt_detail_in_curr" style="white-space: pre-line;">
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="section_prdt" data-idx="2">
            <div class="section_inner">
                <div class="prdt_layout">
                    <div class="prdt_contents">
                        <h3 class="prdt_section_title" >전체리뷰<span style="font-size:14px;">(0)</span></h3>
                        
                               <div class="review-list-title">
<!--                 <h3 class="prdt_section_title">전체리뷰</h3> -->
<!--                               <h3>전체리뷰(<span>33</span>)</h3> -->
                <ul class="list-sort list-sort_add">
                    <li class="active revisort" onclick="fn_ReviList('')"><a style="cursor: pointer;">최신순</a></li>
                    <li class="revisort" onclick="fn_ReviList('star')"><a style="cursor: pointer;">별점순</a></li>
                    <li class="revisort" onclick="fn_ReviList('popular')"><a style="cursor: pointer;">인기순</a></li>
                </ul>
            </div>     
                        
                        
                        
                        <div class="rpdt_review">
                            <ul>
                            </ul>
                            <button type="button" class="rpdt_review_btn_more">리뷰더보기</button>
                        </div>
                        
                    </div>
                </div>
            </div>
        </section>

        <section class="section_prdt" data-idx="3">
            <div class="section_inner">
                <div class="prdt_layout">
                    <div class="prdt_contents">
                        <h3 class="prdt_section_title">추천상품</h3>
                        
                        <div class="prdt_recommend_list">
                            <ul >
                                  추천상품이 없습니다.
                            </ul>                                 
                        </div>
                        
                    </div>
                </div>
            </div>
        </section>

        <section id="faq" class="section_prdt section_prdt_last" data-idx="4" style="display: none;">
            <div class="section_inner">
                <div class="prdt_layout">
                    <div class="prdt_contents">
                        <h3 class="prdt_section_title">FAQ</h3>
                        <div class="prdt_faq">
                            <ul>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div><!-- // #container -->
    
                    <div id="reviewPop" class="popup_wrap">
			            <div class="popup_layer"></div>
			            <div class="popup_box">
			                <div class="popup_content review_content phone_review_content tablet_review_content">
			                    <button type="button" class="pop_close"></button>
			                    
			                    <form action="">
			                    <div>
			                        <h2 class="rpc_title">신고사유</h2>
			               
			                        <p class="rpc_text">
			                          불만족스러우셨나요?
			                            <br>
			                            마스터님께 신고사유를 남겨 주세요.
			                        </p>
			
			                        <div class="rpc_review">
			                            <textarea name=REPO_CNTN id=""></textarea>
			                        </div>
<!-- 			                        <div class="rpc_file"> -->
<!-- 			                            <input type="file" id="rpcFile" class="file_input"> -->
<!-- 			                            <label for="rpcFile" class="file_input_label">파일 선택</label> -->
<!-- 			                            <span class="rpc_file_text pps_per">*5MB이하의 이미지 파일을 첨부하실 수 있습니다.</span> -->
<!-- 			                        </div> -->
			
			                        <button type="button" class="rpc_submit">확인</button>
			                    </div>
			                    </form>
			                </div>
			            </div>
			        </div><!-- //#reviewPop -->
    
<!-- youtube script start -->
<script src="/resources/assets/js/youtubePlayer.js"></script>
<!-- youtube script end -->
<script>

var clickButtonClass = '.btn_video_play';
var idAry = [], urlAry = [], objAry = [];
//var videoTarget = 'videos';
//var videoId = '0qOVgBa4WMU';

var productData = [];
$(function(){
	
	
// 	console.log( prdtCd );
	
// 	$('.header_gnb li a').removeClass('active');
	
// 	if ( prdtCd.indexOf( 'LN' ) > -1 ) {
// 		$('.header_gnb li:eq(2) a').addClass('active');
// 	}else if (  prdtCd.indexOf( 'VL' ) > -1  ) {
// 		$('.header_gnb li:eq(0) a').addClass('active');
// 	} else {
// 		$('.header_gnb li:eq(1) a').addClass('active');
// 	}
	
	

	fn_InsertUserPrdtLog();
	fn_MasterMainInfo();
	fn_MasterOtherPrdt();
	fn_MasterSubInfo();
	fn_ReviList( '' );
	fn_LectList();
	fn_RecoList();
	fn_InsertUserPrdtLog();
	
	
	if ( localStorage.getItem('nowType') != null && localStorage.getItem('nowType') != undefined && localStorage.getItem('nowType') != '' ) {
		
		$('.m_prdt_list_item').each( function( k,v ){
			if ( this.id.replace('prdt','') == localStorage.getItem('nowType') ) {
				$(this).trigger('click');
			}
		});
		
		localStorage.removeItem('nowType');
		
	}
	
	
	setTimeout( function(){ 
		prdtTabEvent();
		$( '#now_loading' ).hide();
	}, 2000 );
// 	$( '#now_loading' ).hide();
// 	prdtSelectEvent();
//     prdtFoldEvent();
});


//신고용----------------------------------------------------------------------------------------
$(document).on('click','.btn_eclaration',function(){
	if (typeof localStorage.getItem('frontLoginIdx') == 'undefined' || localStorage.getItem('frontLoginIdx') == '' || localStorage.getItem('frontLoginIdx') == null) return alert('신고기능은 회원만 가능합니다.');
	
	var params = new Object();
	params.status = 'DETAIL';
	params.query = "selectFrontUserHaveReport";
	params.USER_IDX = localStorage.getItem('frontLoginIdx');
	params.REVI_IDX = this.id.replace('REVI', '');
	
	var detailResult = fn_DataAjax2( params );
	if ( detailResult.out.detail.data[0].CNT > 0 ) {
		return alert('이미 신고한 리뷰입니다.');			
	}
	
	REVI_TEMP = this.id.replace('REVI', '');
	$('#reviewPop').show();
});

var REVI_TEMP = '';
$('.rpc_submit').on('click', function(){
	  var params = new Object();
	  params.status = 'WRITE';
	  params.REVI_IDX = REVI_TEMP;
	  params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
	  params.REPO_CNTN = $('[name=REPO_CNTN]').val();
	  params.query = 'insertFrontReviewRepot';
	  
	  if (params.REPO_CNTN.length == 0) {
			return alert('신고사유를 입력해 주세요');
	  }
	  
	  var insertReviewResult = fn_DataAjax2( params );
	  alert('신고되었습니다.');
	  $('.review_content > .pop_close').trigger('click');
});
$('.review_content > .pop_close').on('click', function(){
	  REVI_TEMP= '';
	  $('[name=REPO_CNTN]').val('');
});
//----------------------------------------------------------------------------------------
function fn_MasterMainInfo(){ 
  	var params = new Object();
  	params.status = "LIST";
  	params.query = "selectFrontPrdtDetail";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.cateIdx = cateIdx;
	if( prdtCd.indexOf('LN') + prdtCd.indexOf('VL') == -2 ) params.prdtCd = 'COACHING'+cateIdx;
	else params.prdtCd = prdtCd;
      	
   	var jsonDetail = fn_DataAjax2( params );
   	jsonDetail = jsonDetail.out.detail.data;
   	var inTag = '';
	
   	var params = new Object();
   	params.status = "LIST";
   	params.query = "selectFrontPrdtDataList";
   	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.cateIdx = cateIdx;
	if( prdtCd.indexOf('LN') + prdtCd.indexOf('VL') == -2 ) params.prdtCd = 'COACHING'+cateIdx;
	else params.prdtCd = prdtCd;
// 	console.log( prdtCd );
	
	if ( prdtCd.indexOf('VL') > -1 ) {	params.prdtType = 'VOD'; }
	else if( prdtCd.indexOf('LN') > -1 ){ 	params.prdtType = 'LIVE'; }
	else{ params.prdtType = prdtCd; }
	
	if ( prdtCd.indexOf('VL') > -1 ) {	$('[name="header_gnb_list"]').eq(0).addClass('active'); }
	else if( prdtCd.indexOf('LN') > -1 ){ $('[name="header_gnb_list"]').eq(2).addClass('active'); }
	else{ $('[name="header_gnb_list"]').eq(1).addClass('active'); }
	
	var prdtList = fn_DataAjax2( params );
	prdtList = prdtList.out.detail.data;

   	if( jsonDetail.length > 0 ) {
   		$.each(jsonDetail,function(key,val){
			if ( key == 0 ) {
				
	   			imgIdValue = 'INFO_PRDT_UUID';
				setUuid( val.INFO_PRDT_UUID );
				unit_fileGet( imgIdValue + '_FILE' , "fn_fileUpload");
		    	$('.prdt_figure > .prdt_img').attr('src', $('#imgTag').val());

/* 	 			inTag += '	<span style="    text-shadow: 4px 2px 2px grey;">'+val.P_CODE_NM+' · '+val.USER_NM+'</span>';
	 			inTag += '	<h3 style="    text-shadow: 4px 2px 2px grey;">'+val.INFO_PRDT_TITL1+'<br>'+val.INFO_PRDT_TITL2+'</h3>';
	 			inTag += '	<p style="    text-shadow: 4px 2px 2px grey;">'+val.INFO_PRDT_SUBT+'</p>'; */
	 			inTag += '	<span>'+val.P_CODE_NM+' · '+val.USER_NM+'</span>';
	 			inTag += '	<h3>'+val.INFO_PRDT_TITL1+'<br>'+val.INFO_PRDT_TITL2+'</h3>';
	 			inTag += '	<p>'+val.INFO_PRDT_SUBT+'</p>';
	
				$('.prdt_title_area').append( inTag );
			}
			inTag = '';
			
			if ( val.PRDT_CD.indexOf('COACHING') > -1 ) {
					var prdt_select_area_element = [];
					var inTag2 = '';
					var select_prdtList_Html = '';
					var percent = 0;
		        	var PRDT_PRIC_REAL = 0;
		        	var percentTemp = 0;
		        	var PRDT_PRIC_REAL_temp = 0;
		        	var psaeCnt = 0;
		        	var firstFlag = true; // 처음 금액과 할인율 초기화를 위한 플래그
		        	// 1:1 코칭이 아무것도 없을때를 구분하기 위한 플래그
		        	var noPersonalCoach = 0;
		        	$.each( prdtList, function( k, v ){
		        		if( v.TIME_CNT > 0 || v.PRDT_CD2.indexOf('EN') > -1 ) {
		        			
		        			noPersonalCoach++;
		        		
							if (firstFlag) {
								firstFlag = false;
				        		percentTemp = 100-Math.round( (v.PRDT_PRIC_REAL/v.PRDT_PRIC * 100) );
				        		PRDT_PRIC_REAL_temp = v.PRDT_PRIC_REAL;
							}
				        	
				        	// 제일 높은 할인율
				        	if ( percentTemp < 100-Math.round( (v.PRDT_PRIC_REAL/v.PRDT_PRIC * 100) ) ) {
				        		percentTemp = 100-Math.round( (v.PRDT_PRIC_REAL/v.PRDT_PRIC * 100) ) ;
							}else{
				        		percent = percentTemp ;
							}
				        	
				        	// 제일 낮은 금액
				        	if ( 1*PRDT_PRIC_REAL_temp < 1*v.PRDT_PRIC_REAL ) {
				        		PRDT_PRIC_REAL = PRDT_PRIC_REAL_temp;
				        	}else{
				        		PRDT_PRIC_REAL = v.PRDT_PRIC_REAL;
				        		PRDT_PRIC_REAL_temp =  v.PRDT_PRIC_REAL;
							}
				        	
				        	// prdt_select_area_element 생성
				        	prdt_select_area_element.push( {
				        		  product: v.PRDT_TYPE + ' ' + substitu( v.PRDT_TIME, v.PRDT_TYPE, v.PRDT_CD2  ),
				                  price: numberWithCommas( v.PRDT_PRIC ) ,
				                  price2: numberWithCommas( v.PRDT_PRIC_REAL )
				        	});
				        	
				        	select_prdtList_Html += '	             <li id="prdt'+v.PRDT_CD2+'" class="m_prdt_list_item" data-val="'+psaeCnt+'" data-jjim="'+v.BASK_IDX2+'" data-prdtCd="'+v.PRDT_CD2+'">';
				        	select_prdtList_Html += '	                 <strong class="m_prdt_list_title">'+prdt_select_area_element[psaeCnt].product+'</strong>';
				        	select_prdtList_Html += '	                 <div class="m_prdt_list_price_area">';
				        	select_prdtList_Html += '	                     <span>'+prdt_select_area_element[psaeCnt].price+'</span>';
				            select_prdtList_Html += '       					 <strong>'+prdt_select_area_element[psaeCnt].price2+'</strong>';
				        	select_prdtList_Html += '	                 </div>';
				        	select_prdtList_Html += '	             </li>';
				        	psaeCnt++;
		        		}
					});
					inTag += '<div class="prdt_info_title"><span class="tag">1:1코칭</span> <span class="name"><a href="'+val.MOVE_URL.replace('/front/prdt/detail','/front/master/detail')+'">'+val.P_CODE_NM+' · '+val.USER_NM+'</a></span></div>';
					inTag += '<p class="prdt_title">'+val.INFO_PRDT_TITL1+'</p>';
					inTag += '<p class="prdt_title">'+val.INFO_PRDT_TITL2+'</p>';
					$('.prdt_info_top').append( inTag );
					
					inTag2 += '<div class="prdt_info_02">';
	                inTag2 += '    <div class="prdt_price">';
					inTag2 += '         <div class="prdt_price_inn" style="margin:30px 0 10px;">';
					inTag2 += '             <span class="sale">'+percent+'%</span>';
					inTag2 += '             <strong class="pay"><span>'+numberWithCommas( PRDT_PRIC_REAL )+'</span> 원~</strong>';
					inTag2 += '         </div>';
					inTag2 += '     </div>';
					
					inTag2 += '	 <div class="prdt_select_area">';
					inTag2 += '	     <div class="prdt_select select select_white">상품선택</div>';
					inTag2 += '	 </div>';
					
					inTag2 += '	 <div class="prdt_info_sta">';
					inTag2 += '	     <button class="m_prdt_fold">접기</button>';
					inTag2 += '	     <div class="m_prdt_fold_contents">';
					inTag2 += '	         <ul class="m_prdt_list is-hide" id="selectPrdtList">';
					
					inTag2 += select_prdtList_Html;
					
					inTag2 += '	         </ul>';
					inTag2 += '	         <div class="prdt_select_result"></div>';
					inTag2 += '	     </div>';
					
					inTag2 += '	     <div class="prdt_info_sta_inner">';
					inTag2 += '	     <button type="button" class="prdt_like_btn like_btn_master toggle_btn">좋아요</button>';
					inTag2 += '	     <button type="button" class="prdt_basket_btn">장바구니</button>';
// 					if( val.PRDT_CD2.indexOf('LN') > -1 ) inTag2 += '	     <button type="button" class="prdt_apply_btn masterHomeDetail" onclick="if( '+val.PRDT_CNT+' == '+val.PRDT_BUY_CNT+'  ) alert("신청 인원이 모두 마감되었습니다."); else isMypageSetTime=1;">신청하기</button>';
// 					else inTag2 += '	     <button type="button" class="prdt_apply_btn masterHomeDetail" onclick="isMypageSetTime=1;">신청하기</button>';
					inTag2 += '	     <button type="button" class="prdt_apply_btn masterHomeDetail" onclick="isMypageSetTime=1;">신청하기</button>';
					inTag2 += '	     </div>';
					
					inTag2 += '	 </div>';
					inTag2 += '</div>';
					
					
					
					
					///  prdt_select_area 셀렉트박스 만들어주는 부분
			        for (var i = 0; i < prdt_select_area_element.length; i++) {
			        	productData.push( prdt_select_area_element[i] );
					}
					
					$('.prdt_info_top').after( inTag2 );
					
					if ( noPersonalCoach == 0 ){
						
						$('.prdt_info_top').css( {'padding-bottom': '1.25rem', 'margin-bottom': '1.25rem', 'border-bottom': '1px solid #141414', 'font-size':'16px'} );
						$('.prdt_info_top').html( '<div style="text-align:center;">상담가능한 시간이 없습니다.</div>' );
			        	$('.prdt_price').remove();	
			        	$('.prdt_info').css('pointer-events','none');
					}
					
					prdtSelectEvent();
					prdtFoldEvent();
					
			}else{
				inTag += '<div class="prdt_info_title"><span class="tag">'+val.PRDT_TYPE+'</span> <span class="name"><a href="'+val.MOVE_URL.replace('/front/prdt/detail','/front/master/detail')+'">'+val.P_CODE_NM+' · '+val.USER_NM+'</a></span></div>';
				inTag += '<p class="prdt_title">'+val.INFO_PRDT_TITL1+'</p>';
				inTag += '<p class="prdt_title">'+val.INFO_PRDT_TITL2+'</p>';
				if ( val.PRDT_TYPE != 'LIVE CLASS'  ) {
					inTag += '<p class="prdt_date"><i class="icon-play"></i>수강기간 '+val.PRDT_CNT+'일</p>';
				} else {
					if( val.LIVE_ACAD_YN == 'Y' ) inTag += '<p class="prdt_date">'+(val.LIVE_ACAD_CNT+"")+'회, '+val.LIVE_ACAD_DTM+'</p>';
				}
				inTag += '<div class="prdt_price" style="position:relative;">';
				if( val.PRDT_DISC == '0' ) {
					inTag += '	<span class="prdt_price_won"></span>';
					inTag += '	<div class="prdt_price_inn">';
					inTag += '		<span class="sale"></span>';
					inTag += '		<strong class="pay"><span>'+val.PRDT_PRIC_REAL+'</span> 원</strong>';
					inTag += '	</div>';
					
					inTag += '<div class="amount">';
			        inTag +=     '<div class="amount-control">';
					inTag += 		vodNoCnt( val.PRDT_TYPE );
					inTag += 	'</div>';
					inTag += '</div>';
					
					inTag += '</div>';
				} else {
					inTag += '	<span class="prdt_price_won">'+val.PRDT_PRIC+' 원</span>';
					inTag += '	<div class="prdt_price_inn">';
					inTag += '		<span class="sale">'+numberWithCommas(val.PRDT_DISC)+''+val.PRDT_DISC_NM+'</span>';
					inTag += '		<strong class="pay"><span>'+val.PRDT_PRIC_REAL+'</span> 원</strong>';
					inTag += '	</div>';
					
					inTag += '<div class="amount">';
			        inTag +=     '<div class="amount-control">';
					inTag += 		vodNoCnt( val.PRDT_TYPE );
					inTag += 	'</div>';
					inTag += '</div>';
					
					inTag += '</div>';

					if( val.DEAL_DISC_PRIC != null && val.SUBMAIN_OPEN_YN != null ) {
						inTag += '<div class="prdt_price timedealDiv" style="position:relative;">';
						inTag += '	<div class="prdt_price_inn">';
						inTag += '		<button class="btn timeDealDay" style="position: relative;"></button>';
						inTag += '		<button class="btn timeDealTime" style="position: relative;"></button>';
						inTag += '	</div>';
						inTag += '	<div class="prdt_price_inn">';
						inTag += '		<span class="sale">'+numberWithCommas(val.DEAL_DISC_PRIC)+'원</span>';
						inTag += '		<strong class="pay"><span>'+numberWithCommas(val.DEAL_REAL_PRIC)+'</span> 원</strong>';
						inTag += '	</div>';
						inTag += '</div>';
					}
				}
				$('.prdt_info_top').append( inTag );
				
				inTag = '';
				
				inTag += '	     <div class="prdt_info_sta">';
				inTag += '	     	<div class="prdt_info_sta_inner">';
				inTag += '	     	 <button type="button" class="prdt_like_btn like_btn_master toggle_btn">좋아요</button>';
				inTag += '	    	 <button type="button" class="prdt_basket_btn">장바구니</button>';
				inTag += '	    	 <button type="button" class="prdt_apply_btn masterHomeDetail">신청하기</button>';
				inTag += '	 		</div>';
				inTag += '	 	</div>';
				
				$('.prdt_info_top').after( inTag );
			}
			$('.timedealDiv').hide();
			counter( val.MAIN_OPEN_DTM, $('.timeDealDay').eq(key), $('.timeDealTime').eq(key) );
			inTag = '';
			if( val.BASK_YN > 0 ) $('.like_btn_master').addClass('is-active active');
			
		});
   		
   	}
}

//마스터의 다른 상품
function fn_MasterOtherPrdt(){ 
  	var params = new Object();
  	params.status = "LIST";
  	params.query = "selectFrontPrdtUrlList";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	if( prdtCd.indexOf('LN') + prdtCd.indexOf('VL') == -2 ) params.prdtCd = 'COACHING'+cateIdx;
	else params.prdtCd = prdtCd;
	params.cateIdx = cateIdx;
      	
   	var jsonDetail = fn_DataAjax2( params );
   	jsonDetail = jsonDetail.out.detail.data;
   	var inTag = '';
    
   	if( jsonDetail.length > 0 ) {
		inTag += '<h4>함께하면 더 좋아요!</h4>';
		inTag += '<ul>';
		
   		$.each(jsonDetail,function(key,val){

			if( val.PRDT_CD.indexOf('VL') > -1 ) {
				if( val.PRDT_VL_CHK != null ) {
					inTag += '	<li>';
					inTag += '		<a href="'+val.MOVE_URL+'">';
					inTag += '			<span>지금 '+val.USER_NM+' 마스터</span>';
					inTag += '			<span>VOD 함께 신청하기</span>';
					inTag += '		</a>';
					inTag += '	</li>';
				}
			} else if( val.PRDT_CD.indexOf('LN') > -1 ) {
				if( val.LN_TIME_CNT != 0 ) {
					inTag += '	<li>';
					inTag += '		<a href="'+val.MOVE_URL+'">';
					inTag += '			<span>지금 '+val.USER_NM+' 마스터</span>';
					inTag += '			<span>LIVE CLASS 함께 신청하기</span>';
					inTag += '		</a>';
					inTag += '	</li>';
				}
			} else {
				if( val.FN_TIME_CNT + val.CN_TIME_CNT > 0 || val.TIME_PRDT.indexOf('EN')  > -1 ) {
					inTag += '	<li>';
					inTag += '		<a href="'+val.MOVE_URL+'">';
					inTag += '			<span>지금 '+val.USER_NM+' 마스터</span>';
					inTag += '			<span>1.1코칭권 함께 신청하기</span>';
					inTag += '		</a>';
					inTag += '	</li>';
				}
			}

		});
		inTag += '</ul>';
		
		$('.prdt_list').append( inTag );
		inTag = '';
   	}
   	if( $('.prdt_list ul').html() == '' ) $('.prdt_list').remove();
}

//상품상세 정보
// 

function fn_MasterSubInfo(){ 
  	var params = new Object();
  	params.status = "LIST";
  	params.query = "selectFrontPrdtInfoDetail";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	if( prdtCd.indexOf('LN') + prdtCd.indexOf('VL') == -2 ) params.prdtCd = 'COACHING'+cateIdx;
	else params.prdtCd = prdtCd;
      	
   	var jsonDetail = fn_DataAjax2( params );
   	jsonDetail = jsonDetail.out.detail.data;
   	
	var inTag = '';
	var dataCnt = 0;
   	
// INFO |---------|---------|--------------|-----------------|---------------|--------------|-----------------|----------|----------|------------|--------|---------------------------------------------|--------------|---------------|---------------------------------------------|---------------------------------------------|----------------|----------------|---------------|------------|------------|----------------------|------------|----------------------| 
// INFO |INFO_IDX |CATE_IDX |PRDT_CD       |INFO_TITL        |INFO_TITL_COLR |INFO_TITL_SUB |INFO_CNTN        |INFO_LINK |INFO_ORDE |INFO_PLAYER |INFO_CD |INFO_UUID                                    |INFO_UUID_NUM |INFO_UUID_INFO |INFO_PRDT_UUID                               |INFO_TUMB_UUID                               |INFO_PRDT_TITL1 |INFO_PRDT_TITL2 |INFO_PRDT_SUBT |INFO_USE_YN |SYS_REG_IDX |SYS_REG_DTM           |SYS_MOD_IDX |SYS_MOD_DTM           | 
// INFO |---------|---------|--------------|-----------------|---------------|--------------|-----------------|----------|----------|------------|--------|---------------------------------------------|--------------|---------------|---------------------------------------------|---------------------------------------------|----------------|----------------|---------------|------------|------------|----------------------|------------|----------------------| 
// INFO |96       |23       |202101LNA0003 |상세한 발레로 몸관리 철저하게 |#ff8939        |[null]        |상세한 발레로 몸관리 철저하게 |          |0         |            |PIN01   |2021210133141608e6ae2bc6827b1d567d588d65ec6e |0             |[null]         |202121013336d6c728f1dc7aa095d91affb67fb75597 |202121013330acabb6b34608e19460ff478a376cd59a |한영제목1           |한영제목2           |한영부제           |Y           |1           |2021-02-08 13:44:25.0 |2           |2021-02-10 13:03:37.0 | 
// INFO |---------|---------|--------------|-----------------|---------------|--------------|-----------------|----------|----------|------------|--------|---------------------------------------------|--------------|---------------|---------------------------------------------|---------------------------------------------|----------------|----------------|---------------|------------|------------|----------------------|------------|----------------------| 
    
   	if( jsonDetail.length > 0 ) {
   		var	currChk = 0;
   		
   		$.each(jsonDetail,function(key,val){
			imgIdValue = 'INFO_PRDT_UUID';
			setUuid( val.INFO_PRDT_UUID );
			unit_fileGet( imgIdValue + '_FILE' , "fn_fileUpload");

			// 상세정보가 첫번쨰가 아니면 내용이 있어도 출력해주지 않는다
			if( key == 0 ) if( val.INFO_CD != 'PIN01') dataCnt = 1;
			if ( dataCnt == 0 ) {
				
				if( val.INFO_CD == 'PIN01') {
	    			
					inTag += '<strong style="color:'+val.INFO_TITL_COLR+';margin-top: 0;font-size:20px;">'+val.INFO_TITL+'</strong>';
					inTag += '<p>'+val.INFO_CNTN+'</p>';
					var chkStr = (val.INFO_LINK+'');

	    			setUuid( val.INFO_UUID );
	    			imgIdValue = "INFO_UUID_FILE"+val.INFO_UUID_NUM;
	    			unit_fileGet( imgIdValue, "fn_fileUpload");
	    			
					if( val.INFO_LINK != null || chkStr != 'undefined'  ) {
						var chkStr = (val.INFO_PLAYER+'');
						if( val.INFO_PLAYER != null || chkStr != 'undefined'  ) {
							inTag += '<div class="prdt_video">';
	
			    			videoId = replaceVod(val.INFO_LINK);
			    			videoTarget = 'videos'+key;
				            if ( val.INFO_PLAYER == 'PLAY01' ) {
					            inTag += '                        <div class="prdt_video_temp" style="white-space: initial;">                     ';
					            inTag += '                            <button type="button" class="btn_video_play">재생</button>    ';
					            inTag += '                            <img src="https://img.youtube.com/vi/'+replaceVod(val.INFO_LINK)+'/maxresdefault.jpg" alt="">       ';
					            inTag += '                        </div>                                                            ';
					            inTag += '                        <div id="videos'+key+'" class="yotube" data-url="'+replaceVod(val.INFO_LINK)+'"> </div>                             ';
							} else if ( val.INFO_PLAYER == 'PLAY02'  ) {
								var infoLink = "";
								
								infoLink = val.INFO_LINK.replace('https://tv.naver.com/v/','').split('/')[0];
								
								
								inTag += "<iframe src='https://tv.naver.com/embed/"+infoLink+"?autoPlay=true' frameborder='no' scrolling='no' marginwidth='0' marginheight='0' WIDTH='544' HEIGHT='306' allow='autoplay' allowfullscreen></iframe>";
							} else if ( val.INFO_PLAYER == 'PLAY03'  ) {
								inTag += '<iframe allowfullscreen src="https://player.yozii.com/fiveplayer/fiveplayer-streaming.php?token='+val.PLAYER_URL+'"></iframe>';
							}
				            
	// 						inTag += '	<div class="prdt_video_temp">';
	// 						inTag += '		<button type="button" class="btn_video_play">재생</button>';
	// 						inTag += '		<img src="/resources/assets/images/dummy/dummy34.png" alt="">';
	// 						inTag += '	</div>';
	// 						inTag += '	<div id="videos"></div>';
							
							inTag += '</div>';
							if( val.INFO_UUID != null || val.INFO_UUID != '' ) {
								inTag += '<br><br><img name="INFO_UUID_FILE'+val.INFO_UUID_NUM+'" src="'+$('#imgTag').val()+'" >';							
							}
						}
					}

					$('.prdt_detail').eq(0).append( inTag );
					inTag = '';
	    			
					
				} else if( val.INFO_CD == 'PIN02') {
					currChk = 1;

					inTag += '<h3><strong style="font-size:20px;color:'+val.INFO_TITL_COLR+'">'+val.INFO_TITL+'</strong></h3><br>';
					$('.prdt_curriculum').before( inTag );
					
					inTag = '';
					
				} else if( val.INFO_CD == 'PIN03') {
					
					inTag += '<section class="section_prdt">';
					inTag += '	<div class="section_inner">';
					inTag += '		<div class="prdt_layout">';
					inTag += '			<div class="prdt_contents">';
					inTag += '				<div class="prdt_detail_in_curr" style="white-space: pre-line;">';
					
					inTag += '<h3><strong style="font-size:20px;color:'+val.INFO_TITL_COLR+'">'+val.INFO_TITL+'</strong></h3>';
					inTag += '<h4><p style="font-size:17px;">'+val.INFO_TITL_SUB+'</p></h4><br>';
					inTag += '<p>'+val.INFO_CNTN+'</p>';
					
					inTag += '				</div>';
					inTag += '			</div>';
					inTag += '		</div>';
					inTag += '	</div>';
					inTag += '</section>';

					if( currChk == 0 ) $('[name=currSection').before( inTag );
					else $('[name=currSection').after( inTag );
					
// 					$('.prdt_detail_in_curr').eq(1).append( inTag );
					inTag = '';
					
					
				} else if( val.INFO_CD == 'PIN04') {
					
					inTag += '<section class="section_prdt">';
					inTag += '	<div class="section_inner">';
					inTag += '		<div class="prdt_layout">';
					inTag += '			<div class="prdt_contents">';
					inTag += '				<div class="prdt_detail_in_curr" style="white-space: pre-line;">';
					
					inTag += '<h3><strong style="font-size:20px;color:'+val.INFO_TITL_COLR+'">'+val.INFO_TITL+'</strong></h3>';
					inTag += '<h4><p style="font-size:17px;">'+val.INFO_TITL_SUB+'</p></h4><br>';
					inTag += '<p>'+val.INFO_CNTN+'</p>';
					
					inTag += '				</div>';
					inTag += '			</div>';
					inTag += '		</div>';
					inTag += '	</div>';
					inTag += '</section>';

					if( currChk == 0 ) $('[name=currSection').before( inTag );
					else $('[name=currSection').after( inTag );
					
// 					$('.prdt_detail_in_curr').eq(1).append( inTag );
					inTag = '';
					
				} else if( val.INFO_CD == 'PIN05') {
					
					$('#faq').show();
					
					inTag += '<li class="prdt_faq_item">';
					inTag += '	<strong class="prdt_faq_item_top">';
					inTag += '		<span class="prdt_faq_question">Q</span> ';
					inTag += '		<span class="prdt_faq_title" style="color:'+val.INFO_TITL_COLR+'">'+val.INFO_TITL+'</span>';
					inTag += '	</strong>';
					inTag += '	<div class="prdt_faq_item_bottom">';
					inTag += '		<span class="prdt_faq_answer">A</span>';
					inTag += '		<div class="prdt_faq_contents">';
					inTag += '			'+val.INFO_TITL_SUB+'';
					inTag += '		</div>';
					inTag += '	</div>';
					inTag += '</li>';
	
					$('.prdt_faq > ul').append( inTag );
					inTag = '';
				}
			}
		});
    	
   		if( $('.prdt_video').html()+'' == '' ) $('.prdt_video').remove();
    	// 유튜브 동영상 불러오는거야 API 사용하여 불러오기
    	$('.yotube').each(function( k ){
    		$(this).attr('id', 'player'+ k); // 아이디값 추가
			idAry.push('player'+k); // 아이디 값 배열에 넣기
    		urlAry.push($(this).data('url')); // 동영상 url 배열에 넣기
    	});
    	
   	    prdtFaqEvent();

   		
   		if( prdtCd.indexOf('VL') < 0 ) {
   			$('.prdt_tab_lists > .prdt_tab > a').each( function( key, val ){
   				if( $(this).attr('data-idx') == '1') $(this).remove(),
   				$('.prdt_tab_lists li:nth-child(2)').css('display','none');
   				
   			});
   			
   			$('.section_prdt').each( function( key, val ){
   				if( $(this).attr('data-idx') == '1') $(this).remove();
   			});
   		}
   		
   	}
}



function fn_ReviList( sort ){ 
  	var params = new Object();
  	params.status = "LIST";
  	params.query = "selectFrontPrdtReviList";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.prdtCd = prdtCd;
	params.sort = sort;
	
   	var jsonDetail = fn_DataAjax2( params );
   	jsonDetail = jsonDetail.out.detail.data;
//     console.log( jsonDetail );
   	$('.rpdt_review').siblings('h3.prdt_section_title').find('span').text( '(' + jsonDetail.length + ')' );
   	
   	$('.rpdt_review > ul').empty();
   	
   	var inTag = '';

   	if( jsonDetail.length > 0 ) {
   		
   		
   		$.each(jsonDetail,function(key,val){
			
			inTag += '<li class="rpdt_reivew_card '+ (key > 2? "reviewHide":"") +' " >';
			inTag += '	<div class="rpdt_review_info"> ';
			inTag += '		<br><span class="name">'+val.USER_NICK+'</span><br><span class="date">'+val.SYS_REG_DTM+'</span>';
			
			if( val.REVI_PUBL_YN == 'Y' ) inTag += '<button id="REVI'+val.REVI_IDX+'" type="button" class="btn_eclaration">신고</button> ';
			
			inTag += '		<span class="is-rater">';
			
			 for (var i = 1; i <= 5; i++) {
				if( val.REVI_SCOR*1 >= i ) inTag += '			<span class="icon_star icon_star_active"></span>';
				else inTag += '			<span class="icon_star icon_star_none"></span>';
			}
			
			inTag += '		</span>';
			inTag += '	</div>';
			
			if( val.REVI_PUBL_YN == 'Y' ) inTag += '	<div class="rpdt_review_textarea">'+val.REVI_CNTN+'</div>';
			else inTag += '	<div class="rpdt_review_textarea">비공개처리된 리뷰입니다.</div>';
			
			inTag += '</li>';

			$('.rpdt_review > ul').append( inTag );
			inTag = '';
		});
   	} else {
   		inTag = '<li class="rpdt_reivew_card"><div class="rpdt_review_textarea">리뷰가 없습니다.</div></li>'
	    $('.rpdt_review > ul').append( inTag );
		inTag = '';
   	}
   	
   	$('.rpdt_review_btn_more').on('click', function(){
		localStorage.setItem( 'masterCate', cateIdx);
		localStorage.setItem( 'masterPrdtCd', prdtCd );
   		location.href="/front/prdt/review";
    });
   	
}


function fn_LectList(){ 
  	var params = new Object();
  	params.status = "LIST";
  	params.query = "selectFrontPrdtLectList";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.prdtCd = prdtCd;
      	
   	var jsonDetail = fn_DataAjax2( params );
   	jsonDetail = jsonDetail.out.detail.data;
     	
   	var inTag = '';
    
   	if( jsonDetail.length > 0 ) {
   		
   		for (var i = 1; i <= jsonDetail[jsonDetail.length-1].DATA_PART_IDX; i++) {
			var titleIsc = true;
   			$.each(jsonDetail,function(key,val){
	// 			imgIdValue = 'REVI_UUID';
	// 			setUuid( val.REVI_UUID );
	// 			unit_fileGet( imgIdValue + '_FILE' , "fn_fileUpload");
				
				if ( val.DATA_PART_IDX == i ) {
					
					if (titleIsc) {
						
						inTag += '<div class="prdt_curriculum_cont">';
						inTag += '    <p class="curriculum_main_title">'+val.DATA_PART_NM+'</p>';
						inTag += '    <ul>';
						titleIsc = false;		
					}
					
					inTag += '        <li>';
					inTag += '        <span>'+val.PPVD_DATA_ORDE+'</span><p class="curriculum_title">'+val.DATA_TITL+'</p>';
					
					if( val.DATA_FREE_YN == 'Y' )
						inTag += '        <a class="play_free" href="javascript:;" onclick="window.open(\''+val.MOVE_URL.replace('/front/prdt/detail','/front/mypeoplemade/vod_player')+'\',\'_blank\',\'width=1440px, height=1000px, scrollbars=no, resizable=no, toolbars=no, menubar=no\')"><span class="text_d text_dd">무료공개</span></a>';
// 						inTag += '				<button type="button" class="btn-play" title="강의재생" onclick="window.open(\''+val.MOVE_URL+'\',\'_blank\',\'width=1440px, height=1000px, scrollbars=no, resizable=no, toolbars=no, menubar=no\')"></button>';
					inTag += '        </li>';
				
				}
				
				if ( key == jsonDetail.length-1 ) {
					
					inTag += '    </ul>';
					inTag += '</div>';
				}	
					
				
			});
				$('.prdt_curriculum').append( inTag );
				inTag = '';
		
   		}
   	}
}


function fn_RecoList(){
  	var params = new Object();
  	params.status = "LIST";
  	params.query = "selectFrontPrdtRecoList";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.prdtCd = prdtCd;
	params.cateIdx = cateIdx;
	params.userCateLog = sessionStorage.getItem('userCateLog').slice( 0 ,sessionStorage.getItem('userCateLog').length-1 );
	if( params.userCateLog.indexOf(',') == 0 ) params.userCateLog = params.userCateLog.replace(',','');
	
   	var jsonDetail = fn_DataAjax2( params, "RECOMMAND" );
   	jsonDetail = jsonDetail.out.detail.data;
//    	jsonDetail = '';
   	var inTag = '';
   	
   	if( jsonDetail.length > 0 ) {
   		
   		$('.prdt_recommend_list ul').empty();
		
   		var jsonConvert = jsonDetail;
   		var keyCnt = 0;
   		
   		$.each(jsonDetail,function(key,val){
   			if( key > 0 ) {
   				if( jsonConvert[keyCnt].PRDT_CD != val.PRDT_CD ) {
   					keyCnt++;
   				} else {
   	   				if( jsonConvert[keyCnt].PRDT_PRIC_REAL.replace(/,/gi, "")*1 > val.PRDT_PRIC_REAL.replace(/,/gi, "")*1 )
   	   					jsonConvert[keyCnt].PRDT_PRIC_REAL = val.PRDT_PRIC_REAL;
   	   				if( jsonConvert[keyCnt].PRDT_PRIC.replace(/,/gi, "")*1 > val.PRDT_PRIC.replace(/,/gi, "")*1 )
   	   					jsonConvert[keyCnt].PRDT_PRIC = val.PRDT_PRIC;
   				}
   			}
   		});
   		
   		
   		for( var a = keyCnt+1; a < jsonDetail.length; a++ ) {
   			jsonConvert[a] = null;
   		}
   	 
   		$.each(jsonConvert,function(key,val){
   			if( val != null ) {
  	 			imgIdValue = 'INFO_TUMB_UUID';
  	 			setUuid( val.INFO_TUMB_UUID );
  	 			unit_fileGet( imgIdValue + '_FILE' , "fn_fileUpload");
//   		    	$('#'+val.PRDT_CD+'').attr('src', $('#imgTag').val());
   				
   				inTag += '<li>';
   				inTag += '	<a href="'+val.MOVE_URL+'">';
   				inTag += '		<div class="prdt_recommend_card">';
   				inTag += '			<div class="prdt_recommend_img-area">';
				if ( val.INFO_TUMB_UUID != null ) {
					if ( val.INFO_TUMB_UUID != '' ) {
						if ( val.INFO_TUMB_UUID != undefined ) {
			   				inTag += '				<img id="'+val.PRDT_CD+'" class="prdt_recommend_img" src="'+$('#imgTag').val()+'" alt="">';
						}else inTag += '				<img id="'+val.PRDT_CD+'" class="prdt_recommend_img" src="/resources/assets/images/sub/profile_default_img.png" alt="">';
					}else inTag += '				<img id="'+val.PRDT_CD+'" class="prdt_recommend_img" src="/resources/assets/images/sub/profile_default_img.png" alt="">';
				}else inTag += '				<img id="'+val.PRDT_CD+'" class="prdt_recommend_img" src="/resources/assets/images/sub/profile_default_img.png" alt="">';
				
   				
   				inTag += '			</div>';
   				inTag += '			<div class="prdt_recommend_info">';
   				inTag += '				<span>['+val.PRDT_TYPE+'] '+val.CODE_NM+' · '+val.USER_NM+'</span>';
   				inTag += '				<p>'+val.INFO_PRDT_TITL1+'</p>';
   				inTag += '				<p>'+val.INFO_PRDT_TITL2+'</p>';
   				inTag += '				<div class="prdt_recommend_price_area">';
   				
   				if( val.PRDT_CD.indexOf('COACH') > -1 ) {
   	   				if( val.PRDT_PRIC != val.PRDT_PRIC_REAL )
   	   					inTag += '<span class="price">'+val.PRDT_PRIC+'원~</span>';
   				} else {
   	   				if( val.PRDT_PRIC != val.PRDT_PRIC_REAL )
   	   					inTag += '<span class="price">'+val.PRDT_PRIC+'원</span>';
   				}
   				
			    inTag += '                    <span class="sale" style="color: #f44242;font-size: 14px;font-weight: 600;">'+(100-Math.round( val.PRDT_PRIC_REAL.replace(/,/g,'')*1 / val.PRDT_PRIC.replace(/,/g,'')*1 * 100 ) )+'%</span>'; 
   				
   				if( val.PRDT_CD.indexOf('COACH') > -1 ) inTag += '<strong class="pay"><span>'+val.PRDT_PRIC_REAL.replace('~','')+'</span>원~</strong>';
   				else inTag += '<strong class="pay"><span>'+val.PRDT_PRIC_REAL.replace('~','')+'</span>원 ~</strong>';
   				
   				inTag += '				</div>';
   				inTag += '			</div>';
   				inTag += '		</div>';
   				inTag += '	</a>';
   				if( val.BASK_IDX != 0 ) inTag += '				<button style="z-index:10;" type="button" id="JJIM'+val.BASK_IDX+'" PRDT_CD="recom'+val.PRDT_CD+'" class="like_btn toggle_btn active"></button>';
   				else inTag += '				<button style="z-index:10;" PRDT_CD="recom'+val.PRDT_CD+'" type="button" class="like_btn toggle_btn NOJJIM"></button>';
   				inTag += '</li>';

   				if( val.PRDT_CD.indexOf('VL') > -1 ) {
   					if( val.PRDT_VL_CHK == null ) inTag ='';
   				} else if( val.PRDT_CD.indexOf('LN') > -1 ) {
   					if( val.LN_TIME_CNT == 0 ) inTag ='';
   				} else{
   					if( val.FN_TIME_CNT + val.CN_TIME_CNT == 0 && val.TIME_PRDT.indexOf('EN') < 0 ) inTag ='';
   				}
   				$('.prdt_recommend_list ul').append( inTag );
   				inTag = '';

   			}
		});
   		
   		prdtSliderEvent();
   		
   		$('.like_btn').click(function(){
   			var RETURN = 0;
   			
   		  	if ( localStorage.getItem('frontLoginIdx') == null || localStorage.getItem('frontLoginIdx') == '' || typeof localStorage.getItem('frontLoginIdx') == 'undefined' ) {
   				event.stopPropagation();
   				event.stopImmediatePropagation();
   				$(this).removeClass('active is-active'); 
   				alert('로그인후 사용가능합니다.');
	      		return location.href = '/front/account/login';
   		  	} else {
   		  		
   		  		event.stopPropagation();
				event.stopImmediatePropagation();
   		  		
   		  		var bask_prdt_cd = $(this).attr('PRDT_CD').replace( 'recom', '' );
   		  		
   		  		if( $(this).hasClass('NOJJIM') ) {
   		  			

        			if ( bask_prdt_cd.indexOf('COACHING') > -1 ) {
        				
        				var params = new Object();
	        			params.status = "LIST";
	        			params.query = "selectFrontJjimCoachPrdtCd";
	        			params.CATE_IDX = bask_prdt_cd.replace('COACHING','');
	        			var prdtList =  fn_DataAjax2( params ); 
	        			
	        			if( prdtList.out.detail.data.length > 0 ){
	        				$.each( prdtList.out.detail.data , function( k, v ){
        				
	        					var params = new Object();
	    	   					params.status = "EDIT";
	    	   					params.query = "updateFrontJjimData";
	    	   		    		params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
	    	   					params.BASK_PRDT_CD = v.PRDT_CD;
	    	   					params.CATE_IDX = cateIdx;
	    	   		    		params.BASK_USE_YN = 'Y';
	    	   		    		params.BASK_TYPE = 'K';
	    	   		    		
	    	   					var editResult =  fn_DataAjax2( params ); 
	    	   					if ( editResult.out.resultCnt == 0 ) {
	    	   						params.status = "WRITE";
	    	   						params.query = "insertFrontJjimDataDuple";
	    	   						params.BASK_TYPE = 'K';
	    	   						fn_DataAjax2( params ); 
	    	   					}
	        					
	        				} );
	        				
	        				$(this).removeClass('NOJJIM');
		   					$(this).addClass('active is-active'); 
		      			
			      	  		RETURN = 1;
			      	  	  	fn_RecoLikeBtn( RETURN );
	        			}		
	        			
        			}else{
        				
	   		    		var params = new Object();
	   					params.status = "EDIT";
	   					params.query = "updateFrontJjimData";
	   		    		params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
	   					params.BASK_PRDT_CD = bask_prdt_cd;
	   					params.CATE_IDX = cateIdx;
	   		    		params.BASK_USE_YN = 'Y';
	   		    		params.BASK_TYPE = 'K';
	   		    		
	   					var editResult =  fn_DataAjax2( params ); 
	   					if ( editResult.out.resultCnt == 0 ) {
	   						params.status = "WRITE";
	   						params.query = "insertFrontJjimDataDuple";
	   						params.BASK_TYPE = 'K';
	   						fn_DataAjax2( params ); 
	   					}
	   					
	   					$(this).removeClass('NOJJIM');
	   					$(this).addClass('active is-active'); 
	   					
	   	   		  		RETURN = 1;
	   	   		  	  	fn_RecoLikeBtn( RETURN );

        			}
   				} else {
   					
   					if ( bask_prdt_cd.indexOf('COACHING') > -1 ) {
   						
   						var params = new Object();
	        			params.status = "LIST";
	        			params.query = "selectFrontJjimCoachPrdtCd";
	        			params.CATE_IDX = bask_prdt_cd.replace('COACHING','');
	        			var prdtList =  fn_DataAjax2( params ); 
	        			
	        			if( prdtList.out.detail.data.length > 0 ){
	        				$.each( prdtList.out.detail.data , function( k, v ){
   						
	        					var params = new Object();
	    	   					params.status = "EDIT";
	    	   					params.query = "updateFrontJjimData";
	    	   					params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
	    	   					params.BASK_PRDT_CD = v.PRDT_CD;
	    	   					params.CATE_IDX = cateIdx;
	    	   					params.BASK_USE_YN = 'N';
	    	   					params.BASK_TYPE = 'K';
	    	   					var editResult =  fn_DataAjax2( params ); 
	        					
	        				} );
	        				
	        				$(this).addClass('NOJJIM');
		   					$(this).removeClass('active is-active'); 
				      			
	        			}				
	        					
   					}else{
   						
	   					var params = new Object();
	   					params.status = "EDIT";
	   					params.query = "updateFrontJjimData";
	   					params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
	   					params.BASK_PRDT_CD = bask_prdt_cd;
	   					params.CATE_IDX = cateIdx;
	   					params.BASK_USE_YN = 'N';
	   					params.BASK_TYPE = 'K';
	   					var editResult =  fn_DataAjax2( params ); 
	   					
	   					
	   					$(this).addClass('NOJJIM');
	   					$(this).removeClass('active is-active'); 

   					}
   					
   				}
   		  	}
   		});
   	}
}

function substitu( PRDT_TIME, PRDT_TYPE, PRDT_CD2 ){
	if ( PRDT_TYPE == 'LIVE CLASS' ) return 1*PRDT_TIME+'회';
	else if ( PRDT_TYPE.indexOf('1:1') > -1 ) {
		if( PRDT_CD2.indexOf("EN") > -1 ) return 1*PRDT_TIME+'회';
		else return 1*PRDT_TIME+'분';
	}
	else if ( PRDT_TYPE == 'VOD' ) return 1*PRDT_TIME +'일';
	else return 1*PRDT_TIME;
}


//상품 dummy data
function prdtSelectEvent(){
    var $select = $('.prdt_select');
    var $selectContents = $('.m_prdt_fold_contents');
    var $selectResult = $('.prdt_select_result');
    var optionsLength = $select.find('option').length - 1;
    
    var createSelectCard = function(data,idx, jjim){
        var html = '';
        html+= '<div class="prdt_select_item" data-val='+idx+' data-jjim="'+jjim+'">'+
                '<strong class="prdt_select_title">'+data.product+'</strong>'+
                '<div class="amount">'+
		            '<div class="amount-control">'+ 
						vodNoCnt( data.product ) +
					'</div>'+
				'</div>' +
                '<div class="prdt_select_price_area">'+
                    '<span>'+numberWithCommas(data.price)+' 원</span>'+
                    '<strong>'+data.price2+' 원</strong>'+
                    '<button type="button" class="icon_x">취소</button>'+
                '</div>'+
            '</div>';
	           if (jjim != 0) {
	           		$('.prdt_like_btn').addClass('active is-active');
	           }else{
					$('.prdt_like_btn').removeClass('active is-active');
	   		   }         
        return html;
    };
    
    //mobile 상품선택 이벤트
    $(document).on('click', '.prdt_select', function(){
        if(!$(this).hasClass('is-active')){
            $(this).addClass('is-active');
            $selectContents.removeClass('select-product');
            $mobileProductList.removeClass('is-hide');
        }else{
            $(this).removeClass('is-active');
            $selectContents.addClass('select-product');
            $mobileProductList.addClass('is-hide');
        }
    });

    $(document).on('keypress', '[name=prdt_cnt]', function(){
 	   $(this).val($(this).val());
    });
    
    $(document).on('click', '.prdt_select_item .amount-control > a', function(){
 		var cnt =  $(this).siblings('[name=prdt_cnt]').val();
 		var target = $(this).closest('.amount').siblings('.prdt_select_price_area');
 		var targetprice1 = target.children('span').text().replace('원','');
 		var targetprice2 = target.children('strong').text().replace('원','');
 		targetprice1 = targetprice1.replace(/,/g,'');
 		targetprice2 = targetprice2.replace(/,/g,'');
 		targetprice1 = targetprice1/cnt;
 		targetprice2 = targetprice2/cnt;
 		if ($(this).hasClass('opt-cnt-minus') ){
				if ($(this).hasClass('disabled')) return alert( '더 이상 줄일 수 없습니다.' );
				
				if( (1*cnt - 1) == 1 ) $(this).css({'color':'black'});
				
				$(this).siblings('input[name=prdt_cnt]').attr( 'value', 1*cnt - 1 );
				if (cnt == 2) $(this).addClass('disabled');
 		   
				// 가격도 변경
				target.children('span').text( numberWithCommas(targetprice1 * (cnt -1)) + ' 원' );
				target.children('strong').text( numberWithCommas(targetprice2 * (cnt -1)) + ' 원' );
				
				
 		}else if ($(this).hasClass('opt-cnt-plus')) {
 		   $(this).siblings('input[name=prdt_cnt]').attr( 'value', 1*cnt +1 );
 		   $(this).siblings('.opt-cnt-minus').removeClass('disabled');
		   $(this).siblings('.opt-cnt-minus').css({'color':'#666'});
 		  
 			// 가격도 변경
				target.children('span').text( numberWithCommas(targetprice1 * (1*cnt +1)) + ' 원' );
				target.children('strong').text( numberWithCommas(targetprice2 * (1*cnt +1)) + ' 원' );
 		   
 		}
    });

    var $items = $('.m_prdt_list_item');
    var $mobileProductList = $('.m_prdt_list');
 
    $(document).on('click', '.m_prdt_list_item',function(){
    	// 중복판단변수
 	   var isduple = $(this).data('val');
 	   var istrue = false;
 	   $('.prdt_select_item').each(function( k,v ){
				if ( $(this).data('val') == isduple ) istrue = true;
 	   });
 	   
 	   if ( istrue  ) {
				return alert( '해당 상품은 이미 추가되었습니다.' );
		}else{
	        $select.removeClass('is-active');
// 	        $mobileProductList.addClass('is-hide');
	        $selectContents.addClass('select-product');
	        $selectResult.html( $selectResult.html() + createSelectCard(productData[$(this).data('val')], $(this).data('val'), $(this).data('jjim') ));
	        if(DEVICE_TYPE != 'MOBILE'){
	        	$select.html(productData[$(this).data('val')].product + ' ('+ productData[$(this).data('val')].price2 +')');
	        }
	        
	        goTopInPrdt();
	        if ( prdtCd == '' || prdtCd.indexOf('COACH') > -1 ) {
		        prdtCd = $(this).attr('id').replace('prdt', '');
			}else if ( prdtCd != '' && prdtCd.indexOf( $(this).attr('id').replace('prdt', '') ) == -1){
		        prdtCd += ','+$(this).attr('id').replace('prdt', '');
			}
// 	        prdtCd = $(this).attr('id').replace('prdt', '');
	//         console.log( prdtCd );
		}
    });
		
    // 선택한 상품 취소
    $(document).on('click', '.prdt_select_result', function(e){
        if($(e.target).hasClass('icon_x')){
				// X 버튼을 눌렀을때 상품을 없애면서 prdtCd값도 같이 날려버리기
				
				var delSessionId = $('.m_prdt_list_item').eq( $(e.target).parents('.prdt_select_item').data('val') ).data('prdtcd');
				var delSessionCnt = $(e.target).parents('.prdt_select_item').find('[name=prdt_cnt]').val();
				var basktemp = '';
				$.each( prdtCd.split(','), function( k,v ){
					if ( v == delSessionId ) {
					}else{
						basktemp += v+',';
					}
				});
				prdtCd = basktemp.slice(0,basktemp.length-1);
				
				$selectContents.removeClass('select-product');
				$(e.target).parents('.prdt_select_item').remove();
				$('.like_btn_master').removeClass('active is-active');
				
			if(DEVICE_TYPE == 'MOBILE'){
                $mobileProductList.removeClass('is-hide'); //모바일 product list
            }else{
                $select.html('상품선택') //select박스 옵션초기화
            }
            goTopInPrdt();
        }
    });

    //다른영역 클릭시 select option hide
    $(window).on('click', function(e){
        if(
            (!($(e.target).parents().is('.m_prdt_fold_contents') ||
            $(e.target).parents().is('.prdt_select_area') )) &&
            DEVICE_TYPE != 'MOBILE'
        ){
            $select.removeClass('is-active');
            $mobileProductList.addClass('is-hide');
        }
    });
}

function prdtFoldEvent(){
    var $btnFold = $('.m_prdt_fold');
    var $selectContents = $('.m_prdt_fold_contents')
    var $mobileProductList = $('.m_prdt_list');
    
    $(document).on('click', '.m_prdt_fold' , function(){
        $selectContents.slideToggle( 190, 'linear', function(){
            goTopInPrdt();
        });
        $btnFold.toggleClass('is-fold');
    });
    $btnFold.addClass('is-fold');
    //리사이즈시 prdt_info_sta 영역 setting
    $(window).resize(function(){
        
        if(DEVICE_TYPE != 'MOBILE'){ //(PC,TABLET)
            $selectContents.show();
            (!$selectContents.hasClass('select-product')) 
                ? $mobileProductList.addClass('is-hide') // 상품선택 X
                : $mobileProductList.removeClass('is-hide') // 상품선택 O

        }else{ // MOBILE
            $mobileProductList.removeClass('is-hide');
            (!$selectContents.hasClass('select-product'))  
                ? $mobileProductList.removeClass('is-hide') // 상품선택 X
                : //$mobileProductList.addClass('is-hide'); // 상품선택 O
            
            ($btnFold.hasClass('is-fold')) 
                ? $selectContents.hide()
                : $selectContents.show();
        }
    }).trigger('resize');
}
   

function fn_RecoLikeBtn( RETURN ) {
    // 추천상품의 찜
    clickToggleClassPopupEvent('.like_btn',{
        popupType : 'alert',
        popupMsg: '찜 목록에 추가되었습니다.',
        beforePopup: function(thisBtn){
           	if( RETURN ) return 'ALERT'; 
           	else return 'NOALERT';
        }
    });
}


$(document).on('click' , '.like_btn_master', function(){
	
	if( prdtCd.indexOf('COACH') > -1 ) prdtCd = $('.m_prdt_list_item').attr('id').replace('prdt', '');
	
	var RETURN = 0;
	
  	if( $('.prdt_select_result').html() == '' ) {
		event.stopPropagation();
		event.stopImmediatePropagation();
		alert('상품을 선택해주세요');
		
  	} else if ( localStorage.getItem('frontLoginIdx') == null || localStorage.getItem('frontLoginIdx') == '' || typeof localStorage.getItem('frontLoginIdx') == 'undefined' ) {
		event.stopPropagation();
		event.stopImmediatePropagation();
		$(this).removeClass('active is-active'); 
		alert('로그인후 사용가능합니다.');
  		return location.href = '/front/account/login';
		
	} else if( prdtCd.indexOf('COACH') > -1 ) {
		if ( ! $('.prdt_select_result > div.prdt_select_item').length ) {
			event.stopPropagation();
			event.stopImmediatePropagation();
			$(this).removeClass('active is-active'); 
			alert('상품을 선택해주세요');
		}
  	} else {
  		var params = new Object();
  		params.status = "EDIT";
  		params.query = "updateFrontJjimData";
       	params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
       	params.BASK_PRDT_CD = prdtCd;
       	params.BASK_TYPE = 'K';
  		params.CATE_IDX = cateIdx;
  		
  		if( ! $(this).hasClass('is-active') ) {
  			params.BASK_USE_YN = 'Y';
  	  		$(this).toggleClass('active is-active');
  	  		RETURN = 1;
  		} else {
  			params.BASK_USE_YN = 'N';
  	  		$(this).toggleClass('active is-active');
  	  		RETURN = 0;
  		}
      	
  		var editResult =  fn_DataAjax2( params ); 
  		
  		if ( editResult.out.resultCnt == 0 ) {
  			params.status = "WRITE";
  			params.query = "insertFrontJjimDataDuple";
  			params.BASK_TYPE = 'K';			
  			fn_DataAjax2( params ); 
  		}
  		
  		fn_LikeBtn( RETURN );
  	}
});

function fn_LikeBtn( RETURN ){
	clickToggleClassPopupEvent('.like_btn_master ',{
	    popupType : 'alert',
	    popupMsg: '찜 목록에 추가되었습니다.',
	    beforePopup: function(thisBtn){
	    	if( RETURN ) return 'ALERT'; 
	    	else return 'NOALERT';
	    }
	});
}

$(document).on( 'click','.prdt_basket_btn', function(){
	
	if( prdtCd.indexOf('COACH') > -1 ) prdtCd = $('.m_prdt_list_item').attr('id').replace('prdt', '');
// 	console.log( prdtCd );
	
	var RETURN = 0;
	
  	if( $('.prdt_select_result').html() == '' ) {
		event.stopPropagation();
		event.stopImmediatePropagation();
		alert('상품을 선택해주세요');
		
  	} else if ( localStorage.getItem('frontLoginIdx') == null || localStorage.getItem('frontLoginIdx') == '' || typeof localStorage.getItem('frontLoginIdx') == 'undefined' ) {
		event.stopPropagation();
		event.stopImmediatePropagation();
		$(this).removeClass('active is-active'); 
		alert('로그인후 사용가능합니다.');
  		return location.href = '/front/account/login';
		
	} else if( prdtCd.indexOf('COACH') > -1 || prdtCd.indexOf('COACH') == '' ) {
		if ( ! $('.prdt_select_result > div.prdt_select_item').length ) {
			event.stopPropagation();
			event.stopImmediatePropagation();
			$(this).removeClass('active is-active'); 
			alert('상품을 선택해주세요');
		}
		
  	} else {
  		if( (prdtCd.indexOf('LN') + prdtCd.indexOf('VL')) > -2 ) {
	  		var params = new Object();
	  		params.status = "DETAIL";
	  		params.query = "selectFrontBaskData";
	       	params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
	       	params.BASK_PRDT_CD = prdtCd;
// 	       	params.BASK_PRDT_CD = $('.m_prdt_list_item').eq( $(this).data('val') ).data('prdtcd');
	       	params.BASK_CNT = $('[name=prdt_cnt]').val();
	       	params.CATE_IDX = cateIdx;
			params.BASK_TYPE = 'B';
	  		
			var selectResult = fn_DataAjax2( params ); 
			
	  		params.status = "EDIT";
	  		params.query = "updateFrontJjimData";
	        params.BASK_USE_YN = 'Y';
	      	
	  		var editResult =  fn_DataAjax2( params ); 
	  		
	  		if ( editResult.out.resultCnt == 0 ) {
	  			params.status = "WRITE";
				params.query = "insertFrontJjimDataDuple";
				params.BASK_TYPE = 'B';			
	  			fn_DataAjax2( params ); 
	  		}else{
		  		// 장바구니에 있다면
		  		if( selectResult.out.detail.data[0].BASK_USE_YN == 'Y' ){
		  		// 추가하려는 상품이 하나일때만 해당 여러개인경우 묶어서 처리
		  			if( $('.prdt_select_item').length == 1 ){
			  			clickPopupEvent('.prdt_basket_btn',{
							popupType : 'alert',
							popupMsg: '이미 장바구니에 있는 상품입니다.',
							beforePopup: function(thisBtn){
							return 'ALERT';
							}
						});
				  		return ;
		  			}
		  		}
	  		}
  		} else {
  	  		$('.prdt_select_item').each(function( k, v ){
  	  			console.log($(this).data('val'));
  	  			console.log($('.m_prdt_list_item').eq( $(this).data('val') ).data('prdtcd'));
  		  		var params = new Object();
  		  		params.status = "DETAIL";
  		  		params.query = "selectFrontBaskData";
  		       	params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
//  	 	       	params.BASK_PRDT_CD = prdtCd;
  		       	params.BASK_PRDT_CD = $('.m_prdt_list_item').eq( $(this).data('val') ).data('prdtcd');
  		       	params.BASK_CNT = $(this).find('[name=prdt_cnt]').val();
  		       	params.CATE_IDX = cateIdx;
  				params.BASK_TYPE = 'B';
  		  		
  				var selectResult = fn_DataAjax2( params ); 
  				
  		  		params.status = "EDIT";
  		  		params.query = "updateFrontJjimData";
  		        params.BASK_USE_YN = 'Y';
  		      	
  		  		var editResult =  fn_DataAjax2( params ); 
  		  		
  		  		if ( editResult.out.resultCnt == 0 ) {
  		  			params.status = "WRITE";
  					params.query = "insertFrontJjimDataDuple";
  					params.BASK_TYPE = 'B';			
  		  			fn_DataAjax2( params ); 
  		  		}else{
  			  		// 장바구니에 있다면
  			  		if( selectResult.out.detail.data[0].BASK_USE_YN == 'Y' ){
  			  		// 추가하려는 상품이 하나일때만 해당 여러개인경우 묶어서 처리
  			  			if( $('.prdt_select_item').length == 1 ){
  				  			clickPopupEvent('.prdt_basket_btn',{
  								popupType : 'alert',
  								popupMsg: '이미 장바구니에 있는 상품입니다.',
  								beforePopup: function(thisBtn){
  								return 'ALERT';
  								}
  							});
  					  		return ;
  			  			}
  			  		}
  		  		}
  	  		});	
  		}
  		
  		RETURN = 1;
  		
  	  	fn_baskBtn( RETURN );
  	}
});

function fn_baskBtn( RETURN ) {
  clickPopupEvent('.prdt_basket_btn',{
      popupType : 'confirm',
      popupMsg: '선택한 상품을 장바구니에 담았습니다. <br> 장바구니로 이동하시겠습니까?',
      beforePopup: function(thisBtn){
       	if( RETURN ) return 'ALERT'; 
       	else return 'NOALERT';
      }
  });
  
  $('.btn-confirm-popup-alert').on('click',function(){
	  location.href = "/front/mypage/cart";
  });
  
}

// 리뷰 재정렬시 누른거처럼
$('.revisort').on('click', function(){
	$( '.revisort' ).removeClass('active');
	this.classList.add('active');
});


function fn_InsertUserPrdtLog(){
	if( localStorage.getItem("frontLoginIdx") != null ){
		var params = unit_getParams("searchArea");
		params.status = "WRITE";
		params.query = "insertFrontUserPrdtLogData";
		params.LOG_URL = window.location.pathname + window.location.search;
		params.CATE_IDX =  cateIdx;
		params.PRDT_CD = prdtCd;
		params.frontLoginIdx = localStorage.getItem("frontLoginIdx"); 
	 	var result = fn_DataAjax( params );
	}
}



// function lnbEvent(){
// var $lnb = $('.prdt_layout');
// var $lnbItems = $lnb.find('.prdt_tab');
// $lnbItems.each(function(i,e){
//   if($(e).hasClass('is-active')){
//       $lnb.scrollLeft($(e).offset().left);
//  }
// })
// $lnbItems.on('mouseenter', function(e){
//  $lnb.stop().animate({scrollLeft: $(this).offset().left}, 1000);
// });
// }


$(document).on('keypress', '[name=prdt_cnt]', function(){
	$(this).val($(this).val());
});
    
// 라이브만 해당    
$(document).on('click', '.prdt_price .amount-control > a', function(){
 		var cnt =  $(this).siblings('[name=prdt_cnt]').val();
 		var target = $(this).closest('.prdt_price');
 		
 		var targetprice1 = target.children('.prdt_price_won').text().replace('원','');
 		targetprice1 = targetprice1.replace(/,/g,'');
 		targetprice1 = targetprice1/cnt;
 		
 		var targetprice2 = target.children('.prdt_price_inn').find('.pay span').text().replace('원','');
 		targetprice2 = targetprice2.replace(/,/g,'');
 		targetprice2 = targetprice2/cnt;
 		
 		var targetprice3 = target.children('.prdt_price_inn').find('span').eq(0).text().replace('원','').replace('%','');
 		var targetprice3Type = target.children('.prdt_price_inn').find('span').eq(0).text();
 		if( targetprice3Type.indexOf('원') > -1 ) targetprice3Type = '원';
 		else targetprice3Type = '%';
 		targetprice3 = targetprice3.replace(/,/g,'');
 		targetprice3 = targetprice3/cnt;
 		
 		if ($(this).hasClass('opt-cnt-minus') ){
				if ($(this).hasClass('disabled')) return alert( '더 이상 줄일 수 없습니다.' );
				
				if( (1*cnt - 1) == 1 ) $(this).css({'color':'black'});
				
				$(this).siblings('input[name=prdt_cnt]').attr( 'value', 1*cnt -1 );
				if (cnt == 2) $(this).addClass('disabled');
 		   
				// 가격도 변경
				target.children('.prdt_price_won').text( numberWithCommas(targetprice1 * (cnt -1)) + ' 원' );
				target.children('.prdt_price_inn').find('.pay span').text( numberWithCommas(targetprice2 * (cnt -1)) );
				if( targetprice3Type != '%' ) target.children('.prdt_price_inn').find('span').eq(0).text( numberWithCommas(targetprice3 * (cnt -1)) + ' ' + targetprice3Type);
				
 		}else if ($(this).hasClass('opt-cnt-plus')) {
 		   $(this).siblings('input[name=prdt_cnt]').attr( 'value', 1*cnt +1 );
 		   $(this).siblings('.opt-cnt-minus').removeClass('disabled');
		   $(this).siblings('.opt-cnt-minus').css({'color':'#666'});
 			// 가격도 변경
				target.children('.prdt_price_won').text( numberWithCommas(targetprice1 * (1*cnt +1)) + ' 원' );
				target.children('.prdt_price_inn').find('.pay span').text( numberWithCommas(targetprice2 * (1*cnt +1)) );

				if( targetprice3Type != '%' ) target.children('.prdt_price_inn').find('span').eq(0).text( numberWithCommas(targetprice3 * (1*cnt +1)) + ' ' + targetprice3Type );
 		   
 		}
});

function counter( OPEN_DTM, BTN_DAY, BTN_TIME ){
	var dday = new Date( OPEN_DTM ).getTime(); //디데이
	
	setInterval(function(){
		var now = new Date(); //현재 날짜 가져오기
		var distance = dday - now;
		var d = Math.floor(distance / (1000 * 60 * 60 * 24));
		var h = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		var m = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
		var s = Math.floor((distance % (1000 * 60)) / 1000);
		var viewDay = '';
		var view = '';
		if (distance<0) {
			if( $('.timeDealDay').text().length == 0 ) $('.timedealDiv').remove();
		} else {
			$('.timedealDiv').show();
			if (d>0) {
				viewDay = 'D-' + viewDay+d;
			} else {
				$('.timeDealDay').eq(BTN_DAY.index()).css({'background-color':'#ff00ff'});
				viewDay = '오늘종료';
				if( h < 2 ) viewDay = '마감임박';
				
				if( h > 0 ) view = view+h+'시간 ';
				if( m > 0 ) view = view+m+'분 ';
				if( s < 10) s = '0'+s;
				BTN_TIME.text( view+s+'초' );
				if( d+h+m+s < 1 ) location.href = window.location.href;
			}
			BTN_DAY.text( viewDay );
		}
	}, 1000);
}
</script>











