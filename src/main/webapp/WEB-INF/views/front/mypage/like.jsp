<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />


<style>
	.baskCheck{z-index:99;}
</style>

    <div id="container">
      <div class="section_inner">
        <section>
            <div class="section_inner">
                <div class="breadcrumb">
                    <span>홈</span>
                    <span>주문내역</span>
                    <span>찜</span>
                </div>
                <h2 class="page_title">주문내역</h2>
            </div>
        </section>

        <div class="lnb">
            <ul>
                <li class="lnb_item"><a href="/front/mypage/payment">결제내역</a></li>
                <li class="lnb_item"><a href="/front/mypage/mycoupon">내 쿠폰</a></li>
                <li class="lnb_item"><a href="/front/mypage/cart">장바구니</a></li>
                <li class="lnb_item is-active"><a href="/front/mypage/like">찜</a></li>
                <li class="lnb_item"><a href="/front/mypage/refund">취소/환불내역</a></li>
                <li class="lnb_item"><a href="/front/mypage/inquiry">1:1문의</a></li>
            </ul>
        </div>

        <section class="section_last">
         
                <div class="board_list_sta">
                    <div class="board_list_sta_left">
                        <label for="baskAllCheck" class="form_check">
                            <input type="checkbox" id="baskAllCheck" name="baskCheck">
                            <span class="form_check_mark all"></span> 전체선택
                        </label>
                        <span>(총 <i class="color_main">0</i>개 / <span>0</span> )</span>
                    </div>
                    <div class="board_list_sta_right">
                        <button type="button" class="board_list_sta_button list_sta_btn_basket">장바구니</button>
                        <button type="button" class="board_list_sta_button list_sta_btn_remove">삭제</button>
                    </div>
                </div>
<!--                 <div class="board_list_img_card" id="baskList"> -->
   				<div class="board_list_img_card">
                    <ul id="baskList">
                    </ul>
                </div>
            
        </section>
        </div>
    </div><!-- // #container -->

<script>
    function cardRemoveEvent(){
        clickPopupEvent('.board_list_img_card .btn_remove', {
            popupType: 'confirm',
            popupMsg: '1개 상품을 찜 목록에서 삭제하시겠습니까?',
            callback: function(thisBtn){
                $(thisBtn).parents('.board_list_item').remove();
                // or 상품삭제 후 게시판 reload
            }
        });
    }

    function choiceRemoveEvent(){
        var $btn = $('.list_sta_btn_remove').not('.delone');
        
        $btn.on('click', function(){
            var $allCheckbox = $('#baskAllCheck');
            var popupMassage = '';
            var $otherCheckbox = $('.board_list_img_card input:checked');

            var popupMassage = '';
            if($allCheckbox.is(':checked')){
                popupMassage = '찜 상품을<br>모두 삭제하시겠습니까?';
            }else{
                popupMassage = $otherCheckbox.length + '개 상품을 찜 목록에서 삭제하시겠습니까?'
            }  
            
            if ( $otherCheckbox.length == 0 ) {
            	clickPopupEvent('.prdt_basket_btn',{
    				popupType : 'alert',
    				popupMsg: '선택된 상품이 없습니다.',
    				beforePopup: function(thisBtn){
    		    	  $(document).on('click', '.btn-confirm-popup-alert', function(){
//     		    		  location.reload();
    		    	  });
    				return 'ALERT';
    				}
    			});
    	  		return ;
			}

            new PopupAlert({
                type: 'confirm', // popup type (alert, confirm)
                msg: popupMassage, // 팝업 메세지
                callback: function(){
                    $allCheckbox.prop('checked', false);
                    // or 상품삭제 후 게시판 reload;
                    
                    $('[name=baskCheck]:checked').each(function(key,val){
                    	console.log( $(this).val() );
    			    	var params = new Object();
    			    	params.query = "deleteFrontCartData";
    			    	params.BASK_IDX = $(this).val();
    			    	params.status = "DELETE";
    			    	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
    			    	var result = fn_DataAjax2( params );	
                    });
                    $otherCheckbox.parents('.board_list_item').remove();
  			    	location.reload();
                }
            });
        });
    }
    
    $( function() {
    	if( localStorage.getItem("frontLoginIdx") == null ){
    		return location.href = "/";
    	}
    	
    	var params = new Object();
    	params.status = "LIST";
    	params.query = "selectFrontCartList";
    	params.USER_IDX = localStorage.getItem("frontLoginIdx");
    	params.BASK_TYPE = "K";

    	var result = fn_DataAjax2( params );	
    	result = result.out.detail.data;
//     	console.log(result);
    	var html = "";
    	 
    	$.each(result, function( k, v ){
    		$('.board_list_sta_left > span > span').text( result.length + '개');
    		

    		html += '<li class="board_list_item">';
    		html += '	<div class="board_list_item_header">';

			if( v.INFO_TUMB_UUID != null ) {
				var chkStr = v.INFO_TUMB_UUID.trim();
				if( chkStr != 'undefined' ) {
					if( chkStr != '') {
		        		setUuid(v.INFO_TUMB_UUID);
		        		unit_fileGet( v.INFO_TUMB_UUID_NM , "fn_fileUpload");
		    			html += '		  <a href="'+v.MOVE_URL+'"><img style="width:100%;;height:210px;"class="board_list_img phones_board_list_img" src="'+$('#imgTag').val()+'" alt=""></a>';
		    			$('#imgTag').val('');
					} else html += '		  <a href="'+v.MOVE_URL+'"><img style="width:100%;;height:210px;"class="board_list_img phones_board_list_img" src="/resources/assets/images/sub/profile_default_img.png" alt=""></a>';
				} else 
					html += '		  <a href="'+v.MOVE_URL+'"><img style="width:100%;;height:210px;"class="board_list_img phones_board_list_img" src="/resources/assets/images/sub/profile_default_img.png" alt=""></a>';
			} else 
				html += '		  <a href="'+v.MOVE_URL+'"><img style="width:100%;height:210px;"class="board_list_img phones_board_list_img" src="/resources/assets/images/sub/profile_default_img.png" alt=""></a>';
    	
    		html += '		<div class="checkbox_area">';
    		html += '			<label for=""baskCheck'+k+'" class="form_check">';
    		html += '				<input type="checkbox" id="baskCheck'+k+'" name="baskCheck" value="'+v.BASK_IDX+'" JJIM_IDX="'+v.JJIM_IDX+'" >';
    		html += '				<span class="form_check_mark BASK_IDX_'+k+'"></span>';
    		html += '			</label>';
    		html += '		</div>';
    		html += '	</div>';
    		html += '	<div class="board_list_item_body" >';
    		html += '		<a href="'+v.MOVE_URL+'">';
    		html += '			<span class="color_main">['+v.PRDT_TYPE+'] <br>'+v.P_CODE_NM+' · '+v.USER_NM+'</span>';
    		html += '			<strong class="board_list_title">' + is_too_long_word( v.INFO_PRDT_TITL1, v.INFO_PRDT_TITL2, 10, 'Y') + '</strong>';
    		html += '		</a>';
    		html += '		<div class="board_list_price">';
    		
    		if( v.PRDT_PRIC != v.PRDT_PRIC_REAL ) {
        		html += '			<span class="before_pay"><span>'+v.PRDT_PRIC+'원</span></span>';
        		html += '			<span class="sale">'+numberWithCommas(v.PRDT_DISC)+''+v.PRDT_DISC_NM+'</span>';
    		} else {
        		html += '			<span class="before_pay"><span></span></span>';
        		html += '			<span class="sale"></span>';
    		}
    		
    		html += '			<strong class="pay"><span>'+v.PRDT_PRIC_REAL+'</span> 원</strong>';
    		html += '		</div>';
    		html += '	</div>';
    		html += '	<div class="board_list_item_footer">';
    		html += '		<button type="button" id="del'+v.BASK_IDX+'" class="btn_line btn_remove list_sta_btn_remove delone">삭제</button>';
    		html += '		<button type="button" class="btn_cyan cart" BASK_IDX="'+v.BASK_IDX+'">장바구니</button>';
    		html += '	</div>';
    		html += '</li>';
    	});
    	
    	if (html == "") {
    		html = '<div class="mlt_row hasbtn noDataList" >등록된 내용이 없습니다.</div>';
    	}
    	
    	$('#baskList').empty();
    	$('#baskList').append(html);
    	

    	$('#baskAllCheck').click(function(){
    		// 이해는 못하겠는데 cart랑 반대방식으로 동작함
        	if( $('#baskAllCheck').prop('checked') ){ $('[name=baskCheck]').prop('checked', true);  }
        	else{ $('[name=baskCheck]').prop('checked', false);  }
    		
        	$('.board_list_sta_left > span > i').text( $('[name=baskCheck]:checked').not('#baskAllCheck').length );
    	});
    	
    	
        $('.form_check_mark').not('.all').click(function(){
        	var BASK_IDX_VAL = $(this).attr('class').replace('form_check_mark','').replace('BASK_IDX_','')*1;
    		if( $('[name=baskCheck]').eq( BASK_IDX_VAL+1 ).prop('checked') ) $('[name=baskCheck]').eq( BASK_IDX_VAL+1 ).prop('checked', false);
    		else $('[name=baskCheck]').eq( BASK_IDX_VAL+1 ).prop('checked', true);
    		
    		if ( $('[name=baskCheck]:checked').not('#baskAllCheck').length == $('[name=baskCheck]').not('#baskAllCheck').length ) {
	        	$('#baskAllCheck').prop('checked', true);
			}else{
	        	$('#baskAllCheck').prop('checked', false);
			}
        	
        	$('.board_list_sta_left > span > i').text( $('[name=baskCheck]:checked').not('#baskAllCheck').length );
        	
        });
        
        cardRemoveEvent();
        choiceRemoveEvent();
    	
        $(document).on('click', '.list_sta_btn_basket' , function(){
        	
        	if ( $('[name=baskCheck]:checked').length == 0 ) {
        		clickPopupEvent('.prdt_basket_btn',{
    				popupType : 'alert',
    				popupMsg: '선택된 상품이 없습니다.',
    				beforePopup: function(thisBtn){
    		    	  $(document).on('click', '.btn-confirm-popup-alert', function(){
//     		    		  location.reload();
    		    	  });
    				return 'ALERT';
    				}
    			});
    	  		return ;
			}
        	
        	$('[name=baskCheck]:checked').not('#baskAllCheck').each(function(){
        		
        		var params = new Object();
        		params.status = "DETAIL";
        		params.query = "selectFrontBaskData";
            	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
            	params.BASK_IDX = $(this).val();
        		
            	var detailResult = fn_DataAjax2( params );
            	
            	if ( detailResult.out.detail.data.length > 0 ) {
					
            		if( detailResult.out.detail.data[0].BASK_USE_YN == 'Y' ){
        		  		// 장바구니에 있다면 여러개 처리하니까 그냥 놔둠
//         				alert('이미 장바구니에 있는 상품입니다.');
        		  		
//         				clickPopupEvent('.prdt_basket_btn',{
//         				      popupType : 'alert',
//         				      popupMsg: '이미 장바구니에 있는 상품입니다.',
//         				      beforePopup: function(thisBtn){
//         				      return 'ALERT';
//         				      }
//         				});
        		  		
//         		  		return ;
          			}else{
          				
	            		params.query = "updateFrontDibsData";
		            	params.status = "EDIT";
		            	params.BASK_TYPE = "K"; 
		            	params.JJIM_IDX = $(this).attr('JJIM_IDX');
						params.BASK_IDX = detailResult.out.detail.data[0].BASK_IDX;
		            	params.BASK_USE_YN = 'Y';
		            	
		            	var result = fn_DataAjax2( params );
          			}
            		
				}else{
					
	            	params.query = "insertFrontDibsData";
	            	params.status = "JJIM";
	            	params.BASK_TYPE = "K";
	            	params.JJIM_IDX = $(this).attr('JJIM_IDX');
	
	            	params.BASK_USE_YN = 'Y';
	            	
	            	var result = fn_DataAjax2( params );
				}
            	
            	
        	});
        	
        	fn_baskBtn(1);
       		
        });
        
        $( '#now_loading' ).hide();
    });

    $(document).on('click', '.delone' ,function(){
    	var params = new Object();
    	params.query = "deleteFrontCartData";
    	params.BASK_IDX =this.id.replace('del','');
    	params.status = "DELETE";
    	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
    	var result = fn_DataAjax2( params );	
    	
    	if (result.out.resultCnt) {
    		clickPopupEvent('.prdt_basket_btn',{
				popupType : 'alert',
				popupMsg: '삭제가 완료되었습니다.',
				beforePopup: function(thisBtn){
		    	  $(document).on('click', '.btn-confirm-popup-alert', function(){
		    		  location.reload();
		    	  });
				return 'ALERT';
				}
			});
    		return ;
    	}
    });

    $(document).on('click', '.cart' , function(){
    	
    	var params = new Object();
		params.status = "DETAIL";
		params.query = "selectFrontBaskData";
    	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
    	params.BASK_IDX = $(this).attr('BASK_IDX');
		
    	var detailResult = fn_DataAjax2( params );
    	
    	if ( detailResult.out.detail.data.length > 0 ) {
			
    		if( detailResult.out.detail.data[0].BASK_USE_YN == 'Y' ){
		  		// 장바구니에 있다면 여러개 처리하니까 그냥 놔둠
// 				alert('이미 장바구니에 있는 상품입니다.');
		  		
				clickPopupEvent('.prdt_basket_btn',{
				      popupType : 'alert',
				      popupMsg: '이미 장바구니에 있는 상품입니다.',
				      beforePopup: function(thisBtn){
				      return 'ALERT';
				      }
				});
		  		
		  		return ;
  			}else{
  				
        		params.query = "updateFrontDibsData";
            	params.status = "EDIT";
            	params.BASK_TYPE = "K";
            	params.JJIM_IDX = $(this).attr('JJIM_IDX');
				params.BASK_IDX = detailResult.out.detail.data[0].BASK_IDX;
            	params.BASK_USE_YN = 'Y';
            	
            	var result = fn_DataAjax2( params );
  			}
    		
		}else{
	    	params.query = "insertFrontDibsData";
	    	params.status = "JJIM";
	    	params.BASK_TYPE = "K";
	    	params.JJIM_IDX = this.name.replace('cart','');
	
	    	params.BASK_USE_YN = 'Y';
			
	    	var result = fn_DataAjax2( params );	
	    	
	    	
	    	
		}
    	fn_baskBtn(1);
    	
    	
//     	var msg = "";
    	
//     	if ( $(this).hasClass('btnBaskActive') ) {
//     		$(this).removeClass('btnBaskActive');
//     		params.BASK_USE_YN = 'N';
//     		msg = "장바구니에서 삭제가";
//     	}else{
//     		$(this).addClass('btnBaskActive');
//     		params.BASK_USE_YN = 'Y';
//     		msg = "장바구니에 등록이";
//     	}
//     	if (result.out.resultCnt) {
//     		this.name = "cart"+result.out.otherBaskData.data[0].JJIM_IDX;
//     		alert(msg+' 완료되었습니다.');
//    		location.href="/front/mypage/cart";
//     	}
    });

    // 장바구니 데이터가 있는데 장바구니 한건지 확인
    function cartYn( cart ){
    	if (cart == 'Y') {
    		return 'is-active';
    	}else{
    		return '';
    	}
    }

    // 장바구니 있는지 확인
    function cartChk( cart ){
    	if ( typeof cart == 'undefind' || cart == '' || cart == null ) {
    		return '';
    	}else{
    		return cart;
    	}
    }

    function undefindIsNothing( s ){
    	if (typeof s == "undefind" || s == null ) {
    		return "";
    	}else{
    		return s;
    	}
    }

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


</script>

