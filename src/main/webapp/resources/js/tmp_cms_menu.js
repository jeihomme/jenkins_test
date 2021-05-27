$(function(){
	var thisUri = location.pathname;
	var uriSplit = thisUri.split('/');
	var txt1 = "";
	var txt2 = "";
	$.each(uriSplit, function(key, val){
		if ( key == 2 ){
			switch(val){
			case 'dashboard': txt1='메인'; break;
			case 'ntc': txt1='공지사항'; break;
			case 'qna': txt1='1:1 문의'; break;
			case 'evt': txt1='이벤트'; break;
			case 'eqna': txt1='이벤트문의'; break;
			case 'app': txt1='접수내역'; break;
			case 'total': txt1='웹분석'; break;
			default : txt1=val; break;
			}
			$(".breadcrumb li").eq(1).text(txt1);
		}
		
		if ( key == 3 ){
			switch(val){
			case 'dashboard': txt2=txt1+' 대시보드'; break;		
			case 'appList': txt2=txt1+' 접수 상세'; break;	
			case 'list': txt2=txt1+' 목록'; break;
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