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
        <div class="guide_visual">
            <div class="section_inner minsection_inner">
                <div class="guide_text_box">
                    <span class="gt_sub">명사/마스터 인맥 공유 오픈 플랫폼</span>
                    <h2 class="gt_title">피플메이드</h2>
                    <p class="gt_text">
                        “ONLY 나”를 위한 특급마스터에게 VIP관리 받자!
                        <br>
                        누구나 특별하게!
                        <br>
                        셀럽, 연예인, CEO처럼!
                        <br>
                        약사, 코디, 회계사 등 나만의 전담 마스터를 만들어 보세요!
                    </p>
                </div>

                <div class="guide_visual_img">
                    <img src="/resources/assets/images/sub/guide_img01.png" alt="나는 담당 코디가 방탄 코디야! / 추성훈 PT트레이너한테 홈트레이닝 받는다! / 난 청담동 피부과 전담 주치의가 있어^^ / 내 담당 약사가 필요한 약을 추천해줘">
                </div>
            </div>
        </div>

        <div class="sub_section_g">
            <div class="section_inner">
                <div>
                    <h3 class="sub_section_title"><b>피플메이드</b> 소개</h3>
                    <p class="sub_section_text">
<!--                         피플메이드는 지금껏 개인적으로 쉽게 접근할 수 없었던  -->
                        마스터들의 지식과 정보, 그리고 노하우를
                        언제, 어디서든 
<!--                         나만의 전용 서비스로  -->
                        누릴 수 있는 <b>
<!--                         마스터  -->
                        인맥
<!--                         공유 -->
                        플랫폼</b>
<!--                         입니다. -->
                    </p>
                </div>
    
                <div class="guide_info_img">
                    <img src="/resources/assets/images/sub/guide_img02.jpg" alt="">
                </div>
            </div>
        </div>

        <div class="guide_bar">
            <div class="section_inner">
                <span class="gb_sub">여러분의 삶을 더욱 특별하게 완성시켜 줄 모든 마스터가 다 모였다!</span>
                <p class="gb_text">
                    지금, <b>피플메이드</b>에서 
                    <br class="mo_show">
                    <b>나만의 마스터</b>를 만나보세요!
                </p>
            </div>
        </div>

        <div class="sub_section sub_section_bg" style="color:#141414;">
            <div class="section_inner section_inner_m">
                <div class="guide_info_title">
                    <h3 class="sub_section_title">
                        <b>피플메이드</b>는 
                        <br class="mo_show">
                        이런 서비스를 제공합니다!
                    </h3>
                </div>
    
                <div class="guide_info_box">
                    <div class="gi_text_box" style="color:#141414;">
                        <h4 class="gi_title gi_title_top">1:1 화상코칭</h4>
                        <p class="gi_text">
                            이제 마스터를 직접 찾아갈 필요가 없어요.
                            <br>
                            마스터와 긴밀한 상담이 필요할 때
                            <br>
                            클릭 한 번으로 편리하게!
                            <br>
                            각 분야 최고의 마스터의 1:1 화상코칭을 받아보세요.
                        </p>
                    </div>
                    <div class="gi_img">
                        <div class="gi_video_box">
                            <div class="giv_item">
                                <button type="button" class="giv_video" >
                                <iframe width="361" height="200" class="framesize" src="https://www.youtube.com/embed/ATV0qNqCSfQ" frameborder="0" allowfullscreen></iframe>
                                
                                </button>
                            </div>
                            <div class="giv_item">
                                <button type="button" class="giv_video">
 <iframe width="360" height="200" class="framesize" src="https://www.youtube.com/embed/LJM5M1G3XrM?rel=0&amp;" allowfullscreen></iframe>                                </button>
                            </div>
<!--                                                     <button type="button" class="giv_video" style="background-image: url(/resources/assets/images/sub/guide_img15.jpg);">    -->
                            
                        </div>
                        <p class="giv_text">피플메이드는 상황별 최적의 화상시스템을 제공합니다.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="sub_section sub_section_gray">
            <div class="section_inner section_inner_m">
                <div class="guide_info_box">
                    <div class="gi_text_box gi_text_box_more">
                        <h4 class="gi_title gi_title_top">1:1 채팅코칭</h4>
                        <p class="gi_text">
                            지금 바로 마스터의 조언이 필요하다면?
                            <br>
                            언제, 어디서나 간단하게 1:1 채팅코칭을 이용하세요.
                            <br>
                            합리적인 가격으로 마스터의 빠르고 세세한 피드백을
                            <br>
                            받아보세요.
                        </p>
                    </div>
                    <div class="gi_img chat_img">
                        <img src="/resources/assets/images/sub/guide_img03.png" alt="">
                    </div>
                </div>
            </div>
        </div>

        <div class="sub_section sub_section_bg">
            <div class="section_inner section_inner_m">
                <div class="guide_info_box">
                    <div class="gi_text_box">
                        <h4 class="gi_title gi_title_top" style="color:#141414;">1:1 이메일코칭</h4>
                        <p class="gi_text" style="color:#909090;">
                            문서 첨삭 서비스부터 법률/회계 등 전문적인 상담,
                            <br>
                            개인적인 고민 등 상담 받고 싶은 내용을
                            <br>
                            자유롭게 적어 보내주세요.
                            <br>
                            개개인의 상황에 맞춘 마스터의 정확한 피드백을
                            <br>
                            받을 수 있습니다.
                        </p>
                    </div>
                    <div class="gi_img">
                        <div class="gi_video_box">
                            <div class="giv_item">
                                <div class="giv_video" style="background-image: url(/resources/assets/images/sub/guide_img16.jpg);"></div>
                            </div>
                            <div class="giv_item">
                                <div class="giv_video" style="background-image: url(/resources/assets/images/sub/guide_img17.png);"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="sub_section sub_section_gray">
            <div class="section_inner section_inner_m">
                <div class="guide_info_box">
                    <div class="gi_text_box">
                        <h4 class="gi_title gi_text_box_more2">LIVE CLASS</h4>
                        <p class="gi_text">
                            다양한 명사들의 강연이 내 방에서 열린다!
                            <br>
                            피플메이드 LIVE CLASS를 통해 공간을 뛰어넘어
                            <br>
                            어디서나 편하게 강연에 참여할 수 있습니다.
                            <br>
                            명사들과 직접 소통하며 배워보세요.
                        </p>
                    </div>
                    <div class="gi_img gi_img_right">
                        <img src="/resources/assets/images/sub/guide_img04.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>

        <div class="sub_section sub_section_bg">
            <div class="section_inner section_inner_m">
                <div class="guide_info_box">
                    <div class="gi_text_box">
                        <h4 class="gi_title gi_text_box_more2" style="color:#141414;">VOD 서비스</h4>
                        <p class="gi_text" style="color:#909090;">
                            피플메이드 VOD는
                            <br>
                            최고의 마스터들이 커리큘럼을 세분화하여
                            <br>
                            필요한 부분만 PICK!해서
                            <br>
                            빠르게 학습할 수 있습니다.
                        </p>
                    </div>
                    <div class="gi_img gi_img_right">
                        <img src="/resources/assets/images/sub/guide_img05.png" alt="">
                    </div>
                </div>
            </div>
        </div>

        <div class="sub_section sub_section_gray">
            <div class="section_inner section_inner_m">
                <div class="guide_info_box">
                    <div class="gi_text_box">
                        <h4 class="gi_title  gi_text_box_more2">아카데미</h4>
                        <p class="gi_text">
                            보다 더 전문적인 상담이나 고급 과정 수강이
                            <br>
                            필요하시다면 피플메이드 아카데미를 이용해보세요.
                            <br>
                            1인의 마스터가 아닌 여러 마스터들이 모인
                            <br>
                            아카데미를 통해 총괄 코칭을 받을 수 있습니다.
                        </p>
                    </div>
                    <div class="gi_img gi_img_right">
                        <img src="/resources/assets/images/sub/guide_img06.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>

        <div class="sub_section sub_section_bg">
            <div class="section_inner section_inner_m">
                <div>
                    <h3 class="sub_section_title" style="color:#141414;"><b>피플메이드 서비스</b> 이용방법</h3>
                </div>

                <div class="guide_tab_box">
                    <ul class="guide_tab_list">
                        <li class="active">
                            <button type="button" class="guide_tab_list_item">
                                1:1 화상 코칭/ 
                                <br class="mo_show">
                                1:1 채팅 코칭
                            </button>
                        </li>
                        <li>
                            <button type="button" class="guide_tab_list_item">1:1 이메일 코칭</button>
                        </li>
                        <li>
                            <button type="button" class="guide_tab_list_item">강의 VOD</button>
                        </li>
                    </ul>

                    <div class="guide_tab_content">
                        <div class="guide_tab_item active">
                            <div class="chat_process_box">
                                <div class="cp_item">
                                    <div class="cp_num_box">
                                        <span class="cp_num">1</span>
                                        <span class="cp_num_text">STEP</span>
                                    </div>
                                    <div class="cp_text_box">
                                        <span class="cp_title">원하는 분야 찾기</span>
                                        <span class="cp_text">
                                            상담이 필요한 분야를
                                            <br>
                                            피플메이드 홈과 키워드 검색으로 찾아보세요.
                                        </span>
                                    </div>
                                </div>
                                <div class="cp_item">
                                    <div class="cp_num_box">
                                        <span class="cp_num">2</span>
                                        <span class="cp_num_text">STEP</span>
                                    </div>
                                    <div class="cp_text_box">
                                        <span class="cp_title">나만의 마스터 찾기</span>
                                        <span class="cp_text">
                                            선택한 분야의 마스터들을 한눈에 볼 수 있어요.
                                            <br>
                                            이력, 평점, 후기 등을 확인하고 마스터를 선택하세요.
                                        </span>
                                    </div>
                                </div>
                                <div class="cp_item">
                                    <div class="cp_num_box">
                                        <span class="cp_num">3</span>
                                        <span class="cp_num_text">STEP</span>
                                    </div>
                                    <div class="cp_text_box">
                                        <span class="cp_title">1:1 화상/채팅 코칭 시간 예약하기</span>
                                        <span class="cp_text">
                                            코칭 가능한 시간을 확인한 후, 상담 시간을 선택 > 예약하세요.
                                            <br>
                                            선착순 마감될 수 있으니, 빠른 예약은 필수!
                                        </span>
                                    </div>
                                </div>
                                <div class="cp_item">
                                    <div class="cp_num_box">
                                        <span class="cp_num">4</span>
                                        <span class="cp_num_text">STEP</span>
                                    </div>
                                    <div class="cp_text_box">
                                        <span class="cp_title">마스터 코칭</span>
                                        <span class="cp_text">
                                            예약한 시간에 마스터와 1:1 화상/채팅 코칭이 진행됩니다.
                                        </span>
                                    </div>
                                </div>
                                <div class="cp_item">
                                    <div class="cp_num_box">
                                        <span class="cp_num">5</span>
                                        <span class="cp_num_text">STEP</span>
                                    </div>
                                    <div class="cp_text_box">
                                        <span class="cp_title">마스터 코칭 완료</span>
                                        <span class="cp_text">
                                            코칭 완료 후, 후기와 평점을 남겨주세요.
                                            <br>
                                            상담이 마음에 들었다면 마스터를 팔로우!
                                            <br>
                                            추가 코칭 진행 시, 마이페이지에서 빠르게 상담 예약이 가능합니다.
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="chat_process_img">
                                <img src="/resources/assets/images/sub/guide_img07.jpg" alt="">
                            </div>
                        </div><!-- //.guide_tab_item -->
                        <div class="guide_tab_item">
                            <div class="chat_process_box">
                                <div class="cp_item">
                                    <div class="cp_num_box">
                                        <span class="cp_num">1</span>
                                        <span class="cp_num_text">STEP</span>
                                    </div>
                                    <div class="cp_text_box">
                                        <span class="cp_title">원하는 분야 찾기</span>
                                        <span class="cp_text">
                                            상담이 필요한 분야를
                                            <br>
                                            피플메이드 홈과 키워드 검색으로 찾아보세요.
                                        </span>
                                    </div>
                                </div>
                                <div class="cp_item">
                                    <div class="cp_num_box">
                                        <span class="cp_num">2</span>
                                        <span class="cp_num_text">STEP</span>
                                    </div>
                                    <div class="cp_text_box">
                                        <span class="cp_title">나만의 마스터 찾기</span>
                                        <span class="cp_text">
                                            선택한 분야의 마스터들을 한눈에 볼 수 있어요.
                                            <br>
                                            이력, 평점, 후기 등을 확인하고 마스터를 선택하세요.
                                        </span>
                                    </div>
                                </div>
                                <div class="cp_item">
                                    <div class="cp_num_box">
                                        <span class="cp_num">3</span>
                                        <span class="cp_num_text">STEP</span>
                                    </div>
                                    <div class="cp_text_box">
                                        <span class="cp_title">1:1 이메일 코칭권 구매하기</span>
                                        <span class="cp_text">
                                            구매 가능한 이메일 코칭권을 선택 > 구매하세요.
                                        </span>
                                    </div>
                                </div>
                                <div class="cp_item">
                                    <div class="cp_num_box">
                                        <span class="cp_num">4</span>
                                        <span class="cp_num_text">STEP</span>
                                    </div>
                                    <div class="cp_text_box">
                                        <span class="cp_title">코칭 내용 작성</span>
                                        <span class="cp_text">
                                            첨삭 서비스부터 전문분야 상담, 개인적인 고민 등
                                            상담받고 싶은 내용을 자유롭게 작성하고 마스터에게
                                            발송합니다.
                                        </span>
                                    </div>
                                </div>
                                <div class="cp_item">
                                    <div class="cp_num_box">
                                        <span class="cp_num">5</span>
                                        <span class="cp_num_text">STEP</span>
                                    </div>
                                    <div class="cp_text_box">
                                        <span class="cp_title">마스터 답변 완료</span>
                                        <span class="cp_text">
                                            여러분의 사연을 마스터가 면밀히 살핀 다음
                                            1~2주 이내에 정확하고 자세한 답변을 드립니다.
                                            상담이 마음에 들었다면 마스터를 팔로우!
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="chat_process_img">
                                <img src="/resources/assets/images/sub/guide_img08.jpg" alt="">
                            </div>
                        </div><!-- //.guide_tab_item -->
                        <div class="guide_tab_item">
                            <div class="chat_process_box">
                                <div class="cp_item">
                                    <div class="cp_num_box">
                                        <span class="cp_num">1</span>
                                        <span class="cp_num_text">STEP</span>
                                    </div>
                                    <div class="cp_text_box">
                                        <span class="cp_title">원하는 분야 찾기</span>
                                        <span class="cp_text">
                                            상담이 필요한 분야를
                                            <br>
                                            피플메이드 홈과 키워드 검색으로 찾아보세요.
                                        </span>
                                    </div>
                                </div>
                                <div class="cp_item">
                                    <div class="cp_num_box">
                                        <span class="cp_num">2</span>
                                        <span class="cp_num_text">STEP</span>
                                    </div>
                                    <div class="cp_text_box">
                                        <span class="cp_title">나에게 맞는 강의 VOD 찾기</span>
                                        <span class="cp_text">
                                            선택한 분야의 마스터 강의를 한 눈에 볼 수 있어요.
                                            <br>
                                            커리큘럼, 평점, 후기를 확인하고 VOD를 선택해 보세요.
                                        </span>
                                    </div>
                                </div>
                                <div class="cp_item">
                                    <div class="cp_num_box">
                                        <span class="cp_num">3</span>
                                        <span class="cp_num_text">STEP</span>
                                    </div>
                                    <div class="cp_text_box">
                                        <span class="cp_title">VOD 수강</span>
                                        <span class="cp_text">
                                            수강기간 내에 선택한 강의를 수강하세요.
                                            <br>
                                            마이페이지에서 수강 진도를 확인할 수 있어요.
                                        </span>
                                    </div>
                                </div>
                                <div class="cp_item">
                                    <div class="cp_num_box">
                                        <span class="cp_num">4</span>
                                        <span class="cp_num_text">STEP</span>
                                    </div>
                                    <div class="cp_text_box">
                                        <span class="cp_title">수강 완료</span>
                                        <span class="cp_text">
                                            수강이 완료되면 생생한 후기와 평점을 남겨주세요.
                                            <br>
                                            강의가 만족스러웠다면, 마스터를 팔로우!
                                            <br>
                                            마스터님의 신규 강의 업로드 소식을 빠르게 확인할 수 있어요.
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="chat_process_img">
                                <img src="/resources/assets/images/sub/guide_img09.jpg" alt="">
                            </div>
                        </div><!-- //.guide_tab_item -->
                    </div>
                </div>
            </div>
        </div>
        
        <div class="sub_section sub_section_bg" style="border-top:1px solid #e0e4e5;">
            <div class="section_inner">
                <div>
                    <h3 class="sub_section_title" style="color: #141414;">
                        <b>나와 잘 맞는 마스터</b>를 
                        <br class="mo_show">
                        찾는게 어렵다고요?
                    </h3>
                    <p class="sub_section_text">
                        전문MD의 <b>마스터 추천 서비스</b>로 마스터 찾기 끝!
                    </p>
                </div>
    
                <ul class="md_list">
                    <li>
                        <span class="md_num">1</span>
                        <p class="md_img">
                            <img src="/resources/assets/images/sub/guide_img11.jpg" alt="">
                        </p>
                        <h4 class="md_title">마스터 추천 서비스 신청하기</h4>
                        <p class="md_text">
                            실시간 톡 상담이나 고객센터를 통해
                            <br>
                            분야 / 이름 / 상담내용을 적어
                            <br>
                            전문MD에게 문의해주세요!
                        </p>
                    </li>
                    <li>
                        <span class="md_num">2</span>
                        <p class="md_img">
                            <img src="/resources/assets/images/sub/guide_img10.jpg" alt="">
                        </p>
                        <h4 class="md_title">수강생 분석 및 마스터 서치</h4>
                        <p class="md_text">
                            전문 MD가 여러분의 분야 / 목표 / 내용 / 성향 등을
                            <br>
                            분석하여 맞춤 마스터를 서치합니다.
                        </p>
                    </li>
                    <li>
                        <span class="md_num">3</span>
                        <p class="md_img">
                            <img src="/resources/assets/images/sub/guide_img12.jpg" alt="">
                        </p>
                        <h4 class="md_title">맞춤 마스터 추천 완료</h4>
                        <p class="md_text">
                            여러분에게 가장 적합한
                            <br>
                            최고의 마스터를 추천해드립니다.
                        </p>
                    </li>
                </ul>
            </div>
        </div>

        <div class="sub_section main"  style="background-color: #fff;"> 
            <div class="section_inner">
                <div>
                    <h3 class="sub_section_title">
                        <b>피플메이드 마스터 
                        <br class="mo_show">
                        추천서비스</b>로 더욱 특별해진 
                        <br class="mo_show">
                        고명수씨의 하루
                    </h3>
                </div>
    
                <div class="made_day_img">
                    <img src="/resources/assets/images/sub/guide_img13.jpg" alt="">
                </div>
            </div>
        </div>
        <div class="sub_section main2"  style="background-color: #fff;">
            <div class="section_inner">
                <div>
                    <h3 class="sub_section_title main">
                        <b>피플메이드 마스터 
                        <br class="mo_show">
                        추천서비스</b>로 더욱 특별해진 
                        <br class="mo_show">
                        고명수씨의 하루
                    </h3>
                </div>
    
        
                            
                            <div class="chat_process_box">
                            
                            <div class="main" style="border-bottom:1px dotted #ccc;height:70px;margin-bottom:40px;">
                                    <div class="cp_num_box" >
                                        <span class="cp_num0"></span>
                        
                                    </div>
                                    <div class="cp_item main">
                        
                            <span class="cp_title" style="padding-left:20px;">피플메이드와 함께 더 특별해진 삶</span>           
                                    <br>     <span class="cp_text" style="font-weight:bold; font-size:16px;
                                               padding-left:20px;">
                                           
                                          고명수(30대/남)
                                        </span>
                                    </div>
                        
                                </div>
                                  <div class="cp_item main">
                                    <div class="cp_num_box">
                                        <span class="cp_num2"></span>
                        
                                    </div>
                                    <div class="cp_text_box">
                                          <span class="cp_num_text main2">AM 07: 30</span>
                                        <span class="cp_title">1:1 화상 코칭으로</span>
                                        <span class="cp_text">
                                            출근 전, 연예인 코디에게
                                            <br>
                                            오늘의 옷을 추천 받아 PICK 완료!
                                        </span>
                                    </div>
                                </div>
                                
                                <div class="cp_item main">
                                    <div class="cp_num_box">
                                        <span class="cp_num3"></span>
                        
                                    </div>
                                    <div class="cp_text_box">
                                          <span class="cp_num_text main2">AM 08: 30</span>
                                        <span class="cp_title">VOD 서비스로</span>
                                        <span class="cp_text">
                                           출근길 지하철에서 월 1,000만원 이상의 
                                            <br>
                                            수익을 내는 고수의 재태크 강의를 보고!
                                        </span>
                                    </div>
                                </div>
                                <div class="cp_item main">
                                    <div class="cp_num_box">
                                        <span class="cp_num4"></span>
                                       
                    
                                    </div>
                                    <div class="cp_text_box">
                                     <span class="cp_num_text main2">PM 12: 30</span>
                                        <span class="cp_title">1:1 화상 코칭으로</span>
                                        <span class="cp_text">
                                            즐거운 점심시간! 
                                            <br>
                                            저녁에 있을 데이트를 위해 나의 연애코치에게 특별한 픽살기를 전수받고!
                                        </span>
                                    </div>
                                </div>
                                <div class="cp_item main">
                                    <div class="cp_num_box">
                                        <span class="cp_num5"></span>
                                        
                                           </div>
                                    <div class="cp_text_box">
                                    <span class="cp_num_text main2">PM 14: 40</span>
                                        <span class="cp_title">1:1 채팅 코칭으로</span>
                                        <span class="cp_text">
                                            빠른 업무처리를 위해
                                            <br>
                                            '프로일잘러'전문가에게 실무 스킬을 물어보고! </span>
                                    </div>
                                </div>
                                                              <div class="cp_item main">
                                    <div class="cp_num_box">
                                        <span class="cp_num6"></span>
                                        
                                  
                                    </div>
                                    <div class="cp_text_box">
                                    <span class="cp_num_text main2">PM 07: 30</span>
                                        <span class="cp_title">1:1 화상 코칭으로</span>
                                        <span class="cp_text">
                                            집에서 편하게
                                            <br>
                                            연예인 PT 트레이너에게 홈트레이닝 받기!</span>
                                    </div>
                                </div>  
                                
                            </div>

                        </div><!-- //.guide_tab_item -->
                </div>
        
        <div class="guide_tail">
            <div class="section_inner">
                <p class="gt_text">여러분의 삶의 질을 더욱 높여줄 최고의 명사와 마스터들을 지금 만나러 가볼까요?</p>
                <a href="/front" class="gt_btn">피플메이드 시작하기</a>
            </div>
        </div>
    </div><!-- // #container -->

<div class="m_footerDummy"></div>
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
	
	

</script>
















