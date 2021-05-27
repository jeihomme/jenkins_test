$(function(){
	var thisUri = location.pathname;
	var uriSplit = thisUri.split('/');
	$.each(uriSplit, function(key, val){
		if ( key == 2 ){
			var txt = "";
			switch(val){
			case 'mng_main': txt='메인 관리'; break;
			case 'mng_submain': txt='서브메인 관리'; break;
			case 'banner': txt='배너 관리'; break;
			case 'project': txt='프로젝트 관리'; break;
			case 'team': txt='뉴스타터 팀 관리'; break;
			case 'customer': txt='고객센터'; break;
			case 'member': txt='회원관리'; break;
			case 'manager': txt='관리자관리'; break;			
			default : txt=val; break;			
			}
			$(".breadcrumb li").eq(1).text(txt);
		}
		
		if ( key == 3 ){
			var txt = "";
			switch(val){
			case 'contest': txt='공모전'; break;
			case 'socialissue': txt='사회문제'; break;
			case 'contest': txt='공모전 서브메인'; break;
			case 'socialissue': txt='사회문제 서브메인'; break;
			case 'ad': txt='광고 배너'; break;
			case 'adrequest': txt='신청 관리'; break;
			case 'contest': txt='공모전 팀'; break;
			case 'socialissue': txt='사회문제 팀'; break;
			case 'notice': txt='공지사항'; break;
			case 'eval': txt='상호평가'; break;
			case 'member_list': txt='회원리스트'; break;
			case 'member_leave_list': txt='탈퇴회원'; break;
			case 'admin_list': txt='관리자 리스트'; break;
			default : txt=val; break;
			}
			$(".breadcrumb li").eq(2).text(txt);
			$(".page_header .header_title").text(txt);
		}
	});
});