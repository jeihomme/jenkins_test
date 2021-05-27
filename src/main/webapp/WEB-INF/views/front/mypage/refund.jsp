<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" />
<!--    <link href="/resources/assets/js/jquery-ui/jquery-ui.css" rel="stylesheet" type="text/css" /> -->
   
   
    <div id="container">
    <div class="section_inner">
        <section>
            <div class="section_inner">
                <div class="breadcrumb">
                    <span>홈</span>
                    <span>주문내역</span>
                    <span>취소/환불내역</span>
                </div>
                <h2 class="page_title">주문내역</h2>
            </div>
        </section>

        <div class="lnb">
            <div class="">
                <ul>
                    <li class="lnb_item"><a href="/front/mypage/payment">결제내역</a></li>
                    <li class="lnb_item"><a href="/front/mypage/mycoupon">내 쿠폰</a></li>
                    <li class="lnb_item"><a href="/front/mypage/cart">장바구니</a></li>
                    <li class="lnb_item"><a href="/front/mypage/like">찜</a></li>
                    <li class="lnb_item is-active"><a href="/front/mypage/refund">취소/환불내역</a></li>
                    <li class="lnb_item"><a href="/front/mypage/inquiry">1:1문의</a></li>
                </ul>
            </div>
        </div>


        <section class="section_last">
           
                 
                <div class="board_list_payment refund">
                    <ul id="dataList">
                    </ul>
                </div>
                
				<div class="pagination justify-content-center paging">
					<ul style="justify-content:space-between;" id="dataPage"></ul>
				</div>
           
        </section>
        </div>
    </div><!-- // #container -->

<div class="popup popup_refund">
    <div class="popup_wrapper">
    <div class="popup_container">
        <div class="popup_header">
            <strong class="popup_title">환불 상세내역</strong>
        </div>
        <div class="popup_body">
            <div class="refund_field">
                <table class="table_refund payCom">
                    <tr class="m_show">
                        <th colspan="2">결제일 2020-10-01</th>
                    </tr>
                    <tr>
                        <th class="title" rowspan="4">
                            <div>결제일</div>
                            <div>2020-10-01</div>
                        </th>
                        <td>상품금액</td>
                        <td class="cont">150,000 원</td>
                    </tr>
                    <tr>
                        <td>총할인금액</td>
                        <td class="cont">
                            -50,000원
                            <span class="sm_text">즉시할인 30,000원</span>
                            <span class="sm_text">쿠폰할인 20,000원</span>
                        </td>
                    </tr>
                    <tr>
                        <td>결제정보</td>
                        <td class="cont">
                            신용카드
                            <span class="sm_text">(현대카드 / 일시불)</span>
                        </td>
                    </tr>
                    <tr>
                        <td>최초 결제금액</td>
                        <td class="cont">100,000 원</td>
                    </tr>
                </table>
            </div>
            <div class="refund_field">
                <table class="table_refund payRefu">
                    <tr class="m_show">
                        <th colspan="2">환불 완료일 2020-10-01</th>
                    </tr>
                    <tr>
                        <th rowspan="4">
                            <div>환불 완료일</div>
                            <div>2020-10-01</div>
                        </th>
                        <td>취소금액</td>
                        <td class="cont">150,000 원</td>
                    </tr>
                    <tr>
                        <td>총 할인 취소금액</td>
                        <td class="cont">
                            -50,000원
                            <span class="sm_text">즉시할인 30,000원</span>
                            <span class="sm_text">쿠폰할인 20,000원</span>
                        </td>
                    </tr>
                    <tr>
                        <td>결제정보</td>
                        <td class="cont">신용카드 취소</td>
                    </tr>
                    <tr>
                        <td> <span class="color_main">환불금액</span></td>
                        <td class="cont"> <span class="color_main">100,000 원</span></td>
                    </tr>
                </table>
            </div>  
            <div class="refund_info">
                <span>· 취소/ 반품 완료 즉시 카드승인 취소 및  환불이 진행됩니다.</span>
                <span>(취소/반품) 완료일 기준 3 ~ 5영업일 소요)</span>
                <span>단, 카드사의 사정에 따라 승인 취소 후 환불이 지연될 수 있습니다.</span> 
            </div>
        </div>
        <div class="popup_footer">
            <button class="popup_btn popup_btn_close">닫기</button>
        </div>
    </div>
</div>
</div>


<!-- <script type="text/javascript" src="/resources/assets/js/jquery-1.12.4.min.js"></script> -->
<!-- <script type="text/javascript" src="/resources/assets/js/slick.min.js"></script> -->
<!-- <script type="text/javascript" src="/resources/assets/js/common.js"></script> -->
<!-- <script type="text/javascript" src="/resources/assets/js/jquery-ui/jquery-ui.min.js"></script> -->
<style>
	#dataList li.board_list_item {
		  position: relative;
		  -webkit-transition: 0.3s;
		  transition: 0.3s;
	}
	#dataList li.board_list_item:hover {
	  	-webkit-transform: translateY(-10px);
  		transform: translateY(-10px);
	}
	.board_list_payment .payment_info_inn .status span{ display: none!important; }
</style>
<script>
// 01	비씨	 
// 02	국민	 
// 03	외환	 
// 04	삼성	 
// 05	신한	//신한-LG카드사 통합
// 08	현대	 
// 09	롯데	//롯데아멕스카드 포함
// 11	한미	 
// 12	수협	 
// 14	우리	 
// 15	농협	 
// 16	제주	 
// 17	광주	 
// 18	전북	 
// 19	조흥	//신한으로 통합되어 없어졌지만 취소는 존재
// 23	주택	//거절시 발급사코드로 나올수 있음, 승인은 불가
// 24	하나	 
// 26	씨티	 
// 25	해외	 
// 99	기타
var cardArr = [	'01:비씨',	'02:국민',	'03:외환',	'04:삼성',
						'05:신한',	'08:현대',	'09:롯데',	'11:한미',
						'12:수협',	'14:우리',	'15:농협',	'16:제주',
						'17:광주',	'18:전북',	'19:조흥',	'23:주택',
						'24:하나',	'26:씨티',	'25:해외',	'99:기타',
						'51:카카오페이', '52:네이버페이'];



$(document).ready(function(){
    $(document).on('click', '.btn_detail', function(){
    	var params = new Object();
    	params.status = 'LIST';
    	params.query = "selectFrontMypageRefundPrdtData";
    	params.PRDT_CD = this.id.replace('refundDetail','');
    	params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
    	params.BUY_IDX = $(this).siblings('.btn_addCart').attr('id').replace( 'cart', '' );
    	
    	var listDetail = fn_DataAjax2( params );
    	
    	listDetail = listDetail.out.detail.data[0];
    	$('.payCom  tr:eq(0) th').text('결제일'+listDetail.BUY_COMP_DTM); 
    	$('.payCom  tr:eq(1) th:eq(0) > div:eq(1)').text(listDetail.BUY_COMP_DTM); 
    	
		$('.payCom  tr:eq(1) td:eq(1)').text( numberWithCommas( listDetail.PRDT_PRIC*listDetail.REAL_CNT ) + ' 원' ); 
		
		$('.payCom  tr:eq(2) td:eq(1)').html( '-'+numberWithCommas( (listDetail.PRDT_PRIC*listDetail.REAL_CNT)-listDetail.REAL_PAY_PRIC+ ' 원'  ) + '<span class="sm_text">즉시할인 '+numberWithCommas( (listDetail.PRDT_PRIC*listDetail.REAL_CNT)-(listDetail.PRDT_PRIC_REAL2*listDetail.REAL_CNT) )+'원</span>' + '<span class="sm_text">쿠폰할인 '+numberWithCommas( (listDetail.PRDT_PRIC_REAL2*listDetail.REAL_CNT)-listDetail.REAL_PAY_PRIC )+'원</span>' ); 

		var cdNm = "";
		$.each(cardArr, function( k, v ){
			if (v.indexOf( listDetail.BUY_ACCO_NO.trim() ) > -1 ) {
				cdNm = v.split(':')[1] + '카드';
			}
		});
		
		if ( cdNm == '' ) { cdNm = '카드정보없음';}
		
		var halbu = "";
		if ( listDetail.BUY_HALBU != '' && listDetail.BUY_HALBU != null && typeof listDetail.BUY_HALBU != 'undefined' ) {
			if ( 1*listDetail.BUY_HALBU == 0 ) {
				halbu = '/ 일시불';
			}else{
				halbu = 1*listDetail.BUY_HALBU + '개월';
				halbu = '/ ' + halbu;
			}
		}
		if ( listDetail.BUY_TYPE == '신용카드' ) {
			$('.payCom  tr:eq(3) td:eq(1)').html( listDetail.BUY_TYPE + '<span class="sm_text">( '+cdNm+halbu+' )</span>' ); 
		}else{
			$('.payCom  tr:eq(3) td:eq(1)').text( listDetail.BUY_TYPE  ); 
			$('.payCom  tr:eq(3) td:eq(1) span').css( 'visibility', 'hidden' ); 
		}

		$('.payCom  tr:eq(4) td:eq(1)').html( numberWithCommas(listDetail.REAL_PAY_PRIC) + ' 원</span>' ); 

		
		
		
		$('.payRefu  tr:eq(0) th').text('환불 완료일'+listDetail.BUY_REFU_DTM); 
    	$('.payRefu  tr:eq(1) th:eq(0) > div:eq(1)').text(listDetail.BUY_REFU_DTM); 
    	
		$('.payRefu  tr:eq(1) td:eq(1)').text( numberWithCommas( listDetail.PRDT_PRIC*listDetail.REAL_CNT ) + ' 원' ); 
		
		$('.payRefu  tr:eq(2) td:eq(1)').html( '-'+numberWithCommas( (listDetail.PRDT_PRIC*listDetail.REAL_CNT)-listDetail.REAL_PAY_PRIC+ ' 원'  ) + '<span class="sm_text">즉시할인 '+numberWithCommas( (listDetail.PRDT_PRIC*listDetail.REAL_CNT)-(listDetail.PRDT_PRIC_REAL2*listDetail.REAL_CNT) )+'원</span>' + '<span class="sm_text">쿠폰할인 '+numberWithCommas( (listDetail.PRDT_PRIC_REAL2*listDetail.REAL_CNT)-listDetail.REAL_PAY_PRIC )+'원</span>' ); 
		
		$('.payRefu  tr:eq(3) td:eq(1)').html( listDetail.BUY_TYPE + ( listDetail.BUY_TYPE.indexOf('카드') > -1?' 취소':' 환불' ) ); 

		$('.payRefu  tr:eq(4) td:eq(1)').html( '<span class="color_main">'+ numberWithCommas(listDetail.REAL_PAY_PRIC )+ ' 원</span>' ); 
    
		
    	
    	
    	$('.popup_refund').addClass('is-active');
        $('html,body').css({overflowY:'hidden'})
        $('.popup_refund').show();
    });
    $('.popup_btn_close').on('click', function(){
        $('html,body').css({overflowY:'visible'})
        $('.popup').removeClass('is-active');
        $('.popup_refund').hide();
    });
});

</script>

<script>
$(function(){
	fn_BtnChnageListCnt("");
	$( '#now_loading' ).hide();
});

function fn_BtnChnageListCnt( PAGE_NO ){
	paymentCnt = 0;
	
	var params = new Object();
	params.status = "PAGE";
	params.query = "selectFrontRefundList";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.startDate = $("#startDate").val();
	params.endDate = $("#endDate").val();
	params.masterNm = $("#masterNm").val();
	
// 	params.listCnt = $('#listCnt').val();
	if( PAGE_NO.length > 0 ) params.thisPage = PAGE_NO;
	else params.thisPage = 1;
	
	fn_DataList( params, "dataList", 7 );
}


// 목록 만들어줌
function fn_DataList( PARAMS, OBJECT_ID, CNT ) {
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result.out.detail.data;
	var inTag = '';
	
// INFO |-------------|--------------------|-------------|-----------|-----------|---------|--------------|----------|----------|----------|----------------|----------------|----------------------------------------------|------------------|---------|---------|---------|--------| 
// INFO |BUY_COMP_DTM |BUY_REFU_DTM        |BUY_NO       |BUY_NO_CNT |PRDT_TYPE  |CATE_IDX |PRDT_CD       |P_CODE_NM |M_CODE_NM |MASTER_NM |INFO_PRDT_TITL1 |INFO_PRDT_TITL2 |INFO_TUMB_UUID                                |INFO_TUMB_UUID_NM |BUY_PRIC |BUY_STAT |NUM_DESC |NUM_ASC | 
// INFO |-------------|--------------------|-------------|-----------|-----------|---------|--------------|----------|----------|----------|----------------|----------------|----------------------------------------------|------------------|---------|---------|---------|--------| 
// INFO |2021-01-08   |2021-01-08 14:53:35 |276810001001 |0          |1:1이메일상담   |10       |202012ENA0007 |건강        |약사        |마스터1      |[null]          |[null]          |[null]                                        |INFO_TUMB_UUID    |17,100   |환불완료     |3        |1       | 
// INFO |2021-01-07   |2021-01-07 18:20:07 |176800100647 |0          |LIVE CLASS |8        |202011LNA0027 |교육        |예체능       |마스터1      |소개소개            |제목제목            |20211271017279b19b21277b0a72c6d6857d224946039 |INFO_TUMB_UUID    |5,000    |취소완료     |2        |2       | 
// INFO |2021-01-06   |2021-01-07 18:14:53 |276790001741 |0          |LIVE CLASS |8        |202011LNA0027 |교육        |예체능       |마스터1      |소개소개            |제목제목            |20211271017279b19b21277b0a72c6d6857d224946039 |INFO_TUMB_UUID    |5,000    |환불완료     |1        |3       | 
// INFO |-------------|--------------------|-------------|-----------|-----------|---------|--------------|----------|----------|----------|----------------|----------------|----------------------------------------------|------------------|---------|---------|---------|--------| 
	 
	 
	$('#'+OBJECT_ID+'').empty();
	
	 if( jsonData.length > 0 ) {
		 
		$.each(jsonData, function(key, val) {
    		setUuid(val.INFO_TUMB_UUID);
    		unit_fileGet( val.INFO_TUMB_UUID_NM+'_FILE' , "fn_fileUpload");
			
			if ( val.BUY_NO_CNT > 1 ) {
				
				var params = new Object();
				params.query = "selectRefundNoMultipleList";
				params.buyNo = val.BUY_NO;
				params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
				params.status = "LIST";
				
				var resultList = fn_DataAjax2( params );
				resultList = resultList.out.detail.data;
				if ( resultList.length > 1 ) {
					$.each( resultList, function( k, v ){
						if ( k == 0 ) {
							inTag += '<li>';
							inTag += '<ul class="card_box">';
						}
						
						 imgIdValue = 'INFO_TUMB_UUID_FILE';
						setUuid( v.PRDT_UUID );
						unit_fileGet( imgIdValue, "fn_fileUpload");

						inTag += makeList( k, v, "list" );
						
						if ( k == resultList.length-1 ) {
							inTag += '</ul>';
							inTag += '</li>';
						}
					} );
				}else{
					inTag += makeList( key, val );
				}
			}else{
				
				inTag += makeList( key, val );
	            
			}

			
			
		});
		
	 } else inTag += '<div class="mlt_row hasbtn"style="font-size:22px; color:#aaa;text-align:center; ">등록된 내용이 없습니다.</div>';
	 
		$('#'+OBJECT_ID+'').append( inTag );
		inTag = '';
	
		var varHtml = "";	
		varHtml += '		<li><a id="pagingFirst" onclick="fn_BtnChnageListCnt('+ result.out.detail.paging.prevStep +');"  aria-label="Previous"><i class="fa fa-angle-left i_prev front"></i></a></li>   ';
		for (var i = result.out.detail.paging.startPage; i <= result.out.detail.paging.endPage; i++) {
			if (result.out.detail.paging.thisPage == i) varHtml += '<li class="pagi_btn pagi_num current"><a id="pagingActive" onclick="fn_BtnChnageListCnt('+ i +');" class="is-active" style="cursor:pointer;"><b>'+ i +'</b></a></li>   ';
			else varHtml += '<li class="pagi_btn pagi_num"><a name="pagingPassiive" onclick="fn_BtnChnageListCnt('+ i +');" style="cursor:pointer;"><b>'+ i +'</b></a></li>   ';
		}
		varHtml += '		<li><a id="pagingLast" onclick="fn_BtnChnageListCnt('+ result.out.detail.paging.nextStep +');"  aria-label="Next"><i class="fa fa-angle-right i_next front"></i></a></li>   ';
		
		$('#dataPage').empty();
		$('#dataPage').append( varHtml );
// 		$('.listCount').text('전체 ' + result.out.totalCnt );
// 		if( chk == 1 ) alert('페이지 개수 변환에 성공하였습니다.');
}

function chkBuyCd( BUY_CD, BUY_REFU_YN ){
	if( BUY_CD.indexOf('PB') > -1 ){
		if ( BUY_REFU_YN == 'Y' ) 	return "환불완료";
		else	return "환불신청";
	}else{
		if ( BUY_REFU_YN == 'Y' ) 	return "취소완료";
		else	return "취소신청";
	}
	
}

function makeList( key, val, list ){
	var tempTag = '';
	
	tempTag += '<li class="board_list_item">';
	tempTag += '	<div class="board_list_item_row">';
	tempTag += '		<div class="board_list_col payment_date">';
	tempTag += '			<div class="payment_date_inn">';
	tempTag += '				<div class="date">';
	tempTag += '					<span>결제일</span>';
	if ( typeof val.BUY_COMP_DTM == 'undefined' ) {
		tempTag += '                    <span>-</span>';
	}else{
		tempTag += '                    <span>'+val.BUY_COMP_DTM+'</span>';
	}
	tempTag += '				</div>';
	tempTag += '				<div class="number">';
	tempTag += '					<span>주문번호</span>';
	tempTag += '					<span>'+val.BUY_NO+'</span>';
	tempTag += '				</div>';
	tempTag += '			</div>';
	tempTag += '		</div>';
	tempTag += '		<div class="board_list_col payment_info">';
	tempTag += '			<div class="payment_img">';
	tempTag += '				<a href="'+val.MOVE_URL+'">';
	tempTag += '					<img src="'+defaultImg( val )+'" alt="">';
	tempTag += '				</a>';
	tempTag += '			</div>';
	tempTag += '			<div class="payment_info_inn">';
	tempTag += '				<a href="'+val.MOVE_URL+'">';
	tempTag += '					<span class="sub_title">['+val.PRDT_TYPE+'] '+val.P_CODE_NM+' ·'+val.MASTER_NM+'</span>';
	tempTag += '					<p class="title">'+val.INFO_PRDT_TITL1+'</p>';
	tempTag += '					<p class="title">'+val.INFO_PRDT_TITL2+'</p>';
	tempTag += '				</a>';
	tempTag += '				<span class="Period_of_use">';
	tempTag += '					<div>';
	tempTag += '						<span>환불완료일:</span> ';
	tempTag += '						<span>'+val.BUY_REFU_DTM+'</span>';
	tempTag += '					</div>';
	tempTag += '				</span> ';
	tempTag += '				<div class="price">';
// 	tempTag += '					<span>환불금액: <b>'+( list=='list'?val.PRDT_PRIC_REAL_ONE:val.BUY_PRIC )+'</b>원</span>';
	tempTag += '					<span>환불금액: <b>'+numberWithCommas( ( list=='list'?val.REAL_PAY_PRIC:val.BUY_PRIC ) )+'</b>원</span>';
	tempTag += '				</div>';
	tempTag += '				<div class="status">'+val.BUY_PRIC+' 원<span>'+val.BUY_REFU_DTM+'</span>';
	tempTag += '				</div>';
	tempTag += '			</div>';
	tempTag += '		</div>';
	tempTag += '		<div class="board_list_col payment_button">';
	tempTag += '			<button type="button"  id="refundDetail'+val.PRDT_CD+'"  class="btn_white btn_detail">상세보기</button>';
	tempTag += '			<button type="button"  id="cart'+val.BUY_IDX+'"  class="btn_addCart btn_cyan">장바구니</button>';
	tempTag += '		</div>    ';
	tempTag += '	</div>';
	tempTag += '</li>';
	
    $('#imgTag').val( '' );
	return tempTag;	
}

function defaultImg( v ){
	
	if( v.INFO_TUMB_UUID != null ) {
		var chkStr = v.INFO_TUMB_UUID.trim();
		if( chkStr != 'undefined' ) {
			if( chkStr != '') {
				return $('#imgTag').val();		
			} else return '/resources/assets/images/sub/profile_default_img.png';
		} else return '/resources/assets/images/sub/profile_default_img.png';
	} else return '/resources/assets/images/sub/profile_default_img.png';
	
}

$(document).on('click', '.btn_addCart' ,function(){
	if ( localStorage.getItem('frontLoginIdx') == '' || localStorage.getItem('frontLoginIdx') == null ){
		alert('로그인후 사용가능합니다.');
  		return location.href = '/front/account/login';
	}
	var params = new Object();
	params.status = "LIST";
	params.query = "selectFrontMypagePrdtBaskData";
	params.BUY_IDX = this.id.replace( 'cart', '');
	params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
	var baskResult = fn_DataAjax2( params );
	
	if ( baskResult.out.detail.data.length > 0 ) {
// 		if ( !confirm('이미 장바구니에 있는 상품입니다. \n다시 추가하시겠씁니까?') ) {
// 			return ;
// 		}
		alert('이미 장바구니에 있는 상품입니다. ');
			return ;
	}
	params.status = "WRITE";
	params.query = "insertFrontMypagePrdtBaskData";
	
	baskResult = fn_DataAjax2( params );
	
	if ( baskResult.out.resultCnt > 0 ) {
		alert('등록이 완료되었습니다.');
	}
	
});

lnbEvent();

function lnbEvent(){
    var $lnb = $('.lnb');
    var $lnbItems = $lnb.find('.lnb_item');
    
    $lnbItems.each(function(i,e){
        if($(e).hasClass('is-active')){
            $lnb.scrollLeft( $(e).offset().left-100 );
        }
    });
    
    $lnbItems.on('mouseenter', function(e){
        $lnb.stop().animate({scrollLeft: $(this).offset().left-100}, 1000);
    });
    
}

</script>




