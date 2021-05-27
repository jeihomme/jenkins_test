<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" /> 


<%@ include file="./../mypay/eutil.jsp"%>
<%
//운영아이디가 발급되면 제공되는 정보 , 기본은 테스트 아이디용.
	String mhkey        = "FF7BC0A83DC4E6B6114522CBD70A958C" ;    
	String mekey        = "549E98CA59A3691088CA0A52DC4BA66E";       
	String msalt        = "MA01";                                         
	String mpaymsalt    = "Qy5H10I3k4";
	// ----------------------------------------------------------------------
	
	// 사용자 토큰. 최초 1회 결제시 응답으로 내려주는 정보 ( 미 결제시에는 공백 )
	String servicetoken = "" ;       
	
	String curr_date_14 = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());
	String etoken = get_etoken(mhkey, curr_date_14, "");
	// 대체 URL 코드로 변환
	etoken = etoken.replace(":","%3A");
	
%>
<link href="/resources/assets/js/jquery-ui/jquery-ui.css" rel="stylesheet" type="text/css" />


    <div id="container">

<c:set var="strTxt2" value="${pageScope.etoken}" /> 
        <div class="section_inner">
        <section>
            <div class="section_inner">
                <div class="breadcrumb">
                    <span>홈</span>
                    <span>주문내역</span>
                    <span>결제내역</span>
                </div>
                <h2 class="page_title">주문내역</h2>
            </div>
        </section>

            <div class="account_double_box">
        <div class="lnb">
                <ul>
                    <li class="lnb_item is-active"><a href="/front/mypage/payment">결제내역</a></li>
                    <li class="lnb_item"><a href="/front/mypage/mycoupon">내 쿠폰</a></li>
                    <li class="lnb_item"><a href="/front/mypage/cart">장바구니</a></li>
                    <li class="lnb_item"><a href="/front/mypage/like">찜</a></li>
                    <li class="lnb_item"><a href="/front/mypage/refund">취소/환불내역</a></li>
                    <li class="lnb_item"><a href="/front/mypage/inquiry">1:1문의</a></li>
                </ul>
        </div>
        <div class="payment_search">
            <input type="text" id="startDate" class="input datepicker before" readonly="readonly" placeholder="YY-MM-DD" autocomplete='off'>
            <input type="text" id="endDate" class="input datepicker after" readonly="readonly" placeholder="YY-MM-DD" autocomplete='off'>
            <div class="input_search">
                <input id="masterNm" type="text" class="input" placeholder="마스터명, 상품명" onkeypress='if(event.keyCode==13)fn_BtnChnageListCnt("");'>
            </div>
            <button class="btn_search" onclick='fn_BtnChnageListCnt("");'>검색</button>
        </div>

<!-- 갯수 -->
            <div class="list-title">
                <ul class="sub-nav">
                </ul>
                <span class="totalCnt"></span>
                <div class="select select_number" data-role="selectBox">
                    <span date-value="optValue" class="selected-option"><!-- 선택된 옵션 값이 출력되는 부분 --></span>
                    <!-- 옵션 영역 -->
                    <ul class="hide">
                        <li><a href="#">전체</a></li>
                        <li><a href="#">20</a></li>
                        <li><a href="#">50</a></li>
                        <li><a href="#">100</a></li>
                    </ul>
                </div>
            </div>
            
                        <script>
                var body = document.querySelector('body');
                var select = document.querySelector('[data-role="selectBox"]');
                var values = select.querySelector('[date-value="optValue"]');
                var option = select.querySelector('ul');
                var opts = option.querySelectorAll('li');

                /* 셀렉트영역 클릭 시 옵션 숨기기, 보이기 */
                function selects(e){
                    e.stopPropagation();
                    if(option.classList.contains('hide')){
                        option.classList.remove('hide');
                        option.classList.add('show');
                    }else{
                        option.classList.add('hide');
                        option.classList.remove('show');
                    }
                    selectOpt();
                }

                /* 옵션선택 */
                function selectOpt(){
                	$.each(opts, function(key,val){
                		const innerValue = opt.innerHTML;
                		function changeValue(){
                            values.innerHTML = innerValue;
                        }
                        opt.addEventListener('click',changeValue)
                	});
                	
//                     opts.forEach(opt=>{
//                         const innerValue = opt.innerHTML;
//                         function changeValue(){
//                             values.innerHTML = innerValue;
//                         }
//                         opt.addEventListener('click',changeValue)
//                     });
                }

                /* 렌더링 시 옵션의 첫번째 항목 기본 선택 */
                function selectFirst(){
                    const firstValue = opts[0].innerHTML;
                    values.innerHTML = firstValue;
                }

                /* 옵션밖의 영역(=바디) 클릭 시 옵션 숨김 */
                function hideSelect(){
                    if(option.classList.contains('show')){
                        option.classList.add('hide');
                        option.classList.remove('show');
                    }
                }

                selectFirst();
                select.addEventListener('click',selects);
                body.addEventListener('click',hideSelect);
            </script>
<!-- 목록 -->
                <div class="board_list_payment">
                    <ul id="payList">
                    
                    </ul>
                </div>
					<div class="pagination justify-content-center paging">
						<ul style="justify-content:space-between;" id="dataPage"></ul>
					</div>
                </div>
            <!-- //.account_double_box  -->
        </div>
        
        
	<div id="reviewPop" class="popup_wrap">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content review_content">
                    <button type="button" class="pop_close" onclick="closeReview();"></button>
                    
                    <div id="reviewStar">
                        <h2 class="rpc_title"style="margin-bottom:24px;">리뷰작성</h2>
                        <div class="review-star review-star_mci">
                        <span class="revi_scor star"></span>
                        <span class="revi_scor star"></span>
                        <span class="revi_scor star"></span>
                        <span class="revi_scor star"></span>
                        <span class="revi_scor star-empty"></span>
                    </div>
                        <p class="rpc_text" style="margin-top:10px;">
                            만족스러우셨나요?
                            <br>
                            마스터님께 리뷰를 남겨 주세요.
                        </p>

                        <div class="rpc_review" style="margin-bottom: 10px;">
                            <textarea name="REVI_CNTN" id=""></textarea>
                        </div>
<!--                         <div class="rpc_file"> -->
<!--                             <input type="file" id="rpcFile" class="file_input"> -->
<!--                             <label for="rpcFile" class="file_input_label">파일 선택</label> -->
<!--                             <span class="rpc_file_text pps_per"></span> -->
<!--                         </div> -->
                        
                        <button type="button" class="rpc_submit" name="reviewBtn" onclick="writeReview();">작성완료</button>
                    </div>
                </div>
            </div>
        </div><!-- //#reviewPop -->
	</div><!-- // #container -->
    
    
    <div class="pop-cash-area">
    	<div class="popup-alert popup-cash">
    		<div>
    			<div class="popup-cash-text-area">
    					<p class="popup-cash-text">현금영수증 발급정보를 입력해 주세요</p>
    			
    			
    			</div>
                        <div class="cart_pymt_article method" id="cashRecei">
                        <div class="cart_pymt_article_row">
                            <div class="cart_pymt_article_col">
                            
				                            <div class="pt_total" style="text-align: left;">
										        <ul class="designRadiobutton form-control-sm"  style="display: none;" id="RECE_WHY" >
										        	<li style="display: inline-block;">
										        		<div class="designRadiobutton form-control-sm">
															<input type="radio" id="receiptIssueUsageCode_1"  name="CASH_RECE_WHY" value="PERSONAL_INCOME_TAX" checked="checked">
															<label for="receiptIssueUsageCode_1" class="label_txt">개인소득공제용</label>
														</div>
										        	</li>
													<li style="display: inline-block;">
														<div class="designRadiobutton form-control-sm">
															<input type="radio" id="receiptIssueUsageCode_2"  name="CASH_RECE_WHY" value="BIZ_EXPENSE_PROOF">
															<label for="receiptIssueUsageCode_2" class="label_txt">사업자증빙용(세금계산서용)</label>
														</div>
													</li>
										        </ul>
										        <ul id="receiptNm" style="display: none;">
										        	<li><span class="names">이름</span>
											        <input name="CASH_RECEIPT_NM" class="cash_input">
										        	</li>
										        	
										        </ul>
										        <div style="display: none;" class="PERSONAL_INCOME_TAX">
										        	<select class="cash_select"  name="CASH_RECE_KIND">
										        		<option value="휴대폰번호" selected="selected">휴대폰번호</option>
<!-- 										        		<option value="주민등록번호" >주민등록번호</option> -->
										        	</select>
										        </div>
										        <span style="display: none;" class="resident_group socialNumber PERSONAL_INCOME_TAX" >
													<p class="cash_item tell_item post_item_tell">
													<input type="text" id="id_num" class="cash_input" name="CASH_RECE_SOCIAL_NUM1" maxlength="13" placeholder="-빼고 입력하세요" value="" style=" width: calc( 100% - 159px )" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
<!-- 													<span class="tell_mark">-</span> -->
<!-- 													<input type="password" id="id_num2" class="cash_input" name="CASH_RECE_SOCIAL_NUM2" maxlength="7"  value="" style=" width: 30%;"> -->
													</p>
												</span>
										        <span style="display: none;" class="resident_group phoneNumber PERSONAL_INCOME_TAX">
										        
										        	<p class="cash_item tell_item post_item_tell">
						                                <input type="text" name="CASH_RECE_PHONE_NUM1" class="cash_input" maxlength="11" placeholder="-빼고 입력하세요" style=" width: calc( 100% - 159px )" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
<!-- 						                                <span class="tell_mark">-</span> -->
<!-- 						                                <input type="text" name="CASH_RECE_PHONE_NUM2" class="cash_input" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"> -->
<!-- 						                                <span class="tell_mark">-</span> -->
<!-- 						                                <input type="text" name="CASH_RECE_PHONE_NUM3" class="cash_input" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"> -->
						                            </p>
										        
												</span>
				
												<div style="display: none;" class="BIZ_EXPENSE_PROOF">
										        <span style="display: inline;" class="resident_group bizNumber BIZ_EXPENSE_PROOF">
											        	<span class="names">사업자등록번호</span>
										        	<p class="cash_item tell_item post_item_tell" style="margin-top: 0px;">
											      	    <input type="text" class="cash_input" name="CASH_RECE_BIZ_NUM1" placeholder="-빼고 입력하세요" maxlength="10" value="" style="width: 100%;" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
<!-- 											      	    <span class="tell_mark">-</span> -->
<!-- 														<input type="text" class="cash_input" name="CASH_RECE_BIZ_NUM2" maxlength="2" value="" style="width: 20%;"> -->
<!-- 														<span class="tell_mark">-</span> -->
<!-- 														<input type="password" class="cash_input" name="CASH_RECE_BIZ_NUM3" maxlength="5"  value="" style="width: 30%;"> -->
										        	</p>
												</span>
										        </div>
										        
												
				                            </div>
											<script type="text/javascript">
												$('#RECE_WHY').show();		
												$('#receiptIssueUsageCode_1').prop('checked', true);
												$('.PERSONAL_INCOME_TAX').not('.socialNumber').css('display','inline');
												$('.BIZ_EXPENSE_PROOF').hide();
												$('#receiptNm').show();
												
												$('input[name=CASH_RECE_WHY]').on('change',function(){
													if ($("input[name='CASH_RECE_WHY']:checked").val() == 'PERSONAL_INCOME_TAX' ) {
														$('[name=CASH_RECE_KIND]').val('휴대폰번호');
														$('.PERSONAL_INCOME_TAX').not('.socialNumber').css('display','inline');
														$('.BIZ_EXPENSE_PROOF').hide();
													}else{
														$('.PERSONAL_INCOME_TAX').hide();
														$('.BIZ_EXPENSE_PROOF').show();
													}
												});
												
												$('[name=CASH_RECE_KIND]').on('change', function(){
													if ( this.value == '휴대폰번호' ) {
														$('.socialNumber').hide();
														$('.phoneNumber').css('display','inline');
													}else{
														$('.phoneNumber').hide();
														$('.socialNumber').css('display','inline');
													}
												});
												
											</script>
                            	
                            </div>
                          
                        </div>
                    </div>
    		</div>
    		<div class="popup-alert-btn-area type1">
	    		<button type="button" id="getCashReceipt" class="btn-confirm-popup-cash">확인</button>
	    		<button type="button" class="btn-cancel-popup-alert">취소</button>
    		</div>
    	</div>
    	
    </div>
    
    
<style>
.mttt_info > span{
	margin-left: 5px;
}
.totalCnt{
    font-size: 18px;
    color: #aaa;
    position: relative;
    margin-bottom: 10px;
    top: -20px;
}
.board_list_payment .board_list_item{ height: auto; }
.timeLong {display: none!important;}

.timeBox:hover .timeShort:not(.show) { display : none!important; }
.timeBox:hover .timeLong:not(.hide) {display: table-cell!important;}
.timeShort.show { display: table-cell!important; }
.timeLong.show {display: table-cell!important;}
.timeShort.hide { display : none!important; }
.timeLong.hide {display : none!important;}

@media screen and (max-width: 1200px){}
	.cart_pymt_article_col:last-child {
	     width: 100%; 
	     float: none; 
	     padding-top: 0; 
	     white-space: inherit; 
	}
}
.cart_pymt_article_col:last-child{
	width: 100%;
	text-align: right;
}
</style>
<link rel="stylesheet" type="text/css" href="/resources/assets/css/cash.css">
<script>

$('.btn-cancel-popup-alert').on('click',function(){
	$('.pop-cash-area').hide();
});
  
//재구매
$(document).on('click', '.gorePayment', function(){
	// samesite 쿠키 정책 때문에 세션 만료시 작동
	if ( '${sessionScope.LOGIN_IDX}' == '' && localStorage.getItem("frontLoginIdx") != null ) {
		var reissue = new Object();
		reissue.status = "REISSUANCEID";
		reissue.query = "selectReissuanceId";
		reissue.USER_IDX = localStorage.getItem("frontLoginIdx");
		fn_DataAjax2( reissue );
	}
	
		// 시간설정 필요한 애들일때
	if ( this.id.indexOf('CN') > -1 || this.id.indexOf('FN') > -1 || this.id.indexOf('LN') > -1 ) {
		isMypageSetTime = 0;
		prdtCd = this.id.replace( 'buyAgain', '' );
		cateIdx = $(this).attr('cate-idx');
		$('#applyStep1Pop').show();
		fn_PrdtBuyDetail(  );
	}else{
		// vod, email 일때
		var baskArr = [];
		baskArr.push( this.id.replace( 'buyAgain', '' ) );
		
		localStorage.removeItem('baskArr');
		localStorage.setItem('baskArr',baskArr);
		
		if ( isMobile() ) {
			location.href="/front/payment/cart_payment_mobile";
		}else{
			location.href="/front/payment/cart_payment";
		}
	}
});

//리뷰팝업
$(document).on('click', '.writeReview', function(){
	$('.revi_scor').css( 'cursor','pointer' );
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectFrontMypagePaymentUserReview";
	params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
	params.BUY_IDX = this.id.replace( 'review','');
	const detail  = fn_DataAjax2( params );
	if ( detail.out.detail.data.length  ) {
		return alert('이미 작성한 리뷰가 있습니다.');
	}
	
	$('[name=reviewBtn]').attr( 'onclick', "writeReview("+this.id.replace( 'review','')+")" );
	
	$('.revi_scor').addClass('star-empty');
	$('#reviewPop').show();
});

$('.revi_scor').on('click', function(){
	const scrIdx = $(this).index();
	$('.revi_scor').removeClass('star');
	
	$('.revi_scor').each(function( k ){
		if ( k > scrIdx ) {
			$(this).addClass('star-empty');
		}else{
			$(this).removeClass('star-empty');
		}
	});
});

function closeReview(){
	$('[name=reviewBtn]').attr( 'onclick', '' );
	$('.revi_scor').removeClass('star');
	$('.revi_scor').addClass('star-empty');
}

function writeReview( idx ){
	if ( confirm( "한번 작성한 리뷰는 수정할수 없습니다. \n작성하시겠습니까?" ) ) {
		var params = unit_getParams('reviewPop');
		params.status = "WRITE";
		params.query = "insertFrontMypagePaymentReview";
		params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
		params.BUY_IDX = idx;
		params.REVI_SCOR = $('.revi_scor:not(.star-empty)').length;
		const write  = fn_DataAjax2( params );
		if (write.out.resultCnt > 0) {
			alert('리뷰가 등록되었습니다.');
			location.reload();
		}
	}
}

var chk = 0;
$(function(){
	// 달력 초기값 없애버리기
	$('#startDate').val('');
	$('#endDate').val('');

	fn_BtnChnageListCnt("");
	chk = 1;
	
	$( '#now_loading' ).hide();
});

function fn_BtnChnageListCnt( PAGE_NO ){
	paymentCnt = 0;
	
	var params = new Object();
	params.status = "PAGE";
	params.query = "selectFrontPayList";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.startDate = $("#startDate").val();
	params.endDate = $("#endDate").val();
	params.masterNm = $("#masterNm").val();
	
// 	params.listCnt = $('#listCnt').val();
	if( PAGE_NO > 0 && typeof PAGE_NO != 'undefined' ) params.thisPage = PAGE_NO;
	else params.thisPage = 1;
	
	fn_DataList( params, "payList", 7 );
}

function fn_DataList( PARAMS, OBJECT_ID, CNT ) {
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result.out.detail.data;
	var inTag = '';
	if ( result.out.params.startDate != '' ) {
		$('#startDate').val( result.out.params.startDate );
	}
	if ( result.out.params.endDate != '' ) {
		$('#endDate').val( result.out.params.endDate );
	}
	if ( result.out.params.masterNm != '' ) {
		$('#masterNm').val( result.out.params.masterNm );
	}
	 
	$('#'+OBJECT_ID+'').empty();
	 if( jsonData.length > 0 ) {
		$.each(jsonData, function(key, val) {
			imgIdValue = 'INFO_TUMB_UUID_FILE';
			setUuid( val.INFO_TUMB_UUID );
			unit_fileGet( imgIdValue, "fn_fileUpload");
			
// 			if( val.BUY_NO == '677140051909') console.log( jsonData[key] );
			if ( val.BUY_NO_CNT > 1 ) {
				
				var params = new Object();
				params.query = "selectBuyNoMultipleList";
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

						inTag += makeList( k, v );
						
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
		
	 } else {
		 
		inTag += '<div class="mlt_row hasbtn"style="font-size:22px; color:#aaa;text-align:center; ">등록된 내용이 없습니다.</div>';
		
	 }
		$('.board_list_payment > #'+OBJECT_ID+'').append( inTag );
		inTag = '';
		
		$('.totalCnt').text( '전체 : ' + result.out.totalCnt ); 
		
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

$(document).on('click','.refund_btn',function(){
	// 직접 취소하는 로직이나 없애고 취소 신청으로 바꾸기로함
// 	var params = new Object();
// 	params.status = "PAY_CANCLE";
// 	params.query = "selectFrontMypageRefundInfo";
// 	params.BUY_IDX = this.id.replace('buyId','');
// 	params.BUY_IDX_LIST = this.id.replace('buyId','');
// 	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
// 	var result = fn_DataAjax2( params );	
// 	console.log(result);
// 	var resultjson = result.out.detail.CamcleResult;
	
// 	if ( resultjson.authyn == 'O' || resultjson.rStatus == 'O' || resultjson.rACStatus == 'O' ) {
// 		alert('취소가 완료되었습니다.');
		
// 	}
	var params = new Object();
	params.status = "LIST";
	params.query = "selectFrontMypageRefundAppl";
	params.BUY_IDX = this.id.replace('buyId','');
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	
	var listResult = fn_DataAjax2( params );	
	
	
	if ( listResult.out.detail.data.length > 1 ) {
		if ( !confirm('한번에 여러개의 상품을 결제한경우 \n결제 취소시 결제했던 상품 전부가 취소처리됩니다.\n결제하시겠습니까?') ) {
			return ;	
		}
	}
	
	var params = new Object();
	params.status = "EDIT";
	params.query = "updateFrontMypageRefundAppl";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");

	params.BUY_IDX = this.id.replace('buyId','');
					
					
	if ( $(this).text().indexOf('철회') > -1 ) {
		params.BUY_STAT = '결제완료';
		params.BUY_REFU_YN = 'N';
	}else if( $(this).text().indexOf('취소') > -1 ){
		params.BUY_STAT = '취소신청';
		params.BUY_REFU_YN = 'R';
	}else if( $(this).text().indexOf('환불') > -1 ){
		params.BUY_STAT = '환불신청';
		params.BUY_REFU_YN = 'R';
	}
				
	
	var result = fn_DataAjax2( params );	
	
	if( result.out.resultCnt > 0 ){ alert('신청이 완료되었습니다.'); location.reload(); }
	else{ alert( '요청에 실패했습니다.' ); }
	
});

// function chkStat( stat, val ){
// 	if ( stat == "Y" ) return "결제완료";
// 	else	return val;
// }
    
function makeList( key, val ){
	var tempTag = '';
	tempTag += '<li class="board_list_item">';
    tempTag += '    <div class="board_list_item_row">';
    tempTag += '        <div class="board_list_col payment_date">';
    tempTag += '            <div class="payment_date_inn">';
    tempTag += '                <div class="date">';
    tempTag += '                    <span>결제일</span>';
    if ( typeof val.BUY_COMP_DTM == 'undefined' ) {
	    tempTag += '                    <span>-</span>';
	}else{
	    tempTag += '                    <span>'+val.BUY_COMP_DTM+'</span>';
	}
    tempTag += '                </div>';
    tempTag += '                <div class="number">';
    tempTag += '                    <span>주문번호</span>';
    tempTag += '                    <span>'+val.BUY_NO+'</span>';
    tempTag += '                </div>';
    tempTag += '            </div>';
    tempTag += '        </div>';
    tempTag += '        <div class="board_list_col payment_info">';
    tempTag += '            <div class="payment_img">';
    tempTag += '                <a href="'+val.DETAIL_URL+'">';
	
    tempTag += '                    <img src="'+defaultImg( val )+'" alt="">';

    tempTag += '                </a>';
    tempTag += '            </div>';
    tempTag += '            <div class="payment_info_inn">';
    tempTag += '                <a href="'+val.DETAIL_URL+'">';
    tempTag += '                    <span class="sub_title">['+val.PRDT_TYPE+'] '+val.PARENT_CODE_NM+' ·'+val.MASTER_NM+'</span>';
    tempTag += '                    <p class="title">'+val.PRDT_NM1+'</p>';
    tempTag += '                    <p class="title">'+val.PRDT_NM2+'</p>';
    tempTag += '                </a>';
    tempTag += '                <span class="Period_of_use">';
    tempTag += '                    <div class="timeBox">';
    											if ( val.PRDT_TYPE == 'VOD' ) {
	    tempTag += '                        <span>사용기간:</span>';
	    tempTag += '                        <span class="timeShort">'+shortString(val.PRDT_TIME)+'</span>';
	    tempTag += '                        <span class="timeLong">'+val.PRDT_TIME+'</span>';
												}else if ( val.PRDT_TYPE == '1:1화상' ) {
// 	    tempTag += '                        <span>선택일시:</span>';
// // 	    tempTag += '                        <span>'+getRidOfDupleDate( val.PRDT_USE_DTM )+'</span>';
// 	    tempTag += '                        <span class="timeShort">'+shortString(val.PRDT_TIME)+'</span>';
// 	    tempTag += '                        <span class="timeLong">'+val.PRDT_TIME+'</span>';
												}else if ( val.PRDT_TYPE == '1:1채팅' ) {
// 	    tempTag += '                        <span>선택일시:</span>';
// // 	    tempTag += '                        <span>'+getRidOfDupleDate( val.PRDT_USE_DTM )+'</span>';
// 	    tempTag += '                        <span class="timeShort">'+shortString(val.PRDT_TIME)+'</span>';
// 	    tempTag += '                        <span class="timeLong">'+val.PRDT_TIME+'</span>';
												}else if ( val.PRDT_TYPE == '1:1이메일' ) {
	    tempTag += '                        <span>상담회수:</span>';
	    tempTag += '                        <span class="timeShort">'+ shortString(val.PRDT_TIME) +'</span>';
	    tempTag += '                        <span class="timeLong">'+ val.PRDT_TIME +'</span>';
												}else if ( val.PRDT_TYPE == 'LIVE CLASS' ) {
// 	    tempTag += '                        <span>선택일시:</span>';
// // 	    tempTag += '                        <span>'+getRidOfDupleDate( val.PRDT_USE_DTM )+'</span>';
// 	    tempTag += '                        <span class="timeShort">'+shortString(val.PRDT_TIME)+'</span>';
// 	    tempTag += '                        <span class="timeLong">'+val.PRDT_TIME+'</span>';
												}
    
    tempTag += '                    </div>';
    tempTag += '                </span>';
    
    tempTag += '                <div class="price">';
    									if ( val.BUY_CARD_NO.indexOf('NPAY') > -1 ) {
    										// 카드결제중 네이버페이포인트 결제의 경우 현금영수증이 가능하다 때문에 넣어준다
    tempTag += '                    <span><b>'+numberWithCommas((1*val.REAL_PAY_PRIC.replace(/,/g,'')-1*val.REAL_DISC_PRIC.replace(/,/g,'')))+'</b>원</span><span>네이버페이포인트<span class="makeCash" onclick="selectCashReceipt('+'\'<%=etoken %>\''+', '+(""+val.BUY_NO)+',\''+(""+val.BUY_COMP_DTM)+'\' , \''+val.BUY_IDX+'\')">현금영수증발급신청<span></span>';
										}else{
    tempTag += '                    <span><b>'+numberWithCommas((1*val.REAL_PAY_PRIC.replace(/,/g,'')-1*val.REAL_DISC_PRIC.replace(/,/g,'')))+'</b>원</span><span>'+replaceBuyType( val.BUY_TYPE, val.BUY_CARD_NO )+ ( val.BUY_TYPE == '가상계좌'?' <br><br>'+ val.BUY_ACCO_NO:'' ) +'</span>';
										}
    									
    tempTag += '                </div>';
    tempTag += '                <div class="status">'+ val.BUY_STAT +'('+ val.REAL_CNT +'회)</div>';
    tempTag += '            </div>';
    tempTag += '        </div>';
    tempTag += '        <div class="board_list_col payment_button">';
    tempTag += '            <button type="button" id="buyAgain'+val.BUY_PRDT_CD+'" cate-idx="'+val.CATE_IDX+'" class="gorePayment btn_white">재구매</button>';
    if (val.BUY_STAT == '결제완료') {
	    tempTag += '            <button type="button" id="review'+val.BUY_IDX+'" class="writeReview btn_cyan">리뷰쓰기</button>';
	}
    
    
    tempTag += chkType( val );
    
    tempTag += '        </div>';
    tempTag += '    </div>';
    tempTag += '</li>';
	
//     console.log(val);
    $('#imgTag').val( '' );
	return tempTag;	
}

function replaceBuyType( BUY_TYPE, BUY_CARD_NO ){
	if ( BUY_TYPE == '신용카드' ) {
		if ( BUY_CARD_NO.indexOf('KAKAO') > -1 ) {
			return '카카오페이';
		}else if (BUY_CARD_NO.indexOf('PAYCO') > -1) {
			return '페이코';
		}else{
			return '카드결제';
		}
		
	}else{
		return BUY_TYPE;
	}
}

function chkType( val ){
    if ( val.BUY_STAT.indexOf('신청') > -1 ) {
    	if ( val.BUY_TYPE.indexOf('카드') > -1 || val.BUY_TYPE.indexOf('휴대폰') > -1 ) {
	   		return '<button type="button" id="buyId'+val.BUY_IDX+'" class="refund_btn  btn_line">취소철회</button>';
    	}else if( val.BUY_TYPE.indexOf('피플메이드통장') > -1 ){
	   		return '<button type="button" id="buyId'+val.BUY_IDX+'" class="refund_btn  btn_line">환불철회</button>';
		}else{
   			return '<button type="button" id="buyId'+val.BUY_IDX+'" class="refund_btn  btn_line">환불철회</button>';
		}
	}else if ( val.BUY_STAT.indexOf('결제완료') > -1  ) {
    	if ( val.BUY_TYPE.indexOf('카드') > -1 || val.BUY_TYPE.indexOf('휴대폰') > -1  ) {
			return '<button type="button" id="buyId'+val.BUY_IDX+'" class="refund_btn  btn_line">취소신청</button>';
    	}else if( val.BUY_TYPE.indexOf('피플메이드통장') > -1 ){
    		return '<button type="button" id="buyId'+val.BUY_IDX+'" class="refund_btn  btn_line">환불신청</button>';
    	}else{
    		console.log (val.BUY_REFU_DATE_DIFF );
    		console.log (val.REFUND_TAKE );
    		
    		if( val.BUY_REFU_DATE_DIFF < 0 ) {
    			return '<button type="button" id="buyId'+val.BUY_IDX+'" class="refund_btn  btn_line">환불신청</button>';
    		} else if( val.BUY_REFU_DATE_DIFF == 0 && val.BUY_REFU_TIME_DIFF.indexOf('-') > -1 ) {
    			return '<button type="button" id="buyId'+val.BUY_IDX+'" class="refund_btn  btn_line">환불신청</button>';
    		}else if ( val.REFUND_TAKE == 'Y' ) {
    			return '<button type="button" id="buyId'+val.BUY_IDX+'" class="refund_btn  btn_line">환불신청</button>';
			}
    	}
	}else if ( val.BUY_STAT.indexOf('완료') > -1  ) {
			return '<button type="button"  class="btn_line">'+val.BUY_STAT+'</button>';
	}
    return '';
}

function getRidOfDupleDate( DTM ){
	const dtmSplit = DTM.trim().split(' ~ ');
	if ( dtmSplit[0].substring(0,10) == dtmSplit[1].substring(0,10) ) {
		return dtmSplit[0] + ' ' + dtmSplit[1].split(' ')[1];
	}else{
		return DTM;
	}
}

function shortString( str ){
	if (str != null) {
		if ( str.length > 11 ){
			return str.substring( 0, 10 ) + '....';
		}else{
			return str;
		}
	}else return "";
}

$(document).on('click', '.timeShort', function(){
	$(this).siblings('.timeLong').removeClass('hide');
	$(this).removeClass('show');
	$(this).siblings('.timeLong').addClass('show');
	$(this).addClass('hide');
});

$(document).on('click', '.timeLong', function(){
	$(this).siblings('.timeShort').removeClass('hide');
	$(this).removeClass('show');
	$(this).siblings('.timeShort').addClass('show');
	$(this).addClass('hide');
});

function defaultImg( val ){
	if ( val.PRDT_UUID == '' || typeof val.PRDT_UUID == 'undefined' )  {
		return '/resources/assets/images/sub/profile_default_img.png';
	}else{
		return $('#imgTag').val();
	}
}

function selectCashReceipt( token, buyNo, compDtm, buyIdx ){
// 	console.log( compDtm );
	var params = new Object();
	params.query = "selectFrontNPayData";
	params.status = "DETAIL";
	params.BUY_IDX = buyIdx;
	params.BUY_NO = buyNo;
	params.FRONT_LOGIN_IDX = localStorage.getItem( 'frontLoginIdx' );
	var NPayData = fn_DataAjax2( params );
	
	
	if( NPayData.out.detail.data[0].TRIMED_CASH_RECE_NO == 'NO' ){
		
	
	
		compDtm = (""+ compDtm).replace(/-/g,'');
	// 	console.log("charset=utf8&mid=2001106623&msalt=MA01&etoken="+token+"&ordernumber=&ordername=&goodname=&tid="+buyNo+"&apprTradeDate="+compDtm+"&reqType=0");
		
		var cashResult = "";
		
		params.status = "NPAYPOINT";
		params.TOKEN = token;
		params.BUY_NO = buyNo;
		params.COMP_DTM = compDtm;
		params.REQ_TYPE = '0';
		var  con = fn_DataAjax2( params );
		
		console.log( con );
		// 네이버 포인트 현금영수증 발행 금액 조회
		var json = '';
		$.each(con.out.data.NpayResult, function(k,v){
// 			console.log( v );
			json += v;
		});
// 		console.log( json );
// 		console.log( JSON.parse(json) );
			
		cashResult = JSON.parse(json);
				    $('.btn-confirm-popup-cash').attr('onclick', '').unbind('click');
				    $('.btn-confirm-popup-cash').on('click',function(){
				    	makeCashReceipt( token, buyNo, compDtm, buyIdx );
				    });
		if ( cashResult.status != 'O' ) {
			return alert('금액 조회에 실패했습니다');
		}else{
			if ( cashResult.npointCashAmount > 0 ) {
				    clickPopupEvent('.makeCash',{
				          popupType : 'confirm',
				          popupMsg: '현금영수증 발행 가능금액은' + cashResult.npointCashAmount + '원입니다.  <br> 발급하시겠습니까?',
				          beforePopup: function(thisBtn){
				         	return 'ALERT';
				   	      } 
				  	});
				    $('.btn-confirm-popup-alert').on('click',function(){
	// 			    	console.log( token +": "+ buyNo +':'+ compDtm );
						$('[name=CASH_RECEIPT_NM]').val('');
						$('[name=CASH_RECE_PHONE_NUM1]').val('');
						$('[name=CASH_RECE_BIZ_NUM1]').val('');
						
						$('#receiptIssueUsageCode_1').trigger('click');
						
					    $('.pop-cash-area').show();
				    });
					
			}else{
				return alert('현금영수증 발행가능한 금액이 없습니다');
			}
		}
		
	}else{
		alert('이미 현금영수증을 발행했습니다.');
	}
}

function makeCashReceipt( token, buyNo, compDtm, buyIdx ){
	console.log( token +": "+ buyNo +':'+ compDtm + ':' + buyIdx );
	
	console.log( $('[name=CASH_RECE_WHY]').val() );
	
	var tranType = '';
	var userInfoType = '';
	var userInfo = '';
	
	// 현금영수증 유효값
	var params = new Object();
	
			if ( $('[name=CASH_RECE_WHY]:checked').val() == 'PERSONAL_INCOME_TAX' ) {
				params.CASH_RECE_WHY = '소득공제용';
				$('[name=RECE_WHY]').val('PERSONAL_INCOME_TAX');
				params.CASH_RECEIPT_NM = $('[name=CASH_RECEIPT_NM]').val();
				
				
				
				if ($('[name=CASH_RECE_KIND]').val() == '휴대폰번호' ) {
					params.CASH_RECE_KIND = $('[name=CASH_RECE_KIND]').val();
					params.CASH_RECE_SID = $('[name=CASH_RECE_PHONE_NUM1]').val();
					$('[name=RECE_KIND]').val(params.CASH_RECE_KIND);
					$('[name=RECE_SID]').val(params.CASH_RECE_SID);
					if ( params.CASH_RECE_SID.length < 11 ) {
						$('[name=RECE_WHY]').val('');
						$('[name=RECE_KIND]').val('');
						$('[name=RECE_SID]').val('');
						params.CASH_RECE_WHY = '';
						params.CASH_RECE_KIND = '';
						params.CASH_RECE_SID = '';
						event.stopPropagation();
						event.stopImmediatePropagation();
						return alert('휴대폰번호를 제대로 입력해 주세요.');
					}
					
					tranType = '0';
					userInfoType = '3';
					userInfo = params.CASH_RECE_SID;
					
				}else{
					params.CASH_RECE_KIND = $('[name=CASH_RECE_KIND]').val();
					params.CASH_RECE_SID = $('[name=CASH_RECE_SOCIAL_NUM1]').val();
					if ( params.CASH_RECE_SID.length < 13 ) {
						$('[name=RECE_WHY]').val('');
						$('[name=RECE_KIND]').val('');
						$('[name=RECE_SID]').val('');
						params.CASH_RECE_WHY = '';
						params.CASH_RECE_KIND = '';
						params.CASH_RECE_SID = '';
						event.stopPropagation();
						event.stopImmediatePropagation();
						return alert('주민등록번호를 제대로 입력해 주세요.');
					}
				}
				
			}else{
				params.CASH_RECEIPT_NM = $('[name=CASH_RECEIPT_NM]').val();
				params.CASH_RECE_WHY = '지출증빙용';
				params.CASH_RECE_KIND = '사업자등록번호';
				params.CASH_RECE_SID = $('[name=CASH_RECE_BIZ_NUM1]').val();
				
				$('[name=RECE_WHY]').val('BIZ_EXPENSE_PROOF');
				$('[name=RECE_KIND]').val(params.CASH_RECE_KIND);
				$('[name=RECE_SID]').val(params.CASH_RECE_SID);
					if ( params.CASH_RECE_SID.length < 10 ) {
						$('[name=RECE_WHY]').val('');
						$('[name=RECE_KIND]').val('');
						$('[name=RECE_SID]').val('');
						params.CASH_RECE_WHY = '';
						params.CASH_RECE_KIND = '';
						params.CASH_RECE_SID = '';
						event.stopPropagation();
						event.stopImmediatePropagation();
						return alert('사업자등록번호를 제대로 입력해 주세요.');
					}
				tranType = '1';
				userInfoType = '1';
				userInfo = params.CASH_RECE_SID;
			}
		
	params.status = "EDIT";
	params.query = "updateNaverCashReceiptData";
	params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
	params.BUY_IDX = buyIdx;
	
	var afterStatus = '';
	
	var npay = new Object();
	npay.status = "NPAYPOINT";
	npay.TOKEN = token;
	npay.BUY_NO = buyNo;
	npay.COMP_DTM = compDtm;
	npay.REQ_TYPE = '1';
	npay.tranType = tranType;
	npay.userInfoType = userInfoType;
	npay.userInfo = userInfo;
	
	var  con = fn_DataAjax2( npay );
	
	var json = '';
	$.each(con.out.data.NpayResult, function(k,v){
//			console.log( v );
		json += v;
	});
		console.log( json );
		console.log( JSON.parse(json) );
		
	afterStatus = JSON.parse(json);
	
	
	if (afterStatus.status =='O') {
		params.CASH_RECE_NO = afterStatus.tid;
		var result = fn_DataAjax2( params );
		alert('현금영수증이 정상 발급되었습니다.');
	}else{
		alert(afterStatus.respMsg);
	}
	
	$('.btn-cancel-popup-alert').trigger('click');
	
	
	
	
	
	
	
	
}
</script>
