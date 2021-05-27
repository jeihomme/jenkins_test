<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDateValue"><fmt:formatDate value="${now}" pattern="yyyyMM" /></c:set>
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'index', 'ajax2')}" /> 
<!-- 쓰기  시작-->	
<div><a href='${unit.move("tab", out.params.coupIdx, "coup", "coup_edit" )}' class="btn  btn-md"  style="float:left;margin-right:4px; ">쿠폰 생성</a></div> 
<div><a href='${unit.move("edit", out.params.coupIdx, "coup" )}' class="btn  btn-md"  style="float:left; margin-right:4px;font-weight:bold; background-color:#f4b183;">대상 지정</a></div>
<div><a href='${unit.move("tab", out.params.coupIdx, "coup", "coup_list" )}' class="btn  btn-md"  style="float:left;">쿠폰 리스트</a></div>

<style>
	#coupLIst span{margin-left: 5px;}
</style>

<div class="tbl_view" style="margin-top:50px;">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>쿠폰 관리 테이블</caption>
		<colgroup>
			<col style="width: 15%;"/>
			<col style="width: 35%"/>
			<col style="width: 15%;"/>
			<col/>
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">쿠폰명</th>
				<td id="COUP_NM" colspan="3">
				</td>
			</tr>
			<tr>
				<th scope="row">배너이미지</th>
				<td colspan="3">
					<div class="fileArea">					
						<div class="fileList" id="COUP_UUID_FILEList"></div>
						<input id="COUP_UUID" name="COUP_UUID" type="hidden" />
						<div id="COUP_UUID_FILEListClone" style="display:none;">
						<div><span class="fileName"></span> (<span class="fileSize"></span> MB)</div>
						</div>											
					</div>
				
				</td>
			</tr>
			<tr>
				<th scope="row">구분</th>
				<td id="COUP_TYPE_TARGET">
				</td>
				<th scope="row">사용방식</th>
				<td id="COUP_KIND_TARGET"></td>
			</tr>
			<tr>
				<th scope="row">유효기간</th>
				<td id="COUP_PERIOD" colspan="3">
				</td>
			</tr>
			<tr>
				<th scope="row">사용기간(일)</th>
				<td id="COUP_USE_DATE_TARGET" colspan="3">
				</td>
			</tr>
			<tr>
				<th scope="row">서비스 카테고리</th>
				<td id="COUP_SERV_NM" colspan="3">
				</td>
			</tr>
			<tr>
				<th scope="row">가능 카테고리</th>
				<td id="COUP_CATE_CD" colspan="3">
				</td>
			</tr>
			<tr>
				<th scope="row">가격제한</th>
				<td id="COUP_MIN_PRICE" colspan="3">
				</td>
			</tr>
			<tr>
				<th scope="row">할인종류</th>
				<td id="COUP_DISC_NM" colspan="3">
				</td>
			</tr>
			<tr>
				<th scope="row">발행건수</th>
				<td id="COUP_ISSU_CNT" colspan="3">
				</td>
			</tr>
						
		</tbody>
	</table>
</div>

<div class="btn_wrap" style="text-align: left; margin-top: 10px;">
	※ 대상자는 발행 건수를 초과할 수 없습니다.
	<br>
	※ 마스터인 경우, 쿠폰 발행대상이 되지 않습니다.
</div>

<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>쿠폰 관리 테이블</caption>
		<colgroup>
			<col style="width: 15%;"/>
			<col/>
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">대상자</th>
				<td>
					<div class="designRadiobutton form-control-sm">
						<input type="radio" id="radio1_1" name="COUP_TARGET" checked value="ALL" />
						<label for="radio1_1" class="label_txt">전체</label>
					</div>
					<div class="designRadiobutton form-control-sm hide0" >
						<input type="radio" id="radio1_2" name="COUP_TARGET" value="EXCEL" />
						<label for="radio1_2" class="label_txt" style="padding-right: 0;">일부</label>
						<form action="${ajaxUrl}"  id="USER_EXCEL_LIST" name="USER_EXCEL_LIST" enctype="multipart/form-data" method="post" style="display: inline;" >
							<div class="fileArea" style=" padding-right: 27px; display: inline;">				
										<input type="file" id="COUP_TARGET_EXCEL" name="COUP_TARGET_EXCEL" style="display:none;margin-left:0px;" maxsize="100" maxcount="100" totalsize="1000"
												maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."
												maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."
												totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."
												onchange="checkFileTypeExcel(this.value);"
										/>	
										<label class="btn btn-sm btn-outline-secondary" for="COUP_TARGET_EXCEL" >파일선택</label>
										<label id="fileLabel" class="btn btn-sm btn btn-dark" style="display:none; color: #fff;    background-color: #343a40;    border-color: #343a40;">( 이미지사이즈- 180px*90px ,이미지 파일 jpg, png, gif )</label>
							</div>
						</form>
					</div>
					<div  class="designRadiobutton form-control-sm hide0">
						<input type="radio" id="radio1_3" name="COUP_TARGET" value="CLEAR" onclick="fn_clear();" />
						<label for="radio1_3" class="label_txt">초기화</label>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">리스트</th>
				<td>
					<div id="coupLIst">
					</div>
				</td>
			</tr>
						
		</tbody>
	</table>
</div>

<div class="btn_wrap" style="text-align: left;">
	※ 대상자 '일부'를 이용하기 위해서는 <label class="btn btn-sm btn btn-dark" style="color: rgb(255, 255, 255); background-color: rgb(52, 58, 64); border-color: rgb(52, 58, 64);" onclick="location.href ='/resources/down/PPM_COUPON_SAMPLE.xls';">샘플 다운로드</label> 해야합니다.
	
</div>

<div class="btn_wrap">
	<a href='${unit.move("index", "" )}' class="btn  btn-md btn-outline-dark"  style="float:left;">목록</a>
	<a class="btn btn-md btn_key_color" onclick="fn_BtnRegist();" style="float:right;">저장</a>
</div>

<script src="/resources/js/jquery.form.js"></script>
<script type="text/javascript">
var delList = [];
var date = new Date();


$(function(){
 	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectMngCoupDetail";
	params.COUP_IDX = "${out.params.coupIdx }";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	
	var result = fn_DataDetail( params );
	console.log(result);
	$.each(result ,function(key1, val1) {
		$.each(val1,function(key, val) {
			if( key.indexOf("IDX") > -1 ) $('#'+key+'').val(val);
			else if ( key.indexOf("COUP_CATE_CD") > -1 || key.indexOf("COUP_SERV_CD") > -1) {}
			else $('#'+key+'').html(val);
		});
		
		$('#COUP_KIND_TARGET').html( val1.COUP_KIND ) ;
		$('#COUP_TYPE_TARGET').html( val1.COUP_TYPE ) ;
		$('#COUP_USE_DATE_TARGET').html( val1.COUP_USE_DATE ) ;
		
		if ( val1.USER_COUP_CNT > 0 ) $('.btn_key_color').remove();
		if ( val1.COUP_TYPE_CD == 'CPT02' ) $('.btn_key_color').remove();
	});	

	if ( result[0].COUP_ISSU == 0 ) {
		$('#COUP_ISSU_CNT').html( '전체' );
		$("#radio1_1").prop("checked", true);
		$('.hide0').hide();
	}else{
		$("#radio1_2").prop("checked", true);
	}
		
	// 기능 카테고리 값 만들기
	var coupCates = result[0].COUP_CATE_CD.split(',');
	var COUP_CATE_CD = "전체";
	
	var allOption = fn_SelectAllOption("CAT", "NO_TAG");
	$.each( coupCates, function( key, value ){
		$.each( allOption, function( k, v ){
			if ( value == v.CODE_ID ) {
				if ( key == 0 ) COUP_CATE_CD = v.CODE_NM;
				else COUP_CATE_CD += ', ' + v.CODE_NM;
			}
		});
	});
	
	$('#COUP_CATE_CD').text( COUP_CATE_CD );
	// 기능 카테고리 값 만들기 end

	// 서비스 카테고리 값 만들기
	var coupCates = result[0].COUP_SERV_CD.split(',');
	var COUP_SERV_CD = "전체";
	
	var allOption = fn_SelectAllOption("PRD", "NO_TAG");
	$.each( coupCates, function( key, value ){
		$.each( allOption, function( k, v ){
			if ( value == v.CODE_ID ) {
				if ( key == 0 ) COUP_SERV_CD = v.CODE_NM;
				else COUP_SERV_CD += ', ' + v.CODE_NM;
			}
		});
	});
	
	$('#COUP_SERV_NM').text( COUP_SERV_CD );
	// 서비스 카테고리 값 만들기 end
	
	var params = new Object();
	params.status = "LIST";
	params.query = "selectMngCoupUserList";
	params.COUP_IDX = "${out.params.coupIdx }";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	
	var resultList = fn_DataAjax2( params );
	
	if ( resultList.out.detail.data.length > 0 ) {
		var html = "";	
		$.each(  resultList.out.detail.data ,function( k ,v ){
			html 	+= '<span class=" btn btn_td4" onclick="delList.push(this.id);" id="'
					+v.DATA_IDX+'">'
					+v.USER_NM+'<span class="user" id="'
					+v.USER_IDX+'"></span><span class="btn_xxx" onclick="$(this).parent().remove();">x</span>'+'</span></span>';
		});
		$('#coupLIst').append( html );
	}
});

function fn_BtnRegist(){
	
	fn_delete();
	
	var params = new Object();
	params.status = "LIST";
	params.query = "selectMngCoupNoUserList";
	params.COUP_IDX = "${out.params.coupIdx }";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
	
	var coupList = fn_DataAjax2( params );
	
	if( $('[name=COUP_TARGET]:checked').val() == 'ALL' ){
		var params = new Object();
		params.status = "LIST";
		params.query = "selectNoCoupUserList";
		params.COUP_IDX = "${out.params.coupIdx }";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		var userList = fn_DataAjax2( params );
		userList = userList.out.detail.data.sort(function(){
			return Math.random() - Math.random();
		});
		
		var params = new Object();
		params.status = "EDIT";
		params.query = "addMngUserCoupData";
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		if ( coupList.out.detail.data.length ) {
			
			$.each(userList,function( k , v ){
				params.USER_IDX = v.USER_IDX;
				params.DATA_IDX = coupList.out.detail.data[k].DATA_IDX;
				fn_DataAjax2( params );
			});
		}
		location.href='${unit.move("tab", out.params.coupIdx, "coup", "coup_list" )}';
		
	}else if( $('[name=COUP_TARGET]:checked').val() == 'EXCEL' ){
		
		$('#coupLIst > span').each(function(k){
			if ($(this).filter('.upload')) {
				var params = new Object();
				params.status = "EDIT";
				params.query = "addMngUserCoupData";
				params.DATA_IDX = this.id;
				params.USER_IDX = $(this).find('.user').attr('id');
				params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
				fn_DataAjax2( params );
// 				console.log(params);
			}
		});
		location.href='${unit.move("tab", out.params.coupIdx, "coup", "coup_list" )}';
	}
	
}

// 쿠폰 삭제한 해준다
function fn_delete(){
	
	var params = new Object();
	params.status = "DELETE";
	params.query = "deleteMngCoupData";
	params.COUP_IDX = "${out.params.coupIdx }";
	params.mngLoginIdx = localStorage.getItem("mngLoginIdx");

	$.each(delList ,function( k, v ){
		params.DATA_IDX = v;
		fn_DataAjax2( params );
	});
}

function fn_clear(){
	$('#coupLIst').empty();
	$('#fileLabel').hide();
	$('#COUP_TARGET_EXCEL').val('');
	location.reload();
// 	$('[name=COUP_TARGET]:radio[value=EXCEL]').prop("checked", true);
}

$("#COUP_TARGET_EXCEL").change(function(){
    var fileValue = $(this).val().split("\\");
    var fileName = fileValue[fileValue.length-1];
    $('#fileLabel').show();
    $('#fileLabel').text( fileName );
//     alert('작동입니다');
    var params = new Object();
    params.status = "EXCEL";
    params.query = "";
    params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
    params.COUP_IDX = "${out.params.coupIdx }";
    
	var form = $("#USER_EXCEL_LIST")[0];
	var data = new FormData(form);
	
	$.ajax({
       	url : '/mng/coup/ajax2?COUP_IDX=${out.params.coupIdx }',
       	contentType: "application/x-www-form-urlencoded; charset=UTF-8",
       	enctype: 'multipart/form-data',
       	processData: false,
        contentType: false,
        cache: false,
       	data : data,
        success : function(data) {
        	
//         	 INFO |---------|---------|---------|-------------| 
//         	 INFO |DATA_IDX |USER_IDX |IDX_LIST |NM_LIST      | 
//         	 INFO |---------|---------|---------|-------------| 
//         	 INFO |13       |[null]   |5,4,1    |회원2,회원1,마스터1 | 
//         	 INFO |14       |[null]   |5,4,1    |회원2,회원1,마스터1 | 
//         	 INFO |15       |[null]   |5,4,1    |회원2,회원1,마스터1 | 
//         	 INFO |16       |[null]   |5,4,1    |회원2,회원1,마스터1 | 
//         	 INFO |---------|---------|---------|-------------| 
        	 
        	 
        	 
			alert("업로드가 완료되었습니다.");
//             location.reload();
			if ( data.out.detail.data.length > 0 ) {
				var html = "";
				var idxList = data.out.detail.data[0].IDX_LIST;
				var idxListArr = idxList.split(',');
				var nmList = data.out.detail.data[0].NM_LIST;
				var nmListArr = nmList.split(',');
				var exceptDataIdx = '';
				
				$.each(idxListArr, function(key, val){
					var insertCheck = 0;
					$.each(  data.out.detail.data ,function( k ,v ){
						if( exceptDataIdx.indexOf( v.DATA_IDX ) < 0 ) {
							$('.user').each(function(k1, v1){
								if( $(this).attr('id') == val ) insertCheck = 99;
							});
								
							if( insertCheck == 0 ) {
								if( v.USER_IDX == null ) {
									
									html += '<span class="btn btn-sm btn-btn_td4 upload" onclick="delList.push(this.id);" id="'
										+ v.DATA_IDX+'">'
										+ nmListArr[key]+'<span class="user" id="'
										+ val+'"></span><span class="btn_xxx" onclick="$(this).parent().remove();">x</span>'+'</span></span>';
									insertCheck = 99;
									exceptDataIdx += v.DATA_IDX+',';
								}
							}
						}
					});
				});
				
// 				$.each(  data.out.detail.data ,function( k ,v ){
// 					html += '<span class="btn btn-sm btn-outline-dark upload" onclick="delList.push(this.id); $(this).remove();" id="'+v.DATA_IDX+'">'+v.USER_NM+'<span class="user" id="'+v.USER_IDX+'"></span></span>';
// 				});
				$('#coupLIst').append( html );
			}
        },
        error : function(data){
        	alert('업로드에 실패했습니다.');
        },
        type : "POST"
    }); 
    
});

</script>

