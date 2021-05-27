$(function(){
	var thisUri = location.pathname;
	var uriSplit = thisUri.split('/');
	var txt1 = "";
	var txt2 = "";
	$.each(uriSplit, function(key, val){
		if ( key == 2 ){
			switch(val){
				case 'member': txt1='회원관리'; break;

				case 'masterinfo': txt1='마스터관리'; break;
				case 'masteropen': txt1='마스터관리'; break;
				case 'masterappl': txt1='마스터관리'; break;
				case 'masterfaq': txt1='마스터관리'; break;
				case 'revi': txt1='마스터관리'; break;

				case 'vod': txt1='상품관리'; break;
				case 'lect': txt1='상품관리'; break;
				case 'live': txt1='상품관리'; break;
				case 'face': txt1='상품관리'; break;
				case 'chat': txt1='상품관리'; break;
				case 'mail': txt1='상품관리'; break;
				case 'coup': txt1='상품관리'; break;
				case 'stor': txt1='상품관리'; break;
				case 'prdtopen': txt1='상품관리'; break;

				case 'wait': txt1='상담관리'; break;
				case 'past': txt1='상담관리'; break;
				
				case 'orde': txt1='주문/배송관리'; break;
				case 'deli': txt1='주문/배송관리'; break;
				case 'pay': txt1='주문/배송관리'; break;
				case 'refu': txt1='주문/배송관리'; break;
				case 'cuse': txt1='주문/배송관리'; break;
				
				case 'bann': txt1='사이트관리'; break;
				case 'faq': txt1='사이트관리'; break;
				case 'qna': txt1='사이트관리'; break;
				case 'noti': txt1='사이트관리'; break;
				case 'bannprdt': txt1='사이트관리'; break;
				case 'cate': txt1='사이트관리'; break;
				case 'mainopen': txt1='사이트관리'; break;
				case 'mdpick': txt1='사이트관리'; break;
				case 'timedeal': txt1='사이트관리'; break;
				
				case 'join': txt1='통계'; break;
				case 'sale': txt1='통계'; break;
				case 'prdt': txt1='통계'; break;
				
				case 'admin': txt1='기본설정'; break;
				case 'prev': txt1='기본설정'; break;
				
				case 'main': txt1='메인'; break;
				
				default : txt1=val; break;
			}
			$(".breadcrumb li").eq(1).text(txt1);
		}
		
		if ( key == 2 ) {
			switch(val) {
				case 'member': txt1='회원정보'; break;
	
				case 'masterinfo': txt1='마스터정보'; break;
				case 'masteropen': txt1='마스터노출정보'; break;
				case 'masterappl': txt1='마스터신청관리'; break;
				case 'masterfaq': txt1='마스터FAQ관리'; break;
				case 'revi': txt1='후기관리'; break;
	
				case 'vod': txt1='강의등록'; break;
				case 'lect': txt1='VOD강좌'; break;
				case 'live': txt1='라이브클래스'; break;
				case 'face': txt1='1:1화상상담'; break;
				case 'chat': txt1='1:1채팅상담'; break;
				case 'mail': txt1='1:1이메일상담'; break;
				case 'coup': txt1='쿠폰관리'; break;
				case 'stor': txt1='스토어상품'; break;
				case 'prdtopen': txt1='상품상세노출관리'; break;
	
				case 'wait': txt1='대기중인상담'; break;
				case 'past': txt1='지난상담'; break;
				
				case 'orde': txt1='주문관리'; break;
				case 'deli': txt1='상품준비/발송관리'; break;
				case 'pay': txt1='결제내역'; break;
				case 'refu': txt1='취소/환불내역'; break;
				case 'cuse': txt1='쿠폰사용내역'; break;
				
				case 'bann': txt1='메인페이지배너관리'; break;
				case 'faq': txt1='FAQ관리'; break;
				case 'qna': txt1='1:1문의관리'; break;
				case 'noti': txt1='공지사항관리'; break;
				case 'bannprdt': txt1='상품배너관리'; break;
				case 'cate': txt1='카테고리관리'; break;
				case 'mainopen': txt1='메인마스터노출관리'; break;
				case 'mdpick': txt1="MD's Pick관리"; break;
				case 'timedeal': txt1='타임딜관리'; break;
	
				case 'join': txt1='가입'; break;
				case 'sale': txt1='매출'; break;
				case 'prdt': txt1='상품별현황관리'; break;
				
				case 'admin': txt1='관리자관리'; break;
				case 'prev': txt1='권한관리'; break;
				
				case 'main': txt1='메인'; break;
				
				default : txt1=val; break;
			}
//			$(".breadcrumb li").eq(1).text(txt1);
		}
		
		if ( key == 3 ){
			switch(val){
				case 'dashboard': txt2=txt1+''; break;			
				case 'index': txt2=txt1+' 목록'; break;
				case 'write': txt2=txt1+' 등록'; break;
				case 'view': txt2=txt1+' 상세'; break;
				case 'edit': txt2=txt1+' 수정'; break;
				default : txt2=val; break;
			}
			$(".breadcrumb li").eq(2).text(txt2);
			$(".page-header .header-title").text(txt2);
		}
	});
});