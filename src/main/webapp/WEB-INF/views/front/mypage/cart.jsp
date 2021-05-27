<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	

/* SCROLL */
::-webkit-scrollbar { width: 2px;     border-radius: 40px;}
/* 스크롤바의 width */
::-webkit-scrollbar-track { background-color: black; }
/* 스크롤바의 전체 배경색 */
::-webkit-scrollbar-thumb { 
    background:#444; 
}
/* 스크롤바 색 */
::-webkit-scrollbar-button { display: none; }
/* 위 아래 버튼 (버튼 없애기를 함) */


.prdt_apply_btn{letter-spacing: 0px;line-height: 0px;}
	
.btn_nothing{
	float: left!important;
    width: 40px!important;
    height: 40px!important;
    border-radius: 3px!important;
    overflow: hidden!important;
    margin-right: .25em!important;
    position: relative!important;
    color: gray;
    background: black;
}	
.btn_nothing .fa-slash{position: absolute;   left: 10px;}
.payment_info_inn { position: relative; }
.amount {     position: absolute;    top: calc(50% - 13px);    right: 0; }
.prdtCardImg{
	height: 160px;
    width: 220px;
    position: relative;
    background-size: cover;
    background-position: center center;
    background-repeat: no-repeat;}
@media screen and (max-width: 440px) {
.amount {     position: unset; margin-top: 5px; }
}


@media screen and (max-width: 400px){
	.prdtCardImg { 
	    height: 50px;
	    width: 90px;
	}
}
</style>

    <div id="container">
      <div class="section_inner">
        <section>
            <div class="section_inner">
	            <div class="breadcrumb">
                    <span class="is-active">홈</span>
                    <span>주문내역</span>
                    <span>장바구니</span>
                </div>
                    <h3 class="page_title">주문내역</h3>
<!--                 <div class="section_cont_top" style="border-bottom: none;"> -->
<!--                     <div class="section_cont_top_breadcrumb"> -->
<!--                         <span>01 주문내역</span> -->
<!--                         <span class="is-active">02 장바구니</span> -->
<!--                         <span>03 결제</span> -->
<!--                         <span>04 결제완료</span> -->
<!--                     </div> -->
<!--                 </div> -->
            </div>     
        </section>

        <div class="lnb">
	        <ul>
	            <li class="lnb_item"><a href="/front/mypage/payment">결제내역</a></li>
	            <li class="lnb_item"><a href="/front/mypage/mycoupon">내 쿠폰</a></li>
	            <li class="lnb_item is-active"><a href="/front/mypage/cart">장바구니</a></li>
	            <li class="lnb_item"><a href="/front/mypage/like">찜</a></li>
	            <li class="lnb_item"><a href="/front/mypage/refund">취소/환불내역</a></li>
	            <li class="lnb_item"><a href="/front/mypage/inquiry">1:1문의</a></li>
	        </ul>
        </div>

        <section>
                <div class="board_list_sta">
                    <div class="board_list_sta_left">
                        <label for="baskAllCheck" class="form_check">
                             <input type="checkbox" id="baskAllCheck" name="baskCheck" class="custom_sq_check" value="">
<!--                             <input type="checkbox" id="all" name="all" > -->
                            <span class="form_check_mark all"></span> 전체선택
                        </label>
                        <span>(총 <i class="color_main">0</i>개 / <span>0개</span> )</span>
                    </div>
                    
                    <div class="board_list_sta_right">
                        <button type="button" class="board_list_sta_button list_sta_btn_like">찜</button>
                        <button type="button" class="board_list_sta_button list_sta_btn_remove">삭제</button>
                    </div>
            	</div>

                <div class="board_list_payment cart" >
                    <ul id="baskList">
                    </ul>
                </div>
        </section>


        <section class="section_last">
<!--             <div class="section_inner"> -->
                <div class="cart_info">
                    <div class="card_info_top">
                        <strong class="card_info_title">총 주문금액</strong>
                        <div class="card_info_cont">
                            <ul>
                                <li>
                                    <strong>총 상품금액</strong>
                                    <span></span>
                                </li>
                                <li>
                                    <strong>할인 금액</strong>
                                    <span></span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="card_info_bottom">
                        <strong class="card_info_title">결제 예상금액</strong>
                        <div class="card_info_cont color_main"></div>
                    </div>
                </div>
				<button class="card_info_button" onclick="goPayment();">결제하기</button>
            </div>
<!--         </section> -->


</div>
    </div><!-- // #container -->
    
<!-- <script type="text/javascript" src="/resources/assets/js/jquery-1.12.4.min.js"></script> -->
<!-- <script type="text/javascript" src="/resources/assets/js/slick.min.js"></script> -->
<!-- <script type="text/javascript" src="/resources/assets/js/common.js"></script> -->
<!-- <script type="text/javascript" src="/resources/assets/js/jquery-ui/jquery-ui.min.js"></script> -->
<script>
var no_use_time_cnt = 0;

    $(document).ready(function(){
        clickToggleClassPopupEvent('.btn_like',{
            popupType : 'alert',
            popupMsg: '찜 목록에 추가되었습니다.',
            beforePopup: function(thisBtn){
                //thisBtn == 클릭한 버튼
                //찜하기 클릭시 (팝업 나오기전)
            },
            callback: function(thisBtn){
                //팝업확인클릭시 callback        
            }
        });
        choiceLikeEvent();
        
        checkAllEvent(
            'input[name="all"]', //all checkbox 
            '.board_list_payment input[type=checkbox]' //card checkbox
        );

        choiceRemoveEvent();
        cardRemoveEvent();
        
        $( '#now_loading' ).hide();
    });

    function choiceLikeEvent(){
        var $btn = $('.list_sta_btn_like');
        $btn.on('click', function(){
            var $allCheckbox = $('input[name="all"]');
            var popupMassage = '';
            var $otherCheckbox = $('.board_list_payment input:checked');
            var popupMassage = '';
            if($allCheckbox.is(':checked')){
                popupMassage = '전체 상품이 찜 목록에 추가되었습니다.';
            }else{
                popupMassage = $otherCheckbox.length + '개 상품이 찜 목록에 추가되었습니다.'
            }  
            new PopupAlert({
                type: 'alert', // popup type (alert, confirm)
                msg: popupMassage, // 팝업 메세지
                callback: function(){

					$('[name=baskCheck]:checked').not('#baskAllCheck').each(function(){
						
						var params = new Object();
						params.status = "DETAIL";
						params.query = "selectFrontBaskJjimData";
				    	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
				    	params.BASK_IDX = $(this).val();
						
				    	var detailResult = fn_DataAjax2( params );
				    	
				    	if ( detailResult.out.detail.data.length > 0 ) {
				    	
				    		params.query = "updateFrontDibsData";
				        	params.status = "EDIT";
				        	params.BASK_TYPE = "K"; 
				        	params.JJIM_IDX = $(this).attr('JJIM_IDX');
							params.BASK_IDX = detailResult.out.detail.data[0].BASK_IDX;
				        	
				        	if ( $(this).hasClass('is-active') ) {
					    		$(this).removeClass('is-active');
					    		params.BASK_USE_YN = 'N';
					    	}else{
					    		$(this).addClass('is-active');
					    		params.BASK_USE_YN = 'Y';
					    	}
				        	
				        	var result = fn_DataAjax2( params );
				        	
				    	}else{
				    		
		                	var params = new Object();
		                	params.query = "insertFrontDibsData";
		                	params.status = "JJIM";
		                	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
		                	params.BASK_TYPE = "B";
		                	params.JJIM_IDX = $(this).attr('JJIM_IDX');
					    	params.BASK_IDX = $(this).val();
		                	
		                	if ( $(this).hasClass('is-active') ) {
		                		$(this).removeClass('is-active');
		                		params.BASK_USE_YN = 'N';
		                	}else{
		                		$(this).addClass('is-active');
		                		params.BASK_USE_YN = 'Y';
		                	}
		                	
		                	var result = fn_DataAjax2( params );
		                	
					    	location.reload();
				    	}
						
						
						
						
						
					});
					
//                     $otherCheckbox.parents('.board_list_item').find('.btn_like').addClass('is-active');
                }
            });
        });
    }
    

    function cardRemoveEvent(){
        clickPopupEvent('.board_list_item .btn_cancel', {
            popupType: 'confirm',
            popupMsg: '1개 상품을 삭제하시겠습니까?',
            callback: function(thisBtn){
                $(thisBtn).parents('.board_list_item').remove();
            }
        });
    }

    function choiceRemoveEvent(){
        var $btn = $('.list_sta_btn_remove');
        
        $btn.on('click', function(){
            var $allCheckbox = $('#baskAllCheck');
            var popupMassage = '';
            var $otherCheckbox = $('.board_list_payment input:checked');
            var popupMassage = '';
            
            if($allCheckbox.is(':checked')) popupMassage = '장바구니 상품을<br>모두 삭제하시겠습니까?';
            else popupMassage = $otherCheckbox.length + '개 상품을 삭제하시겠습니까?'

            new PopupAlert({
                type: 'confirm', // popup type (alert, confirm)
                msg: popupMassage, // 팝업 메세지
                callback: function(){
//                     $otherCheckbox.parents('.board_list_item').remove();
//                     $allCheckbox.prop('checked', false)

					$('[name=baskCheck]:checked').not('#baskAllCheck').each(function(){
						if( $(this).val() != null ) {
					    	var params = new Object();
					    	params.query = "deleteFrontCartData";
					    	params.BASK_IDX = $(this).val();
					    	params.status = "DELETE";
					    	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
					    	var result = fn_DataAjax2( params );	
					    	
				    		location.reload();
						}
					});

// 		    		alert('삭제가 완료되었습니다.');
// 					baskCheck
// 					baskJjimIdx
                }
            });
        });
    }
    
    
    var coupList = "";

    $( function() {
    	if( localStorage.getItem("frontLoginIdx") == null ){
    		return location.href = "/";
    	}
    	localStorage.removeItem("baskArr");
    	localStorage.removeItem("baskCnt");
    	var params = new Object();
    	params.status = "LIST";
    	params.query = "selectFrontCartList";
    	params.USER_IDX = localStorage.getItem("frontLoginIdx");
    	params.BASK_TYPE = "B";

    	var result = fn_DataAjax2( params );	
    	result = result.out.detail.data;
    	var html = "";
    	
// INFO |---------|------------|---------|------------|---------|--------------|--------|-----------|---------|----------|---------------|----------|-------------|----------------| 
// INFO |BASK_IDX |JJIM_USE_YN |JJIM_IDX |SYS_REG_DTM |CATE_IDX |PRDT_CD       |USER_NM |PRDT_TYPE  |PRDT_CNT |PRDT_PRIC |PRDT_PRIC_REAL |PRDT_UUID |PRDT_UUID_NM |INFO_PRDT_TITL1 | 
// INFO |---------|------------|---------|------------|---------|--------------|--------|-----------|---------|----------|---------------|----------|-------------|----------------| 
// INFO |57       |Y           |56       |2021-01-25  |8        |202011CNA0011 |마스터1    |1:1채팅상담    |         |444,444   |444,000        |PRDT_UUID |PRDT_UUID_NM |제목1             | 
// INFO |59       |N           |55       |2021-01-25  |8        |202012ENA0010 |마스터1    |1:1이메일상담   |16 건     |564,656   |378,310        |PRDT_UUID |PRDT_UUID_NM |제목1             | 
// INFO |60       |Y           |58       |2021-01-25  |8        |202011LNA0027 |마스터1    |LIVE CLASS |         |50,000    |5,000          |PRDT_UUID |PRDT_UUID_NM |소개소개            | 
// INFO |73       |Y           |72       |2021-01-26  |20       |202101FNA0001 |유수연     |1:1화상상담    |         |300,000   |270,000        |PRDT_UUID |PRDT_UUID_NM |60만 수강생 스타강사    | 
// INFO |76       |Y           |75       |2021-01-26  |20       |202101LNA0001 |유수연     |LIVE CLASS |         |500,000   |400,000        |PRDT_UUID |PRDT_UUID_NM |유수연의            | 
// INFO |---------|------------|---------|------------|---------|--------------|--------|-----------|---------|----------|---------------|----------|-------------|----------------| 

        	$('#baskList').empty();
    	
    	$.each(result, function( k, v ){
    		$('.board_list_sta_left > span > span').text( result.length + '개');
    		
			console.log( v );

			
				
    		if( v.INFO_TUMB_UUID != null ) {
    			setUuid(v.INFO_TUMB_UUID);
    			unit_fileGet( 'INFO_TUMB_UUID_FILE' , "fn_fileUpload");
    		}

    		html += '<li class="board_list_item">';
    		html += '	<div class="board_list_item_row">';
    		html += '		<div class="board_list_col payment_checkbox">';
    		html += '			<div class="payment_checkbox_inn">';
    		html += '				<label for="baskCheck'+k+'" class="form_check">';
    		html += '					<input type="checkbox" id="baskCheck'+k+'" name="baskCheck" value="'+v.BASK_IDX+'" JJIM_IDX="'+v.JJIM_IDX+'" >';
    		html += '					<input type="hidden" name="noUseTimeCnt" value="'+v.NO_USE_TIME_CNT+'" >';
    		html += '					<span class="form_check_mark gopay" id="pay'+v.PRDT_CD+'"></span>';
    		html += '				</label>';
    		html += '			</div>';
    		html += '		</div>';
    		html += '		<div class="board_list_col payment_info phones_payment_info">';
    		html += '			<div class="board_list_table">';
    		html += '				<div class="board_list_row">';
    		html += '					<div class="payment_img tablets_payment_img phones_payment_img">';
    		html += '						<a href="'+v.MOVE_URL+'">';
    		
    		
    		if( v.INFO_TUMB_UUID != null ) {
				var chkStr = v.INFO_TUMB_UUID.trim();
				if( chkStr != 'undefined' ) {
					if( chkStr != '') {
		        		setUuid(v.INFO_TUMB_UUID);
		        		unit_fileGet( v.INFO_TUMB_UUID_NM , "fn_fileUpload");
// 		        		html += '							<img src="'+$('#imgTag').val()+'" alt="">';
		        		html += '							<div class="prdtCardImg" style="background-image: url('+$('#imgTag').val()+');"></div>';
		        		$('#imgTag').val('');
					} else html += '							<div class="prdtCardImg" style="background-image: url(/resources/assets/images/sub/profile_default_img.png);"></div>'; 
				} else html += '							<div class="prdtCardImg" style="background-image: url(/resources/assets/images/sub/profile_default_img.png);"></div>';
			} else html += '							<div class="prdtCardImg" style="background-image: url(/resources/assets/images/sub/profile_default_img.png);"></div>';
    	
			
    		
    		html += '						</a>';
    		html += '					</div>';
    		html += '					<div class="payment_info_inn">';
    		html += '						<a href="'+v.MOVE_URL+'">';
    		html += '							<span class="sub_title">['+v.PRDT_TYPE+'] '+v.P_CODE_NM+' ·'+v.USER_NM+'</span>';
    		html += '							<p class="title">'+v.INFO_PRDT_TITL1+'</p>';
    		html += '							<p class="title">'+v.INFO_PRDT_TITL2+'</p>';
    		
    		html += '						</a>';
    		html += '						<span class="Period_of_use">';
    		html += '							<div> ';
    		
    												if ( v.PRDT_TYPE == 'VOD' ) {
    		    html += '                        <span></span>';
    		    html += '                        <span>'+v.PRDT_TIME+'일</span>';
    												}else if ( v.PRDT_TYPE == '1:1화상상담' ) {
    		    html += '                        <span></span>';
    		    html += '                        <span>'+getRidOfDupleDate( v.PRDT_USE_DTM )+'</span>';
    												}else if ( v.PRDT_TYPE == '1:1채팅상담' ) {
    		    html += '                        <span></span>';
    		    html += '                        <span>'+getRidOfDupleDate( v.PRDT_USE_DTM )+'</span>';
    												}else if ( v.PRDT_TYPE == '1:1이메일상담' ) {
    		    html += '                        <span></span>';
    		    html += '                        <span>'+ v.PRDT_USE_DTM +'</span>';
    												}else if ( v.PRDT_TYPE == 'LIVE CLASS' ) {
    		    html += '                        <span></span>';
    		    html += '                        <span>'+getRidOfDupleDate( v.PRDT_USE_DTM )+'</span>';
    												}
    		
    		html += '							</div>';
    		html += '						</span>';
    		html += '<div class="amount">';
			html += 	'<div class="amount-control">';
		
			if ( v.PRDT_TYPE == 'VOD' ) {
				html +=			'<input type="hidden" name="prdt_cnt" value="1" maxlength="3"  readonly=readonly />';
			}else{
				
				html += 		'<a class="opt-cnt-minus '+(v.BASK_CNT > 1 ?'' : 'disabled') +' " href="javascript:void(0)" onclick="return false;">-</a>';
				html += 		'<input type="text" name="prdt_cnt" value="'+v.BASK_CNT+'" maxlength="3" readonly=readonly />';
				html += 		'<a class="opt-cnt-plus" href="javascript:void(0)" onclick="return false;">+</a>';
			}
			
			html += 	'</div>';
			html += '</div>' ;
    		html += '					</div>';
    		html += '					<div class="payment_price index'+k+'">';
    		html += '						<span><span>'+numberWithCommas(v.BASK_CNT * v.PRDT_PRIC_NOCOMMA)+'</span> 원</span>';
    		html += '						<span><span class="buyNowMoney">'+numberWithCommas(v.BASK_CNT * v.PRDT_PRIC_REAL_NOCOMMA)+'</span> 원</span>';
    		html += '					</div>';
    		html += '				</div>';
    		html += '			</div>';
    		html += '		</div>';
    		html += '		<div class="board_list_col payment_button">';
    		html += '			<div class="payment_button_area phones_payment_button_area">';
    		html += '				<button type="button" class="btn_like jjim '+jjimYn( v.JJIM_USE_YN  )+'" BASK_IDX="'+v.BASK_IDX+'" name="jjim'+jjimChk( v.JJIM_IDX )+'" >찜</button>';

//     		if( v.PRDT_CD.indexOf('FN')*1+v.PRDT_CD.indexOf('CN')*1+v.PRDT_CD.indexOf('LN')*1 != -3 ) {
//     			html += '				<button type="button" class="btn_time clockui" onclick="prdtCd=\''+v.PRDT_CD+'\';cateIdx=\''+v.CATE_IDX+'\';">'+'<i class="far fa-clock"></i>'+'</button>'; 
// //     			html += '				<button type="button" style="margin-left: 10px; " class="btn_time" onclick="prdtCd=\''+v.PRDT_CD+'\';cateIdx=\''+v.CATE_IDX+'\'">'+'<i class="far fa-clock"></i>'+v.PRDT_CD+'시간설정</button>'; 
//     		}else{
//     			html += '				<button type="button" class="btn_nothing">'+'<i class="far fa-slash"></i><i class="far fa-clock"></i>'+'</button>'; 
//     		}
    		
    		html += '				<button type="button" class="refund_btn buynow prdt_apply_btn masterHomeDetail" onclick=" no_use_time_cnt = \''+v.NO_USE_TIME_CNT+'\';prdtCd=\''+v.PRDT_CD+'\';cateIdx=\''+v.CATE_IDX+'\';isMypageSetTime=1;istest(\''+v.NO_USE_TIME_CNT+'\',this);">바로구매</button>';
    		html += '			</div>';
    		html += '			<button type="button" id="del'+v.BASK_IDX+'"  class="btn_cancel delone">삭제</button>';
    		html += '		</div>';
    		html += '	</div>';
    		html += '</li>';
    	});
    	
    	if (html == "") {
    		html = '<div class="mlt_row hasbtn noDataList" >등록된 내용이 없습니다.</div>';
    	}

    	$('#baskList').append(html);
    	html = '';
    	$('#imgTag').val( '' );
    	
    	
//     	$('.prdt_apply_btn').on('click',function(){
//     		$('#applyStep1Pop').show();
//     		fn_PrdtBuyDetail(  );
//     	});
    	
    	// 중요
    	$('.btn_time').on('click',function(){
    		$('#applyStep1Pop').show();
    		fn_PrdtBuyDetail();
    	});
    	
//     	$('.form_check_mark.all').click(function(){
//     		var mTagId = $(this).attr('class')
//         	if( $('#baskAllCheck').prop('checked') ){ $('[name=baskCheck]').prop('checked', false);  }
//         	else{ $('[name=baskCheck]').prop('checked', true); }
//         	chkPrice();
//     	});
    	
        $('[name=baskCheck]').click(function(){
        	if ( $('[name=baskCheck]:checked').not('#baskAllCheck').length == $('[name=baskCheck]').not('#baskAllCheck').length ) {
	        	$('#baskAllCheck').prop('checked', true);
			}else{
	        	$('#baskAllCheck').prop('checked', false);
			}
        	chkPrice();	
        });
        
        $('#baskAllCheck').click(function(){
        	if( $('#baskAllCheck').prop('checked') ){ $('[name=baskCheck]').prop('checked', false);  }
        	else{ $('[name=baskCheck]').prop('checked', true); }
        	chkPrice();
        });
		
        
        $(document).on('keypress', '[name=prdt_cnt]', function(){
     	   $(this).val($(this).val());
        });
        
        $(document).on('click', '.amount-control > a', function(){
     		var cnt =  $(this).siblings('[name=prdt_cnt]').val();
     		var target = $(this).closest('.payment_info_inn').siblings('.payment_price');
     		var targetprice1 = target.children('span:eq(0)').find('span').text().replace('원','');
     		var targetprice2 = target.children('span:eq(1)').find('span').text().replace('원','');
     		targetprice1 = targetprice1.replace(/,/g,'');
     		targetprice2 = targetprice2.replace(/,/g,'');
     		targetprice1 = targetprice1/cnt;
     		targetprice2 = targetprice2/cnt;
     		
     		if ($(this).hasClass('opt-cnt-minus') ){
 				if ($(this).hasClass('disabled')) return alert( '더 이상 줄일 수 없습니다.' );

				if( (1*cnt - 1) == 1 ) $(this).css({'color':'black'});
 				
 				$(this).siblings('input[name=prdt_cnt]').attr( 'value', 1*cnt -1 );
 				if (cnt == 2) $(this).addClass('disabled');
     		   
 				// 가격도 변경
 				target.children('span:eq(0)').find('span').text( numberWithCommas(targetprice1 * (cnt -1)) );
 				target.children('span:eq(1)').find('span').text( numberWithCommas(targetprice2 * (cnt -1)) );
 				
 				
     		}else if ($(this).hasClass('opt-cnt-plus')) {
     		   $(this).siblings('input[name=prdt_cnt]').attr( 'value', 1*cnt +1 );
     		   $(this).siblings('.opt-cnt-minus').removeClass('disabled');
    		   $(this).siblings('.opt-cnt-minus').css({'color':'#666'});
     		  
     			// 가격도 변경
     		  target.children('span:eq(0)').find('span').text( numberWithCommas(targetprice1 * (1*cnt +1)) );
			  target.children('span:eq(1)').find('span').text( numberWithCommas(targetprice2 * (1*cnt +1)) );
     		   
     		}
     		
     		chkPrice();
     		
        });
    	
        
    });

    $(document).on('click', '.delone' ,function(){

		var popupMassage = '해당 상품을 삭제하시겠습니까?';
    	var baskIdx = this.id.replace('del','');
        new PopupAlert({
            type: 'confirm', // popup type (alert, confirm)
            msg: popupMassage,
            callback: function(){

				$(document).on('click', '.btn-confirm-popup-alert', function(){
	            	var params = new Object();
	            	params.query = "deleteFrontCartData";
	            	params.BASK_IDX = baskIdx;
	            	params.status = "DELETE";
	            	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	            	var result = fn_DataAjax2( params );	
	    			location.reload();
				});
            }
        });
    });
    
    $(document).on('click', '.jjim' , function(){
    	
    	var params = new Object();
		params.status = "DETAIL";
		params.query = "selectFrontBaskJjimData";
    	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
    	params.BASK_IDX = $(this).attr('BASK_IDX');
		
    	var detailResult = fn_DataAjax2( params );
    	
    	if ( detailResult.out.detail.data.length > 0 ) {
    	
    		params.query = "updateFrontDibsData";
        	params.status = "EDIT";
        	params.BASK_TYPE = "K"; 
        	params.JJIM_IDX = this.name.replace('jjim','');
			params.BASK_IDX = detailResult.out.detail.data[0].BASK_IDX;
        	
        	if ( $(this).hasClass('is-active') ) {
	    		$(this).removeClass('is-active');
	    		params.BASK_USE_YN = 'N';
	    	}else{
	    		$(this).addClass('is-active');
	    		params.BASK_USE_YN = 'Y';
	    	}
        	
        	var result = fn_DataAjax2( params );
        	
    	}else{
    		
	    	var params = new Object();
	    	params.query = "insertFrontDibsData";
	    	params.status = "JJIM";
	    	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	    	params.BASK_TYPE = "B";
	    	params.JJIM_IDX = this.name.replace('jjim','');
	    	params.BASK_IDX = $(this).attr('BASK_IDX');
	    	
	    	if ( $(this).hasClass('is-active') ) {
	    		$(this).removeClass('is-active');
	    		params.BASK_USE_YN = 'N';
	    	}else{
	    		$(this).addClass('is-active');
	    		params.BASK_USE_YN = 'Y';
	    	}
	    	var result = fn_DataAjax2( params );	
	    	if (result.out.resultCnt) {
	    		this.name = "jjim"+result.out.otherBaskData.data[0].JJIM_IDX;
	    	}
    		
    		
    	}
    	
    	
    });

    $(document).on('click', '.btn_time' , function(){
    	clickBtn = $(this);
    	if (localStorage.getItem('baskArr') == '' || localStorage.getItem('baskArr') == null || localStorage.getItem('baskArr') == undefined ) {
    		return $(this).addClass('is-active');
		}
    	
    	if( localStorage.getItem('baskArr').indexOf( prdtCd ) > -1 ){
    		timeIdx = [];
    		
    		var arrList = [];
    		$.each( baskArr, function( k, v ){
    			if ( v.indexOf(prdtCd) > -1 ) {
				}else{
					arrList.push( v );
				}
    		});
    		baskArr = arrList;
    		localStorage.setItem('baskArr' ,arrList );
    		
    		if(baskArr.indexOf( prdtCd ) > -1 ){
	    		$(this).addClass('is-active');
    		}else{
    			$(this).removeClass('is-active');
    		}
    		
    	}else{
    		$(this).addClass('is-active');
    	}
    	
    });

    $(document).on('click', '.buynow', function(){
    	timeIdx = [];
		
		localStorage.removeItem('baskArr');
		localStorage.removeItem('baskCnt');
		
		console.log( $(this).closest('.board_list_item_row').find('.amount [name=prdt_cnt]').val() );
		
		var cartCntStr = localStorage.getItem("baskCnt") + '';
		
			// 장바구니 처리 
		if ( prdtCd.indexOf('VL') > -1 ) {
			tempCnt = 1;
			cartCntStr = cartCntStr + ',' + tempCnt;
		}else{
			tempCnt = $(this).closest('.board_list_item_row').find('.amount [name=prdt_cnt]').val();
			cartCntStr = cartCntStr + ',' + tempCnt;
		}
		
		localStorage.setItem("baskCnt", cartCntStr);
		
    });
    
    // 찜이 데이터가 있는데 찜 한건지 확인
    function jjimYn( jjim ){
    	if (jjim == 'Y') {
    		return 'is-active';
    	}else{
    		return '';
    	}
    }

    // 찜이 있는지 확인
    function jjimChk( jjim ){
    	if ( typeof jjim == 'undefind' || jjim == '' || jjim == null ) {
    		return '';
    	}else{
    		return jjim;
    	}
    }

    function undefindIsNothing( s ){
    	if (typeof s == "undefind" || s == null ) {
    		return "";
    	}else{
    		return s;
    	}
    }

    function chkPrice(){
    	var totalPrice = 0;
    	var priceYesdiscount = 0;
    	var priceNodiscount = 0;
    	
    	$('[name=baskCheck]:checked').each(function(mKey, mVal){
    		var mTagId = $(this).attr('id').replace('baskCheck','');
          	totalPrice += $('.payment_price').eq( mTagId ).children('span').eq(1).children('span').text().replace(/,/g,'')*1;
//         	console.log( $('.payment_price').eq( mTagId ).children('span').eq(1).children('span').text() );
//         	console.log( totalPrice );
          	priceNodiscount += $('.payment_price').eq( mTagId ).children('span').eq(0).children('span').text().replace(/,/g,'')*1;
          	priceYesdiscount += ($('.payment_price').eq( mTagId ).children('span').eq(0).children('span').text().replace(/,/g,'')*1) - ($('.payment_price').eq( mTagId ).children('span').eq(1).children('span').text().replace(/,/g,'')*1);
    	});

    	$('.board_list_sta_left > span > i').text( $('[name=baskCheck]:checked').not('#baskAllCheck').length );
    	
    	$('span#price > b').text( numberWithCommas( totalPrice ) );
    	$('.card_info_cont > ul > li:eq(0) > span').text( numberWithCommas( priceNodiscount ) + ' 원' );
    	$('.card_info_cont > ul > li:eq(1) > span').text( '-' + numberWithCommas( priceYesdiscount ) + ' 원' );
    	$('.card_info_cont.color_main').html(  numberWithCommas( totalPrice ) + ' 원'  );
    }

    function priceNoZero( price , disc ){
    	if ( Number( price ) - Number( disc ) < 0 ) {
    		return 0;
    	}else{
    		return Number( price ) - Number( disc );
    	}
    }

    function chkCOUP_MINI( COUP_MINI, COUP_MINI_TYPE ){
    	if ( COUP_MINI == "" || COUP_MINI == null || typeof COUP_MINI == 'undefind' || COUP_MINI_TYPE == "" || COUP_MINI_TYPE == null || typeof COUP_MINI_TYPE == 'undefind' ) {
    		return false;
    	}else{
    		return true;
    	}
    }

//     $(document).on('change', '[name=COUP_LIST]', calcPrice);

	
    /// 결제 페이지로 이동 
    function goPayment(){
    	
    	// samesite 쿠키 정책 때문에 세션 만료시 작동
    	if ( '${sessionScope.LOGIN_IDX}' == '' && localStorage.getItem("frontLoginIdx") != null ) {
    		var reissue = new Object();
    		reissue.status = "REISSUANCEID";
    		reissue.query = "selectReissuanceId";
    		reissue.USER_IDX = localStorage.getItem("frontLoginIdx");
    		fn_DataAjax2( reissue );	
    	}
    	
    	var baskArrStr = localStorage.getItem("baskArr")+'';
    	var baskCntStr = localStorage.getItem("baskCnt")+'';
    	var alertVal = 0;

    	if( $('input[name=baskCheck]:checked').not('#baskAllCheck').length == 0 ){ alertVal = 1; }
		var timeMsg = '';
		var baskChkCnt = 0;
    	$('input[name=baskCheck]:checked').not('#baskAllCheck').each(function(k){
//     		var selectPrdtCd = $(this).siblings('.gopay').attr('id').replace('pay','');
//     		var indexOfCnt = ( (selectPrdtCd.indexOf('FN')*1) + (selectPrdtCd.indexOf('CN')*1) + (selectPrdtCd.indexOf('LN')*1) );
//     		if( indexOfCnt != -3 ){
//     			if( baskArrStr.indexOf( $(this).siblings('.gopay').attr('id').replace('pay','') ) < 0 ){
//     				alertVal = 2;
//     				timeMsg = $(this).closest('.board_list_col').siblings('.payment_info').find('.payment_info_inn').text();
//     			}
//     		}else {
				if ( $(this).siblings('[name=noUseTimeCnt]').val() > 0 || $(this).siblings('.gopay').attr('id').indexOf('VL') > -1 || $(this).siblings('.gopay').attr('id').indexOf('EN') > -1 ) {
					
    				baskArrStr = baskArrStr + ',' + $(this).siblings('.gopay').attr('id').replace('pay','');
    				baskCntStr = baskCntStr + ',' + $(this).closest('.board_list_item_row').find('[name=prdt_cnt]').val();
    				localStorage.setItem("baskArr", baskArrStr);
    				localStorage.setItem("baskCnt", baskCntStr);
				}
//     		}
    	});

    	if( alertVal == 1 ) {
    		console.log( $('.noDataList').text().length );
    		if( $('.noDataList').text().length > 0 ) alert('결제할 상품이 존재하지 않습니다.');
    		else alert('결제하실 상품을 선택해주세요');
//     	} else if ( alertVal == 2 ) {
//     		timeMsg = timeMsg.replace(	/	/g,''); // tab replace
//     		var splitMng = timeMsg.split('   ');
    		
//     		alert(splitMng[0].trim()+' '+splitMng[1].trim()+' '+splitMng[2].trim()+' 강의의 시간이 아직 설정되지 않았습니다.');
    	} else {
        	if ( isMobile() ) location.href="/front/payment/cart_payment_mobile";
        	else location.href="/front/payment/cart_payment";
    	}
    	
    }
    
//     $(document).on('click', 'pop_close' , function(){
// 		if (clickBtn != '') {
// 			clickBtn.removeClass('is-active');
// 		}
//     });

    function getRidOfDupleDate( DTM ){
    	console.log(DTM);
    	const dtmSplit = DTM.trim().split(' ~ ');
    	if ( dtmSplit[0].substring(0,10) == dtmSplit[1].substring(0,10) ) {
    		return dtmSplit[0] + ' ~ ' + dtmSplit[1].split(',')[1]+' '+dtmSplit[1].split(',')[2];
    	}else{
    		return DTM.trim();
    	}
    }
    
    function istest( id, me ){
    	if (prdtCd.indexOf('VL') == -1 && prdtCd.indexOf('EN') == -1 ) {
    		if (id == 0) {
				    				
		    	event.preventDefault();
		    	event.stopPropagation();
		  		event.stopImmediatePropagation();
    			
		  		var popupMassage = '해당 상품은 판매가 종료되었습니다.\n삭제하시겠습니까?';
		    	var baskIdx = $(me).closest('.payment_button').find('.delone').attr('id');
		    	console.log( baskIdx );
		    	baskIdx = baskIdx.replace('del','');
		        new PopupAlert({
		            type: 'confirm', // popup type (alert, confirm)
		            msg: popupMassage,
		            callback: function(){

						$(document).on('click', '.btn-confirm-popup-alert', function(){
			            	var params = new Object();
			            	params.query = "deleteFrontCartData";
			            	params.BASK_IDX = baskIdx;
			            	params.status = "DELETE";
			            	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
			            	var result = fn_DataAjax2( params );	
			    			location.reload();
						});
		            }
		        });
		  		return ;
    		}
    	}
    	
    }
    
</script>























