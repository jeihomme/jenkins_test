<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<style>

/* SCROLL */
::-webkit-scrollbar { width: 2px;     border-radius: 40px;}
/* 스크롤바의 width */
::-webkit-scrollbar-track { background-color: black; }
/* 스크롤바의 전체 배경색 */
::-webkit-scrollbar-thumb { 
    background:#444; 
}
/* 스크롤바 색 */
::-webkit-scrollbar-button { display: none; }
/* 위 아래 버튼 (버튼 없애기를 함) */


.account_form input::placeholder {color: #aaa;}
#naverIdLogin_loginButton img{display:none;}
#naverIdLogin_loginButton { line-height: 62px !important;position: absolute; left: 120px;}
.pop_top{position: absolute !important; width: 82% !important;   bottom: 0 !important;}

@media screen and (max-width: 1250px){
	.login_box2 {padding-top: 40px !important;}
	.naver_btn{text-align: center;    line-height: 43px;}
   .pop_top{width: 100% !important;bottom: -60px !important;}
    .account_sepa {margin: 95px 0 30px 0;}
}

.fn_delKeyword{ margin-left: 3px; color: white; cursor: pointer; }
table.list_tbl01 > tbody > tr > td {background-color: #333;}
table.view_tbl01 > tbody > tr > td {background-color: #333;}

</style>
    <div id="container">
        <div class="account_container section_inner">
            <div class="sub_nav_box">
                <ul class="sub_nav">
                    <li><a href="/front/main/index.html" class="home"></a></li>
                    <li><a href="#">계정</a></li>
                    <li><a href="#" class="current">회원가입 상세</a></li>
                </ul>
            </div>

            <div class="account_double_box">
                <h3 class="account_title">무료회원가입</h3>

                <div class="register_box">
                    <div class="register_item register_item_2">
                        <div class="account_form" id="insertAccount">
                        
							<p class="account_item" >
								<h3 class="account_title" style="margin-bottom:20px;font-size:18px;">기본정보</h3>
							</p>
							
                            <p class="account_item">
                                <input type="text" name="USER_NM" class="account_input" placeholder="이름, 최대 12자" maxlength="12">
                            </p>
                            <p class="account_item post_item post_item_size">
                                <input type="text" class="account_input" name="USER_NICK"  placeholder="닉네임, 최대 12자" maxlength="12">
								<button type="button" class="double_check_btn dubleBtn" >중복확인</button>
                            </p>
							
                            <p class="account_item post_item post_item_size">
                                <input type="text" class="account_input" name="USER_EMAIL" placeholder="이메일 주소 입력">
                                <button type="button" class="double_check_btn dubleBtn">중복확인</button>
                            </p>
                            <p class="account_item tell_item post_item_tell">
                                <select name="USER_PHONE1" class="tell_select">
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="013">013</option>
                                    <option value="018">018</option>
                                </select>
                                <span class="tell_mark">-</span>
                                <input type="text" name="USER_PHONE2" class="account_input" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                                <span class="tell_mark">-</span>
                                <input type="text" name="USER_PHONE3" class="account_input" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                                <button type="button" class="double_check_btn dubleBtn">중복확인</button>
                            </p>
							<p class="account_item" >
								<h3 class="account_title" style="margin-bottom:20px;font-size:18px;">관심분야</h3>
							</p>
							<p class="account_item" >
                                <select name="PARENT_CODE_ID" id="PARENT_CODE_ID" class="tell_select2 tell_select2_login"></select>
								<select name="CODE_ID" id="CODE_ID" class="tell_select2 tell_select2_login" style="margin-right: 2px;">
									<option></option>
								</select>
								
                            	<button type="button" onclick="addKeyw();" class="double_check_btn" style="float: right;">추가</button>
							</p>
                            
							<p class="pluse_tag" id="addKeywTarget"></p>
							
							<p class="account_item" >
								<h3 class="account_title" style="margin-bottom:20px;font-size:18px;">비밀번호</h3>
							</p>
                            <p class="account_item post_item">
                                <input type="password" name="USER_PW" class="account_input" placeholder="비밀번호 (문자, 숫자 포함 8자이상)" style="width: 75% !important;">
                                
	                           <label for="pwTypeChange1" class="form_check pwTypeChange1" style="color: white; font-size: 13px; font-weight: 300;top: 15px;left: 18px;">
	                               	<span><i class="fas fa-eye"></i></span>
	                            </label>
	                            <input type="checkbox" id="pwTypeChange1" style="display:none;">
	                           	<span class="form_check_mark phone_form_check_mark tablet_form_check_mark" ></span>
                            </p>
                            <p class="account_item post_item">
                                <input type="password" name="USER_PW_CONFIRM" class="account_input" placeholder="비밀번호 확인 (문자, 숫자 포함 8자이상)" style="width: 75% !important;">
                            	
	                           <label for="pwTypeChange2" class="form_check pwTypeChange2" style="color: white; font-size: 13px; font-weight: 300;top: 15px;left: 18px;">
	                                <span><i class="fas fa-eye"></i></span>
	                            </label>
                           		<input type="checkbox" id="pwTypeChange2" style="display:none;">
                           		<span class="form_check_mark phone_form_check_mark tablet_form_check_mark" ></span>
                            </p>
                            
                        </div>
                    </div>
                    <div class="register_item register_item_2">
                        <h4 class="terms_title">이용약관 동의</h4>

                        <div class="terms_check_box">
                            <p class="terms_check_item terms_check_item_all">

                         <label for="all" class="form_check border_color_main">
                                    <input type="checkbox" id="all" name="all" name="agreement" value="">
                                    <span class="form_check_mark" style="border-color: #27f1d5;"></span>
                                    전체 동의
                                </label>
                            </p>

                            <p class="terms_check_item">
								  <label for="termsAgreeCheck" class="form_check">
                                        <input type="checkbox" id="termsAgreeCheck" name="agreement" value="service">
                                        <span class="form_check_mark"></span>
                                       <label for="termsAgreeCheck" class="custom_text">서비스 이용약관 동의 (필수)</label>
                                    </label>
								
								<button type="button" class="pop_open register_submit3" data-popup="childRegisterPop3">내용보기</button>
						
						
						
						
						
						
						<div id="childRegisterPop3" class="popup_wrap">
                            <div class="popup_layer"></div>
                            <div class="popup_box">
                                <div class="popup_content register_popup_content3" style="text-align:left;overflow-y: auto;">
<!--                                     <button type="button" class="pop_close"></button> -->
                                    
                                    <div class="register_pop_box">
                                        <h4 class="rp_title">서비스 약관</h4>
                                        <p class="rp_text">
										<div class="over" style=" overflow-y:scroll; height:auto; padding-right: 10px;width:100%">
                                            <div class="leave_text_box" >
                        <b>서비스 약관에 대한 안내<br><br>제1조 [목적]</b><br>본 약관은 ㈜피플메이드에서 제공하는 지식 중개 플랫폼 서비스를 이용함에 있어 회사와 사용자의 권리, 의무 및 책임사항을 규정하며 본 약관을 통하여 회사와 사용자는 상호간의 준수해야 할 사항들을 숙지함을 목적으로 한다.<br><br>

<br>
<b>제 2조 [용어의 정의]</b>
가. 본 약관 및 피플메이드에서 제공하는 서비스에서의 용어 정의.<br>
1. “피플메이드”이란 “마스터”가 업로드한 콘텐츠 및 물품을 “회사”에서 제공하는 PC, 모바일 애플리케이션, 모바일 웹 등을 모두 포함하여 판매하는 중개 플랫폼을 의미합니다.<br>
  2. “서비스”란 “회사”가 운영하는 그 어느 형태의 플랫폼 “피플메이드”을 통하여 제공하는 서비스 일체를 의미합니다.<br>
  3. “VOD”란 “서비스” 중 영상화 된 강의를 의미합니다.<br>
  4. “1:1 상담”이란 “서비스” 중 비대면 화상 상담, 비대면 채팅 상담, 비대면 이메일 상담을 의미합니다.<br>
  5. “물품”이란 “피플메이드”에서 판매되는 물건을 의미합니다.<br>
  6. “콘텐츠”란 “피플메이드”에서 “사용자”가 수강할 것을 목적으로 제작한 각종 영상 및 이미지 등을 말합니다.<br>
  7. “사용자”란 “피플메이드”를 사용하는 자로서, “마스터”를 포함하여 의미합니다.<br>
  8. “채널”이란 “콘텐츠”의 홍보나 판매가 이루어질 수 있는 경로를 말합니다.<br>
  9. “플랫폼”이란 “피플메이드”의 형태를 의미합니다.<br>
  10. “해지” 또는 “탈퇴”란 회사 또는 회원이 이용계약을 해약하는 것을 의미합니다.<br>
  11. “피플메이드 계정”이란 “피플메이드”에서 “사용자”또는 “마스터”가 “서비스”를 사용하기 위하여 필요한 이메일 주소 및 아이디/비밀번호 기반의 로그인 계정을 의미합니다.<br>
나. 본 약관에서 정하지 않은 용어의 정의는 관련 법령 및 일반적인 상관례에 따릅니다.<br>



         <br><b>제 3조 [약관의 효력 및 명시]</b><br>
         
         
         가. 본 약관은 피플메이드 사이트에서 회원으로 가입 후 서비스 이용을 시작한 순간부터 효력이 발생됩니다.<br>
    나. 회사는 서비스 이용약관 및 각 약관 및 정책에 있어 변경이 있을 시 사용자들에게 전자우편, 홈페이지 공지 등 기타 방법으로 변경에 대한 내용을 공지함에 따라 그 효력이 발생합니다.<br>
    다. 신규 사용자의 경우 회원가입 시 명시된 약관에 동의를 함과 동시에 그 효력이 발생됩니다.<br>
    라. 기존 사용자의 경우 ‘나’에서 언급된 바 전자우편 또는 그 외의 기타 방법으로 공지함에 따라 동의 한 것으로 간주합니다. 단, 변경된 내용에 대하여 동의를 하지 않는 경우 서비스 이용 중지 및 자진 탈퇴를 함으로 약관의 내용을 거부 할 수 있습니다.<br>
         <br>
         <b>제 4조 [기타 사항의 처리]</b><br>
         본 약관에 명시되지 않은 사항에 대해서는 관련법령 및 회사가 정한 서비스 이용안내에 준수합니다.<br><br>
         
         
        <b>제 5조 [플랫폼 성질 및 목적이해]</b><br> 
        가. ㈜피플메이드가 제공하는 서비스 플랫폼은 서비스 제공자(마스터)와 서비스 구매 및 사용자의 안전한 거래 및 상호간의 거래 중개를 제공합니다. <br>서비스 제공자(마스터)와 서비스 사용자간 별도로 진행된 거래에 대한 책임은 거래당사자인 마스터와 사용자가 스스로 부담하여야 합니다.
        <br>
        <br><br>
        <b>제 6조 [회원가입 및 탈퇴에 대한 규정]</b><br> 
     
        
        회원가입<br> 
가. 회원가입이라 함은 본 플랫폼에 사용 목적을 위하여 가입을 하는 것을 의미한다.<br> 
    나. 사용자는 본 플랫폼 이용을 위하여 일정의 개인정보를 입력 후 가입하여 이용할 수 있다.<br> 
    다. 사용자는 가입된 계정의 외부 유출 및 공유를 하여서는 안된다.<br> 
    라.회원가입 시 수집된 사용자 정보는 개인정보처리 규정에 의거하여 처리한다.<br> 
<br> 
탈퇴<br> 
가. 탈퇴라 함은 본 플랫폼에 가입된 계정을 삭제하는 것을 의미한다.<br> 
    나. 탈퇴한 계정은 30일 이후에 재 가입이 가능하다.<br> 
    다. 탈퇴한 사유에 따른 사용자의 재가입승인 불가가 발생할 수 있다.<br> 
    라.탈퇴한 사용자는 동일한 정보를 입력하여 재가입 또는 재 회원가입을 할 수 있다.<br> 
    마. 부득이한 경우에 회사는 사용자에게 통보 후 강제 탈퇴조치를 취할 수 있다.<br> 
                    </div>
                                        </div>
										
                                        <br>
                                        <div class="rp_checkbox">
								  <label for="keepLoginCheck" class="form_check">
                                        <input type="checkbox" id="keepLoginCheck" name="agreement">
                                        <span class="form_check_mark"></span>
                                       <label for="keepLoginCheck" class="custom_text" >서비스 이용약관 동의 (필수)</label>
                                    </label>
                                        </div>
                                    </div>
                                    <div class="popup_bottom popup_bottom_box">
                                        <button type="button" class="account_btn_account account_btn_border3">확인</button>
                                    </div>
                                </div>
                            </div>
                        </div><!-- //#childRegisterPop3 -->
								
                        </p>
                            <p class="terms_check_item">
                                    <label for="userAgreeCheck" class="form_check" >
                                        <input type="checkbox" id="userAgreeCheck" name="agreement"  value="user">
                                        <span class="form_check_mark"></span>
                                        <label for="userAgreeCheck" class="custom_text" >개인정보 처리방침 동의 (필수)</label>
                                    </label>
							    <button type="button" class="pop_open register_submit4" data-popup="childRegisterPop4">내용보기</button>
						<div id="childRegisterPop4" class="popup_wrap">
                            <div class="popup_layer"></div>
                            <div class="popup_box">
                                <div class="popup_content register_popup_content4" style="text-align:left;overflow-y: auto;">
<!--                                     <button type="button" class="pop_close"></button> -->
                                    
                                    <div class="register_pop_box">
                                        <h4 class="rp_title">개인정보처리방침</h4>
                                        <p class="rp_text">
										<div class="over" style=" overflow-y:scroll; height:auto; padding-right: 10px;width:100%">
                                            <div class="leave_text_box">
							<b>제 1조 [개인정보 수집이용 목적]</b><br> <b class="textbar">가. 회사의
								개인정보 수집 목적은 본인확인, 회원관리, 최적화된 개인 맞춤화 서비스 등을 제공하기 위함이며, 회사는 서비스 제공을 원활하게 하기 위해 필요한
								최소한의 정보만을 수집합니다. <br> &nbsp;&nbsp;&nbsp;&nbsp;나. 서비스 이용에 따른
								대금결제, 물품배송 및 환불 등에 필요한 정보를 추가로 수집할 수 있습니다. <br>
								&nbsp;&nbsp;&nbsp;&nbsp;다. 회사는 개인정보를 수집, 이용목적 이외에 다른 용도로 이용하거나
								회원의 동의 없이 제3자에게 이를 제공하지 않습니다. <br>



							</b><br> <b>제 2조 [개인정보 수집항목 및 방법]</b> <br> 가. 개인정보 수집항목은 회원, 비회원 그리고 기타에 따른 구분에 의거하여 정보가 수집될 수 있다. <br>
							<!--                        <b class="text_bar">가. 본 약관 및 피플메이드에서 제공하는 서비스에서의 용어 정의.</b> -->

							<b class="textbar">1. 회원 필수항목:  성명, 이메일, 비밀번호, 휴대폰번호,  수신여부(SMS, 이메일), 카카오 ID 및 카카오에서 제공하는 정보, 네이버 ID 및 네이버에서 제공하는 정보, 구글 ID 및 구글에서 제공하는 정보, 만14세 미만 회원의 법정대리인 확인 정보
								<br> &nbsp;&nbsp;&nbsp;&nbsp;2. 비회원 필수항목: 주문자 이름, 주문 결제자 주소, 수취인 이름, 배송지 정보, 연락처, 고객메모
								<br> &nbsp;&nbsp;&nbsp;&nbsp;3. 기타: 주문자 이름, 주문 결제자 주소, 수취인 이름, 배송지 정보, 연락처, 환불요청 시 환불계좌번호 이외 기타 경로를 통하여 추가 정보가 수집될 수 있다.
							</b> <br> 나. 정보수집 방법의 경우 회원가입 시의 정보 및 구매로 인해 전달되는 정보에 의해 수집될 수
							있다. <br>
							<br> <b>제 3조 [개인정보 보유 및 이용기간]</b> <br> <b>관계법령에 따른
								보존할 필요가 있는 경우 회사는 다음과 같이 일정한 기간 동안 회원 개인정보를 보관할 수 있다.</b> <br>

							<b class="text_bar"> 가. 법령에 따라 보존할 필요성이 있다고 판단되는 경우 </b> <br>



							<div class="page-body">

								<div class="tbl_list">
									<table class="list_tbl01" summary="">
										<caption>관리자 리스트 테이블</caption>
										<colgroup>
											<col style="width: 40%;">
											<col style="width: 40%;">
											<col style="width: 14%;">

										</colgroup>
										<thead>
											<tr>
												<th scope="col">항목</th>
												<th scope="col">근거</th>
												<th scope="col">보존기간</th>
											</tr>
										</thead>
										<tbody>



											<tr>
												<td> 대금결제 및 재화 등의 공급에 관한 기록</td>
												<td rowspan="3">전자상거래 등에서의 소비자보호에 관한 법률</td>
												<td style="text-align: center !important;">5년</td>

											</tr>
											<tr>
												<td>계약 또는 청약철회 등에 관한 기록</td>

												<td style="text-align: center !important;">5년</td>

											</tr>
											<tr>
												<td>광고에 관한 기록</td>
												<td style="text-align: center !important;">6개월</td>

											</tr>
											<tr>
												<td>신용정보의 수집, 처리 및 이용 등에 관한 기록</td>
												<td>신용정보의 이용 및 보호에 관한 법률</td>
												<td style="text-align: center !important;">3년</td>

											</tr>
											<tr>
												<td> 소비자의 불만 또는 분쟁처리에 관한 기록</td>
												<td>전자상거래 등에서의 소비자보호에 관한 법률</td>
												<td style="text-align: center !important;">3년</td>

											</tr>
											<tr>
												<td>본인확인에 관한 기록보존</td>
												<td>정보통신망 이용촉진 및 정보보호에 관한 법률 제44조의5 및 시행령 제29조</td>
												<td style="text-align: center !important;">6개월</td>

											</tr>
											<tr>
												<td> 접속에 관한 기록보존</td>
												<td>통신비밀보호법 제15조의2 및 시행령 제41조</td>
												<td style="text-align: center !important;">3개월</td>

											</tr>


										</tbody>
									</table>
								</div>
							</div>
							<br> <b>제 4조 [개인정보 제3자 제공]</b> <br> <b class="text_bar">가.
								회사는 회원들의 개인정보를 개인정보의 수집이용 목적에서 고지한 범위 내에서 사용하며, 회원의 사전 동의 없이 동
								범위를 초과하여 이용하거나 원칙적으로 회원의 개인정보를 제 3자에게 제공하지 않습니다. 단, 아래의 경우에는 예외로
								합니다. </b> <br> <b class="textbar">1) 회원들이 사전에 공개 또는 제3자 제공에
								동의한 경우<br> &nbsp;&nbsp;&nbsp;2) 법령의 규정에 의거하나, 수사, 조사 목적으로
								법령에 정해진 절차와 방법에 따라 수사기관 및 감독 당국의 요구가 있는 경우<br>

							</b> <b class="text_bar">나. 회사가 제공하는 서비스를 통하여 주문 및 결제가 이루어진 경우,
								상담 등 거래 당사자간 원활한 의사소통 및 배송 등 거래이행을 위하여 관련된 정보를 필요한 범위 내에서 거래
								당사자에게 제공합니다.</b> <br> <b class="textbar">1) 운송업체: 주문자 이름,
								수취인 이름 배송지 정보, 연락처<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 그 밖에 개인정보 제3자 제공이 필요한
								경우에는 합당한 절차를 통한 회원의 동의를 얻어 제3자에게 개인정보를 제공할 수 있습니다.
							</b> <br> <b class="text_bar">다. 회사는 회원이 동의한 경우 수집한 개인정보를
								제3자에게 제공할 수 있으며 회원은 이 내역을 거부할 수 있습니다. 다만 관련 편의 제공 (사은품, 할인쿠폰 제공
								등 이벤트 참여) 와 행사 (할인, 적립) 등 이용 목적에 따른 혜택의 제한이 있을 수 있습니다. </b> <br>

							<div class="page-body">

								<div class="tbl_view">
									<table class="view_tbl01" summary="">
										<caption>관리자 리스트 테이블</caption>
										<colgroup>
											<col style="width: 30%;">
											<col style="width: 70%;">

										</colgroup>
										<tbody>
											<tr>
												<th scope="row">제공목적</th>
												<td> 마이카드 이용을 위한 본인확인 및 결제정보 등록</td>
											</tr>
											<tr>
												<th scope="row">제공받는자</th>
												<td>㈜케이에스넷</td>
											</tr>
											<tr>
												<th scope="row">제공정보</th>
												<td>(본인인증정보) 이름, 생년월일, 성별, 내외국인정보, 통신사, 휴대폰번호<br>(결제정보) 카드번호, 유효기간, CVC, 비밀번호 앞2자리</td>
											</tr>
											<tr>
												<th scope="row">보유기간</th>
												<td>수집, 이용동의일로부터 서비스 탈퇴시까지</td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>

							<br> <b>제 5조 [개인정보 처리방침 변경 고지]</b> <br> 상기 개인정보처리방침은
							시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 최소
							7일 전부터 공지사항을 통하여 고지할 것입니다. <br> <br> <b>제 6조
								[휴면계정전환]</b> <br> 장기 미 사용자에 대한 개인정보보호를 위한 휴면계정전환을 실시하는 경우 <br>


							<div class="page-body">

								<div class="tbl_view">
									<table class="view_tbl01" summary="">
										<caption>관리자 리스트 테이블</caption>

										<colgroup>
											<col style="width: 30%;">
											<col style="width: 70%;">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">휴면계정 전환 대상자</th>
												<td>최근 1년 로그인 기록이 없는 회원</td>

											</tr>
											<tr>
												<th scope="row">사용자 통보</th>
												<td>전환 전 30일까지 가입 시 등록된 연락 가능한 매체로 전달 <br>
												</td>

											</tr>
											<tr>
												<th scope="row">시행방법</th>
												<td>휴면계정으로 전환 및 분리 보관 <br>
												</td>

											</tr>
											<tr>
												<th scope="row">관련법령</th>
												<td>정보통신망 이용 촉진 및 정보보호 등에 관한 법률 제 29조 <br>
												</td>

											</tr>



										</tbody>



									</table>
								</div>
								<br>
							</div>



							<b>제 7조 [회원가입 및 탈퇴] </b> <br> 회원가입 시 개인정보처리 <br> <b
								class="textbar">가. 회원가입 시 회사는 사용자의 기본제공 정보를 회원의 동의에 보관할 수
								있다. <br> &nbsp;&nbsp;&nbsp; 단, 사용자가 제공한 개인정보에 대하여 사용자의 동의가
								없는 일방적인 사용은 불가하다.<br> &nbsp;&nbsp;&nbsp;&nbsp;나. 회원가입 시 회사는
								사용자의 정보를 다음과 같은 경우에 사용자 정보를 이용할 수 있다. <br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 마케팅 정보 공유 동의를 얻은 경우 <br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 사용자에게 별도의 사용 동의를 얻은 경우 <br>

							</b> <br> 탈퇴 시 개인정보처리 <br> <b class="textbar">가. 사용자가 본
								플랫폼을 자진 탈퇴하는 경우 회사는 특별한 사유가 없이 탈퇴한 사용자의 개인정보를 수집 및 이용할 수 없다. <br>

								&nbsp;&nbsp;&nbsp;&nbsp;나. 사용자가 본 플랫폼 이용 시 어떠한 사건사고에 의거 자진탈퇴 또는
								강제 탈퇴를 한 경우 회사는 본 사용자의 개인정보를 사건이 해결되는 기간까지 보유할 수 있다.


							</b>





						</div>
									    </div>
                                    </div>
										
                                        <br>
                                 
                                        <div class="rp_checkbox">

                                    <label for="keepLoginCheck1" class="form_check" >
                                        <input type="checkbox" id="keepLoginCheck1" name="agreement">
                                        <span class="form_check_mark"></span>
                                        <label for="keepLoginCheck1" class="custom_text" >개인정보 처리방침 동의 (필수)</label>
                                    </label>
                                        </div>
	                                   <div class="popup_bottom popup_bottom_box">
	                                        <button type="button" class="account_btn_account account_btn_border3">확인</button>
	                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- //#childRegisterPop4 -->
								
								
							</p>
                            <p class="terms_check_item">
                                <label for="mailAgreeCheck" class="form_check">
                                    <input type="checkbox" id="mailAgreeCheck" name="agreement" value="mail">
                                    <span class="form_check_mark"></span>
<!--                                       <label for="mailAgreeCheck" class=" custom_text" >메일 수신 동의 (선택)</label> -->
                                      <label for="mailAgreeCheck" class=" custom_text" >혜택 및 이벤트정보 수신동의(선택)</label>
                                </label>
<!-- 								메일 수신동의 팝업 -->
<!--                             <button type="button" class="pop_open register_submit5" data-popup="childRegisterPop5">내용보기</button> -->
                            <button type="button" class="pop_open register_submit5" data-popup="childRegisterPop6">내용보기</button>


<!-- 메일 수신 동의 -->
<!-- 메일 수신 동의 -->
<!-- 메일 수신 동의 -->
<!-- 메일 수신 동의 -->
<!-- 메일 수신 동의 -->
<!-- 메일 수신 동의 -->
<!-- 메일 수신 동의 -->
<!-- 메일 수신 동의 -->
<!-- 메일 수신 동의 -->
								<div id="childRegisterPop5" class="popup_wrap">
                            <div class="popup_layer"></div>
                            <div class="popup_box">
                                <div class="popup_content register_popup_content5" style="text-align:left;overflow-y: auto;">
<!--                                     <button type="button" class="pop_close"></button> -->
                                    <div class="register_pop_box">
                                        <h4 class="rp_title">메일 수신 동의</h4>
                                        <p class="rp_text">
										<div class="over" style="overflow-y:scroll; height:auto; padding-right: 10px;width:100%">
                                            <div class="leave_text_box"  >
                               주식회사 피플메이드(이하 “회사”)은 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』(이하 “정보통신망법”), 『개인정보 보호법』 등 관련 법령상의 개인정보 보호규정을 준수하며, 정보통신망법에 의거한 개인정보처리방침을 정하여 이용자 권익보호에 최선을 다하고 있습니다. 본 개인정보처리방침은 회사가 제공하는 웹/모바일웹/엡 서비스에 적용되며 다음과 같은 내용을 포함하고 있습니다.
                        <br><br>
                        <b>1. 이용자의 권리 및 행사방법</b>
                        <br>
                        ① 이용자는 언제든지 정보주체로서의 권리(등록되어 있는 본인의 개인정보를 열람, 정정, 동의 철회, 삭제)를 행사할 수 있으며, 아래 사항에 대한 열람, 제공, 정정, 동의 철회, 삭제(탈퇴), 처리 정지, 이의제기 등을 요구할 수 있습니다.
                        <br>
                            1) 회사가 보유하고 있는 이용자의 개인정보
                        <br>
                            2) 회사가 이용자의 개인정보를 이용하거나 제3자에게 제공한 현황
                        <br>
                            3) 이용자가 개인정보 수집·이용·제공 등의 동의를 한 현황
                        <br>
                                - 조회 및 수정 : 로그인 후 마이페이지 > 프로필 수정
                        <br>
                                - 삭제 및 회원탈퇴 : 로그인 후 마이페이지 > 회원탈퇴
                        <br>
                                - 동의 철회(이벤트 정보수신) : 로그인 후 마이페이지 > 설정 변경
                        <br>
                           4) 회사는 관련된 상담 및 문의처리를 위해 별도의 고객센터를 운영하고 있으며, 개인정보 보호책임자에게 이메일 또는 전화로 연락하시면 지체없이 조치하겠습니다.
                        <br>
                        ② 이용자가 개인정보의 오류에 대한 정정을 요청하신 경우, 완료하기 전까지 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다.
                        <br>
                        <br>
                        <b>2. 이용자의 의무</b>
                        <br>
                        이용자는 자신의 개인정보를 보호할 의무가 있으며, 회사의 고의 또는 과실 등 귀책사유 없이 ID/비밀번호 공유, 로그인 상태에서 자리를 비우는 등 이용자의 부주의로 인하여 발생하는 문제에 대해서는 회사가 책임지지 않습니다.
                        <br>
                        ① 이용자는 개인정보를 최신의 상태로 유지해야 하며, 부정확한 정보 입력으로 발생하는 문제의 책임은 이용자 자신에게 있습니다.
                        <br>
                        ② 이용자의 ID/비밀번호는 원칙적으로 본인만 사용하여야 하며 제3자에게 이를 양도하거나 대여할 수 없습니다. 타인의 개인정보를 도용한 회원가입 또는 ID 등을 도용하여 구매한 경우, 회원자격 상실 및 관계 법령에 따라 처벌될 수 있습니다.
                        <br>
                        ③ 이용자의 회사의 서비스를 이용한 후 반드시 계정을 로그아웃하고 웹 브라우저 프로그램을 종료해야 합니다.
                        <br>
                        3. 자동 수집되는 개인정보 및 거부에 관한 사항
                        <br>
                        회사는 이용자 맞춤서비스 등을 제공하기 위하여 쿠키(Cookie)를 설치 및 운영 합니다. 쿠키의 사용 목적과 거부에 관한 사항은 다음과 같습니다.
                        <br>
                        ① 쿠키란 : 쿠키는 웹사이트를 운영하는데 이용되는 서버가 이용자의 브라우저에 보내는 아주 작은 텍스트 파일로 이용자의 컴퓨터에 저장되어 운영됩니다.
                        <br>
                        ② 쿠키의 사용 목적 : 이용자의 접속 빈도나 방문 시간 등의 분석, 이용 형태 및 관심분야 파악, 자취 추적, 각종 이벤트 참여 정도, 방문 횟수 파악 등을 타겟 마케팅 등 개인별 맞춤 서비스를 제공하기 위해 쿠키를 사용 합니다.
                        <br>
                        ③ 쿠키의 설치·운영 및 거부
                        <br>
                           1) 이용자는 쿠키 설치에 대한 선택권을 가지고 있으며, 웹브라우저별 옵션 선택을 통해 모든 쿠키를 허용 또는 거부 하거나, 쿠키가 저장될 때마다 확인을 거치도록 할 수 있습니다. 쿠키 설치 허용여부를 지정하는 방법은 다음과 같습니다.
                        <br>
                                - Internet Explorer : 도구 메뉴 > 인터넷 옵션 > 개인정보 탭 > 개인정보처리 수준 설정
                        <br>
                                - Chrome : 설정 메뉴 > 고급 설정 표시 선택 > 개인정보-콘텐츠 설정 > 쿠키 수준 설정
                        <br>
                                - Firefox : 옵션 메뉴 > 개인정보 > 방문기록 -사용자 정의 설정 > 쿠키 수준 설정
                        <br>
                                - Safari : 환경설정 메뉴 > 개인정보 탭 > 쿠키 및 웹 사이트 데이터 수준 설정
                        <br>
                            2) 단, 쿠키의 저장을 거부하였을 경우에는 로그인이 필요한 서비스 등 일부 서비스 이용에 어려움이 있을 수 있습니다.
                        <br>
                        4. 개인정보 수집항목 및 이용 목적
                    </div>
                                        </div>
										</p>
                                        <br>

                                        <div class="rp_checkbox">
                                        
<!--                                    <label for="keepLoginCheck2" class="form_check"> -->
<!--                                         <input type="checkbox" id="keepLoginCheck2" name="agreement" value="mail"> -->
<!--                                         <span class="form_check_mark"></span> -->
<!--                                           <label for="keepLoginCheck2" class=" custom_text" >메일 수신 동의 (선택)</label> -->
<!--                                     </label> -->
                                        </div>
                                    </div>
                               
                                    <div class="popup_bottom popup_bottom_box">
	                                    <button type="button" class="account_btn_account account_btn_border3">확인</button>
                                    </div>     
                                </div>
                            </div>
                        </div><!-- //#childRegisterPop3 -->
                        
                        
<!-- 혜택 및 이벤트정보 수신동의(선택) -->
<!-- 혜택 및 이벤트정보 수신동의(선택) -->
<!-- 혜택 및 이벤트정보 수신동의(선택) -->
<!-- 혜택 및 이벤트정보 수신동의(선택) -->
<!-- 혜택 및 이벤트정보 수신동의(선택) -->
<!-- 혜택 및 이벤트정보 수신동의(선택) -->
								<div id="childRegisterPop6" class="popup_wrap">
                            <div class="popup_layer"></div>
                            <div class="popup_box">
                                <div class="popup_content register_popup_content5" style="text-align:left;overflow-y: auto;">
<!--                                     <button type="button" class="pop_close"></button> -->
                                    <div class="register_pop_box">
                                        <h4 class="rp_title">혜택 및 이벤트정보 수신동의</h4>
                                        <p class="rp_text">
											<div class="over" style="overflow-y:scroll; height:auto; padding-right: 10px;width:100%">
	                                            <div class="leave_text_box"  >
	                               
							                        1. 정보내용: 공지사항 및 이벤트 및 할인 등의 회원혜택 정보를 받으실 수 있습니다.
							                        <br>
							                        2. 수신방식: 문자/이메일
							                        <br><br>
							                        * 수신설정변경은 로그인 후 내정보관리에서 가능합니다.
							                        
							                    </div>
	                                        </div>
										</p>
                                        <br>

                                        <div class="rp_checkbox">
                                        
                                   <label for="keepLoginCheck2" class="form_check">
                                        <input type="checkbox" id="keepLoginCheck2" name="agreement" value="mail">
                                        <span class="form_check_mark"></span>
                                          <label for="keepLoginCheck2" class=" custom_text" >혜택 및 이벤트정보 수신동의</label>
                                    </label>
                                        </div>
                                    </div>
                               
                                    <div class="popup_bottom popup_bottom_box">
	                                    <button type="button" class="account_btn_account account_btn_border3">확인</button>
                                    </div>     
                                </div>
                            </div>
                        </div><!-- //#childRegisterPop3 -->
								
								<!-- 추후 사용할 것 지우지 마시오 -->
<!-- 								<p class="terms_check_item"> -->
<!-- 	 								<input type="checkbox" id="pushAgreeCheck"  name="agreement"  class="custom_check" value="push"> -->
<!-- 	                                <label for="pushAgreeCheck" class="custom_label"></label> -->
<!-- 	                                <label for="pushAgreeCheck" class="custom_text" >푸시 알람 수신 동의 (선택)</label> -->
<!-- 							    </p> -->

<!-- 								<p class="terms_check_item"> -->
<!-- 	                                <label for="msgAgreeCheck" class="form_check"> -->
<!-- 	 									<input type="checkbox" id="msgAgreeCheck"  name="agreement"  class="custom_check" value="msg"> -->
<!-- 	 									<span class="form_check_mark"></span> -->
<!-- 	                                	<label for="msgAgreeCheck" class="custom_text" >문자 수신 동의 (선택)</label> -->
<!-- 	                                </label> -->
<!-- 							    </p> -->
							    
	                            <p class="terms_check_item">
	                               <label for="accountSaveCheck" class="form_check">
	                                   <input type="checkbox" id="accountSaveCheck" name="agreement" value="account">
	                                   <span class="form_check_mark"></span>
	                                    <label for="accountSaveCheck" class="custom_text">장기간 미접속시에도 계정 활성 상태 유지 (선택)</label>
	                               </label>
	                            </p>
								
							<div class="register_submit_box3">
                         	   <button type="button"  class=" register_submit" onclick="fn_validateRegist();">14세 미만 회원가입</button>
                         	   <button type="button" class="pop_open register_submit2" onclick="fn_BtnRegist();" data-popup="childRegisterPop2">14세 이상 회원가입</button>
                      	  </div>
                        </div>

                        <!-- 팝업 -->
                        <div id="childRegisterPop" class="popup_wrap">
                            <div class="popup_layer"></div>
                            <div class="popup_box">
                                <div class="popup_content register_popup_content tablets_register_popup_content phones_register_popup_content">
<!--                                     <button type="button" class="pop_close"></button> -->
                                    
                                    <div class="register_pop_box">
                                        <h4 class="rp_title">보호자(법정대리인) 동의</h4>
                                        <p class="rp_text">
                                            14세 미만의 어린이 및 청소년은 회원가입을 위하여 보호자(법정대리인)의 동의가 필요합니다.
                                            보호자(법정대리인) 정보는 회원가입 동의를 위한 목적으로만 수집되며, 가입완료시 안내 e-mail이 발송됩니다.
                                        </p>

                                        <div class="rp_box tablets_rp_box phones_rp_box">
                                            <p class="rp_box_item tablets_rp_box_item phones_rp_box_item">
                                                <label for="" class="rp_label tablets_rp_label phones_rp_label">보호자 성명</label>
                                                <input type="text" class="rp_input" placeholder="홍길동" name="USER_PARENT_NM">
                                            </p>
                                            <p class="rp_box_item tablets_rp_box_item phones_rp_box_item">
                                                <label for="" class="rp_label tablets_rp_label phones_rp_label">생년월일</label>
                                                <input type="date" class="rp_input" placeholder="ex)19790101" name="USER_PARENT_BIRTH"   value="1970-01-01" min="1900-01-01" max="2020-12-31">
                                            </p>
                                            <p class="rp_box_item tablets_rp_box_item phones_rp_box_item">
                                                <label for="" class="rp_label tablets_rp_label phones_rp_label">e-mail</label>
                                                <input type="text" class="rp_input" placeholder="ex)abc@gmail.net" name="USER_PARENT_EMAIL">
                                            </p>
                                        </div>

                                        <span class="rp_sub">
                                            *보호자(법정대리인)정보를 잘못 기재하여 발생하는 문제에 대해서는 가입자 본인의 귀책사유임을 안내 드립니다.
                                        </span>
                                        <div class="rp_checkbox">
                                        
                                   <label for="legalAgreement" class="form_check">
                                        <input type="checkbox" id="legalAgreement">
                                        <span class="form_check_mark"></span>
                                        <label for="legalAgreement" class="custom_sq_text">[필수] 14세미만 자녀의 회원가입에 동의합니다.</label> 
                                    </label>
                                        </div>
                                    </div>
                                    <div> <input id="emailCode" class="account_input" placeholder="이메일 인증 코드를 입력해주세요" style="display: none;margin-top: 20px;"> </div>

                                   <div class="popup_bottom popup_bottom_box">
                                        <button type="button" onclick="chkLegalAree();" name="legalAgreement" class="apply_pop_btn" style="display: none;">인증확인</button>
                                        <button type="button" onclick="reSendLegalAgree();" name="legalAgreement" class="apply_pop_btn" style="display:none;">재전송</button>
                                        <button type="button" onclick="legalAgree();" id="agreeBtn" class="account_btn_account account_btn_border4 account_btn_account_t">약관동의</button>
                                        <button type="button" class=" account_btn_account2 account_btn_border3" >취소</button>
                                    </div>
                                </div>
                            </div>
                        </div><!-- //#childRegisterPop -->

                        <!-- 팝업 -->
                        <div id="termsAgreePop" class="popup_wrap">
                            <div class="popup_layer"></div>
                            <div class="popup_box">
                                <div class="popup_content register_popup_content">
<!--                                     <button type="button" class="pop_close"></button> -->
                                    
                                    <div class="register_pop_box">
                                        <h4 class="rp_title rp_title_border">이용약관</h4>
                                        <p class="rp_text">
                                            약관내용
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div><!-- //#termsAgreePop -->

                        <!-- 팝업 -->
                        <div id="privacyAgreePop" class="popup_wrap">
                            <div class="popup_layer"></div>
                            <div class="popup_box">
                                <div class="popup_content register_popup_content">
<!--                                     <button type="button" class="pop_close"></button> -->
                                    
                                    <div class="register_pop_box">
                                        <h4 class="rp_title rp_title_border">개인정보취급방침</h4>
                                        <p class="rp_text">
                                            개인정보취급방침내용
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div><!-- //#privacyAgreePop -->

                        <!-- 팝업 -->
                        <div id="EmailAgreePop" class="popup_wrap">
                            <div class="popup_layer"></div>
                            <div class="popup_box">
                                <div class="popup_content register_popup_content">
<!--                                     <button type="button" class="pop_close"></button> -->
                                    
                                    <div class="register_pop_box">
                                        <h4 class="rp_title rp_title_border">이메일수신</h4>
                                        <p class="rp_text">
                                            이메일수신내용
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div><!-- //#EmailAgreePop -->
                    </div>
                </div>

                <hr class="account_sepa account_sepa_big">

                <button id="create-kakao-login-btn" type="button" class="sns_btn kakao_btn" >카카오계정으로 로그인</button>
                <div id="naverIdLogin" class="sns_btn naver_btn"></div>
                <button id="googleLoginBtn" type="button" class="sns_btn google_btn phones_google_btn tablets_google_btn" onclick="startApp();">구글계정으로 로그인</button>

                <div class="account_bd_box">
                    <span class="regi_login_text">이미 계정이 있으신가요?</span>
                    <a href="/front/account/login" class="regi_login_link">기존 계정으로 로그인하기</a>
                </div>
            </div><!-- //.account_double_box  -->
        </div>
    </div><!-- // #container -->

<script src="//cdn.rawgit.com/placemarker/jQuery-MD5/master/jquery.md5.js"></script>
<script type="text/javascript">
$(function(){
	
	fn_SelectOption("", "CAT", "PARENT_CODE_ID");

// 	약관 닫기
	$('.account_btn_border3').on( 'click', function(){
        $('.popup_wrap').hide();
    });

	$( '#now_loading' ).hide();
	
});

$("[name=PARENT_CODE_ID]").on('change',function(k){
	fn_SelectOption($(this).val(), "CAT", "CODE_ID");
});

var pwTypeChange1 = 0;
var pwTypeChange2 = 0;

$('#pwTypeChange1').change(function(){
	if( $(this).prop('checked') ) $('[name=USER_PW]').attr('type','text');
	else $('[name=USER_PW]').attr('type','password');
	
	//비밀번호 아이콘 변경
	if( $('.pwTypeChange1 span i').hasClass('fa-eye') ) {
		$('.pwTypeChange1 span i').removeClass('fa-eye');
		$('.pwTypeChange1 span i').addClass('fa-eye-slash');
	} else {
		$('.pwTypeChange1 span i').removeClass('fa-eye-slash');
		$('.pwTypeChange1 span i').addClass('fa-eye');
	}
});

$('#pwTypeChange2').change(function(){
	if( $(this).prop('checked') ) $('[name=USER_PW_CONFIRM]').attr('type','text');
	else $('[name=USER_PW_CONFIRM]').attr('type','password');

	//비밀번호 아이콘 변경
	if( $('.pwTypeChange2 span i').hasClass('fa-eye') ) {
		$('.pwTypeChange2 span i').removeClass('fa-eye');
		$('.pwTypeChange2 span i').addClass('fa-eye-slash');
	} else {
		$('.pwTypeChange2 span i').removeClass('fa-eye-slash');
		$('.pwTypeChange2 span i').addClass('fa-eye');
	}
});

// 키워드 추가해줌
function addKeyw(){
	if ( $('[name=CODE_ID]').val() != '' ) {
		var isc = true;
		$('#addKeywTarget > span').each(function(k){
			if (this.id == $('[name=CODE_ID]').val())
				isc = false;
		});
		
		if (isc ) 		// span X 표시는 로마자 Ⅹ 임 ㅈ 한자 3번째탭 3		
			$('#addKeywTarget').append('<span class="mr10" id="'+$('[name=CODE_ID]').val()+'">'+'#'+$('[name=PARENT_CODE_ID] option:checked').text()+'#'+$('[name=CODE_ID] option:checked').text()+'<span class="fn_delKeyword">Ⅹ</span></span>');
	}else{
		clickPopupEvent('.double_check_btn',{
		      popupType : 'alert',
		      popupMsg: '관심분야를 선택해주세요.',
		      beforePopup: function(thisBtn){
		      return 'ALERT';
		      }
		});
	}
}

$(document).on('click','.dubleBtn',dubleBtn);
// 중복확인 3개 공통
function dubleBtn(){
	var targetNm = $(this).siblings('input').attr('name').replace('USER_','');
	var msg = "";
	if (targetNm == "NICK") {
		fn_BtnDupl( $('[name=USER_NICK]').val() , targetNm);
		msg = "닉네임";
	}else if (targetNm == "EMAIL") {
		if (fn_emailTest( $('[name=USER_EMAIL]').val() )) {
			dupleChk = false;
			return alert('이메일 형식이 아닙니다.');
		}else{
			fn_BtnDupl( $('[name=USER_EMAIL]').val() , targetNm);
		}
		msg = "이메일";
	}else if (targetNm == "PHONE2") {
		var phone = "";
		var isPhone = true;
		$('[name^=USER_PHONE]').each(function(k){
			if (this.value != '') 
				phone += this.value;
			else
				isPhone = false;
		});
		msg = "전화번호";
		if (isPhone) {
			fn_BtnDupl( phone , targetNm);
		}else{
			dupleChk = false;
			return alert('전화번호가 제대로 입력되지 않았습니다.');
		}
	}
	
	if( idIsc ){
		if (targetNm == "NICK") {
			dupleNickChk = true;
		}else if (targetNm == "EMAIL") {
			dupleMailChk = true;
		}else if (targetNm == "PHONE2") {
			duplePhoneChk = true;
		}
		alert('사용 가능한 '+msg+'입니다.');
	}else{
		if (targetNm == "NICK") {
			dupleNickChk = false;
		}else if (targetNm == "EMAIL") {
			dupleMailChk = false;
		}else if (targetNm == "PHONE2") {
			duplePhoneChk = false;
		}
		alert('이미 등록된 '+msg+'입니다.');
	}
	
}

$(document).on('change', '[name=USER_PW]', pwReg);
$(document).on('change', '[name=USER_PW_CONFIRM]', pwConfirm);
$('[name=USER_EMAIL]').on('change', function(){ dupleMailChk = false; });
$('[name^=USER_PHONE]').on('change', function(){ duplePhoneChk = false; });
$('[name=USER_NICK]').on('change', function(){ dupleNickChk = false; });

function pwReg(){
	if( fn_pwTest(this.value) ){
		$(this).siblings('span').remove();
		$(this).parent().append('<span class="red" style="display:inline-block;">비밀번호 형식이 일치하지 않습니다.</span>');		
		pwRegChk = false;
	}else{
		$(this).siblings('span').remove();
		pwRegChk = true;
	}
		pwConfirm();
}

function pwConfirm(){

	if ( $('[name=USER_PW]').val() === $('[name=USER_PW_CONFIRM]').val() ){
		$('[name=USER_PW_CONFIRM]').siblings('span').remove();
		pwConfirmChk = true;
	}
	else{
		$('[name=USER_PW_CONFIRM]').siblings('span').remove();
		$('[name=USER_PW_CONFIRM]').parent().append('<span class="red" style="display:inline-block;">비밀번호가 일치하지 않습니다</span>');		
		pwConfirmChk = false;
	}
}

$('#all').click(function(){
	if( $(this).prop('checked') ) $('[name=agreement]').prop('checked', true);
	else $('[name=agreement]').prop('checked', false);
});

$('[name=agreement]').click(function(){
	$('[name=agreement]').each(function(key,val){
		if( $(this).val() == "" ) $(this).attr('checked', false); 
	});
	
	var legnth = $('[name=agreement]').not('[id^=keepLoginCheck]').length;
	console.log( legnth );
	var legnthCk = $('[name=agreement]:checked').not('[id^=keepLoginCheck]').length;
	console.log( legnthCk );
	if( legnth == legnthCk ) $("#all").prop("checked",true);
	else $("#all").prop("checked",false);
});

$(document).on('click', '#termsAgreeCheck, #keepLoginCheck', function(){
	if( $(this).prop('checked') ){
		$('#termsAgreeCheck').prop('checked', true);
		$('#keepLoginCheck').prop('checked', true);
	}
	else{
		$('#termsAgreeCheck').prop('checked', false);
		$('#keepLoginCheck').prop('checked', false);
	}
});


$(document).on('click', '#mailAgreeCheck, #keepLoginCheck2', function(){
	if( $(this).prop('checked') ){
		$('#mailAgreeCheck').prop('checked', true);
		$('#keepLoginCheck2').prop('checked', true);
	}
	else{
		$('#mailAgreeCheck').prop('checked', false);
		$('#keepLoginCheck2').prop('checked', false);
	}
});


$(document).on('click', '#userAgreeCheck, #keepLoginCheck1', function(){
	if( $(this).prop('checked') ){
		$('#userAgreeCheck').prop('checked', true);
		$('#keepLoginCheck1').prop('checked', true);
	}
	else{
		$('#userAgreeCheck').prop('checked', false);
		$('#keepLoginCheck1').prop('checked', false);
	}
});

// 일반 회원가입 유효값 필요 변수
var dupleNickChk = false;
var dupleMailChk = false;
var duplePhoneChk = false;
var pwRegChk = false;
var pwConfirmChk = false;
// 일반 회원가입
function fn_BtnRegist(){
	
	var phone = "";
	var isPhone = true;
	
		if( $('[name=USER_NM]').val().trim() == '' ) return alert('이름을 입력해 주세요.');
		if( $('[name=USER_NICK]').val().trim() == '' ){
			dupleNickChk = false;
			return alert('닉네임을 입력해 주세요.');
		}
		if( !dupleNickChk ) return alert('닉네임 중복확인이 완료되지 않았습니다.');
	
		
		if( $('[name=USER_EMAIL]').val().trim() == '' ){
			dupleMailChk = false;
			return alert('이메일 주소를 입력해 주세요.');
		}
		if( !dupleMailChk ) return alert('이메일 주소 중복확인이 완료되지 않았습니다.');
		
		$('[name^=USER_PHONE]').each(function(k){
			if (this.value != '') 
				phone += this.value;
			else
				isPhone = false;
		});
		if ( !isPhone ){
			duplePhoneChk = false;
			return alert('전화번호를 입력해주세요.');
		}
		if( !duplePhoneChk ) return alert('전화번호 중복확인이 완료되지 않았습니다.');
		
		
		if( $('[name=USER_PW]').val().trim() == '' ) return alert('비밀번호를 입력해주세요.');
		if( $('[name=USER_PW_CONFIRM]').val().trim() == '' ) return alert('비밀번호 확인을 입력해주세요.');
		
		if ( !pwRegChk ) return alert('비밀번호 형식에 맞게 문자, 숫자 포함 8자 이상으로 작성해야 합니다.');
		if ( !pwConfirmChk ) return alert('비밀번호가 일치하지 않습니다.');
		
		if ( $('#termsAgreeCheck').is(":checked") == false ) return alert('서비스 이용약관에 동의해주셔야 합니다.'); 
		if ( $('#userAgreeCheck').is(":checked") == false ) return alert('개인정보 처리방침에 동의해주셔야 합니다.'); 
	
	
		
		
		var params = unit_getParams('insertAccount');
		params.status = "WRITE";
		params.query = "insertFrontAccountData";
		
		params.USER_PHONE = phone;
		params.USER_PW = $.md5( $('[name=USER_PW]').val().trim() );
		params.USER_PW_CONFIRM = $.md5( $('[name=USER_PW_CONFIRM]').val().trim() );
		
		let keyw = "";
		$('#addKeywTarget > span').each(function(k){
			if (keyw == "") keyw = this.id;
			else keyw += ','+this.id;
		});
		
		params.USER_KEYW = keyw;
		params.USER_LONG_NON_CONN_YN = 'N';
		params.USER_MAIL_YN = 'N';
		params.USER_PUSH_YN = 'N';
		params.USER_SMS_YN = 'N';
		
		params.USER_PARENT_EMAIL = USER_PARENT_EMAIL;
		params.USER_PARENT_BIRTH = USER_PARENT_BIRTH;
		params.USER_PARENT_NM = USER_PARENT_NM;
		
			
	// 		params.USER_SNS_TYPE = USER_SNS_TYPE;
		
		
		
		if ( $('#accountSaveCheck').is(":checked") ) 		params.USER_LONG_NON_CONN_YN = 'Y';
		
		if ( $('#mailAgreeCheck').is(":checked") )		params.USER_MAIL_YN = 'Y';
		
		if ( $('#pushAgreeCheck').is(":checked") )		params.USER_PUSH_YN = 'Y';
		
		if ( $('#msgAgreeCheck').is(":checked") )		params.USER_SMS_YN = 'Y';
			
		var result = fn_DataAjax2( params );
	
		if ( result.out.resultCnt > 0 ) {
			alert('회원가입이 완료되었습니다.');
				
			//	 	1. 유효성 검사를 위한 파라미터값
				var params = new Object();
				params.userEmail = $('[name=USER_EMAIL]').val().trim();
				params.userPw =  $.md5( $('[name=USER_PW]').val().trim() );
				params.status = "CHECK";
				params.query = "selectFrontLoginCheck";
				
			//	2. 유효성 검사 서비스로 이동
				var result = fn_DataAjax2( params );
				if ( unit_isComplete(result) ){
				
					var jsonDetail = result.out.detail.data;
					if( !jsonDetail.length ) return alert("아이디 혹은 비밀번호를 입력해주세요.");
	
					var params = new Object();
					params.status = "WRITE";
					params.query = "insertFrontJoinCoup";
					params.USER_IDX = jsonDetail[0].USER_IDX;
					
					fn_DataAjax2( params );
					
					localStorage.setItem("frontLoginIdx", jsonDetail[0].USER_IDX ); 
					localStorage.setItem("frontLoginId", jsonDetail[0].USER_EMAIL ); 
					localStorage.setItem("frontUserType", jsonDetail[0].USER_TYPE ); 
					localStorage.setItem("frontLoginNm", jsonDetail[0].USER_NM ); 
					localStorage.setItem("frontLoginNick", jsonDetail[0].USER_NICK ); 
					localStorage.setItem("frontLoginUuid", jsonDetail[0].USER_UUID ); 
					
					location.href='/front/main/index';
				}
			
			
		}
	
		
}

$('[name=USER_PARENT_EMAIL]').on('change',function(){
	if (fn_emailTest( this.value )) {
		this.value='';
		return alert('이메일 형식이 아닙니다.');
	}
});

var USER_PARENT_EMAIL = "";
var USER_PARENT_BIRTH = "";
var USER_PARENT_NM = "";
var USER_PARENT_ACC_YN = "";
var EMAILCODE = "";
function legalAgree(){
	
	var phone = "";
	var isPhone = true;
	
		if( $('[name=USER_NM]').val().trim() == '' ) return alert('이름을 입력해 주세요.');
		if( $('[name=USER_NICK]').val().trim() == '' ){
			dupleNickChk = false;
			return alert('닉네임을 입력해 주세요.');
		}
		if( !dupleNickChk ) return alert('닉네임 중복확인이 완료되지 않았습니다.');
	
		
		if( $('[name=USER_EMAIL]').val().trim() == '' ){
			dupleMailChk = false;
			return alert('이메일 주소를 입력해 주세요.');
		}
		if( !dupleMailChk ) return alert('이메일 주소 중복확인이 완료되지 않았습니다.');
		
		$('[name^=USER_PHONE]').each(function(k){
			if (this.value != '') 
				phone += this.value;
			else
				isPhone = false;
		});
		if ( !isPhone ){
			duplePhoneChk = false;
			return alert('전화번호를 입력해주세요.');
		}
		if( !duplePhoneChk ) return alert('전화번호 중복확인이 완료되지 않았습니다.');
		
		
		if( $('[name=USER_PW]').val().trim() == '' ) return alert('비밀번호를 입력해주세요.');
		if( $('[name=USER_PW_CONFIRM]').val().trim() == '' ) return alert('비밀번호 확인을 입력해주세요.');
		
		if ( !pwRegChk ) return alert('비밀번호 형식에 맞게 문자, 숫자 포함 8자 이상으로 작성해야 합니다.');
		if ( !pwConfirmChk ) return alert('비밀번호가 일치하지 않습니다.');
		
		if ( $('#termsAgreeCheck').is(":checked") == false ) return alert('서비스 이용약관에 동의해주셔야 합니다.'); 
		if ( $('#userAgreeCheck').is(":checked") == false ) return alert('개인정보 처리방침에 동의해주셔야 합니다.'); 
	
		
	
	
	
		if ( !$('#legalAgreement').is(':checked') )
			return alert('만 14세 미만의 어린이 및 청소년은 \n보호자(법정대리인) 동의가 되어야만 가입이 가능합니다.');
		if ( $('[name=USER_PARENT_NM]').val() == null || $('[name=USER_PARENT_NM]').val() == '' ) {
			return alert('보호자 성명을 입력해주세요.');
		}
		if ( $('[name=USER_PARENT_BIRTH]').val() == null || $('[name=USER_PARENT_BIRTH]').val() == '' ) {
			return alert('보호자 생년월일을 입력해주세요.');
		}
		if ( $('[name=USER_PARENT_EMAIL]').val() == null || $('[name=USER_PARENT_EMAIL]').val() == '' ) {
			return alert('보호자 이메일을 입력해주세요.');
		}
		if (fn_emailTest( $('[name=USER_PARENT_EMAIL]').val() )) {
			$('[name=USER_PARENT_EMAIL]').val('');
			return alert('이메일 형식이 아닙니다.');
		}
		
		USER_PARENT_EMAIL = $('[name=USER_PARENT_EMAIL]').val();
		USER_PARENT_BIRTH = $('[name=USER_PARENT_BIRTH]').val();
		USER_PARENT_NM = $('[name=USER_PARENT_NM]').val();
		
		var params = new Object();
		params.status = "JOIN_MAIL";
		params.USER_PARENT_EMAIL = USER_PARENT_EMAIL;
		params.USER_PARENT_NM = USER_PARENT_NM;
		params.USER_PARENT_BIRTH = USER_PARENT_BIRTH;
		params.CODE = fn_GetUuid().substring(20, 27);
		fn_DataAjax2( params );
		
		EMAILCODE = params.CODE;
		
		$('#emailCode').show();
		$('#agreeBtn').hide();
		$('[name=legalAgreement]').show();
		
		alert('인증 이메일이 발송되었습니다.');
	
	
	
}

function reSendLegalAgree(){
	var params = new Object();
	params.status = "JOIN_MAIL";
	params.USER_PARENT_EMAIL = USER_PARENT_EMAIL;
	params.USER_PARENT_NM = USER_PARENT_NM;
	params.USER_PARENT_BIRTH = USER_PARENT_BIRTH;
	params.CODE = fn_GetUuid().substring(21, 28);
	fn_DataAjax2( params );
	
	EMAILCODE = params.CODE;
	alert('인증 이메일이 발송되었습니다.');
}

function chkLegalAree(){
	
	if( $('#emailCode').val() == EMAILCODE ){
		fn_BtnRegist();
	}else{
		return alert('이메일 인증번호가 다릅니다.');
	}

// 	$('.popup_wrap').hide();
// 	fn_BtnRegist();
}

function fn_validateRegist(){
	
	var phone = "";
	var isPhone = true;
	
		if( $('[name=USER_NM]').val().trim() == '' ) return alert('이름을 입력해 주세요.');
		if( $('[name=USER_NICK]').val().trim() == '' ){
			dupleNickChk = false;
			return alert('닉네임을 입력해 주세요.');
		}
		if( !dupleNickChk ) return alert('닉네임 중복확인이 완료되지 않았습니다.');
	
		
		if( $('[name=USER_EMAIL]').val().trim() == '' ){
			dupleMailChk = false;
			return alert('이메일 주소를 입력해 주세요.');
		}
		if( !dupleMailChk ) return alert('이메일 주소 중복확인이 완료되지 않았습니다.');
		
		$('[name^=USER_PHONE]').each(function(k){
			if (this.value != '') 
				phone += this.value;
			else
				isPhone = false;
		});
		if ( !isPhone ){
			duplePhoneChk = false;
			return alert('전화번호를 입력해주세요.');
		}
		if( !duplePhoneChk ) return alert('전화번호 중복확인이 완료되지 않았습니다.');
		
		
		if( $('[name=USER_PW]').val().trim() == '' ) return alert('비밀번호를 입력해주세요.');
		if( $('[name=USER_PW_CONFIRM]').val().trim() == '' ) return alert('비밀번호 확인을 입력해주세요.');
		
		if ( !pwRegChk ) return alert('비밀번호 형식에 맞게 문자, 숫자 포함 8자 이상으로 작성해야 합니다.');
		if ( !pwConfirmChk ) return alert('비밀번호가 일치하지 않습니다.');
		
		if ( $('#termsAgreeCheck').is(":checked") == false ) return alert('서비스 이용약관에 동의해주셔야 합니다.'); 
		if ( $('#userAgreeCheck').is(":checked") == false ) return alert('개인정보 처리방침에 동의해주셔야 합니다.'); 
	
	$('.popup_wrap').hide();
    $('#childRegisterPop').show();
}

$(document).on('click', '.fn_delKeyword', function(){
	$(this).parent().remove();
});

</script>
