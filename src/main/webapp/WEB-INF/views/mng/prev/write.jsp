<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
	

<style type="text/css">
.fileArea { margin-left:10px; margin-bottom:10px; }
.fileList { background-color:#ececec; border-radius:5px; padding:10px; display:none; }
.fileList div { font-size:12px; line-height: 20px; }
.fileList span.close { font-size:11px; color:red; padding-left:15px; cursor:pointer; }
	.chkbutton{
		    position: relative;
		    display: inline-block;
		    float: right;
		    width: 18%;
		    margin-left: 2%;
		    height: 30px;
		    border-radius: 3px;
		    background-color: #fff;
		    border: 1px solid #848484;
		    color: #848484;
		    vertical-align: middle;
		    font-size: 13px;
		    cursor: pointer;
		    word-break: keep-all;
	}
</style>


<!-- 리스트  시작-->
<div class="tbl_view  mb30" >
    <table class="view_tbl" summary="">
        <caption>권한관리 리스트 테이블</caption>
        <colgroup>
			<col style="width: 15%;" />
			<col style="width: 80%;" />
			<col style="width: 100px;" />	                     
         </colgroup>
        <tbody>
            <tr>
                <th scope="col">권한 그룹명</th>
                <td>
                   <input name="PREV_NM" type="text" class="form-control form-control-sm ">
                 </td>
            </tr>
        </tbody>
    </table>
</div>

<div class="id_menu">
	<ul class="wrap_i-tem">
       <li>
           <h3>
			<div class="Chkbox">
               <input type="checkbox" id="checkbox0" name="checkbox0" value=""/>
               <label for="checkbox0" class="label_txt"></label>
           </div>회원관리
           </h3>
           <ul>
               <li>
                   <div class="Chkbox">
                       <input type="checkbox" id="checkbox0_1" name="checkbox0" value="/member/"/>
                       <label for="checkbox0_1" class="label_txt">회원정보</label>
                   </div>
               </li>
           </ul>
       </li>
           
	   <li>                
		   <h3>
			<div class="Chkbox">
				<input type="checkbox" id="checkbox1" name="checkbox1" value=""/>
				<label for="checkbox1" class="label_txt"></label>
			</div>마스터관리
		   </h3> 
		   <ul>
			   <li>
				   <div class="Chkbox">
					   <input type="checkbox" id="checkbox1_1" name="checkbox1" value="/masterinfo/"/>
					   <label for="checkbox1_1" class="label_txt">마스터 정보</label>
				   </div>
			   </li>
			   <li>
				   <div class="Chkbox">
					   <input type="checkbox" id="checkbox1_2" name="checkbox1" value="/masteropen/"/>
					   <label for="checkbox1_2" class="label_txt">마스터 노출정보</label>
				   </div>
			   </li>
			   <li>
				   <div class="Chkbox">
					   <input type="checkbox" id="checkbox1_3" name="checkbox1" value="/masterappl/"/>
					   <label for="checkbox1_3" class="label_txt">마스터 신청관리</label>
				   </div>
			   </li>
			   <li>
				   <div class="Chkbox">
					   <input type="checkbox" id="checkbox1_4" name="checkbox1" value="/masterfaq/"/>
					   <label for="checkbox1_4" class="label_txt">마스터 FAQ관리</label>
				   </div>
			   </li>
			   <li>
				   <div class="Chkbox">
					   <input type="checkbox" id="checkbox1_5" name="checkbox1" value="/revi/"/>
					   <label for="checkbox1_5" class="label_txt">후기관리</label>
				   </div>
			   </li>
		   </ul>
		</li>
		
		<li>                
			<h3>
				<div class="Chkbox">
					<input type="checkbox" id="checkbox2" name="checkbox2" value=""/>
					<label for="checkbox2" class="label_txt"></label>
				</div>상품관리
			</h3> 
			<ul>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox2_1" name="checkbox2" value="/vod/"/>
						<label for="checkbox2_1" class="label_txt">VOD강의</label>
					</div>
				</li>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox2_2" name="checkbox2" value="/lect/"/>
						<label for="checkbox2_2" class="label_txt">VOD강좌</label>
					</div>
				</li>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox2_3" name="checkbox2" value="/live/"/>
						<label for="checkbox2_3" class="label_txt">라이브클래스</label>
					</div>
				</li>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox2_4" name="checkbox2" value="/face/"/>
						<label for="checkbox2_4" class="label_txt">1:1화상상담</label>
					</div>
				</li>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox2_5" name="checkbox2" value="/chat/"/>
						<label for="checkbox2_5" class="label_txt">1:1채팅상담</label>
					</div>
				</li>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox2_6" name="checkbox2" value="/mail/"/>
						<label for="checkbox2_6" class="label_txt">1:1이메일상담</label>
					</div>
				</li>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox2_7" name="checkbox2" value="/coup/"/>
						<label for="checkbox2_7" class="label_txt">쿠폰관리</label>
					</div>
				</li>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox2_8" name="checkbox2" value="/stor/"/>
						<label for="checkbox2_8" class="label_txt">스토어상품</label>
					</div>
				</li>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox2_9" name="checkbox2" value="/prdtopen/"/>
						<label for="checkbox2_9" class="label_txt">상품상세노출관리</label>
					</div>
				</li>
			</ul>
		</li>
		
		<li>                
			<h3>
				<div class="Chkbox">
					<input type="checkbox" id="checkbox3" name="checkbox3" value=""/>
					<label for="checkbox3" class="label_txt"></label>
				</div>상담관리
			</h3>
			<ul>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox3_1" name="checkbox3" value="/wait/"/>
						<label for="checkbox3_1" class="label_txt">대기중인 상담</label>
					</div>
				</li>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox3_2" name="checkbox3" value="/past/"/>
						<label for="checkbox3_2" class="label_txt">지난상담</label>
					</div>
				</li>
			</ul>
		</li>
	</ul>

	<ul class="wrap_i-tem">
		<li>                
			<h3>
				<div class="Chkbox">
					<input type="checkbox" id="checkbox4" name="checkbox4" value=""/>
					<label for="checkbox4" class="label_txt"></label>
				</div>주문/배송관리
			</h3> 
			<ul>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox4_1" name="checkbox4" value="/orde/"/>
						<label for="checkbox4_1" class="label_txt">주문관리</label>
					</div>
				</li>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox4_2" name="checkbox4" value="/deli/"/>
						<label for="checkbox4_2" class="label_txt">상품준비/발송관리</label>
					</div>
				</li>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox4_3" name="checkbox4" value="/pay/"/>
						<label for="checkbox4_3" class="label_txt">결제내역</label>
					</div>
				</li>		
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox4_4" name="checkbox4" value="/refu/"/>
						<label for="checkbox4_4" class="label_txt">취소/환불내역</label>
					</div>
				</li>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox4_5" name="checkbox4" value="/cuse/"/>
						<label for="checkbox4_5" class="label_txt">쿠폰 사용내역</label>
					</div>
				</li>
			</ul>
		</li>

		<li>                
			<h3>
				<div class="Chkbox">
					<input type="checkbox" id="checkbox5" name="checkbox5" value=""/>
					<label for="checkbox5" class="label_txt"></label>
				</div>사이트관리
			</h3> 
			<ul>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox5_1" name="checkbox5" value="/bann/"/>
						<label for="checkbox5_1" class="label_txt">메인페이지배너관리</label>
					</div>
				</li>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox5_2" name="checkbox5" value="/faq/"/>
						<label for="checkbox5_2" class="label_txt">FAQ관리</label>
					</div>
				</li>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox5_3" name="checkbox5" value="/qna/"/>
						<label for="checkbox5_3" class="label_txt">1:1문의관리</label>
					</div>
				</li>		
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox5_4" name="checkbox5" value="/noti/"/>
						<label for="checkbox5_4" class="label_txt">공지사항관리</label>
					</div>
				</li>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox5_5" name="checkbox5" value="/bannprdt/"/>
						<label for="checkbox5_5" class="label_txt">상품배너관리</label>
					</div>
				</li>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox5_6" name="checkbox5" value="/cate/"/>
						<label for="checkbox5_6" class="label_txt">카테고리관리</label>
					</div>
				</li>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox5_7" name="checkbox5" value="/mainopen/"/>
						<label for="checkbox5_7" class="label_txt">메인마스터노출관리</label>
					</div>
				</li>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox5_8" name="checkbox5" value="/mdpick/"/>
						<label for="checkbox5_8" class="label_txt">MD's Pick관리</label>
					</div>
				</li>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox5_9" name="checkbox5" value="/timedeal/"/>
						<label for="checkbox5_9" class="label_txt">타임딜관리</label>
					</div>
				</li>
			</ul>
		</li>
		
		<li>                
			<h3>
				<div class="Chkbox">
					<input type="checkbox" id="checkbox6" name="checkbox6" value=""/>
					<label for="checkbox6" class="label_txt"></label>
				</div>통계
			</h3> 
			<ul>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox6_1" name="checkbox6" value="/join/"/>
						<label for="checkbox6_1" class="label_txt">가입</label>
					</div>
				</li>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox6_2" name="checkbox6" value="/sale/"/>
						<label for="checkbox6_2" class="label_txt">매출</label>
					</div>
				</li>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox6_3" name="checkbox6" value="/prdt/"/>
						<label for="checkbox6_3" class="label_txt">상품별현황관리</label>
					</div>
				</li>		
			</ul>
		</li>

		<li>                
			<h3>
				<div class="Chkbox">
					<input type="checkbox" id="checkbox7" name="checkbox7" value=""/>
					<label for="checkbox7" class="label_txt"></label>
				</div>기본설정
			</h3> 
			<ul>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox7_1" name="checkbox7" value="/admin/"/>
						<label for="checkbox7_1" class="label_txt">관리자관리</label>
					</div>
				</li>
				<li>
					<div class="Chkbox">
						<input type="checkbox" id="checkbox7_2" name="checkbox7" value="/prev/"/>
						<label for="checkbox7_2" class="label_txt">권한관리</label>
					</div>
				</li>
			</ul>
		</li>
		
    </ul>
</div>

<div class="btn_wrap" style="position: relative; text-align: right;">
	<a href='${unit.move("index", "" )}' class="btn  btn-md btn-outline-dark" style="position: absolute; left: 0;">목록</a>
<!-- 	<a class="btn btn-md btn_key_color" onclick="fn_delete();" >삭제</a> -->
	<a class="btn btn-md btn_key_color" onclick="fn_BtnRegist();" >저장</a>
</div>

<!-- ckeditor.js -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script> -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/inline/ckeditor.js"></script> -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/balloon-block/ckeditor.js"></script> -->

<script type="text/javascript">
$(function(){
	
});

$('#checkbox0').click(function(){
	if( $(this).prop('checked') ) $('[name=checkbox0]').prop('checked', true);
	else $('[name=checkbox0]').prop('checked', false);
});

$('#checkbox1').click(function(){
	if( $(this).prop('checked') ) $('[name=checkbox1]').prop('checked', true);
	else $('[name=checkbox1]').prop('checked', false);
});

$('#checkbox2').click(function(){
	if( $(this).prop('checked') ) $('[name=checkbox2]').prop('checked', true);
	else $('[name=checkbox2]').prop('checked', false);
});

$('#checkbox3').click(function(){
	if( $(this).prop('checked') ) $('[name=checkbox3]').prop('checked', true);
	else $('[name=checkbox3]').prop('checked', false);
});

$('#checkbox4').click(function(){
	if( $(this).prop('checked') ) $('[name=checkbox4]').prop('checked', true);
	else $('[name=checkbox4]').prop('checked', false);
});

$('#checkbox5').click(function(){
	if( $(this).prop('checked') ) $('[name=checkbox5]').prop('checked', true);
	else $('[name=checkbox5]').prop('checked', false);
});

$('#checkbox6').click(function(){
	if( $(this).prop('checked') ) $('[name=checkbox6]').prop('checked', true);
	else $('[name=checkbox6]').prop('checked', false);
});

$('#checkbox7').click(function(){
	if( $(this).prop('checked') ) $('[name=checkbox7]').prop('checked', true);
	else $('[name=checkbox7]').prop('checked', false);
});

$('[name=checkbox0]').click(function(){
	$('[name=checkbox0]').each(function(key,val){
		if( $(this).val() == "" ) $(this).attr('checked', false); 
	});
	
	var legnth = $('[name=checkbox0]').length;
	var legnthCk = $('[name=checkbox0]:checked').length;
	if( (legnth-1) == legnthCk ) $("input[name=checkbox0]").prop("checked",true);
});
$('[name=checkbox1]').click(function(){
	$('[name=checkbox1]').each(function(key,val){
		if( $(this).val() == "" ) $(this).attr('checked', false); 
	});
	
	var legnth = $('[name=checkbox1]').length;
	var legnthCk = $('[name=checkbox1]:checked').length;
	if( (legnth-1) == legnthCk ) $("input[name=checkbox1]").prop("checked",true);
});

$('[name=checkbox2]').click(function(){
	$('[name=checkbox2]').each(function(key,val){
		if( $(this).val() == "" ) $(this).attr('checked', false); 
	});
	
	var legnth = $('[name=checkbox2]').length;
	var legnthCk = $('[name=checkbox2]:checked').length;
	if( (legnth-1) == legnthCk ) $("input[name=checkbox2]").prop("checked",true);
});

$('[name=checkbox3]').click(function(){
	$('[name=checkbox3]').each(function(key,val){
		if( $(this).val() == "" ) $(this).attr('checked', false); 
	});
	
	var legnth = $('[name=checkbox3]').length;
	var legnthCk = $('[name=checkbox3]:checked').length;
	if( (legnth-1) == legnthCk ) $("input[name=checkbox3]").prop("checked",true);
});

$('[name=checkbox4]').click(function(){
	$('[name=checkbox4]').each(function(key,val){
		if( $(this).val() == "" ) $(this).attr('checked', false); 
	});
	
	var legnth = $('[name=checkbox4]').length;
	var legnthCk = $('[name=checkbox4]:checked').length;
	if( (legnth-1) == legnthCk ) $("input[name=checkbox4]").prop("checked",true);
});

$('[name=checkbox5]').click(function(){
	$('[name=checkbox5]').each(function(key,val){
		if( $(this).val() == "" ) $(this).attr('checked', false); 
	});
	
	var legnth = $('[name=checkbox5]').length;
	var legnthCk = $('[name=checkbox5]:checked').length;
	if( (legnth-1) == legnthCk ) $("input[name=checkbox5]").prop("checked",true);
});


$('[name=checkbox6]').click(function(){
	$('[name=checkbox6]').each(function(key,val){
		if( $(this).val() == "" ) $(this).attr('checked', false); 
	});
	
	var legnth = $('[name=checkbox6]').length;
	var legnthCk = $('[name=checkbox6]:checked').length;
	if( (legnth-1) == legnthCk ) $("input[name=checkbox6]").prop("checked",true);
});

$('[name=checkbox7]').click(function(){
	$('[name=checkbox7]').each(function(key,val){
		if( $(this).val() == "" ) $(this).attr('checked', false); 
	});
	
	var legnth = $('[name=checkbox7]').length;
	var legnthCk = $('[name=checkbox7]:checked').length;
	if( (legnth-1) == legnthCk ) $("input[name=checkbox7]").prop("checked",true);
});


function fn_BtnRegist(){
	
	if ( $('[name=PREV_NM]').val().trim() == '' || $('[name=PREV_NM]').val().trim() == null ) return alert('권한 그룹명을 입력해 주세요.');
	
	var params = new Object();
	params.status = "WRITE";
	params.query = "insertMngPrevData";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	params.PREV_NM = $('[name=PREV_NM]').val();
	params.PREV_CD = '';
	$('input:checkbox[name^=checkbox]:checked').each(function(k){
		if ( this.value != "" ) 
			params.PREV_CD += this.value;
	});
	
	var result = fn_DataAjax( params );
	location.href='${unit.move("index", "" )}';
}

</script>

