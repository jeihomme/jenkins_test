<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

<h2 class="hideHeading">컨텐츠</h2>
<div class="info_guide">
	<div class="guide_intro">
		<div class="sectionWrap">
			<div class="guide_intro_desc">
				<h3>국내 최초 공모전 팀빌딩 플랫폼, 뉴-스타터는</h3>
				뉴-스타터는 국내 최초 공모전 및 사회문제해결 도전하는 청년들에게 
				팀빌딩 서비스를 제공해주는 새로운 개념의 플랫폼 입니다.
				즉, 뉴-스타터 는 단순한 공모전 정보 제공 뿐 아니라, 
				청년들이 이곳에서 공모전을 참여하고, 팀활동을 할 수 있는 기능을 제공합니다.
			</div>
			<p class="guide_intro_btn"><button class="btn_grn btn_team_common" onclick="fn_companyPdf();">회사소개서 PDF</button></p>
			<p class="guide_intro_img"><img src="/resources/images/guide_img01.png" alt="메인이미지"/></p>
		</div>
	</div>
	<div class="guide_tab">
		<div class="sectionWrap">
			<div class="guide_tab_content">
				<p class="guide_tab_img tab_img02"><img src="/resources/images/guide_img02.png" alt="공모전 등록"/></p>
				<h3>회원가입 없이 무료로 공모전을 등록해 보세요!</h3>
				<p class="guide_tab_desc">뉴-스타터는 공모전 주최측에서 등록하신 공모전을 사용자가 실제로 참가하며, 팀활동을 할 수 있는 새로운 공모전 플랫폼 입니다.</p>
				<p class="guide_tab_btn"><button class="btn_grn btn_team_common" onclick="fn_toContestReg();">무료 등록하기</button></p>
			</div>
			<div class="guide_tab_content">
				<p class="guide_tab_img tab_img03"><img src="/resources/images/guide_img03.png" alt="광고 신청"/></p>
				<h3>뉴-스타터에서 효과적인 광고를 해보세요!</h3>
				<p class="guide_tab_desc">뉴-스타터는 도전의식이 강한 청년들이 주요한 사용자입니다. 이곳에서 공모전 홍보 및 광고를 통하여 효과적인 광고효과를 누려보세요!</p>
				<p class="guide_tab_btn"><a href="#guide_package" title="광고 신청하기"><button class="btn_grn btn_team_common">광고 신청하기</button></a></p>
			</div>
		</div>
	</div>
	<div class="guide_package">
		<div class="sectionWrap">
			<h3>패키지 광고 가격 안내</h3>
			<ul class="guide_package_list">
				<li>
					<div class="guide_package_list_box">
						<div class="guide_package_list_price">
							<h4>프리미엄 패키지</h4>
							<b>&#8361; 1,480</b>
							<strong>&#8361; 9,000,000 <span>/ 4주</span></strong>
						</div>
						<div class="guide_package_list_sublist">
							<ul>
								<li><i><img src="/resources/images/icon_info_guide.png" alt="체크"/></i>메인배너 A, B, C</li>
								<li><i><img src="/resources/images/icon_info_guide.png" alt="체크"/></i>서브배너 A, B, C</li>
								<li><i><img src="/resources/images/icon_info_guide.png" alt="체크"/></i>HOT한 공모전 노출</li>
								<li><i><img src="/resources/images/icon_info_guide.png" alt="체크"/></i>카테고리별 상위 노출</li>
								<li><i><img src="/resources/images/icon_info_guide.png" alt="체크"/></i>사용자 메일 광고</li>
								<li><i><img src="/resources/images/icon_info_guide.png" alt="체크"/></i>사용자 알림 광고</li>
							</ul>
							<p>서비스 : 블로그, 인스타 업로드</p>
						</div>
					</div>
					<p class="guide_package_list_desc">
						4주 추가: 3,000,000원 (VAT 별도)<br/>
						1주 추가: 1,000,000원 (VAT 별도)
					</p>
				</li>
				<li>
					<div class="guide_package_list_box">
						<div class="guide_package_list_price">
							<h4>배너 All in One 패키지</h4>
							<b>&#8361; 1,260</b>
							<strong>&#8361; 7,500,000 <span>/ 4주</span></strong>
						</div>
						<div class="guide_package_list_sublist">
							<ul>
								<li><i><img src="/resources/images/icon_info_guide.png" alt="체크"/></i>메인배너 A, B, C</li>
								<li><i><img src="/resources/images/icon_info_guide.png" alt="체크"/></i>서브배너 A, B, C</li>
							</ul>
							<p>서비스 : 블로그, 인스타 업로드</p>
						</div>
					</div>
					<p class="guide_package_list_desc">
						4주 추가: 7,500,000원 (VAT 별도)<br/>
						1주 추가: 2,500,000원 (VAT 별도)
					</p>
				</li>
				<li>
					<div class="guide_package_list_box">
						<div class="guide_package_list_price">
							<h4>가성비 패키지</h4>
							<b>&#8361; 4,900,000</b>
							<strong>&#8361; 2,700,000 <span>/ 4주</span></strong>
						</div>
						<div class="guide_package_list_sublist">
							<ul>
								<li><i><img src="/resources/images/icon_info_guide.png" alt="체크"/></i>서브배너 A, B</li>
								<li><i><img src="/resources/images/icon_info_guide.png" alt="체크"/></i>카테고리별 상위 노출</li>
								<li><i><img src="/resources/images/icon_info_guide.png" alt="체크"/></i>사용자 메일 광고</li>
								<li><i><img src="/resources/images/icon_info_guide.png" alt="체크"/></i>사용자 알림 광고</li>
							</ul>
							<p>서비스 : 블로그, 인스타 업로드</p>
						</div>
					</div>
					<p class="guide_package_list_desc">
						4주 추가: 2,700,000원 (VAT 별도)<br/>
						1주 추가: 900,000원 (VAT 별도)
					</p>
				</li>
				<li>
					<div class="guide_package_list_box">
						<div class="guide_package_list_price">
							<h4>PPL 패키지</h4>
							<b>&#8361; 4,500,000</b>
							<strong>&#8361; 2,400,000 <span>/ 4주</span></strong>
						</div>
						<div class="guide_package_list_sublist">
							<ul>
								<li><i><img src="/resources/images/icon_info_guide.png" alt="체크"/></i>서브배너 C</li>
								<li><i><img src="/resources/images/icon_info_guide.png" alt="체크"/></i>HOT한 공모전 노출</li>
								<li><i><img src="/resources/images/icon_info_guide.png" alt="체크"/></i>카테고리별 상위 노출</li>
							</ul>
							<p>서비스 : 블로그, 인스타 업로드</p>
						</div>
					</div>
					<p class="guide_package_list_desc">
						4주 추가: 2,400,000원 (VAT 별도)<br/>
						1주 추가: 800,000원 (VAT 별도)
					</p>
				</li>
			</ul>
			<p class="warning guide_package_warning">
				* 광고를 신청하시면 무료로 공모전을 대신 등록해 드립니다.<br/>
				* 광고비는 VAT 별도입니다.<br/>
				* 견적서를 원하시면 아래의 연락처로 연락주시기 바랍니다.<br/>
				<a href="#none" title="문의">문의: loai.info@naver.com</a>
			</p>
		</div>
	</div>
	<div id="guide_package" class="guide_option">
		<div class="sectionWrap">
			<h3>패키지 광고 가격 안내</h3>
			<table class="form_control mypage_table_common guide_option_table">
				<tbody>
					<tr>
						<th>형태</th>
						<th>종류</th>
						<th>가격</th>
						<th class="collapseCol">최소기간</th>
						<th>선택</th>
					</tr>
					<tr>
						<td class="guide_option_table_first" rowspan="3">메인 배너</td>
						<td>메인 배너 A<button class="fn_guide_option_bannerA">배너 위치 보기</button></td>
						<td>
							1주당 900,000원<br/>
							4주당 2,700,000원
						</td>
						<td class="collapseCol">4주</td>
						<td>
							<input class="form_chkbox" id="info_form_opt01" type="checkbox" name="info_form_opt01" checked/>
							<label for="info_form_opt01">선택</label>
						</td>
					</tr>
					<tr>
						<td>메인 배너 B<button class="fn_guide_option_bannerB">배너 위치 보기</button></td>
						<td>
							1주당 800,000원<br/>
							4주당 2,400,000원
						</td>
						<td class="collapseCol">4주</td>
						<td>
							<input class="form_chkbox" id="info_form_opt02" type="checkbox" name="info_form_opt02"/>
							<label for="info_form_opt02">선택</label>
						</td>
					</tr>
					<tr>
						<td>메인 배너 C<button class="fn_guide_option_bannerC">배너 위치 보기</button></td>
						<td>
							1주당 700,000원<br/>
							4주당 2,100,000원
						</td>
						<td class="collapseCol">4주</td>
						<td>
							<input class="form_chkbox" id="info_form_opt03" type="checkbox" name="info_form_opt03"/>
							<label for="info_form_opt03">선택</label>
						</td>
					</tr>
					<tr>
						<td class="guide_option_table_first" rowspan="3">서브 배너</td>
						<td>서브 배너 A<button class="fn_guide_option_bannerSA">배너 위치 보기</button></td>
						<td>
							1주당 600,000원<br/>
							4주당 1,800,000원
						</td>
						<td class="collapseCol">2주</td>
						<td>
							<input class="form_chkbox" id="info_form_opt04" type="checkbox" name="info_form_opt04"/>
							<label for="info_form_opt04">선택</label>
						</td>
					</tr>
					<tr>
						<td>서브 배너 B<button class="fn_guide_option_bannerSB">배너 위치 보기</button></td>
						<td>
							1주당 500,000원<br/>
							4주당 1,500,000원
						</td>
						<td class="collapseCol">2주</td>
						<td>
							<input class="form_chkbox" id="info_form_opt05" type="checkbox" name="info_form_opt05"/>
							<label for="info_form_opt05">선택</label>
						</td>
					</tr>
					<tr>
						<td>서브 배너 C<button class="fn_guide_option_bannerSC">배너 위치 보기</button></td>
						<td>
							1주당 500,000원<br/>
							4주당 1,500,000원
						</td>
						<td class="collapseCol">2주</td>
						<td>
							<input class="form_chkbox" id="info_form_opt06" type="checkbox" name="info_form_opt06"/>
							<label for="info_form_opt06">선택</label>
						</td>
					</tr>
					<tr>
						<td class="guide_option_table_first" rowspan="2">노출</td>
						<td>HOT 공모전 노출</td>
						<td>
							1주당 400,000원<br/>
							4주당 1,200,000원
						</td>
						<td class="collapseCol">1주</td>
						<td>
							<input class="form_chkbox" id="info_form_opt07" type="checkbox" name="info_form_opt07"/>
							<label for="info_form_opt07">선택</label>
						</td>
					</tr>
					<tr>
						<td>카테고리별 상위노출</td>
						<td>
							1주당 200,000원<br/>
							4주당 600,000원
						</td>
						<td class="collapseCol">1주</td>
						<td>
							<input class="form_chkbox" id="info_form_opt08" type="checkbox" name="info_form_opt08"/>
							<label for="info_form_opt08">선택</label>
						</td>
					</tr>
					<tr>
						<td class="guide_option_table_first" rowspan="2">직접광고</td>
						<td>사용자 메일 광고</td>
						<td>1회당 100,000원</td>
						<td class="collapseCol">1회</td>
						<td>
							<input class="form_chkbox" id="info_form_opt09" type="checkbox" name="info_form_opt09"/>
							<label for="info_form_opt09">선택</label>
						</td>
					</tr>
					<tr>
						<td>사용자 알림 광고</td>
						<td>1회당 300,000원</td>
						<td class="collapseCol">1회</td>
						<td>
							<input class="form_chkbox" id="info_form_opt10" type="checkbox" name="info_form_opt10"/>
							<label for="info_form_opt10">선택</label>
						</td>
					</tr>
					<tr>
						<td class="guide_option_table_first" rowspan="2">SNS 간접 광고</td>
						<td>블로그 업로드</td>
						<td>1회당 300,000원</td>
						<td class="collapseCol">1회</td>
						<td>
							<input class="form_chkbox" id="info_form_opt11" type="checkbox" name="info_form_opt11"/>
							<label for="info_form_opt11">선택</label>
						</td>
					</tr>
					<tr>
						<td>인스타그램 업로드</td>
						<td>1회당 300,000원</td>
						<td class="collapseCol">1회</td>
						<td>
							<input class="form_chkbox" id="info_form_opt12" type="checkbox" name="info_form_opt12"/>
							<label for="info_form_opt12">선택</label>
						</td>
					</tr>
				</tbody>
			</table>
			<p class="warning guide_option_warning">
				*빠른 시일 내에 연락드리겠습니다.<br/>
				<a href="#none" title="문의">문의: loai.info@naver.com</a><br/>
				전화번호 : 02-123-1234
			</p>
			<div class="team_submitWrap">
				<button class="btn_grn btn_team_common fn_estimatePopup">견적서 받기</button>
			</div>
		</div>
	</div>
</div>
<div class="m_footerDummy"></div>