<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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


</style>

    <div id="container">
        <div class="sub-inner">
            <div class="review-list-title">
                <h3>전체리뷰(<span>33</span>)<span style="margin-left:30px;  cursor: pointer;
                padding: 10px;
			    border: 1px solid;
			    border-radius: 2rem;
			    font-size: 13px;
			    font-weight: 100;
                " onclick="window.history.back()">마스터소개</span></h3>
                <ul class="list-sort">
                    <li class="active revisort" onclick="review_sort('');"><a style="cursor: pointer;">최신순</a></li>
                    <li class="revisort" onclick="review_sort('star');"><a style="cursor: pointer;">별점순</a></li>
                    <li class="revisort" onclick="review_sort('popular');"><a style="cursor: pointer;">인기순</a></li>
                </ul>
            </div>
            <ul class="review-list">
                
            </ul>
            <ul class="pagination">
                <li class="btn-page"><a href="#"><i class="ico-page-prev"></i></a></li>
                <li class="active" style="background-color:#27f1d5"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li class="btn-page"><a href="#"><i class="ico-page-next"></i></a></li>
            </ul>
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

    </div><!-- // #container -->
  

<script>

$('document').ready(function(){
	review_sort('');
	
	$( '#now_loading' ).hide();
});

//리뷰 정렬
function review_sort( sort, PAGE_NO ){
	$(this).addClass('active');
	$(this).siblings('li').removeClass('active');
	
	var params = new Object();
	params.status = "PAGE";
	params.query = "selectFrontReviewList";
	params.CATE_IDX = localStorage.getItem( 'masterCate' );
	params.sort = sort;
	params.page = 'page'
	
	if( PAGE_NO != undefined ) params.thisPage = PAGE_NO;
	else params.thisPage = 1;
	
	var reviewResult = fn_DataAjax2( params ); 
	var reviewList = reviewResult.out.detail.data;
	makeReview( reviewList, reviewResult.out.detail.paging, sort );
}


function makeReview( reviewList, paging, sort ){
	
	$('.review-list').empty();
	
	var html = '';
	
	$('.review-list-title > h3 > span').eq(0).text( reviewList.length );
	
	$.each( reviewList, function( k, v ){

	    html += '<li>';
	    html += '    <p class="vod-name">['+v.PRDT_TYPE+'] '+v.PRDT_NM+'</p>';
	    html += '    <div class="review-star">';
	    for (var i = 1; i <= 5; i++) {
	    	( i <= v.REVI_SCOR )?html += '            <span class="star"></span>': html += '            <span class="star-empty"></span>';
		}
	    html += '    </div>';
	    html += '    <div class="user-info">';
	    html += '        <b class="user-name">'+v.USER_NICK+'</b>';
	    html += '        <span class="date">'+v.SYS_REG_DTM+'</span>';
	    html += ( v.REVI_PUBL_YN == 'Y'?'<button  id="REVI'+v.REVI_IDX+'"  type="button" class="btn-report"><i class="ico-report"></i>신고</button>  ':'' );
	    html += '    </div>';
	    html += '                    <div class="rpdt_review_textarea review-info">'+( v.REVI_PUBL_YN == 'Y'?v.REVI_CNTN:'비공개처리된 리뷰입니다.' );
	    html += '                    </div>';
	    html += '</li>';
	    
	    
	    
	});
	
	var varHtml = "";	
	varHtml += '		<li class="pagi_btn pagi_btn_prev"><a id="pagingFirst" aria-label="Previous"><i class="fa "></i></a></li>   ';
	for (var i = paging.startPage; i <= paging.endPage; i++) {
		if (paging.thisPage == i) varHtml += '<li class="pagi_btn pagi_num current" page="'+i+'"><a id="pagingActive"  class="active" style="cursor:pointer;"><b>'+ i +'</b></a></li>   ';
		else varHtml += '<li class="pagi_btn pagi_num" page="'+i+'"><a name="pagingPassiive"  style="cursor:pointer;"><b>'+ i +'</b></a></li>   ';
	}
	varHtml += '		<li class="pagi_btn pagi_btn_next"><a id="pagingLast" aria-label="Next"><i class="fa "></i></a></li>   ';
	
	$('.pagination').empty();
	$('.pagination').append( varHtml );
	
	if ( reviewList.length == 0 ) {
		html = '<li class="rpdt_reivew_card"><div class="rpdt_review_textarea">리뷰가 없습니다.</div></li>'
    	$('.review-list').append( html );
	}else{
    	$('.review-list').append( html );
	}
}


// 리뷰 정렬시 버튼 색깔
$('.revisort').on('click', function(){
	$( '.revisort' ).removeClass('active');
	this.classList.add('active');
});


//신고팝업
$(document).on('click', '.btn-report',function(){
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

</script>
