<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" />

<style>
.inquiryDiv{float: right;/* position: relative;top: -80px; */}
.btn{
	cursor: pointer;
    vertical-align: middle;
    margin: 0;
    position: relative;
    display: inline-block;
    color: #ffffff;
    -webkit-box-shadow: 0 1px 0 rgb(0 0 0 / 5%);
    -moz-box-shadow: 0 1px 0 rgba(0, 0, 0, 0.05);
    box-shadow: 0 1px 0 rgb(0 0 0 / 5%);
    -webkit-transition: all 0.15s ease;
    -moz-transition: all 0.15s ease;
    -o-transition: all 0.15s ease;
    transition: all 0.15s ease;
    -webkit-border-radius: 2px;
    -webkit-background-clip: padding-box;
    -moz-border-radius: 2px;
    -moz-background-clip: padding;
    border-radius: 2px;
    background-clip: padding-box;
    font-size: 13px;
    padding: 0px 10px;
}
.btn_key_color, .btn_key_color:focus {
    display: block;
    line-height: 42px;
    margin-top: 5px;
    border-radius: 2px;
    color:black;
    background-color: #26f1d4;
    font-size: 14px;
    font-weight: 500;
    text-align: center;
}
.btn_key_color, .btn_key_color:hover {
    color:black;
}
</style> 


 <div id="container">
 <div class="section_inner">
        <section>
            <div class="section_inner">
                <div class="breadcrumb">
                    <span>홈</span>
                    <span>주문내역</span>
                    <span>1:1문의</span>
                </div>
                <h2 class="page_title">주문내역</h2>
            </div>
        </section>

        <div class="lnb">
	        <ul>
	            <li class="lnb_item"><a href="/front/mypage/payment">결제내역</a></li>
	            <li class="lnb_item"><a href="/front/mypage/mycoupon">내 쿠폰</a></li>
	            <li class="lnb_item"><a href="/front/mypage/cart">장바구니</a></li>
	            <li class="lnb_item"><a href="/front/mypage/like">찜</a></li>
	            <li class="lnb_item"><a href="/front/mypage/refund">취소/환불내역</a></li>
	            <li class="lnb_item is-active"><a href="/front/mypage/inquiry">1:1문의</a></li>
	        </ul>
        </div>

        <section class="section_last">
	        <table class="board_table" id="dataList">
	            <tbody id="dataPage">
	            </tbody>
	        </table>
			
			<div id="dataList" class="mypage_lec_table"></div>
			
			<div class="pagination justify-content-center paging" >
				<ul style="justify-content:space-between;" id="dataPage"></ul>
			</div>
			<div class="inquiryDiv">
				<a href='/front/service/inquiry' class="btn btn_key_color">1:1문의하기</a>
			</div>
        </section>
        </div>
    </div><!-- // #container -->   
<script>
var chk = 0;

$(function(){
	fn_BtnChnageListCnt("");
	chk = 1;
	$( '#now_loading' ).hide();
	lnbEvent();
});

$(document).ready(function(){
    $(".vod-nav").slick({
        slidesToScroll: 3,
        variableWidth: true,
        autoplay: false,
        infinite: false,
        dots: false,
        arrows: false
    });
});

function fn_BtnChnageListCnt( PAGE_NO ){
	paymentCnt = 0;
	
	var params = new Object();
	params.status = "PAGE";
	params.query = "selectFrontInquList";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.qnaTitl = $("#qnaTitl").val();
	
	//params.listCnt = $('#listCnt').val();
		console.log( PAGE_NO );
	if( PAGE_NO != '' ) {
		console.log( PAGE_NO );
		params.thisPage = PAGE_NO;
	}
	else params.thisPage = 1;
	
	fn_DataList( params, "dataList", 7 );
}

function fn_DataList( PARAMS, OBJECT_ID, CNT ) {
var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
var jsonData = result.out.detail.data;
var inTag = '';


$('#'+OBJECT_ID+'').empty();

if( jsonData.length > 0 ) {

	inTag += '<table class="board_table">';
	inTag += '<tbody>';
	
	$.each(jsonData, function(key, val) {
		
		inTag += '<tr>';
		inTag += '<td>';
		inTag += '<span class="board_cate">'+val.CODE_NM+'</span>';
		inTag += '<p class="board_title">';
		
		inTag += '<a href="javascript:;" onclick="fn_BtnDetail(\''+OBJECT_ID+'\', '+val.QNA_IDX+');">';
		inTag += ''+val.QNA_TITL+'';
		inTag += '</a>';
		inTag += '</p>';
		inTag += '</td>';
		inTag += '<td class="date" >';
		
		if( val.QNA_REPL == null ) inTag += '<span class="mltd_state use tablets_mltd_state phones_mltd_state">미답변</span>';
		else inTag += '<span class="mltd_state on tablets_mltd_state phones_mltd_state">답변완료</span>';
		
		inTag += '<span class="mltd_state_day tablets_mltd_state_day phones_mltd_state_day">'+val.SYS_REG_DTM+'</span>';
		inTag += '</td>';
		inTag += '</tr>';

//		inTag = '';
	});
	
	inTag += '</tbody>';
	inTag += '</table>';

	$('#'+OBJECT_ID+'').append( inTag );
} else {
		inTag += '<div class="mlt_row hasbtn noDataList" >등록된 내용이 없습니다.</div>';
	
	$('#'+OBJECT_ID+'').append( inTag );
}

	var varHtml = "";	
	varHtml += '		<li onclick="fn_BtnChnageListCnt('+ result.out.detail.paging.prevStep +');"  ><a id="pagingFirst" aria-label="Previous"><i class="fa fa-angle-left i_prev front"></i></a></li>   ';
	for (var i = result.out.detail.paging.startPage; i <= result.out.detail.paging.endPage; i++) {
		if (result.out.detail.paging.thisPage == i) varHtml += '<li class="pagi_btn pagi_num current" onclick="fn_BtnChnageListCnt('+ i +');" ><a id="pagingActive" class="active is-active" style="cursor:pointer;"><b>'+ i +'</b></a></li>   ';
		else varHtml += '<li class="pagi_btn pagi_num" onclick="fn_BtnChnageListCnt('+ i +');" ><a name="pagingPassiive" style="cursor:pointer;"><b>'+ i +'</b></a></li>   ';
	}
	varHtml += '		<li onclick="fn_BtnChnageListCnt('+ result.out.detail.paging.nextStep +');"  ><a id="pagingLast" aria-label="Next"><i class="fa fa-angle-right i_next front"></i></a></li>   ';
	
	$('#dataPage').empty();
	$('#dataPage').append( varHtml );
//	$('.listCount').text('전체 ' + result.out.totalCnt );
//	if( chk == 1 ) alert('페이지 개수 변환에 성공하였습니다.');
}

function fn_BtnDetail( OBJECT_ID, QNA_IDX ) {

$('#'+OBJECT_ID+'').empty();

var params = new Object();
params.status = "DETAIL";
params.query = "selectFrontInquDetail";
params.QNA_IDX = QNA_IDX;
params.frontLoginIdx = localStorage.getItem("frontLoginIdx");

var inTag = '';
var result = fn_DataAjax2( params );
var jsonData = result.out.detail.data;

$.each(jsonData, function(key, val) {

	inTag += '<table class="board_detail_table">';
	
	inTag += '<colgroup><col width="10%"><col ><col width="11%">';
	inTag += '</colgroup>';
	
	inTag += '<thead>';
	inTag += '<tr>';
	inTag += '<th colspan="2">';
	inTag += '<span class="board_cate">'+val.CODE_NM+' > 상세보기( 작성일 : '+val.SYS_REG_DTM+' )</span>';
	inTag += '<h3>'+val.QNA_TITL+'</h3>';
	inTag += '<br><br><p class="board_title">'+val.QNA_CNTN+'</p>';
	inTag += '</th>';
	inTag += '</tr>';
	inTag += '</thead>';
	
	inTag += '<tbody><tr>';
	
	if( val.QNA_USER_UUID != null ) {
		inTag += '<td colspan="3">';
		inTag += '<div id="inQuiryUFile" class="board_detail_content">';
		inTag += '<p class="file">';
// 		inTag += '<a href="javascript:;" class="board_detail_file_link"></a>';
		inTag += '</p>';	
		inTag += '</div>';
		inTag += '</td>';
	}
	
	inTag += '</tr></tbody>';

	inTag += '<tfoot><tr class="board_comment"><td colspan="3">';
	if( val.QNA_REPL != null ) {
		inTag += '<span class="bc_title">답변내용</span>';
		inTag += '<div class="board_comment_text">';
		inTag += '<p>'+val.QNA_REPL+'</p>';
		
		if( val.QNA_MNG_UUID != null ) {
			inTag += '<div id="inQuiryMFile" class="board_detail_content">';
			inTag += '<p class="file">';
// 			inTag += '<a href="javascript:;" class="board_detail_file_link"></a>';
			inTag += '</p>';	
			inTag += '</div>';
		}

		inTag += '</div>';
		
		inTag += '</td></tr>';
	}
	
	inTag += '<tr class="board_btn_row">';
	inTag += '<td colspan="3">';
	inTag += '<a href="javascript:;" onclick="fn_BtnChnageListCnt(\'\');" class="account_btn">목록</a>';
	inTag += '</td>';
	
	inTag += '</tr>';
	inTag += '</tfoot>';
	
	inTag += '</table>';

	$('#'+OBJECT_ID+'').append( inTag );
	
	imgIdValue = 'QNA_USER_UUID_FILE';
	setUuid( val.QNA_USER_UUID );
	unit_fileGet( imgIdValue, "fn_fileUpload");
	
	imgIdValue = 'QNA_MNG_UUID_FILE';
	setUuid( val.QNA_MNG_UUID );
	unit_fileGet( imgIdValue, "fn_fileUpload");
	
	// 파일들 한줄세우기 해주는 기능
	var uFileLeft = $('#inQuiryUFile > p').eq(0).offset().left;
	var mFileLeft = $('#inQuiryMFile > p').eq(0).offset().left;
	var uFileListLeft = $('#inQuiryUFile > p > a').eq(0).offset().left;
	var mFileListLeft = $('#inQuiryMFile > p > a').eq(0).offset().left;
	
	$('#inQuiryUFile > p > a + a').css( {'margin-left': uFileListLeft-uFileLeft, 'display':'block'} );
	$('#inQuiryMFile > p > a + a').css( {'margin-left': mFileListLeft-mFileLeft, 'display':'block'} );
	
	
});
}
</script>