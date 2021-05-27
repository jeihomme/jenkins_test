<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<style>


	.movie{display: none;}
	#mainPop{display:block;}
  	.mv_slider .slick-next {right: 0 !important;left: 700px;}  
  	.main_visual .mv_slider {left: 0 !important;} 
  	.mv_slider{display:none;} 
  	.mv_slider.slick-initialized{display:block;}
	.mv_slider_item{border: 1px solid white !important;}
	.mv_slider_text{    top: 0 !important;position: unset !important;}
	.mc_content_box{overflow:visible !important;}
	.itemImg{width: 100px;    margin: auto;}
	.table_row{    padding-top: 50px !important;}
	.imgDiv{background-color: gray;height: 45%;display: flex;border:1px solid black;}
	
/* 	모바일 */
	@media screen and (max-width: 1000px) {
		.mdcc_btn.gray{    width: 50px !important;height: 24px !important;background-color:#7d858a;}
		.mdcc_btn.orange{    width: 50px !important;height: 24px !important;background-color:#ffa639;} 
		
		.mv_slider_text .mvi_title{    font-size: 15px;}
		.mv_slider_text .mvi_text{font-size: 16px !important;}
		
 		.swiper-container {width:190px;height:380px;border-radius:7px;} 
		.swiper-slide {    width: 190px;text-align:center;align-items:center;justify-content:center;}
		
		.mdc_section{width: 340px;}
	}
	 
/* 	웹 */
	@media screen and (min-width: 1000px) {
		.mdcc_btn.gray{width: 70px;height: 40px;background-color:#7d858a;}
		.mdcc_btn.orange{width: 70px;height: 40px;background-color:#ffa639;}
		
		.mv_slider_text .mvi_title{    font-size: 16px;}
		.mv_slider_text .mvi_text{font-size: 16px !important;}
		
 		.swiper-container {width:570px;height:380px;border-radius:7px;} 
		.swiper-slide {width: 190px;text-align:center;align-items:center;justify-content:center;}
		
		
		.mdcc_table{width: 840px !important;}
		
	}
	
	
</style>

    <div id="container">
    
                       
      <div class="master_detail_section">         
                    
                 <!--결제 팝업끝-->     
                    <!-- 채팅상담팝업시작 -->
                   <div class="start1" >
        <!-- 팝업 -->
        <div id="applyStep1Pop" class="popup_wrap start1">
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item current">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 채팅상담</h3>
                            	<span class="apply_select_category">#외국어 #토익</span>
                            <span class="apply_info">
                                <span>30</span>분 / <span>50,000</span>원
                            </span>
                            <p class="apply_text">
                                지정된 시간 동안 마스터와 1:1 채팅 상담을 통해 깊이 있는 질문을 주고 받을 수 있습니다.
                                <br>
                                해외 이용자는 전문 통역이 함께 참여합니다.
                            </p>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                희망하는 상담 시간을 선택하세요. 
                                <br class="m_show">
                                <b>(가장 빠른 예약 시간은 16:00)</b>
                            </h4>

                            <div class="apply_select_date">
                                <div class="asd_box">
                                    <button type="button" class="asd_btn asd_btn_prev"></button>
                                    <div class="asd_date_box">
                                        <button type="button" class="asd_date_item">
                                            <span class="day">19</span>
                                            <span>월</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">20</span>
                                            <span>화</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">21</span>
                                            <span>수</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">22</span>
                                            <span>목</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">23</span>
                                            <span>금</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">24</span>
                                            <span>토</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">25</span>
                                            <span>일</span>
                                        </button>
                                    </div>
                                    <button type="button" class="asd_btn asd_btn_next"></button>
                                </div>

                                <div class="asd_time_box">
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">13:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">14:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">15:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">16:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">17:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">18:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">19:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">20:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">21:00</button>
                                    </span>
                                </div>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep2InputPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep1Pop -->

        <!-- 팝업 -->
        <div id="applyStep2InputPop" class="popup_wrap start1">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 채팅상담</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box">
                                <span class="apply_info_item">
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                상담에 필요한 질문에 답해주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <label for="afi01">가장 최근에 응시한 토익 시험은 언제인가요? 점수는 몇 점이었나요?</label>
                                    <input type="text" id="afi01" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi02">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi02" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi03">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi03" class="afi_input">
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray" data-popup="applyStep2TextPop">건너뛰기</button>

                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep1Pop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep2TextPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep2InputPop -->

        <!-- 팝업 -->
        <div id="applyStep2TextPop" class="popup_wrap start1">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h4 class="pop_title">유수연 마스터와 1:1 채팅상담</h4>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item" >
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                궁금한 내용을 알려주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <textarea name="" id="" class="afi_textarea" placeholder="상담 받고 싶은 질문을 입력해주세요.&#13;&#10;자세하게 입력해 주실수록 깊이있응 상담을 받으실 수 있습니다."></textarea>
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep2InputPop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep3Pop">다음</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep2TextPop -->
        
        <!-- 팝업 -->
        <div id="applyStep3Pop" class="popup_wrap start1">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item current">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 채팅상담</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item">
                                    결제 정보를 확인해주세요.
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                결제 정보 확인
                            </h4>

                            <div class="apply_complete_box">
                                <dl class="acb_list">
                                    <dt>상품명</dt>
                                    <dd>유수연 마스터와 1:1 채팅 상담</dd>
                                    <dt>선택 일정</dt>
                                    <dd>2020년 6월 26일 (금)</dd>
                                    <dt>선택 시간</dt>
                                    <dd>16:00 - 18:00, 총 2시간</dd>
                                    <dt class="total">결제 금액</dt>
                                    <dd class="total">200,000원</dd>
                                </dl>
                                <p class="acb_text">
                                    지정된 시간 동안 마스터와 1:1 화상 채팅을 통해 깊이 있는 질문을 주고받을 수 있습니다.
                                    <br>
                                    해외 이용자는 전문 통역이 함께 참여합니다.
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep2TextPop">이전</button>
                        <button type="button" id="index_btn" class="apply_pop_btn" data-popup="po">신청하기</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep3Pop -->
 
 
 
                    
                    <!-- 팝업끝 -->
                    
                    
                    
                    
                                        <!-- 팝업시작 -->
                    
        <!-- 팝업 -->
        <div id="applyStep1Pop" class="popup_wrap start1">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item current">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 채팅상담</h3>
							<span class="apply_select_category">#외국어 #토익</span>
                            <span class="apply_info">
                                <span>30</span>분 / <span>50,000</span>원
                            </span>
                            <p class="apply_text">
                                지정된 시간 동안 마스터와 1:1 화상 상담을 통해 깊이 있는 질문을 주고 받을 수 있습니다.
                                <br>
                                해외 이용자는 전문 통역이 함께 참여합니다.
                            </p>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                희망하는 상담 시간을 선택하세요. 
                                <br class="m_show">
                                <b>(가장 빠른 예약 시간은 16:00)</b>
                            </h4>

                            <div class="apply_select_date">
                                <div class="asd_box">
                                    <button type="button" class="asd_btn asd_btn_prev"></button>
                                    <div class="asd_date_box">
                                        <button type="button" class="asd_date_item">
                                            <span class="day">19</span>
                                            <span>월</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">20</span>
                                            <span>화</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">21</span>
                                            <span>수</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">22</span>
                                            <span>목</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">23</span>
                                            <span>금</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">24</span>
                                            <span>토</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">25</span>
                                            <span>일</span>
                                        </button>
                                    </div>
                                    <button type="button" class="asd_btn asd_btn_next"></button>
                                </div>

                                <div class="asd_time_box">
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">13:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">14:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">15:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">16:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">17:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">18:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">19:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">20:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">21:00</button>
                                    </span>
                                </div>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep2InputPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep1Pop -->

        <!-- 팝업 -->
        <div id="applyStep2InputPop" class="popup_wrap start1">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 채팅상담</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box">
                                <span class="apply_info_item">
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                상담에 필요한 질문에 답해주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <label for="afi01">가장 최근에 응시한 토익 시험은 언제인가요? 점수는 몇 점이었나요?</label>
                                    <input type="text" id="afi01" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi02">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi02" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi03">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi03" class="afi_input">
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray" data-popup="applyStep2TextPop">건너뛰기</button>

                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep1Pop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep2TextPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep2InputPop -->

        <!-- 팝업 -->
        <div id="applyStep2TextPop" class="popup_wrap start1">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h4 class="pop_title">유수연 마스터와 1:1 채팅상담</h4>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item" >
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                궁금한 내용을 알려주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <textarea name="" id="" class="afi_textarea" placeholder="상담 받고 싶은 질문을 입력해주세요.&#13;&#10;자세하게 입력해 주실수록 깊이있응 상담을 받으실 수 있습니다."></textarea>
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep2InputPop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep3Pop">다음</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep2TextPop -->
        
        <!-- 팝업 -->
        <div id="applyStep3Pop" class="popup_wrap start1">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item current">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 채팅 상담</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item">
                                    결제 정보를 확인해주세요.
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                결제 정보 확인
                            </h4>

                            <div class="apply_complete_box">
                                <dl class="acb_list">
                                    <dt>상품명</dt>
                                    <dd>유수연 마스터와 1:1 채팅 상담</dd>
                                    <dt>선택 일정</dt>
                                    <dd>2020년 6월 26일 (금)</dd>
                                    <dt>선택 시간</dt>
                                    <dd>16:00 - 18:00, 총 2시간</dd>
                                    <dt class="total">결제 금액</dt>
                                    <dd class="total">200,000원</dd>
                                </dl>
                                <p class="acb_text">
                                    지정된 시간 동안 마스터와 1:1 채팅 상담을 통해 깊이 있는 질문을 주고받을 수 있습니다.
                                    <br>
                                    해외 이용자는 전문 통역이 함께 참여합니다.
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep2TextPop">이전</button>
                        <button type="button" id="index_btn" class="apply_pop_btn">신청하기</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep3Pop -->
 
 
 </div>
                    
<!-- 채팅상담팝업끝 -->
                   <!-- 채팅상담팝업시작2 -->
                   <div class="start1" >
        <!-- 팝업 -->

        <div id="applyStep10Pop" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item current">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 LIVE CLASS</h3>
 							<span class="apply_select_category">#외국어 #토익</span>
                            <span class="apply_info">
                                <span>30</span>분 / <span>50,000</span>원
                            </span>
                            <p class="apply_text">
                                지정된 시간 동안 마스터와 LIVE CLASS을 통해 깊이 있는 질문을 주고 받을 수 있습니다.
                                <br>
                                해외 이용자는 전문 통역이 함께 참여합니다.
                            </p>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                희망하는 상담 시간을 선택하세요. 
                                <br class="m_show">
                                <b>(가장 빠른 예약 시간은 16:00)</b>
                            </h4>

                            <div class="apply_select_date">
                                <div class="asd_box">
                                    <button type="button" class="asd_btn asd_btn_prev"></button>
                                    <div class="asd_date_box">
                                        <button type="button" class="asd_date_item">
                                            <span class="day">19</span>
                                            <span>월</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">20</span>
                                            <span>화</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">21</span>
                                            <span>수</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">22</span>
                                            <span>목</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">23</span>
                                            <span>금</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">24</span>
                                            <span>토</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">25</span>
                                            <span>일</span>
                                        </button>
                                    </div>
                                    <button type="button" class="asd_btn asd_btn_next"></button>
                                </div>

                                <div class="asd_time_box">
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">13:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">14:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">15:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">16:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">17:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">18:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">19:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">20:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">21:00</button>
                                    </span>
                                </div>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!-- data-popup="열 팝업 id" class="pop_open" -->
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep11InputPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep10Pop -->


        <!-- 팝업 -->
        <div id="applyStep2InputPop" class="popup_wrap start1">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 채팅상담</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box">
                                <span class="apply_info_item">
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                상담에 필요한 질문에 답해주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <label for="afi01">가장 최근에 응시한 토익 시험은 언제인가요? 점수는 몇 점이었나요?</label>
                                    <input type="text" id="afi01" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi02">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi02" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi03">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi03" class="afi_input">
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray" data-popup="applyStep2TextPop">건너뛰기</button>

                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStepPop20">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep2TextPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep2InputPop -->

        <!-- 팝업 -->
        <div id="applyStep2TextPop" class="popup_wrap start1">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h4 class="pop_title">유수연 마스터와 1:1 채팅상담</h4>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item" >
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                궁금한 내용을 알려주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <textarea name="" id="" class="afi_textarea" placeholder="상담 받고 싶은 질문을 입력해주세요.&#13;&#10;자세하게 입력해 주실수록 깊이있응 상담을 받으실 수 있습니다."></textarea>
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep2InputPop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep3Pop">다음</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep2TextPop -->
        
        <!-- 팝업 -->
        <div id="applyStep3Pop" class="popup_wrap start1">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item current">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 채팅상담</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item">
                                    결제 정보를 확인해주세요.
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                결제 정보 확인
                            </h4>

                            <div class="apply_complete_box">
                                <dl class="acb_list">
                                    <dt>상품명</dt>
                                    <dd>유수연 마스터와 1:1 채팅 상담</dd>
                                    <dt>선택 일정</dt>
                                    <dd>2020년 6월 26일 (금)</dd>
                                    <dt>선택 시간</dt>
                                    <dd>16:00 - 18:00, 총 2시간</dd>
                                    <dt class="total">결제 금액</dt>
                                    <dd class="total">200,000원</dd>
                                </dl>
                                <p class="acb_text">

                                    지정된 시간 동안 마스터와 1:1 화상 채팅을 통해 깊이 있는 질문을 주고받을 수 있습니다.


                                    지정된 시간 동안 마스터와 LIVE CLASS을 통해 깊이 있는 질문을 주고받을 수 있습니다.

                                    <br>
                                    해외 이용자는 전문 통역이 함께 참여합니다.
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep2TextPop">이전</button>
                        <button type="button" id="index_btn" class="apply_pop_btn" data-popup="po">신청하기</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep3Pop -->
 
 
 
                    
                    <!-- 팝업끝 -->
                    
                    
                    
                    
                                        <!-- 팝업시작 -->
                    
        <!-- 팝업 -->
        <div id="applyStep1Pop" class="popup_wrap start1">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item current">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 채팅상담</h3>
							<span class="apply_select_category">#외국어 #토익</span>
                            <span class="apply_info">
                                <span>30</span>분 / <span>50,000</span>원
                            </span>
                            <p class="apply_text">

                                지정된 시간 동안 마스터와 1:1 화상 상담을 통해 깊이 있는 질문을 주고 받을 수 있습니다.
                               지정된 시간 동안 마스터와 LIVE CLASS을 통해 깊이 있는 질문을 주고 받을 수 있습니다.

                                <br>
                                해외 이용자는 전문 통역이 함께 참여합니다.
                            </p>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                희망하는 상담 시간을 선택하세요. 
                                <br class="m_show">
                                <b>(가장 빠른 예약 시간은 16:00)</b>
                            </h4>

                            <div class="apply_select_date">
                                <div class="asd_box">
                                    <button type="button" class="asd_btn asd_btn_prev"></button>
                                    <div class="asd_date_box">
                                        <button type="button" class="asd_date_item">
                                            <span class="day">19</span>
                                            <span>월</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">20</span>
                                            <span>화</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">21</span>
                                            <span>수</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">22</span>
                                            <span>목</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">23</span>
                                            <span>금</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">24</span>
                                            <span>토</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">25</span>
                                            <span>일</span>
                                        </button>
                                    </div>
                                    <button type="button" class="asd_btn asd_btn_next"></button>
                                </div>

                                <div class="asd_time_box">
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">13:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">14:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">15:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">16:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">17:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">18:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">19:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">20:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">21:00</button>
                                    </span>
                                </div>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep2InputPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep1Pop -->

        <!-- 팝업 -->
        <div id="applyStep2InputPop" class="popup_wrap start1">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 채팅상담</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box">
                                <span class="apply_info_item">
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                상담에 필요한 질문에 답해주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <label for="afi01">가장 최근에 응시한 토익 시험은 언제인가요? 점수는 몇 점이었나요?</label>
                                    <input type="text" id="afi01" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi02">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi02" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi03">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi03" class="afi_input">
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray" data-popup="applyStep2TextPop">건너뛰기</button>

                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep1Pop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep2TextPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep2InputPop -->

        <!-- 팝업 -->
        <div id="applyStep2TextPop" class="popup_wrap start1">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h4 class="pop_title">유수연 마스터와 1:1 채팅상담</h4>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item" >
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                궁금한 내용을 알려주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <textarea name="" id="" class="afi_textarea" placeholder="상담 받고 싶은 질문을 입력해주세요.&#13;&#10;자세하게 입력해 주실수록 깊이있응 상담을 받으실 수 있습니다."></textarea>
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep2InputPop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep3Pop">다음</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep2TextPop -->
        
        <!-- 팝업 -->
        <div id="applyStep3Pop" class="popup_wrap start1">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item current">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 채팅 상담</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item">
                                    결제 정보를 확인해주세요.
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                결제 정보 확인
                            </h4>

                            <div class="apply_complete_box">
                                <dl class="acb_list">
                                    <dt>상품명</dt>
                                    <dd>유수연 마스터와 1:1 채팅 상담</dd>
                                    <dt>선택 일정</dt>
                                    <dd>2020년 6월 26일 (금)</dd>
                                    <dt>선택 시간</dt>
                                    <dd>16:00 - 18:00, 총 2시간</dd>
                                    <dt class="total">결제 금액</dt>
                                    <dd class="total">200,000원</dd>
                                </dl>
                                <p class="acb_text">


                 지정된 시간 동안 마스터와 LIVE CLASS을 통해 깊이 있는 질문을 주고받을 수 있습니다.
                   <br>
                                    해외 이용자는 전문 통역이 함께 참여합니다.
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep2TextPop">이전</button>
                        <button type="button" id="index_btn" class="apply_pop_btn">신청하기</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep3Pop -->
 
 
 </div>
                    
<!-- 채팅상담팝업끝2 -->

<!-- 라이브클레스상담팝업시작 -->
                  <div class="start3" >  
        <!-- 팝업 -->
        <div id="applyStep10Pop" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item current">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 LIVE CLASS</h3>
 							<span class="apply_select_category">#외국어 #토익</span>
                            <span class="apply_info">
                                <span>30</span>분 / <span>50,000</span>원
                            </span>
                            <p class="apply_text">
                                지정된 시간 동안 마스터와 LIVE CLASS을 통해 깊이 있는 질문을 주고 받을 수 있습니다.
                                <br>
                                해외 이용자는 전문 통역이 함께 참여합니다.
                            </p>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                희망하는 상담 시간을 선택하세요. 
                                <br class="m_show">
                                <b>(가장 빠른 예약 시간은 16:00)</b>
                            </h4>

                            <div class="apply_select_date">
                                <div class="asd_box">
                                    <button type="button" class="asd_btn asd_btn_prev"></button>
                                    <div class="asd_date_box">
                                        <button type="button" class="asd_date_item">
                                            <span class="day">19</span>
                                            <span>월</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">20</span>
                                            <span>화</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">21</span>
                                            <span>수</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">22</span>
                                            <span>목</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">23</span>
                                            <span>금</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">24</span>
                                            <span>토</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">25</span>
                                            <span>일</span>
                                        </button>
                                    </div>
                                    <button type="button" class="asd_btn asd_btn_next"></button>
                                </div>

                                <div class="asd_time_box">
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">13:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">14:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">15:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">16:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">17:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">18:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">19:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">20:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">21:00</button>
                                    </span>
                                </div>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep11InputPop11">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep10Pop -->

        <!-- 팝업 -->
        <div id="applyStep11InputPop11" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 LIVE CLASS</h3>

                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box">
                                <span class="apply_info_item">
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>

                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                상담에 필요한 질문에 답해주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <label for="afi01">가장 최근에 응시한 토익 시험은 언제인가요? 점수는 몇 점이었나요?</label>
                                    <input type="text" id="afi01" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi02">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi02" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi03">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi03" class="afi_input">
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray" data-popup="applyStep12TextPop11">건너뛰기</button>

                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep10Pop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep12TextPop11">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep2InputPop -->

 <!-- 팝업 -->
        <div id="applyStep11InputPop11" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 LIVE CLASS</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box">
                                <span class="apply_info_item">
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                상담에 필요한 질문에 답해주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <label for="afi01">가장 최근에 응시한 토익 시험은 언제인가요? 점수는 몇 점이었나요?</label>
                                    <input type="text" id="afi01" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi02">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi02" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi03">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi03" class="afi_input">
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray" data-popup="applyStep12TextPop11">건너뛰기</button>

                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep10Pop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep12TextPop11">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep2InputPop -->


        <!-- 팝업 -->
        <div id="applyStep12TextPop11" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h4 class="pop_title">유수연 마스터와 LIVE CLASS</h4>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item" >
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                궁금한 내용을 알려주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <textarea name="" id="" class="afi_textarea" placeholder="상담 받고 싶은 질문을 입력해주세요.&#13;&#10;자세하게 입력해 주실수록 깊이있응 상담을 받으실 수 있습니다."></textarea>
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep11InputPop11">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep13Pop11">다음</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep2TextPop -->
        
        <!-- 팝업 -->
        <div id="applyStep13Pop11" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item current">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 LIVE CLASS</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item">
                                    결제 정보를 확인해주세요.
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                결제 정보 확인
                            </h4>

                            <div class="apply_complete_box">
                                <dl class="acb_list">
                                    <dt>상품명</dt>
                                    <dd>유수연 마스터와 LIVE CLASS</dd>
                                    <dt>선택 일정</dt>
                                    <dd>2020년 6월 26일 (금)</dd>
                                    <dt>선택 시간</dt>
                                    <dd>16:00 - 18:00, 총 2시간</dd>
                                    <dt class="total">결제 금액</dt>
                                    <dd class="total">200,000원</dd>
                                </dl>
                                <p class="acb_text">
                                    지정된 시간 동안 마스터와 LIVE CLASS을 통해 깊이 있는 질문을 주고받을 수 있습니다.
                                    <br>
                                    해외 이용자는 전문 통역이 함께 참여합니다.
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep12TextPop11">이전</button>
                        <button type="button" id="index_btn" class="apply_pop_btn">신청하기</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep3Pop -->
 
 
 
                    
                    <!-- 팝업끝 -->
                    
                    
                    
                    
                                        <!-- 팝업시작 -->
                    
        <!-- 팝업 -->
        <div id="applyStep1Pop" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item current">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 LIVE CLASS</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <span class="apply_info">
                                <span>30</span>분 / <span>50,000</span>원
                            </span>
                            <p class="apply_text">
                                지정된 시간 동안 마스터와 LIVE CLASS을 통해 깊이 있는 질문을 주고 받을 수 있습니다.
                                <br>
                                해외 이용자는 전문 통역이 함께 참여합니다.
                            </p>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                희망하는 상담 시간을 선택하세요. 
                                <br class="m_show">
                                <b>(가장 빠른 예약 시간은 16:00)</b>
                            </h4>

                            <div class="apply_select_date">
                                <div class="asd_box">
                                    <button type="button" class="asd_btn asd_btn_prev"></button>
                                    <div class="asd_date_box">
                                        <button type="button" class="asd_date_item">
                                            <span class="day">19</span>
                                            <span>월</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">20</span>
                                            <span>화</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">21</span>
                                            <span>수</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">22</span>
                                            <span>목</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">23</span>
                                            <span>금</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">24</span>
                                            <span>토</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">25</span>
                                            <span>일</span>
                                        </button>
                                    </div>
                                    <button type="button" class="asd_btn asd_btn_next"></button>
                                </div>

                                <div class="asd_time_box">
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">13:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">14:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">15:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">16:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">17:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">18:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">19:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">20:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">21:00</button>
                                    </span>
                                </div>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep2InputPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep1Pop -->

        <!-- 팝업 -->
        <div id="applyStep2InputPop" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 LIVE CLASS</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box">
                                <span class="apply_info_item">
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                상담에 필요한 질문에 답해주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <label for="afi01">가장 최근에 응시한 토익 시험은 언제인가요? 점수는 몇 점이었나요?</label>
                                    <input type="text" id="afi01" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi02">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi02" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi03">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi03" class="afi_input">
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray" data-popup="applyStep2TextPop">건너뛰기</button>

                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep1Pop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep2TextPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep2InputPop -->

        <!-- 팝업 -->
        <div id="applyStep2TextPop" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h4 class="pop_title">유수연 마스터와 LIVE CLASS</h4>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item" >
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                궁금한 내용을 알려주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <textarea name="" id="" class="afi_textarea" placeholder="상담 받고 싶은 질문을 입력해주세요.&#13;&#10;자세하게 입력해 주실수록 깊이있응 상담을 받으실 수 있습니다."></textarea>
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep2InputPop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep3Pop">다음</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep2TextPop -->
        
        <!-- 팝업 -->
        <div id="applyStep3Pop" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item current">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 LIVE CLASS</h3>
                            <span class="apply_select_category">#건강 #약사</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item">
                                    결제 정보를 확인해주세요.
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                결제 정보 확인
                            </h4>

                            <div class="apply_complete_box">
                                <dl class="acb_list">
                                    <dt>상품명</dt>
                                    <dd>유수연 마스터와 LIVE CLASS</dd>
                                    <dt>선택 일정</dt>
                                    <dd>2020년 6월 26일 (금)</dd>
                                    <dt>선택 시간</dt>
                                    <dd>16:00 - 18:00, 총 2시간</dd>
                                    <dt class="total">결제 금액</dt>
                                    <dd class="total">200,000원</dd>
                                </dl>
                                <p class="acb_text">
                                    지정된 시간 동안 마스터와 LIVE CLASS을 통해 깊이 있는 질문을 주고받을 수 있습니다.
                                    <br>
                                    해외 이용자는 전문 통역이 함께 참여합니다.
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep2TextPop">이전</button>
                        <button type="button" id="index_btn" class="apply_pop_btn">신청하기</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep3Pop -->
 
 
 
                    
       </div>

<!-- 라이브클레스끝 -->

<!-- 라이브클레스상담팝업시작2 -->
                  <div class="start3" >  
   
        <!-- 팝업 -->
        <div id="applyStep11InputPop" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 LIVE CLASS</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box">
                                <span class="apply_info_item">
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                상담에 필요한 질문에 답해주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <label for="afi01">가장 최근에 응시한 토익 시험은 언제인가요? 점수는 몇 점이었나요?</label>
                                    <input type="text" id="afi01" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi02">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi02" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi03">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi03" class="afi_input">
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray" data-popup="applyStep12TextPop">건너뛰기</button>

                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep10Pop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep12TextPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep2InputPop -->

        <!-- 팝업 -->
        <div id="applyStep12TextPop" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h4 class="pop_title">유수연 마스터와 LIVE CLASS</h4>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item" >
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                궁금한 내용을 알려주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <textarea name="" id="" class="afi_textarea" placeholder="상담 받고 싶은 질문을 입력해주세요.&#13;&#10;자세하게 입력해 주실수록 깊이있응 상담을 받으실 수 있습니다."></textarea>
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep11InputPop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep13Pop">다음</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep2TextPop -->
        
        <!-- 팝업 -->
        <div id="applyStep13Pop" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item current">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 LIVE CLASS</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item">
                                    결제 정보를 확인해주세요.
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                결제 정보 확인
                            </h4>

                            <div class="apply_complete_box">
                                <dl class="acb_list">
                                    <dt>상품명</dt>
                                    <dd>유수연 마스터와 LIVE CLASS</dd>
                                    <dt>선택 일정</dt>
                                    <dd>2020년 6월 26일 (금)</dd>
                                    <dt>선택 시간</dt>
                                    <dd>16:00 - 18:00, 총 2시간</dd>
                                    <dt class="total">결제 금액</dt>
                                    <dd class="total">200,000원</dd>
                                </dl>
                                <p class="acb_text">
                                    지정된 시간 동안 마스터와 LIVE CLASS을 통해 깊이 있는 질문을 주고받을 수 있습니다.
                                    <br>
                                    해외 이용자는 전문 통역이 함께 참여합니다.
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep12TextPop">이전</button>
                        <button type="button" id="index_btn" class="apply_pop_btn">신청하기</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep3Pop -->
 
 
 
                    
                    <!-- 팝업끝 -->
                    
                    
                    
                    
                                        <!-- 팝업시작 -->
                    
        <!-- 팝업 -->
        <div id="applyStep1Pop" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item current">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 LIVE CLASS</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <span class="apply_info">
                                <span>30</span>분 / <span>50,000</span>원
                            </span>
                            <p class="apply_text">
                                지정된 시간 동안 마스터와 LIVE CLASS을 통해 깊이 있는 질문을 주고 받을 수 있습니다.
                                <br>
                                해외 이용자는 전문 통역이 함께 참여합니다.
                            </p>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                희망하는 상담 시간을 선택하세요. 
                                <br class="m_show">
                                <b>(가장 빠른 예약 시간은 16:00)</b>
                            </h4>

                            <div class="apply_select_date">
                                <div class="asd_box">
                                    <button type="button" class="asd_btn asd_btn_prev"></button>
                                    <div class="asd_date_box">
                                        <button type="button" class="asd_date_item">
                                            <span class="day">19</span>
                                            <span>월</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">20</span>
                                            <span>화</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">21</span>
                                            <span>수</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">22</span>
                                            <span>목</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">23</span>
                                            <span>금</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">24</span>
                                            <span>토</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">25</span>
                                            <span>일</span>
                                        </button>
                                    </div>
                                    <button type="button" class="asd_btn asd_btn_next"></button>
                                </div>

                                <div class="asd_time_box">
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">13:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">14:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">15:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">16:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">17:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">18:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">19:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">20:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">21:00</button>
                                    </span>
                                </div>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep2InputPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep1Pop -->

        <!-- 팝업 -->
        <div id="applyStep2InputPop" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 LIVE CLASS</h3>
                            <span class="apply_select_category">#외국인 #토익</span>
                            <div class="apply_info_box">
                                <span class="apply_info_item">
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                상담에 필요한 질문에 답해주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <label for="afi01">가장 최근에 응시한 토익 시험은 언제인가요? 점수는 몇 점이었나요?</label>
                                    <input type="text" id="afi01" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi02">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi02" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi03">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi03" class="afi_input">
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray" data-popup="applyStep2TextPop">건너뛰기</button>

                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep1Pop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep2TextPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep2InputPop -->

        <!-- 팝업 -->
        <div id="applyStep2TextPop" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h4 class="pop_title">유수연 마스터와 LIVE CLASS</h4>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item" >
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                궁금한 내용을 알려주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <textarea name="" id="" class="afi_textarea" placeholder="상담 받고 싶은 질문을 입력해주세요.&#13;&#10;자세하게 입력해 주실수록 깊이있응 상담을 받으실 수 있습니다."></textarea>
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep2InputPop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep3Pop">다음</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep2TextPop -->
        
        <!-- 팝업 -->
        <div id="applyStep3Pop" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item current">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 LIVE CLASS</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item">
                                    결제 정보를 확인해주세요.
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                결제 정보 확인
                            </h4>

                            <div class="apply_complete_box">
                                <dl class="acb_list">
                                    <dt>상품명</dt>
                                    <dd>유수연 마스터와 LIVE CLASS</dd>
                                    <dt>선택 일정</dt>
                                    <dd>2020년 6월 26일 (금)</dd>
                                    <dt>선택 시간</dt>
                                    <dd>16:00 - 18:00, 총 2시간</dd>
                                    <dt class="total">결제 금액</dt>
                                    <dd class="total">200,000원</dd>
                                </dl>
                                <p class="acb_text">
                                    지정된 시간 동안 마스터와 LIVE CLASS을 통해 깊이 있는 질문을 주고받을 수 있습니다.
                                    <br>
                                    해외 이용자는 전문 통역이 함께 참여합니다.
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep2TextPop">이전</button>
                        <button type="button" id="index_btn" class="apply_pop_btn">신청하기</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep3Pop -->
 
 
 
                    
       </div>

<!-- 라이브클레스끝 -->
<!-- 라이브클레스상담팝업시작 -->
                  <div class="start3" >  
        <!-- 팝업 -->
        <div id="applyStep10Pop" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item current">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 LIVE CLASS</h3>
 							<span class="apply_select_category">#외국어 #토익</span>
                            <span class="apply_info">
                                <span>30</span>분 / <span>50,000</span>원
                            </span>
                            <p class="apply_text">
                                지정된 시간 동안 마스터와 LIVE CLASS을 통해 깊이 있는 질문을 주고 받을 수 있습니다.
                                <br>
                                해외 이용자는 전문 통역이 함께 참여합니다.
                            </p>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                희망하는 상담 시간을 선택하세요. 
                                <br class="m_show">
                                <b>(가장 빠른 예약 시간은 16:00)</b>
                            </h4>

                            <div class="apply_select_date">
                                <div class="asd_box">
                                    <button type="button" class="asd_btn asd_btn_prev"></button>
                                    <div class="asd_date_box">
                                        <button type="button" class="asd_date_item">
                                            <span class="day">19</span>
                                            <span>월</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">20</span>
                                            <span>화</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">21</span>
                                            <span>수</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">22</span>
                                            <span>목</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">23</span>
                                            <span>금</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">24</span>
                                            <span>토</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">25</span>
                                            <span>일</span>
                                        </button>
                                    </div>
                                    <button type="button" class="asd_btn asd_btn_next"></button>
                                </div>

                                <div class="asd_time_box">
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">13:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">14:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">15:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">16:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">17:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">18:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">19:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">20:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">21:00</button>
                                    </span>
                                </div>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep11InputPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep10Pop -->

        <!-- 팝업 -->
        <div id="applyStep11InputPop" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 LIVE CLASS</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box">
                                <span class="apply_info_item">
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                상담에 필요한 질문에 답해주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <label for="afi01">가장 최근에 응시한 토익 시험은 언제인가요? 점수는 몇 점이었나요?</label>
                                    <input type="text" id="afi01" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi02">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi02" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi03">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi03" class="afi_input">
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray" data-popup="applyStep2TextPop">건너뛰기</button>

                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep10Pop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep12TextPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep2InputPop -->

        <!-- 팝업 -->
        <div id="applyStep12TextPop" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h4 class="pop_title">유수연 마스터와 LIVE CLASS</h4>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item" >
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                궁금한 내용을 알려주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <textarea name="" id="" class="afi_textarea" placeholder="상담 받고 싶은 질문을 입력해주세요.&#13;&#10;자세하게 입력해 주실수록 깊이있응 상담을 받으실 수 있습니다."></textarea>
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep11InputPop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep13Pop">다음</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep2TextPop -->
        
        <!-- 팝업 -->
        <div id="applyStep13Pop" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item current">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 LIVE CLASS</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item">
                                    결제 정보를 확인해주세요.
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                결제 정보 확인
                            </h4>

                            <div class="apply_complete_box">
                                <dl class="acb_list">
                                    <dt>상품명</dt>
                                    <dd>유수연 마스터와 LIVE CLASS</dd>
                                    <dt>선택 일정</dt>
                                    <dd>2020년 6월 26일 (금)</dd>
                                    <dt>선택 시간</dt>
                                    <dd>16:00 - 18:00, 총 2시간</dd>
                                    <dt class="total">결제 금액</dt>
                                    <dd class="total">200,000원</dd>
                                </dl>
                                <p class="acb_text">
                                    지정된 시간 동안 마스터와 LIVE CLASS을 통해 깊이 있는 질문을 주고받을 수 있습니다.
                                    <br>
                                    해외 이용자는 전문 통역이 함께 참여합니다.
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep12TextPop">이전</button>
                        <button type="button" id="index_btn" class="apply_pop_btn">신청하기</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep3Pop -->
 
 
 
                    
                    <!-- 팝업끝 -->
                    
                    
                    
                    
                                        <!-- 팝업시작 -->
                    
        <!-- 팝업 -->
        <div id="applyStep1Pop" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item current">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 LIVE CLASS</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <span class="apply_info">
                                <span>30</span>분 / <span>50,000</span>원
                            </span>
                            <p class="apply_text">
                                지정된 시간 동안 마스터와 LIVE CLASS을 통해 깊이 있는 질문을 주고 받을 수 있습니다.
                                <br>
                                해외 이용자는 전문 통역이 함께 참여합니다.
                            </p>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                희망하는 상담 시간을 선택하세요. 
                                <br class="m_show">
                                <b>(가장 빠른 예약 시간은 16:00)</b>
                            </h4>

                            <div class="apply_select_date">
                                <div class="asd_box">
                                    <button type="button" class="asd_btn asd_btn_prev"></button>
                                    <div class="asd_date_box">
                                        <button type="button" class="asd_date_item">
                                            <span class="day">19</span>
                                            <span>월</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">20</span>
                                            <span>화</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">21</span>
                                            <span>수</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">22</span>
                                            <span>목</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">23</span>
                                            <span>금</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">24</span>
                                            <span>토</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">25</span>
                                            <span>일</span>
                                        </button>
                                    </div>
                                    <button type="button" class="asd_btn asd_btn_next"></button>
                                </div>

                                <div class="asd_time_box">
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">13:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">14:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">15:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">16:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">17:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">18:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">19:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">20:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">21:00</button>
                                    </span>
                                </div>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep2InputPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep1Pop -->

        <!-- 팝업 -->
        <div id="applyStep2InputPop" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 LIVE CLASS</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box">
                                <span class="apply_info_item">
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                상담에 필요한 질문에 답해주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <label for="afi01">가장 최근에 응시한 토익 시험은 언제인가요? 점수는 몇 점이었나요?</label>
                                    <input type="text" id="afi01" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi02">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi02" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi03">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi03" class="afi_input">
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray" data-popup="applyStep2TextPop">건너뛰기</button>

                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep1Pop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep2TextPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep2InputPop -->

        <!-- 팝업 -->
        <div id="applyStep2TextPop" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h4 class="pop_title">유수연 마스터와 LIVE CLASS</h4>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item" >
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                궁금한 내용을 알려주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <textarea name="" id="" class="afi_textarea" placeholder="상담 받고 싶은 질문을 입력해주세요.&#13;&#10;자세하게 입력해 주실수록 깊이있응 상담을 받으실 수 있습니다."></textarea>
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep2InputPop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep3Pop">다음</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep2TextPop -->
        
        <!-- 팝업 -->
        <div id="applyStep3Pop" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item current">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 LIVE CLASS</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item">
                                    결제 정보를 확인해주세요.
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                결제 정보 확인
                            </h4>

                            <div class="apply_complete_box">
                                <dl class="acb_list">
                                    <dt>상품명</dt>
                                    <dd>유수연 마스터와 LIVE CLASS</dd>
                                    <dt>선택 일정</dt>
                                    <dd>2020년 6월 26일 (금)</dd>
                                    <dt>선택 시간</dt>
                                    <dd>16:00 - 18:00, 총 2시간</dd>
                                    <dt class="total">결제 금액</dt>
                                    <dd class="total">200,000원</dd>
                                </dl>
                                <p class="acb_text">
                                    지정된 시간 동안 마스터와 LIVE CLASS을 통해 깊이 있는 질문을 주고받을 수 있습니다.
                                    <br>
                                    해외 이용자는 전문 통역이 함께 참여합니다.
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep2TextPop">이전</button>
                        <button type="button" id="index_btn" class="apply_pop_btn">신청하기</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep3Pop -->
 
 
 
                    
       </div>

<!-- 라이브클레스끝2 -->

<!-- 즉시상담가능팝업시작 -->
                   <div class="start4" >  
                  
                   
        	<div id="applyStepPop" class="popup_wrap start4">
            <div class="popup_layer"></div>


                    
                    
                        <div class="mds_item3" >
                                 <span class="mds_pay" style="position:absolute; top:20px; left:30px;">
                                    <span>즉시 상담가능</span>
                                </span>
                       <button type="button" class="pop_close"></button>
                        
                        
				     <ul class="mds_list2">


                        <li class="mds_item2">

                        
                            <div class="mds_top">
                                <span>가장 빠른 예약시간</span>
                                <span class="mds_time2">15:30</span>
                            </div>
                            <span class="mds_cate">1:1화상상담</span>
                            <span class="mds_title">
                                <span class="mds_num">
                                    <span>30</span>분
                                </span>
                                <span class="mds_pay">
                                    <span>300,000</span>원
                                </span>
                            </span>
                            
                            
                            <button type="button" class="pop_open mds_btn" data-popup="applyStepPop101">예약하기</button>
                        </li>
                        <li class="mds_item2">
                            <div class="mds_top">
                                <span>가장 빠른 예약시간</span>
                                <span class="mds_time2">15:30</span>
                            </div>
                            <span class="mds_cate">1:1채팅상담</span>
                            <span class="mds_title">
                                <span class="mds_num">
                                    <span>30</span>분
                                </span>
                                <span class="mds_pay">
                                    <span>50,000</span>원
                                </span>
                            </span>
                            
                            
                            <button type="button" class="pop_open mds_btn" data-popup="applyStepPop202">예약하기</button>
                        </li>
                        <li class="mds_item2">
                            <div class="mds_top">
                                <span>가장 빠른 예약시간</span>
                                <span class="mds_time2">15:30</span>
                            </div>
                            <span class="mds_cate">Live Class</span>
                            <span class="mds_title">
                                <span class="mds_num">
                                    <span>1</span>시간
                                </span>
                                <span class="mds_pay">
                                    <span>100,000</span>원
                                </span>
                            </span>
                            
                            
                            <button type="button" class="pop_open mds_btn" data-popup="applyStepPop303">예약하기</button>
                        </li>
                    </ul>
                  
                 
                  
                             
          
        			</div>
        		
       </div>
       </div>
       
       
                   <div class="start4" >
       
       
          	<div id="applyStepPop101" class="popup_wrap start111">
            <div class="popup_layer"></div>


            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item current">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 화상상담</h3>
 							<span class="apply_select_category">#외국어 #토익</span>
                            <span class="apply_info">
                                <span>30</span>분 / <span>50,000</span>원
                            </span>
                            <p class="apply_text">
                                지정된 시간 동안 마스터와 1:1 화상 상담을 통해 깊이 있는 질문을 주고 받을 수 있습니다.
                                <br>
                                해외 이용자는 전문 통역이 함께 참여합니다.
                            </p>
                        </div>
                          <h4 class="apply_title2">
                                희망하는 상담 시간을 선택하세요. 
                                <br class="m_show2">
                                <b>(가장 빠른 예약 시간은 16:00)</b>
                            </h4>

                    <div class="popup_bottom">
                        
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep3InputPop43">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        			</div>
       </div>
               <div id="applyStep3InputPop43" class="popup_wrap start2">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 화상상담</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box">
                                <span class="apply_info_item">
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                상담에 필요한 질문에 답해주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <label for="afi01">가장 최근에 응시한 토익 시험은 언제인가요? 점수는 몇 점이었나요?</label>
                                    <input type="text" id="afi01" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi02">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi02" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi03">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi03" class="afi_input">
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray" data-popup="applyStep3TextPop33">건너뛰기</button>

                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStepPop101">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep3TextPop33">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div>
        
        <div id="applyStep3TextPop33" class="popup_wrap start2">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h4 class="pop_title">유수연 마스터와 1:1 화상상담</h4>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item" >
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                궁금한 내용을 알려주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <textarea name="" id="" class="afi_textarea" placeholder="상담 받고 싶은 질문을 입력해주세요.&#13;&#10;자세하게 입력해 주실수록 깊이있응 상담을 받으실 수 있습니다."></textarea>
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep3InputPop43">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep4Pop44">다음</button>
                    </div>

                    
                </div>
            </div>
        </div>
        

        <div id="applyStep4Pop44" class="popup_wrap start2">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item current">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 화상상담</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item">
                                    결제 정보를 확인해주세요.
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                결제 정보 확인
                            </h4>

                            <div class="apply_complete_box">
                                <dl class="acb_list">
                                    <dt>상품명</dt>
                                    <dd>유수연 마스터와 1:1 화상 상담</dd>
                                    <dt>선택 일정</dt>
                                    <dd>2020년 6월 26일 (금)</dd>
                                    <dt>선택 시간</dt>
                                    <dd>16:00 - 18:00, 총 2시간</dd>
                                    <dt class="total">결제 금액</dt>
                                    <dd class="total">200,000원</dd>
                                </dl>
                                <p class="acb_text">
                                    지정된 시간 동안 마스터와 1:1 화상 채팅을 통해 깊이 있는 질문을 주고받을 수 있습니다.
                                    <br>
                                    해외 이용자는 전문 통역이 함께 참여합니다.
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep3TextPop33">이전</button>
                        <button type="button" id="index_btn" class="apply_pop_btn">신청하기</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- 즉시상담 화상 상담 시ㅏ -->
        
       <div class="start4" >
                 	<div id="applyStepPop202" class="popup_wrap start222">
            <div class="popup_layer"></div>


            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item current">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 채팅상담</h3>
 							<span class="apply_select_category">#외국어 #토익</span>
                            <span class="apply_info">
                                <span>30</span>분 / <span>50,000</span>원
                            </span>
                            <p class="apply_text">
                                지정된 시간 동안 마스터와 1:1 채팅 상담을 통해 깊이 있는 질문을 주고 받을 수 있습니다.
                                <br>
                                해외 이용자는 전문 통역이 함께 참여합니다.
                            </p>
                        </div>
                          <h4 class="apply_title2">
                                희망하는 상담 시간을 선택하세요. 
                                <br class="m_show2">
                                <b>(가장 빠른 예약 시간은 16:00)</b>
                            </h4>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep2InputPop202">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        			</div><!-- //start4 -->
       </div>
       
      <div id="applyStep2InputPop202" class="popup_wrap start1">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 채팅상담</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box">
                                <span class="apply_info_item">
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                상담에 필요한 질문에 답해주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <label for="afi01">가장 최근에 응시한 토익 시험은 언제인가요? 점수는 몇 점이었나요?</label>
                                    <input type="text" id="afi01" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi02">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi02" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi03">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi03" class="afi_input">
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray" data-popup="applyStep2TextPop202">건너뛰기</button>

                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStepPop202">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep2TextPop202">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep2InputPop -->

        <!-- 팝업 -->
        <div id="applyStep2TextPop202" class="popup_wrap start1">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h4 class="pop_title">유수연 마스터와 1:1 채팅상담</h4>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item" >
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                궁금한 내용을 알려주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <textarea name="" id="" class="afi_textarea" placeholder="상담 받고 싶은 질문을 입력해주세요.&#13;&#10;자세하게 입력해 주실수록 깊이있응 상담을 받으실 수 있습니다."></textarea>
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep2InputPop202">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep3Pop202">다음</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep2TextPop -->
        
        <!-- 팝업 -->
        <div id="applyStep3Pop202" class="popup_wrap start1">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item current">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 채팅상담</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item">
                                    결제 정보를 확인해주세요.
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                결제 정보 확인
                            </h4>

                            <div class="apply_complete_box">
                                <dl class="acb_list">
                                    <dt>상품명</dt>
                                    <dd>유수연 마스터와 1:1 채팅 상담</dd>
                                    <dt>선택 일정</dt>
                                    <dd>2020년 6월 26일 (금)</dd>
                                    <dt>선택 시간</dt>
                                    <dd>16:00 - 18:00, 총 2시간</dd>
                                    <dt class="total">결제 금액</dt>
                                    <dd class="total">200,000원</dd>
                                </dl>
                                <p class="acb_text">
                                    지정된 시간 동안 마스터와 1:1 화상 채팅을 통해 깊이 있는 질문을 주고받을 수 있습니다.
                                    <br>
                                    해외 이용자는 전문 통역이 함께 참여합니다.
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep2TextPop202">이전</button>
                        <button type="button" id="index_btn" class="apply_pop_btn" data-popup="po">신청하기</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep3Pop -->
 
 

        
        <!-- 팝업 -->
        <div id="applyStep3Pop" class="popup_wrap start1">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item current">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 채팅상담</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item">
                                    결제 정보를 확인해주세요.
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                결제 정보 확인
                            </h4>

                            <div class="apply_complete_box">
                                <dl class="acb_list">
                                    <dt>상품명</dt>
                                    <dd>유수연 마스터와 1:1 채팅 상담</dd>
                                    <dt>선택 일정</dt>
                                    <dd>2020년 6월 26일 (금)</dd>
                                    <dt>선택 시간</dt>
                                    <dd>16:00 - 18:00, 총 2시간</dd>
                                    <dt class="total">결제 금액</dt>
                                    <dd class="total">200,000원</dd>
                                </dl>
                                <p class="acb_text">
                                    지정된 시간 동안 마스터와 1:1 화상 채팅을 통해 깊이 있는 질문을 주고받을 수 있습니다.
                                    <br>
                                    해외 이용자는 전문 통역이 함께 참여합니다.
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep2TextPop">이전</button>
                        <button type="button" id="index_btn" class="apply_pop_btn" data-popup="po">신청하기</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep3Pop -->
 
<!--  즉시상담채팅팝업 -->
       
<div class="start4" >
                 	<div id="applyStepPop303" class="popup_wrap start222">
            <div class="popup_layer"></div>


            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item current">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 Live Class상담</h3>
 							<span class="apply_select_category">#외국어 #토익</span>
                            <span class="apply_info">
                                <span>30</span>분 / <span>50,000</span>원
                            </span>
                            <p class="apply_text">
                                지정된 시간 동안 마스터와  Live Class을 통해 깊이 있는 질문을 주고 받을 수 있습니다.
                                <br>
                                해외 이용자는 전문 통역이 함께 참여합니다.
                            </p>
                        </div>
                          <h4 class="apply_title2">
                                희망하는 상담 시간을 선택하세요. 
                                <br class="m_show2">
                                <b>(가장 빠른 예약 시간은 16:00)</b>
                            </h4>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep11InputPop303">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        			</div><!-- //start4 -->
       </div>
       
       
       
        <div id="applyStep11InputPop303" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 LIVE CLASS</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box">
                                <span class="apply_info_item">
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                상담에 필요한 질문에 답해주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <label for="afi01">가장 최근에 응시한 토익 시험은 언제인가요? 점수는 몇 점이었나요?</label>
                                    <input type="text" id="afi01" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi02">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi02" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi03">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi03" class="afi_input">
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray" data-popup="applyStep12TextPop303">건너뛰기</button>

                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStepPop303">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep12TextPop303">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep2InputPop -->


        <!-- 팝업 -->
        <div id="applyStep12TextPop303" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h4 class="pop_title">유수연 마스터와 LIVE CLASS</h4>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item" >
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                궁금한 내용을 알려주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <textarea name="" id="" class="afi_textarea" placeholder="상담 받고 싶은 질문을 입력해주세요.&#13;&#10;자세하게 입력해 주실수록 깊이있응 상담을 받으실 수 있습니다."></textarea>
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep11InputPop303">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep13Pop303">다음</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep2TextPop -->
        
        <!-- 팝업 -->
        <div id="applyStep13Pop303" class="popup_wrap start3">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item current">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 LIVE CLASS</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item">
                                    결제 정보를 확인해주세요.
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                결제 정보 확인
                            </h4>

                            <div class="apply_complete_box">
                                <dl class="acb_list">
                                    <dt>상품명</dt>
                                    <dd>유수연 마스터와 LIVE CLASS</dd>
                                    <dt>선택 일정</dt>
                                    <dd>2020년 6월 26일 (금)</dd>
                                    <dt>선택 시간</dt>
                                    <dd>16:00 - 18:00, 총 2시간</dd>
                                    <dt class="total">결제 금액</dt>
                                    <dd class="total">200,000원</dd>
                                </dl>
                                <p class="acb_text">
                                    지정된 시간 동안 마스터와 LIVE CLASS을 통해 깊이 있는 질문을 주고받을 수 있습니다.
                                    <br>
                                    해외 이용자는 전문 통역이 함께 참여합니다.
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep12TextPop303">이전</button>
                        <button type="button" id="index_btn" class="apply_pop_btn">신청하기</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep3Pop -->
 
       
       
       
<!-- 즉시상담가능팝업끝 -->


<!--VOD상담팝업시작 -->
                  <div class="start5" >  
        <!-- 팝업 -->

     
        <div id="applyStep6Pop" class="popup_wrap start5">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터 VOD</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item">
                                    결제 정보를 확인해주세요.
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                결제 정보 확인
                            </h4>
                            
                            <div class="apply_complete_box">
                                <dl class="acb_list">
                                    <dt>상품명</dt>
                                    <dd>유수연 마스터 VOD</dd>
                                    <dt>선택 일정</dt>
                                    <dd>2020. 11. 01 ~ 2020. 11. 30</dd>
                                    <dt>영상 정보</dt>
                                    <dd>20개 영상, NNN분</dd>
                                    <dt class="total">결제 금액</dt>
                                    <dd class="total">200,000원</dd>
                                </dl>
                                <p class="acb_text">결제 전 환불규정을 확인 하여 주시길 바랍니다.

                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                       <!--  -->
 
                        <button type="button" id="index_btn" class="apply_pop_btn">신청하기</button>
                    </div>

                    
                </div>
            </div>

 
 
                    
       </div>

<!-- VOD상담클레스끝 -->

<!--이메일상담팝업시작 -->
                  <div class="start6" >  
        <!-- 팝업 -->

     
        <div id="applyStep7Pop" class="popup_wrap start6">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1이메일상담</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item">
                                    결제 정보를 확인해주세요.
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                결제 정보 확인
                            </h4>
                            
                            <div class="apply_complete_box">
                                <dl class="acb_list">
                                    <dt>상품명</dt>
                                    <dd>유수연 마스터와 1:1이메일상담</dd>
                                    <dt>선택 일정</dt>
                                   
                                    <dd>2020. 11. 01 ~ 2020. 11. 30</dd>
                                    <dt>발송건수</dt>
                                    <dd>10건</dd>

                                    <dt class="total">결제 금액</dt>
                                    <dd class="total">200,000원</dd>
                                </dl>
                                <p class="acb_text">결제 전 환불규정을 확인 하여 주시길 바랍니다.

                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                       <!--  -->
 
                        <button type="button" id="index_btn" class="apply_pop_btn">신청하기</button>
                    </div>

                    
                </div>
            </div>
        </div>
 
 
 
                    
       </div>

<!-- 이메일상담클레스끝 -->
<!-- 화상상담팝업시작 -->
                  <div class="start2" >  
        <!-- 팝업 -->
        <div id="applyStep2Pop" class="popup_wrap start2">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item current">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 화상상담</h3>
 							<span class="apply_select_category">#외국어 #토익</span>
                            <span class="apply_info">
                                <span>30</span>분 / <span>50,000</span>원
                            </span>
                            <p class="apply_text">
                                지정된 시간 동안 마스터와 1:1 화상 상담을 통해 깊이 있는 질문을 주고 받을 수 있습니다.
                                <br>
                                해외 이용자는 전문 통역이 함께 참여합니다.
                            </p>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                희망하는 상담 시간을 선택하세요. 
                                <br class="m_show">
                                <b>(가장 빠른 예약 시간은 16:00)</b>
                            </h4>

                            <div class="apply_select_date">
                                <div class="asd_box">
                                    <button type="button" class="asd_btn asd_btn_prev"></button>
                                    <div class="asd_date_box">
                                        <button type="button" class="asd_date_item">
                                            <span class="day">19</span>
                                            <span>월</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">20</span>
                                            <span>화</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">21</span>
                                            <span>수</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">22</span>
                                            <span>목</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">23</span>
                                            <span>금</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">24</span>
                                            <span>토</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">25</span>
                                            <span>일</span>
                                        </button>
                                    </div>
                                    <button type="button" class="asd_btn asd_btn_next"></button>
                                </div>

                                <div class="asd_time_box">
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">13:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">14:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">15:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">16:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">17:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">18:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">19:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">20:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">21:00</button>
                                    </span>
                                </div>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep3InputPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep1Pop -->

        <!-- 팝업 -->
        <div id="applyStep3InputPop" class="popup_wrap start2">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 화상상담</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box">
                                <span class="apply_info_item">
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                상담에 필요한 질문에 답해주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <label for="afi01">가장 최근에 응시한 토익 시험은 언제인가요? 점수는 몇 점이었나요?</label>
                                    <input type="text" id="afi01" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi02">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi02" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi03">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi03" class="afi_input">
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray" data-popup="applyStep3TextPop">건너뛰기</button>

                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep2Pop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep3TextPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep2InputPop -->

        <!-- 팝업 -->
        <div id="applyStep3TextPop" class="popup_wrap start2">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h4 class="pop_title">유수연 마스터와 1:1 화상상담</h4>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item" >
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                궁금한 내용을 알려주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <textarea name="" id="" class="afi_textarea" placeholder="상담 받고 싶은 질문을 입력해주세요.&#13;&#10;자세하게 입력해 주실수록 깊이있응 상담을 받으실 수 있습니다."></textarea>
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep3InputPop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep4Pop">다음</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep3TextPop -->
        
        <!-- 팝업 -->
        <div id="applyStep4Pop" class="popup_wrap start2">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item current">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 화상상담</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item">
                                    결제 정보를 확인해주세요.
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                결제 정보 확인
                            </h4>

                            <div class="apply_complete_box">
                                <dl class="acb_list">
                                    <dt>상품명</dt>
                                    <dd>유수연 마스터와 1:1 화상 상담</dd>
                                    <dt>선택 일정</dt>
                                    <dd>2020년 6월 26일 (금)</dd>
                                    <dt>선택 시간</dt>
                                    <dd>16:00 - 18:00, 총 2시간</dd>
                                    <dt class="total">결제 금액</dt>
                                    <dd class="total">200,000원</dd>
                                </dl>
                                <p class="acb_text">
                                    지정된 시간 동안 마스터와 1:1 화상 채팅을 통해 깊이 있는 질문을 주고받을 수 있습니다.
                                    <br>
                                    해외 이용자는 전문 통역이 함께 참여합니다.
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep3TextPop">이전</button>
                        <button type="button" id="index_btn" class="apply_pop_btn">신청하기</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep3Pop -->
 
 
 
                    
                    <!-- 화상끝 -->
                    
                    
          <!-- 화상상담팝업시작2 -->
                  <div class="start2" >  
      
        <!-- 팝업 -->
        <div id="applyStep3InputPop" class="popup_wrap start2">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 화상상담</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box">
                                <span class="apply_info_item">
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                상담에 필요한 질문에 답해주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <label for="afi01">가장 최근에 응시한 토익 시험은 언제인가요? 점수는 몇 점이었나요?</label>
                                    <input type="text" id="afi01" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi02">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi02" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi03">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi03" class="afi_input">
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray" data-popup="applyStep3TextPop">건너뛰기</button>

                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep3InputPop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep3TextPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep2InputPop -->

        <!-- 팝업 -->
        <div id="applyStep3TextPop" class="popup_wrap start2">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h4 class="pop_title">유수연 마스터와 1:1 화상상담</h4>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item" >
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                궁금한 내용을 알려주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <textarea name="" id="" class="afi_textarea" placeholder="상담 받고 싶은 질문을 입력해주세요.&#13;&#10;자세하게 입력해 주실수록 깊이있응 상담을 받으실 수 있습니다."></textarea>
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                                            <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray" data-popup="applyStep4Pop">건너뛰기</button>
                    
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep3InputPop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep4Pop">다음</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep3TextPop -->
        
        <!-- 팝업 -->
        <div id="applyStep4Pop" class="popup_wrap start2">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item current">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 화상상담</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item">
                                    결제 정보를 확인해주세요.
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                결제 정보 확인
                            </h4>
     
                            <div class="apply_complete_box">
                                <dl class="acb_list">
                                    <dt>상품명</dt>
                                    <dd>유수연 마스터와 1:1 화상 상담</dd>
                                    <dt>선택 일정</dt>
                                    <dd>2020년 6월 26일 (금)</dd>
                                    <dt>선택 시간</dt>
                                    <dd>16:00 - 18:00, 총 2시간</dd>
                                    <dt class="total">결제 금액</dt>
                                    <dd class="total">200,000원</dd>
                                </dl>
                                <p class="acb_text">
                                    지정된 시간 동안 마스터와 1:1 화상 채팅을 통해 깊이 있는 질문을 주고받을 수 있습니다.
                                    <br>
                                    해외 이용자는 전문 통역이 함께 참여합니다.
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep3TextPop">이전</button>
                        <button type="button" id="index_btn" class="apply_pop_btn">신청하기</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep3Pop -->
 
 
 
                    
                    <!-- 화상끝2 -->
                    
                    
                    
                                        <!-- 팝업시작 -->
                    
        <!-- 팝업 -->
        <div id="applyStep1Pop" class="popup_wrap start2">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item current">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 화상상담</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <span class="apply_info">
                                <span>30</span>분 / <span>50,000</span>원
                            </span>
                            <p class="apply_text">
                                지정된 시간 동안 마스터와 1:1 화상 상담을 통해 깊이 있는 질문을 주고 받을 수 있습니다.
                                <br>
                                해외 이용자는 전문 통역이 함께 참여합니다.
                            </p>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                희망하는 상담 시간을 선택하세요. 
                                <br class="m_show">
                                <b>(가장 빠른 예약 시간은 16:00)</b>
                            </h4>

                            <div class="apply_select_date">
                                <div class="asd_box">
                                    <button type="button" class="asd_btn asd_btn_prev"></button>
                                    <div class="asd_date_box">
                                        <button type="button" class="asd_date_item">
                                            <span class="day">19</span>
                                            <span>월</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">20</span>
                                            <span>화</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">21</span>
                                            <span>수</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">22</span>
                                            <span>목</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">23</span>
                                            <span>금</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">24</span>
                                            <span>토</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">25</span>
                                            <span>일</span>
                                        </button>
                                    </div>
                                    <button type="button" class="asd_btn asd_btn_next"></button>
                                </div>

                                <div class="asd_time_box">
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">13:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">14:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">15:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">16:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">17:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">18:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">19:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">20:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">21:00</button>
                                    </span>
                                </div>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep2InputPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep1Pop -->

        <!-- 팝업 -->
        <div id="applyStep2InputPop" class="popup_wrap start2">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 화상상담</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box">
                                <span class="apply_info_item">
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                상담에 필요한 질문에 답해주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <label for="afi01">가장 최근에 응시한 토익 시험은 언제인가요? 점수는 몇 점이었나요?</label>
                                    <input type="text" id="afi01" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi02">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi02" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi03">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi03" class="afi_input">
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray" data-popup="applyStep1Pop">건너뛰기</button>

                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep1Pop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep2TextPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep2InputPop -->

        <!-- 팝업 -->
        <div id="applyStep2InputPop202" class="popup_wrap start2">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 채팅상담</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box">
                                <span class="apply_info_item">
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>30</span>분 / <span>50,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                상담에 필요한 질문에 답해주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <label for="afi01">가장 최근에 응시한 토익 시험은 언제인가요? 점수는 몇 점이었나요?</label>
                                    <input type="text" id="afi01" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi02">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi02" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi03">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi03" class="afi_input">
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
          
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStepPop202">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep2TextPop202">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep2InputPop -->
        <!-- 팝업 -->
        <div id="applyStep2TextPop202" class="popup_wrap start2">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h4 class="pop_title">유수연 마스터와 1:1 화상상담</h4>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item" >
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                궁금한 내용을 알려주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <textarea name="" id="" class="afi_textarea" placeholder="상담 받고 싶은 질문을 입력해주세요.&#13;&#10;자세하게 입력해 주실수록 깊이있응 상담을 받으실 수 있습니다."></textarea>
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep2InputPop202">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep4Pop">다음</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep2TextPop -->
        
        <!-- 팝업 -->
        <div id="applyStep4Pop" class="popup_wrap start2">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item current">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 화상 상담</h3>
                            <span class="apply_select_category">#외국어 #토익</span>
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item">
                                    결제 정보를 확인해주세요.
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                결제 정보 확인
                            </h4>
      
                            <div class="apply_complete_box">
                                <dl class="acb_list">
                                    <dt>상품명</dt>
                                    <dd>유수연 마스터와 1:1 화상 상담</dd>
                                    <dt>선택 일정</dt>
                                    <dd>2020년 6월 26일 (금)</dd>
                                    <dt>선택 시간</dt>
                                    <dd>16:00 - 18:00, 총 2시간</dd>
                                    <dt class="total">결제 금액</dt>
                                    <dd class="total">200,000원</dd>
                                </dl>
                                <p class="acb_text">
                                    지정된 시간 동안 마스터와 1:1 화상 상담을 통해 깊이 있는 질문을 주고받을 수 있습니다.
                                    <br>
                                    해외 이용자는 전문 통역이 함께 참여합니다.
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep2TextPop">이전</button>
                        <button type="button" id="index_btn" class="apply_pop_btn">신청하기</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep4Pop -->
 
 
 
                    
       </div><!-- 화상상담팝업끝 -->


    
    
    
    
      <!--결제 팝업시작-->    
       <div id="po" class="popup_wrap" >
            <div class="popup_box" >
                <div class="popup_content pay_popup_content">
                  <button type="button" class="pop_close"></button>
                    <h2 class="pay_pop_title">결제하시겠습니까?</h2>
                    <h3 class="pay_pop_title" style="font-size:12px;color:gray;">쿠폰이 있으신 경우 장바구니에서 결제가능합니다.</h3>
                    
						<div class="pay_pop_btn_box">
						<a href="/front/mypage/cart"><button type="button" class="pay_pop_btn">장바구니</button></a>
                        <a href="/front/mypage/payment"><button type="button" class="pay_pop_btn gray">바로 결제</button></a>
                    </div>
                </div>
            </div>
        </div>
    
    
    
<!-- <div class="master_detail_section">  -->
<div class="master_detail_thumbnail" style="background-image: url(../assets/images/dummy/dummy31.jpg);"></div> 
            
            <div class="section_inner">
                <div class="master_detail_inner">
                    <div class="master_detail_info_box">
                        <div class="mdi_title_box">
                            <h3 class="mdi_title">
                                <p class="mdi_name">
                                    <span>유수연</span>
                                    <button type="button" class="mc_follow_btn">팔로우</button>
                                </p>
                                <span class="mdi_job">영어 스타강사</span>
                                <span class="mdi_tag">#외국어#토익</span>
                            </h3>
                            
                            <div class="mdi_follow">
                                <div class="mdif_box">
                                    <span class="mdif_item" style="background-image: url(../assets/images/dummy/dummy24.png)"></span>
                                    <span class="mdif_item" style="background-image: url(../assets/images/dummy/dummy25.png)"></span>
                                    <span class="mdif_item" style="background-image: url(../assets/images/dummy/dummy24.png)"></span>
                                </div>
                                <span class="mdif_num">
                                    외 <b><span>2,752</span>명</b> 팔로잉
                                </span>
                            </div>
                        </div>
                        
                        <p class="mdi_info">
                            60만 수강생 스타강사
                            <br>
                            100만부 판매 베스트셀러 저자1
                        </p>
                        <p class="mdi_service">
                            VOD<span>(20)</span>·1:1화상상담<span>(1,380)</span>·채팅상담<span>(138)</span> <span>진행중</span>
                        </p>

                        <div class="mdi_btn_box">
                            <button type="button" class="pop_open mdi_btn" data-popup="applyStepPop">즉시 상담가능</button>
                            <button type="button" class="pop_open mdi_btn" data-popup="applyStep10Pop">LIVE CLASS 예약</button>
                        </div>

                        <div class="mc_content_box">
                            <div class="mc_content_item">
                                <h4 class="mcc_title_box">
                                    <span class="mcc_title">VOD</span>
                                    <span class="mcc_price">
                                        10강<span> 30,000</span>원
                                    </span>
                                </h4>
                                <div class="mcc_btn_box">
                                    <span class="mcc_time">OT</span>
                                    <button type="button" class="pop_open mcc_btn" data-popup="applyStep6Pop">수강하기</button>
                                </div>
                            </div>
                            <div class="mc_content_item">
                                <h4 class="mcc_title_box">
                                    <span class="mcc_title">1:1이메일 상담</span>
                                    <span class="mcc_price">
                                        3회<span> 50,000</span>원
                                    </span>
                                </h4>
                                <div class="mcc_btn_box">
                                    <span class="mcc_time">15회</span>
                                    <button type="button" class="pop_open mcc_btn" data-popup="applyStep7Pop">신청하기</button>
                                </div>
                            </div>
                            <div class="mc_content_item">
                                <h4 class="mcc_title_box">
                                    <span class="mcc_title">1:1화상상담</span>
                                    <span class="mcc_price">
                                        <span>30</span>분
                                        <br>
                                        <span>300,000</span>원
                                    </span>
                                </h4>
                                <div class="mcc_btn_box">
                                    <span class="mcc_time">15:40</span>
                                    <button type="button" class="pop_open mcc_btn" data-popup="applyStep2Pop">예약하기</button>
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
                                    <button type="button" class="pop_open mcc_btn" data-popup="applyStep1Pop">예약하기</button>
                                </div>
                            </div>
                            <div class="mc_content_item">
                                <h4 class="mcc_title_box">
                                    <span class="mcc_title">Live Class</span>
                                    <span class="mcc_price">
                                        <span>1</span>시간
                                        <br>
                                        <span>100,000</span>원
                                    </span>
                                </h4>
                                <div class="mcc_btn_box">
                                    <span class="mcc_time">15:30</span>
                                    <button type="button" class="pop_open mcc_btn" data-popup="applyStep10Pop">예약하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br><br><br><br><br><br><br>








                    <div class="master_detail_content" style="float: inherit;">
                        <div class="mypeople_tab_box">
                            <ul class="mypeople_tab">
                                <li><a href="#mdcInfoSection" class="mypeople_item active">주요정보</a></li>
                                <li><a href="#mdcHighlightSection" class="mypeople_item">하이라이트</a></li>
                                <li><a href="#mdcCurrSsection" class="mypeople_item">커리큘럼</a></li>
                                <li><a  class="mypeople_item">AI추천</a></li>
                                <li><a href="#mdcReviewSection" class="mypeople_item">후기<span class="mypeople_item_small"><span>1,216</span>개</span></a></li>
                                <li><a href="#mdcFaqSection" class="mypeople_item">FAQ</a></li>
                            </ul>
                        </div>

                        <div id="mdcInfoSection" class="mdc_section">
                            <div class="mdc_info_title">
                                <span class="mdc_info">
                                    너의 목표 점수가 몇 점이든, 유수연의 시험 직전 5일 완성 토익
                                </span>
                                <span class="mdc_info_sub">
                                    여러분들의 든든한 가이드가 되어 드리겠습니다.
                                </span>
                            </div>

                            <div class="mdc_text">
                                <p>
                                    국내 토익 수험서 61권, 해외 토익 수험서 18권 출간
                                    <br>
                                    다시보고 싶은 강사 1위(2012)
                                    <br>
                                    베스트셀러 작가 선정  2011 ~
                                    <br>
                                    에세이 ‘독설‘ ‘나만의 무대를 세워라‘ 등 총 70만부 이상 판매  (Yes24 올해의 책 선정)
                                    <br>
                                    tvN 스타특강쇼(시청률 1위), 시험은 기술이다(EBS) 외 방송 다수 출연
                                </p>
                                <p>
                                    2009 청춘, 그 냉정과 열정 사이 공동 강연
                                    <br>
                                    2009 시간관리 페스티벌 공동 강연
                                    <br>
                                    2015 유수연의 [독설] 콘서트
                                </p>
                                <p>
                                    베트남 대우 글로벌 청년사업가 양성과정 명사초청 특별강연 (2020)
                                    <br>
                                    월급쟁이 부자들 커뮤니티 초청강연 (2019)
                                    <br>
                                    외 매년 다수 강연 진행
                                </p>
                                <p>
                                    現  유스타온 대표
                                    <br>
                                    現  유수연 영어연구소 대표
                                    <br>
                                    現  ST UNITAS 영단기어학원 대표강사
                                    <br>
                                    前  사이버한국외국어대학교 교수
                                    <br>
                                    前  울산대 영문학 겸임교수
                                    <br>
                                    前  YBM e4u어학원(종로본원) 대표강사
                                    <br>
                                    영국 Aston University 석사
                                </p>
                            </div>

                            <!-- 비디오가 들어갑니다 -->
                            <div class="mdc_info_video">
                                <img src="../assets/images/dummy/dummy32.png" alt="">
                            </div>
                        </div> <!-- //#mdcInfoSection -->
                        
                        <div class="mdc_section">
                            <div class="mdc_info_title">
                                <span class="mdc_info">
                                    유수연 선생님이 보내는 편지
                                </span>
                            </div>

                            <div class="mdc_text">
                                <p>
                                    안녕하세요 유수연입니다.
                                    <br>
                                    지난 20년간 수많은 수식어가 제게 주어졌습니다.
                                    <br>
                                    그 중 단연 이슈가 되었던 것은 연봉 10억 강사, 100만부 판매 베스트셀러 작가 두가지가 아닐
                                    까 싶습니다.
                                </p>
                                <p>
                                    이 수식어들은 아침 8시 30분부터 첫 강의를 시작해 밤 10시 마지막 강의 마치고 밤 11시부터
                                    새벽 5시까지 토익책 작업을 하였던....... 토익을 온몸으로 흡수하고 강의를 하고 책을 썼던
                                    제 모든 것을 쥐어짜서 토익을 했기 때문에 나온 결과물입니다. 이런 시간들을 보낼 수 있었던
                                    가장 큰 버팀목은 내 학생들 하나하나는 이러한 노력을 하느라 시간을 낭비하지 않을 것이라는
                                    확신이었습니다.  저에게 온 여러분들은 “저 유수연”을 통해 최대한 빠르고 효과적으로 토익을
                                    흡수할 수 있을 것입니다.
                                </p>
                                <p>
                                    이 사회를 바꾸지 못해서 미안하고 이 시대의 젊은이들에게 더 많은 무대를 제공해주지 못하는
                                    기성세대의 한 명으로서 책임이 있습니다.
                                    저는 지금 토익강사라는 나의 직업과 나의 위치에서 내가 할 수 있는 최대한을 하려 노력하고 
                                    있으며 그 20년의 일관된 노력의 완성으로 남기는 것이 이 강의입니다.
                                </p>
                                <p>
                                    이 책을 공부하는 이 시대의 젊은 친구들이 토익이라는 관문을 넘어 세상으로 나아가 자신의 
                                    무대를 밟고 계속 성장할 것이라 믿으며 나 또한 지금의 모습에서 더 나은 역할을 하는 존재로 
                                    나아가려는 노력을 멈추지 않을 것입니다.
                                </p>
                                <p>
                                    취업이라는 어려운 시기에 이 책을 통해서 만나게 되는 많은 친구들과 나의 인연이 “토익”이라
                                    는 시험을 넘어 계속 앞으로 나아가는 모습들로 이어질 것이라 믿습니다.
                                </p>
                            </div>
                        </div>
                        
                        <div class="mdc_section">
                            <div class="mdc_info_title">
                                <span class="mdc_info">
                                    <b>여러분의 단기간 토익 완성에 든든한 조력자로 함께 하겠습니다.</b>
                                </span>
                            </div>
                            
                            <ul class="mdc_info_list">
                                <li class="mdc_info_item">
                                    <span class="mdc_thumb" style="background-image: url(../assets/images/dummy/dummy33.jpg);">추천대상</span>
                                    <div class="mdc_il_box">
                                        <span class="mdc_il_q">Q. 이 클래스를 특별히 추천하고 싶은 분들이 있나요?</span>
                                        <p class="mdc_il_a">
                                            토익 공부를 단 한번이라도 해보셨던 모든 분들에게 도움이 됩니다.
                                            토익 수업을 들어본 적이 없는 분, 점수가 정체되어 있는 분, 토익책만
                                            사신 분, 토익 마지막 완벽 준비가 필요한 분 모두 해당합니다.
                                        </p>
                                    </div>
                                </li>
                                <li class="mdc_info_item">
                                    <span class="mdc_thumb" style="background-image: url(../assets/images/dummy/dummy34.jpg);">상담진행</span>
                                    <div class="mdc_il_box">
                                        <span class="mdc_il_q">Q.  1:1 라이브 상담은 어떻게 진행되나요?</span>
                                        <p class="mdc_il_a">
                                            시간 예약을 하면, 해당 시간에 설정 시간 동안 상담이 진행됩니다. 상
                                            담은 주로 토익 공부 방법, 토익 모른 문제 풀이, 본인의 실력 진단 등 
                                            토익과 관련된 무엇이든 Q&A로 실시간 상담이 이루어집니다.
                                        </p>
                                    </div>
                                </li>
                                <li class="mdc_info_item">
                                    <span class="mdc_thumb" style="background-image: url(../assets/images/dummy/dummy35.jpg);">활용법</span>
                                    <div class="mdc_il_box">
                                        <span class="mdc_il_q">Q. 토익 문제가 안 풀려요. 라이브 상담 외에 방법이 있나요?</span>
                                        <p class="mdc_il_a">
                                            화상상담 외에 1:1 채팅을 할 수 있어요. 안 풀리는 토익문제를 사진 
                                            찍어 채팅방에 올려주세요. 문제풀이 방법을 채팅방에 남겨줄게요. 
                                            채팅 1:1 상담은 코칭권을 구매하신 후, 신청하실 수 있어요.
                                        </p>
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <div id="mdcHighlightSection" class="mdc_section">
                            <div class="mdc_info_title">
                                <span class="mdc_info">
                                    영상으로 보는 하이라이트
                                </span>
                            </div>





                            <div class="mdc_high_box">
                                <div class="mdc_high_video" style="background-image: url(../assets/images/dummy/dummy36.jpg);"></div>
                                <ul class="mdc_high_list">
                                    <li class="mdc_high_item" style="background-image: url(../assets/images/dummy/dummy37.jpg);"></li>
                                    <li class="mdc_high_item" style="background-image: url(../assets/images/dummy/dummy38.jpg);"></li>
                                    <li class="mdc_high_item" style="background-image: url(../assets/images/dummy/dummy39.jpg);"></li>
                                    <li class="mdc_high_item" style="background-image: url(../assets/images/dummy/dummy40.jpg);"></li>
                                    <li class="mdc_high_item" style="background-image: url(../assets/images/dummy/dummy41.jpg);"></li>
                                </ul>
                            </div>
                        </div><!-- //#mdcHighlightSection  -->

                        <div id="mdcCurrSsection" class="mdc_section">
                            <div class="acco_box">
                                <div class="acco_title">
                                    <div class="mdc_btn_box">
                                        <button type="button" class="mdc_btn acco_toggle">VOD</button>
                                        <button type="button" class="heart_toggle"></button>
                                        <button type="button" class="cart_toggle"></button>
                                    </div>

                                    <div class="mdc_info_title">
                                        <span class="mdc_info">
                                            여러분이 궁금해하는 내용의 사전 지식을 나눕니다.
                                        </span>

                                        <div class="mdc_curr_info">
                                            <span class="mdc_curr_num">
                                                <b>20</b>개 영상 ·<b>300</b>분 재생
                                            </span>
                                            <p class="mdc_curr_text">
                                                ※ 1:1 맞춤상담에 앞서 VOD을 수강하시면 더욱 깊이 있는 상담을 할 수 있습니다.
                                            </p>
                                        </div>
                                    </div>
                                </div>

<!--                                 <div class="acco_content" style="display:block;"> -->
                                <div class="acco_content">
                                    <ul class="mdc_curr_list">
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>1단계</b> ‘토익 LC 적중 공식
                                            </span>

                                            <div class="mdcc_table">
                                                <!-- 무료공개 버튼이 있으면 .hasbtn 붙여 주세요  -->
                                                <div class="table_row hasbtn">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 1 = 사진도 정답이 출제되는 패턴이 숨겨져 있다!</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td">
                                                        <button type="button" class="mdcc_btn">무료공개</button>
                                                    </span>
                                                </div>
                                                <div class="table_row hasbtn">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 2 = 기본 출제 유형 15가지 + 오답 유형 5가지</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td">
                                                        <button type="button" class="mdcc_btn">무료공개</button>
                                                    </span>
                                                </div>
                                                <div class="table_row hasbtn">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 3 = 지문의 위치별 / 정답 불변 원칙</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td">
                                                        <button type="button" class="mdcc_btn">무료공개</button>
                                                    </span>
                                                </div>
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 4 = 지문 유형 8가지</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td">
                                                        <button type="button" class="mdcc_btn">무료공개</button>
                                                    </span>
                                            </div>
                                        </li>
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>2단계</b> ‘토익 LC 적중 공식
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 5 = 한국어 해석은 그만! 5초 구조분석, 품사로 답 결정!</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 6 = 빈출 정답공식으로 정리!</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 7 = 지문 & 문제 유형 정복</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>3단계</b> 기출정복! 유형별 접근법으로 이론과 문풀 완성
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">토익시험에 나오는 것만 외우자! 토익에 출제되는 유형 총정리</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>4단계</b> 내가 틀린 문제는 몇 점대? 점수대별 실전 문제풀이
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">파트별 스킬 중식으로 빠르고 확실하게 문제풀이 완성</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>5단계</b> 시험 직전 모의고사
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">시험 직전 단 2시간 투자로 접수 급상승하는 노하우 시간</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                
                                
<!--                                         <li class="mdc_curr_item"> -->
                                            <span class="mdcc_title">
                                                <b>준비물<span>준비물 가격은 별도 입니다.</span></b> 
                                            </span>
                                            <div class="mdcc_table">
                                                <div class="table_row">

<div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide">
	   		<div class="imgDiv"><img class="itemImg" src="/assets/images/sub/book1.png"/></div>
	        <a href="/front/master/detail">
	            <div class="mv_slider_text">
	                <h3 class="mvi_title">
	                    베스트셀러 1위
	                    <br>
	                    저자직강 교재,
	                    <br>
	                    토익 LC 기본서
	                </h3>
	                <span class="mvi_text">
	                    <b>영어 스타강사 유수연</b>
	                </span>
	                <h3 class="mvi_title">
	                    16,920원
	                </h3>
	                <button type="button" class="mdcc_btn gray">장바구니</button>
	                <button type="button" class="mdcc_btn orange">구매하기</button>
	            </div>
	        </a>
		</div>
		<div class="swiper-slide">
	   		<div class="imgDiv"><img class="itemImg" src="/assets/images/sub/book2.png"/></div>
	        <a href="/front/master/detail">
	             <div class="mv_slider_text">
	                 <h3 class="mvi_title">
	                     탑이 되는 어휘만
	                     <br>
	                     알려주는 어휘책
	                     <br>
	                     토익 어휘 12000
	                 </h3>
	                 <span class="mvi_text">
	                     <b>영어 스타강사 유수연</b>
	                 </span>
	                 <h3 class="mvi_title">
	                     12,420원
	                 </h3>
	                 <button type="button" class="mdcc_btn gray">장바구니</button>
	                 <button type="button" class="mdcc_btn orange">구매하기</button>
	             </div>
	         </a>
		</div>
		<div class="swiper-slide">
	   		<div class="imgDiv"><img class="itemImg" src="/assets/images/sub/book3.png"/></div>
            <a href="/front/master/detail">
                    <div class="mv_slider_text">
                        <h3 class="mvi_title">
                            2030 베스트셀러
                            <br>
                            까칠한 최고 멘토
                            <br>
                            '유수연의 독설'
                        </h3>
                        <span class="mvi_text">
                            <b>영어 스타강사 유수연</b>
                        </span>
                        <h3 class="mvi_title">
                            11,420원
                        </h3>
                        <button type="button" class="mdcc_btn gray">장바구니</button>
                        <button type="button" class="mdcc_btn orange">구매하기</button>
                    </div>
                </a>
		</div>
		<div class="swiper-slide">
	   		<div class="imgDiv"><img class="itemImg" src="/assets/images/sub/book2.png"/></div>
	        <a href="/front/master/detail">
	             <div class="mv_slider_text">
	                 <h3 class="mvi_title">
	                     탑이 되는 어휘만
	                     <br>
	                     알려주는 어휘책
	                     <br>
	                     토익 어휘 12000
	                 </h3>
	                 <span class="mvi_text">
	                     <b>영어 스타강사 유수연</b>
	                 </span>
	                 <h3 class="mvi_title">
	                     12,420원
	                 </h3>
	                 <button type="button" class="mdcc_btn gray">장바구니</button>
	                 <button type="button" class="mdcc_btn orange">구매하기</button>
	             </div>
	         </a>
		</div>
	</div>
		
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

</div>



                                                </div>
                                            </div>
<!--                                         </li> -->
                                        
                                        
                                        
                            </div>
                        </div><!-- //#mdcCurrSsection -->

                        <div class="mdc_section">
                            <div class="acco_box">
                                <div class="acco_title">
                                    <div class="mdc_btn_box">
                                        <button type="button" class="mdc_btn acco_toggle">1:1화상상담</button>
                                        <button type="button" class="heart_toggle"></button>
                                        <button type="button" class="clock_toggle"></button>
                                    </div>

                                    <div class="mdc_info_title">
                                        <span class="mdc_info">
                                            여러분이 궁금해하는 내용의 사전 지식을 나눕니다.
                                        </span>

                                        <div class="mdc_curr_info">
                                            <span class="mdc_curr_num">
                                                <b>20</b>개 영상 ·<b>300</b>분 재생
                                            </span>
                                            <p class="mdc_curr_text">
                                                ※ 1:1 맞춤상담에 앞서 VOD을 수강하시면 더욱 깊이 있는 상담을 할 수 있습니다.
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <div class="acco_content">
                                    <ul class="mdc_curr_list">
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>1단계</b> ‘토익 LC 적중 공식
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row hasbtn">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 1 = 사진도 정답이 출제되는 패턴이 숨겨져 있다!</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td">
                                                        <button type="button" class="mdcc_btn">무료공개</button>
                                                    </span>
                                                </div>
                                                <div class="table_row hasbtn">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 2 = 기본 출제 유형 15가지 + 오답 유형 5가지</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td">
                                                        <button type="button" class="mdcc_btn">무료공개</button>
                                                    </span>
                                                </div>
                                                <div class="table_row hasbtn">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 3 = 지문의 위치별 / 정답 불변 원칙</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td">
                                                        <button type="button" class="mdcc_btn">무료공개</button>
                                                    </span>
                                                </div>
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 4 = 지문 유형 8가지</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>2단계</b> ‘토익 LC 적중 공식
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 5 = 한국어 해석은 그만! 5초 구조분석, 품사로 답 결정!</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 6 = 빈출 정답공식으로 정리!</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 7 = 지문 & 문제 유형 정복</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>3단계</b> 기출정복! 유형별 접근법으로 이론과 문풀 완성
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">토익시험에 나오는 것만 외우자! 토익에 출제되는 유형 총정리</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>4단계</b> 내가 틀린 문제는 몇 점대? 점수대별 실전 문제풀이
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">파트별 스킬 중식으로 빠르고 확실하게 문제풀이 완성</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>5단계</b> 시험 직전 모의고사
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">시험 직전 단 2시간 투자로 접수 급상승하는 노하우 시간</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="mdc_section">
                            <div class="acco_box">
                                <div class="acco_title">
                                    <div class="mdc_btn_box">
                                        <button type="button" class="mdc_btn acco_toggle">1:1채팅상담</button>
                                        <button type="button" class="heart_toggle"></button>
                                        <button type="button" class="cart_toggle"></button>
                                    </div>

                                    <div class="mdc_info_title">
                                        <span class="mdc_info">
                                            여러분이 궁금해하는 내용의 사전 지식을 나눕니다.
                                        </span>

                                        <div class="mdc_curr_info">
                                            <span class="mdc_curr_num">
                                                <b>20</b>개 영상 ·<b>300</b>분 재생
                                            </span>
                                            <p class="mdc_curr_text">
                                                ※ 1:1 맞춤상담에 앞서 VOD을 수강하시면 더욱 깊이 있는 상담을 할 수 있습니다.
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <div class="acco_content">
                                    <ul class="mdc_curr_list">
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>1단계</b> ‘토익 LC 적중 공식
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row hasbtn">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 1 = 사진도 정답이 출제되는 패턴이 숨겨져 있다!</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td">
                                                        <button type="button" class="mdcc_btn">무료공개</button>
                                                    </span>
                                                </div>
                                                <div class="table_row hasbtn">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 2 = 기본 출제 유형 15가지 + 오답 유형 5가지</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td">
                                                        <button type="button" class="mdcc_btn">무료공개</button>
                                                    </span>
                                                </div>
                                                <div class="table_row hasbtn">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 3 = 지문의 위치별 / 정답 불변 원칙</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td">
                                                        <button type="button" class="mdcc_btn">무료공개</button>
                                                    </span>
                                                </div>
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 4 = 지문 유형 8가지</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>2단계</b> ‘토익 LC 적중 공식
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 5 = 한국어 해석은 그만! 5초 구조분석, 품사로 답 결정!</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 6 = 빈출 정답공식으로 정리!</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 7 = 지문 & 문제 유형 정복</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>3단계</b> 기출정복! 유형별 접근법으로 이론과 문풀 완성
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">토익시험에 나오는 것만 외우자! 토익에 출제되는 유형 총정리</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>4단계</b> 내가 틀린 문제는 몇 점대? 점수대별 실전 문제풀이
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">파트별 스킬 중식으로 빠르고 확실하게 문제풀이 완성</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>5단계</b> 시험 직전 모의고사
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">시험 직전 단 2시간 투자로 접수 급상승하는 노하우 시간</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="mdc_section">
                            <div class="acco_box">
                                <div class="acco_title">
                                    <div class="mdc_btn_box">
                                        <button type="button" class="mdc_btn acco_toggle">1:1이메일상담</button>
                                        <button type="button" class="heart_toggle"></button>
                                        <button type="button" class="cart_toggle"></button>
                                    </div>

                                    <div class="mdc_info_title">
                                        <span class="mdc_info">
                                            여러분이 궁금해하는 내용의 사전 지식을 나눕니다.
                                        </span>

                                        <div class="mdc_curr_info">
                                            <span class="mdc_curr_num">
                                                <b>20</b>개 영상 ·<b>300</b>분 재생
                                            </span>
                                            <p class="mdc_curr_text">
                                                ※ 1:1 맞춤상담에 앞서 VOD을 수강하시면 더욱 깊이 있는 상담을 할 수 있습니다.
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <div class="acco_content">
                                    <ul class="mdc_curr_list">
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>1단계</b> ‘토익 LC 적중 공식
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row hasbtn">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 1 = 사진도 정답이 출제되는 패턴이 숨겨져 있다!</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td">
                                                        <button type="button" class="mdcc_btn">무료공개</button>
                                                    </span>
                                                </div>
                                                <div class="table_row hasbtn">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 2 = 기본 출제 유형 15가지 + 오답 유형 5가지</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td">
                                                        <button type="button" class="mdcc_btn">무료공개</button>
                                                    </span>
                                                </div>
                                                <div class="table_row hasbtn">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 3 = 지문의 위치별 / 정답 불변 원칙</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td">
                                                        <button type="button" class="mdcc_btn">무료공개</button>
                                                    </span>
                                                </div>
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 4 = 지문 유형 8가지</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>2단계</b> ‘토익 LC 적중 공식
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 5 = 한국어 해석은 그만! 5초 구조분석, 품사로 답 결정!</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 6 = 빈출 정답공식으로 정리!</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 7 = 지문 & 문제 유형 정복</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>3단계</b> 기출정복! 유형별 접근법으로 이론과 문풀 완성
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">토익시험에 나오는 것만 외우자! 토익에 출제되는 유형 총정리</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>4단계</b> 내가 틀린 문제는 몇 점대? 점수대별 실전 문제풀이
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">파트별 스킬 중식으로 빠르고 확실하게 문제풀이 완성</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>5단계</b> 시험 직전 모의고사
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">시험 직전 단 2시간 투자로 접수 급상승하는 노하우 시간</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="mdc_section">
                            <div class="acco_box">
                                <div class="acco_title">
                                    <div class="mdc_btn_box">
                                        <button type="button" class="mdc_btn acco_toggle">LIVE CLASS</button>
                                        <button type="button" class="heart_toggle"></button>
                                        <button type="button" class="cart_toggle"></button>
                                    </div>

                                    <div class="mdc_info_title">
                                        <span class="mdc_info">
                                            여러분이 궁금해하는 내용의 사전 지식을 나눕니다.
                                        </span>

                                        <div class="mdc_curr_info">
                                            <span class="mdc_curr_num">
                                                <b>20</b>개 영상 ·<b>300</b>분 재생
                                            </span>
                                            <p class="mdc_curr_text">
                                                ※ 1:1 맞춤상담에 앞서 VOD을 수강하시면 더욱 깊이 있는 상담을 할 수 있습니다.
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <div class="acco_content">
                                    <ul class="mdc_curr_list">
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>1단계</b> ‘토익 LC 적중 공식
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row hasbtn">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 1 = 사진도 정답이 출제되는 패턴이 숨겨져 있다!</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td">
                                                        <button type="button" class="mdcc_btn">무료공개</button>
                                                    </span>
                                                </div>
                                                <div class="table_row hasbtn">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 2 = 기본 출제 유형 15가지 + 오답 유형 5가지</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td">
                                                        <button type="button" class="mdcc_btn">무료공개</button>
                                                    </span>
                                                </div>
                                                <div class="table_row hasbtn">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 3 = 지문의 위치별 / 정답 불변 원칙</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td">
                                                        <button type="button" class="mdcc_btn">무료공개</button>
                                                    </span>
                                                </div>
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 4 = 지문 유형 8가지</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>2단계</b> ‘토익 LC 적중 공식
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 5 = 한국어 해석은 그만! 5초 구조분석, 품사로 답 결정!</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 6 = 빈출 정답공식으로 정리!</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">Part 7 = 지문 ! 문제 유형 정복</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>3단계</b> 기출정복! 유형별 접근법으로 이론과 문풀 완성
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">토익시험에 나오는 것만 외우자! 토익에 출제되는 유형 총정리</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>4단계</b> 내가 틀린 문제는 몇 점대? 점수대별 실전 문제풀이
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">파트별 스킬 중식으로 빠르고 확실하게 문제풀이 완성</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="mdc_curr_item">
                                            <span class="mdcc_title">
                                                <b>5단계</b> 시험 직전 모의고사
                                            </span>

                                            <div class="mdcc_table">
                                                <div class="table_row">
                                                    <span class="table_td"><span class="mdcc_video_icon"></span></span>
                                                    <span class="table_td">시험 직전 단 2시간 투자로 접수 급상승하는 노하우 시간</span>
                                                    <span class="table_td">18:00</span>
                                                    <span class="table_td"></span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div id="mdcReviewSection" class="mdc_section">
                            <div class="mdc_info_title">
                                <span class="mdc_info">
                                    수강후기

                                    <span class="mdc_info_small">(<span>1,215</span>)개</span>
                                </span>
                            </div>

                            <div class="mdc_review_box">
                                <div class="mdc_review_item">
                                    <div class="mdc_review_top">
                                        <span class="mdc_review_id">seo***</span>
                                        <span class="mdc_review_date">2020.07.20</span>
                                        <span class="mdc_review_tag">#외국어#토익#VOD</span>
                                    </div>

                                    <span class="mdc_review_star">★★★★★</span>
                                    <p class="mdc_review_text">
                                        꿀팁들을 알 수 있는!
                                        <br>
                                        영단기 출석인증 Day4 오늘 동사 강의 개꿀팁들 많았다. 무식하게 해석부터 했는데 26살인데 수능영어 
                                        버릇 언제 버리려나. 계속 연습하자.
                                    </p>
                                </div>
                                <div class="mdc_review_item">
                                    <div class="mdc_review_top">
                                        <span class="mdc_review_id">kim***</span>
                                        <span class="mdc_review_date">2020.07.20</span>
                                        <span class="mdc_review_tag">#외국어 #토익 #1:1채팅상담</span>
                                    </div>

                                    <span class="mdc_review_star">★★★★☆</span>
                                    <p class="mdc_review_text">
                                        노베이스도 가능한!
                                        <br>
                                        베이스가 없는 학생들이 듣기 좋은 강의입니다.
                                        <br>
                                        저 또한, 신토익 이전에 공부해서 사실상 노베이스인 상태였지만, 강의를 통해 토익에 대한 유형파악 및
                                        기본적인 베이스를 갖출 수가 있었습니다.
                                    </p>
                                </div>
                                <div class="mdc_review_item">
                                    <div class="mdc_review_top">
                                        <span class="mdc_review_id">ehk***</span>
                                        <span class="mdc_review_date">2020.07.20</span>
                                        <span class="mdc_review_tag">#외국어#토익#1:1화상상담</span>
                                    </div>

                                    <span class="mdc_review_star">★★★★★</span>
                                    <p class="mdc_review_text">
                                        나태해질수가 없는!
                                        <br>
                                        매일 단어시험을 치고, 정해진 스케줄대로 따라하기만 하면 돼서 미루기를 잘하는 저에게는 정말 좋은 프
                                        로그램이었습니다. 또한 선생님이 매일 출석체크를 하기 때문에 더더욱 나타해지거나 미루는 행동을 할
                                        수가 없었네요.
                                    </p>
                                </div>

                                <button type="button" class="mdc_review_more">더보기</button>
                            </div>
                        </div><!-- //#mdcReviewSection -->

                        <div id="mdcFaqSection" class="mdc_section last">
                            <div class="mdc_info_title">
                                <span class="mdc_info">
                                    질문과 답변
                                </span>
                            </div>

                            <div class="faq_acco">
                                <div class="acco_box faq_acco_item">
                                    <div class="acco_title acco_toggle">
                                        <span class="faq_icon"></span>
                                        <span class="faq_title">
                                            상담 시간을 변경할 수 있나요?
                                        </span>
                                    </div>
    
                                    <div class="acco_content">
                                        <p class="faq_text">
                                            네 변경은 가능합니다. 다만, 시간이 비어있을 경우 해당이 되며, 변경은 7일 이전까지 변경하실 수 있습니다.
                                        </p>
                                    </div>
                                </div>
                                <div class="acco_box faq_acco_item">
                                    <div class="acco_title acco_toggle">
                                        <span class="faq_icon"></span>
                                        <span class="faq_title">
                                            가족이 같이 상담 받아도 되나요?
                                        </span>
                                    </div>
    
                                    <div class="acco_content">
                                        <p class="faq_text">
                                            네 변경은 가능합니다. 다만, 시간이 비어있을 경우 해당이 되며, 변경은 7일 이전까지 변경하실 수 있습니다.
                                        </p>
                                    </div>
                                </div>
                                <div class="acco_box faq_acco_item">
                                    <div class="acco_title acco_toggle">
                                        <span class="faq_icon"></span>
                                        <span class="faq_title">
                                            시간을 놓쳐서 상담을 못했어요, 환불 가능한가요?
                                        </span>
                                    </div>
    
                                    <div class="acco_content">
                                        <p class="faq_text">
                                            네 변경은 가능합니다. 다만, 시간이 비어있을 경우 해당이 되며, 변경은 7일 이전까지 변경하실 수 있습니다.
                                        </p>
                                    </div>
                                </div>
                                <div class="acco_box faq_acco_item">
                                    <div class="acco_title acco_toggle">
                                        <span class="faq_icon"></span>
                                        <span class="faq_title">
                                            상담 받은 내용을 다시 보고 싶어요. 어디서 확인하면 될까요?
                                        </span>
                                    </div>
    
                                    <div class="acco_content">
                                        <p class="faq_text">
                                            네 변경은 가능합니다. 다만, 시간이 비어있을 경우 해당이 되며, 변경은 7일 이전까지 변경하실 수 있습니다.
                                        </p>
                                    </div>
                                </div>
                                <div class="acco_box faq_acco_item">
                                    <div class="acco_title acco_toggle">
                                        <span class="faq_icon"></span>
                                        <span class="faq_title">
                                            화상 상담이 처음이라서,,, 어떤 절차로 진행되나요?
                                        </span>
                                    </div>
    
                                    <div class="acco_content">
                                        <p class="faq_text">
                                            네 변경은 가능합니다. 다만, 시간이 비어있을 경우 해당이 되며, 변경은 7일 이전까지 변경하실 수 있습니다.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div><!-- //#mdcFaqSection -->
                    </div>
                </div>
    
                <div class="master_detail_sidebar">
                    <ul class="mds_list">
                        <li class="mds_item">
                            <span class="mds_cate">VOD 상담</span>
                            <span class="mds_title">
                                <span class="mds_num">
                                    <span>10</span>강
                                </span>
                                <span class="mds_pay">
                                    <span>30,000</span>원
                                </span>
                            </span>
                            
                            <!--  -->
                            <button type="button" class="pop_open mds_btn" data-popup="applyStep6Pop">수강하기</button>
                        </li>
                        <li class="mds_item">
                            <span class="mds_cate">1:1이메일 상담</span>
                            <span class="mds_title">
                                <span class="mds_num">
                                    <span>3</span>회
                                </span>
                                <span class="mds_pay">
                                    <span>50,000</span>원
                                </span>
                            </span>
                            
                            <!--  -->
                            <button type="button" class="pop_open mds_btn" data-popup="applyStep7Pop">신청하기</button>
                        </li>
                        <li class="mds_item">
                            <div class="mds_top">
                                <span>가장 빠른 예약시간</span>
                                <span class="mds_time">15:30</span>
                            </div>
                            <span class="mds_cate">1:1화상상담</span>
                            <span class="mds_title">
                                <span class="mds_num">
                                    <span>30</span>분
                                </span>
                                <span class="mds_pay">
                                    <span>300,000</span>원
                                </span>
                            </span>
                            
                            <!--  -->
                            <button type="button" class="pop_open mds_btn" data-popup="applyStep2Pop">예약하기</button>
                        </li>
                        <li class="mds_item">
                            <div class="mds_top">
                                <span>가장 빠른 예약시간</span>
                                <span class="mds_time">15:30</span>
                            </div>
                            <span class="mds_cate">1:1채팅상담</span>
                            <span class="mds_title">
                                <span class="mds_num">
                                    <span>30</span>분
                                </span>
                                <span class="mds_pay">
                                    <span>50,000</span>원
                                </span>
                            </span>
                            
                            <!--  -->
                            <button type="button" class="pop_open mds_btn" data-popup="applyStep1Pop">예약하기</button>
                        </li>
                        <li class="mds_item">
                            <div class="mds_top">
                                <span>가장 빠른 예약시간</span>
                                <span class="mds_time">15:30</span>
                            </div>
                            <span class="mds_cate">Live Class</span>
                            <span class="mds_title">
                                <span class="mds_num">
                                    <span>1</span>시간
                                </span>
                                <span class="mds_pay">
                                    <span>100,000</span>원
                                </span>
                            </span>
                            
                            <!--  -->
                            <button type="button" class="pop_open mds_btn" data-popup="applyStep10Pop">예약하기</button>
                        </li>
                    </ul>
                </div><!-- //.master_detail_sidebar -->
            </div>
        
        
        
        <!-- 1:1화상상담 팝업시작 -->

        <!-- 팝업 -->
        <div id="applyStep1Pop" class="popup_wrap">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item current">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 화상상담</h3>
                            <select name="" id="" class="apply_select hsc_select">
                                <option value="카테고리">카테고리</option>
                                <option value="1:1채팅상담">1:1채팅상담</option>
                                <option value="1:1화상상담">1:1화상상담</option>
                            </select>
                            <span class="apply_info">
                                <span>30</span>분 / <span>100,000</span>원
                            </span>
                            <p class="apply_text">
                                지정된 시간 동안 마스터와 1:1 화상 채팅을 통해 깊이 있는 질문을 주고받을 수 있습니다.
                                <br>
                                해외 이용자는 전문 통역이 함께 참여합니다.
                            </p>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                희망하는 상담 시간을 선택하세요. 
                                <br class="m_show">
                                <b>(가장 빠른 예약 시간은 16:00)</b>
                            </h4>

                            <div class="apply_select_date">
                                <div class="asd_box">
                                    <button type="button" class="asd_btn asd_btn_prev"></button>
                                    <div class="asd_date_box">
                                        <button type="button" class="asd_date_item">
                                            <span class="day">19</span>
                                            <span>월</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">20</span>
                                            <span>화</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">21</span>
                                            <span>수</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">22</span>
                                            <span>목</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">23</span>
                                            <span>금</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">24</span>
                                            <span>토</span>
                                        </button>
                                        <button type="button" class="asd_date_item">
                                            <span class="day">25</span>
                                            <span>일</span>
                                        </button>
                                    </div>
                                    <button type="button" class="asd_btn asd_btn_next"></button>
                                </div>

                                <div class="asd_time_box">
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">13:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">14:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">15:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">16:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">17:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">18:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">19:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">20:00</button>
                                    </span>
                                    <span class="asd_time">
                                        <button type="button" class="asd_time_item">21:00</button>
                                    </span>
                                </div>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep2InputPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep1Pop -->

        <!-- 팝업 -->
        <div id="applyStep2InputPop" class="popup_wrap">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 화상상담</h3>
                            <span class="apply_select_category">선택한 카테고리명</span>
                            
                            <div class="apply_info_box">
                                <span class="apply_info_item">
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                상담에 필요한 질문에 답해주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <label for="afi01">가장 최근에 응시한 토익 시험은 언제인가요? 점수는 몇 점이었나요?</label>
                                    <input type="text" id="afi01" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi02">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi02" class="afi_input">
                                </p>
                                <p class="apply_form_item">
                                    <label for="afi03">다음 시험까지 달성하고 싶은 목표 점수는 얼마인가요?</label>
                                    <input type="text" id="afi03" class="afi_input">
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray" data-popup="applyStep2TextPop">건너뛰기</button>

                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep1Pop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep2TextPop">다음</button>
                    </div>
                    
                    
                </div>
            </div>
        </div><!-- //#applyStep2InputPop -->

        <!-- 팝업 -->
        <div id="applyStep2TextPop" class="popup_wrap">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item current">2</span>
                        <span class="ap_item">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 화상상담</h3>
                            
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item">
                                    선택한 시간 <b>16:00~15:00</b>
                                </span>
                                <span class="apply_info_item">
                                    <span>2</span>시간 / <span>200,000</span>원
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                궁금한 내용을 알려주세요.
                            </h4>

                            <div class="apply_form_box">
                                <p class="apply_form_item">
                                    <textarea name="" id="" class="afi_textarea" placeholder="상담 받고 싶은 질문을 입력해주세요.&#13;&#10;자세하게 입력해 주실수록 깊이있응 상담을 받으실 수 있습니다."></textarea>
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep2InputPop">이전</button>
                        <button type="button" class="pop_open apply_pop_btn" data-popup="applyStep3Pop">다음</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep2TextPop -->
        
        <!-- 팝업 -->
        <div id="applyStep3Pop" class="popup_wrap">
            <div class="popup_layer"></div>
            <div class="popup_box">
                <div class="popup_content apply_popup_content">
                    <button type="button" class="pop_close"></button>
                    <div class="apply_process_box">
                        <span class="ap_item">1</span>
                        <span class="ap_item">2</span>
                        <span class="ap_item current">3</span>
                    </div>

                    
                        <div class="apply_top">
                            <h3 class="pop_title">유수연 마스터와 1:1 화상상담</h3>
                            
                            <div class="apply_info_box no_category">
                                <span class="apply_info_item">
                                    결제 정보를 확인해주세요.
                                </span>
                            </div>
                        </div>

                        <div class="apply_content">
                            <h4 class="apply_title">
                                결제 정보 확인
                            </h4>
 
                            <div class="apply_complete_box">
                                <dl class="acb_list">
                                    <dt>상품명</dt>
                                    <dd>유수연 마스터와 1:1 화상 상담</dd>
                                    <dt>선택 일정</dt>
                                    <dd>2020년 6월 26일 (금)</dd>
                                    <dt>선택 시간</dt>
                                    <dd>16:00 - 18:00, 총 2시간</dd>
                                    <dt class="total">결제 금액</dt>
                                    <dd class="total">200,000원</dd>
                                </dl>
                                <p class="acb_text">
                                    지정된 시간 동안 마스터와 1:1 화상 채팅을 통해 깊이 있는 질문을 주고받을 수 있습니다.
                                    <br>
                                    해외 이용자는 전문 통역이 함께 참여합니다.
                                </p>
                            </div>
                        </div>

                    <div class="popup_bottom">
                        <!--  -->
                        <button type="button" class="pop_open apply_pop_btn apply_pop_btn_gray_border" data-popup="applyStep2TextPop">이전</button>
                        <button type="button" class="apply_pop_btn">신청하기</button>
                    </div>

                    
                </div>
            </div>
        </div><!-- //#applyStep3Pop -->
    
    
    <!-- 1:1화상상담 팝업끝 -->
    </div>  </div></div><!-- // #container -->
</div>
<script>
	if( window.outerWidth < 600 ) {

		var swiper = new Swiper('.swiper-container', {
			slidesPerView : 1, // 동시에 보여줄 슬라이드 갯수
			loopFillGroupWithBlank : true,

			pagination : { // 페이징
				el : '.swiper-pagination',
				clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
			},
			navigation : { // 네비게이션
				nextEl : '.swiper-button-next', // 다음 버튼 클래스명
				prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
			},
		});
		
		$('.swiper-slide').css('width','190px');
	} else {

		var swiper = new Swiper('.swiper-container', {
			slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
			loopFillGroupWithBlank : true,

			pagination : { // 페이징
				el : '.swiper-pagination',
				clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
			},
			navigation : { // 네비게이션
				nextEl : '.swiper-button-next', // 다음 버튼 클래스명
				prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
			},
		});
		
		$('.swiper-slide').css('width','190px');
		
	}
	
    // 팔로잉 버튼
    var $follow = $('.mc_follow_btn');

    $follow.on( 'click', function(){
        $(this).toggleClass('active');
        
        if( $(this).hasClass('active') ) {
            $(this).text('팔로잉');
        } else {
            $(this).text('팔로우');
        }
    });

    // tab 부드럽게 이동
    $('.mypeople_tab a').on( 'click', function(e){
        e.preventDefault();

        $('html, body').animate({scrollTop: $(this.hash).offset().top});
    });

    // 팝업 _ 달력 선택 버튼 toggle
    $('.asd_date_box button').on( 'click', function(){
        $('.asd_date_box button').removeClass('active');
        $(this).toggleClass('active');
    });
    $('.asd_time_item').on( 'click', function(){
        $('.asd_time_item').removeClass('active');
        $(this).toggleClass('active');
    });
    
    
	$('.apply_pop_btn').on( 'click', function(){
		$('#applyStep3Pop').hide();
        $('#po').show();
    });
	

	$('.apply_pop_btn').on( 'click', function(){
		$('#applyStep4Pop').hide();
        $('#po').show();
    });
	
	$('.apply_pop_btn').on( 'click', function(){
		$('#applyStep6Pop').hide();
        $('#po').show();
    });
	
	$('.apply_pop_btn').on( 'click', function(){
		$('#applyStep7Pop').hide();
        $('#po').show();
    });
		
	
	$('.apply_pop_btn').on( 'click', function(){
		$('#applyStep13Pop').hide();
        $('#po').show();
    });
	
	
    $('.mcc_btn.test7').on('click',function(){
		$('.popup_wrap').show();
		
        var popup = $(this).data('popup');

        popupFc(popup);
    });
     
    
    //플로팅

 $(window).scroll(function() {
	if( ($(window).scrollTop() - 200) > 8495 ) {
		$(".mds_list").stop().animate({   "top" : "8495"   }, 500,"",fn_scrollTest( $(window).scrollTop() - 200 ));
	} else if( ($(window).scrollTop() - 200) < 0 ) {
			$(".mds_list").stop().animate({   "top" : "0"   }, 500,"",fn_scrollTest( $(window).scrollTop() - 200 ));
	} else {
		$(".mds_list").stop().animate({   "top" : ($(window).scrollTop() - 200)   }, 500);
	}
      
   }
 );
    
function fn_scrollTest( value ){
	if( value > 8000 ) {
		console.log( $('.mds_list').css('top') );
	}
}



// 사이드바 float
$(window).scroll(function(){
	console.log( 1 );
	
var nowScroll = $(window).scrollTop();
var height = $('.master_detail_sidebar').height();
var box = $('.master_detail_section .section_inner').height();

if ( nowScroll > 200 ) {
    $('.master_detail_sidebar').css('top', nowScroll - 200);
} else {
    $('.master_detail_sidebar').css('top', 0);
}

if ( nowScroll > box - 600 ) {
    $('.master_detail_sidebar').css({
        top: 'auto',
        bottom: 0,
    });
}

var tabOf = $('.master_detail_content').offset().top;
var $tab = $('.mypeople_tab_box');

if ( nowScroll > tabOf ) {
    $tab.addClass('sticky');
} else {
    $tab.removeClass('sticky');
    
}

});

function accoFc() {
    var $btn = $('.acco_toggle');

    $btn.on( 'click', function(){
        $(this).parents('.acco_box').toggleClass('active').children('.acco_content').slideToggle();
    });

    var $btnSingle = $('.acco_toggle_single');

    $btnSingle.on( 'click', function(){
        $(this).parents('.acco_box').toggleClass('active').children('.acco_content').slideToggle();
        $(this).parents('.acco_box').siblings('.acco_box').removeClass('active').children('.acco_content').slideUp();
    });
}

// 아코디언
accoFc();
</script>

