<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />


<div id="container" style="word-break: keep-all;">
	<div class="section_inner">
		<section>
			<div class="section_inner">
				<div class="breadcrumb">
					<span>홈</span> <span>서비스 이용약관</span> <span>서비스 약관</span>
				</div>
				<h2 class="page_title">서비스 이용약관</h2>
			</div>
		</section>

		<div class="lnb">
			<div class="">
				<ul>
					<li class="lnb_item"><a href="/front/service/terms">서비스 약관</a></li>
					<li class="lnb_item"><a href="/front/service/terms2">취소/환불</a></li>
					<li class="lnb_item"><a href="/front/service/terms3">개인정보처리</a></li>
					<li class="lnb_item is-active"><a href="/front/service/terms4">책임한계와
							법적고지</a></li>
				</ul>
			</div>
		</div>

		<section class="section_last">
			<div class="">
				<div class="account_double_box">
					<h3 class="account_title account_title_big"
						id="account_title_header">책임한계와 법적고지</h3>

					<div class="register_box leave_box" style="max-width: none;">
						<div class="leave_text_box">

							<b>피플메이드는 회원 및 일반 이용자들이 피플메이드 플랫폼에서 제공하는 각종 정보와 서비스를 이용하는데 있어
								유의하여야 할 사항들을 다음과 같이 고지 합니다.</b> <br> <b class="textbar"> <br>
								· 피플메이드는 회원 및 전문가들로부터 다양한 정보와 교육 컨텐츠를 제공받고 있습니다. <br>·
								피플메이드 및 정보제공자가 제공하는 이들의 정보에서 발생하는 오류나 서비스의 지연에 대해 피플메이드는 회사의 고의
								또는 중과실이 있는 경우를 제외하고 어떠한 책임도 지지 않습니다. <br>· 피플메이드가 직접 개설 또는
								주최/주관하는 클래스/행사/교육 이외에 회원이 개설한 클래스/행사/교육의 컨텐츠 및 상품은 피플메이드의 통제 권한
								밖에서 제작되었습니다. <br>· 피플메이드의 통제 권한 밖에서 제작된 컨텐츠의 경우 컨텐츠의 내용이 제3
								자에 의하여 개발되었으므로 피플메이드의 책임여부와는 무관하며, 사이트 내에 수록된 자료의 정확성이나, 상표법,
								저작권법 등의 관계법령의 준수 여부에 대하여 회사의 고의 또는 중과실이 있는 경우를 제외하고 어떠한 책임도 지지
								않습니다. <br>· 피플메이드의 결제수단을 이용하지 않는 클래스는 피플메이드의 통제 권한 밖에서 운영되는
								교육입니다. <br>· 피플메이드는 클래스 개설자와 클래스 수강자간의 사고가 발생하지 않게 하기 위해서
								피플메이드 결제수단을 제공하고 이용을 독려하고 있습니다. 클래스 개설자가 소유 또는 관리하는 통장입금을 통해서
								수강자가 직접 입금을 한 경우에는 피플메이드의 통제 권한이 닿지 못하는 관계로 보호해드릴 수 없습니다. <br>·
								이용자는 피플메이드의 서비스를 통하여 욕설, 비방, 외설, 폭력적 내용의 표현, 허위정보 유포, 바이러스 등의 유포
								등의 행위를 하여서는 안됩니다. <br>· 이러한 내용을 담고 있거나 담고 있을 것이라고 의심되는 게시물
								또는 링크 등은 사전통보 없이 수정 또는 삭제 조치될 수 있으며, 그 정도에 따라 회원탈퇴 및 기소 등의 조치가
								취해질 수도 있습니다. <br>· 이용자는 다량의 정보를 전송, 혹은 동일한 또는 유사한 내용의 정보를
								반복 게시하여 피플메이드 서비스의 안정적인 운영을 방해하는 행위를 하여서는 안됩니다. <br>· 이러한
								내용을 담고 있거나 담고 있을 것이라고 의심되는 게시물이나 링크 등은 사전통보 없이 수정 또는 삭제 조치될 수
								있으며, 그 정도에 따라 회원탈퇴 및 기소 등의 조치가 취해질 수도 있습니다. <br>· 광고성 정보를
								수신자의 의사에 반하여 전자우편/쪽지/기타 다양한 커뮤니케이션 채널을 통해 지속적으로 전송 또는 게시판에 게시하여
								다른 이용자의 서비스 이용을 방해하는 행위를 하여서는 안됩니다. <br>· 이러한 내용을 담고 있거나 담고
								있을 것이라고 의심되는 게시물이나 링크 등은 사전통보 없이 수정 또는 삭제 조치될 수 있으며, 그 정도에 따라
								회원탈퇴 및 기소 등의 조치가 취해질 수도 있습니다. <br>· 이용자는 서비스 또는 서비스에 연결되어
								있는 서버나 네트워크를 방해 또는 간섭하거나, 서비스에 관련된 네트워크의 요건, 절차, 정책 또는 규정을 준수하지
								않는 등의 방법으로 업무나 서비스의 운영을 방해하여서는 안됩니다.
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

