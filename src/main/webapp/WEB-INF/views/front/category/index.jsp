<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<style>
.scale {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
}
.scale:hover {
  transform: scale(1.2);
  -webkit-transform: scale(1.2);
  -moz-transform: scale(1.2);
  -ms-transform: scale(1.2);
  -o-transform: scale(1.2);
}

</style>



    <div id="container">
        <div class="sub_container section_inner">
            <div class="sub_sidebar">
                <h3 class="sidebar_title">뷰티·스타일</h3>

                <div class="sidebar_box">
                    <ul class="sidebar_list">
                        <li><a href="#">헤어</a></li>
                        <li><a href="#">메이크업</a></li>
                        <li><a href="#">발레</a></li>
                        <li><a href="#">요가</a></li>
                        <li><a href="#">피트니스</a></li>
                        <li><a href="#">패션 코디</a></li>
                        <li><a href="#">웨딩</a></li>
                        <li><a href="#">피트니스</a></li>
                        <li><a href="#">패션 코디</a></li>
                        <li><a href="#">웨딩</a></li>
                    </ul>
                </div>
            </div>

            <div class="sub_content">
                <div class="sub_category">
                    <button type="button" class="category_item">뷰티·스타일 전체</button>
                </div>

                <div class="main_content">
                    <div class="mc_item">
                        <div class="mc_thumb" style="background-image: url(/resources//images/dummy/dummy21.jpg)">
                            <div class="mc_thumb_btn">
                                <button type="button" class="mc_play_btn"></button>
                                <button type="button" class="mc_follow_btn">팔로우</button>
                                <a href="#" class="mc_mail_link">LIVE CLASS 예약</a>
                            </div>

                            <div class="mc_thumb_text">
                                <h3 class="mc_title">
                                    국내파의 희망
                                    <br>
                                    국제회의 통역사
                                </h3>
                                <span class="mc_name">EBS 영어강사 김태훈</span>
                            </div>
                        </div>

                        <div class="mc_content_box">
                            <div class="mc_content_item">
                                <h4 class="mcc_title_box">
                                    <span class="mcc_title">VOD</span>
                                    <span class="mcc_price">
                                        <span>50,000</span>원
                                    </span>
                                </h4>
                                <div class="mcc_btn_box">
                                    <span class="mcc_time">OT</span>
                                    <button type="button" class="mcc_btn">수강하기</button>
                                </div>
                            </div>
                            <div class="mc_content_item">
                                <h4 class="mcc_title_box">
                                    <span class="mcc_title">1:1이메일 상담</span>
                                    <span class="mcc_price">
                                        <span>50,000</span>원
                                    </span>
                                </h4>
                                <div class="mcc_btn_box">
                                    <span class="mcc_time">15:00</span>
                                    <button type="button" class="mcc_btn">예약하기</button>
                                </div>
                            </div>
                            <div class="mc_content_item">
                                <h4 class="mcc_title_box">
                                    <span class="mcc_title">1:1화상상담</span>
                                    <span class="mcc_price">
                                        <span>30</span>분
                                        <br>
                                        <span>50,000</span>원
                                    </span>
                                </h4>
                                <div class="mcc_btn_box">
                                    <span class="mcc_time">15:40</span>
                                    <button type="button" class="mcc_btn">예약하기</button>
                                </div>
                            </div>
                            <div class="mc_content_item">
                                <h4 class="mcc_title_box">
                                    <span class="mcc_title">1:1 채팅상담</span>
                                    <span class="mcc_price">
                                        <span>30</span>분
                                        <br>
                                        <span>50,000</span>원
                                    </span>
                                </h4>
                                <div class="mcc_btn_box">
                                    <span class="mcc_time">15:30</span>
                                    <button type="button" class="mcc_btn">예약하기</button>
                                </div>
                            </div>
                        </div>
                    </div><!-- //.mc_item  -->
                    <div class="mc_item">
                        <div class="mc_thumb" style="background-image: url(/resources//images/dummy/dummy21.jpg)">
                            <div class="mc_thumb_btn">
                                <button type="button" class="mc_play_btn"></button>
                                <button type="button" class="mc_follow_btn">팔로우</button>
                                <a href="#" class="mc_mail_link">LIVE CLASS 예약</a>
                            </div>

                            <div class="mc_thumb_text">
                                <h3 class="mc_title">
                                    국내파의 희망
                                    <br>
                                    국제회의 통역사
                                </h3>
                                <span class="mc_name">EBS 영어강사 김태훈</span>
                            </div>
                        </div>

                        <div class="mc_content_box">
                            <div class="mc_content_item">
                                <h4 class="mcc_title_box">
                                    <span class="mcc_title">VOD</span>
                                    <span class="mcc_price">
                                        <span>50,000</span>원
                                    </span>
                                </h4>
                                <div class="mcc_btn_box">
                                    <span class="mcc_time">OT</span>
                                    <button type="button" class="mcc_btn">수강하기</button>
                                </div>
                            </div>
                            <div class="mc_content_item">
                                <h4 class="mcc_title_box">
                                    <span class="mcc_title">1:1이메일 상담</span>
                                    <span class="mcc_price">
                                        <span>50,000</span>원
                                    </span>
                                </h4>
                                <div class="mcc_btn_box">
                                    <span class="mcc_time">15:00</span>
                                    <button type="button" class="mcc_btn">예약하기</button>
                                </div>
                            </div>
                            <div class="mc_content_item">
                                <h4 class="mcc_title_box">
                                    <span class="mcc_title">1:1화상상담</span>
                                    <span class="mcc_price">
                                        <span>30</span>분
                                        <br>
                                        <span>50,000</span>원
                                    </span>
                                </h4>
                                <div class="mcc_btn_box">
                                    <span class="mcc_time">15:40</span>
                                    <button type="button" class="mcc_btn">예약하기</button>
                                </div>
                            </div>
                            <div class="mc_content_item">
                                <h4 class="mcc_title_box">
                                    <span class="mcc_title">1:1 채팅상담</span>
                                    <span class="mcc_price">
                                        <span>30</span>분
                                        <br>
                                        <span>50,000</span>원
                                    </span>
                                </h4>
                                <div class="mcc_btn_box">
                                    <span class="mcc_time">15:30</span>
                                    <button type="button" class="mcc_btn">예약하기</button>
                                </div>
                            </div>
                        </div>
                    </div><!-- //.mc_item  -->
                </div>
            </div>
        </div>
    </div><!-- // #container -->

<script type="text/javascript">

//////////////////////////////////////////////////////////
//1. 변수 초기화
//////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////
//2. onload 함수
//////////////////////////////////////////////////////////

    // tab
    function tab() {
        var $tabBtn = $('.guide_tab_list li'),
            $tabCon = $('.guide_tab_item');
        
        $tabBtn.on( 'click', function(){
            var thisTab = $(this).index();
            $tabBtn.removeClass('active').eq(thisTab).addClass('active');

            $tabCon.removeClass('active').eq(thisTab).addClass('active');
        });
    }
    tab();

    $( '#now_loading' ).hide();
//////////////////////////////////////////////////////////
//3. 서비스 함수
//////////////////////////////////////////////////////////
	
	
}
</script>
















