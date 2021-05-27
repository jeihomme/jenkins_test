$(function(){
	var thisUri = location.pathname;
	var uriSplit = thisUri.split('/');
	$.each(uriSplit, function(key, val){
		if ( key == 2 ){
			var txt = "";
			switch(val){
			case 'main': txt='메인'; break;				
			case 'main_mngt': txt='메인 관리'; break;
			case 'ad': txt='배너 관리'; break;
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
			case 'Dashboard': txt='메인 대시보드'; break;			
			case 'eventso_contest': txt='공모전 뉴스타터'; break;
			case 'eventso_socialissue': txt='사회문제 뉴스타터'; break;
			case 'main_contest': txt='공모전 노출관리'; break;
			case 'banner': txt='광고 배너'; break;
			case 'request': txt='신청 관리'; break;
			case 'contest': txt='공모전관리'; break;
			case 'socialissue': txt='사회문제관리'; break;
			case 'team_contest': txt='공모전 팀'; break;
			case 'team_socialissue': txt='사회문제 팀'; break;
			case 'evaluation': txt='상호평가관리'; break;
			case 'notice': txt='공지사항'; break;
			case 'notice_edit': txt='공지사항'; break;
			case 'notice_view': txt='공지사항'; break;
			case 'notice_write': txt='공지사항'; break;	
			case 'note': txt='알림 쪽지'; break;
			case 'note_write': txt='알림 쪽지'; break;
			case 'member_list': txt='회원리스트'; break;
			case 'admin_list': txt='관리자 리스트'; break;
			default : txt=val; break;
			}
			$(".breadcrumb li").eq(2).text(txt);
			$(".page_header .header_title").text(txt);
		}
	});
});