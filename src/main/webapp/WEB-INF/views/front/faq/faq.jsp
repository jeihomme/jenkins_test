<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" />
<style>
	/* div.faq_content > p:not(.fc_text){margin-left: 56px;} 210524 수정 */
	div.faq_content > p:not(.fc_text){margin-left: 60px;}

    @media screen and (max-width: 1250px){
	    div.faq_content > p:not(.fc_text){margin-left:33px;}
    }
</style>
    <div id="container">
       <div class="section_inner">
<!--             <div class="sub_nav_box"> -->
<!--                 <ul class="sub_nav"> -->
<!--                     <li><a href="/front/main/index" class="home"></a></li> -->
<!--                     <li><a href="#">고객센터</a></li> -->
<!--                     <li><a href="/front/faq/faq" class="current">자주 묻는 질문</a></li> -->
<!--                 </ul> -->
<!--             </div> -->


        <section >
            <div class="section_inner">
                <div class="breadcrumb tablets_breadcrumb phones_breadcrumb">
                    <span>홈</span>
                    <span>고객센터</span>
                    <span>자주 묻는 질문</span>
                </div>
                <h2 class="page_title">자주 묻는 질문</h2>
            </div>
        </section>

            <div class="account_double_box">
<!--                 <h3 class="account_title account_title_big pc_show"> -->
<!--                     자주 묻는 질문 -->
<!--                 </h3> -->
                
                <div class="notice_box">
                    <div class="mypeople_tab_box">
                        <ul class="mypeople_tab">
                            <li><a href="javascript:;" class="mypeople_item active" onclick='fn_BtnChnageListCnt("", "");'>전체</a></li>
                            <li><a href="javascript:;" class="mypeople_item" onclick='fn_BtnChnageListCnt("", "FAQ01");'>회원</a></li>
                            <li><a href="javascript:;" class="mypeople_item" onclick='fn_BtnChnageListCnt("", "FAQ02");'>마스터</a></li>
                            <li><a href="javascript:;" class="mypeople_item" onclick='fn_BtnChnageListCnt("", "FAQ03");'>기타</a></li>
                        </ul>
	                   <!--<div class="board_search_box">
		                    <input type="text" id="faqTitl" class="board_search_input" placeholder="검색어를 입력 하세요" onkeypress='if(event.keyCode==13){ fn_BtnChnageListCnt("","");}'>
		                    <input type="submit" class="board_search_submit" onclick='fn_BtnChnageListCnt("","","");'>
		                      <button type="button" class="board_search_btn" onclick='fn_BtnChnageListCnt("","");'>검색</button> 
	                    </div>210520 수정 위치변경-->
                    </div>

                    <div>
                        <div id="dataList" class="faq_box"></div>
                        
                            

						<div class="pagination justify-content-center paging">
							<ul style="justify-content:space-between; text-align: center;"  id="dataPage"></ul>
						</div>
						
						<div class="board_search_box">
		                    <input type="text" id="faqTitl" class="board_search_input" placeholder="검색어를 입력 하세요" onkeypress='if(event.keyCode==13){ fn_BtnChnageListCnt("","");}'>
		                    <!-- <input type="submit" class="board_search_submit" onclick='fn_BtnChnageListCnt("","","");'> -->
		                     <button type="button" class="board_search_btn" onclick='fn_BtnChnageListCnt("","");'>검색</button>
	                    </div>
	
<!-- 	                    <div class="board_search_box"> -->
<!-- 		                    <input type="text" id="faqTitl" class="board_search_input" placeholder="검색어를 입력 하세요" onkeypress='if(event.keyCode==13){ fn_BtnChnageListCnt("","");$(".mypeople_item").eq(0).addClass("active");}'> -->
<!-- 		                    <input type="submit" class="board_search_submit" onclick='fn_BtnChnageListCnt("","");'> -->
<!-- 	                    </div> -->
                    
                </div>
            </div><!-- //.account_double_box  -->
        </div>
         </div>
    </div><!-- // #container -->

<script type="text/javascript" src="/resources/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/slick.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/jquery.waypoints.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/common.js"></script>
<script>


function accoFc() {
    var $btn = $('.btnToggle');

    $btn.on( 'click', function(){
        $(this).parents('.acco_box').toggleClass('active').children('.acco_content').slideToggle();
    });

    var $btnSingle = $('.acco_toggle_single');

    $btnSingle.on( 'click', function(){
        $(this).parents('.acco_box').toggleClass('active').children('.acco_content').slideToggle();
        $(this).parents('.acco_box').siblings('.acco_box').removeClass('active').children('.acco_content').slideUp();
    });
}

var chk = 0;
var glovalDataCd = '';
$(function(){
	fn_BtnChnageListCnt("", "");
	$('.mypeople_item').eq(0).addClass('active');
	chk = 1;
	$( '#now_loading' ).hide();
});

function fn_BtnChnageListCnt( PAGE_NO, DATA_CD ) {
	paymentCnt = 0;
	
	var params = new Object();
	params.status = "PAGE";
	params.query = "selectFrontFaqList";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	params.faqTitl = $("#faqTitl").val();
	params.faqCd = (DATA_CD+'').replace('undefined','');
	
	if( params.faqCd != "" ) {
		glovalDataCd = params.faqCd; 
		$('.mypeople_item').removeClass('active');
// 		$.each($('.mypeople_item'), function(key, val){
		if( DATA_CD.indexOf('01') > -1 ) $('.mypeople_item').eq(1).addClass('active');
		else if( DATA_CD.indexOf('02') > -1 ) $('.mypeople_item').eq(2).addClass('active');
		else if( DATA_CD.indexOf('03') > -1 ) $('.mypeople_item').eq(3).addClass('active');
		else $('.mypeople_item').eq(0).addClass('active');
// 		});
	} else {
		$('.mypeople_item').removeClass('active');
		$('.mypeople_item').eq(0).addClass('active');
	}
	
	
	if( PAGE_NO != '' ) params.thisPage = PAGE_NO;
	else params.thisPage = 1;
	
	fn_DataList( params, "dataList", 7 );
}

function fn_DataList( PARAMS, OBJECT_ID, CNT ) {
	var result = ${unit.ajax( ajaxUrl, "ajax", "PARAMS")};
	var jsonData = result.out.detail.data;
	var inTag = '';
	 
	$('#'+OBJECT_ID+'').empty();
	
	 if( jsonData.length > 0 ) {
// 		var FAQ_CNTN = '';
		$.each(jsonData, function(key, val) {
			
			inTag += '<div class="acco_box">';
			inTag += '<div class="acco_title">';
			inTag += '<div class="faq_title_box btnToggle">';
			inTag += '<span class="ft_icon"></span>';
			inTag += '<div class="ft_title_box">';
			inTag += '<span class="ft_cate">'+val.FAQ_CD_NM+'</span>';
			inTag += '<span class="ft_title" style="cursor:pointer;">'+val.FAQ_TITL+'</span>';
			inTag += '</div>';
			inTag += '<button type="button" class="acco_toggle btnToggle"></button>';
			inTag += '</div>';
			inTag += '</div>';
			inTag += '<div class="acco_content">';
			inTag += '<div class="faq_content">';
			inTag += '<span class="fc_icon">A</span>';
			inTag += '<p class="fc_text">'+val.FAQ_CNTN+'</p>';
			inTag += '</div>';
			inTag += '</div>';
			inTag += '</div>';

		});
		
		$('#'+OBJECT_ID+'').append( inTag );
// 		$('p.fc_text').html( FAQ_CNTN );
	 } else {
		inTag += '<div class="mlt_row hasbtn noDataList" >등록된 내용이 없습니다.</div>';
		$('#'+OBJECT_ID+'').append( inTag );
	 }

		var varHtml = "";	
		varHtml += '		<li><a id="pagingFirst" onclick="fn_BtnChnageListCnt('+ result.out.detail.paging.prevStep +', \''+glovalDataCd+'\');"  aria-label="Previous"><i class="fa fa-angle-left i_prev front"></i></a></li>   ';
		for (var i = result.out.detail.paging.startPage; i <= result.out.detail.paging.endPage; i++) {
			if (result.out.detail.paging.thisPage == i) varHtml += '<li class="pagi_btn pagi_num current" onclick="fn_BtnChnageListCnt('+ i +', \''+glovalDataCd+'\');" ><a id="pagingActive" class="is-active" style="cursor:pointer;"><b>'+ i +'</b></a></li>   ';
			else varHtml += '<li class="pagi_btn pagi_num" onclick="fn_BtnChnageListCnt('+ i +', \''+glovalDataCd+'\');" ><a name="pagingPassiive" style="cursor:pointer;"><b>'+ i +'</b></a></li>   ';
		}
		
		varHtml += '		<li><a id="pagingLast" onclick="fn_BtnChnageListCnt('+ result.out.detail.paging.nextStep +', \''+glovalDataCd+'\');"  aria-label="Next"><i class="fa fa-angle-right i_next front"></i></li>   ';
				
		$('#dataPage').empty();
		$('#dataPage').append( varHtml );

		// 아코디언
		accoFc();
}

</script>
