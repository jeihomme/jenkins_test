<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />

    <div id="container">
        <div class="section_inner" style="padding-bottom: 100px;">
<!--             <div class="sub_nav_box"> -->
<!--                 <ul class="sub_nav"> -->
<!--                     <li><a href="/front/main/index" class="home"></a></li> -->
<!--                     <li><a href="#">고객센터</a></li> -->
<!--                     <li><a href="/front/service/inquiry" class="current">1:1문의</a></li> -->
<!--                 </ul> -->
<!--             </div> -->
        <section>
            <div class="section_inner">
                <div class="breadcrumb">
                    <span>홈</span>
                    <span>고객센터</span>
                    <span>1:1문의</span>
                </div>
                <h2 class="page_title">1:1문의</h2>
            </div>
        </section>
            <div class="account_double_box">
                <h3 class="account_title account_title_big">
<!--                     1:1문의 -->
                    <span class="account_title_sub first">
                        ※ 문의내용에 욕설, 성희롱 등의 내용이 포함된 경우 상담이 제한될 수 있습니다.
                    </span>
                    <span class="account_title_sub">
                        ※ 문의 전에 FAQ 에서 궁금한 점을 먼저 확인할 수 있습니다.
                    </span>
                </h3>
                
                <div class="register_box leave_box">
                    <div class="leave_text_box">
                        <div class="ooo_box">
                            <p class="ooo_item">
                                <select name="QNA_CD" id="" class="white_select">
                                    <option value="구분 선택">구분 선택</option>
                                </select>
                            </p>
                            <p class="ooo_item">
                                <input type="text" name="QNA_NAME" class="ooo_input" placeholder="이름" >
                                <input type="email" name="QNA_EMAIL" class="ooo_input" placeholder="회신 받을 메일주소를 입력 해 주세요." >
                            </p>
                            <p class="ooo_item">
                                <input type="text" name="QNA_TITL" class="ooo_input" placeholder="제목" >
                            </p>
                            <p class="ooo_item">
                                <textarea name="QNA_CNTN" id="" class="ooo_textarea"  placeholder="문의내용"></textarea>
                            </p>
                            <p class="ooo_item">
								<div class="fileArea">				
									<input type="file" id="QNA_USER_UUID_FILE" name="QNA_USER_UUID_FILE" style="display:none;margin-left:0px;" multiple maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" 
											maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."
											maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."
											totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."
											onclick="imgIdValue = $(this).attr('id');"
									/>	
									<label class="file_input_label" for="QNA_USER_UUID_FILE" >파일선택</label>
														<span class="file_label_text">10MB이하의 파일을 첨부하실 수 있습니다.</span>
									<div class="fileList" id="QNA_USER_UUID_FILEList"></div>
									<input id="QNA_USER_UUID" name="QNA_USER_UUID" type="hidden" />
									<div id="QNA_USER_UUID_FILEListClone" style="display:none;">
									<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close" style="margin-left:20px; color:#aaa;font: -webkit-control; font-size:16px;">x</span></div>
									</div>											
								</div>
                                
                            </p>
                        </div>
                        
                        <div class="ooo_inquiry_box">
                            <span class="oi_title">개인정보 수집 및 이용에 대한 동의</span>
                            <div class="oi_text_box">
                                <p class="oi_text">
                                    - 수집하는 개인정보 항목: 이메일 주소
                                    <br>
                                    작성해주시는 개인 정보는 문의 접수 및 고객 불만 해결을 위해 5년간 보관됩니다.
                                    <br>
                                    이용자는 본 동의를 거부할 수 있으나, 미동의 시 문의 접수가 불가능합니다.
                                </p>
                            </div>
                            <div class="checkbox_area">
                                    <label for="item1" class="form_check form_check_2">
                                        <input type="checkbox" id="item1" name="item1">동의합니다.
                                        <span class="form_check_mark"></span>
                                    </label>
                                </div>
                            
<!--                             <p class="oi_agree"> -->
<!--                                 <input type="checkbox" id="privacyAgreeCheck" class="custom_sq_check"> -->
<!--                                 <label for="privacyAgreeCheck" class="custom_sq_label"></label> -->
<!--                                 <label for="privacyAgreeCheck" class="custom_sq_text">동의합니다.</label> -->
<!--                             </p> -->
                        </div>
                    </div>

                    <button type="submit" class="account_btn leave_btn" onclick="fn_BtnRegist();">등록</button>
                </div>
            </div><!-- //.account_double_box  -->

        </div>
    </div><!-- // #container -->

<!-- <script type="text/javascript" src="/resources/assets/js/jquery-1.12.4.min.js"></script> -->
<!-- <script type="text/javascript" src="/resources/assets/js/slick.min.js"></script> -->
<!-- <script type="text/javascript" src="/resources/assets/js/jquery.waypoints.min.js"></script> -->
<!-- <script type="text/javascript" src="/resources/assets/js/common.js"></script> -->
<script type="text/javascript">
	$(function(){
		
		fn_SelectOption( '', 'QNA', 'QNA_CD' );
		
		$('.ooo_input').prop('disabled', false);

		if( localStorage.getItem('frontLoginNm') != 'undefined' && localStorage.getItem('frontLoginNm') != null && localStorage.getItem('frontLoginNm') != '' ) {
			$('[name=QNA_NAME]').val( localStorage.getItem('frontLoginNm') );
			$('[name=QNA_NAME]').attr('disabled', true);
		}
		if( localStorage.getItem('frontLoginId') != 'undefined' && localStorage.getItem('frontLoginNm') != null && localStorage.getItem('frontLoginNm') != '' ) {
			$('[name=QNA_EMAIL]').val( localStorage.getItem('frontLoginId') );
			$('[name=QNA_EMAIL]').attr('disabled', true);
		}
		
		
		if( window.location.search.indexOf('1') > -1  ) $('[name=QNA_CD]').val('QNA08');
		
		$( '#now_loading' ).hide();
	});

	function fn_BtnRegist(){

		if( $('[name=QNA_CD]').val() == '' ) return alert('구분을 선택해주세요.');
		if( $('[name=QNA_NAME]').val() == '' ) return alert('이름을 입력해주세요.');
		if( $('[name=QNA_EMAIL]').val() == '' ) return alert('이메일을 입력해주세요.');
		if( $('[name=QNA_CNTN]').val() == '' ) return alert('문의내용을 입력해주세요.');
		
		var params = unit_getParams("searchArea");
		params.status = "WRITE";
		params.query = "insertFrontQnaData";
		params.QNA_CD = $('[name=QNA_CD]').val();

		if( localStorage.getItem('frontLoginNm') != null ) params.QNA_NAME = localStorage.getItem('frontLoginNm');
		else params.QNA_NAME = $('[name=QNA_NAME]').val();

		if( localStorage.getItem('frontLoginId') != null ) params.QNA_EMAIL = localStorage.getItem('frontLoginId');
		else params.QNA_EMAIL = $('[name=QNA_EMAIL]').val();

		params.QNA_TITL = $('[name=QNA_TITL]').val();
		params.QNA_CNTN = $('[name=QNA_CNTN]').val();
		params.frontLoginIdx = localStorage.getItem("frontLoginIdx");

		params.QNA_USER_UUID = $('[name=QNA_USER_UUID]').val();
		
// 		if ( $('[name=NOTI_OPEN_YN]').is(':checked') ) params.NOTI_OPEN_YN = 'Y';
// 		else params.NOTI_OPEN_YN = 'N';
		
		if ( ! $('#item1').is(':checked') ) return alert('개인정보수집 동의는 필수입니다.');
		
		var result = fn_DataAjax( params, "N" );
		
		if( result ) {
			alert('정상적으로 접수되었습니다.');
// 			location.href='/front/main/index';
			history.go(-1);
		}
	}
	
	$("input[type=file][name]").change(function(){    
		  var tagId = $(this).attr('id').replace('_FILE', '');
		  if( $('#'+tagId+'').val() == '' ) setUuid( fn_GetUuid() );
		  else setUuid( $('#'+tagId+'').val() );
	});
	
</script>














