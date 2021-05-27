<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" />

    <div id="container">
<!--         <div class="account_container section_inner"> -->
 <div class="section_inner">
        <section>
            <div class="section_inner">
                <div class="breadcrumb">
                    <span>홈</span>
                    <span>주문내역</span>
                    <span>내 쿠폰</span>
                </div>
                <h2 class="page_title">주문내역</h2>
            </div>
        </section>

            <div class="account_double_box">
                <div class="mypage_box">
        <div class="lnb">
<!--             <div class="section_inner"> -->
                <ul>
                    <li class="lnb_item"><a href="/front/mypage/payment">결제내역</a></li>
                    <li class="lnb_item is-active"><a href="/front/mypage/mycoupon">내 쿠폰</a></li>
                    <li class="lnb_item"><a href="/front/mypage/cart">장바구니</a></li>
                    <li class="lnb_item"><a href="/front/mypage/like">찜</a></li>
                    <li class="lnb_item"><a href="/front/mypage/refund">취소/환불내역</a></li>
                    <li class="lnb_item"><a href="/front/mypage/inquiry">1:1문의</a></li>
                </ul>
<!--             </div> -->
        </div>

        <section>
                    <div class="mypage_top">
                        <p class="mls_coupon">
                            <span class="mlsc_text">쿠폰 코드 입력</span>
                            <span class="mlsc_use">
                                사용 가능한 쿠폰
                                <b id="coupCnt">0</b>
                            </span>
                        </p>
                        <div class="mypage_lec_search_box">
                            <input type="text" class="account_input mycoupon_input" id="coupCode">
                            <input type="submit" class="account_btn" value="등록" onclick="fn_BtnRegist();">
                        </div>
                    </div>

					<div id="dataList" class="mypage_lec_table"></div>
					<div class="pagination justify-content-center paging" >
						<ul style="justify-content:space-between;" id="dataPage"></ul>
					</div>

					        </section>
                </div>
            </div><!-- //.account_double_box  -->
        </div>
    </div><!-- // #container -->


<!-- <script type="text/javascript" src="/resources/assets/js/jquery-1.12.4.min.js"></script> -->
<!-- <script type="text/javascript" src="/resources/assets/js/slick.min.js"></script> -->
<!-- datepicker -->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<!-- <script type="text/javascript" src="/resources/assets/js/common.js"></script> -->
<script>
// $( function() {
//     $.datepicker.setDefaults({
//         dateFormat: 'yymmdd',
//         prevText: '이전 달',
//         nextText: '다음 달',
//         monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
//         monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
//         dayNames: ['일', '월', '화', '수', '목', '금', '토'],
//         dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
//         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
//         showMonthAfterYear: true,
//         yearSuffix: '년'
//     });

//     function zero(num) {
//         if(num < 10) {
//             num = "0" + num;
//         }
//         return num;
//     }

//     var myDate = new Date();
//     var month = myDate.getMonth() + 1;
//     var date = zero(myDate.getDate());
    
//     var prettyDate = myDate.getFullYear() + '-' + month + '-' + date;
    
//     $( "#startDate" ).datepicker({dateFormat: 'yy-mm-dd'});
//     $("#startDate").val(prettyDate);

//     $( "#endDate" ).datepicker({dateFormat: 'yy-mm-dd'});
//     $("#endDate").val(prettyDate);
// });

var chk = 0;
$(function(){
	fn_BtnChnageListCnt("");
	chk = 1;
	$( '#now_loading' ).hide();
});

function fn_BtnChnageListCnt( PAGE_NO ){
	paymentCnt = 0;
	
	var params = new Object();
	params.status = "PAGE";
	params.query = "selectFrontCoupList";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.listCnt = 10;

	console.log( PAGE_NO );
	
// 	params.listCnt = $('#listCnt').val();
	if( PAGE_NO.length > 0 ) params.thisPage = PAGE_NO;
	else params.thisPage = 1;
	
	fn_DataList( params, "dataList", 7 );
}

function fn_DataList( PARAMS, OBJECT_ID, CNT ) {
	var result_List = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result_List.out.detail.data;
	var inTag = '';
 
	var params = new Object();
	params.status = "CODE";
	params.query = "selectAllCode";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var prdtCntData = result.out.detail.data;
	var CODE_ID = [];
	var CODE_NM = [];
	var canUseCnt = 0;
	
	$.each(prdtCntData, function(key, val) {
		CODE_ID.push( val.CODE_ID );
		CODE_NM.push( val.CODE_NM );
	});
	 
	$('#'+OBJECT_ID+'').empty();
	
	 if( jsonData.length > 0 ) {
		 
		$.each(jsonData, function(key, val) {
			
			
			inTag += '<div class="mlt_row">';
			inTag += '<div class="mlt_cell mlt_coupon_cell">';
// 			val.COUP_UUID
			if ( val.COUP_UUID != null && val.COUP_UUID != '' && val.COUP_UUID != undefined ) {
				imgIdValue = 'COUP_UUID_FILE';
				setUuid( val.COUP_UUID );
				unit_fileGet( imgIdValue, "fn_fileUpload");
				
				inTag += '<img name="profileBg'+key+'" src="'+$('#imgTag').val()+'" alt="">';
			}else{
				inTag += '<img name="profileBg'+key+'" src="/resources/assets/images/sub/coupon_img.png" alt="">';
			}
			
			inTag += '</div>';
			inTag += '<div class="mlt_cell mlt_info_cell">';
			inTag += '<div class="mlt_lec_info">';
			inTag += '<span class="coupon_category">'+val.COUP_NM+'</span>';
			inTag += '<p class="coupon_text">';
			if( val.COUP_MINI != null ) inTag += ''+val.COUP_MINI+' 구매 시';
			else inTag += '상품 구매 시';
			inTag += '<br>';
			inTag += numberWithCommas(val.COUP_DISC) +' '+ val.COUP_DISC_CD+ ' 할인';
			inTag += '<br>';
			
			if( val.COUP_CATE_CD == 'ALL') inTag += '전체 카테고리 가능';
			else {
				var cateArr = val.COUP_CATE_CD.split(',');
				var cateList = '';
				
				$.each(cateArr, function(key, val){
					$.each(CODE_ID, function(key1, val1){
						if( val == val1 ) {
							if( key == 0 ) cateList = CODE_NM[key1];
							else cateList += ',' + CODE_NM[key1];
						}
					});
				});
				
				inTag += ''+cateList+' 가능';
			}
			
			
			inTag += '</p>';
			inTag += '</div>';
			inTag += '</div>';
			inTag += '<div class="mlt_cell mlt_tail_cell mlt_date_cell">';
			inTag += '<div class="mlt_date_box">';
	
			
// 			if( val.COUP_NM.indexOf( '회원가입' ) > -1 ) inTag += '<span class="mltd_date"></span>';
// 			else
			
			if( val.COUP_REST_DTM != null ) {
				
				if( val.COUP_USE_YN == 'N') {
					inTag += '<span class="mltd_date">'+val.COUP_REST_DTM+'일</span>';
					inTag += '<span class="mltd_state on">사용가능</span>';
				}
				else if( val.COUP_USE_YN == 'D') {
					inTag += '<span class="mltd_date">'+val.COUP_REST_DTM+'일</span>';
					inTag += '<span class="mltd_state down phones_coup_down" onclick="fn_BtnRegist(\''+val.COUP_DATA_CD+'\', \''+val.COUP_END_DTM+'\')" style="cursor:pointer;">다운로드</span>';
				}
				else if( val.COUP_USE_YN == 'Y') inTag += '<span class="mltd_state use">사용</span>';
				else if( val.COUP_USE_YN == 'O') inTag += '<span class="mltd_state ended">기한만료</span>';
				canUseCnt++;
			} else {
				if( val.COUP_USE_YN == 'D') {
					inTag += '<span class="mltd_state down phones_coup_down" onclick="fn_BtnRegist(\''+val.COUP_DATA_CD+'\', \''+val.COUP_END_DTM+'\')" style="cursor:pointer;">다운로드</span>';
				} else {
					inTag += '<span onclick="fn_BtnDelete(\''+val.U_COUP_IDX+'\')" class="mltd_state ended">기한만료(삭제)</span>';
				}
			}
			
// 			if( val.COUP_USE_YN == 'N') inTag += '<span class="mltd_state on">사용가능</span>';
// 			else if( val.COUP_USE_YN == 'Y') inTag += '<span class="mltd_state use">사용</span>';
// 			else if( val.COUP_USE_YN == 'O') inTag += '<span class="mltd_state ended">기한만료</span>';
// 			else if( val.COUP_USE_YN == 'D') inTag += '<span class="mltd_state down phones_coup_down" onclick="fn_BtnRegist(\''+val.COUP_DATA_CD+'\', \''+val.COUP_END_DTM+'\')" style="cursor:pointer;">다운로드</span>';
			
			inTag += '</div>';
			inTag += '</div>'; 
			inTag += '</div>';

			$('#coupCnt').text( val.COUP_CNT );
			$('#'+OBJECT_ID+'').append( inTag );
			inTag = '';
			
		});
		
// 		$('#coupCnt').text( canUseCnt );
		
	 } else {
			inTag += '<div class="mlt_row hasbtn"style="font-size:22px; color:#aaa;text-align:center; ">등록된 내용이 없습니다.</div>';
		
		$('#'+OBJECT_ID+'').append( inTag );
	 }
		console.log(result_List.out.detail.paging);
		var varHtml = "";	
		varHtml += '		<li><a id="pagingFirst" onclick="fn_BtnChnageListCnt(\''+ result_List.out.detail.paging.prevStep +'\');"  aria-label="Previous"><i class="fa fa-angle-left i_prev front"></i></a></li>   ';
		for (var i = result_List.out.detail.paging.startPage; i <= result_List.out.detail.paging.endPage; i++) {
			if (result_List.out.detail.paging.thisPage == i)
				varHtml += '<li id="pagingActive" onclick="fn_BtnChnageListCnt(\''+ i +'\');" class="pagi_btn pagi_num current"><a  class="active is-active" style="cursor:pointer;"><b>'+ i +'</b></a></li>   ';
			else
				varHtml += '<li name="pagingPassiive" onclick="fn_BtnChnageListCnt(\''+ i +'\');" class="pagi_btn pagi_num"><a   style="cursor:pointer;"><b>'+ i +'</b></a></li>   ';
		}
		varHtml += '		<li><a id="pagingLast" onclick="fn_BtnChnageListCnt(\''+ result_List.out.detail.paging.nextStep +'\');"  aria-label="Next"><i class="fa fa-angle-right i_next front"></i></a></li>   ';
		
		$('#dataPage').empty();
		$('#dataPage').append( varHtml );
// 		$('.listCount').text('전체 ' + result.out.totalCnt );
// 		if( chk == 1 ) alert('페이지 개수 변환에 성공하였습니다.');
}



function fn_BtnRegist( COUP_DATA_CD, COUP_END_DTM ){
	
	
	if ( COUP_END_DTM != null || COUP_END_DTM != '' || COUP_END_DTM != undefined ) {
		var now = new Date();
		var coup_end_dtm = new Date(COUP_END_DTM);
// 		if ( now > coup_end_dtm ) return alert('기한만료된 쿠폰입니다.');
	}
	
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectFrontCoupData";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.coupCode = $('#coupCode').val();
	console.log( COUP_DATA_CD );
	if( COUP_DATA_CD != null ) params.coupCode = COUP_DATA_CD;
	
	var result = fn_DataAjax2( params );
	var jsonData = result.out.detail.data;
	
	if( jsonData.length > 0 ) {
		
		if( jsonData[0].COUP_CNT == 0 ) {
			params.status = "WRITE";
			params.query = "inserFrontCoupData";
			params.dataIdx = jsonData[0].DATA_IDX;
			params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
			
			var result = fn_DataAjax( params );
			alert('쿠폰 등록이 완료되었습니다.');
			fn_BtnChnageListCnt("");
			
		} else {
			alert('이미 등록된 쿠폰입니다.');
		}
	} else {
		alert('쿠폰 번호를 다시 확인해주세요.');
	}
}

//퍼블리셔 시작


    $(document).ready(function(){
        cardRemoveEvent();
        choiceRemoveEvent();
        checkAllEvent(
            'input[name="all"]', //all checkbox 
            '.board_list_img_card input[type=checkbox]' //card checkbox
        );
    });

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
        var $btn = $('.list_sta_btn_remove');
        
        $btn.on('click', function(){
            var $allCheckbox = $('input[name="all"]');
            var popupMassage = '';
            var $otherCheckbox = $('.board_list_img_card input:checked');

            var popupMassage = '';
            if($allCheckbox.is(':checked')){
                popupMassage = '찜 상품을<br>모두 삭제하시겠습니까?';
            }else{
                popupMassage = $otherCheckbox.length + '개 상품을 찜 목록에서 삭제하시겠습니까?'
            }  

            new PopupAlert({
                type: 'confirm', // popup type (alert, confirm)
                msg: popupMassage, // 팝업 메세지
                callback: function(){
                    $allCheckbox.prop('checked', false);
                    $otherCheckbox.parents('.board_list_item').remove();
                    // or 상품삭제 후 게시판 reload;
                }
            });
        });
    }

    function fn_BtnDelete( UC ){
    	new PopupAlert({
            type: 'confirm', // popup type (alert, confirm)
            msg: '해당 쿠폰을 삭제하시겠습니까?', // 팝업 메세지
            callback: function(){
            	var params = new Object();
            	params.query = "deleteEndDtmUserCoupData";
            	params.status = "EDIT";
            	params.COUP_IDX = UC;
            	var result = fn_DataAjax2( params );
            	if ( result.out.resultCnt > 0 ) {
					alert('삭제되었습니다.');
            		location.reload();
				}
            }
        });
    	
    }
    
</script>
