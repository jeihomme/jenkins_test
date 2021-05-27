<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<%-- <c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" /> --%>
<c:set var="ajaxUrl" value="/front/main/ajax" />
<style>
	.movie{display: none;}
	#mainPop{display:block;}
	.mc_follow_btn {
    width: 90px;
    height: 43px;
    color: #ff8939;
    background-color: #333;
    border: 2px solid #333;
    border-radius: 4px;
    font-size: 19px;
    font-weight: 500;
    vertical-align: top;
}
.follow_btn.active {
    background-color: #fff;
    border-color: #ff8939;
}

/* 슬라이드 css */
/* .mdPick button.slick-prev{ position: relative;left: 1100px}
.mdPick button.slick-next{ transform: translateY(-50%) rotate(180deg);position: relative;bottom: 435px;left: 1120px;}
.mdPick button.slick-arrow.slick-disabled {opacity: .5;cursor: auto;} 210520 수정 */
.mdPick button.slick-arrow{position: absolute; top: -68px; width: 48px !important; height: 48px !important; -webkit-background-size: 30% 50%; background-size: 30% 50%; border: 1px solid #444;}
.mdPick button.slick-prev{right: 80px;}
.mdPick button.slick-next{transform: rotate(180deg); right: 25px;}
.mdPick button.slick-arrow.slick-disabled {opacity: .5;cursor: auto;}
/* 210520 추가 */
@media (max-width: 800px){
	.mdPick button.slick-arrow{display: none !important;}
}

.timeDeal button.slick-prev{ position: relative;left: 1100px}
.timeDeal button.slick-next{ transform: translateY(-50%) rotate(180deg);position: relative;bottom: 435px;left: 1120px;}
.timeDeal button.slick-arrow.slick-disabled {opacity: .5;cursor: auto;}
.timeDeal button.slick-arrow{width: 25px !important;height: 30px !important;}

.mf_thumb button.timeDealDay{
    position: relative;
	bottom: 30px;
	height: 20px;
    border-radius: 40px;
    width: 70px;
    background-color: #aa00ff;
    color: white;}
.mf_thumb button.timeDealTime{
    position: relative;
    bottom: 25px;
    height: 20px;
    border-radius: 40px;
    width: 140px;
    left: 60px;
    background-color: black;
    color: white;
    text-align: end;}
    
.not_open_over8, .open_over8 { display: none; }
.noneMasterDiv{text-align: center;margin: 90px;}
.noneMaster{font-size:20px;color:#27f1d5;}

/* .mf_thumb{border-radius: 5%;} 210520 수정 */
.mf_thumb{border-radius: 8px;}
</style>


    <div id="container">
        <div class="main_visual">
            <div class="mv_slider"></div><!-- 그라데이션 시작 색상, 종료 색상을 입력하면 변경됩니다. -->
            <div class="mv_color">
                <div class="mv_color_before"></div>
                <div class="mv_color_after"></div>
            </div>
        </div>

        <div class="main_master main_section">
            <div class="section_inner">
                <h3 class="section_title">지금 바로 코칭 가능한 마스터</h3>
                <div class="mm_slider">
                </div>
            </div>
        </div>

        <div class="main_timedeal  main_section"> <!-- main_none -->
           	<h3 class="section_title">TIME DEAL</h3>
            <div class="section_inner timeDeal phones_timeDeal">
            </div>
        </div>

        <div class="main_mdpick  main_section"> <!-- main_none -->
           	<h3 class="section_title">MD's Pick</h3>
            <div class="section_inner mdPick phones_mdPick">
            </div>
        </div>

        <!-- <div class="mf_cate_box" style="    padding-top: 120px;padding-left: 30px;">
            <ul class="main_tab_lists main_tab_lists_c"></ul>
        </div> 210520 위치변경 -->
                
        <div class="main_find main_section">
            <div class="section_inner">

                <h3 class="section_title">나를 위한 마스터를 찾아보세요</h3>

                <div class="mf_cate_box">
		            <ul class="main_tab_lists main_tab_lists_c"></ul>
		        </div>

                <div class="mf_item_box">
                    <div class="mf_item_list ready"></div>
                </div>

            </div>
        </div>

        <div class="main_service">
            <div class="section_inner">
                <div class="ms_slide"></div>
            </div>
        </div>

        <div class="main_find  main_section"> <!-- main_none -->
            <div class="section_inner">
                <h3 class="section_title">오픈 준비 중이에요</h3>

                <div class="mf_item_box">
                    <div class="mf_item_list notReady"></div>
                </div>
            </div>
        </div>
    </div><!-- // #container -->

   <div class="float_btn_box">
        <button type="button" class="float_btn float_btn_chat"></button>
        <button type="button" class="float_btn float_btn_top"></button>
    </div> 
<script>
	var chk = 0;
   	var BNN02_keyColor = [];
	var BNN03_keyColor = [];
	var coachingData = '';
	
	// 손으로 잡아 움직이는 슬라이드 스크롤 바 in PC
	const slider = document.querySelector('.main_tab_lists_c');
	let isMouseDown = false;
	let startX, scrollLeft;
	
	$(slider).mousedown(function(e){
		isMouseDown = true;
		$(this).addClass('active');
		
		startX = e.pageX - slider.offsetLeft;
		scrollLeft = slider.scrollLeft;
// 		console.log( startX );
// 		console.log( scrollLeft );
	});

	$(slider).mouseleave(function(){
		isMouseDown = false;
		$(this).removeClass('active');
	});
	
	$(slider).mouseup(function(){
		isMouseDown = false;
		$(this).removeClass('active');
	});
	
	$(slider).mousemove(function(e){
		if( !isMouseDown ) return;		
		
		e.preventDefault();
		const x = e.pageX - slider.offsetLeft;
		const walk = ( x - startX ) * 1;
		this.scrollLeft = scrollLeft - walk;
		
// 		console.log( x );
// 		console.log( walk );
// 		console.log( this.scrollLeft );
	} );
	
// 	slider.addEventListener( 'mousedown', (e) => {
// 		isMouseDown = true;
// 		console.log( slider.calssList );
// 		slider.calssList.add('active');
		
// 		startX = e.pageX - slider.offsetLeft;
// 		scrollLeft = slider.scrollLeft;
// 	} );
	
// 	slider.addEventListener( 'mouseleave', ( ) => {
// 		isMouseDown = false;
// 		slider.classList.remove('active');
// 	} );
	
// 	slider.addEventListener( 'mouseup', ( ) => {
// 		isMouseDown = false;
// 		slider.classList.remove('active');
// 	} );

// 	slider.addEventListener( 'mousemove', (e) => {
// 		if( !isMouseDown ) return;		
		
// 		e.preventDefault();
// 		const x = e.pageX - slider.offsetLeft;
// 		const walk = ( x - startX ) * 1;
// 		slider.scrollLeft = scrollLeft - walk;
		
// 	} );
	
	
	$(function(){
// 		배너 쿼리 출력
		fn_BannList( document.body.offsetWidth );

//		모바일 유무에 따른 화면 CSS구성 재정의
		$(window).on('resize', function(){
			$('.mv_slider').slick('unslick');
			$('.mv_slider').empty();
		
			$('.ms_slide').slick('unslick'); 
			$('.ms_slide').empty();
			
			fn_BannList( document.body.offsetWidth );
		});
		
		$( '#now_loading' ).hide();
		
		setTimeout(function(){
//	 		1. 바로코칭가능상품 쿼리 출력
			fn_CoachNow();
			setTimeout(function(){
//		 		2. 카테고리 쿼리 출력
				fn_CategoryList();
				
				setTimeout(function(){
//			 		3. MD's Pick
					fn_MdpickList();
					fn_TimedealList();
					
					setTimeout(function(){
//				 		4. 준비완료/준비중 마스터 쿼리 출력
						fn_BtnChangeList("");
						chk = 1;
						
					}, 200);
					
				}, 200);
				
			}, 200);
			
		}, 200);
		
		
		setTimeout( function(){ prdtTabEvent();  }, 2000 );
		
		
    });
	
	//마스터 카테고리 버튼 select
	$('.mf_cate_btn').on('click', function(){
		$(this).addClass('active').parent('li').siblings().children('.mf_cate_btn').removeClass('active');
	});

	// 게시물 8개만 보여주고 더보기버튼 눌렀을때 8개씩 보여주기
	$(document).on('click', '.more_btn', function(){
		if ( this.value == 'not_open_over8' ) {
			for (var i = 0; i < 8; i++) {
				$('.not_open_over8').eq( 0 ).removeClass('not_open_over8');			
			}
			if ( $('.not_open_over8').length == 0 ) 
				$(this).remove();
		}else if( this.value == 'open_over8' ){
			for (var i = 0; i < 8; i++) {
				$('.open_over8').eq( 0 ).removeClass('open_over8');			
			}
			if ( $('.open_over8').length == 0 ) 
				$(this).remove();
		}
	});

	$(document).ready(function(){
	    $(".prdt_tab_lists").slick({
	        slidesToScroll: 3,
	        variableWidth: true,
	        autoplay: false,
	        infinite: false,
	        dots: false,
	        arrows: false
	    });
	});
	
	// 공.통.으.로 하.지 마.시.오.
	// 마스터 홈이랑 조건 달라서 에러남
    //팔로잉 관련 코드 여기에
    follow_btnEvent(function( val ){
			if ( localStorage.getItem('frontLoginIdx') == null || localStorage.getItem('frontLoginIdx') == '' ) {
				$('.follow_btn[value="'+val+'"]').removeClass('active');
				alert('로그인 후 사용가능합니다.');
				return location.href = "/front/account/login";
			} 
			var params = new Object();
			params.status = "EDIT";
			params.query = "insertFrontFollowDataDuple";
			params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
			params.CATE_IDX = val;
			params.FOLL_USE_YN = 'Y';
			var followResult = fn_DataAjax2( params ); 
    }, function( val ){
			if ( localStorage.getItem('frontLoginIdx') == null || localStorage.getItem('frontLoginIdx') == '' ) {
				$('.follow_btn[value="'+val+'"]').removeClass('active');
				alert('로그인 후 사용가능합니다.');
				return location.href = "/front/account/login";
			}
			var params = new Object();
			params.status = "EDIT";
			params.query = "insertFrontFollowDataDuple";
			params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
			params.CATE_IDX = val;
			params.FOLL_USE_YN = 'N';
			var followResult = fn_DataAjax2( params ); 
    });

    function fn_BannList( size ){
    	
       	var params = new Object();
       	params.status = "LIST";
       	params.query = "selectFrontBannList";
       	
       	var jsonDetail = fn_DataAjax2( params );
       	jsonDetail = jsonDetail.out.detail.data;
       	
       	var inTagBNN01 = '';
       	var inTagBNN02 = '';
       	var inTagBNN03 = '';
       	var color = '';
       	var inTagCoaching = '';
       	
       	if( jsonDetail.length > 0 ) {
       		
       		$.each(jsonDetail,function(key,val){
       			
          			if( val.BANN_TYPE == 'BNN01') {

              			bannerType = val.BANN_TYPE;
              			
          				if( size < 600 ) {
              				imgIdValue = val.BANN_UUID_MOBI_NM;
              				setUuid(val.BANN_UUID_MOBI);
              				unit_fileGet( val.BANN_UUID_MOBI_NM+'_FILE' , "fn_fileUpload");
          				} else {
              				imgIdValue = val.BANN_UUID_WEB_NM;
              				setUuid(val.BANN_UUID_WEB);
              				unit_fileGet( val.BANN_UUID_WEB_NM+'_FILE' , "fn_fileUpload");
          				}
          				
          				$(".topbar").css({'background':'url('+$('#imgTag').val()+') center center / cover no-repeat'});
          				$(".topbar").css({'background-color':''+val.BANN_CLR+''});
          				$(".topbar").attr('onclick', 'location.href="'+val.BANN_LINK+'";');
          				
          			} else if( val.BANN_TYPE == 'BNN02') {
          				BNN02_keyColor.push( val.BANN_CLR );
              			bannerType = val.BANN_TYPE;
              			
          				if( size < 800 ) {
              				imgIdValue = val.BANN_UUID_MOBI_NM;
              				setUuid(val.BANN_UUID_MOBI);
              				unit_fileGet( val.BANN_UUID_MOBI_NM+'_FILE' , "fn_fileUpload");
          				} else {
              				imgIdValue = val.BANN_UUID_WEB_NM;
              				setUuid(val.BANN_UUID_WEB);
              				unit_fileGet( val.BANN_UUID_WEB_NM+'_FILE' , "fn_fileUpload");
          				}
          				
          				inTagBNN02 += '<div class="mv_slider_item">';
          				inTagBNN02 += '		<a href="'+val.BANN_LINK+'">';
          				inTagBNN02 += '	<div class="mv_slider_inner" style="background-image: url('+$('#imgTag').val()+');" data-start="'+val.BANN_CLR+'" data-end="">';
          				inTagBNN02 += '			<div class="mv_title_box">';
          				inTagBNN02 += '				<h2 class="mv_title">';
          				inTagBNN02 += '					'+val.BANN_TITL1+'';
          				inTagBNN02 += '					<br>';
          				inTagBNN02 += '					'+val.BANN_TITL2+'';
          				inTagBNN02 += '				</h2>';
          				inTagBNN02 += '				<p class="mv_text">';
          				inTagBNN02 += '					'+val.BANN_SUBT1+'';
          				inTagBNN02 += '					<br>';
          				inTagBNN02 += '					'+val.BANN_SUBT2+'';
          				inTagBNN02 += '				</p>';
          				inTagBNN02 += '			</div>';
          				inTagBNN02 += '	</div>';
          				inTagBNN02 += '		</a>';
          				inTagBNN02 += '</div>';
          				
          			} else if( val.BANN_TYPE == 'BNN03') {
          				BNN03_keyColor.push( val.BANN_CLR );
              			bannerType = val.BANN_TYPE;
              			
          				if( size < 900 ) {
              				imgIdValue = val.BANN_UUID_MOBI_NM;
              				setUuid(val.BANN_UUID_MOBI);
              				unit_fileGet( val.BANN_UUID_MOBI_NM+'_FILE' , "fn_fileUpload");
          				} else {
              				imgIdValue = val.BANN_UUID_WEB_NM;
              				setUuid(val.BANN_UUID_WEB);
              				unit_fileGet( val.BANN_UUID_WEB_NM+'_FILE' , "fn_fileUpload");
          				}
          				
          				inTagBNN03 += '	<div class="ms_item">';
          				inTagBNN03 += '			<a href="'+val.BANN_LINK+'">';
          				inTagBNN03 += '		<div class="ms_box" style="background-image: url('+$('#imgTag').val()+');" >';
          				inTagBNN03 += '		</div>';
          				inTagBNN03 += '			</a>';
          				inTagBNN03 += '	</div>';
    			}
       		});

    		$('.mv_slider').append( inTagBNN02 );
    		$('.ms_slide').append( inTagBNN03 );
       		
       		$.each(BNN02_keyColor,function(key,val){
       			if( key == 0 ) color = val;
       			
      				if( BNN02_keyColor[key+1] == null ) $('.mv_slider_inner').eq(key).attr( 'data-end', color );
      				else $('.mv_slider_inner').attr( 'data-end', BNN02_keyColor[key+1] );
       		});

       		$('.ms_item.slick-slide').each(function(){
       			if( ! $(this).hasClass('slick-cloned') ) {
       				if( ! $(this).hasClass('slick-acvice') ) {
             		$('.main_service').animate( {
             			"background-color": BNN03_keyColor[($(this).index()-1)]
             		  }, 3000, 'swing' );
       				}
       			}
       		});
       	}
       	
       	fn_MainSlide();
       	fn_MiddleSlide();
    }
    
	
	function fn_CoachNow(){
		var right_now_coach = new Object();
		right_now_coach.status = "LIST";
		right_now_coach.query = "selectRightNowCoachTime";

		var right_now_coach_detail = fn_DataAjax2( right_now_coach );
		var inTagCoaching = '';
		
		if ( right_now_coach_detail.out.detail.data.length > 0 ) {
			
	    	$.each(right_now_coach_detail.out.detail.data, function(key, val){
				if( val.PRDT_TYPE != null ) {
					if( val.PRDT_TYPE != 'VOD' ) {
						if( val.PRDT_CD.indexOf('VL') < 0 && val.PRDT_CD.indexOf('EN') < 0 ) { 
							
							var MOVE_URL = val.MOVE_URL.replace('/front/master/detail','/front/prdt/detail');
		      				setUuid( val.USER_UUID );
		      				unit_fileGet( val.USER_UUID_NM + '_FILE' , "fn_fileUpload");
		      				
				    		inTagCoaching += '	<div class="mm_item"  >';
				    		inTagCoaching += '<a href="'+MOVE_URL+'" onclick="localStorage.setItem(\'nowType\', \''+val.PRDT_CD+'\' )">';

				    		if ( val.USER_UUID != null && val.USER_UUID != '' && val.USER_UUID != undefined ) {
					    		inTagCoaching += '			<div class="mm_img" style="background-image: url('+$('#imgTag').val()+');"></div>';
							}else{
					    		inTagCoaching += '			<div class="mm_img" style="background-image: url(/resources/assets/images/sub/profile_default_img.png);"></div>';
							}
				    		$('#imgTag').val('');
							if( val.PRDT_CD.indexOf('CN') > -1 ) inTagCoaching += '<span class="mm_cate">1:1 채팅</span>';
							if( val.PRDT_CD.indexOf('FN') > -1 ) inTagCoaching += '<span class="mm_cate">1:1 화상</span>';
							if( val.PRDT_CD.indexOf('LN') > -1 ) inTagCoaching += '<span class="mm_cate">LIVE CLASS</span>';
							
				    		inTagCoaching += '			<span class="mm_name">';
				    		inTagCoaching += '				<span>'+val.P_CODE_NM+'</span>';
				    		inTagCoaching += '				·';
				    		inTagCoaching += '				<span>'+val.USER_NM+'</span>';
				    		inTagCoaching += '			</span>';
				    		
				    		
				    		
				    		inTagCoaching += '			<span class="mm_date">'+val.TIME_TIM+'</span>';
				    		inTagCoaching += '		</a>';
				    		inTagCoaching += '	</div>';
						}
					}
				}
	    	});
    	
			$('.mm_slider').append( inTagCoaching );
	    	fn_CoachSlide();
		}else{
			$('.main_master.main_section').remove();
// 			inTagCoaching += '<div class="noneMasterDiv"><a href="javascript:;" class="noneMaster">해당 카테고리에 준비된 마스터가 없습니다.</a></div>';
// 			$('.mm_slider').append( inTagCoaching );
		}
	}
	
	function fn_CategoryList() {
		var params = new Object();
		params.status = "CODE";
		params.parentCode = "";
		params.code = 'CAT';
		params.query = "selectCode";
		
		var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
		var jsonData = result.out.detail.data;
		var inTag = '';
		
		if( jsonData.length > 0 ) {
			
			inTag += '<li  class="main_tab main_tab_c"><a class="is-active" onclick="fn_BtnChangeList(\'\');">전체</a></li>';
			
			$.each(jsonData, function(key, val){
				inTag += '<li  class="main_tab main_tab_c" ><a onclick="fn_BtnChangeList(\''+val.CODE_NM+'\');">'+val.CODE_NM+'</a></li>';
			});
			
			$('.main_tab_lists').append( inTag );
			

		    $('.main_tab_c a').on('click', function(){
		        $(this).addClass('active is-active').parent('li').siblings().children('.main_tab_c a').removeClass('active is-active');
		    });
		}
	}

	function fn_BtnChangeList( SEARCH_VAL ){
		
		var params = new Object();
		params.status = "LIST";
		params.query = "selectFrontMainList";
		params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
		params.SEARCH_VAL = SEARCH_VAL;
		
		if ( SEARCH_VAL == '' ) 
			fn_DataList( params, "dataList", 7 , 'ONLOAD' ); // 
		else
			fn_DataList( params, "dataList", 7  );
	}

	function fn_DataList( PARAMS, OBJECT_ID, CNT, ONLOAD ) {
		var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
		var jsonData = result.out.detail.data;
		var inTag = '';
		
		if( chk == 0 ) coachingData = jsonData;

		$('.ready').empty();
		if ( ONLOAD == 'ONLOAD' ) {
			$('.notReady').empty();
		}
		
// 		var params = new Object();
// 		params.query = "selectFrontMainMasterTimeCnt";
// 		params.status = "LIST";
// 		params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
		
// 		var masterTimeCntResult = fn_DataAjax2( params );
// 		masterTimeCntResult = masterTimeCntResult.out.detail.data;
		
// 		var hasTimeList = [];
// 		var temparr = [];
// 		var temp_SALE_PRDT_CD = [];
// 		var temp_SALE_PRDT_CD_temp = '';
		
// 		// 1:1 코칭들이 중복되어 들어가지 않게 하는 값
// 		var haveCode = '';
		
// 		$.each( masterTimeCntResult.out.detail.data, function( mkey, mval ){
// 			$.each( jsonData, function( jkey, jval ){
// 				if ( mval.CATE_IDX == jval.CATE_IDX ) {
// 					temp_SALE_PRDT_CD_temp = '';
// 					$.each( jval.PRDT_CD.split(','), function( jsplitkey, jsplitval ){
						
// 						if ( jsplitval.indexOf('CN') > -1 ) {
// 							if ( mval.TIME_CNT.split(',')[jsplitkey] > 0 ) {
// 								if ( haveCode.indexOf( jval.CATE_IDX ) == -1 ) {
// 									haveCode += jval.CATE_IDX+',';
// 									temparr.push(jval);
// 								}
// 								temp_SALE_PRDT_CD_temp += 'CN,';
// 							}
// 						}
// 						if ( jsplitval.indexOf('EN') > -1 ) {
// 							if ( haveCode.indexOf( jval.CATE_IDX ) == -1 ) {
// 								haveCode += jval.CATE_IDX+',';
// 								temparr.push(jval);
// 							}
// 							temp_SALE_PRDT_CD_temp += 'EN,';
// 						}
// 						if ( jsplitval.indexOf('FN') > -1 ) {
// 							if ( mval.TIME_CNT.split(',')[jsplitkey] > 0 ) {
// 								if ( haveCode.indexOf( jval.CATE_IDX ) == -1 ) {
// 									haveCode += jval.CATE_IDX+',';
// 									temparr.push(jval);
// 								}
// 								temp_SALE_PRDT_CD_temp += 'FN,';
// 							}
// 						}
// 						if ( jsplitval.indexOf('LN') > -1 ) {
// 							if ( mval.TIME_CNT.split(',')[jsplitkey] > 0 ) {
// 								if ( haveCode.indexOf( jval.CATE_IDX ) == -1 ) {
// 									haveCode += jval.CATE_IDX+',';
// 									temparr.push(jval);
// 								}
// 								temp_SALE_PRDT_CD_temp += 'LN,';
// 							}
// 						}
// 						if ( jsplitval.indexOf('VL') > -1 ) {
// 							if ( haveCode.indexOf( jval.CATE_IDX ) == -1 ) {
// 								haveCode += jval.CATE_IDX+',';
// 								temparr.push(jval);
// 							}
// 							temp_SALE_PRDT_CD_temp += 'VL'+jval.CATE_IDX+',';
// 						}
						
// 					} ); 
// 					temp_SALE_PRDT_CD.push(temp_SALE_PRDT_CD_temp);
// 				}
				
// 			} );
// 		} );
		
// 		// 공백값 제거 (시간있는 수업들만 추림) 
// 		var temp_sale_prdt_cd_ = temp_SALE_PRDT_CD.filter( function(val){ if(val != '') return true; } );

// 		// 리스트를 정제하면서 순서가 다 틀어졌기 때문에 다시 순서를 정렬함
// 		temparr.sort( function( a, b ){
// 			if ( (1*a.CATE_ORDR) > (1*b.CATE_ORDR) ) return 1;
// 			if ( (1*a.CATE_ORDR) === (1*b.CATE_ORDR) ) {
// 				if ( a.P_CODE_NM > b.P_CODE_NM ) return 1;
// 				if ( a.P_CODE_NM === b.P_CODE_NM ) return 0;
// 				if ( a.P_CODE_NM < b.P_CODE_NM ) return -1;
// 			}
// 			if ( (1*a.CATE_ORDR) < (1*b.CATE_ORDR) ) return -1;
// 		});
		
// 		// 시간 없는 애들 없애버린 리스트로 교체
// 		jsonData = temparr;
		
		var exceptCateIdx = '';
		
		 if( jsonData.length > 0 ) {
			 var over8cnt = 0;
			$.each(jsonData, function(key, val) {
				if( val.CATE_READ_YN == 'Y' && val.READY_CHK != null ) {
      				imgIdValue = 'CATE_MASTEROPEN_UUID';
      				setUuid(val.CATE_MASTEROPEN_UUID);
      				unit_fileGet( imgIdValue+'_FILE' , "fn_fileUpload");
      				
					inTag += '<div class="mf_item '+( over8cnt >= 8?"open_over8":over8cnt) +' "  >';
					inTag += '<div class="mf_item_inner">';
					inTag += '<a href="'+val.MOVE_URL+'">';
					
					inTag += '<div class="mf_thumb tablets_mf_thumb phones_mf_thumb" style="background-image: url('+$('#imgTag').val()+');">';
					if( val.FOLL_VAL == 'Y' ) inTag += '<button type="button" class="follow_btn toggle_btn active" value="'+val.CATE_IDX+'"></button>';
					else inTag += '<button type="button" class="follow_btn toggle_btn" value="'+val.CATE_IDX+'"></button>'; 
					
					inTag += '</div>';
					inTag += '<div class="mf_info">';
					inTag += '<span class="mf_cate">'+val.P_CODE_NM+'·'+val.USER_NM+'</span>';
					inTag += '<span class="mf_title">';
									
					inTag += is_too_long_word( val.INFO_MAST_TITL1, val.INFO_MAST_TITL2, 11, 'Y' );
					
					inTag += '</span>';
					inTag += '</a>';
					inTag += '<div class="mf_tag_box" style="height:30px;">';
					
// 					if( temp_sale_prdt_cd_[key] != '' ) { 
// 						if( temp_sale_prdt_cd_[key].indexOf('VL') > -1 ) inTag += '<button type="button" class="mf_btn">VOD</button>';
// 						if( temp_sale_prdt_cd_[key].indexOf('EN') + temp_sale_prdt_cd_[key].indexOf('FN') + temp_sale_prdt_cd_[key].indexOf('CN') > -3 ) inTag += '<button type="button" class="mf_btn active">1:1 코칭</button>';
// 						if( temp_sale_prdt_cd_[key].indexOf('LN') > -1 ) inTag += '<button type="button" class="mf_btn">LIVE CLASS</button>';
// 					}
					
					if( val.PRDT_TYPE != null ) {
// 						$.each(masterTimeCntResult, function(key1,val1){

							var coachingChk = 0;
							var removeDiv = 0;
							
// 							var masterCateIdx = val1.CATE_IDX;
// 							var masterTimeCnt = val1.TIME_CNT.split(',');
// 							var masterPrdtCd = val1.PRDT_CD.split(',');
// 							var masterPrdtInfoCd = val1.PRDT_INFO_CD;
							
							var masterCateIdx = val.CATE_IDX;
							var masterTimeCnt = val.TIME_CNT.split(',');
							var masterPrdtCd = val.TIME_PRDT.split(',');
							var masterPrdtInfoCd = val.PRDT_VL_CHK;
							
// 							if( val.CATE_IDX == masterCateIdx ) {
								
								$.each(masterPrdtCd, function(key2,val2){
									
									if( val2 == 'VL' ) {
										if( masterPrdtInfoCd != null && masterPrdtInfoCd.indexOf('VL') > -1 ){
											inTag += '<button  type="button" class="mf_btn" onclick="location.href=\''+makeUrl(masterCateIdx,val2 )+'\'">VOD</button>';
											removeDiv = 1;
										}
									} else if( val2 == 'EN' ) {
										if( coachingChk == 0 ) {
											inTag += '<button  type="button" class="mf_btn active" onclick="location.href=\''+makeUrl(masterCateIdx,val2 )+'\'">1:1 코칭</button>';
											removeDiv = 1;
											coachingChk = 1;
										}
									} else if( ( val2 == 'CN' ) || ( val2 == 'FN' ) ){
										if( masterTimeCnt[key2] != '0' ) {
											if( coachingChk == 0 ) {
												if( val2.indexOf('CN') > -1 ) {
													inTag += '<button type="button" class="mf_btn active" onclick="location.href=\''+makeUrl(masterCateIdx,val2 )+'\'">1:1 코칭</button>';
													removeDiv = 1;
												}
												else if( val2.indexOf('FN') > -1 ) {
													inTag += '<button type="button" class="mf_btn active" onclick="location.href=\''+makeUrl(masterCateIdx,val2 )+'\'">1:1 코칭</button>';
													removeDiv = 1;
												}
												coachingChk = 1;
											}
										}
									} else if( val2 == 'LN' ) {
										if( masterTimeCnt[key2] != '0' ) {
											console.log( masterTimeCnt );
											inTag += '<button type="button" class="mf_btn" onclick="location.href=\''+makeUrl(masterCateIdx,val2 )+'\'">LIVE CLASS</button>';
											removeDiv = 1;
										}
									}
								});
								
								inTag += '</div>';
								inTag += '</div>';
								inTag += '</div>';
								inTag += '</div>';

								if( removeDiv == 1 ) {
// 									console.log( 22222 );
// 									console.log( removeDiv );
// 									console.log( masterTimeCnt );
// 									console.log( val.CATE_IDX + ' : ' + masterCateIdx);
									$('.ready').append( inTag );
									over8cnt++;
								}
								
								inTag = '';
// 							}
// 						});
					} else {
						inTag += '<button type="button" class="mf_btn">준비중</button>';
						
						inTag += '</div>';
						inTag += '</div>';
						inTag += '</div>';
						inTag += '</div>';
						
						inTag = '';
					}
				}
			});

			if( over8cnt > 8 ) {
				inTag += '<button type="button" class="more_btn" value="open_over8">more</button>';
    			$('.ready').append( inTag );
    			
			} else if( over8cnt == 0 ) {
             	inTag += '		<div class="noneMasterDiv">';
                inTag += '		<a href="javascript:;" class="noneMaster">해당 카테고리에 준비된 마스터가 없습니다.</a>';
             	inTag += '		</div>';
             	
    			$('.ready').append( inTag );
             	
			}
			
			if ( ONLOAD == 'ONLOAD' ) {
				
				inTag = '';
				var over8cnt = 0;
				$.each(jsonData, function(key, val) {
					if( val.CATE_READ_YN == 'N' || ( val.CATE_READ_YN == 'Y' && val.READY_CHK == null ) ) {
						
						over8cnt++;
						
	      				imgIdValue = 'CATE_MASTEROPEN_UUID';
	      				setUuid(val.CATE_MASTEROPEN_UUID);
	      				unit_fileGet( imgIdValue+'_FILE' , "fn_fileUpload");
	      				
						inTag += '<div class="mf_item '+( over8cnt >= 8?"not_open_over8":"") +'">';
						inTag += '<div class="mf_item_inner">';
	// 					inTag += '<a href="javascript:;" onclick="eTarget();" >';
						inTag += '<a href="'+val.NOREADY_URL+'">';
						inTag += '<div class="mf_thumb" style="background-image: url('+$('#imgTag').val()+'); ">';
						
						if( val.FOLL_VAL == 'Y' ) inTag += '<button type="button" class="follow_btn toggle_btn active"  value="'+val.CATE_IDX+'"></button>';
						else inTag += '<button type="button" class="follow_btn toggle_btn" value="'+val.CATE_IDX+'"></button>'; 
						
						inTag += '</div>';
						inTag += '<div class="mf_info"  >';
						inTag += '<span class="mf_cate">'+val.P_CODE_NM+'·'+val.USER_NM+'</span>';
						inTag += '<span class="mf_title">';
						
						
						inTag += is_too_long_word( val.INFO_MAST_TITL1, val.INFO_MAST_TITL2, 11, 'Y' );
						
						inTag += '</span>';
						inTag += '<div class="mf_tag_box">';
						
						inTag += '</div>';
						inTag += '</div>';
						inTag += '</a>';
						inTag += '</div>';
						inTag += '</div>';
						
					}
				});
	
				if( over8cnt > 8 ) inTag += '<button type="button" class="more_btn" value="not_open_over8">more</button>';
	
				if( over8cnt == 0 ) {
					
	             	inTag += '		<div class="noneMasterDiv">';
	                inTag += '		<a href="javascript:;" class="noneMaster">해당 카테고리에 준비중인 마스터가 없습니다.</a>';
	             	inTag += '		</div>';
	             	
				}
				$('.notReady').append( inTag );
			}
			

			// toggle btn
			$('.toggle_btn').on('click', function(e){
			    e.preventDefault();
			    $(this).toggleClass('active');
			});
			
			over8cnt = undefined;
			
		 } else {
             	inTag += '		<div class="noneMasterDiv">';
                inTag += '		<a href="javascript:;" class="noneMaster">준비된 마스터가 없습니다.</a>';
             	inTag += '		</div>';
				$('.ready').append( inTag );
				
				if( ONLOAD == 'ONLOAD' ){
					
					inTag = '';
	             	inTag += '		<div class="noneMasterDiv">';
	                inTag += '		<a href="javascript:;" class="noneMaster">준비중인 마스터가 없습니다.</a>';
	             	inTag += '		</div>';
					$('.notReady').append( inTag );
				}
		 }
	}
	
	
// 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더   
// 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더
// 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더 // 슬라이더

// main visual slider
function fn_MainSlide() {
    var $slide = $('.mv_slider'),
        $item = $('.mv_slider_item'),
        $colorBefore = $('.mv_color_before'),
        $colorAfter = $('.mv_color_after');

    if( $slide.hasClass('slick-initialized') ){
		$slide.slick('unslick');
	}

    $slide.slick({
        autoplay: true,
        autoplaySpeed: 3000,
        centerMode: true,
        cssEase: 'ease-in-out',
        dots: true,
    });

    // 슬라이드 colorchip default 값
        var color = {
            start: '#e4e049',
            end: '#01f5f3'
        }
    $colorBefore.css({
        'background-image': 'linear-gradient(to right, ' + color.start + ', ' + color.end + ')'
    });

    // 슬라이드 colorchip
    $slide.on('beforeChange', function (event, slick, currentSlide, nextSlide) {
        var nextColorStart = slick.$slides.eq(nextSlide).find('.mv_slider_inner').data('start');
        var nextColorEnd = slick.$slides.eq(nextSlide).find('.mv_slider_inner').data('end');
        var prevColorStart = slick.$slides.eq(currentSlide).find('.mv_slider_inner').data('start');
        var prevColorEnd = slick.$slides.eq(currentSlide).find('.mv_slider_inner').data('end');

        $colorAfter.css({
            'background-image': 'linear-gradient(to right, ' + nextColorStart + ', ' + nextColorEnd + ')',
        });
        $colorAfter.hide();
        $colorBefore.css({
            'background-image': 'linear-gradient(to right, ' + prevColorStart + ', ' + prevColorEnd + ')',
        });
        $colorBefore.show();
    });

    // 슬라이드 colorchip
    $slide.on('afterChange', function (event, slick, currentSlide, nextSlide) {
        $colorAfter.fadeIn(1000);
        $colorBefore.fadeOut(1000);
    });
}


//중간 배너 slide
function fn_MiddleSlide() {
	var $slide = $('.ms_slide');

	if( $slide.hasClass('slick-initialized') ){
		$('.ms_slide').slick('unslick');
	}

	$slide.slick({
	    autoplay: true,
	    autoplaySpeed: 3000,
	    cssEase: 'ease-in-out',
	    dots: false,
	    arrows: false,
	});
}

// 코칭 마스터 slide
function fn_CoachSlide() {
    var $slide = $('.mm_slider');

    $slide.slick({
        autoplay: true,
        autoplaySpeed: 2000,
        pauseOnHover : true,
        swipe:true,
        draggable : true,
        infinite : true,
        slidesToShow: 5,
        slidesToScroll: 1,
        cssEase: 'ease-in-out',
        responsive: [
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 1
                }
            }
        ]
    });
}

function eTarget(){
	if( event.target.tagName != 'BUTTON' ){
		alert('지금 준비중이신 마스터님이십니다. \n곧 찾아뵙도록 하겠습니다');
	}
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

function fn_MdpickList(){

  	var params = new Object();
  	params.status = "LIST";
  	params.query = "selectMainMdpickList";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");

	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var jsonDetail = result.out.detail.data;
   	var inTag = '';

	var haveCode = '';

	 if( jsonDetail.length > 0 ) {

		$('[name^=CAT]').empty( );
		$.each(jsonDetail, function(key, val) {
   			if( val != null ) {

				inTag += '<div class="mf_item">';
				inTag += '<div class="mf_item_inner">';
				inTag += '<a href="'+val.MOVE_URL.replace('master','prdt')+'">';

				if( val.INFO_TUMB_UUID != null ) {
					var chkStr = val.INFO_TUMB_UUID.trim();
					if( chkStr != 'undefined' ) {
						if( chkStr != '') {
			  				imgIdValue = 'INFO_TUMB_UUID';
			  				setUuid(val.INFO_TUMB_UUID);
			  				unit_fileGet( imgIdValue+'_FILE' , "fn_fileUpload");
							inTag += '<div class="mf_thumb mdpickThumb phones_mdpickThumb" style="background-image: url('+$('#imgTag').val()+');     height: 200px;">';
							$('#imgTag').val('');
						} else inTag += '<div class="mf_thumb mdpickThumb" style="">';
					} else
						inTag += '<div class="mf_thumb mdpickThumb" style="">';
				} else
					inTag += '<div class="mf_thumb mdpickThumb" style="">';

				if( val.JJIM_IDX != 'NOJJIM' ) inTag += '				<button style="z-index:10;" type="button" id="JJIM'+val.JJIM_IDX+'" class="like_btn toggle_btn active phones_like_btn"></button>';
	   			else inTag += '				<button style="z-index:10;" type="button" class="like_btn toggle_btn NOJJIM phones_like_btn"></button>';
				inTag += '<input id="like'+val.PRDT_CD+'" name="jjim_prdt_cd" type="hidden" value="'+val.CATE_IDX+'" >';
				inTag += '</div>';
				inTag += '<div class="mf_info">';

				if( val.SALE_PRDT_CD.indexOf('FN') > -1 ) inTag += '<span class="mf_cate">1:1화상·'+val.P_CODE_NM+'·'+val.USER_NM+'</span>';
				else if( val.SALE_PRDT_CD.indexOf('CN') > -1 ) inTag += '<span class="mf_cate">1:1채팅·'+val.P_CODE_NM+'·'+val.USER_NM+'</span>';
				else if( val.SALE_PRDT_CD.indexOf('EN') > -1 ) inTag += '<span class="mf_cate">1:1이메일·'+val.P_CODE_NM+'·'+val.USER_NM+'</span>';
				else inTag += '<span class="mf_cate">'+val.PRDT_TYPE+'·'+val.P_CODE_NM+'·'+val.USER_NM+'</span>';

				inTag += '<span class="mf_title">';
				inTag += is_too_long_word( val.INFO_PRDT_TITL1, val.INFO_PRDT_TITL2, 13, 'Y' );

				inTag += '</span>';
				inTag += '<div class="product_price_box">';
				inTag += '<span class="pp_sale">';
				inTag += '<span class="pps_pay">';
				inTag += '<span>'+numberWithCommas( val.PRDT_PRIC )+'</span>원';
				inTag += '</span>';
				inTag += '<span class="pps_per">';
				if( val.PRDT_DISC_CD == 'DIS01' )
					inTag += '<span>'+numberWithCommas( val.PRDT_DISC )+'</span>%';
				else
					inTag += '<span>'+numberWithCommas( val.PRDT_DISC )+'</span>원';
				inTag += '</span>';
				inTag += '</span>';
				inTag += '<span class="pp_price">';
				inTag += '<b class="pp_pay">'+numberWithCommas( val.PRDT_PRIC_REAL )+'</b> 원';
				inTag += '<span class="pp_sub"></span>';
				inTag += '</span>';

				inTag += '<div class="mf_tag_box phone_mf_tag_box tablet_mf_tag_box">';

// 				if ( val.PRDT_TYPE == '1:1 코칭' ) {
// 					if( temp_sale_prdt_cd_[key].indexOf('FN') > -1 ) inTag += '<button type="button" class="mf_btn">1:1화상</button>';
// 					if( temp_sale_prdt_cd_[key].indexOf('CN') > -1 ) inTag += '<button type="button" class="mf_btn">1:1채팅</button>';
// 					if( temp_sale_prdt_cd_[key].indexOf('EN') > -1 ) inTag += '<button type="button" class="mf_btn">1:1이메일</button>';
// //						if( val.PRDT_TYPE3.indexOf('FN') > -1 ) inTag += '<button type="button" class="mf_btn">1:1화상</button>';
// //						if( val.PRDT_TYPE3.indexOf('CN') > -1 ) inTag += '<button type="button" class="mf_btn">1:1채팅</button>';
// //						if( val.PRDT_TYPE3.indexOf('EN') > -1 ) inTag += '<button type="button" class="mf_btn">1:1이메일</button>';
// 				}

				inTag += '</div>';

				inTag += '</div>';
				inTag += '</div>';
				inTag += '</a>';
				inTag += '</div>';
				inTag += '</div>';

				$('.mdPick').append( inTag );

				inTag = '';

				$('#imgTag').val('');
   			}
		});

		$('.mf_thumb.mdpickThumb > .like_btn').click(function(e){
	      	var RETURN = 0;
	      		e.preventDefault();
	        	if ( localStorage.getItem('frontLoginIdx') == null || localStorage.getItem('frontLoginIdx') == '' || typeof localStorage.getItem('frontLoginIdx') == 'undefined' ) {
	      		event.stopPropagation();
	      		event.stopImmediatePropagation();
	      		$(this).removeClass('active is-active');
	      		alert('로그인 후 사용가능합니다.');
	    		return location.href =  '/front/account/login';
	        	} else {

	        		var bask_prdt_cd = $(this).siblings('[name=jjim_prdt_cd]').attr('id').replace( 'like', '' );
        			var bask_cate_idx = $(this).siblings('[name=jjim_prdt_cd]').val();

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
					      			params.CATE_IDX = bask_cate_idx;
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
				      			setTimeout(function(){
						      		$(this).addClass('active is-active');
				      			},10);

					      	  	RETURN = 1;
		        			}

	        			}else{

			          		var params = new Object();
			      			params.status = "EDIT";
			      			params.query = "updateFrontJjimData";
			          		params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
			      			params.BASK_PRDT_CD = bask_prdt_cd;
			      			params.CATE_IDX = bask_cate_idx;
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
			      			setTimeout(function(){
				      			$(this).addClass('active is-active');
			      			},10);

			      	  		RETURN = 1;
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
					      			params.CATE_IDX = bask_cate_idx;
					      			params.BASK_USE_YN = 'N';
					      			params.BASK_TYPE = 'K';
					      			var editResult =  fn_DataAjax2( params );

								} );

		        				$(this).addClass('NOJJIM');
				      			setTimeout(function(){
				      				$(this).removeClass('active is-active');
				      			},10);

		        			}

		      			}else{

			      			var params = new Object();
			      			params.status = "EDIT";
			      			params.query = "updateFrontJjimData";
			      			params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
			      			params.BASK_PRDT_CD = bask_prdt_cd;
			      			params.CATE_IDX = bask_cate_idx;
			      			params.BASK_USE_YN = 'N';
			      			params.BASK_TYPE = 'K';
			      			var editResult =  fn_DataAjax2( params );

			      			$(this).addClass('NOJJIM');
			      			setTimeout(function(){
				      			$(this).removeClass('active is-active');
			      			},10);
		      			}
		      		}
	        	}
	      });

		$('.main_mdpick').show();
	 }else{
		 $('.mdPick').append(  '<div style="text-align:center; padding-top: 40px;"><h1>검색 결과가 없습니다.</h1></div>' );
		$('.main_mdpick').hide();
	 }


// 	$('.mf_item_list').each(function(key, val){
// 		if( $(this).html() == '' ) {
// 			var tagVal = $(this).parent('div');
// 			tagVal = tagVal.parent('div');
// 			tagVal.remove();
// 		}
// 	});

    var $slide = $('.mdPick');
    if($slide.length){
        $slide.slick({
            infinite: false,
            slidesToShow: 4,
            slidesToScroll: 4,
            variableWidth:false,
            responsive: [
                {
                  breakpoint: 760,
                  settings: {
                    slidesToShow: 3,
                    slidesToScroll: 1,
                    // draggable : true,
                    //variableWidth: true,
                      variableWidth: false,
                  }
                },{
                    breakpoint: 640,
                    settings: {
                      slidesToShow: 2,
                      slidesToScroll: 1,
                      // draggable : true,
                      //variableWidth: true
                      variableWidth: false,
                    }
                  }
              ]
        });
    }
}



function fn_TimedealList(){

  	var params = new Object();
  	params.status = "LIST";
  	params.query = "selectMainTimedealList";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");

	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var jsonDetail = result.out.detail.data;
   	var inTag = '';

	var haveCode = '';

	 if( jsonDetail.length > 0 ) {

		$('[name^=CAT]').empty( );
		$.each(jsonDetail, function(key, val) {
   			if( val != null ) {

				inTag += '<div class="mf_item">';
				inTag += '<div class="mf_item_inner">';
				inTag += '<a href="'+val.MOVE_URL.replace('master','prdt')+'">';

				if( val.INFO_TUMB_UUID != null ) {
					var chkStr = val.INFO_TUMB_UUID.trim();
					if( chkStr != 'undefined' ) {
						if( chkStr != '') {
			  				imgIdValue = 'INFO_TUMB_UUID';
			  				setUuid(val.INFO_TUMB_UUID);
			  				unit_fileGet( imgIdValue+'_FILE' , "fn_fileUpload");
							inTag += '<div class="mf_thumb timeDealThumb phones_timeDealThumb" style="background-image: url('+$('#imgTag').val()+'); height: 200px;">';
							$('#imgTag').val('');
						} else inTag += '<div class="mf_thumb timeDealThumb" style="">';
					} else
						inTag += '<div class="mf_thumb timeDealThumb" style="">';
				} else
					inTag += '<div class="mf_thumb timeDealThumb" style="">';


				inTag += '<button class="btn timeDealDay" ></button>';
				inTag += '<button class="btn timeDealTime" ></button>';

				if( val.JJIM_IDX != 'NOJJIM' ) inTag += '				<button style="z-index:10;" type="button" id="JJIM'+val.JJIM_IDX+'" class="like_btn toggle_btn active phones_like_btn"></button>';
	   			else inTag += '				<button style="z-index:10;" type="button" class="like_btn toggle_btn NOJJIM phones_like_btn"></button>';
				inTag += '<input id="like'+val.SALE_PRDT_CD+'" name="jjim_prdt_cd" type="hidden" value="'+val.CATE_IDX+'" >';
				inTag += '</div>';
				inTag += '<div class="mf_info">';

				if( val.SALE_PRDT_CD.indexOf('FN') > -1 ) inTag += '<span class="mf_cate">1:1화상·'+val.P_CODE_NM+'·'+val.USER_NM+'</span>';
				else if( val.SALE_PRDT_CD.indexOf('CN') > -1 ) inTag += '<span class="mf_cate">1:1채팅·'+val.P_CODE_NM+'·'+val.USER_NM+'</span>';
				else if( val.SALE_PRDT_CD.indexOf('EN') > -1 ) inTag += '<span class="mf_cate">1:1이메일·'+val.P_CODE_NM+'·'+val.USER_NM+'</span>';
				else inTag += '<span class="mf_cate">'+val.PRDT_TYPE+'·'+val.P_CODE_NM+'·'+val.USER_NM+'</span>';

				inTag += '<span class="mf_title">';
				inTag += is_too_long_word( val.INFO_PRDT_TITL1, val.INFO_PRDT_TITL2, 13, 'Y' );

				inTag += '</span>';
				inTag += '<div class="product_price_box">';
				inTag += '<span class="pp_sale">';
				inTag += '<span class="pps_pay">';
				inTag += '<span>'+numberWithCommas( val.PRDT_PRIC_REAL )+'</span>원';
				inTag += '</span>';
				inTag += '<span class="pps_per">';
// 				if( val.PRDT_DISC_CD == 'DIS01' )
// 					inTag += '<span>'+numberWithCommas( val.PRDT_DISC )+'</span>%';
// 				else
					inTag += '<span>'+numberWithCommas( val.DEAL_DISC_PRIC )+'</span>원';
				inTag += '</span>';
				inTag += '</span>';
				inTag += '<span class="pp_price">';
				inTag += '<b class="pp_pay">'+numberWithCommas( val.DEAL_REAL_PRIC )+'</b> 원';
				inTag += '<span class="pp_sub"></span>';
				inTag += '</span>';

				inTag += '<div class="mf_tag_box phone_mf_tag_box tablet_mf_tag_box">';

// 				if ( val.PRDT_TYPE == '1:1 코칭' ) {
// 					if( temp_sale_prdt_cd_[key].indexOf('FN') > -1 ) inTag += '<button type="button" class="mf_btn">1:1화상</button>';
// 					if( temp_sale_prdt_cd_[key].indexOf('CN') > -1 ) inTag += '<button type="button" class="mf_btn">1:1채팅</button>';
// 					if( temp_sale_prdt_cd_[key].indexOf('EN') > -1 ) inTag += '<button type="button" class="mf_btn">1:1이메일</button>';
// //						if( val.PRDT_TYPE3.indexOf('FN') > -1 ) inTag += '<button type="button" class="mf_btn">1:1화상</button>';
// //						if( val.PRDT_TYPE3.indexOf('CN') > -1 ) inTag += '<button type="button" class="mf_btn">1:1채팅</button>';
// //						if( val.PRDT_TYPE3.indexOf('EN') > -1 ) inTag += '<button type="button" class="mf_btn">1:1이메일</button>';
// 				}

				inTag += '</div>';

				inTag += '</div>';
				inTag += '</div>';
				inTag += '</a>';
				inTag += '</div>';
				inTag += '</div>';

				$('.timeDeal').append( inTag );

				counter( val.MAIN_OPEN_DTM, $('.timeDealDay').eq(key), $('.timeDealTime').eq(key) );

				inTag = '';

				$('#imgTag').val('');
   			}
		});

		$('.mf_thumb.timeDealThumb > .like_btn').click(function(e){
	      	var RETURN = 0;
	      		e.preventDefault();
	        	if ( localStorage.getItem('frontLoginIdx') == null || localStorage.getItem('frontLoginIdx') == '' || typeof localStorage.getItem('frontLoginIdx') == 'undefined' ) {
	      		event.stopPropagation();
	      		event.stopImmediatePropagation();
	      		$(this).removeClass('active is-active');
	      		alert('로그인 후 사용가능합니다.');
	    		return location.href =  '/front/account/login';
	        	} else {

	        		var bask_prdt_cd = $(this).siblings('[name=jjim_prdt_cd]').attr('id').replace( 'like', '' );
        			var bask_cate_idx = $(this).siblings('[name=jjim_prdt_cd]').val();

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
					      			params.CATE_IDX = bask_cate_idx;
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
				      			setTimeout(function(){
				      				$(this).addClass('active is-active');
				      			},100);

					      	  	RETURN = 1;
		        			}

	        			}else{

			          		var params = new Object();
			      			params.status = "EDIT";
			      			params.query = "updateFrontJjimData";
			          		params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
			      			params.BASK_PRDT_CD = bask_prdt_cd;
			      			params.CATE_IDX = bask_cate_idx;
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
			      			setTimeout(function(){
				      			$(this).addClass('active is-active');
			      			},100);

			      	  		RETURN = 1;
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
					      			params.CATE_IDX = bask_cate_idx;
					      			params.BASK_USE_YN = 'N';
					      			params.BASK_TYPE = 'K';
					      			var editResult =  fn_DataAjax2( params );

								});

		        				$(this).addClass('NOJJIM');
				      			setTimeout(function(){
				      				$(this).removeClass('active is-active');
				      			},100);

		        			}

		      			}else{

			      			var params = new Object();
			      			params.status = "EDIT";
			      			params.query = "updateFrontJjimData";
			      			params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
			      			params.BASK_PRDT_CD = bask_prdt_cd;
			      			params.CATE_IDX = bask_cate_idx;
			      			params.BASK_USE_YN = 'N';
			      			params.BASK_TYPE = 'K';
			      			var editResult =  fn_DataAjax2( params );

			      			$(this).addClass('NOJJIM');
			      			setTimeout(function(){
			      				$(this).removeClass('active is-active');
			      			},100);
		      			}
		      		}
	        	}
	      });
		$('.main_timedeal').show();
	 }else{
// 		 $('.timeDeal').append(  '<div style="text-align:center; padding-top: 40px;"><h1>검색 결과가 없습니다.</h1></div>' );
		$('.main_timedeal').hide();
	 }


// 	$('.mf_item_list').each(function(key, val){
// 		if( $(this).html() == '' ) {
// 			var tagVal = $(this).parent('div');
// 			tagVal = tagVal.parent('div');
// 			tagVal.remove();
// 		}
// 	});

    var $slide = $('.timeDeal');
    if($slide.length){
        $slide.slick({
            infinite: false,
            slidesToShow: 4,
            slidesToScroll: 4,
            variableWidth:false,
            responsive: [
                {
                  breakpoint: 760,
                  settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2,
                    // draggable : true,
                    variableWidth: true
                  }
                },{
                    breakpoint: 400,
                    settings: {
                      slidesToShow: 1,
                      slidesToScroll: 1,
                      // draggable : true,
                      variableWidth: true
                    }
                  }
              ]
        });
    }
}
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
// 				INPUT_TAG.html();
// 				$('#dday-view').html('마감되었습니다.');
// 				$('#dday-div').hide();
			} else {
				if (d>0) {
					viewDay = 'D-' + viewDay+d;
				} else {
					$('.timeDealDay').eq(BTN_DAY.index()).css({'background-color':'#ff00ff','bottom':'25px'});
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


