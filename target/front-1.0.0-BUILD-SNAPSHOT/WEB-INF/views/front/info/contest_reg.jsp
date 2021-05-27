<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />


<h2 class="hideHeading">컨텐츠</h2>
<div class="info_reg">
	<div class="reg">
		<div class="sectionWrap">
			<h2>등록한 공모전 확인하기</h2>
			<div class="reg_stat">
				<p class="stat_title">내가 등록한 공모전 현황 확인하기</p>
				<div class="stat_inputArea">
					<p class="stat_input">
						<c:if test = "${sessionScope.loginEmail eq null}">
							<input type="hidden" id="loginYn" value="N"/>
							<input type="text" name="MyemailAddress" title="이메일 주소" placeholder="이메일 주소(example@naver.com)"/>
							<input type="password" name="Mypassword" title="비밀번호" maxlength="4" placeholder="비밀번호 4자리"/>
						</c:if>
						<c:if test = "${sessionScope.loginEmail ne null}">
							<input type="hidden" id="loginYn" value="Y"/>
							<input type="text" name="MyemailAddress" title="이메일 주소" value="${ sessionScope.loginEmail }" disabled placeholder="이메일 주소(example@naver.com)"/>
							<input type="password" name="Mypassword" title="비밀번호" maxlength="4" disabled placeholder="비밀번호 4자리"/>
						</c:if>
					</p>
					<p class="stat_btn">
						<button class="btn_grn btn_team_common btn_team_submit" onclick="fn_BtnSearch();">확인하기</button>
					</p>
				</div>
			</div>
			<table class="mypage_table_common reg_find_table">
				<tr>
					<th class="tdwidth30">명칭</th>
					<th class="collapseCol">주최/주관</th>
					<th>검수여부</th>
					<th class="collapseCol">접수기간</th>
					<th></th>
				</tr>
				<tbody id="contestList">
				</tbody>
			</table>
			<h2>공모전 무료 등록하기<b style="font-size:12px;color:red;"> * 모든 내용은 필수값입니다. </b></h2>
			<div class="reg_contents">
				<h3>담당자 인적사항</h3>
				
				<c:choose>
					<c:when test = "${sessionScope.loginEmail eq null}">
						<h4>이메일</h4>
						<p><input type="text" name="emailAddress" title="이메일 주소" placeholder="이메일을 입력해주세요."/></p>
						<h4>비밀번호</h4>
						<p><input type="password" name="supervisorPw" title="비밀번호" maxlength="4" placeholder="비밀번호 4자리를 입력해주세요."/></p>
					</c:when>
					<c:otherwise>
						<h4>이메일</h4>
						<p><input type="text" name="emailAddress" title="이메일 주소" value="${ sessionScope.loginEmail }" disabled placeholder="이메일을 입력해주세요."/></p>
						<h4>비밀번호</h4>
						<p><input type="password" name="supervisorPw" title="비밀번호" maxlength="4" disabled value="1111" placeholder="비밀번호 4자리를 입력해주세요."/></p>
					</c:otherwise>
				</c:choose>
				
				<h4>담당자 이름</h4>
				<p><input type="text" name="name" title="담당자 이름" placeholder="담당자 이름을 입력해주세요."/></p>
				<h4>연락처</h4>
				<p><input type="text" name="phone" title="연락처" placeholder="연락처를 입력해주세요." onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/></p>
				<h4>담당자 소속 회사</h4>
				<p><input type="text" name="company" title="담당자 소속 회사" placeholder="소속회사명을 입력해주세요."/></p>
				<h3>공모전 내용 입력</h3>
				<h4>공모전 명칭</h4>
				<p><input type="text" name="contestName" title="공모전 명칭" placeholder="공모전 명칭을 입력해주세요."/></p>
				<h4>주최사</h4>
				<p><input type="text" name="contestCompany" title="주최사" placeholder="주최사 명을 입력해주세요."/></p>
				<h4>주관사</h4>
				<p><input type="text" name="contestHolder" title="주관사" placeholder="주관사 명을 입력해주세요."/></p>
				<h4>홈페이지 URL</h4>
				<p><input type="text" name="contestUrl" title="홈페이지 URL" placeholder="홈페이지 경로를 입력해주세요."/></p>
				<h4>포스터</h4>
				<p>
					<input id="contestPoster" type="button" name="contestPoster" title="포스터" value="포스터 등록"/>
					<input id="contestPosterDummy" type="file" name="contestPosterDummy" title="포스터" hidden="hidden"/>
				</p>
				<h4>대표이미지</h4>
				<p>
					<input id="contestImg" type="button" name="contestImg" title="대표이미지" value="대표이미지 등록"/>
					<input id="contestImgDummy" type="file" name="contestImgDummy" title="대표이미지" hidden="hidden"/>
				</p>
				<h4>1등 상금</h4>
				<p><input type="text" name="contestPrize" title="1등 상금" placeholder="1등 상금을 입력하세요." onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/></p>
				<h4>접수 마감일</h4>
				<p class="wd400 datepicker_wrap">
					<input id="datepicker_contest_closeDate" name=contestDeadline type="text" title="접수 마감일" placeholder="접수 마감일을 입력하세요."/>
				</p>
				<h4>카테고리 선택</h4>
				<ul class="team_category team_socialCategory">
					<li class="team_socialCategory_active">
						<a href="#none" title="기획/마케팅" onclick="category='M';">
							<i>
								<img src="/resources/images/category_contest_01.png" alt="기획/마케팅"/>
								<img class="team_socialCategory_active_img" src="/resources/images/category_contest_01_over.png" alt="기획/마케팅"/>
							</i>
							<p>기획/마케팅</p>
						</a>
					</li>
					<li>
						<a href="#none" title="사진/영상" onclick="category='F';">
							<i>
								<img src="/resources/images/category_contest_02.png" alt="사진/영상"/>
								<img class="team_socialCategory_active_img" src="/resources/images/category_contest_02_over.png" alt="사진/영상"/>
							</i>
							<p>사진/영상</p>
						</a>
					</li>
					<li>
						<a href="#none" title="공학/컴퓨터" onclick="category='P';">
							<i>
								<img src="/resources/images/category_contest_03.png" alt="공학/컴퓨터"/>
								<img class="team_socialCategory_active_img" src="/resources/images/category_contest_03_over.png" alt="공학/컴퓨터"/>
							</i>
							<p>공학/컴퓨터</p>
						</a>
					</li>
					<li>
						<a href="#none" title="논문" onclick="category='T';">
							<i>
								<img src="/resources/images/category_contest_04.png" alt="논문"/>
								<img class="team_socialCategory_active_img" src="/resources/images/category_contest_04_over.png" alt="논문"/>
							</i>
							<p>논문</p>
						</a>
					</li>
					<li>
						<a href="#none" title="디자인" onclick="category='D';">
							<i>
								<img src="/resources/images/category_contest_05.png" alt="디자인"/>
								<img class="team_socialCategory_active_img" src="/resources/images/category_contest_05_over.png" alt="디자인"/>
							</i>
							<p>디자인</p>
						</a>
					</li>
					<li>
						<a href="#none" title="수기" onclick="category='H';">
							<i>
								<img src="/resources/images/category_contest_06.png" alt="수기"/>
								<img class="team_socialCategory_active_img" src="/resources/images/category_contest_06_over.png" alt="수기"/>
							</i>
							<p>수기</p>
						</a>
					</li>
					<li>
						<a href="#none" title="건축" onclick="category='C';">
							<i>
								<img src="/resources/images/category_contest_07.png" alt="건축"/>
								<img class="team_socialCategory_active_img" src="/resources/images/category_contest_07_over.png" alt="건축"/>
							</i>
							<p>건축</p>
						</a>
					</li>
					<li>
						<a href="#none" title="예체능" onclick="category='A';">
							<i>
								<img src="/resources/images/category_contest_08.png" alt="예체능"/>
								<img class="team_socialCategory_active_img" src="/resources/images/category_contest_08_over.png" alt="예체능"/>
							</i>
							<p>예체능</p>
						</a>
					</li>
					<li>
						<a href="#none" title="체험" onclick="category='e';">
							<i>
								<img src="/resources/images/category_contest_09.png" alt="체험"/>
								<img class="team_socialCategory_active_img" src="/resources/images/category_contest_09_over.png" alt="체험"/>
							</i>
							<p>체험</p>
						</a>
					</li>
					<li>
						<a href="#none" title="기타" onclick="category='Z';">
							<i>
								<img src="/resources/images/category_contest_10.png" alt="기타"/>
								<img class="team_socialCategory_active_img" src="/resources/images/category_contest_10_over.png" alt="기타"/>
							</i>
							<p>기타</p>
						</a>
					</li>
				</ul>
				<h4 >모집 자격 선택(복수 선택 가능)</h4>
				<ul class="team_category team_memberCategory">
					<li class="team_memberCategory_active">
						<a href="#none" onclick="fn_JobAdd('M')" title="중학생">
							<i >
								<input name=team_memberCategory type="hidden" />
								<img src="/resources/images/job_01.png" alt="중학생" />
								<img class="team_memberCategory_active_img" src="/resources/images/job_01_over.png" alt="중학생"/>
							</i>
							<p>중학생</p>
						</a>
					</li>
					<li>
						<a href="#none" onclick="fn_JobAdd('H')" title="고등학생">
							<i>
								<img src="/resources/images/job_01.png" alt="고등학생" />
								<img class="team_memberCategory_active_img" src="/resources/images/job_01_over.png" alt="고등학생"/>
							</i>
							<p>고등학생</p>
						</a>
					</li>
					<li>
						<a href="#none" onclick="fn_JobAdd('U')" title="대학생">
							<i>
								<img src="/resources/images/job_02.png" alt="대학생" />
								<img class="team_memberCategory_active_img" src="/resources/images/job_02_over.png" alt="대학생"/>
							</i>
							<p>대학생</p>
						</a>
					</li>
					<li>
						<a href="#none" onclick="fn_JobAdd('G')" title="대학원생">
							<i>
								<img src="/resources/images/job_03.png" alt="대학원생" />
								<img class="team_memberCategory_active_img" src="/resources/images/job_03_over.png" alt="대학원생"/>
							</i>
							<p>대학원생</p>
						</a>
					</li>
					<li>
						<a href="#none" onclick="fn_JobAdd('A')" title="일반성인">
							<i>
								<img src="/resources/images/job_04.png" alt="일반성인" />
								<img class="team_memberCategory_active_img" src="/resources/images/job_04_over.png" alt="일반성인"/>
							</i>
							<p>일반성인</p>
						</a>
					</li>
					<li>
						<a href="#none" onclick="fn_JobAdd('Z')" title="무관">
							<i>
								<img src="/resources/images/job_05.png" alt="무관" />
								<img class="team_memberCategory_active_img" src="/resources/images/job_05_over.png" alt="무관"/>
							</i>
							<p>무관</p>
						</a>
					</li>
				</ul>
				<h4>주요 행사 일정</h4>
				<ul class="member_event">
					<li>
						<p class="member_eventDate"><input id="datepicker_team_member_eventDate01" type="text" name="schduleDate" title="행사 날짜" placeholder="행사 날짜를 입력하세요."/></p>
						<p class="member_eventInput"><input type="text" name="schduleMemo" title="행사 일정" placeholder="결과발표 등 주요 일정을 입력하세요."/></p>
					</li>
					<li>
						<p class="member_eventDate"><input id="datepicker_team_member_eventDate02" type="text" name="schduleDate" title="행사 날짜" placeholder="행사 날짜를 입력하세요."/></p>
						<p class="member_eventInput"><input type="text" name="schduleMemo" title="행사 일정" placeholder="결과발표 등 주요 일정을 입력하세요."/></p>
						<a class="member_eventDelete" href="#none" title="삭제"><img src="/resources/images/icon_member_delete.png" alt="삭제"/></a>
					</li>
					<li>
						<p class="member_eventDate"><input id="datepicker_team_member_eventDate03" type="text" name="schduleDate" title="행사 날짜" placeholder="행사 날짜를 입력하세요."/></p>
						<p class="member_eventInput"><input type="text" name="schduleMemo" title="행사 일정" placeholder="결과발표 등 주요 일정을 입력하세요."/></p>
						<a class="member_eventDelete" href="#none" title="삭제"><img src="/resources/images/icon_member_delete.png" alt="삭제"/></a>
					</li>
					<li>
						<p class="member_eventDate"><input id="datepicker_team_member_eventDate04" type="text" name="schduleDate" title="행사 날짜" placeholder="행사 날짜를 입력하세요."/></p>
						<p class="member_eventInput"><input type="text" name="schduleMemo" title="행사 일정" placeholder="결과발표 등 주요 일정을 입력하세요."/></p>
						<a class="member_eventDelete" href="#none" title="삭제"><img src="/resources/images/icon_member_delete.png" alt="삭제"/></a>
					</li>
				</ul>
				<p class="btn_memberInfoAdd"><button class="btn_fff btn_team_common fn_addSchedule">항목 추가 +</button></p>
				<h4>공모전 요강 입력</h4>
				<div class="contestReg_txtAraWrap">
					<p class="contestReg_txtAra contestReg_txtAra_p"><textarea name="guideLine" id="guideLine"></textarea></p>
					<p class="contestReg_txtAra contestReg_txtAra_m"><textarea placeholder="공모전 요강을 입력해주세요."></textarea></p>
				</div>
				<div class="team_submitWrap">
					<button id="contestRegBtn" class="btn_grn btn_team_common" onclick="">등록하기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="m_footerDummy"></div>
<!--네이버 스마트에디터 2.0 스크립트-->
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<!--스마트에디터 2.0 적용 스크립트-->
<script type="text/javascript">
//////////////////////////////////////////////////////////
//1. 변수 초기화
//////////////////////////////////////////////////////////
var oEditors = [];
var category = 'M';
var jobType = 'M';

//////////////////////////////////////////////////////////
//2. onload 함수
//////////////////////////////////////////////////////////
$(function(){
	nhn.husky.EZCreator.createInIFrame({
		  oAppRef: oEditors,
		  elPlaceHolder: "guideLine", //textarea에서 지정한 id와 일치해야 합니다. 
		  //SmartEditor2Skin.html 파일이 존재하는 경로
		  sSkinURI: "/resources/se2/SmartEditor2Skin.html",  
		  htParams : {
			  // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			  bUseToolbar : true,             
			  // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			  bUseVerticalResizer : true,     
			  // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			  bUseModeChanger : true,         
			  fOnBeforeUnload : function(){ 
				   
			  }
		  }, 
		  fOnAppLoad : function(){
			  //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
			  oEditors.getById["guideLine"].exec("PASTE_HTML", [""]);
			  
		  },
		  fCreator: "createSEditor2"
	  });
	
	//저장버튼 클릭시 form 전송
    $('#contestRegBtn').click(function(){
        oEditors.getById["guideLine"].exec("UPDATE_CONTENTS_FIELD", []);
        fn_BtnRegist( $('#guideLine').val() );
    });
	
    if( $('[name=MyemailAddress]').val() != null && $('[name=MyemailAddress]').val() != "" ) {
    	fn_BtnSearch();
    }
    
});
 
//달력기능_datepicker
$("#datepicker_contest_closeDate").datepicker();
$("#datepicker_team_member_eventDate").datepicker();
$("#datepicker_team_member_eventDate01").datepicker();
$("#datepicker_team_member_eventDate02").datepicker();
$("#datepicker_team_member_eventDate03").datepicker();
$("#datepicker_team_member_eventDate04").datepicker();

//////////////////////////////////////////////////////////
//3. 서비스 함수
//////////////////////////////////////////////////////////
	function fn_BtnRegist( guideLine ) {
		
		alert( $('[name=emailAddress]').val() );
		
	//	1. 유효성 검사 - 담당자 인적사항
		var params = new Object();

		params.emailAddress = $('[name=emailAddress]').val();
		
		if( ! fn_ChkEmail( params.emailAddress ) ) {
			alert("이메일 형식을 확인해주세요.");
			$('[name=emailAddress]').focus();
			
			return ;
		}
		if( $('[name=supervisorPw]').val() == "" ) {
			alert("비밀번호를 입력해주세요.");
			$('[name=supervisorPw]').focus();
			return ;
		} else if( $('[name=supervisorPw]').val().length < 4 ) {
			alert("비밀번호는 4자리여야합니다.");
			$('[name=supervisorPw]').focus();
			return ;
		}
		if( $('[name=name]').val() == "" ) {
			alert("담당자 이름을 입력해주세요.");
			$('[name=name]').focus();
			return ;
		}
		if( $('[name=phone]').val() == "" ) {
			alert("담당자 연락처를 입력해주세요.");
			$('[name=phone]').focus();
			return ;
		}
		if( $('[name=company]').val() == "" ) {
			 alert("담당자 소속회사를 입력해주세요.");
			$('[name=company]').focus();
			return ;
		}
		
		params.password = $('[name=supervisorPw]').val();
		params.name = $('[name=name]').val();
		params.phone = $('[name=phone]').val();
		params.company = $('[name=company]').val();
		
		// 2. 유효성 검사 - 공모전 내용 입력
		if( $('[name=contestName]').val() == "" ) {
			alert("공모전 명칭을 입력해주세요.");
			$('[name=contestName]').focus();
			return ;
		}
		if( $('[name=contestCompany]').val() == "" ) {
			alert("주최사를 입력해주세요.");
			$('[name=contestCompany]').focus();
			return ;
		}
		if( $('[name=contestHolder]').val() == "" ) {
			alert("주관사를 입력해주세요.");
			$('[name=contestHolder]').focus();
			return ;
		}
		if( $('[name=contestUrl]').val() == "" ) {
			alert("홈페이지 URL을 입력해주세요.");
			$('[name=contestUrl]').focus();
			return ;
		}
		if( $('[name=contestPrize]').val() == "" ) {
			alert("1등 상금을 입력해주세요.");
			$('[name=contestPrize]').focus();
			return ;
		}
		if( jobType == "" ) {
			alert("모집 자격을 1개 이상 선택해야합니다.");
			$('[name=team_memberCategory]').focus(); 
			return ;
		}
		
		params.contestName = $('[name=contestName]').val();
		params.contestCompany = $('[name=contestCompany]').val();
		params.contestHolder = $('[name=contestHolder]').val();
		params.contestUrl = $('[name=contestUrl]').val();
		params.contestPrize = $('[name=contestPrize]').val();
		params.contestDeadline = $('[name=contestDeadline]').val();
		params.category = category;
		params.job = jobType;
		
		$('.member_event').not('.deleted_event')
		var length = $('[name=schduleDate]').length;
		
		for( var i = 0; i < length; i++ ) {
			if( $('[name=schduleDate]')[i].value == "" ) {
				alert(i+1 + "번째 주요행사일정을 입력해주세요.");
				$('[name=schduleDate]')[i].focus();
				return ;
			}
		}
		
		length = $('[name=schduleMemo]').length;
		
		for( var i = 0; i < length; i++ ) {
			if( $('[name=schduleMemo]')[i].value == "" ) {
				alert(i+1 + "번째 주요행사메모를 입력해주세요.");
				$('[name=schduleMemo]')[i].focus();
				return ;
			}
		}
		
		params.schduleDate = $('[name=schduleDate]').val();
		params.schduleMemo = $('[name=schduleMemo]').val();
		
		params.guideLine = guideLine;
		
		params.status = "WRITE";
		
	//	2. 유효성 검사 서비스로 이동
		var result = ${unit.ajax("contest_reg", "params")};
		
		if ( unit_isComplete(result) ){
			location.href = '/front/contest/index#recruit_gong_onList';
		} else {
			alert("입력된 값을 다시 확인해주세요.");
		}
	}


	function fn_BtnSearch() {
		
	//	1. 유효성 검사
		var params = new Object();
	
		params.compMngEmail = $('[name=MyemailAddress]').val();
		
		
		if( $('#loginYn').val() == 'Y' ) {
			params.compLoginYn = 'Y';
			params.compMngPw = '1111';
		} else {
			params.compMngPw = $('[name=Mypassword]').val();
			params.compLoginYn = 'N';
		}
		
		params.status = "SEARCH";

		if( ! fn_ChkEmail( params.compMngEmail ) ) return alert(' 이메일형식을 확인해주세요.');
		if( params.compMngPw == "" ) return alert('비밀번호를 확인해주세요.');
		
	//	2. 유효성 검사 서비스로 이동
		var result = ${unit.ajax("contest_reg", "params")};
		
		if ( unit_isComplete(result) ){
			
			var jsonDetail = result.out.list.data;
			
			var inTag = '';
			
			if( jsonDetail == "") return alert( '조회된 내용이 없습니다');
			
			$('#contestList tr').remove();
			
			$.each( jsonDetail, function( key, val) {
				
				inTag += '<tr>';
				inTag += '<td class="tdwidth30">'+val.COMP_NM+'</td>';
				inTag += '<td class="collapseCol">'+val.COMP_SPONSOR+'</td>';
				
				if( val.COMP_PERMISSION == 'Y') inTag += '<td>검수완료</td>';
				else inTag += '<td>검수중</td>';
				
				inTag += '<td class="collapseCol">';
				inTag += val.SYS_REG_DTM + ' ~ ' + val.COMP_DEADLINE;
				inTag += '</td>';
				inTag += '<td>';
				inTag += '<button class="btn_reg_table btn_reg">공고문 확인</button>';
				inTag += '<button class="btn_reg_table btn_reg">삭제하기</button>';
				inTag += '<button class="btn_reg_table btn_reg">수정하기</button>';
				inTag += '</td>';
				inTag += '</tr>';
				
			});
			
			$('#contestList').append( inTag );
			
		} else {
			alert("이메일 혹은 비밀번호를 다시 확인해주세요.");
		}
		
	}

//////////////////////////////////////////////////////////
//4. 유효성검사 함수
//////////////////////////////////////////////////////////
	function fn_ChkEmail(str) {
	    var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	    if (regExp.test(str)) return true;
		else return false;
	
	}

//////////////////////////////////////////////////////////
//5. 사용자 함수
//////////////////////////////////////////////////////////

	function fn_JobAdd( type ) {
	
		if (jobType.indexOf(type) == -1) jobType+=','+type;//type 문자가 jobType값에 없으면 추가
		else {
			//type 문자가 jobType값에 있으면 제거
			if( type == 'M' ) jobType = jobType.replace(type, '');
			else jobType = jobType.replace(','+type, '');
		}
		
		if( $('.team_memberCategory_active').length <= 0 ) jobType = replaceAll(jobType,',', '');
	}
	
	function replaceAll(str, searchStr, replaceStr) {
		return str.split(searchStr).join(replaceStr);
	}
	
</script>













