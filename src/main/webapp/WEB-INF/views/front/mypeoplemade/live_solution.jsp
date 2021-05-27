<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
	
<head>
<meta http-equiv="Content-Type" content="text/html; charset={_GLOBALS['G_BROWSER_CHARACTERSET']}">
<meta content="requiresActiveX=true" http-equiv="X-UA-Compatible">
<title><!--{_GLOBALS['G_BROWSER_TITLE']}--></title>
<link rel="stylesheet" href="./Html/Css/Style.css" type="text/css">
<link rel="stylesheet" href="./Html/Css/button.css" type="text/css">

<link rel="stylesheet" href="https://asppm.gonts.net/emeetplus6/empl6_one/empcmcurl.css" type="text/css">
<link rel="stylesheet" type="text/css" href="https://asppm.gonts.net/pm/Html/CSS/flick/jquery-ui-1.8.13.custom.css" />	
<script type="text/javascript" src="https://asppm.gonts.net/emeetplus6/empl6_one/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="https://asppm.gonts.net/pm/Html/JS/jquery-ui-1.8.13.custom.min.js"></script>
<script type="text/javascript" src="https://asppm.gonts.net/pm/Html/Js/Common.js"></script>

<!--화상 연결시 필요-->
<script type="text/javascript" src="https://asppm.gonts.net/emeetplus6/empl6_one/empcm6.js?v=20200916"></script>
<script type="text/javascript" src="https://asppm.gonts.net/emeetplus6/empl6_one/empcmcurl.js?v=20200916"></script>

<!--pc버전 필요 js-->
<script type="text/javascript" src="https://asppm.gonts.net/emeetplus6/empl6_one/empcmcurldetector.js"></script> 
<script type="text/javascript" src="https://asppm.gonts.net/emeetplus6/empl6_one/empcmcurlwidget.js"></script>
<script type="text/javascript" src="https://asppm.gonts.net/configurations/PM.js?v=20201221" charset='UTF-8'></script>
<!--연동-->
</head>
<style>
.footer{display:none !important;}
.topbar{display:none !important;}
.header{display:none !important;}


.white_select{
    font-size:12px;
    height: 28px;
    padding-left:10px;
    padding-right:30px;
    padding-bottom:2px;
}	
@media screen and ( max-width: 600px ){
		
		.board_detail_box.board_detail_box_master {
    margin-top: 50px;
}
		
		}
</style>

<div id="wrap" class="chat_wrap">
    <div id="container" class="solution_container">
        <div class="solution_sidebar2">
<!--             <button type="button" class="mo_history_on">히스토리 보기</button> -->

            <div class="ss_title_box2">
                <h1 class="ss_title">
                    예체능의 심오
                    <br class="pc_show2">
                    1:1이메일코칭
                </h1>
                <span class="ss_tag2">
                    <span>#교육</span>
                    <span>#예체능</span>
                </span>

                <div class="ss_progess_box">
                    <span class="ss_time2">
                        <span class="ss_time2_c">10</span><span>회 / 20회</span>
<!--                         <span class="gray">·</span> -->
                        <span class="ss_time2_day">(~2021.01.18까지)</span>
                    </span>
                    <div class="ss_progess_bar">
                        <!-- 상태바 % -->
                        <span class="ssp_bar" style="width: 40%;"></span>
                    </div>
                </div>

        
            </div>


        </div><!-- // .solution_sidebar -->

                    <div class="solution_sidebar3" style="padding: 0 20px 20px 0;" >
                          <button type="button" class="pop_close" onclick="location.href='/front/mypeoplemade/email_solution'"></button>
                                <div class="ss_title_box3">
                <h1 class="ss_title">
                    1:1이메일코칭
                </h1>
                <span class="ss_tag3">
                    <span>사용 가능한 1:1이메일 코칭권 :</span>
                    <span class="ss_time3_c">10</span><span>개 / 20개 </span>
                    <span class="ss_time3_day">사용 기간 : 2021-02-18 ~ 2021-03-20 까지</span>
                </span>

<button type="button" class="prdt_apply_btn_e" data-popup="applyStep1Pop" onclick="location.href='/front/mypeoplemade/email_solution_notice'">이메일 코칭권 사용하기</button>

            <div class="board_detail_box board_detail_box_master">
                        <table class="board_table"  style="    width: 100%; margin-top:40px !important;
    margin: 0 auto;">
                            <tbody>
                                <tr>
                                    <td>
                                        <span class="board_cate">건강·최상민</span>
                                        <p class="board_title">
                                            <a href="/front/mypeoplemade/email_solution_detail">
                                                1:1화상상담 결제 문의
                                            </a>
                                        </p>
                                    </td>
                                    <td class="date">
                                        <span class="mltd_state use">미답변</span>
                                        2020.09.28
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="board_cate">건강·최상민</span>
                                        <p class="board_title">
                                            <a href="/front/mypeoplemade/email_solution_detail">
                                                1:1화상상담 결제 문의
                                            </a>
                                        </p>
                                    </td>
                                    <td class="date">
                                        <span class="mltd_state use">미답변</span>
                                        2020.09.28
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="board_cate">건강·최상민</span>
                                        <p class="board_title">
                                            <a href="/front/mypeoplemade/email_solution_detail">
                                                2개 분야의 마스터 지원이 가능한가요?
                                            </a>
                                        </p>
                                    </td>
                                    <td class="date">
                                        <span class="mltd_state on">답변완료</span>
                                        2020.09.28
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="board_cate">건강·최상민</span>
                                        <p class="board_title">
                                            <a href="/front/mypeoplemade/email_solution_detail">
                                                동영상 강좌 문의
                                            </a>
                                        </p>
                                    </td>
                                    <td class="date">
                                        <span class="mltd_state on">답변완료</span>
                                        2020.09.28
                                    </td>
                                </tr>


                            </tbody>
                                                        
                        </table>


                                                    <div class="pagination_box pagination_box_e">
                            <button type="button" class="pagi_btn pagi_btn_first"></button>
                            <button type="button" class="pagi_btn pagi_btn_prev pagi_btn_first_p"></button>
                            <div class="pagi_number">
                                <button type="button" class="pagi_btn pagi_num current">1</button>
                                <button type="button" class="pagi_btn pagi_num">2</button>
                                <button type="button" class="pagi_btn pagi_num">3</button>
                                <button type="button" class="pagi_btn pagi_num">4</button>
                                <button type="button" class="pagi_btn pagi_num">5</button>
                                <button type="button" class="pagi_btn pagi_num">6</button>
                            </div>
                            <button type="button" class="pagi_btn pagi_btn_next pagi_btn_first_m"></button>
                            <button type="button" class="pagi_btn pagi_btn_last"></button>
                        </div>



</div>
                    </div>
</div>

   
         </div>
</div><!-- // #wrap -->
<script type="text/javascript">
var titles = {Eng:'PEOPLEMADE LIVE',
	       Kor:'PEOPLEMADE LIVE'};

$(function(){
	EMPCM.ASP.Init();
	$( '#now_loading' ).hide();
});


</script>












