<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<style>
table.list_tbl01 > tbody > tr > td {background-color: #333;}
table.view_tbl01 > tbody > tr > td {background-color: #333;}
</style>

<div id="container" style="word-break: keep-all;">
	<div class="section_inner">
		<section>
			<div class="section_inner">
				<div class="breadcrumb">
					<span>홈</span> <span>서비스 이용약관</span> <span>개인정보처리</span>
				</div>
				<h2 class="page_title">개인정보처리</h2>
			</div>
		</section>

		<div class="lnb">
			<div class="">
				<ul>
					<li class="lnb_item"><a href="/front/service/terms">서비스 약관</a></li>
					<li class="lnb_item"><a href="/front/service/terms2">취소/환불</a></li>
					<li class="lnb_item is-active"><a href="/front/service/terms3">개인정보처리</a></li>
					<li class="lnb_item"><a href="/front/service/terms4">책임한계와
							법적고지</a></li>
				</ul>
			</div>
		</div>
		<section class="section_last">
			<div class="">
				<div class="account_double_box">
					<h3 class="account_title account_title_big"
						id="account_title_header">개인정보 처리 방침</h3>

					<div class="register_box leave_box" style="max-width: none;">
						<div class="leave_text_box">
							<b>제 1조 [개인정보 수집이용 목적]</b><br> <b class="textbar">가. 회사의
								개인정보 수집 목적은 본인확인, 회원관리, 최적화된 개인 맞춤화 서비스 등을 제공하기 위함이며, 회사는 서비스 제공을 원활하게 하기 위해 필요한
								최소한의 정보만을 수집합니다. <br> &nbsp;&nbsp;&nbsp;&nbsp;나. 서비스 이용에 따른
								대금결제, 물품배송 및 환불 등에 필요한 정보를 추가로 수집할 수 있습니다. <br>
								&nbsp;&nbsp;&nbsp;&nbsp;다. 회사는 개인정보를 수집, 이용목적 이외에 다른 용도로 이용하거나
								회원의 동의 없이 제3자에게 이를 제공하지 않습니다. <br>



							</b><br> <b>제 2조 [개인정보 수집항목 및 방법]</b> <br> 가. 개인정보 수집항목은 회원, 비회원 그리고 기타에 따른 구분에 의거하여 정보가 수집될 수 있다. <br>
							<!--                        <b class="text_bar">가. 본 약관 및 피플메이드에서 제공하는 서비스에서의 용어 정의.</b> -->

							<b class="textbar">1. 회원 필수항목:  성명, 이메일, 비밀번호, 휴대폰번호,  카카오 ID 및 카카오에서 제공하는 정보, 네이버 ID 및 네이버에서 제공하는 정보, 구글 ID 및 구글에서 제공하는 정보, 만14세 미만 회원의 법정대리인 확인 정보
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
				<!-- //.account_double_box  -->
			</div>
		</section>
	</div>
</div>
<!-- // #container -->

<script>
	$(document).ready(function() {

		lnbEvent();
		$('#now_loading').hide();
	});

	function lnbEvent(){
	    var $lnb = $('.lnb');
	    var $lnbItems = $lnb.find('.lnb_item');
	    
	    $lnbItems.each(function(i,e){
	        if($(e).hasClass('is-active')){
	            $lnb.scrollLeft( $(e).offset().left-100 );
	        }
	    });
	    
	    $lnbItems.on('mouseenter', function(e){
	        $lnb.stop().animate({scrollLeft: $(this).offset().left-100}, 1000);
	    });
	    
	}
</script>

