<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'search', 'ajax')}" />
<style>
.sh_text {
    position: inherit;
}
.not_open_over8, .open_over8, .prdt_over8 { display: none; }
</style>
    <div id="container">

        <div class="main_find main_section" style="margin-top:-20px;">
            <div class="section_inner">
                
               	<c:choose>
                	<c:when test='${param.keyword ne "" and not empty param.keyword }'>
				        <h3 class="section_title">"${param.keyword}"에 대한 검색 결과 입니다.</h3>
                	</c:when>
                	<c:otherwise>
				        <h3 class="section_title">"키워드"에 대한 검색 결과 입니다.</h3>
                	</c:otherwise>
              	</c:choose>
                
                
                <div class="mf_cate_box">
                    <ul class="main_tab_lists main_tab_lists_c"></ul>
                </div>
                
                <div class="mf_cate_box" style="margin-bottom:-20px; margin-top:30px;">
                	<h3 class="sh_text sh_text_bold" style="font-weight: 700;" >마스터검색 결과</h3>
                </div>
    
                <div class="mf_item_box" >
                    <div class="mf_item_list ready">
                    </div>
                </div>
                
                
		        <div class="main_find main_section">
		            <div class="section_inner"  style="margin-bottom: 60px;padding: 0px;">
		                <div class="product_section" style="padding:0px">
			                <div class="mf_cate_box" style="margin-bottom:-20px; margin-top:30px;">
			                	<h3 class="sh_text sh_text_bold" style="font-weight: 700;">상품검색 결과</h3>
			                </div>
			                <div class="mf_item_box scroll">
			                    <div class="mf_item_list prdt_list_item" >
			                    </div>
			        		</div>
		        		</div>
		            </div>
		        </div>
		        
		        
	        </div>
        </div>
    </div><!-- // #container -->

 
<script>

// 마스터 카테고리 버튼 select
$('.mf_cate_btn').on('click', function(){
    $(this).addClass('active').parent('li').siblings().children('.mf_cate_btn').removeClass('active');
});

var chk = 0;
var coachingData = '';

var keyword = '${param.keyword}';


// 손으로 잡아 움직이는 슬라이드 스크롤 바 in PC
const slider = document.querySelector('.main_tab_lists_c');
let isMouseDown = false;
let startX, scrollLeft;

$(slider).mousedown(function(e){
	isMouseDown = true;
	$(this).addClass('active');
	
	startX = e.pageX - slider.offsetLeft;
	scrollLeft = slider.scrollLeft;
//		console.log( startX );
//		console.log( scrollLeft );
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
	
//		console.log( x );
//		console.log( walk );
//		console.log( this.scrollLeft );
} );




$(document).ready(function(){
// 	var params = new Object();
// 	params.stauts = "LIST";
// 	params.query = "";
// 	params.KEY_WORD = '${param.keyword}';

	chk = 1;
// 	console.log( params );
	// 마스터
	fn_CategoryList();
	fn_BtnChangeList('');
	// 상품	
	fn_BtnPrdtChangeList( );
	
	
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
//				if ( typeof $('.btn_following:eq(0)').attr('id') == 'undefined' ) 
//					params.FOLL_IDX = '';
//				else
//					params.FOLL_IDX = $('.btn_following:eq(0)').attr('id').replace( 'follow', '' );
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
//				if ( typeof $('.btn_following:eq(0)').attr('id') == 'undefined' ) 
//					params.FOLL_IDX = '';
//				else
//					params.FOLL_IDX = $('.btn_following:eq(0)').attr('id').replace( 'follow', '' );
			var followResult = fn_DataAjax2( params ); 
	   
    });
	
    setTimeout( function(){ prdtTabEvent();  }, 2000 );
    $( '#now_loading' ).hide();
});

// 카테고리
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
		
		inTag += '<li  class="main_tab main_tab_c"><a class="is-active" onclick="fn_keywordChangeList(\'\');">전체</a></li>';
		
		$.each(jsonData, function(key, val){
			inTag += '<li  class="main_tab main_tab_c" ><a onclick="fn_keywordChangeList(\''+val.CODE_NM+'\');">'+val.CODE_NM+'</a></li>';
		});
		
		$('.main_tab_lists').append( inTag );

	    $('.main_tab_c a').on('click', function(){
	        $(this).addClass('active is-active').parent('li').siblings().children('.main_tab_c a').removeClass('active is-active');
	    });
	}
}

function fn_keywordChangeList( SEARCH_VAL ){
	fn_BtnChangeList(SEARCH_VAL);
	fn_BtnPrdtChangeList(SEARCH_VAL);
}

function fn_BtnChangeList( SEARCH_VAL ){
	
	var params = new Object();
	params.status = "LIST";
	params.query = "selectFrontMainList";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.SEARCH_VAL = SEARCH_VAL;
	params.keyword = keyword;
	
	fn_DataList( params, "dataList", 7 );
}

function fn_DataList( PARAMS, OBJECT_ID, CNT ) {
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result.out.detail.data;
	var inTag = '';
	
	if( chk == 0 ) coachingData = jsonData;

	$('.ready').empty();
	
	
	var params = new Object();
	params.query = "selectFrontMainMasterTimeCnt";
	params.status = "LIST";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	
	var masterTimeCntResult = fn_DataAjax2( params );
// 	console.log( masterTimeCntResult );
	
	var hasTimeList = [];
	
	var temparr = [];
	
	var temp_SALE_PRDT_CD = [];
	
	var temp_SALE_PRDT_CD_temp = '';
	
	// 1:1 코칭들이 중복되어 들어가지 않게 하는 값
	var haveCode = '';
	
	$.each( masterTimeCntResult.out.detail.data, function( mkey, mval ){
		$.each( jsonData, function( jkey, jval ){
			if ( mval.CATE_IDX == jval.CATE_IDX ) {
// 				console.log(jval);
				temp_SALE_PRDT_CD_temp = '';
				$.each( jval.PRDT_CD.split(','), function( jsplitkey, jsplitval ){
					
					if ( jsplitval.indexOf('CN') > -1 ) {
						if ( mval.TIME_CNT.split(',')[jsplitkey] > 0 ) {
							if ( haveCode.indexOf( jval.CATE_IDX ) == -1 ) {
								haveCode += jval.CATE_IDX;
								temparr.push(jval);
							}
							temp_SALE_PRDT_CD_temp += 'CN,';
						}
					}
					if ( jsplitval.indexOf('EN') > -1 ) {
						if ( haveCode.indexOf( jval.CATE_IDX ) == -1 ) {
							haveCode += jval.CATE_IDX;
							temparr.push(jval);
						}
						temp_SALE_PRDT_CD_temp += 'EN,';
					}
					if ( jsplitval.indexOf('FN') > -1 ) {
						if ( mval.TIME_CNT.split(',')[jsplitkey] > 0 ) {
							if ( haveCode.indexOf( jval.CATE_IDX ) == -1 ) {
								haveCode += jval.CATE_IDX;
								temparr.push(jval);
							}
							temp_SALE_PRDT_CD_temp += 'FN,';
						}
					}
					if ( jsplitval.indexOf('LN') > -1 ) {
						if ( mval.TIME_CNT.split(',')[jsplitkey] > 0 ) {
							if ( haveCode.indexOf( jval.CATE_IDX ) == -1 ) {
								haveCode += jval.CATE_IDX;
								temparr.push(jval);
							}
							temp_SALE_PRDT_CD_temp += 'LN,';
						}
					}
					if ( jsplitval.indexOf('VL') > -1 ) {
						if ( haveCode.indexOf( jval.CATE_IDX ) == -1 ) {
							haveCode += jval.CATE_IDX;
							temparr.push(jval);
						}
						temp_SALE_PRDT_CD_temp += 'VL,';
					}
					
				} ); 
				temp_SALE_PRDT_CD.push(temp_SALE_PRDT_CD_temp);
			}
			
		} );
	} );
	
//		console.log( temparr );
//		console.log( temp_SALE_PRDT_CD );
	
	// 공백값 제거 (시간있는 수업들만 추림) 
	var temp_sale_prdt_cd_ = temp_SALE_PRDT_CD.filter( function(val){ if(val != '') return true; } );
	
	// 시간 없는 애들 없애버린 리스트로 교체
	jsonData = temparr;
	
	
	
	 if( jsonData.length > 0 ) {
		 var over8cnt = 0;
		$.each(jsonData, function(key, val) {
			
			if( val.CATE_READ_YN == 'Y' ) {
				
				over8cnt++;
				
  				imgIdValue = 'CATE_MASTEROPEN_UUID';
  				setUuid(val.CATE_MASTEROPEN_UUID);
  				unit_fileGet( imgIdValue+'_FILE' , "fn_fileUpload");
  				
				inTag += '<div class="mf_item '+( over8cnt > 8?"open_over8":"") +' "  >';
				inTag += '<div class="mf_item_inner">';
				inTag += '<a href="'+val.MOVE_URL+'">';
				
				inTag += '<div class="mf_thumb phones_mf_thumb" style="background-image: url('+$('#imgTag').val()+');">';
				if( val.FOLL_VAL == 'Y' ) inTag += '<button type="button" class="follow_btn toggle_btn active is-active" value="'+val.CATE_IDX+'"></button>';
				else inTag += '<button type="button" class="follow_btn toggle_btn" value="'+val.CATE_IDX+'"></button>'; 
				
				inTag += '</div>';
				inTag += '<div class="mf_info">';
				inTag += '<span class="mf_cate">'+val.P_CODE_NM+'·'+val.USER_NM+'</span>';
				inTag += '<span class="mf_title">';
								
				inTag += is_too_long_word( val.INFO_MAST_TITL1, val.INFO_MAST_TITL2, 11, 'Y' );
				
				inTag += '</span>';
				inTag += '<div class="mf_tag_box">';
				
				if( temp_sale_prdt_cd_[key] != '' ) { 
					if( temp_sale_prdt_cd_[key].indexOf('VL') > -1 ) inTag += '<button type="button" class="mf_btn">VOD</button>';
					if( temp_sale_prdt_cd_[key].indexOf('EN') + temp_sale_prdt_cd_[key].indexOf('FN') + temp_sale_prdt_cd_[key].indexOf('CN') > -3 ) inTag += '<button type="button" class="mf_btn active">1:1 코칭</button>';
					if( temp_sale_prdt_cd_[key].indexOf('LN') > -1 ) inTag += '<button type="button" class="mf_btn">LIVE CLASS</button>';
				} 
				else {
					inTag += '<button type="button" class="mf_btn">준비중</button>';
				}
				
				inTag += '</div>';
				inTag += '</div>';
				inTag += '</a>';
				inTag += '</div>';
				inTag += '</div>';
				
			}
		});

		if( over8cnt > 8 ) inTag += '<button type="button" class="more_btn" value="open_over8">more</button>';
		
		if( over8cnt == 0 ) {

			inTag += '<div style="text-align:center; padding-top: 40px;"><h1>검색 결과가 없습니다.</h1></div>';
//          	inTag += '		<div class="noneMasterDiv">';
//             inTag += '		<a href="javascript:;" class="noneMaster">해당 카테고리에 준비된 마스터가 없습니다.</a>';
//          	inTag += '		</div>';
         	
		}
		
		$('.ready').append( inTag );

		// toggle btn 이거없으면 팔로우 안됨
		$('.toggle_btn').on('click', function(e){
		    e.preventDefault();
		    $(this).toggleClass('active');
		});
		
	 }else{
		inTag += '<div style="text-align:center; padding-top: 40px;"><h1>검색 결과가 없습니다.</h1></div>';
		$('.ready').append( inTag );
		
		inTag = '';
	 }
}

//게시물 8개만 보여주고 더보기버튼 눌렀을때 8개씩 보여주기
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
	}else if( this.value == 'prdt_over8' ){
		for (var i = 0; i < 8; i++) {
			$('.prdt_over8').eq( 0 ).removeClass('prdt_over8');			
		}
		if ( $('.prdt_over8').length == 0 ) 
			$(this).remove();
	}
	
});


// 상품
	$('.prdt_tab_lists  > li').click(function(){
		$('.prdt_tab_lists  > li > a').removeClass('active');
		
		var gnbText = $(this).text();
		localStorage.setItem("frontPrdtType", gnbText)
		var gnbSes = localStorage.getItem("frontPrdtType");
		if( gnbText.indexOf( gnbSes ) > -1 ) $(this).children('a').addClass('active');
		
		fn_BtnPrdtChangeList();
	});

	function fn_BtnPrdtChangeList( CODE_NM ){
		
		var params = new Object();
		params.status = "LIST";
		params.query = "selectFrontPrdtList";
		params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
		params.SEARCH_VAL = localStorage.getItem("frontPrdtType");
		if( CODE_NM != '' || CODE_NM != null ) params.CODE_NM = CODE_NM;
// 		else params.CODE_NM = 'VOD';
		params.URL = window.location.pathname;
		params.keyword = keyword;
		
		fn_Prdt_DataList( params, "dataList", 7 );
	}
	
	function fn_Prdt_DataList( PARAMS, OBJECT_ID, CNT ) {
		var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
		var jsonDetail = result.out.detail.data;
		var inTag = '';
		
		
		var temp = '';
		var temparr = [];
		
		var temp_SALE_PRDT_CD = [];
		
		var temp_SALE_PRDT_CD_temp = '';
		
		// 1:1 코칭들이 중복되어 들어가지 않게 하는 값
		var haveCode = '';
		
		
		console.log( jsonDetail );
		$.each(jsonDetail, function( prekey, preval ){
			temp_SALE_PRDT_CD_temp = '';
			$.each(preval.PRDT_TYPE3.split(','), function( typekey, typeval ){
				if ( preval.PRDT_TYPE == 'LIVE CLASS' ) {
					if( typeval.indexOf('LN') > -1 ){
						if( preval.TIME_CNT.split(',')[typekey] > 0 ){
							temparr.push(preval);
							temp_SALE_PRDT_CD_temp += 'LN';
						}
					}
				}
				if ( preval.PRDT_TYPE == 'VOD' ) {
					if( typeval.indexOf('VL') > -1 ){
							temparr.push(preval);
							temp_SALE_PRDT_CD_temp += 'VL';
					}
				}
				if ( preval.PRDT_TYPE == '1:1 코칭' ) {
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
		
		console.log( temparr );
// 		console.log( temp_SALE_PRDT_CD );
		
		// 공백값 제거
	 	var temp_sale_prdt_cd_ = temp_SALE_PRDT_CD.filter( function(val){ if(val != '') return true; } );
		
	 	console.log(temp_sale_prdt_cd_);
// 	 	console.log(temparr.length);
// 	 	if ( temparr.length > 0 ) {
	// 라이브 클래스나 1:1 코칭이라면 바끤걸로 보여준다
		 jsonDetail = temparr;
		
		
		 if( jsonDetail.length > 0 ) {
			var keyCnt = 0;
			$('.prdt_list_item').empty( );
			$.each(jsonDetail, function(key, val) {
	   			if( val != null ) {
					if( val.INFO_TUMB_UUID != null || val.INFO_TUMB_UUID != '') {
		  				imgIdValue = 'INFO_TUMB_UUID';
		  				setUuid(val.INFO_TUMB_UUID);
		  				unit_fileGet( imgIdValue+'_FILE' , "fn_fileUpload");
					}
					keyCnt = key;
					inTag += '<div class="mf_item '+( key > 7?"prdt_over8":"") +'">';
					inTag += '<div class="mf_item_inner">';
					inTag += '<a href="'+val.MOVE_URL.replace('master','prdt')+'">';
					
					if( val.INFO_TUMB_UUID != null || val.INFO_TUMB_UUID != '')
						inTag += '<div class="mf_thumb" style="background-image: url('+$('#imgTag').val()+');">';
					else
						inTag += '<div class="mf_thumb" style="">';
						
					if( val.JJIM_IDX != 'NOJJIM' ) inTag += '				<button style="z-index:10;" type="button" id="JJIM'+val.JJIM_IDX+'" class="like_btn toggle_btn is-active active"></button>';
		   			else inTag += '				<button style="z-index:10;" type="button" class="like_btn toggle_btn NOJJIM"></button>';
					inTag += '<input id="like'+val.PRDT_CD+'" name="jjim_prdt_cd" type="hidden" value="'+val.CATE_IDX+'" >';
					inTag += '</div>';
					inTag += '<div class="mf_info">';

					if( val.SALE_PRDT_CD.indexOf('FN') > -1 ) inTag += '<span class="mf_cate">1:1화상·'+val.P_CODE_NM+'·'+val.USER_NM+'</span>';
					else if( val.SALE_PRDT_CD.indexOf('CN') > -1 ) inTag += '<span class="mf_cate">1:1채팅·'+val.P_CODE_NM+'·'+val.USER_NM+'</span>';
					else if( val.SALE_PRDT_CD.indexOf('EN') > -1 ) inTag += '<span class="mf_cate">1:1이메일·'+val.P_CODE_NM+'·'+val.USER_NM+'</span>';
					else inTag += '<span class="mf_cate">'+val.PRDT_TYPE+'·'+val.P_CODE_NM+'·'+val.USER_NM+'</span>'; 
					 
					inTag += '<span class="mf_title">';
					inTag += is_too_long_word( val.INFO_PRDT_TITL1, val.INFO_PRDT_TITL2, 11, 'Y' );
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

					inTag += '<span class="pp_price ">';
					inTag += '<b class="pp_pay">'+numberWithCommas( val.PRDT_PRIC_REAL )+'</b> 원';
					inTag += '<span class="pp_sub"></span>';
					inTag += '</span>';

					inTag += '<div class="mf_tag_box phone_mf_tag_box tablet_mf_tag_box" style="height:20px;">'; 

					if ( val.PRDT_TYPE == '1:1 코칭' ) {
						if( temp_sale_prdt_cd_[key].indexOf('FN') > -1 ) inTag += '<button type="button" class="mf_btn">1:1화상</button>';
						if( temp_sale_prdt_cd_[key].indexOf('CN') > -1 ) inTag += '<button type="button" class="mf_btn">1:1채팅</button>';
						if( temp_sale_prdt_cd_[key].indexOf('EN') > -1 ) inTag += '<button type="button" class="mf_btn">1:1이메일</button>';
					} else if ( val.PRDT_TYPE == 'VOD' ) {
						if( val.PRDT_TYPE3.indexOf('VL') > -1 ) inTag += '<button type="button" class="mf_btn">VOD</button>';
					} else {
						if( val.PRDT_TYPE3.indexOf('LN') > -1 ) inTag += '<button type="button" class="mf_btn">LIVE CLASS</button>';
					}
					
					inTag += '</div>';
					
					
					inTag += '</div>';
					inTag += '</div>';
					inTag += '</a>';
					inTag += '</div>';
					inTag += '</div>';
		
					
					$('#imgTag').val('');
	   			}
			});
			
			if( keyCnt > 7 ) inTag += '<button type="button" class="more_btn" value="prdt_over8">more</button>';
			$('.prdt_list_item').append( inTag );
					
			inTag = '';
			
			$('.like_btn').click(function(e){
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
						      		$(this).addClass('active is-active'); 
						      			
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
				      			$(this).addClass('active is-active'); 
				      			
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
				      				$(this).removeClass('active is-active'); 
						      			
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
				      			$(this).removeClass('active is-active'); 
				      				
			      			}
			      				
			      				
			      		}
		        	}
		      });
			
			
			
			
		 }else{
			 $('.prdt_list_item').empty( );
			 inTag += '<div style="text-align:center; padding-top: 40px;"><h1>검색 결과가 없습니다.</h1></div>';
			 $('.prdt_list_item').append( inTag );
		 }

// 		$('.mf_item_list').each(function(key, val){
// 			if( $(this).html() == '' ) {
// 				var tagVal = $(this).parent('div');
// 				tagVal = tagVal.parent('div');s
// 				tagVal.remove();
// 			}
// 		});
	}
	


</script>