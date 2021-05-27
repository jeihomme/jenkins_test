<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
	
<style>
	.form-inline{position: relative;}
	.delFaq{position: absolute; right: 0;}
</style>
<!-- 조회  시작-->				
<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>FAQ 관리 테이블</caption>
		<colgroup>
			<col style="width: 15%;"/>
			<col/>
			<col style="width: 15%;"/>
			<col style="width: 7%;"/>
		</colgroup>
		<tbody id = "onload">	
			<tr>
				<th scope="row">최초등록일</th>
				<td id="SYS_REG_DTM">
				</td>
			</tr>
			<tr>
				<th scope="row">등록자</th>
				<td id="SYS_REG_NM">
				</td>
			</tr>
			<tr class="novalue">
				<th scope="row">FAQ1_질문</th>
				<td id="FAQ_TITL1">
					<div class="form-inline">
						<input type="text" name="FAQ_TITL" class="form-control form-control-sm col-8" title="제목 입력" placeholder="질문을 입력하세요" />
						<a class="btn  btn-md delFaq btn-danger " style="position: absolute; right: 0;">삭제</a>
					</div>	
				</td>
			</tr>
			<tr  class="novalue">
				<th scope="row">FAQ1_답변</th>
				<td id="FAQ_CNTN1">
					<div class="form-inline">
						<input type="text" name="FAQ_CNTN" class="form-control form-control-sm col-8" title="답변 입력" placeholder="답변을 입력하세요" />
						<a id="addFaq" class="btn  btn-md addFaq btn-outline-dark " style="position: absolute; right: 0;">FAQ 추가</a>
					</div>
				</td>
			</tr>		
			<tr id="appendTarget">
				<th scope="row">노출여부</th>
				<td>
					<div >
								<input type="checkbox" id="FAQ_USE_YN" onchange="updateUseYn(${out.params.cateIdx }, this.checked, 'updateMngUseYn');" name="FAQ_USE_YN" class="input_on-off"  >
								 <label for="FAQ_USE_YN" class="label_on-off" style="margin: auto;"> 
								   <span class="marble"></span>
								   <span class="on">공개</span>
								   <span class="off">비공개</span>
								 </label>
					</div>
				</td>
			</tr>		
		</tbody>
	</table>
</div>
<div class="btn_wrap" style="position: relative;">
	<a href="${unit.move('index','')}" class="btn  btn-md btn-outline-dark">목록</a>
	<a onclick="fn_BtnRegist();" class="btn btn-md btn_key_color">저장</a>
</div>

<!-- 조회 끝 -->	

<script>


$(function(){
	var params = new Object();
	params.status = "LIST";
	params.query = "selectMngMasterfaqDetail";
	params.cateIdx = '${out.params.cateIdx }';
	var jsonDetail = fn_DataAjax2( params );
	console.log( jsonDetail );
	var faqList = jsonDetail.out.detail.data;
	if(faqList.length){
		$('#SYS_REG_DTM').text( faqList[0].SYS_REG_DTM );
		$('#SYS_REG_NM').text( faqList[0].SYS_REG_NM );
		if( faqList[0].FAQ_USE_YN == 'Y' ){
			$('#FAQ_USE_YN').prop('checked',true);
		}
	}
	
	if (faqList.length > 0) {
		
		var html = "";
		$.each(faqList, function(k,v){
	// 		$('[name=FAQ_TITL]').eq(k).val(v.FAQ_TITL);
	// 		$('[name=FAQ_TITL]').eq(k).closest('th').text('FAQ'+(k+1)+'_질문');
	// 		$('[name=FAQ_TITL]').eq(k).attr('id', 'masterFaq'+v.FAQ_IDX);
	// 		$('[name=FAQ_CNTN]').eq(k).val(v.FAQ_CNTN);
	// 		$('[name=FAQ_CNTN]').eq(k).closest('th').text('FAQ'+(k+1)+'_답변');
			html += '<tr>';
			html += '	<th scope="row">FAQ'+(k+1)+'_질문</th>';
			html += '	<td id="FAQ_TITL'+(k+1)+'">';
			html += '		<div class="form-inline">';
			html += '			<input id="masterFaq'+v.FAQ_IDX+'" type="text" name="FAQ_TITL" class="form-control form-control-sm col-8" title="제목 입력" placeholder="질문을 입력하세요" value="'+v.FAQ_TITL+'"/>';
			html += '			<a class="btn  btn-md delFaq btn-danger" style="position: absolute; right: 0;">삭제</a>';
			html += '		</div>';	
			html += '	</td>';
			html += '</tr>';
			html += '<tr>';
			html += '	<th scope="row">FAQ'+(k+1)+'_답변</th>';
			html += '	<td id="FAQ_CNTN'+(k+1)+'">';
			html += '		<div class="form-inline">';
			html += '			<input type="text" name="FAQ_CNTN" class="form-control form-control-sm col-8" title="답변 입력" placeholder="답변을 입력하세요" value="'+v.FAQ_CNTN+'" />';
			html += '		</div>';
			html += '	</td>';
			html += '</tr>';
		});
		$('.novalue').remove();
		$('#appendTarget').before(html);
		
		$('[name=FAQ_CNTN]').eq($('[name=FAQ_CNTN]').length-1).after('<a id="addFaq" class="btn  btn-md btn-outline-dark addFaq" style="position: absolute; right: 0;">FAQ 추가</a>');
	}
	
	
});


$(window).load(function(){
	if( $('#SYS_REG_DTM').text().trim() == '') $('#SYS_REG_DTM').text( getFormatDate( new Date() ) );
	if( $('#SYS_REG_NM').text().trim() == '') $('#SYS_REG_NM').text($('#mngLoginNm').text().replace('님',''));
});


function fn_BtnRegist(){
	var params = new Object();
	params.status = "WRITE";
	params.query = "insertMngMasterfaqData";
	params.CATE_IDX = '${out.params.cateIdx }';
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	if( $('[name=FAQ_USE_YN]').is(':checked') ){
		params.FAQ_USE_YN = 'Y';
	}else{
		params.FAQ_USE_YN = 'N';
	}
	$('[name=FAQ_TITL]').each(function(k){
			params.FAQ_TITL = $(this).val();
			params.FAQ_CNTN = $('#FAQ_CNTN'+(k+1)+' [name=FAQ_CNTN]').val();
			params.FAQ_IDX = this.id.replace('masterFaq','');
		if (params.FAQ_TITL != '' && params.FAQ_CNTN != '') {
			var jsonDetail = fn_DataAjax2( params );
		}
	});
	
	location.href='${unit.move("index", "" )}';
	
	
}

$(document).on("click",'.addFaq',fn_addFaq);
$(document).on("click",'.delFaq',fn_delFaq);

function fn_addFaq(){
	var faqIdx = $('[name=FAQ_TITL]').length+1;
	var html = "";
	html += '<tr>';
	html += '	<th scope="row">FAQ'+faqIdx+'_질문</th>';
	html += '	<td id="FAQ_TITL'+faqIdx+'">';
	html += '		<div class="form-inline">';
	html += '			<input type="text" name="FAQ_TITL" class="form-control form-control-sm col-8" title="제목 입력" placeholder="질문을 입력하세요" />';
	html += ' 			<a class="btn  btn-md btn-danger" style="position: absolute; right: 0;" >삭제</a>';
	html += '		</div>	';
	html += '	</td>';
	html += '</tr>';
	html += '<tr>';
	html += '	<th scope="row">FAQ'+faqIdx+'_답변</th>';
	html += '	<td id="FAQ_CNTN'+faqIdx+'">';
	html += '		<div class="form-inline">';
	html += '			<input type="text" name="FAQ_CNTN" class="form-control form-control-sm col-8" title="답변 입력" placeholder="답변을 입력하세요" />';
	html += '			<a id="addFaq" class="btn  btn-md btn-outline-dark addFaq" style="position: absolute; right: 0;">FAQ 추가</a>';
	html += '		</div>';
	html += '	</td>';
	html += '</tr>';
	
	
	$('#appendTarget').before( html );

	$('#addFaq').remove();
	
}

function fn_delFaq(){

	if (confirm('정말 삭제하시겠습니까?')) {
		
		var targetIdx = $(this).closest('td').attr('id').replace('FAQ_TITL','');
		if ( $(this).siblings('[name=FAQ_TITL]').is('[id]') ) {
			var params = new Object();
			params.status = "DELETE";
			params.query = "deleteMngMasterfaqData";
			params.CATE_IDX = '${out.params.cateIdx }';
			params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
			params.FAQ_IDX = $(this).siblings('[name=FAQ_TITL]').attr('id').replace('masterFaq','');
			fn_DataAjax2( params );
		}
		
		$('#FAQ_TITL'+targetIdx).closest('tr').remove();
		$('#FAQ_CNTN'+targetIdx).closest('tr').remove();

		if ( !$('[name=FAQ_TITL]').length ) {
			fn_addFaq();
		}
		
		$('#addFaq').remove();
		$('[name=FAQ_CNTN]').eq($('[name=FAQ_CNTN]').length-1).after('<a id="addFaq" class="btn  btn-md btn-outline-dark addFaq" style="position: absolute; right: 0;">FAQ 추가</a>');
		
		$('[name=FAQ_TITL]').each(function(k){
			$('[name=FAQ_TITL]').eq(k).closest('td').siblings('th').text('FAQ'+(k+1)+'_질문');
			$('[name=FAQ_TITL]').eq(k).closest('td').attr('id','FAQ_TITL'+(k+1));
			
			$('[name=FAQ_CNTN]').eq(k).closest('td').siblings('th').text('FAQ'+(k+1)+'_답변');
			$('[name=FAQ_CNTN]').eq(k).closest('td').attr('id','FAQ_CNTN'+(k+1));
		});
		
		
	}
}

</script>


