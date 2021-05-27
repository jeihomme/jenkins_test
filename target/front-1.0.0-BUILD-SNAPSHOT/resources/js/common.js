$(document).ready(function(){
	/* 모달팝업 */
	var screenHeight = $(document).height();
	$(document).resize(function(){
		$("#screenCover").css({"width":"100%", "height":screenHeight*1.5});
		$("#menuMobile").css({"height":screenHeight});
	}).resize();
	
	$(".menuMobileWrap").children("ul").children("li").click(function(){
		$(".menuMobileWrap").children("ul").children("li").removeClass("mobileActive");
		$(this).addClass("mobileActive");
	});
	
	
	/* 모달팝업 숨기기 기능들 */
	$("#screenCover").hide(0);
	$("#menuSearch").hide(0);
	$("#menuMobile").hide(0);
	$("#modal_guide_banner").hide(0);
	$("#modal_leaveQuestion").hide(0);
	$("#modal_leaveAnswer").hide(0);
	$("#modal_teamApply").hide(0);
	$("#modal_teamAdd").hide(0);
	$("#modal_contestAdd").hide(0);
	$("#modal_addTodoList").hide(0);
	$("#modal_addMemo").hide(0);
	$("#modal_addSchedule").hide(0);
	$("#modal_showPolicy").hide(0);
	$("#modal_showPrivacy").hide(0);
	$("#modal_profileEditAccess").hide(0);
	$("#modal_profileReview").hide(0);
	$("#modal_profileAward").hide(0);
	$("#modal_estimate").hide(0);
	$("#modal_findEmail").hide(0);
	$("#modal_contestReport").hide(0);
	$("#modal_contestPoster").hide(0);
	$("#modal_awardReg").hide(0);
	
	/* 스크린 눌렀을때 숨김 */
	$("#screenCover").click(function(){
		$(this).hide(0);
		$("#menuMobile").hide(0);
		$("#menuSearch").hide(0);
		$("#modal_expire").hide(0);
		$("#modal_guide_banner").hide(0);
		$("#modal_leaveQuestion").hide(0);
		$("#modal_leaveAnswer").hide(0);
		$("#modal_teamApply").hide(0);
		$("#modal_teamAdd").hide(0);
		$("#modal_contestAdd").hide(0);
		$("#modal_addTodoList").hide(0);
		$("#modal_addMemo").hide(0);
		$("#modal_addSchedule").hide(0);
		$("#modal_showPolicy").hide(0);
		$("#modal_showPrivacy").hide(0);
		$("#modal_profileEditAccess").hide(0);
		$("#modal_profileReview").hide(0);
		$("#modal_profileAward").hide(0);
		$("#modal_estimate").hide(0);
		$("#modal_findEmail").hide(0);
		$("#modal_contestReport").hide(0);
		$("#modal_contestPoster").hide(0);
		$("#modal_awardReg").hide(0);
	});
	/* 모달팝업_X버튼 */
	$(".modal_guide_banner_close").click(function(){
		$("#screenCover").hide(0);
		$("#modal_guide_banner").hide(0);
		$("#modal_leaveQuestion").hide(0);
		$("#modal_leaveAnswer").hide(0);
		$("#modal_teamApply").hide(0);
		$("#modal_teamAdd").hide(0);
		$("#modal_contestAdd").hide(0);
		$("#modal_addTodoList").hide(0);
		$("#modal_addMemo").hide(0);
		$("#modal_addSchedule").hide(0);
		$("#modal_showPolicy").hide(0);
		$("#modal_showPrivacy").hide(0);
		$("#modal_profileEditAccess").hide(0);
		$("#modal_profileReview").hide(0);
		$("#modal_profileAward").hide(0);
		$("#modal_estimate").hide(0);
		$("#modal_findEmail").hide(0);
		$("#modal_contestReport").hide(0);
		$("#modal_contestPoster").hide(0);
		$("#modal_awardReg").hide(0);
	});
	
	
	$(".fn_openSearch").click(function(){
		$("#screenCover").show(0);
		$("#menuSearch").show(0);
	});
	$(".fn_openMenu").click(function(){
		$("#screenCover").show(0);
		$("#menuMobile").show(0);
	});
	$(".fn_guide_option_bannerA").click(function(){
		$("#screenCover").show(0);
		$("#modal_guide_banner").show(0);
		$(".modal_guide_bannerImg img").attr("src", "/resources/images/info_guide_bannera.png");
	})
	$(".fn_guide_option_bannerB").click(function(){
		$("#screenCover").show(0);
		$("#modal_guide_banner").show(0);
		$(".modal_guide_bannerImg img").attr("src", "/resources/images/info_guide_bannerb.png");
	})
	$(".fn_guide_option_bannerC").click(function(){
		$("#screenCover").show(0);
		$("#modal_guide_banner").show(0);
		$(".modal_guide_bannerImg img").attr("src", "/resources/images/info_guide_bannerc.png");
	})
	$(".fn_guide_option_bannerSA").click(function(){
		$("#screenCover").show(0);
		$("#modal_guide_banner").show(0);
		$(".modal_guide_bannerImg img").attr("src", "/resources/images/info_guide_bannersa.png");
	})
	$(".fn_guide_option_bannerSB").click(function(){
		$("#screenCover").show(0);
		$("#modal_guide_banner").show(0);
		$(".modal_guide_bannerImg img").attr("src", "/resources/images/info_guide_bannersb.png");
	})
	$(".fn_guide_option_bannerSC").click(function(){
		$("#screenCover").show(0);
		$("#modal_guide_banner").show(0);
		$(".modal_guide_bannerImg img").attr("src", "/resources/images/info_guide_bannersc.png");
	});
	
	/* 모달팝업_팀원추가 */
	$(".fn_teamAdd").click(function(){
		$("#screenCover").show(0);
		$("#modal_teamAdd").show(0);
		
		$(".fn_modalSubmitCancel").click(function(){
			$("#modal_teamAdd").hide(0);
			$("#screenCover").hide(0);
		});
	});
	/* 모달팝업_프로필_정보수정 클릭시 비밀번호 확인 */
	$(".fn_profileEditAccess").click(function(){
		$("#screenCover").show(0);
		$("#modal_profileEditAccess").show(0);
		
		$(".fn_modalSubmitCancel").click(function(){
			$("#modal_profileEditAccess").hide(0);
			$("#screenCover").hide(0);
		});
	});
	//담당자 선택
	$(".teamAdd_list li").click(function(){
		$(this).toggleClass("teamAdd_list_active");
	});
	
	
	/* 팀 모집하기_리스트 추가 */
	//삭제기능
	$(".member_eventDelete").click(function(){
		$(this).parent("li").remove(); 
	});
	$(".member_infoDelete").click(function(){
		$(this).parent("li").remove();
	});
	//행사일정
	$(".fn_addSchedule").click(function(){
		$(".member_event").append("<li><p><input type='text' name='schduleDate' title='행사 날짜' placeholder='행사 날짜를 입력하세요.'/></p><p><input type='text' name='schduleMemo' title='행사 일정' placeholder='결과발표 등 주요 일정을 입력하세요.'/></p><a href='#none' title='삭제'><img src='/resources/images/icon_member_delete.png' alt='삭제'/></a></li>");
		$(".member_event li:last-child").attr("class", "member_eventCreated");
		$(".member_event li:last-child p:eq(0)").attr("class", "member_eventDate");
		$(".member_event li:last-child p:eq(1)").attr("class", "member_eventInput");
		$(".member_event li:last-child a").attr("class", "member_eventDelete");
		
		$(".member_eventDelete").click(function(){
			$(this).parent("li").remove();
		});
	});
	//팀소개
	$(".fn_addTeamInfo").click(function(){
		$(".member_info").append("<li><p><input type='text' placeholder='제목을 입력하세요.'/></p><p><textarea placeholder='내용을 입력하세요.'></textarea></p><a href='#none' title='삭제'><img src='/resources/images/icon_member_delete.png' alt='삭제'/></a></li>")
		$(".member_info li:last-child").attr("class", "member_infoCreated");
		$(".member_info li:last-child p:eq(0)").attr("class", "member_infoTitle");
		$(".member_info li:last-child p:eq(1)").attr("class", "member_infoContent");
		$(".member_info li:last-child a").attr("class", "member_infoDelete");
		
		$(".member_infoDelete").click(function(){
			$(this).parent("li").remove();
		});
	});
	
	/* 모달팝업_이용약관 */
	$(".fn_showPolicy").click(function(){
		$("#screenCover").show(0);
		$("#modal_showPolicy").show(0);
		
		$(".fn_modalSubmitCancel").click(function(){
			$("#modal_showPolicy").hide(0);
			$("#screenCover").hide(0);
		});
	});
	
	/* 모달팝업_개인정보취급방침 */
	$(".fn_showPrivacy").click(function(){
		$("#screenCover").show(0);
		$("#modal_showPrivacy").show(0);
		
		$(".fn_modalSubmitCancel").click(function(){
			$("#modal_showPrivacy").hide(0);
			$("#screenCover").hide(0);
		});
	});
	$(".fn_modalPolPrivClose").click(function(){
		$("#modal_showPolicy").hide(0);
		$("#modal_showPrivacy").hide(0);
		$("#screenCover").hide(0);
	});
		
		
	/* 모달팝업_견적서 받기 */
	$(".fn_estimatePopup").click(function(){
		$("#screenCover").show(0);
		$("#modal_estimate").show(0);
		
		$(".fn_modalSubmitCancel").click(function(){
			$("#modal_estimate").hide(0);
			$("#screenCover").hide(0);
		});
	});
	
	/* social_team_qna */
	$(".sub_common_qna_list li p").slideUp(0);
	$(".sub_common_qna_list li:eq(0)").children("p").slideDown(0);
	$(".sub_common_qna_list li:eq(0) h4 a i").attr("class", "fas fa-chevron-up");
	$(".sub_common_qna_list li h4").click(function(){
		$(".sub_common_qna_list li p").slideUp(500);
		$(".sub_common_qna_list li h4 a i").attr("class", "fas fa-chevron-down");
		$(this).children("a").children("i").attr("class", "fas fa-chevron-up");
		$(this).siblings("p").slideDown(500);
	});
	
	/* mypage_awards */
	$("#award_addFile01").click(function(){
		alert("해양수산부 마케팅 공모전 파일 첨부");
		$("#award_addFile01_dummy").click();
	});
	$("#award_addFile02").click(function(){
		alert("컴퓨터활용 1급 자격증 파일 첨부");
		$("#award_addFile02_dummy").click();
	});
	$("#award_editFile01").click(function(){
		if( confirm("수정하시겠습니까?") ){
			$("#award_addFile01_dummy").click();
		}
		else{alert("수정을 취소하였습니다.");}
		
	});
	$("#award_editFile02").click(function(){
		if( confirm("수정하시겠습니까?") ){
			$("#award_addFile02_dummy").click();
		}
		else{alert("수정을 취소하였습니다.");}
	});
	$("#award_delFile01").click(function(){
		confirm("삭제하시겠습니까?");
	});
	$("#award_delFile02").click(function(){
		confirm("삭제하시겠습니까?");
	});
	
	/* mypage_team_social */
	$(".team_socialCategory li a").click(function(){
		$(".team_socialCategory li").removeClass("team_socialCategory_active");
		$(this).parent("li").addClass("team_socialCategory_active");
	});
	$(".team_socialOnCategory li a").click(function(){
		$(".team_socialOnCategory li").removeClass("team_socialOnCategory_active");
		$(this).parent("li").addClass("team_socialOnCategory_active");
	});
	
	/* mypage_team_member */
	$(".team_memberCategory li a").click(function(){
		$(this).parent("li").toggleClass("team_memberCategory_active");
	});
	
	/* mypage_notice */
	$(".mypage_notice_category li").click(function(){
		$(".mypage_notice_category li").removeClass("mypage_notice_active");
		$(this).addClass("mypage_notice_active");
	});
	$(".mypage_notice_category_scroll li").click(function(){
		$(".mypage_notice_category_scroll li").removeClass("mypage_notice_scroll_active");
		$(this).addClass("mypage_notice_scroll_active");
	});
	$(".notice_list_all").show(0);
	$(".mypage_notice_category li:eq(0)").click(function(){
		$(".mypage_notice_list").hide(0);
		$(".notice_list_all").show(0);
	});
	$(".mypage_notice_category li:eq(1)").click(function(){
		$(".mypage_notice_list").hide(0);
		$(".notice_list_notice").show(0);
	});
	$(".mypage_notice_category li:eq(2)").click(function(){
		$(".mypage_notice_list").hide(0);
		$(".notice_list_event").show(0);
	});
	$(".mypage_notice_category li:eq(3)").click(function(){
		$(".mypage_notice_list").hide(0);
		$(".notice_list_news").show(0);
	});
	
	/* mypage_myteam_detail */
	$(".sche_memo").hide(0);
	$(".sche_comment_open").click(function(){
		$(this).siblings(".sche_memo").show(0);
		$(this).hide(0);
		$(this).siblings(".sche_comment_close").show(0);
	});
	$(".sche_comment_close").click(function(){
		$(this).siblings(".sche_memo").hide(0);
		$(this).hide(0);
		$(this).siblings(".sche_comment_open").show(0);
	});
	$(".applicant_close").hide(0);
	$(".myteam_applicant_stat").hide(0);
	$(".applicant_open").click(function(){
		$(this).hide(0);
		$(this).siblings(".applicant_close").show(0);
		$(this).parent(".myteam_applicant_stat_control").siblings(".myteam_applicant_stat").show(0);
	});
	$(".applicant_close").click(function(){
		$(this).hide(0);
		$(this).siblings(".applicant_open").show(0);
		$(this).parent(".myteam_applicant_stat_control").siblings(".myteam_applicant_stat").hide(0);
	});
	$(".myteam_applicant_list li:eq(0)").children(".myteam_applicant_stat").show(0);
	$(".myteam_applicant_list li:eq(0)").children(".myteam_applicant_stat_control").children(".applicant_close").show(0);
	$(".myteam_applicant_list li:eq(0)").children(".myteam_applicant_stat_control").children(".applicant_open").hide(0);
	//이미지 추가
	$("#myteam_detail_addImg").click(function(){
		$("#myteam_detail_addImg_dummy").click();
	});
	//더보기 버튼 작동
	$(".btn_myteam_todolist_less").hide(0);
	$(".myteam_todolistTable tr").hide(0);
	tableTr_size = $(".myteam_todolistTable tr").size();
	var xv = 6;
	$(".myteam_todolistTable tr:lt("+xv+")").show();
	$(".btn_myteam_todolist_more").click(function(){
		$(this).hide(0);
		$(".btn_myteam_todolist_less").show(0);
		$(".myteam_todolistTable tr:eq(5)").css("border-color", "#ececec");
		xv = ( xv+6 <= tableTr_size ) ? xv+6 : tableTr_size;
		$(".myteam_todolistTable tr:lt("+xv+")").show();
	});
	$(".btn_myteam_todolist_less").click(function(){
		$(this).hide(0);
		$(".btn_myteam_todolist_more").show(0);
		$(".myteam_todolistTable tr:eq(5)").css("border-color", "#444");
		$(".myteam_todolistTable tr:gt(5)").hide();
	});

	
	/* 로그인 임시 */
	$(".member_icon").mouseover(function(){
		$(".member_list").css("opacity", "1");
		$(".member_icon_function i").css("opacity", "1");
	});
	$(".member_icon").mouseout(function(){
		$(".member_list").css("opacity", "0");
		$(".member_icon_function i").css("opacity", "0");
	});
	
	/* gnb 글씨 색상변경 */
	$("#gnb ul li").click(function(){
		$("#gnb ul li").removeClass("active");
		$(this).addClass("active");
	});
	
	/* 공모전 무료등록 */
	$(".fn_contest_reg").click(function(){
		alert("등록이 완료되었습니다.");
		window.location.href="/front/info/contest_reg";
	});
	
	/* input 파일업로드 기능 */
	//공모전 무료등록
	$("#contestPoster").click(function(){
		alert("포스터 이미지 등록");
		$("#contestPosterDummy").click();
	});
	$("#contestImg").click(function(){
		alert("대표 이미지 등록");
		$("#contestImgDummy").click();
	});
	
	//정보수정
	$("#modifyFormProfileImg").click(function(){
		alert("프로필 이미지 등록 & 변경");
		$("#modifyFormProfileImgDummy").click();
	});
});

/* 공모전 팀 상세보기 */
function fn_contest_share(){
	alert("공유: 카카오톡, 네이버블로그, 인스타그램");
}
function fn_contest_favourite(){
	alert("나의 관심 프로젝트에 등록됩니다.");
}
function fn_contest_toContestSite(){
	alert("실등록된 공모전 사이트로 새창 링크됩니다.");
}
function fn_contest_showContestPoster(){
	alert("포스터 팝업 이미지가 뜹니다.");
}

/* 공모전 나의 팀 상세보기 */
function fn_myteamLeave(){
	confirm("정말 팀에서 나가시겠습니까?");
}
function fn_myteamTerminate(){
	confirm("정말 팀 활동을 종결시키겠습니까?");
}

/* 페이지 이동(임시) */
function fn_toGuide(){
	location.href="/front/info/guide";
}
function fn_toContest(){
	location.href="/front/contest/index";
}
function fn_toSocial(){
	location.href="/front/social/index";
}
function fn_toTeamContest(){
	location.href="/front/mypage/team_contest";
}
function fn_toTeamSocial(){
	location.href="/front/mypage/team_social";
}
function fn_toTeamMember(){
	location.href="/front/mypage/team_member";
}
function fn_toTeamDetail(){
	location.href="/front/mypage/myteam_detail";
}
function fn_toExpire(){
	location.href="/front/mypage/myteam_expire";
}
function fn_toContestReg(){
	location.href="/front/info/contest_reg";
}
function fn_toJoin(){
	location.href="/front/membership/join";
}
function fn_toNotice(){
	location.href="/front/mypage/notice";
}
function fn_toModify(){
	if( $("#profileEditAccessPW").val().length == 0 ){
		$("#profileEditAccessPW").focus();
		alert("비밀번호를 입력해주세요.");
	}
	else if( $("#profileEditAccessPWR").val().length == 0 ){
		$("#profileEditAccessPWR").focus();
		alert("비밀번호 재입력칸을 입력해주세요.");
	}
	else{
		alert("인증 성공");
		location.href="/front/membership/modify";
	}
}
function fn_toProfileContest(){
	location.href="/front/mypage/profile#mypage_profile_contestRecord";
}
function fn_toProfileTeam(){
	location.href="/front/mypage/profile#mypage_profile_teamRecord";
}
function fn_toProfileAwards(){
	location.href="/front/mypage/profile#mypage_profile_awardsRecord";
}

/* 로그인 유효성체크 */
function fn_loginChk(){
	if( $("#loginFormMail").val().length == 0 ){
		$("#loginFormMail").focus();
		alert("이메일을 입력해주세요.");
	}
	else if( $("#loginFormPW").val().length == 0 ){
		$("#loginFormPW").focus();
		alert("비밀번호를 입력해주세요.");
	}
	else{
		alert("로그인 성공");
		location.href="/front/main/main";
	}
};

/* 회원가입 유효성체크 */
function fn_joinNickChk(){
	if( $("#joinFormNick").val().length == 0 ){
		alert("닉네임을 입력해주세요.");
	}
	else{alert("사용 가능한 닉네임입니다.");}
}
function fn_joinMailChk(){
	if( $("#joinFormMail").val().length == 0 ){
		alert("이메일을 입력해주세요.");
	}
	else{alert("사용 가능한 이메일입니다.");}
}
function fn_joinChk(){
	if( $("#joinFormName").val().length == 0 ){
		$("#joinFormName").focus();
		alert("이름을 입력해주세요.");
	}
	else if( $("#joinFormNick").val().length == 0 ){
		$("#joinFormNick").focus();
		alert("닉네임을 입력해주세요.");
	}
	else if( $("#joinFormMail").val().length == 0 ){
		$("#joinFormMail").focus();
		alert("이메일을 입력해주세요.");
	}
	else if( $("#joinFormPhone").val().length == 0 ){
		$("#joinFormPhone").focus();
		alert("핸드폰 번호를 입력해주세요.");
	}
	else if( $("#joinFormPW").val().length == 0 ){
		$("#joinFormPW").focus();
		alert("비밀번호를 입력해주세요.");
	}
	else if( $("#joinFormPWR").val().length == 0 ){
		$("#joinFormPWR").focus();
		alert("비밀번호를 재입력 칸을 입력해주세요.");
	}
	else if( !$(".join_form_chkbox li:eq(0)").hasClass("join_form_chkbox_active") ){
		$(".join_form_chkbox li:eq(0)").focus();
		alert("서비스 이용약관에 동의해주세요.");
	}
	else if( !$(".join_form_chkbox li:eq(1)").hasClass("join_form_chkbox_active") ){
		$(".join_form_chkbox li:eq(1)").focus();
		alert("개인정보 수집 및 이용에 동의해주세요.");
	}
	else if( !$(".join_form_chkbox li:eq(2)").hasClass("join_form_chkbox_active") ){
		$(".join_form_chkbox li:eq(2)").focus();
		alert("만 14세 이상에 동의해주세요.");
	}
	else{
		alert("회원가입 성공");
		location.href="/front/main/main";
	}
}

/* 정보수정 유효성 체크 */
function fn_modifySubmit(){
	if( $("#modifyFormNick").val().length == 0 ){
		$("#modifyFormNick").focus();
		alert("닉네임을 입력해주세요.");
	}
	else if( $("#modifyFormPhone").val().length == 0 ){
		$("#modifyFormPhone").focus();
		alert("핸드폰 번호를 입력해주세요.");
	}
	else if( $("#modifyFormPW").val().length == 0 ){
		$("#modifyFormPW").focus();
		alert("비밀번호를 입력해주세요.");
	}
	else if( $("#modifyFormPWR").val().length == 0 ){
		$("#modifyFormPWR").focus();
		alert("비밀번호를 재입력해주세요.");
	}
	else{
		alert("정보 수정이 완료되었습니다.");
		location.href="/front/mypage/profile";
	}
}
function fn_modifyNickChk(){
	if( $("#modifyFormNick").val().length == 0 ){
		alert("닉네임을 입력해주세요.");
	}
	else{alert("사용 가능한 닉네임입니다.");}
}

function fn_toEstimate(){
	location.href="/front/info/estimate_print";
}
function fn_companyPdf(){
	alert("회사 소개서 다운로드");
}
function fn_srch(){
	alert("프로젝트, 공모전 검색");
}
function fn_contestSrch(){
	alert("공모전 검색");
}
function fn_teamSrch(){
	alert("팀원 검색");
}
function fn_unready(){
	alert("해당 페이지는 현재 준비중입니다.");
}

