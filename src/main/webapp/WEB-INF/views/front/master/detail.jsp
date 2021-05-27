<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<style>
.select.select_white {
    background: none;
}
p, div{
    font-family: 'Montserrat', 'Noto Sans KR', 'Malgun Gothic', Dotum, "돋움",Gulim, "굴림", Verdana, Tahoma, AppleGothic, sans-serif;
    font-size: 16px;
}
/* 추천상품 pc에서 가운데 정렬 안되게 */
.slick-track{ margin-left: inherit; }
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
    border-color: #606060;
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
    font-size: 16px;
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
@media screen and (max-width:960px){
    .m_prdt_fold_contents{max-height: 400px;    overflow-y: scroll;}
}
</style>
    <div id="container" class="phones_container" style="overflow-x:hidden;">
        <section class="section_prdt section_prdt_main">
            <div class="section_inner">
                <div class="prdt_layout">
                    <div class="prdt_contents">
                        <div class="prdt_main_img_area">
                            <figure class="prdt_figure">
                                <img class="prdt_img" src="" alt="마스터 프로필사진">
                            </figure>
                            <div class="prdt_title_area phones_prdt_title_area">
<!--                                 <span style="    mix-blend-mode: difference;"></span> -->
<!--                                 <h3 style="    mix-blend-mode: difference;"><br></h3> -->
<!--                                 <p style="    mix-blend-mode: difference;"></p> -->
<!--                                 <span style="    text-shadow: 4px 2px 2px gray;"></span>
                                <h3 style="    text-shadow: 4px 2px 2px gray;"><br></h3>
                                <p style="    text-shadow: 4px 2px 2px gray;"></p>  -->
                                <span></span>
                                <h3><br></h3>
                                <p></p> 
                            </div>
                            <div class="prdt_main_img_badge">
<!--                                 <span class="prdt_badge badge_red">즉시 코칭가능</span> -->
                                <button type="button" class="btn_following prdt_badge badge_white">팔로우</button>
                            </div>
                        </div> 
                    </div>
                    
                    <div id="reviewPop" class="popup_wrap">
		                  <div class="popup_layer"></div>
		                  <div class="popup_box">
		                      <div class="popup_content review_content phone_review_content tablet_review_content">
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
<!--                             <button type="button" class="rpdt_review_btn_more">리뷰더보기</button> -->
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
<script src="/resources/assets/js/youtubePlayer.js"></script>
<script>
// prdtSelectEvent(); 변수
    var productData = [];

   $('document').ready(function(){
		prdtCd = '';
		prdtFoldEvent();
		
        //팔로잉 관련 코드 여기에
        btnFollowingEvent(function(){
			if ( localStorage.getItem('frontLoginIdx') == null || localStorage.getItem('frontLoginIdx') == '' ) {
				$('.prdt_main_img_badge > button:eq(0)').addClass('badge_white');
				alert('로그인후 사용가능합니다.');
	      		return location.href = '/front/account/login';
			}
			var params = new Object();
			params.status = "EDIT";
			params.query = "insertFrontFollowDataDuple";
			params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
			params.CATE_IDX = cateIdx;
			params.FOLL_USE_YN = 'Y';
			var followResult = fn_DataAjax2( params ); 
			$('.btn_following ').text('팔로잉');
			
        }, function(){
			if ( localStorage.getItem('frontLoginIdx') == null || localStorage.getItem('frontLoginIdx') == '' ) {
				$('.prdt_main_img_badge > button:eq(0)').addClass('badge_white');
				alert('로그인후 사용가능합니다.');
	      		return location.href = '/front/account/login';
			}
			var params = new Object();
			params.status = "EDIT";
			params.query = "insertFrontFollowDataDuple";
			params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
			params.CATE_IDX = cateIdx;
			params.FOLL_USE_YN = 'N';
			var followResult = fn_DataAjax2( params ); 
			$('.btn_following ').text('팔로우');
        });
        
        var params = new Object();
        params.status = "DETAIL";
    	params.query = "selectFrontMasterDetail";
		params.CATE_IDX = cateIdx;
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
	        $('.prdt_main_img_badge > button:eq(0)').text('팔로잉');
		}
        
        var params = new Object();
        params.status = "LIST";
        params.query = "selectFrontPrdtDataList";
        params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
		params.CATE_IDX = cateIdx;

    	var noPersonalCoach = 0;
        var prdtResult = fn_DataAjax2( params ); 
        prdtResult = prdtResult.out.detail.data;

	if ('${ out.params.noready }' !== 'NOREADY' ) {
			
        if (prdtResult.length > 0) {
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
        	var PRDT_PRIC_REAL_temp = 9999999999999;
        	var prdt_select_area_element = [];
        	var psaeCnt = 0;
        	
        	// 1:1 코칭이 아무것도 없을때를 구분하기 위한 플래그
	        $.each( prdtResult,  function( k, v ){
	        	if( ( v.PRDT_CD2.indexOf('VL') + v.PRDT_CD2.indexOf('EN') ) == -2 ) {
	        		if( v.TIME_CNT > 0 ) {
	        			//처음 each돌릴 때
	    	        	if (v.PRDT_NUM == 2) {
	    		        	percentTemp = 100-Math.round( (v.PRDT_PRIC_REAL/v.PRDT_PRIC * 100) );
			        		if ( PRDT_PRIC_REAL_temp > v.PRDT_PRIC_REAL ) PRDT_PRIC_REAL_temp = v.PRDT_PRIC_REAL;
	    				}
	    	        	
	    	        	noPersonalCoach++;

    		        	console.log( percentTemp );
    		        	console.log( percent );
    		        	
	    	        	// 제일 높은 할인율
	    	        	if ( percentTemp < 100-Math.round( (v.PRDT_PRIC_REAL/v.PRDT_PRIC * 100) ) ) percentTemp = 100-Math.round( (v.PRDT_PRIC_REAL/v.PRDT_PRIC * 100) ) ;
	    				else percent = percentTemp ;
	    	        	
    		        	console.log( percentTemp );
    		        	console.log( percent );
    		        	console.log( '------------------------' );
    		        	
	    	        	// 제일 낮은 금액
	    	        	
		        		if ( PRDT_PRIC_REAL_temp > v.PRDT_PRIC_REAL ) PRDT_PRIC_REAL_temp = v.PRDT_PRIC_REAL;
// 	    	        	if ( PRDT_PRIC_REAL_temp < v.PRDT_PRIC_REAL ) PRDT_PRIC_REAL = PRDT_PRIC_REAL_temp;
// 	    				else PRDT_PRIC_REAL = v.PRDT_PRIC_REAL;

	    	        	
	    	        	//prdt_info_top 만들기
	    	        	if ( v.PRDT_TYPE == 'LIVE CLASS' ) {
	    	        		live += '<div class="prdt_info_title"><span class="tag">LIVE CLASS</span> <a href="'+v.MOVE_URL+'" class="name">'+is_too_long_word( '', v.PRDT_NM1+'', 13, 'N' )+'</a></div>';
	    				}else if ( v.PRDT_TYPE.indexOf('1:1') > -1 ) {
	    					 if (v.PRDT_TYPE == '1:1화상상담') {	 couch1 += ' 화상 /';	}
	    					 else if (v.PRDT_TYPE == '1:1채팅상담') {	couch2 += ' 채팅 /';	}
	    					 else if (v.PRDT_TYPE == '1:1이메일상담') {	 couch3 += ' 이메일 /';	}
	    				}else if ( v.PRDT_TYPE == 'VOD' ) {
	    					if( v.PRDT_VL_CHK != null )
	    						vod += '<div class="prdt_info_title"><span class="tag">VOD</span> <a href="'+v.MOVE_URL+'" class="name">'+is_too_long_word( '', v.PRDT_NM1+'', 13, 'N' )+'</a></div>';
	    				}
	    	        	
	    	        	// prdt_select_area_element 생성
	    	        	prdt_select_area_element.push( {
	    	        		  product: v.PRDT_TYPE + ' ' + substitu( v.PRDT_TIME, v.PRDT_TYPE  ),
	    	                  price: numberWithCommas( v.PRDT_PRIC ) ,
	    	                  price2: numberWithCommas( v.PRDT_PRIC_REAL )
	    	        	});
			        	
	    	        	select_prdtList_Html += '<li id="prdt'+v.PRDT_CD+'" class="m_prdt_list_item" data-val="'+psaeCnt+'" data-prdtCd="'+v.PRDT_CD2+'" data-jjim="'+v.BASK_IDX+'" >';
	    	            select_prdtList_Html += '    <strong class="m_prdt_list_title">'+prdt_select_area_element[psaeCnt].product+'</strong>';
	    	            select_prdtList_Html += '    <div class="m_prdt_list_price_area">';
	    	            select_prdtList_Html += '        <span>'+prdt_select_area_element[psaeCnt].price+'</span>';
	    	            select_prdtList_Html += '        <strong>'+prdt_select_area_element[psaeCnt].price2+'</strong>';
	    	            select_prdtList_Html += '    </div>';
	    	            select_prdtList_Html += '</li>';
	    	        	psaeCnt++;
	    	        	
			        	if( percentTemp != 0 ) if( percentTemp > percent ) percent = percentTemp;
	        		}
	        	} else {
	        		noPersonalCoach++;
	        		
		        	percentTemp = 100-Math.round( (v.PRDT_PRIC_REAL/v.PRDT_PRIC * 100) );
		        	
		        	// 제일 높은 할인율
		        	if ( percentTemp < 100-Math.round( (v.PRDT_PRIC_REAL/v.PRDT_PRIC * 100) ) ) {
		        		percentTemp = 100-Math.round( (v.PRDT_PRIC_REAL/v.PRDT_PRIC * 100) ) ;
					}else{
		        		percent = percentTemp ;
					}
		        	
		        	// 제일 낮은 금액
		        	if ( PRDT_PRIC_REAL_temp*1 > v.PRDT_PRIC_REAL*1 ) PRDT_PRIC_REAL_temp = v.PRDT_PRIC_REAL;
    	        	
		        	//prdt_info_top 만들기
		        	if ( v.PRDT_TYPE == 'LIVE CLASS' ) {
		        		live += '<div class="prdt_info_title"><span class="tag">LIVE CLASS</span> <a href="'+v.MOVE_URL+'" class="name">'+is_too_long_word( '', v.PRDT_NM1+'', 13, 'N' )+'</a></div>';
					}else if ( v.PRDT_TYPE.indexOf('1:1') > -1 ) {
						 if (v.PRDT_TYPE == '1:1화상상담') {	 couch1 += ' 화상 /';	}
						 else if (v.PRDT_TYPE == '1:1채팅상담') {	couch2 += ' 채팅 /';	}
						 else if (v.PRDT_TYPE == '1:1이메일상담') {	 couch3 += ' 이메일 /';	}
					}else if ( v.PRDT_TYPE == 'VOD' ) {
    					if( v.PRDT_VL_CHK != null )
							vod += '<div class="prdt_info_title"><span class="tag">VOD</span> <a href="'+v.MOVE_URL+'" class="name">'+is_too_long_word( '', v.PRDT_NM1+'', 13, 'N' )+'</a></div>';
					}
		        	
		        	// prdt_select_area_element 생성
		        	prdt_select_area_element.push( {
		        		  product: v.PRDT_TYPE + ' ' + substitu( v.PRDT_TIME, v.PRDT_TYPE  ),
		                  price: numberWithCommas( v.PRDT_PRIC ) ,
		                  price2: numberWithCommas( v.PRDT_PRIC_REAL )
		        	});
		        	
		        	select_prdtList_Html += '<li id="prdt'+v.PRDT_CD+'" class="m_prdt_list_item" data-val="'+psaeCnt+'" data-prdtCd="'+v.PRDT_CD2+'" data-jjim="'+v.BASK_IDX+'" >';
		            select_prdtList_Html += '    <strong class="m_prdt_list_title">'+prdt_select_area_element[psaeCnt].product.replace(' 0분','')+'</strong>';
		            select_prdtList_Html += '    <div class="m_prdt_list_price_area">';
		            select_prdtList_Html += '        <span>'+prdt_select_area_element[psaeCnt].price+'</span>';
		            select_prdtList_Html += '        <strong>'+prdt_select_area_element[psaeCnt].price2+'</strong>';
		            select_prdtList_Html += '    </div>';
		            select_prdtList_Html += '</li>';
		        	psaeCnt++;

		        	if( percentTemp != 0 ) if( percentTemp > percent ) percent = percentTemp;
	        	}
	        });

			
	        PRDT_PRIC_REAL = PRDT_PRIC_REAL_temp;
	        
	        if( noPersonalCoach > 0 ){

	        	if ( couch1 != '' || couch2 != '' || couch3 != '' ) {
	        	
			        var params = new Object();
			        params.status = "LIST";
			        params.query = "selectFrontPrdtDataCaoch";
		            params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
					params.CATE_IDX = cateIdx;
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
	        	
	        }else{
	        	$('.prdt_info_top').append( '<div style="text-align:center;">상담가능한 시간이 없습니다.</div>' );
	        	$('.prdt_info').css('pointer-events','none');
	        }
	        
	        ///  prdt_select_area 셀렉트박스 만들어주는 부분
	        for (var i = 0; i < prdt_select_area_element.length; i++) {
	        	productData.push( prdt_select_area_element[i] );
			}
	        
	        $('#selectPrdtList').append( select_prdtList_Html );
	        prdtSelectEvent();
		} else {
        	$('.prdt_info_top').append( '<div style="text-align:center;">오픈 준비중</div>' );
        	$('.prdt_info').css('pointer-events','none');
		}
   } else{
   	$('.prdt_info_top').append( '<div style="text-align:center;">오픈 준비중</div>' );
   	$('.prdt_info').css('pointer-events','none');
   }
        
        var params = new Object();
    	params.status = "LIST";
    	params.query = "selectFrontMasteropenDetail";
		params.CATE_IDX = cateIdx;
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
    	
    	setTimeout( function(){
    		prdtTabEvent();
    		$( '#now_loading' ).hide();
    	}, 2000 );
    	
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
                   '<strong class="prdt_select_title">'+data.product.replace(' 0분','')+'</strong>'+
                   '<div class="amount">'+
						'<div class="amount-control">'+ 
							vodNoCnt( data.product ) +
						'</div>'+
					'</div>' +
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
		

       $(document).on('keypress', '[name=prdt_cnt]', function(){
    	   $(this).val($(this).val());
       });
       
       $(document).on('click', '.amount-control > a', function(){
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
				
// 				$(this).siblings('input[name=prdt_cnt]').val( 1*cnt -1 );
				$(this).siblings('input[name=prdt_cnt]').attr( 'value', 1*cnt -1 );
				
				if (cnt == 2) $(this).addClass('disabled');
    		   
				// 가격도 변경
				target.children('span').text( numberWithCommas(targetprice1 * (1*cnt -1)) + ' 원' );
				target.children('strong').text( numberWithCommas(targetprice2 * (1*cnt -1)) + ' 원' );
				
				
    		}else if ($(this).hasClass('opt-cnt-plus')) {
//     		   $(this).siblings('input[name=prdt_cnt]').val( 1*cnt +1 );
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
	//            $mobileProductList.addClass('is-hide');
	           $selectContents.addClass('select-product');
	           $selectResult.html( $selectResult.html() + createSelectCard(productData[$(this).data('val')], $(this).data('val'), $(this).data('jjim') ));
	           if(DEVICE_TYPE != 'MOBILE'){
	               $select.html(productData[$(this).data('val')].product + ' ('+ productData[$(this).data('val')].price2 +')')
	           }
	           goTopInPrdt();
	           if ( prdtCd == '' || prdtCd.indexOf('COACH') > -1 ) {
		           prdtCd = $('#selectPrdtList > li.m_prdt_list_item').eq( $(this).data('val') ).data('prdtcd');
			   }else if ( prdtCd != '' && prdtCd.indexOf($('#selectPrdtList > li.m_prdt_list_item').eq( $(this).data('val') ).data('prdtcd')) == -1){
		           prdtCd += ','+$('#selectPrdtList > li.m_prdt_list_item').eq( $(this).data('val') ).data('prdtcd');
			   }
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
                   : //$mobileProductList.addClass('is-hide'); // 상품선택 O
               
               ($btnFold.hasClass('is-fold')) 
                   ? $selectContents.hide()
                   : $selectContents.show();
           }
       }).trigger('resize');
   }
    

    // 팝업 _ 달력 선택 버튼 toggle
    $('.asd_date_box button').on( 'click', function(){
        $('.asd_date_box button').removeClass('active');
        $(this).toggleClass('active');
    });
    $('.asd_time_item').on( 'click', function(){
        $('.asd_time_item').removeClass('active');
        $(this).toggleClass('active');
    });
    
    //신청하기팝업
	$('.apply_pop_btn_02').on('click', function(){
		$('#applyStep3TextPop33').hide();
		$('#applyStepPop20').hide();
		$('#applyStepPop2').hide();
        $('#applyStep2TextPop').hide();
    });
	
	// 신청하기
//     $('.prdt_apply_btn').on('click',function(){
// 		$('#applyStep1Pop').show();
		
//         var popup = $(this).data('popup');

//         popupFc(popup);
//     });
    
    // 즉시코칭가능
//     $('.badge_red').on('click',function(){
// 		$('#applyStepPop').show();
		
//         var popup = $(this).data('popup');

//         popupFc(popup);
//     });
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
	            html += '                            <img src="https://img.youtube.com/vi/'+replaceVod(v.INFO_LINK)+'/maxresdefault.jpg" alt="">';
	            html += '                        </div>';
	            html += '                        <div id="videos'+k+'" class="yotube" data-url="'+replaceVod(v.INFO_LINK)+'"> </div>';
				}else if ( v.INFO_PLAYER == 'PLAY02'  ) {
					var infoLink = "";
					infoLink = v.INFO_LINK.replace('https://tv.naver.com/v/','').split('/')[0];

					html += "<iframe src='https://tv.naver.com/embed/"+infoLink+"?autoPlay=true' frameborder='no' scrolling='no' marginwidth='0' marginheight='0' WIDTH='544' HEIGHT='306' allow='autoplay' allowfullscreen></iframe>";
				}else if ( v.INFO_PLAYER == 'PLAY03'  ) {
					html += '<iframe src="https://player.yozii.com/fiveplayer/fiveplayer-streaming.php?token='+v.PLAYER_URL+'" allowfullscreen></iframe>';
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
	            html += '                    <strong style="color:'+v.INFO_TITL_COLR+';    font-size: 20px;">'+v.INFO_TITL+'</strong>';
	            html += '                    <strong style="font-size:20px;">'+v.INFO_TITL_SUB+'</strong>';
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
    			
//     			html += '<section class="section_prdt" data-idx="1">';
    			html += '<section class="section_prdt" >';
	            html += '    <div class="section_inner">';
	            html += '        <div class="prdt_layout">';
	            html += '            <div class="prdt_contents">';
// 	            html += '                <h3 class="prdt_section_title">서비스소개</h3>';
	            html += '                <h3 class="prdt_section_title" style="color:'+v.INFO_TITL_COLR+'">'+v.INFO_TITL+'</h3>';
	            html += '                <div class="prdt_detail" style="white-space: pre-line;">';
	            html += '                    <strong style="font-size:20px;">'+v.INFO_TITL_SUB+'</strong>';
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

//     			html += '<section class="section_prdt" data-idx="1">';
    			html += '<section class="section_prdt" >';
	            html += '    <div class="section_inner">';
	            html += '        <div class="prdt_layout">';
	            html += '            <div class="prdt_contents">';
// 	            html += '                <h3 class="prdt_section_title">서비스소개</h3>';
	            html += '                <h3 class="prdt_section_title" style="color:'+v.INFO_TITL_COLR+'">'+v.INFO_TITL+'</h3>';
	            html += '                <div class="prdt_detail" style="white-space: pre-line;">';
	            html += '                    <strong style="font-size:20px;">'+v.INFO_TITL_SUB+'</strong>';
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

//     				html_INF05 += '<section class="section_prdt" data-idx="1">';
        			html_INF05 += '<section class="section_prdt" >';
    				html_INF05 += '    <div class="section_inner">';
    				html_INF05 += '        <div class="prdt_layout">';
    				html_INF05 += '            <div class="prdt_contents">';
    				html_INF05 += '                <h3 class="prdt_section_title">추천대상</h3>';
    				html_INF05 += '                <div class="prdt_detail" style="white-space: pre-line;">';
    				html_INF05 += '                    <strong style="color:'+v.INFO_TITL_COLR+'">'+v.INFO_TITL+'</strong>';
    				
    				html_INF05 +=	'    <ul class="mdc_info_list">';
    				html_INF05 +=	'        <li class="mdc_info_item">';
    				html_INF05 +=	'            <span class="mdc_thumb" style="background-image: url('+$('#imgTag').val()+');"></span>'; //추천대상
    				html_INF05 +=	'            <div class="mdc_il_box phones_mdc_il_box">';
    				html_INF05 +=	'                <span class="mdc_il_q">'+v.INFO_TITL_SUB+'</span>';
    				html_INF05 +=	'                <p class="mdc_il_a">'+v.INFO_CNTN;
    				html_INF05 +=	'                </p>';
    				html_INF05 +=	'            </div>';
    				html_INF05 +=	'        </li>';
    				
    				INF05_CNT++;
    			}else if (INF05_CNT == 1) {
    	
    				html_INF05 += '        <li class="mdc_info_item">';
    				html_INF05 += '            <span class="mdc_thumb" style="background-image: url('+$('#imgTag').val()+');"></span>'; //상담진행
    				html_INF05 += '            <div class="mdc_il_box phones_mdc_il_box">';
    				html_INF05 += '                <span class="mdc_il_q">'+v.INFO_TITL_SUB+'</span>';
    				html_INF05 += '                <p class="mdc_il_a">'+v.INFO_CNTN;
    				html_INF05 += '                </p>';
    				html_INF05 += '            </div>';
    				html_INF05 += '        </li>';
    				
    				INF05_CNT++;
    			}else if (INF05_CNT == 2) {
    	
    				html_INF05 += '        <li class="mdc_info_item">';
    				html_INF05 += '            <span class="mdc_thumb" style="background-image: url('+$('#imgTag').val()+');"></span>'; //활용법
    				html_INF05 += '            <div class="mdc_il_box phones_mdc_il_box">';
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
    	
    	
    }
    
    function makeReview( reviewList ){
    	
    	$('.rpdt_review').empty();
    	
    	var html = '';
    	
    	$('.rpdt_review').siblings('h3.prdt_section_title').find('span').text( '(' + reviewList.length + ')' );
    	
    	html += '<ul>';
    	
    	$.each( reviewList, function( k, v ){

    		html += '<li class="rpdt_reivew_card '+ (k > 2? "reviewHide":"") +' ">';
		    html += '    <div class="rpdt_review_info">            ';
		    html += '        <div class="rpdt_review_info_title">['+v.PRDT_TYPE+']<br>'+v.PRDT_NM+'</div>     ';
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
    	
    	html += '</ul>';    	
    	if ( reviewList.length == 0 ) {
    		html = '<ul><li class="rpdt_reivew_card"><div class="rpdt_review_textarea">리뷰가 없습니다.</div></li></ul>'
	    	$('.rpdt_review').append( html );
		}else{
	    	$('.rpdt_review').append( html );
			if( reviewList.length > 0 ) {
				html = '<button type="button" class="rpdt_review_btn_more">리뷰더보기</button>';
		    	$('.rpdt_review').append( html );
		        
		        // 리뷰 더보기
		        $('.rpdt_review_btn_more').on('click', function(){
//		     		for (var i = 0; i < 5; i++) {
//		         		$('.reviewHide:eq(0)').removeClass('reviewHide');
//		     		}
//		     		if ( $('.reviewHide').length == 0 )	$(this).hide();
// 		    		window.open('about:blank').location.href="/front/master/review";
					localStorage.setItem('masterCate', cateIdx );
		    		location.href = "/front/master/review";
		        });
		        
			}
		}
    }


    //신고팝업
    $(document).on('click','.btn_eclaration',function(){
    	if (typeof localStorage.getItem('frontLoginIdx') == 'undefined' || localStorage.getItem('frontLoginIdx') == '' || localStorage.getItem('frontLoginIdx') == null) {
			return alert('신고기능은 회원만 가능합니다.');
		}
    	
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
	  if (REVI_TEMP == '') { return alert('리뷰정보를 가져오는데 실패했습니다. 잠시후 다시 시도해 주세요.'); };
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
  
  
  function makeRecom(){
      var params = new Object();
      params.status = "LIST";
      params.query = "selectFrontRecommendProductList";
      params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
	  params.CATE_IDX = cateIdx;
      params.userCateLog = sessionStorage.getItem('userCateLog').slice( 0 ,sessionStorage.getItem('userCateLog').length-1 );
	  
      var recommResult = fn_DataAjax2( params, 'RECOMMEND' );
	  var html = "";
	  
	  if ( recommResult.out.detail.data.length > 0 ) {
		  $('#recommend_li').empty();
		  
	      $.each( recommResult.out.detail.data, function( k, v ){
	    	  
	    	  setUuid(v.INFO_TUMB_UUID);
	  		
	  		  unit_fileGet( "INFO_TUMB_UUID_FILE" , "fn_fileUpload");
	  		
	    	  html += '<li>';
		      html += '    <a href="'+v.MOVE_URL+'" >';
		      html += '        <div class="prdt_recommend_card">';
		      html += '            <div class="prdt_recommend_img-area">';
		      if ( v.INFO_TUMB_UUID != null ) {
					if ( v.INFO_TUMB_UUID != '' ) {
						if ( v.INFO_TUMB_UUID != undefined ) {
							html += '				<img  class="prdt_recommend_img" src="'+$('#imgTag').val()+'" alt="">';
						}else html += '				<img class="prdt_recommend_img" src="/resources/assets/images/sub/profile_default_img.png" alt="">';
					}else html += '				<img class="prdt_recommend_img" src="/resources/assets/images/sub/profile_default_img.png" alt="">';
				}else html += '				<img class="prdt_recommend_img" src="/resources/assets/images/sub/profile_default_img.png" alt="">';
		      
		      html += '            </div>';
		      html += '            <div class="prdt_recommend_info">';
		      html += '                <span>['+v.PRDT_TYPE+'] '+v.P_CODE_NM+' · '+v.USER_NM+'</span>';
		      html += '                <p>'+is_too_long_word( v.INFO_PRDT_TITL1+'', v.INFO_PRDT_TITL2+'', 13, 'Y' )+'</p>';
		      html += '                <div class="prdt_recommend_price_area">';
		      html += '                    <span class="price">'+numberWithCommas(v.PRDT_PRIC)+' 원</span>';
		      
		      html += '                    <span class="sale" style="color: #f44242;font-size: 14px;font-weight: 600;">'+(100-Math.round( v.PRDT_PRIC_REAL.replace(/,/g,'')*1 / v.PRDT_PRIC.replace(/,/g,'')*1 * 100 ) )+'%</span>';
		      
		      html += '                    <strong class="pay"><span>'+numberWithCommas( v.PRDT_PRIC_REAL )+'</span> 원</strong>';
		      html += '                </div>';
		      html += '            </div>';
		      html += '        </div>';
		      html += '    </a>';

			  if ( v.BASK_IDX != 0 ) {
		      html += '                <button id="JJIM'+v.JJIM_IDX+'" PRDT_CD="recom'+v.PRDT_CD+'" type="button" class="like_btn toggle_btn active is-active"></button>';
			  }else{
		      html += '                <button type="button" PRDT_CD="recom'+v.PRDT_CD+'" class="NOJJIM like_btn toggle_btn"></button>';
			  }
			  
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
	        		
	        		var bask_prdt_cd = $(this).attr('PRDT_CD').replace( 'recom', '' );
	        		
	        		if( $(this).hasClass('NOJJIM') ){
	        			
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
		      	  	  	
		      		}else{
		      			
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
			if ( PRDT_TYPE == 'LIVE CLASS' ) {
				if (1*PRDT_TIME == 0) {
					return '';
				}else{
					return 1*PRDT_TIME+'분';
				}
			}else{
				return 1*PRDT_TIME+'분';
			}
		}
  }
  
$('.like_btn_master').click(function(){
	
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
		
	} else if ( ! $('.prdt_select_result > div.prdt_select_item').length ) {
		event.stopPropagation();
		event.stopImmediatePropagation();
		$(this).removeClass('active is-active'); 
		alert('상품을 선택해주세요');
		
  	} else {
  		var params = new Object();
  		params.status = "EDIT";
  		params.query = "updateFrontJjimData";
       	params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
       	params.BASK_PRDT_CD = $('#selectPrdtList > li.m_prdt_list_item').eq( $('div.prdt_select_result > div.prdt_select_item').data('val') ).data('prdtcd');
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
  	
//   	$('.m_prdt_fold_contents').hide();
});

function fn_LikeBtn( RETURN ){
    // 찜
    clickToggleClassPopupEvent('.like_btn',{
        popupType : 'confirm',
        popupMsg: '찜 목록에 추가되었습니다. <br> 찜 내역으로 이동하시겠습니까?',
        beforePopup: function(thisBtn){
           	if( RETURN ) return 'ALERT'; 
           	else return 'NOALERT';
        }
    });
}


$('.prdt_basket_btn').click(function(){
	
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
		
	} else if ( ! $('.prdt_select_result > div.prdt_select_item').length ) {
		event.stopPropagation();
		event.stopImmediatePropagation();
		$(this).removeClass('active is-active'); 
		alert('상품을 선택해주세요');
		
  	} else {
  		
  		$('.prdt_select_item').each(function( k, v ){
  			
  		
	  		var params = new Object();
	  		params.status = "DETAIL";
	  		params.query = "selectFrontBaskData";
	       	params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
// 	       	params.BASK_PRDT_CD = $('#selectPrdtList > li.m_prdt_list_item').eq( $('div.prdt_select_result > div.prdt_select_item').data('val') ).data('prdtcd');
	       	params.BASK_PRDT_CD = $('#selectPrdtList > li.m_prdt_list_item').eq( $(this).data('val') ).data('prdtcd');
	       	params.BASK_CNT = $(this).find('[name=prdt_cnt]').val();
	  		params.CATE_IDX = cateIdx;
			params.BASK_TYPE = 'B';
	  		
			var selectResult = fn_DataAjax2( params ); 
	  		
	//   		var params = new Object();
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
	  			if( selectResult.out.detail.data[0].BASK_USE_YN == 'Y' ){
			  		// 장바구니에 있다면
	// 				alert('이미 장바구니에 있는 상품입니다.');
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
  		RETURN = 1;
  		
  	  	fn_baskBtn( RETURN );
  	}
    
});

function fn_baskBtn( RETURN ) {
  clickPopupEvent('.prdt_basket_btn',{
      popupType : 'confirm',
      popupMsg: '선택한 상품을 장바구니에 담았습니다. <br> 장바구니 내역으로 이동하시겠습니까?',
      beforePopup: function(thisBtn){
       	if( RETURN ) return 'ALERT';
       	else return 'NOALERT';
      } 
  });
  
  $('.btn-confirm-popup-alert').on('click',function(){
	  location.href = "/front/mypage/cart";
  });
  
}

function fn_RecoLikeBtn( RETURN ) {
    // 추천상품의 찜
    clickToggleClassPopupEvent('.like_btn',{
        popupType : 'confirm',
        popupMsg: '찜 목록에 추가되었습니다. <br> 찜 내역으로 이동하시겠습니까?',
        beforePopup: function(thisBtn){
           	if( RETURN ) return 'ALERT'; 
           	else return 'NOALERT';
        }
    });
} 

// 리뷰 정렬
function review_sort( sort ){
	var params = new Object();
	params.status = "LIST";
	params.query = "selectFrontReviewList";
	params.CATE_IDX = cateIdx;
	params.sort = sort;
	var reviewResult = fn_DataAjax2( params ); 
	var reviewList = reviewResult.out.detail.data;
	
	makeReview( reviewList );
}

$('.revisort').on('click', function(){
	$( '.revisort' ).removeClass('active');
	this.classList.add('active');
});


$(document).on('click', '.type1 .btn-confirm-popup-alert', function(){
	location.href='/front/mypage/cart';
});


</script>
