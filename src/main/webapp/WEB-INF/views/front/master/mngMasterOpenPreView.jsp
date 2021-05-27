<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />


<style>

.select.select_white {
    background: none;
}
</style>
    <div id="container">
        <section class="section_prdt section_prdt_main">
            <div class="section_inner">
                <div class="prdt_layout">
                    <div class="prdt_contents">
                        <div class="prdt_main_img_area">
                            <figure class="prdt_figure">
                                <img class="prdt_img" src="" alt="마스터 프로필사진">
                            </figure>
                            <div class="prdt_title_area">
                                <span></span>
                                <h3><br></h3>
                                <p></p>
                            </div>
                            <div class="prdt_main_img_badge">
                                <span class="prdt_badge badge_red">즉시 코칭가능</span>
                                <button type="button" class="btn_following prdt_badge badge_white">팔로잉</button>
                            </div>
                        </div> 
                    </div>
                    
                    <div id="reviewPop" class="popup_wrap">
		                  <div class="popup_layer"></div>
		                  <div class="popup_box">
		                      <div class="popup_content review_content">
		                          <button type="button" class="pop_close"></button>
		                          
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
		<!--                               <div class="rpc_file"> -->
		<!--                                   <input type="file" id="rpcFile" class="file_input"> -->
		<!--                                   <label for="rpcFile" class="file_input_label">파일 선택</label> -->
		<!--                                   <span class="rpc_file_text pps_per">*5MB이하의 이미지 파일을 첨부하실 수 있습니다.</span> -->
		<!--                               </div> -->
		      
		                              <button type="button" class="rpc_submit">확인</button>
		                          </div>
		                      </div>
		                  </div>
		              </div><!-- //#reviewPop -->
		                    
                    
                    <div class="prdt_info_area prdt_info_area_type2">
                        <div class="prdt_info_layout">
                            <div class="prdt_info">
                                <div class="prdt_info_top">
                                
                                </div>

                                <div class="prdt_select_area">
                                    <div class="prdt_select select select_white">상품선택</div>
                                    
                                </div>

                                <div class="prdt_info_sta">
                                    <button class="m_prdt_fold">접기</button>
                                    <div class="m_prdt_fold_contents">
                                        <ul class="m_prdt_list is-hide" id="selectPrdtList">
                                        </ul>

                                        <div class="prdt_select_result"></div>

                                    </div>
                                    <div class="prdt_info_sta_inner">
                                        <button type="button" class="prdt_like_btn like_btn_master toggle_btn">좋아요</button>
                                        <button type="button" class="prdt_basket_btn">장바구니</button>
                                        <button type="button" class="prdt_apply_btn masterHomeDetail">신청하기</button>
                                    </div>
                                </div>
                            </div>
						</div>
                    </div>
                </div>
            </div>
        </section>

        <div class="prdt_tab_area">
            <div class="section_inner">
                <div class="prdt_layout">
                    <div class="prdt_contents">
                        <ul class="prdt_tab_lists">
                            <li class="prdt_tab"><a href="#" data-idx="0">마스터소개</a></li> 
                            <li class="prdt_tab"><a href="#" data-idx="1">서비스소개</a></li> 
                            <li class="prdt_tab"><a href="#" data-idx="2">전체리뷰</a></li> 
                            <li class="prdt_tab"><a href="#" data-idx="3">추천상품</a></li> 
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <section class="section_prdt" data-idx="2">
            <div class="section_inner">
                <div class="prdt_layout">
                    <div class="prdt_contents">
                        <h3 class="prdt_section_title">전체리뷰<span style="font-size:14px;">()</span></h3>
                        
            <div class="review-list-title">
<!--                 <h3 class="prdt_section_title">전체리뷰</h3> -->
<!--                               <h3>전체리뷰(<span>33</span>)</h3> -->
                <ul class="list-sort list-sort_add">
                    <li class="active revisort" onclick="review_sort('');"><a style="cursor: pointer;">최신순</a></li>
                    <li class="revisort" onclick="review_sort('star');"><a style="cursor: pointer;">별점순</a></li>
                    <li class="revisort" onclick="review_sort('popular');"><a style="cursor: pointer;">인기순</a></li>
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

        <section class="section_prdt section_prdt_last" data-idx="3">
            <div class="section_inner">
                <div class="prdt_layout">
                    <div class="prdt_contents">
                        <h3 class="prdt_section_title">추천상품</h3>

                        <div class="prdt_recommend_list">
                            <ul id="recommend_li">
                                  추천상품이 없습니다.
                            </ul>                            
                        </div>
                       
                    </div>
                </div>
            </div>
        </section>

        

  
    </div><!-- // #container -->


<!-- <script type="text/javascript" src="/resources/assets/js/jquery-1.12.4.min.js"></script> -->
<!-- <script type="text/javascript" src="/resources/assets/js/slick.min.js"></script> -->
<!-- <script type="text/javascript" src="/resources/assets/js/common.js"></script> -->

<!-- youtube script start -->
<script>
// var videoTarget = 'videos';
var clickButtonClass = '.btn_video_play';
// var videoId = '0qOVgBa4WMU';
var idAry = [], urlAry = [], objAry = [];
//플레이어를 만들어줄 아이디값 넣을 배열, 각 동영상 url을 넣을 배열, 플레이어 객체를 넣을 배열이다.
</script>
<style>
	.reviewHide{display: none;}
	
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
 
 .like_btn.active {
    background: url(/resources/assets/images/icon/icon_heart_active.png) center center / cover no-repeat;
}

.prdt_like_btn.like_btn_master{position:static; float:left; width:50px; height:50px; line-height:50px; margin-right:8px; border:0; border-radius:.25em; text-indent:-9999em; overflow:hidden;background:#141414 url('/resources/assets/images/icon/icon_heart.png') no-repeat center; background-size:23px 20px; outline:none;} 
.prdt_like_btn.like_btn_master.active{background:#141414 url('/resources/assets/images/icon/icon_heart_active.png') no-repeat center; background-size:23px 20px;}

@media screen and (max-width:1200px){
    .prdt_like_btn.like_btn_master{width:40px;height:40px;}
}


</style>
<script src="/resources/assets/js/youtubePlayer.js"></script>
<!-- youtube script end -->

<script>
// $('.m_prdt_fold_contents').hide();
// 클릭 이벤트 막기
$('body').css('pointer-events','none');

// prdtSelectEvent(); 변수
    var productData = [];

   $('document').ready(function(){
	   
	   prdtCd = '';
	   
//         prdtSelectEvent();
        prdtFoldEvent();

        var params = new Object();
        params.status = "DETAIL";
    	params.query = "selectFrontMasterDetail";
		params.CATE_IDX = window.opener.cateIdx;
		params.cateUseYn = 'YN';
    	params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
    	
    	var master = fn_DataAjax2( params ); 
    	master = master.out.detail.data[0];
		
    	setUuid( master.CATE_MASTEROPEN_UUID );
    	imgIdValue = "CATE_MASTEROPEN_UUID_FILE";
    	unit_fileGet( imgIdValue, "fn_fileUpload");
    	$('.prdt_figure > .prdt_img').attr('src', $('#imgTag').val());
    	
        $('.prdt_title_area > span:eq(0)').text( master.CODE_PARENT_NM + ' · ' + master.USER_NM );
        $('.prdt_title_area > h3:eq(0)').html( master.INFO_MAST_TITL1 + '<br>' + master.INFO_MAST_TITL2 );
        $('.prdt_title_area > p:eq(0)').html( master.INFO_MAST_SUBT1 + '<br>' + master.INFO_MAST_SUBT2 );
        if (master.USER_FOLLOW_YN != 'N') {
        	$('.prdt_main_img_badge > button:eq(0)').attr('id', 'follow'+master.USER_FOLLOW_YN);
	        $('.prdt_main_img_badge > button:eq(0)').addClass('badge_cyan');
		}
    	
        var params = new Object();
        params.status = "LIST";
        params.query = "selectFrontPrdtDataList";
        params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
		params.CATE_IDX = window.opener.cateIdx;
		
        var prdtResult = fn_DataAjax2( params ); 
        prdtResult = prdtResult.out.detail.data;
        
        if (prdtResult.length > 0) {
			
        	//prdt_info_top 만들기
        	
        	var live = "";
        	var couch1 = "";
        	var couch2 = "";
        	var couch3 = "";
        	var vod = "";
        	var couch = "";
        	var html = "";
        	var select_prdtList_Html = "";
        	
        	var percent = 0;
        	var PRDT_PRIC_REAL = 0;
        	
        	var percentTemp = 0;
        	var PRDT_PRIC_REAL_temp = 0;
        	
        	var prdt_select_area_element = [];
        	
	        $.each( prdtResult,  function( k, v ){
	        	if (k == 0) {
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
	        	if ( PRDT_PRIC_REAL_temp < v.PRDT_PRIC_REAL ) {
	        		PRDT_PRIC_REAL = PRDT_PRIC_REAL_temp;
				}else{
					PRDT_PRIC_REAL = v.PRDT_PRIC_REAL;
				}
	        	
	        	//prdt_info_top 만들기
	        	if ( v.PRDT_TYPE == 'LIVE CLASS' ) {
	        		live += '<div class="prdt_info_title"><span class="tag">LIVE CLASS</span> <a href="'+v.MOVE_URL+'" class="name">'+v.PRDT_NM1+'</a></div>';
				}else if ( v.PRDT_TYPE.indexOf('1:1') > -1 ) {
					 if (v.PRDT_TYPE == '1:1화상상담') {	 couch1 += ' 화상 /';	}
					 else if (v.PRDT_TYPE == '1:1채팅상담') {	couch2 += ' 채팅 /';	}
					 else if (v.PRDT_TYPE == '1:1이메일상담') {	 couch3 += ' 이메일 /';	}
				}else if ( v.PRDT_TYPE == 'VOD' ) {
					vod += '<div class="prdt_info_title"><span class="tag">VOD</span> <a href="'+v.MOVE_URL+'" class="name">'+v.PRDT_NM1+'</a></div>';
				}
	        	
	        	// prdt_select_area_element 생성
	        	prdt_select_area_element.push( {
	        		  product: v.PRDT_TYPE + ' ' + substitu( v.PRDT_TIME, v.PRDT_TYPE  ),
	                  price: numberWithCommas( v.PRDT_PRIC ) ,
	                  price2: numberWithCommas( v.PRDT_PRIC_REAL )
	        	});
	        	
	        	select_prdtList_Html += '<li id="prdt'+v.PRDT_CD+'" class="m_prdt_list_item" data-val="'+k+'" data-prdtCd="'+v.PRDT_CD2+'" data-jjim="'+v.BASK_IDX+'" >';
	            select_prdtList_Html += '    <strong class="m_prdt_list_title">'+prdt_select_area_element[k].product+'</strong>';
	            select_prdtList_Html += '    <div class="m_prdt_list_price_area">';
	            select_prdtList_Html += '        <span>'+prdt_select_area_element[k].price+'</span>';
	            select_prdtList_Html += '        <strong>'+prdt_select_area_element[k].price2+'</strong>';
	            select_prdtList_Html += '    </div>';
	            select_prdtList_Html += '</li>';
	        	
	            // 즉시코칭가능에 값 뿌려주기
	      
	        });
	        
	        if ( couch1 != '' || couch2 != '' || couch3 != '' ) {
	        	
	        	var params = new Object();
	        	params.status = "LIST";
	        	params.query = "selectFrontPrdtDataCaoch";
	            params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
				params.CATE_IDX = window.opener.cateIdx;
	            var caochResult = fn_DataAjax2( params ); 
	            
		        couch += '<div class="prdt_info_title"><span class="tag">1:1코칭</span> <a href="'+caochResult.out.detail.data[0].MOVE_URL+'" class="name">'+(couch1+couch2+couch3).slice( 0 ,-1)+'</a></div>';
			}
	        
	        html += '<div class="prdt_price">';
	        html += '    <div class="prdt_price_inn">';
	        html += '        <span class="sale">'+percent+'%</span>';
	        html += '        <strong class="pay"><span>'+numberWithCommas( PRDT_PRIC_REAL )+'</span> 원~</strong>';
	        html += '    </div>';
        	html += '</div>';
	        
	        $('.prdt_info_top').append( vod + couch + live + html );
	        
	        
	        ///  prdt_select_area 셀렉트박스 만들어주는 부분
	        for (var i = 0; i < prdt_select_area_element.length; i++) {
	        	productData.push( prdt_select_area_element[i] );
			}
	        
	        $('#selectPrdtList').append( select_prdtList_Html );
	        
	        prdtSelectEvent();
	        
		}
        var params = new Object();
    	params.status = "LIST";
    	params.query = "selectFrontMasteropenDetail";
		params.CATE_IDX = window.opener.cateIdx;
    	params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');

		if ( params.FRONT_LOGIN_IDX == null ||  params.FRONT_LOGIN_IDX == '' || params.FRONT_LOGIN_IDX == undefined ) {
			params.FRONT_LOGIN_IDX = 'free-';
		}    	
    	var info = fn_DataAjax2( params ); 
    	var infoList = info.out.detail.data;
        
    	
    	
    	makeDetail( infoList, master );
    	
    	// 유튜브 동영상 불러오는거야 API 사용하여 불러오기
    	$('.yotube').each(function( k){
    		$(this).attr('id', 'player'+ k); // 아이디값 추가
			idAry.push('player'+k); // 아이디 값 배열에 넣기
    		urlAry.push($(this).data('url')); // 동영상 url 배열에 넣기
    	});
		
    	review_sort( '' );
    	
    	makeRecom();
    	
    	$( '#now_loading' ).hide();
    	
    	
    });

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
                   '<div class="prdt_select_price_area">'+
                       '<span>'+data.price+' 원</span>'+
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
//      	$('.m_prdt_fold_contents').hide();
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


       var $items = $('.m_prdt_list_item');
       var $mobileProductList = $('.m_prdt_list');
    
       $(document).on('click', '.m_prdt_list_item',function(){
           $select.removeClass('is-active');
           $mobileProductList.addClass('is-hide');
           $selectContents.addClass('select-product');
           $selectResult.html(createSelectCard(productData[$(this).data('val')], $(this).data('val'), $(this).data('jjim') ));
           if(DEVICE_TYPE != 'MOBILE'){
               $select.html(productData[$(this).data('val')].product + ' ('+ productData[$(this).data('val')].price2 +')')
           }
           goTopInPrdt();
           prdtCd = $('#selectPrdtList > li.m_prdt_list_item').eq( $('div.prdt_select_result > div.prdt_select_item').data('val') ).data('prdtcd');
       });
		
       // 선택한 상품 취소
       $(document).on('click', '.prdt_select_result', function(e){
           if($(e.target).hasClass('icon_x')){
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
       var $selectContents = $('.m_prdt_fold_contents');
       var $mobileProductList = $('.m_prdt_list');
       
       $(document).on('click', '.m_prdt_fold', function(){
           $selectContents.slideToggle( 190, 'linear', function(){
               goTopInPrdt();
           });
           $btnFold.toggleClass('is-fold');
       });
       //리사이즈시 prdt_info_sta 영역 setting
       $btnFold.addClass('is-fold');
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
                   : $mobileProductList.addClass('is-hide'); // 상품선택 O
               
               ($btnFold.hasClass('is-fold')) 
                   ? $selectContents.hide()
                   : $selectContents.show();
           }
       }).trigger('resize');
   }

    function makeDetail( params, master ){
    	var insertPoint = $('.rpdt_review').closest('.section_prdt'); // 삽입지점
    	var html = "";
    	var INF05_CNT = 0;
    	var html_INF05 = "";
    	
    	$.each( ConvertHtmltoSystemSource(  params ) , function(k,v){
    		html = "";
    		if (v.INFO_CD == 'INF01' ) {
    			setUuid( v.INFO_UUID );
    			imgIdValue = "INFO_UUID_FILE"+v.INFO_UUID_NUM;
    			unit_fileGet( imgIdValue, "fn_fileUpload");
    			
    			videoId = replaceVod(v.INFO_LINK);
    			videoTarget = 'videos'+k;
    	        html += '<section class="section_prdt" data-idx="0">';
	            html += '    <div class="section_inner"> ';
	            html += '        <div class="prdt_layout"> ';
	            html += '            <div class="prdt_contents">   ';
	            html += '                <h3 class="prdt_section_title prdt_section_title_size" style="">마스터소개</h3> ';
	            html += '                <div class="master_info">                        ';
	            html += '                    <div class="prdt_video">                ';
	            if ( v.INFO_PLAYER == 'PLAY01' ) {
	            html += '                        <div class="prdt_video_temp" style="white-space: initial;">                     ';
	            html += '                            <button type="button" class="btn_video_play">재생</button>    ';
	            html += '                            <img src="https://img.youtube.com/vi/'+replaceVod(v.INFO_LINK)+'/maxresdefault.jpg" alt="">       ';
	            html += '                        </div>                                                            ';
	            html += '                        <div id="videos'+k+'" class="yotube" data-url="'+replaceVod(v.INFO_LINK)+'"> </div>                             ';
				}else if ( v.INFO_PLAYER == 'PLAY02'  ) {
					var infoLink = "";
					
					infoLink = v.INFO_LINK.replace('https://tv.naver.com/v/','').split('/')[0];
					
					
					html += "<iframe src='https://tv.naver.com/embed/"+infoLink+"?autoPlay=true' frameborder='no' scrolling='no' marginwidth='0' marginheight='0' WIDTH='544' HEIGHT='306' allow='autoplay' allowfullscreen></iframe>";
				}else if ( v.INFO_PLAYER == 'PLAY03'  ) {
					console.log( v.PLAYER_URL );					
					html += '<iframe allowfullscreen src="https://player.yozii.com/fiveplayer/fiveplayer-streaming.php?token='+v.PLAYER_URL+'"></iframe>';
				}
	            
	            html += '                    </div>       ';
	            html += '                    <div class="master_info_card" style="top: 0px;">    ';
	            html += '                        <figure class="master_figure"><img class="master_img" src="'+$('#imgTag').val()+'" alt=""></figure>   ';
	            html += '                        <div class="master_profile">             ';
	            html += '                            <div class="master_name">'+master.USER_NM+'</div>   ';
	            html += '                            <div class="master_intro">             ';
	            html += '                                <p style="white-space: pre-wrap!important;color:'+v.INFO_TITL_COLR+'">'+v.INFO_TITL +'<br>    ';
	            html += '                                </p>                                   ';
	            html += '                                <p style="white-space: pre-wrap!important;">'+v.INFO_CNTN +'<br>    ';
	            html += '                                </p>                                   ';
	            html += '                            </div>   ';
	            html += '                        </div>    ';
	            html += '                    </div>    ';
	            html += '                </div>   ';
	            html += '            </div>    ';
	            html += '        </div>    ';
	            html += '    </div>     ';
	            html += '</section>   ';
    			
	            insertPoint.before( html );
    		} else if (v.INFO_CD == 'INF02' ) {
    			setUuid( v.INFO_UUID );
    			imgIdValue = "INFO_UUID_FILE"+v.INFO_UUID_NUM;
    			unit_fileGet( imgIdValue, "fn_fileUpload");
    		
    			html += '<section class="section_prdt" data-idx="1">';
	            html += '    <div class="section_inner">';
	            html += '        <div class="prdt_layout">';
	            html += '            <div class="prdt_contents">';
	            html += '                <h3 class="prdt_section_title">서비스소개</h3>';
	            html += '                <div class="prdt_detail" style="white-space: pre-line;">';
	            html += '                    <strong style="color:'+v.INFO_TITL_COLR+'">'+v.INFO_TITL+'</strong>';
	            html += '                    <p style="white-space: pre-wrap!important;">'+v.INFO_CNTN;
	            html += '                    </p>';
	            html += '                </div>';
	            html += '            </div>';
	            html += '        </div>';
	            html += '    </div>';
	            html += '</section>';
    			
    			
	            insertPoint.before( html );
    				
    		} else if (v.INFO_CD == 'INF03' ) {
    			setUuid( v.INFO_UUID );
    			imgIdValue = "INFO_UUID_FILE"+v.INFO_UUID_NUM;
    			unit_fileGet( imgIdValue, "fn_fileUpload");
    			
    			html += '<section class="section_prdt" data-idx="1">';
	            html += '    <div class="section_inner">';
	            html += '        <div class="prdt_layout">';
	            html += '            <div class="prdt_contents">';
	            html += '                <h3 class="prdt_section_title">서비스소개</h3>';
	            html += '                <div class="prdt_detail" style="white-space: pre-line;">';
	            html += '                    <strong style="color:'+v.INFO_TITL_COLR+'">'+v.INFO_TITL+'</strong>';
	            html += '                    <p style="white-space: pre-wrap!important;">'+v.INFO_CNTN;
	            html += '                    </p>';
	            html += '                </div>';
	            html += '            </div>';
	            html += '        </div>';
	            html += '    </div>';
	            html += '</section>';
    			
	            insertPoint.before( html );
    		}else if (v.INFO_CD == 'INF04') {
    			setUuid( v.INFO_UUID );
    			imgIdValue = "INFO_UUID_FILE"+v.INFO_UUID_NUM;
    			unit_fileGet( imgIdValue, "fn_fileUpload");
    			
    			html += '<section class="section_prdt" data-idx="1">';
	            html += '    <div class="section_inner">';
	            html += '        <div class="prdt_layout">';
	            html += '            <div class="prdt_contents">';
	            html += '                <h3 class="prdt_section_title">서비스소개</h3>';
	            html += '                <div class="prdt_detail" style="white-space: pre-line;">';
	            html += '                    <strong style="color:'+v.INFO_TITL_COLR+'">'+v.INFO_TITL+'</strong>';
	            html += '                    <p style="white-space: pre-wrap!important;">'+v.INFO_CNTN;
	            html += '                    </p>';
	            html += '                </div>';
	            html += '            </div>';
	            html += '        </div>';
	            html += '    </div>';
	            html += '</section>';
    			
	            insertPoint.before( html );
    		}else if (v.INFO_CD == 'INF05') {
    			setUuid( v.INFO_UUID );
    			imgIdValue = "INFO_UUID_FILE"+v.INFO_UUID_NUM;
    			unit_fileGet( imgIdValue, "fn_fileUpload");
    			
    			if (INF05_CNT == 0) {
    				html_INF05 = "";
    				
    				html_INF05 += '<section class="section_prdt" data-idx="1">';
    				html_INF05 += '    <div class="section_inner">';
    				html_INF05 += '        <div class="prdt_layout">';
    				html_INF05 += '            <div class="prdt_contents">';
    				html_INF05 += '                <h3 class="prdt_section_title">추천대상</h3>';
    				html_INF05 += '                <div class="prdt_detail" style="white-space: pre-line;">';
    				html_INF05 += '                    <strong style="color:'+v.INFO_TITL_COLR+'">'+v.INFO_TITL+'</strong>';
    				
    				html_INF05 +=	'    <ul class="mdc_info_list">';
    				html_INF05 +=	'        <li class="mdc_info_item">';
    				html_INF05 +=	'            <span class="mdc_thumb" style="background-image: url('+$('#imgTag').val()+');"></span>'; //추천대상
    				html_INF05 +=	'            <div class="mdc_il_box">';
    				html_INF05 +=	'                <span class="mdc_il_q">'+v.INFO_TITL_SUB+'</span>';
    				html_INF05 +=	'                <p class="mdc_il_a">'+v.INFO_CNTN;
    				html_INF05 +=	'                </p>';
    				html_INF05 +=	'            </div>';
    				html_INF05 +=	'        </li>';
    				
    				INF05_CNT++;
    			}else if (INF05_CNT == 1) {
    	
    				html_INF05 += '        <li class="mdc_info_item">';
    				html_INF05 += '            <span class="mdc_thumb" style="background-image: url('+$('#imgTag').val()+');"></span>'; //상담진행
    				html_INF05 += '            <div class="mdc_il_box">';
    				html_INF05 += '                <span class="mdc_il_q">'+v.INFO_TITL_SUB+'</span>';
    				html_INF05 += '                <p class="mdc_il_a">'+v.INFO_CNTN;
    				html_INF05 += '                </p>';
    				html_INF05 += '            </div>';
    				html_INF05 += '        </li>';
    				
    				INF05_CNT++;
    			}else if (INF05_CNT == 2) {
    	
    				html_INF05 += '        <li class="mdc_info_item">';
    				html_INF05 += '            <span class="mdc_thumb" style="background-image: url('+$('#imgTag').val()+');"></span>'; //활용법
    				html_INF05 += '            <div class="mdc_il_box">';
    				html_INF05 += '                <span class="mdc_il_q">'+v.INFO_TITL_SUB+'</span>';
    				html_INF05 += '                <p class="mdc_il_a">'+v.INFO_CNTN;
    				html_INF05 += '                </p>';
    				html_INF05 += '            </div>';
    				html_INF05 += '        </li>';
    				html_INF05 += '    </ul>';
    				
    				html_INF05 += '                </div>';
    				html_INF05 += '            </div>';
    				html_INF05 += '        </div>';
    				html_INF05 += '    </div>';
    				html_INF05 += '</section>';
    				
    				insertPoint.before( html_INF05 );
    			}
    		}
    	});
    	
    	setTimeout( function(){ prdtTabEvent();  }, 2000 );
    	
    }
    
    function makeReview( reviewList ){
    	
    	$('.rpdt_review ul').empty();
    	
    	var html = '';
    	
    	$('.rpdt_review').siblings('h3.prdt_section_title').find('span').text( '(' + reviewList.length + ')' );
    	
    	$.each( reviewList, function( k, v ){

    		html += '<li class="rpdt_reivew_card '+ (k > 2? "reviewHide":"") +' ">';
		    html += '    <div class="rpdt_review_info">            ';
		    html += '        <div class="rpdt_review_info_title">['+v.PRDT_TYPE+'] '+v.PRDT_NM+'</div>     ';
		    html += '        <span class="name">'+v.USER_NICK+'</span> <span class="date">'+v.SYS_REG_DTM+'</span>';
		    html += ( v.REVI_PUBL_YN == 'Y'?'<button id="REVI'+v.REVI_IDX+'" type="button" class="btn_eclaration">신고</button>  ':'' );
		    html += '        <span class="is-rater">                   ';

		    for (var i = 1; i <= 5; i++) {
		    	( i <= v.REVI_SCOR )?html += '            <span class="icon_star icon_star_active"></span>': html += '            <span class="icon_star icon_star_none"></span>';
			}
		    
		    html += '        </span>                       ';
		    html += '    </div>            ';
		    html += '    <div class="rpdt_review_textarea">'+( v.REVI_PUBL_YN == 'Y'?v.REVI_CNTN:'비공개처리된 리뷰입니다.' );
		    html += '    </div>    ';
		    html += '</li>    ';

    	});
    	if ( reviewList.length == 0 ) {
    		html = '<li class="rpdt_reivew_card"><div class="rpdt_review_textarea">리뷰가 없습니다.</div></li>'
	    	$('.rpdt_review > ul').append( html );
		}else{
	    	$('.rpdt_review > ul').append( html );
		}
    }
    
  function makeRecom(){
      var params = new Object();
      params.status = "LIST";
      params.query = "selectFrontRecommendProductList";
      params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
	  params.CATE_IDX = window.opener.cateIdx;
	  params.userCateLog = window.opener.cateIdx;
		
      var recommResult = fn_DataAjax2( params, 'RECOMMEND' );
	  var html = "";
	  
// 	  console.log( recommResult );
	  
	  if ( recommResult.out.detail.data.length > 0 ) {
		  $('#recommend_li').empty();
		  
	      $.each( recommResult.out.detail.data, function( k, v ){
	    	  
	    	  setUuid(v.PRDT_UUID);
	  		
	  		  unit_fileGet( v.PRDT_UUID_NM+'_FILE' , "fn_fileUpload");
	  		
	    	  html += '<li>';
		      html += '    <a href="'+v.MOVE_URL+'">';
		      html += '        <div class="prdt_recommend_card">';
		      html += '            <div class="prdt_recommend_img-area">';
		      html += '                <img class="prdt_recommend_img" id="recom'+v.PRDT_CD+'" src="'+$('#imgTag').val()+'" alt="">';
			  if ( v.BASK_IDX != 0 ) {
		      html += '                <button id="JJIM'+v.BASK_IDX+'" type="button" class="like_btn toggle_btn active is-active"></button>';
			  }else{
		      html += '                <button type="button" class="NOJJIM like_btn toggle_btn"></button>';
			  }
		      html += '            </div>';
		      html += '            <div class="prdt_recommend_info">';
		      html += '                <span>['+v.PRDT_TYPE+'] '+v.CODE_NM+' · '+v.MASTER_NM+'</span>';
		      html += '                <p>'+v.INFO_PRDT_TITL1+'</p>';
		      html += '                <p>'+v.INFO_PRDT_TITL2+'</p>';
		      html += '                <div class="prdt_recommend_price_area">';
		      html += '                    <span class="price">'+v.PRDT_PRIC+' 원</span>';
		      html += '                    <strong class="pay"><span>'+v.PRDT_PRIC_REAL+'</span> 원</strong>';
		      html += '                </div>';
		      html += '            </div>';
		      html += '        </div>';
		      html += '    </a>';
		      html += '</li>';
	    	  
	    	  
	      });
	      $('#recommend_li').append( html );
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
	        		if( $(this).hasClass('NOJJIM') ){
	        			
	          		var params = new Object();
	      			params.status = "EDIT";
	      			params.query = "updateFrontJjimData";
	          		params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
	      			params.BASK_PRDT_CD = $(this).siblings('img.prdt_recommend_img').attr('id').replace( 'recom', '' );
	      			params.CATE_IDX = window.opener.cateIdx;
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
	      		}else{
	      			var params = new Object();
	      			params.status = "EDIT";
	      			params.query = "updateFrontJjimData";
	      			params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
	      			params.BASK_PRDT_CD = $(this).siblings('img.prdt_recommend_img').attr('id').replace( 'recom', '' );
	      			params.CATE_IDX = window.opener.cateIdx;
	      			params.BASK_USE_YN = 'N';
	      			params.BASK_TYPE = 'K';
	      			fn_DataAjax2( params ); 
	      			
	      			$(this).addClass('NOJJIM');
	      				$(this).removeClass('active is-active'); 
	      		}
	        	}
	      });
	      
	  }else{
		  $('#recommend_li').css('text-align','center');
	  }
  }
  
  function substitu( PRDT_TIME, PRDT_TYPE ){
	  if ( PRDT_TYPE == '1:1이메일상담' ) {
			return 1*PRDT_TIME+'회';
		}else if ( PRDT_TYPE.indexOf('1:1') > -1 ) {
			return 1*PRDT_TIME+'분';
		}else if ( PRDT_TYPE == 'VOD' ) {
			return 1*PRDT_TIME+'일';
		}else{
			return 1*PRDT_TIME+'분';
		}
  }
  

// 리뷰 정렬
function review_sort( sort ){
	var params = new Object();
	params.status = "LIST";
	params.query = "selectFrontReviewList";
	params.CATE_IDX = window.opener.cateIdx;
	params.sort = sort;
	var reviewResult = fn_DataAjax2( params ); 
	var reviewList = reviewResult.out.detail.data;
	
	makeReview( reviewList );
}

	
</script>
