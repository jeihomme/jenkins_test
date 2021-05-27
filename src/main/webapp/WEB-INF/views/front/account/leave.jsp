<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

    <div id="container">
        <div class="account_container section_inner">
            <div class="sub_nav_box">
                <ul class="sub_nav">
                    <li><a href="/front/main/index" class="home"></a></li>
                    <li><a href="#">계정</a></li>
                    <li><a href="#" class="current">회원탈퇴 안내</a></li>
                </ul>
            </div>

            <div class="account_double_box">
                <h3 class="account_title">회원탈퇴 안내</h3>
                
                <div class="register_box leave_box">
                    <div class="leave_text_box">
                        회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.
                        <br><br>
                        <b>사용하고 계신 아이디(이메일주소)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</b>
                        <br>
                        탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.
                        <br><br>
                        <b>상담서비스 활동 중이신 회원님은 상담서비스 활동 종료 후 탈퇴가 가능하십니다.</b>
                        <br><br>
                        탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.
                        <br><br>
                        상담후기 등은 자동 삭제되지 않고 그대로 남아 있습니다.
                        <br>
                        삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 삭제하시기 바랍니다.
                        <br>
                        탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.
                        <br><br>
                        탈퇴 후에는 아이디 [이메일주소] 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.
                        <br>
                        게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.
                    </div>

                    <p class="leave_agree">
                        <input type="checkbox" id="leaveAgreeCheck" class="custom_sq_check">
                        <label for="leaveAgreeCheck" class="custom_sq_label"></label>
                        <label for="leaveAgreeCheck" class="custom_sq_text">안내 사항을 모두 확인하였으며, 이에 동의합니다.</label>
                    </p>

                    <button id="isLeave" type="button" class="pop_open account_btn leave_btn" style="display:none;" data-popup="leavePop">확인</button>
                </div>
            </div><!-- //.account_double_box  -->

            <!-- 팝업 -->
            <div id="leavePop" class="popup_wrap">
                <div class="popup_layer"></div>
                <div class="popup_box">
                    <div class="popup_content alert_content phones_alert_content tablets_alert_content">
<!--                         <button type="button" class="pop_close"></button> -->
                        
                        <div class="register_pop_box">
                            <h4 class="rp_title">회원탈퇴 확인</h4>
                            <p class="rp_text">
                                비밀번호를 입력해 주십시오.
                            </p>
                        </div>

						<form>
	                        <div class="leave_form">
	                            <input type="password" class="leave_input" placeholder="비밀번호">    
	                            <input type="password" class="leave_input" placeholder="비밀번호 확인">    
	                            <div class="popup_bottom">
		                            <button type="submit" class="account_btn2finish account_btn_border3">확인</button>
		                            <button type="submit" class="account_btn2finish2 account_btn_border4">취소</button>
	                            </div>
	                        </div>
                        </form>
                    </div>
                </div>
            </div><!-- //#leavePop -->
        </div>
    </div><!-- // #container -->

<script>
$( '#now_loading' ).hide();

$('#leaveAgreeCheck').change(function(e){
	if( $('#leaveAgreeCheck').prop('checked') ) $('.leave_btn').show();
	 else $('.leave_btn').hide();
});

</script>













