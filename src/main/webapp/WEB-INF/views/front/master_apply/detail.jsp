<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'search', 'ajax')}" />

<style>
.APPL_CD_CNTN_DIV{
    text-align: center;
}

.APPL_CD_CNTN{
    color: black;
    white-space: pre;
}
</style>
    <div id="container" style="background-color:#fff;">
        <div class="master_apply_section" id="searchArea">
            <div class="section_inner">
                <div class="ma_title_box">
                    <h2 class="ma_title">마스터 지원</h2>
                    <p>피플메이드의 마스터로 등록하시고 특별한 혜택을 누리세요!</p>
                </div>

                <div class="master_apply_form">
                    <div class="maf_item">
                        <span class="maf_title">기본정보 *</span>

                        <div class="maf_table_box border">
                            <div class="maf_table" style="border-top:2px solid #373737;">
                                <div class="maf_th"><span>희망활동분야</span></div>
                                <div class="maf_td">
                                    <select name="APPL_HOPE_PARENT_CD" class="maf_select"></select>
                                </div>
                            </div>
                            <div class="maf_table">
                                <div class="maf_th"><span>희망활동분야상세</span></div>
                                <div class="maf_td">
                                    <select name="APPL_HOPE_CD_1" class="maf_select"><option value="">희망활동분야 선택필요</option></select>
                                    <select name="APPL_HOPE_CD_2" class="maf_select"><option value="">희망활동분야 선택필요</option></select>
                                    <select name="APPL_HOPE_CD_3" class="maf_select"><option value="">희망활동분야 선택필요</option></select>
                                    <span class="maf_text_sub">키워드는 최대 3개까지 작성할 수 있습니다.</span>
                                </div>
                            </div>
                        </div> <!-- // .maf_table_box -->

                        <div class="maf_table_box">
                            <div>
                                <div class="maf_table">
                                    <div class="maf_th left" ><span>피플메이드에서 제공하고자 하는 서비스영역</span></div>
                                </div>
                                <div class="maf_table">
                                    <div class="maf_td no_third">
                                        <span class="maf_check_item2">
								  <label for="service01" class="form_check">
                                        <input type="checkbox" id="service01" name="APPL_SVCE_CD" value="온라인강의" >
                                        <span class="form_check_mark"></span>
                                       <label for="service01" class="custom_sq_text2">온라인강의</label>
                                    </label>
                                        </span>
                                        <span class="maf_check_item2">
								  <label for="service02" class="form_check">
                                        <input type="checkbox" id="service02" name="APPL_SVCE_CD" value="1:1화상상담" >
                                        <span class="form_check_mark"></span>
                                       <label for="service02" class="custom_sq_text2">1:1화상상담</label>
                                    </label>
                                        </span>
                                        <span class="maf_check_item2">
								  <label for="service03" class="form_check">
                                        <input type="checkbox" id="service03" name="APPL_SVCE_CD"  value="1:1채팅상담" >
                                        <span class="form_check_mark"></span>
                                       <label for="service03" class="custom_sq_text2">1:1채팅상담</label>
                                    </label>
                                        </span>
                                        <span class="maf_check_item2">
								  <label for="service04" class="form_check">
                                        <input type="checkbox" id="service04" name="APPL_SVCE_CD"  value="1:1이메일상담">
                                        <span class="form_check_mark"></span>
                                      <label for="service04" class="custom_sq_text2">1:1이메일상담</label> 
                                    </label>
                                        </span>
                                        <span class="maf_check_item2">
								  <label for="service05" class="form_check">
                                        <input type="checkbox" id="service05" name="APPL_SVCE_CD"  value="라이브클래스">
                                        <span class="form_check_mark"></span>
                                      <label for="service05" class="custom_sq_text2">라이브클래스</label>
                                    </label>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="maf_table">
                                    <div class="maf_th left"><span>나를 표현하는 짧은 문구</span></div>
                                </div>
                                <div class="maf_table">
                                    <div class="maf_td">
                                        <input type="text" name="APPL_SHORT_PR" class="maf_input maf_input_large" placeholder="ex. 청담동 쌀롱금손 MAGIC 헤어디자이너">
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="maf_table">
                                    <div class="maf_th left"><span>마스터 신청 자격</span></div>
                                </div>
                                <div class="maf_table">
                                    <div class="maf_td no_third full">
                                        <p class="maf_text_sub">전문 단체 또는 기관 등 소속 제휴사가 있는 경우 ‘제휴사 소속’을 선택해주세요.</p>
                                        
                                        <span class="maf_check_item2">
		                                    <label for="service08" class="form_check">
		                                        <input type="checkbox" id="service08" name="APPL_MAST_QUAL"  value="C">
		                                        <span class="form_check_mark"></span>
		                                    	<label for="service08" class="custom_sq_text2">자격증 및 경력인증</label> 
		                                    </label>
                                        </span>
                                        <span class="maf_check_item2">
	                                    	<label for="service09" class="form_check">
	                                        	<input type="checkbox" id="service09" name="APPL_MAST_QUAL"   value="A">
                                       			<span class="form_check_mark"></span>
                                      			<label for="service09" class="custom_sq_text2">제휴사 소속</label>
                                      			<input type="text" class="maf_input" name="APPL_MAST_QUAL_CORP" placeholder="제휴사명/소속사명" disabled> 
		                                    </label>
                                        </span>
                                        
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="maf_table" >
                                    <div class="maf_th left"><span>마스터 활동유형</span></div>
                                </div>
                                
                                <div class="maf_table">
                                <div class="maf_td no_third">
                                    <select name="APPL_MAST_TYPE_CD" id="APPL_MAST_TYPE_CD" class="maf_select"></select>
                                </div>
                                </div>
                            </div>
                            <div>
                                <div class="maf_table">
                                    <div class="maf_th left"><span>입금계좌정보</span></div>
                                </div>
                                <div class="maf_table">
                                    <div class="maf_td">
                                        <p class="maf_text_sub">* 수입이 입금될 계좌번호를 입력해주세요.</p>
                                        
                                        <span class="maf_check_item2">
                                            <input type="checkbox" id="service29" class="custom_sq_check">
<!--                                             <label for="service19" class="custom_sq_label2"></label> -->
                                            <label for="service29" class="custom_sq_text2"><span class="mastetdot">·</span>예금주</label>
                                            <input type="text" name="APPL_BANK_OWN" class="maf_input">
                                        </span>
                                        <span class="maf_check_item2">
                                            <input type="checkbox" id="service30" class="custom_sq_check">
<!--                                             <label for="service20" class="custom_sq_label2"></label> -->
                                            <label for="service30" class="custom_sq_text2"><span class="mastetdot">·</span>계좌은행</label>
                                            <input type="text" name="APPL_BANK_NM" class="maf_input" placeholder="EX) 국민은행 -> '국민은행'">
                                        </span>
                                        <span class="maf_check_item2">
                                            <input type="checkbox" id="service31" class="custom_sq_check">
<!--                                             <label for="service21" class="custom_sq_label2"></label> -->
                                            <label for="service31" class="custom_sq_text2"><span class="mastetdot">·</span>계좌번호</label>
                                            <input type="text" name="APPL_BANK_ACNT" class="maf_input" placeholder="'-'없이 숫자만 입력">
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- // .maf_table_box -->
                    </div>

                    <div class="maf_item">
                        <span class="maf_title">마스터 활동</span>

                        <div class="maf_table_box">
                            <div>
                                <div class="maf_table"style="border-top:2px solid #373737;">
                                    <div class="maf_th left"><span>현재 운영중인 SNS</span></div>
                                </div>
                                <div class="maf_table">
                                    <div class="maf_td">
                                        <span class="maf_check_item2">
                                            <input type="checkbox" id="service13" class="custom_sq_check" value="유튜브">
<!--                                             <label for="service13" class="custom_sq_label2"></label> -->
                                            <label for="service13" class="custom_sq_text2"><span class="mastetdot">·</span>유튜브</label>
                                            <input type="text" name="APPL_MAST_SNS_YOUT" class="maf_input">
                                        </span>
                                        <span class="maf_check_item2">
                                            <input type="checkbox" id="service14" class="custom_sq_check" value="인스타">
<!--                                             <label for="service14" class="custom_sq_label2"></label> -->
                                            <label for="service14" class="custom_sq_text2"><span class="mastetdot">·</span>인스타</label>
                                            <input type="text" name="APPL_MAST_SNS_INST" class="maf_input">
                                        </span>
                                        <span class="maf_check_item2">
                                            <input type="checkbox" id="service15" class="custom_sq_check" value="페이스북">
<!--                                             <label for="service15" class="custom_sq_label2"></label> -->
                                            <label for="service15" class="custom_sq_text2"><span class="mastetdot">·</span>페이스북</label>
                                            <input type="text" name="APPL_MAST_SNS_FACE" class="maf_input">
                                        </span>
                                        <span class="maf_check_item2">
                                            <input type="checkbox" id="service16" class="custom_sq_check" value="블로그">
<!--                                             <label for="service16" class="custom_sq_label2"></label> -->
                                            <label for="service16" class="custom_sq_text2"><span class="mastetdot">·</span>블로그</label>
                                            <input type="text" name="APPL_MAST_SNS_BLOG" class="maf_input">
                                        </span>
                                        <span class="maf_check_item2">
                                            <input type="checkbox" id="service17" class="custom_sq_check" value="카페">
<!--                                             <label for="service17" class="custom_sq_label2"></label> -->
                                            <label for="service17" class="custom_sq_text2"><span class="mastetdot">·</span>카페</label>
                                            <input type="text" name="APPL_MAST_SNS_CAFE" class="maf_input">
                                        </span>
                                        <span class="maf_check_item2">
                                            <input type="checkbox" id="service18" class="custom_sq_check" value="기타">
<!--                                             <label for="service18" class="custom_sq_label2"></label> -->
                                            <label for="service18" class="custom_sq_text2"><span class="mastetdot">·</span>기타</label>
                                            <input type="text" name="APPL_MAST_SNS_ETC" class="maf_input">
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="maf_table">
                                    <div class="maf_th left"><span>도서 출판 경험</span></div>
                                </div>
                                <div class="maf_table">
                                    <div class="maf_td">
                                        <p class="maf_text_sub">* 대표도서 1권만 작성해주세요. 그 외는 이력서에 첨부 바랍니다.</p>
                                        
                                        <span class="maf_check_item2">
                                            <input type="checkbox" id="service19" class="custom_sq_check">
<!--                                             <label for="service19" class="custom_sq_label2"></label> -->
                                            <label for="service19" class="custom_sq_text2"><span class="mastetdot">·</span>도서명</label>
                                            <input type="text" name="APPL_BOOK_NM" class="maf_input">
                                        </span>
                                        <span class="maf_check_item2">
                                            <input type="checkbox" id="service20" class="custom_sq_check">
<!--                                             <label for="service20" class="custom_sq_label2"></label> -->
                                            <label for="service20" class="custom_sq_text2"><span class="mastetdot">·</span>출판사</label>
                                            <input type="text" name="APPL_BOOK_PUBL" class="maf_input">
                                        </span>
                                        <span class="maf_check_item2">
                                            <input type="checkbox" id="service21" class="custom_sq_check">
<!--                                             <label for="service21" class="custom_sq_label2"></label> -->
                                            <label for="service21" class="custom_sq_text2"><span class="mastetdot">·</span>출판일</label>
                                            <input type="text" name="APPL_BOOK_PUBL_DATE" class="maf_input">
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="maf_table">
                                    <div class="maf_th left"><span>관련자격증 및 보유 기간</span></div>
                                </div>
                                <div class="maf_table">
                                    <div class="maf_td">
                                    
                                    
                                        <span class="maf_check_item2">
                                            <input type="checkbox" id="service22" class="custom_sq_check">
<!--                                             <label for="service22" class="custom_sq_label2"></label> -->
                                            <label for="service22" class="custom_sq_text2"><span class="mastetdot">·</span>자격(증)명</label>
                                            <input type="text"name="APPL_LICE_NM1"  class="maf_input">
                                        </span>
                                        <span class="maf_check_item2">
                                            <input type="checkbox" id="service24" class="custom_sq_check">
<!--                                             <label for="service24" class="custom_sq_label2"></label> -->
                                            <label for="service24" class="custom_sq_text2"><span class="mastetdot">·</span>발행기관</label>
                                            <input type="text" name="APPL_LICE_AGEN1" class="maf_input">
                                        </span>
                                        <span class="maf_check_item2">
                                            <input type="checkbox" id="service23" class="custom_sq_check">
<!--                                             <label for="service23" class="custom_sq_label2"></label> -->
                                            <label for="service23" class="custom_sq_text2"><span class="mastetdot">·</span>발행날짜</label>
                                            <input type="text" name="APPL_LICE_ACQU_DATE1" class="maf_input">
                                        </span>
                                        
                                        
                                        
                                        <span class="maf_check_item2">
                                            <input type="checkbox" id="service25" class="custom_sq_check">
<!--                                             <label for="service25" class="custom_sq_label2"></label> -->
                                            <label for="service25" class="custom_sq_text2"><span class="mastetdot">·</span>자격(증)명</label>
                                            <input type="text" name="APPL_LICE_NM2" class="maf_input">
                                        </span>
                                        <span class="maf_check_item2">
                                            <input type="checkbox" id="service27" class="custom_sq_check">
<!--                                             <label for="service27" class="custom_sq_label2"></label> -->
                                            <label for="service27" class="custom_sq_text2"><span class="mastetdot">·</span>발행기관</label>
                                            <input type="text" name="APPL_LICE_AGEN2" class="maf_input">
                                        </span>
                                        <span class="maf_check_item2">
                                            <input type="checkbox" id="service26" class="custom_sq_check">
<!--                                             <label for="service26" class="custom_sq_label2"></label> -->
                                            <label for="service26" class="custom_sq_text2"><span class="mastetdot">·</span>발행날짜</label>
                                            <input type="text" name="APPL_LICE_ACQU_DATE2" class="maf_input">
                                        </span>
                                        
                                        
                                    </div>
                                </div>
                            </div>
                        </div> <!-- // .maf_table_box -->
                    </div>

                    <div class="maf_item">
                        <span class="maf_title">첨부서류 </span>

                        <div class="maf_table_box border">
                            <div>
                                <div class="maf_table">
                                    <div class="maf_td no_third full" style="border-top:2px solid #373737;">
                                        <span class="maf_check_item2">
                                            
											<input id="APPL_UUID" name="APPL_UUID" type="hidden" />
											<div class="fileArea">	
	                                            <input type="checkbox" id="service28" class="custom_sq_check">
<!-- 	                                            <label for="service28" class="custom_sq_label2"></label> -->
	                                            <label for="service28" class="custom_sq_text2"><span class="mastetdot">·</span>이력사항</label>
<!-- 	                                            <input type="text" class="maf_input mo_file_input">			 -->
												<input type="file" id="APPL_UUID_FILE" name="APPL_UUID_FILE" style="display:none;margin-left:0px;" multiple maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" 
														maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."
														maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."
														totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."
														onclick="imgIdValue = $(this).attr('id');"
												/>	
												<label class="file_input_label" for="APPL_UUID_FILE" >파일선택</label>
<!-- 													<span class="file_possible" style="color:red !important;">( 모든 파일 구분, 다중 선택 가능 )</span>							 -->
												<span class="pdfword">  *PDF파일, DOC파일 가능</span>
												<div class="fileList" id="APPL_UUID_FILEList" style="cursor: pointer;"></div>
												<div id="APPL_UUID_FILEListClone" style="display:none;">
												<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>
												</div>											
											</div>
											
                                      
                                        </span>
                                          
                                    </div>
                                </div>
                            </div>
                        </div> <!-- // .maf_table_box -->
                    </div>

                    <div class="maf_item">
                        <div class="maf_title_box">
                            <span class="maf_title">피플메이드에서 활동하고자 하는 이유를 간략하게 적어주세요.</span>
                            <span class="maf_title_sub">1,000자 내외</span>
                        </div>

                        <textarea name="APPL_REAS" class="maf_textarea"></textarea>
                    </div>

                    <div class="maf_item">
                        <div class="maf_title_box">
                            <span class="maf_title">클래스 소개 : 오픈하고 싶은 클래스를 소개해주세요.</span>
                            <span class="maf_title_sub">1,000자 내외</span>
                        </div>

                        <textarea name="APPL_OPEN_CLAS" class="maf_textarea"></textarea>
                    </div>

                    <div class="maf_item">
                        <div class="maf_title_box">
                            <span class="maf_title">온/오프라인 강의(교육) 경력이 있다면 적어주세요.</span>
                            <span class="maf_title_sub">1,000자 내외</span>
                        </div>

                        <textarea name="APPL_LECT_CARE" class="maf_textarea"></textarea>
                    </div>
                    <div class="maf_item">
                        <div class="maf_title_box">
                            <span class="maf_text_sub">
                            신청서를 제출하신 후에는 신청서의 승인진행상태를 확인하실 수 있으며, 담당자가 지정된 후 검토과정에서 등록된 연락처(전화번호 또는 이메일)을 통해 개별적으로 연락이 취해질 수 있습니다.
<br><br>
* <strong>승인검토</strong>: 제출하신 마스터 신청서는 검토 중에 있습니다.<br>
* <strong>보완</strong>: 제출하신 마스터 신청서가 보완이 필요한 상태입니다.<br>
* <strong>승인완료</strong>: 제출하신 마스터 신청서가 승인이 완료되었습니다.<br>
* <strong>승인거절</strong>: 제출하신 마스터 신청서가 거절된 상태를 의미합니다. 플랫폼내의 콘텐츠의 중복 또는저희가 지향하는 바와 맞지 않는 등 기타의 사유로 저희 플랫폼에서 마스터로 활동할 수 없음을 의미합니다. 이는 지원하신 전문가님의 실력과 무관함을 말씀드립니다.

                            </span>
                       
                        </div>
                    </div>
                    <button type="button" onclick="fn_BtnRegist();" class="account_btn">마스터 지원완료</button>
                    
                    <div class="maf_item" style="padding-top:30px;">
                        <div class="maf_title_box APPL_CD_CNTN_DIV">
                            <span class="maf_text_sub APPL_CD_CNTN">
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="account_container2 account_containerfinish popup_wrap" >

<!--                 <button type="button" class="pop_close"></button> -->
<!--                 <span class="masterloginfinish">신청완료</span> -->

                
                
                <div id="popup-alert0" class="popup-alert">
                <div class="popup-alert-inn">
                <div class="popup-alert-text-area">
                <p class="popup-alert-text" style="color: #fff; padding: 0 0 2em 0;">    마스터 신청이 완료되었습니다.</p>
                </div>
                </div>
                                    <div class="popup_bottom_master">
                                        <button onclick="javascript:location.href='/front/main/index';" type="button" class="account_btn2finish account_btn_border3">메인이동</button>
                                        <button type="button" class="account_btn2finish2 account_btn_border4">닫기</button>
                                    </div>
                </div>
           
<!--                     <a href="/front/master_apply/detail.html" class="account_btn2finish account_btn_border3">확인</a> -->
<!--                     <a href="/front/master_apply/detail.html" class="account_btn2finish2 account_btn_border4">취소</a> -->

         </div>    
    </div><!-- // #container -->

<script>

$(function(){
	fn_SelectOption("", "CAT", "APPL_HOPE_PARENT_CD");
	fn_SelectOption("", "MAS", "APPL_MAST_TYPE_CD");
	
	fn_MastApplDetail();
	$( '#now_loading' ).hide();
});

$('[name=APPL_HOPE_PARENT_CD]').change(function(){ 
	if( $('[name=APPL_HOPE_CD_1]').val() == null || $('[name=APPL_HOPE_CD_1]').val() == '' ) fn_SelectOption($(this).val(), "CAT", "APPL_HOPE_CD_1");
	if( $('[name=APPL_HOPE_CD_2]').val() == null || $('[name=APPL_HOPE_CD_2]').val() == ''  ) fn_SelectOption($(this).val(), "CAT", "APPL_HOPE_CD_2");
	if( $('[name=APPL_HOPE_CD_3]').val() == null || $('[name=APPL_HOPE_CD_3]').val() == ''  ) fn_SelectOption($(this).val(), "CAT", "APPL_HOPE_CD_3");
	
	$('[name=APPL_HOPE_CD_1]').val('');
	$('[name=APPL_HOPE_CD_2]').val('');
	$('[name=APPL_HOPE_CD_3]').val('');
});

$('[name=APPL_MAST_QUAL]').change(function(){
	$('[name=APPL_MAST_QUAL]').prop('checked',false);
	$(this).prop('checked',true);
	
	if( $(this).val() == 'A') {
		$('[name=APPL_MAST_QUAL_CORP]').prop('disabled',false);
	} else {
		$('[name=APPL_MAST_QUAL_CORP]').prop('disabled',true);
		$('[name=APPL_MAST_QUAL_CORP]').val('');
	}
});

$('.account_btn2finish2').on('click',function(){
    $('.account_containerfinish').hide();
});

$("input[type=file][name]").change(function(){		
	var tagId = $(this).attr('id').replace('_FILE', '');
	if( $('#'+tagId+'').val() == '' ) setUuid( fn_GetUuid() );
	else setUuid( $('#'+tagId+'').val() );
});

function fn_BtnRegist(){
	
// 	$('[name^=APPL]').each(function(){
// 		if( $(this).attr('type') == 'checkbox' ) {
// 			console.log( $(this).attr('type')+ " : " + $(this).attr('name') + ', ' + $(this).val() );
// 		} else if( $(this).attr('type') == 'radio' ) {
// 			if( $(this).is(":checked") ) {
// 				console.log( $(this).attr('type')+ " : " + $(this).attr('name') + ', ' + $(this).val() );
// 			}
// 		} else if( $(this).attr('type') == 'text' ) {
// 			console.log( $(this).attr('type')+ " : " + $(this).attr('name') + ', ' + $(this).val() );
// 		} else if( $(this).prop('tagName') == 'SELECT' ) {
// 			console.log( $(this).prop('tagName')+ " : " + $(this).attr('name') + ', ' + $(this).val() );
// 		} else if( $(this).prop('tagName') == 'TEXTAREA' ) {
// 			console.log( $(this).prop('tagName')+ " : " + $(this).attr('name') + ', ' + $(this).val() );
// 		}
		
// 	});
	
	var eachChk = 0;
	var eachVal = '';
	var params = unit_getParams("searchArea");
	params.status = "WRITE";
	params.query = "insertFrontMastData";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
 
	$.each(params, function(key, val){
		if ( eachChk == 0 ) {
			if( key.indexOf("APPL") > -1 ) {
				if( val == '' ) {
					if( key == 'APPL_HOPE_PARENT_CD' ) {
						alert('희망활동분야를 입력해주세요.');
						eachChk++;
					} else if( key == 'APPL_HOPE_CD_1' ) {
						alert('첫번째 희망활동분야상세를 입력해주세요.');
						eachChk++;
					} else if( key == 'APPL_SVCE_CD' ) {
						alert('서비스영역을 입력해주세요.');
						eachChk++;
					} else if( key == 'APPL_SHORT_PR' ) {
						alert('나를 표현하는 짧은 문구를 입력해주세요.');
						eachChk++;
					} else if( key == 'APPL_MAST_QUAL_CORP' ) {
						if( params.APPL_MAST_QUAL == 'A' ) {
							alert('제휴사명 또는 소속사명을 입력해주세요.');
							eachChk++;
						}
					} else if( key == 'APPL_MAST_TYPE_CD' ) {
						alert('마스터 활동유형을 입력해주세요.');
						eachChk++;
// 					} else if( key == 'APPL_UUID' ) {
// 						alert('이력사항 첨부서류를 입력해주세요.');
// 						eachChk++;
					}
				}    
			}
		}
	});
	
	if( eachChk > 0 ) return;

	$.each(params.APPL_SVCE_CD, function(key, val){
		if( key == 0 ) eachVal = val;
		else eachVal += ','+val;
	});
	
	params.APPL_SVCE_CD = eachVal;

	$.each(params.APPL_MAST_QUAL, function(key, val){
		if( key == 0 ) eachVal = val;
		else eachVal += ','+val;
	});

	params.APPL_MAST_QUAL = eachVal;
	
	var result = fn_DataAjax( params, "N" );
	if( result ) {
		$('.account_containerfinish').show();
// 		alert('접수되었습니다. 빠른 시간내에 연락드리겠습니다.' );
// 		location.href='/front/main/index';
		fn_MastApplDetail();
	}else{
		alert('통신에 실패했습니다. 잠시 후 다시 시도해 주십시오.');
	}
}

function fn_MastApplDetail() {

	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectFrontMasterapplDetail";
	params.frontLoginIdx = localStorage.getItem('frontLoginIdx');
	
	var jsonDetail = fn_DataDetail( params );
	 
	if( jsonDetail.length > 0 ) {
		imgIdValue = 'APPL_UUID_FILE';
		setUuid( jsonDetail[0].APPL_UUID );
		unit_fileGet( imgIdValue , "fn_fileUpload");
		
		$('.account_btn').text( jsonDetail[0].APPL_CD );
		
		$('[name=APPL_HOPE_PARENT_CD]').val( jsonDetail[0].APPL_HOPE_PARENT_CD );
		
		if( $('[name=APPL_HOPE_CD_1]').val() == '' ) fn_SelectOption( jsonDetail[0].APPL_HOPE_PARENT_CD, "CAT", "APPL_HOPE_CD_1");
		if( $('[name=APPL_HOPE_CD_2]').val() == '' ) fn_SelectOption( jsonDetail[0].APPL_HOPE_PARENT_CD, "CAT", "APPL_HOPE_CD_2");
		if( $('[name=APPL_HOPE_CD_3]').val() == '' ) fn_SelectOption( jsonDetail[0].APPL_HOPE_PARENT_CD, "CAT", "APPL_HOPE_CD_3");
		
		$('[name=APPL_HOPE_CD_1]').val( jsonDetail[0].APPL_HOPE_CD_1 );
		$('[name=APPL_HOPE_CD_2]').val( jsonDetail[0].APPL_HOPE_CD_2 );
		$('[name=APPL_HOPE_CD_3]').val( jsonDetail[0].APPL_HOPE_CD_3 );
		
		if( jsonDetail[0].APPL_CD == '보완' ) {
			$('.account_btn').prop('disabled',false);
		} else {
			$('.account_btn').prop('disabled',true);
			$('textArea').prop('disabled',true);
			$('#container input').prop('disabled',true);
			$('select').prop('disabled',true);
			$('checkbox').prop('disabled',true);

			$('#APPL_UUID_FILE').prop('disabled',true);
			$('#APPL_UUID_FILEList > div > span:eq(2)').remove();
		}

		$('[name=APPL_MAST_SNS_YOUT]').val( jsonDetail[0].APPL_MAST_SNS_YOUT );
		$('[name=APPL_MAST_SNS_INST]').val( jsonDetail[0].APPL_MAST_SNS_INST );
		$('[name=APPL_MAST_SNS_FACE]').val( jsonDetail[0].APPL_MAST_SNS_FACE );
		$('[name=APPL_MAST_SNS_BLOG]').val( jsonDetail[0].APPL_MAST_SNS_BLOG );
		$('[name=APPL_MAST_SNS_CAFE]').val( jsonDetail[0].APPL_MAST_SNS_CAFE );
		$('[name=APPL_MAST_SNS_ETC]').val( jsonDetail[0].APPL_MAST_SNS_ETC );

		var APPL_SVCE_CD = jsonDetail[0].APPL_SVCE_CD.split(',');
		$.each(APPL_SVCE_CD, function(key1, val2){
			$('[name=APPL_SVCE_CD]').each(function(key,val){
				if( $(this).val() == val2 ) {
					$(this).prop('checked',true);
				}
			});
		});
		
		$('[name=APPL_SHORT_PR]').val( jsonDetail[0].APPL_SHORT_PR );
		
		if( jsonDetail[0].APPL_MAST_QUAL == 'A' ) {
			$('[name=APPL_MAST_QUAL][value="A"]').prop('checked',true);
			$('[name=APPL_MAST_QUAL_CORP]').val( jsonDetail[0].APPL_MAST_QUAL_CORP );
		} else if( jsonDetail[0].APPL_MAST_QUAL == 'C' ) {
			$('[name=APPL_MAST_QUAL][value="C"]').prop('checked',true);
		}

		$('[name=APPL_MAST_TYPE_CD]').val( jsonDetail[0].APPL_MAST_TYPE_CD );
		
		$('[name=APPL_BOOK_NM]').val( jsonDetail[0].APPL_BOOK_NM );
		$('[name=APPL_BOOK_PUBL]').val( jsonDetail[0].APPL_BOOK_PUBL );
		$('[name=APPL_BOOK_PUBL_DATE]').val( jsonDetail[0].APPL_BOOK_PUBL_DATE );

		$('[name=APPL_LICE_NM1]').val( jsonDetail[0].APPL_LICE_NM1 );
		$('[name=APPL_LICE_ACQU_DATE1]').val( jsonDetail[0].APPL_LICE_ACQU_DATE1 );
		$('[name=APPL_LICE_AGEN1]').val( jsonDetail[0].APPL_LICE_AGEN1 );
		
		$('[name=APPL_LICE_NM2]').val( jsonDetail[0].APPL_LICE_NM2 );
		$('[name=APPL_LICE_ACQU_DATE2]').val( jsonDetail[0].APPL_LICE_ACQU_DATE2 );
		$('[name=APPL_LICE_AGEN2]').val( jsonDetail[0].APPL_LICE_AGEN2 );

		$('[name=APPL_BANK_OWN]').val( jsonDetail[0].APPL_BANK_OWN );
		$('[name=APPL_BANK_NM]').val( jsonDetail[0].APPL_BANK_NM );
		$('[name=APPL_BANK_ACNT]').val( jsonDetail[0].APPL_BANK_ACNT );
		
		$('[name=APPL_REAS]').val( jsonDetail[0].APPL_REAS );
		$('[name=APPL_OPEN_CLAS]').val( jsonDetail[0].APPL_OPEN_CLAS );
		$('[name=APPL_LECT_CARE]').val( jsonDetail[0].APPL_LECT_CARE );
		
		if( jsonDetail[0].APPL_CD == '보완' || jsonDetail[0].APPL_CD == '승인거절' ) {
			$('.APPL_CD_CNTN').html( "<strong>"+ ( jsonDetail[0].APPL_CD == '보완' ? jsonDetail[0].APPL_CD+'사유' : jsonDetail[0].APPL_CD ) + "</strong><br>" +jsonDetail[0].APPL_CD_CNTN );
			$('.APPL_CD_CNTN_DIV').css({'border': '1px solid #aaa', 'border-radius': '3px', 'margin':'auto','width':'50%','padding':'10px'});
		}
// 		else
// 			$('.APPL_CD_CNTN').html( "<h1>지원해주셔서 감사합니다.</h1><br>" );
	}
}

</script>


