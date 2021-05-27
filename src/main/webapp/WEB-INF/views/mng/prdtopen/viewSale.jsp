<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'index', 'ajax')}" />

 
<style>
.infoView{ border: 1px solid #222; margin-bottom: 10px; }
.infoView > div{padding: 5px; position: relative;}
.gnb_box { margin-bottom: 0; }
.gnb_list>li {width: 50%!important;}
.gnb_list>li.active { background-color: #333; }
.note-toolbar {background-color: #fff!important; border: none!important;}
.panel-default{flex: 0 0 91.666667%;   max-width: 91.666667%;}
.tool_box{position: absolute; top: 50%; right: 2.5%;}
[id^="addVod_Target"] input { margin: auto; }
.form-control-sm.designRadiobutton input[type="radio"] + label.label_txt{padding-left:0px !important;}

</style>

<!-- 조회  시작-->				
<div class="tbl_view" style="margin-bottom: 20px;">
	<table class="view_tbl01" summary="">
		<colgroup>
			<col style="width: 15%;" />
			<col  />
			<col style="width: 15%;" />
			<col  />
		</colgroup>
		<tbody id="UserTable">
			<tr>
				<th scope="row">마스터명</th>
				<td id="USER_NM"></td>
				<th scope="row">계정</th>
				<td id="USER_EMAIL"></td>
			</tr>
			<tr>
				<th scope="row">가입일</th>
				<td id="SYS_REG_DTM"></td>
				<th scope="row">마스터등록일</th>
				<td id="USER_MAST_JOIN_DTM"></td>
			</tr>
			<tr>
				<th scope="row">최근로그인</th>
				<td id="USER_LOGIN_DTM"></td>
				<th scope="row">최근상담일</th>
				<td id="USER_CONS_DTM"></td>
			</tr>
		</tbody>
	</table>
</div>	

<div class="gnb_box">
                <ul class="gnb_list">
                    <li >
                      <a href="${unit.move( 'view', out.params.prdtIdx, 'prdt' ) }">
                            소개영역
                      </a>
                    </li>
                    <li class="active">
                      <a href="${unit.move( 'tab',  out.params.prdtIdx, 'prdt' , 'viewSale' ) }">
                            판매 상품 영역
                      </a>
                    </li>
                </ul>
</div>
<div class="tbl_view" style="margin-top: 20px;">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>판매상품 관리 테이블</caption>
		<colgroup>
			<col style="width: 15%;"/>
			<col/>
		</colgroup>
		<tbody id="dataList">
			<tr>
				<th scope="row">VOD</th>
				<td >
					<div class="tbl_list">
						<table class="list_tbl01" summary="">
							<caption>동영상강좌 리스트 테이블</caption>
							<colgroup>
<%-- 								<col style="width: 15%;" />				 --%>
								<col />			
								<col style="width: 10%;" />		
								<col style="width: 10%;" />		
<%-- 								<col style="width: 10%;" />		 --%>
<%-- 								<col style="width: 10%;" />		 --%>
							</colgroup>
							<thead>
								<tr>
									<th scope="col">강의코드</th>
<!-- 									<th scope="col">강의명</th> -->
									<th scope="col">판매 상태</th>
									<th scope="col">등록일</th>
<!-- 									<th scope="col">순서</th> -->
<!-- 									<th scope="col">관리</th> -->
								</tr>
							</thead>
							<tbody id="addVod_TargetLECT">
								<tr class="noValue">
									<td colspan="11">등록된 내용이 없습니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_wrap" style="text-align: right; padding: 10px 0 0px;">
<!-- 						<a class="btn btn-md btn_key_color" onclick="alertShow('800','','search_vod');fn_BtnFindVod('LECT');">추가</a> -->
					</div>
				</td>
			</tr>					
			<tr>
				<th scope="row">1:1화상상담</th>
				<td >
					<div class="tbl_list">
						<table class="list_tbl01" summary="">
							<caption>1:1화상상담 리스트 테이블</caption>
							<colgroup>
<%-- 								<col style="width: 15%;" />				 --%>
								<col />			
								<col style="width: 10%;" />		
								<col style="width: 10%;" />		
<%-- 								<col style="width: 10%;" />		 --%>
<%-- 								<col style="width: 10%;" />		 --%>	
							</colgroup>
							<thead>
								<tr>
									<th scope="col">강의코드</th>
<!-- 									<th scope="col">강의명</th> -->
									<th scope="col">판매 상태</th>
									<th scope="col">등록일</th>
<!-- 									<th scope="col">순서</th> -->
<!-- 									<th scope="col">관리</th> -->
								</tr>
							</thead>
							<tbody id="addVod_TargetFACE">
										<tr class="noValue">
											<td colspan="11">등록된 내용이 없습니다.</td>
										</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_wrap" style="text-align: right; padding: 10px 0 0px;">
<!-- 						<a class="btn btn-md btn_key_color" onclick="alertShow('800','','search_vod');fn_BtnFindVod('FACE');">추가</a> -->
					</div>
				</td>
			</tr>					
			<tr>
				<th scope="row">1:1채팅상담</th>
				<td >
					<div class="tbl_list">
						<table class="list_tbl01" summary="">
							<caption>1:1채팅상담 리스트 테이블</caption>
							<colgroup>
<%-- 								<col style="width: 15%;" />				 --%>
								<col />			
								<col style="width: 10%;" />		
								<col style="width: 10%;" />		
<%-- 								<col style="width: 10%;" />		 --%>
<%-- 								<col style="width: 10%;" />		 --%>	
							</colgroup>
							<thead>
								<tr>
									<th scope="col">강의코드</th>
<!-- 									<th scope="col">강의명</th> -->
									<th scope="col">판매 상태</th>
									<th scope="col">등록일</th>
<!-- 									<th scope="col">순서</th> -->
<!-- 									<th scope="col">관리</th> -->
								</tr>
							</thead>
							<tbody id="addVod_TargetCHAT">
										<tr class="noValue">
											<td colspan="11">등록된 내용이 없습니다.</td>
										</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_wrap" style="text-align: right; padding: 10px 0 0px;">
<!-- 						<a class="btn btn-md btn_key_color" onclick="alertShow('800','','search_vod');fn_BtnFindVod('CHAT');">추가</a> -->
					</div>
				</td>
			</tr>					
			<tr>
				<th scope="row">1:1이메일상담</th>
				<td >
					<div class="tbl_list">
						<table class="list_tbl01" summary="">
							<caption>1:1이메일상담 리스트 테이블</caption>
							<colgroup>
<%-- 								<col style="width: 15%;" />				 --%>
								<col />			
								<col style="width: 10%;" />		
								<col style="width: 10%;" />		
<%-- 								<col style="width: 10%;" />		 --%>
<%-- 								<col style="width: 10%;" />		 --%>
							</colgroup>
							<thead>
								<tr>
									<th scope="col">강의코드</th>
<!-- 									<th scope="col">강의명</th> -->
									<th scope="col">판매 상태</th>
									<th scope="col">등록일</th>
<!-- 									<th scope="col">순서</th> -->
<!-- 									<th scope="col">관리</th> -->
								</tr>
							</thead>
							<tbody id="addVod_TargetMAIL">
										<tr class="noValue">
											<td colspan="11">등록된 내용이 없습니다.</td>
										</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_wrap" style="text-align: right; padding: 10px 0 0px;">
<!-- 						<a class="btn btn-md btn_key_color" onclick="alertShow('800','','search_vod');fn_BtnFindVod('MAIL');">추가</a> -->
					</div>
				</td>
			</tr>					
			<tr>
				<th scope="row">라이브클래스</th>
				<td >
					<div class="tbl_list">
						<table class="list_tbl01" summary="">
							<caption>라이브클래스 리스트 테이블</caption>
							<colgroup>
<%-- 								<col style="width: 15%;" />				 --%>
								<col />			
								<col style="width: 10%;" />		
								<col style="width: 10%;" />		
<%-- 								<col style="width: 10%;" />		 --%>
<%-- 								<col style="width: 10%;" />		 --%>
							</colgroup>
							<thead>
								<tr>
									<th scope="col">강의코드</th>
<!-- 									<th scope="col">강의명</th> -->
									<th scope="col">판매 상태</th>
									<th scope="col">등록일</th>
<!-- 									<th scope="col">순서</th> -->
<!-- 									<th scope="col">관리</th> -->
								</tr>
							</thead>
							<tbody id="addVod_TargetLIVE">
										<tr class="noValue">
											<td colspan="11">등록된 내용이 없습니다.</td>
										</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_wrap" style="text-align: right; padding: 10px 0 0px;">
<!-- 						<a class="btn btn-md btn_key_color" onclick="alertShow('800','','search_vod');fn_BtnFindVod('LIVE');">추가</a> -->
					</div>
				</td>
			</tr>					
		</tbody>
	</table>
</div>



<div class="btn_wrap" style="text-align: right;">
	<a href="${ unit.move('index', '') }" class="btn btn-md btn-outline-dark">목록</a>
<!-- 	<a onclick="fn_BtnRegist();" class="btn btn-md btn_key_color">저장</a> -->
</div>


<style>
		.wd150{width: 130px;}
		
		#searchVod{
			padding: 20px 10px;
			border: 2px solid #222;
		}
		#searchVod span{
			display: inline-block;
    		width: 19%;  
    		font-weight: bold;
    	}
		#searchVod input{
			display: inline-block;
    		width: 80%;  
    	}
		#search_vod_Target td{
    		padding: 0!important;  
    	}
    	#searchVod .btn_wrap{
    		padding: 10px 0 0 0;
    	}
    	
		#addVod_Target input { margin: auto; }
    	
    	.btn-dark{
    		color: #fff;
    		background-color: #343a40;
   			border-color: #343a40;
   		}
</style>




<!-- 조회 끝 -->	
<script>
var arr = ['LECT','FACE','CHAT','LIVE','MAIL'];
$(function(){
	var prdtSaleCnt = 0;
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectMngMasterDetail";
	params.prdtCd = '${out.params.prdtIdx }';
	
	
	if ( params.prdtCd.indexOf('COACHING') > -1 ) {
		params.prdtIdx = params.prdtCd.replace('COACHING', '');
	}else{
		if( params.prdtCd.indexOf('VL') > -1 ) params.prdtType = 'VL';
		if( params.prdtCd.indexOf('LN') > -1 ) params.prdtType = 'LN';
	}
	
	if( params.prdtCd.indexOf('VL') > -1 ) prdtSaleCnt = 0;
	if( params.prdtCd.indexOf('FN') > -1 ) prdtSaleCnt = 1;
	if( params.prdtCd.indexOf('CN') > -1 ) prdtSaleCnt = 2;
	if( params.prdtCd.indexOf('EN') > -1 ) prdtSaleCnt = 3;
	if( params.prdtCd.indexOf('LN') > -1 ) prdtSaleCnt = 4;
	
	if ( params.prdtCd.indexOf('COACHING') > -1 ) {
		$('#dataList > tr').eq(4).remove();
		$('#dataList > tr').eq(0).remove();
	}else{
		$('#dataList > tr').each(function(key, val){
			if( key != prdtSaleCnt ) $(this).remove(); 
		});
	}

	var detailJson = fn_DataDetail( params );
	
	var apendImg = "";
	apendImg += '<tr>';
	apendImg += '				<th>마스터 노출 이미지</th>';
	apendImg += '				<td colspan="3">';
	apendImg += '					<div class="fileArea">				';
	apendImg += '									<input type="file" id="CATE_MASTEROPEN_UUID_FILE" name="CATE_MASTEROPEN_UUID_FILE" style="display:none;margin-left:0px;" maxsize="100" maxcount="100" totalsize="1000" callback="fn_fileUpload" ';
	apendImg += '											maxsize_msg="첨부파일 용량은 ### MB를 초과할 수 없습니다."';
	apendImg += '											maxcount_msg="첨부 갯수는 ### 개를 넘을 수 없습니다."';
	apendImg += '											totalsize_msg="최대 첨부 용량 ### MB를 초과하였습니다."';
	apendImg += '											onclick="imgIdValue = $(this).attr(\'id\');"';
	apendImg += '											onchange="checkFileTypeImg(this.value);"';
	apendImg += '									/>	';
// 	apendImg += '									<label class="btn btn-sm btn-outline-secondary" for="CATE_MASTEROPEN_UUID_FILE" >파일선택</label>';
// 	apendImg += '										<span class="file_possible" style="color:#656565 !important;">( 이미지 파일만 )</span>							 ';
	apendImg += '									<div class="fileList" id="CATE_MASTEROPEN_UUID_FILEList"></div>';
	apendImg += '									<input id="CATE_MASTEROPEN_UUID" name="CATE_MASTEROPEN_UUID" type="hidden"/>';
	apendImg += '									<div id="CATE_MASTEROPEN_UUID_FILEListClone" style="display:none;">';
// 	apendImg += '									<div><span class="fileName"></span> (<span class="fileSize"></span> MB)<span class="close">X</span></div>';
	apendImg += '									<div><span class="fileName"></span> (<span class="fileSize"></span> MB)</div>';
	apendImg += '									</div>';
	apendImg += '					</div>';
	apendImg += '				</td>';
	apendImg += '</tr>';
	
	$('#UserTable').append( apendImg );
	setUuid( detailJson[0].CATE_MASTEROPEN_UUID );
	imgIdValue = "CATE_MASTEROPEN_UUID_FILE";
	unit_fileGet( imgIdValue, "fn_fileUpload");
	
	
	$.each(arr, function(k, v){
		
		var params = new Object();
		params.status = "LIST";
		params.query = 'selectMngMasterSaleDataList';
		params.masterTab = v;
		params.prdtCd = '${out.params.prdtIdx }';
		if ( params.prdtCd.indexOf('COACHING') > -1 ) {
			params.prdtIdx = params.prdtCd.replace('COACHING', '');
		}
		
		if( params.prdtCd.indexOf('VL') > -1 ) params.prdtType = 'VL';
		if( params.prdtCd.indexOf('FN') > -1 ) params.prdtType = 'FN';
		if( params.prdtCd.indexOf('CN') > -1 ) params.prdtType = 'CN';
		if( params.prdtCd.indexOf('EN') > -1 ) params.prdtType = 'EN';
		if( params.prdtCd.indexOf('LN') > -1 ) params.prdtType = 'LN';
		listJson = fn_DataAjax2( params );
		
		console.log( listJson.out.detail.data );
		
		if ( listJson.out.detail.data.length > 0 ) {
			var html = "";
			$('#addVod_Target'+v).empty();
			$.each(listJson.out.detail.data, function(key,val){
				html += '<tr id="'+val[(v+'_CD')]+'">';
				html += '		<td><a href="'+val.PRDT_URL+'">'+val[(v+'_CD')]+'</a></td>';
// 				html += '		<td>'+val[(v+'_NM')]+'</td>';
				html += '		<td>'+val[(v+'_STAT_CD')]+'</td>';
				html += '		<td>'+val.SYS_REG_DTM+'</td>';
// 				html += '		<td>'+val.SALE_ORDE+'</td>';
// 				html += '		<td><input type="text" name="ORDE" class="form-control form-control-sm col-8" value="'+val.SALE_ORDE+'"/><input type="hidden" name="SALE_IDX" value="'+val.SALE_IDX+'" /><input type="hidden" name="'+v+'_IDX" value="'+val[(v+'_IDX')]+'" /></td>';
// 				html += '		<td><a class="removeVod" title="'+v+'">삭제</a></td>';
				html += '</tr>';
			});
			
			$('#addVod_Target'+v).append( html );
			// 저장된 값 뿌려주기 end
		}	
	});
	
	
});

</script>
