<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" />

<style>

/* 슬라이드 css */
/* button.slick-prev{ position: relative;left: 1100px}
button.slick-next{ transform: translateY(-50%) rotate(180deg);position: relative;bottom: 435px;left: 1120px;}
button.slick-arrow.slick-disabled {opacity: .5;cursor: auto;} 210520 수정 */
.slick-arrow{width: 25px !important;height: 30px !important;}
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

.mf_thumb{border-radius: 5%;}

/* 210520 추가 */
.main_mdpick .section_title{margin-bottom: 60px;}
.mdPick button.slick-arrow{position: absolute; top: -68px; width: 48px !important; height: 48px !important; -webkit-background-size: 30% 50%; background-size: 30% 50%; border: 1px solid #444;}
.mdPick button.slick-prev{right: 80px;}
.mdPick button.slick-next{transform: rotate(180deg); right: 25px;}
.mdPick button.slick-arrow.slick-disabled {opacity: .5;cursor: auto;}
/* 210520 추가 */
@media screen and (max-width: 960px){
	.main_mdpick .section_title{margin-bottom: 40px;}
}
@media screen and (max-width: 768px){
	.mdPick button.slick-arrow{display: none !important;}
}
@media screen and (max-width: 480px){
	.main_mdpick .section_title{margin-bottom: 30px;}
}

</style>

    <div id="container">
        <div class="sub_header">
            <div class="section_inner">
                <div class="sub_header_slide">
                </div>
            </div>
        </div>
        
        <div class="main_timedeal  sub_section"> <!-- main_none -->
            <div class="section_inner">
           	<h3 class="section_title" style="    text-align: initial;">TIME DEAL</h3>
            </div>
            <div class="section_inner timeDeal phones_timeDeal">
            </div>
        </div>
				
        <div class="main_mdpick  sub_section"> <!-- main_none -->
            <div class="section_inner">
           	<h3 class="section_title" style="    text-align: initial;">MD's Pick</h3>
            </div>
            <div class="section_inner mdPick phones_mdPick">
            </div>
        </div>


<!--         <div class="sub_section product_wrap"> -->
<!--             <div class="section_inner cateList"> -->
<!-- 				<div class="product_section"> -->
<!-- 					<div class="product_title_box"> -->
<!-- 						<h3 class="product_title">'+val.CODE_NM+'</h3> -->
<!-- 						<a href="javascript:;" onclick="fn_BtnChangeList_before( \''+val.CODE_NM+'\' );"class="product_link">더보기</a> -->
<!-- 						</div> -->
<!-- 						<div class="mf_item_box scroll"> -->
<!-- 						<div class="mf_item_list" name="'+val.CODE_ID+'"> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!--             </div> -->
<!--         </div> -->
        
        <div class="sub_section product_wrap pd0">
            <div class="section_inner codeList">
                <div class="mf_cate_box">
                    <ul class="prdt_tab_lists phones_prdt_tab_lists prdt_tab_lists_c" style="">
                    </ul>
                </div>
            </div>
        </div>

        <div class="sub_section product_wrap">
            <div class="section_inner cateList">
            </div>
        </div>
    </div><!-- // #container -->


<script>
	var chkVal = 0;
	var SEARCH_VAL = '';
	
	// 손으로 잡아 움직이는 슬라이드 스크롤 바 in PC
	const slider = document.querySelector('.prdt_tab_lists_c');
	let isMouseDown = false;
	let startX, scrollLeft;
	
	$(slider).mousedown(function(e){
		isMouseDown = true;
		$(this).addClass('active');
		
		startX = e.pageX - slider.offsetLeft;
		scrollLeft = slider.scrollLeft;
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
		
	} );
	
	
	$(function(){
		if( localStorage.getItem("frontPrdtType") != null ) SEARCH_VAL = localStorage.getItem("frontPrdtType");
		else SEARCH_VAL = 'VOD';
		
		$('.prdt_tab_lists  > li').each(function(){
			var gnbText = $(this).text();
			var gnbSes = SEARCH_VAL;
			if( gnbText.indexOf( gnbSes ) > -1 ) $(this).children('a').addClass('active'); 
		});
		
		$('.header_gnb > li > a').removeClass('active');
		$('.header_gnb > li').each(function(){
			if ( $(this).text().indexOf( SEARCH_VAL ) > -1 ) {
				$(this).children('a').addClass('active');
			}
		});

		fn_Bannprdt();
		fn_BtnChangeList();
		$('.prdt_tab_lists_c').css('width','100% !important');
		$('.prdt_tab_lists_c').css('left','0');
		// 주석하지말것 js 에서 함수 실행시 실행 시점때문에 위치 안맞음
		setTimeout( function(){ prdtTabEvent();  }, 2000 );
		$( '#now_loading' ).hide();
	});

	$('.prdt_tab_lists  > li').click(function(){
		$('.prdt_tab_lists  > li > a').removeClass('active');
		
		var gnbText = $(this).text();
		SEARCH_VAL = localStorage.getItem("frontPrdtType");
		var gnbSes = SEARCH_VAL;
		if( gnbText.indexOf( gnbSes ) > -1 ) $(this).children('a').addClass('active');
		
		fn_Bannprdt();
		fn_BtnChangeList();
	});
	
	$('.header_gnb > li').click(function(){
		$('.header_gnb > li > a').removeClass('active');

		if( localStorage.getItem("frontPrdtType") != null ) SEARCH_VAL = localStorage.getItem("frontPrdtType");
		else SEARCH_VAL = 'VOD';
		
		$(this).children('a').addClass('active');
		
		$('.prdt_tab > a ').removeClass( 'active is-active' );
		$('.prdt_tab > a ').eq(0).addClass( 'active is-active' );
		
		fn_Bannprdt();
		fn_BtnChangeList();
	});
	
	function fn_Bannprdt(){ 
       	var params = new Object();
       	params.status = "LIST";
       	params.query = "selectFrontBannprdtList";
		params.SEARCH_VAL = SEARCH_VAL;
       	
       	var jsonDetail = fn_DataAjax2( params );
       	jsonDetail = jsonDetail.out.detail.data;
       	
       	var inTag = '';
        var $slide = $('.sub_header_slide');
        if( $slide.hasClass('slick-initialized') ) $slide.slick('unslick');
        
       	if( jsonDetail.length > 0 ) {
       		
       		$('.sub_header_slide').empty( );
				 
       		$.each(jsonDetail,function(key,val){
       			bannerType = val.BANN_TYPE;
       			
				if( val.BANN_UUID != null || val.BANN_UUID != '') {

	  				if ( isMobile() ) {
		  				imgIdValue = 'BANN_UUID';	
					}else{
		  				imgIdValue = 'BANN_UUID';	
					}
	  				setUuid(val.BANN_UUID);
	  				unit_fileGet( imgIdValue+'_FILE' , "fn_fileUpload");
				}
       			
	   			inTag += '<a href="'+val.BANN_LINK+'">';
	   			if( val.BANN_UUID != null || val.BANN_UUID != '')
	   				inTag += '		<div class="sub_header_box" style="background-image: url('+$('#imgTag').val()+');"><div class="sub_header_txt">';
	   			else
	   				inTag += '		<div class="sub_header_box"><div class="sub_header_txt">';

	   			if( val.BANN_TYPE_NM.indexOf('VOD') > -1 ) {
	   				inTag += '			<span class="sh_category">'+val.BANN_TYPE_NM+'강좌</span>';
	   			}
	   			else {
	   				inTag += '			<span class="sh_category">'+val.BANN_TYPE_NM+'</span>';
	   			}
	   			
	   			inTag += '			<p class="sh_text">'+val.BANN_TITL+'</p></div>';
	   			inTag += '		</div>';
	   			inTag += '</a>';

// 				$('.sub_header_slide').append( inTag );
       		});
       		
			$('.sub_header_slide').append( inTag );
       	}
       	fn_BannprdtSlide( $slide );
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
			$('.cateList').empty();
			
			$.each(jsonData, function(key, val){
				inTag += '<div class="product_section">';
				inTag += '<div class="product_title_box">';
				inTag += '<h3 class="product_title">'+val.CODE_NM+'</h3>';
				inTag += '<a href="javascript:;" onclick="fn_BtnChangeList_before( \''+val.CODE_NM+'\' );"class="product_link">더보기</a>';
				inTag += '</div>';
				inTag += '<div class="mf_item_box scroll">';
				inTag += '<div class="mf_item_list" name="'+val.CODE_ID+'">';
				inTag += '</div>';
				inTag += '</div>';
				inTag += '</div>';
			});
			
			$('.cateList').append( inTag );
			inTag = '';
		}

	    $('.prdt_tab > a').on('click', function(){
	        $(this).addClass('active').parent('li').siblings().children('a').removeClass('is-active');
	    });
	    
		if( chkVal == 0 ) {
			if( jsonData.length > 0 ) {
				inTag += '<li  class="prdt_tab prdt_tab_c"><a class="is-active" onclick="fn_BtnChangeList(\'\');">전체</a></li>';
				
				$.each(jsonData, function(key, val){
					inTag += '<li  class="prdt_tab prdt_tab_c" ><a onclick="fn_BtnChangeList(\''+val.CODE_NM+'\');">'+val.CODE_NM+'</a></li>';
				});
				
				$('.codeList > .mf_cate_box > .prdt_tab_lists ').append( inTag );
				chkVal = 1;
			}
		}
	}
	
	
	
	function fn_BtnChangeList( CODE_NM ){
		
		fn_MdpickList();
		fn_TimedealList();
		fn_CategoryList();
		
		var params = new Object();
		params.status = "LIST";
		params.query = "selectFrontPrdtList";
		params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
		params.SEARCH_VAL = SEARCH_VAL;
		
		if( CODE_NM != '' || CODE_NM != null ) params.CODE_NM = CODE_NM;
		else params.CODE_NM = 'VOD';
		
		params.URL = window.location.pathname;
		
		fn_DataList( params, "dataList", 7 );
	}
	
	function fn_DataList( PARAMS, OBJECT_ID, CNT ) {
		var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
		var jsonDetail = result.out.detail.data;
		var inTag = '';
		
		var temp = '';
		var temparr = [];
		
		var temp_SALE_PRDT_CD = [];
		
		var temp_SALE_PRDT_CD_temp = '';
		
		// 1:1 코칭들이 중복되어 들어가지 않게 하는 값
		var haveCode = '';
		
		if ( localStorage.getItem('frontPrdtType') == 'LIVE CLASS' ) {
			temp = 'LN';
		}else if (  localStorage.getItem('frontPrdtType') == '1:1 코칭'  ) {
			temp = 'CN,FN';
		}
		
// 		console.log( jsonDetail );
		if ( temp == 'LN' || temp == 'CN,FN' ) {
			$.each(jsonDetail, function( prekey, preval ){
				temp_SALE_PRDT_CD_temp = '';
				$.each(preval.PRDT_TYPE3.split(','), function( typekey, typeval ){
					if ( localStorage.getItem('frontPrdtType') == 'LIVE CLASS' ) {
						if( typeval.indexOf('LN') > -1 ){
							if( preval.TIME_CNT.split(',')[typekey] > 0 ){
								temparr.push(preval);
								temp_SALE_PRDT_CD_temp += 'LN';
							}
						}
					}
					if (localStorage.getItem('frontPrdtType') == '1:1 코칭' ) {
						if( typeval.indexOf('CN') > -1 ){
							if( preval.TIME_CNT.split(',')[typekey] > 0 ){
								if ( haveCode.indexOf( preval.PRDT_CD ) == -1 ) {
									haveCode += preval.PRDT_CD;
									temparr.push(preval);
								}
								temp_SALE_PRDT_CD_temp += 'CN,';
							}
						}
						if (typeval.indexOf('EN') > -1 ){
							if ( haveCode.indexOf( preval.PRDT_CD ) == -1 ) {
								haveCode += preval.PRDT_CD;
								temparr.push(preval);
							}
							temp_SALE_PRDT_CD_temp += 'EN,';
						}
					
						if (typeval.indexOf('FN') > -1 ){
							if( preval.TIME_CNT.split(',')[typekey] > 0 ){
								if ( haveCode.indexOf( preval.PRDT_CD ) == -1 ) {
									haveCode += preval.PRDT_CD;
									temparr.push(preval);
								}
								temp_SALE_PRDT_CD_temp += 'FN,';
							}	
						}
					}
				});
				temp_SALE_PRDT_CD.push(temp_SALE_PRDT_CD_temp);
			});
		}
		
		// 공백값 제거
	 	var temp_sale_prdt_cd_ = temp_SALE_PRDT_CD.filter( function(val){ if(val != '') return true; } );
		
	// 라이브 클래스나 1:1 코칭이라면 바끤걸로 보여준다
		if ( temp == 'LN' || temp == 'CN,FN' ) {
		 	jsonDetail = temparr;
		}
	 	
		 if( jsonDetail.length > 0 ) {

			$('[name^=CAT]').empty( );
			$.each(jsonDetail, function(key, val) {
	   			if( val != null ) {
					
					inTag += '<div class="mf_item">';
					inTag += '<div class="mf_item_inner">';
					inTag += '<a href="'+val.MOVE_URL+'">';
					
					if( val.INFO_TUMB_UUID != null ) {
						var chkStr = val.INFO_TUMB_UUID.trim();
						if( chkStr != 'undefined' ) {
							if( chkStr != '') {
				  				imgIdValue = 'INFO_TUMB_UUID';
				  				setUuid(val.INFO_TUMB_UUID);
				  				unit_fileGet( imgIdValue+'_FILE' , "fn_fileUpload");
								inTag += '<div class="mf_thumb submainThumb" style="background-image: url('+$('#imgTag').val()+'); ">';
								$('#imgTag').val('');
							} else inTag += '<div class="mf_thumb submainThumb" style="">';
						} else 
							inTag += '<div class="mf_thumb submainThumb" style="">';
					} else 
						inTag += '<div class="mf_thumb submainThumb" style="">';
						
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
					inTag += '<span>'+numberWithCommas( val.PRDT_DISC )+'</span>'+val.PRDT_DISC_NM+'';
					inTag += '</span>';
					inTag += '</span>';
					inTag += '<span class="pp_price">';
					inTag += '<b class="pp_pay">'+numberWithCommas( val.PRDT_PRIC_REAL )+'</b> 원';
					inTag += '<span class="pp_sub"></span>';
					inTag += '</span>';
					
					inTag += '<div class="mf_tag_box phone_mf_tag_box tablet_mf_tag_box">';

					if ( val.PRDT_TYPE == '1:1 코칭' ) {
						if( temp_sale_prdt_cd_[key].indexOf('FN') > -1 ) inTag += '<button type="button" class="mf_btn">1:1화상</button>';
						if( temp_sale_prdt_cd_[key].indexOf('CN') > -1 ) inTag += '<button type="button" class="mf_btn">1:1채팅</button>';
						if( temp_sale_prdt_cd_[key].indexOf('EN') > -1 ) inTag += '<button type="button" class="mf_btn">1:1이메일</button>';
// 						if( val.PRDT_TYPE3.indexOf('FN') > -1 ) inTag += '<button type="button" class="mf_btn">1:1화상</button>';
// 						if( val.PRDT_TYPE3.indexOf('CN') > -1 ) inTag += '<button type="button" class="mf_btn">1:1채팅</button>';
// 						if( val.PRDT_TYPE3.indexOf('EN') > -1 ) inTag += '<button type="button" class="mf_btn">1:1이메일</button>';
					}
					
					inTag += '</div>';
					
					inTag += '</div>';
					inTag += '</div>';
					inTag += '</a>';
					inTag += '</div>';
					inTag += '</div>';
		
					$('[name="'+val.P_CODE_ID+'"]').append( inTag );
					
					inTag = '';
					
					$('#imgTag').val('');
	   			}
			});
			 
			$('.mf_thumb.submainThumb .like_btn').click(function(e){
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
						      		var thisTag = $(this); 
					      			setTimeout(function(){
					      				thisTag.addClass('active is-active'); 
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
					      		var thisTag = $(this); 
				      			setTimeout(function(){
				      				thisTag.addClass('active is-active'); 
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
			        					
									} );
			        				
			        				$(this).addClass('NOJJIM');
						      		var thisTag = $(this); 
					      			setTimeout(function(){
					      				thisTag.removeClass('active is-active'); 
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
					      		var thisTag = $(this); 
				      			setTimeout(function(){
				      				thisTag.removeClass('active is-active'); 
				      			},100);
				      			
			      			}	
			      			
			      		}
		        	}
		      });
			
			
			
			
		 }else{
			 $('.cateList').append(  '<div style="text-align:center; padding-top: 40px;"><h1>검색 결과가 없습니다.</h1></div>' );
		 }
		 

		$('.mf_item_list').each(function(key, val){
			if( $(this).html() == '' ) {
				var tagVal = $(this).parent('div');
				tagVal = tagVal.parent('div');
				tagVal.remove();
			}
		});
	}

$('.toggle_btn').on('click', function(e){
    e.preventDefault();
    $(this).toggleClass('active');
});

function fn_BtnChangeList_before( code_nm ){
	$('.prdt_tab > a ').removeClass( 'active is-active' );
	$('.prdt_tab > a ').each( function( k ){
		if ( this.innerText == code_nm ) {
			$(this).addClass('active is-active');
		}
	});
	fn_BtnChangeList( code_nm );
}
    // 마스터 카테고리 버튼 select

// sub header 슬라이드
function fn_BannprdtSlide( SLIDE ) {

//     var $slide = $('.sub_header_slide');
//     if( $slide.hasClass('slick-initialized') ) $slide.slick('unslick');
    
//     $('.sub_header_slide').slick({
	
    if( SLIDE ){
    	SLIDE.slick({
	        autoplay: true,
	        autoplaySpeed: 3000,
	        cssEase: 'ease-in-out',
	        dots: false,
	        arrows: false,
	    });
    }
}
    
    // 스크롤 load k (임시)
    //    $('.mf_item.scroll').hide();

    //    $(window).scroll(function(){
    //        var offset = $('.mf_item_box.scroll').offset().top;
    //        var nowScroll = $(window).scrollTop();
        
    //        if ( nowScroll - 600 > offset) {
    //            console.log('hi');
    //            $('.mf_item.scroll').show();
     //       }
     //   });
    
    

function fn_MdpickList(){
	
  	var params = new Object();
  	params.status = "LIST";
  	params.query = "selectMainMdpickList";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.SEARCH_VAL = SEARCH_VAL;

	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var jsonDetail = result.out.detail.data;
   	var inTag = '';
	var haveCode = '';

    var $slide = $('.mdPick');
    if( $slide.hasClass('slick-initialized') ) $slide.slick('unslick');
    
	$('.mdPick').empty();
 	
	 if( jsonDetail.length > 0 ) {

		$('[name^=CAT]').empty( );
		$.each(jsonDetail, function(key, val) {
   			if( val != null ) {
				
				inTag += '<div class="mf_item">';
				inTag += '<div class="mf_item_inner">';
				inTag += '<a href="'+val.MOVE_URL+'">';
				
				if( val.INFO_TUMB_UUID != null ) {
					var chkStr = val.INFO_TUMB_UUID.trim();
					if( chkStr != 'undefined' ) {
						if( chkStr != '') {
			  				imgIdValue = 'INFO_TUMB_UUID';
			  				setUuid(val.INFO_TUMB_UUID);
			  				unit_fileGet( imgIdValue+'_FILE' , "fn_fileUpload");
							inTag += '<div class="mf_thumb mdpickThumb phones_mdpickThumb" style="background-image: url('+$('#imgTag').val()+'); height: 200px;">';
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
				      			var thisTag = $(this);
				      			setTimeout(function(){
				      				thisTag.addClass('active is-active'); 
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
			      			var thisTag = $(this);
			      			setTimeout(function(){
			      				thisTag.addClass('active is-active'); 
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
		        					
								} );
		        				
		        				$(this).addClass('NOJJIM');
				      			var thisTag = $(this);
				      			setTimeout(function(){
				      				thisTag.removeClass('active is-active'); 
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
			      			var thisTag = $(this);
			      			setTimeout(function(){
			      				thisTag.removeClass('active is-active'); 
			      			},100);
		      			}
		      		}
	        	}
	      });
		 $('.main_mdpick').show();
	 }else{
// 		 $('.mdPick').append(  '<div style="text-align:center; padding-top: 40px;"><h1>검색 결과가 없습니다.</h1></div>' );
		 $('.main_mdpick').hide();
	 }
	 

// 	$('.mf_item_list').each(function(key, val){
// 		if( $(this).html() == '' ) {
// 			var tagVal = $(this).parent('div');
// 			tagVal = tagVal.parent('div');
// 			tagVal.remove();
// 		}
// 	});

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



function fn_TimedealList(){
	
  	var params = new Object();
  	params.status = "LIST";
  	params.query = "selectMainTimedealList";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.SEARCH_VAL = SEARCH_VAL; 

	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var jsonDetail = result.out.detail.data;
   	var inTag = '';
	var haveCode = '';

    var $slide = $('.timeDeal');
    if( $slide.hasClass('slick-initialized') ) $slide.slick('unslick');
	$('.timeDeal').empty();
	
	 if( jsonDetail.length > 0 ) {

		$('[name^=CAT]').empty( );
		$.each(jsonDetail, function(key, val) {
   			if( val != null ) {

				inTag += '<div class="mf_item">';
				inTag += '<div class="mf_item_inner">';
				inTag += '<a href="'+val.MOVE_URL+'">';
				
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
				

				inTag += '<button class="btn timeDealDay" style="    position: relative;"></button>';
				inTag += '<button class="btn timeDealTime" style="position: relative;"></button>';
					
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
				      			var thisTag = $(this);
				      			setTimeout(function(){
				      				thisTag.addClass('active is-active'); 
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
			      			
			      			$(this).removeClass('NOJJIM')
			      			var thisTag = $(this);
			      			setTimeout(function(){
			      				thisTag.addClass('active is-active'); 
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
		        					
								} );
		        				
		        				$(this).addClass('NOJJIM');
				      			var thisTag = $(this);
				      			setTimeout(function(){
				      				thisTag.removeClass('active is-active'); 
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
			      			var thisTag = $(this);
			      			setTimeout(function(){
			      				thisTag.removeClass('active is-active'); 
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
    if( $slide.hasClass('slick-initialized') ) $slide.slick('unslick');
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
					$('.timeDealDay').eq(BTN_DAY.index()).css({'background-color':'#aa00ff','bottom':'30px'});
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

