<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<style>
#btnSearch:hover{	color: white!important;}
</style>
<div class="tbl_view">
	<table class="view_tbl01" summary="" id="searchArea">
		<caption>쿠폰 리스트 조회</caption>
		<colgroup>
			<col style="width: 15%;" />
			<col style="width: 32.5%" />
			<col style="width: 15%;" />
			<col />
			<col style="width: 5%;" />
		</colgroup>
		<tbody>
			<tr>	
				<th scope="row">쿠폰명</th>
				<td><input type="text" id="COUP_NM" placeholder="검색어를 입력하세요" name="COUP_NM" value="${out.params.coupNm }"  class="form-control form-control-sm col-8" onkeypress="if(event.keyCode==13){fn_BtnSearch();}" ></td>	
				<th scope="row">방식</th>
				<td>
					<select id="COUP_KIND" name="COUP_KIND" class="form-control form-control-sm col-8">
						<option value="" selected="selected">전체</option>
					</select>
				</td>				
				<td rowspan="3"><a id="btnSearch" onClick="fn_BtnSearch();" class="btn btn-md btn-black">검색</a></td>
			</tr>	
			<tr>
				<th scope="row">등록일</th>
				<td colspan="3">
					<input name="COUP_STR_DTM"  type="text" class="form-control form-control-sm datepicker col-8" readonly="readonly"  style="width:45%;float:left;"  value="<c:if test="${out.params.coupStrDtm ne null}">${out.params.coupStrDtm}</c:if>"  autocomplete= "new-password" autocomplete__wrapper autocomplete />
					<span style="padding: 8px;display: inline-block; float:left;">~</span>
					<input name="COUP_END_DTM"  type="text" class="form-control form-control-sm datepicker col-8" readonly="readonly" style="width:45%;float:left;"  value="<c:if test="${out.params.coupEndDtm ne null}">${out.params.coupEndDtm}</c:if>"  autocomplete= "new-password" autocomplete__wrapper autocomplete />
				</td>		
			</tr>
		</tbody>
	</table>
</div>

<!-- 리스트  시작-->
	<div class="form-inline" style="display:flex; justify-content:space-between; padding-bottom:10px; margin-top: 30px;">	
		<span class="listCount" style="display:inline-block;">전체 <span ><span class="ppm_key_color">${out.list.paging.totalCnt }</span></span></span>		
<!-- 		<div id="sub-form-inline"> -->
<!-- 			<button class="btn btn-light  form-inline mr10 form-control-sm" onclick="excelDownload();" value="엑셀 다운로드">엑셀 다운로드</button> -->
<!-- 			<select id="selectListCnt" class="designSelectBox form-control form-control-sm mr10" title="셀렉트박스"> -->
<!-- 				<option value="10" selected="">10</option> -->
<!-- 				<option value="50">50</option> -->
<!-- 				<option value="100">100</option> -->
<!-- 				<option value="300">300</option> -->
<!-- 			</select> -->
<!-- 		</div>		 -->
	</div>

<div class="tbl_list">
	<table class="list_tbl01" summary="">
		<caption>쿠폰 리스트 테이블</caption>
		<colgroup>
			<col style="width: 5%;" />	
			<col style="width: 7%">
			<col style="width: 7%">
			<col style="width: 7%">
			<col  />	
			<col style="width: 7%;" />				
			<col style="width: 5%;" />				
			<col style="width: 7%;" />			
					
			<col style="width: 7%;" /> 
			<col style="width: 7%;" />
			<col style="width: 7%;" />
			<col style="width: 7%;" />
			<col style="width: 15%;" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">서비스</th>
				<th scope="col">분야</th>
				<th scope="col">상세분야</th>
				<th scope="col">쿠폰명</th>
				<th scope="col">방식</th>
				<th scope="col">총 발행수</th>
				<th scope="col">대상ID 수</th>
				
				<th scope="col">기간시작일</th>
				<th scope="col">기간종료일</th>
				<th scope="col">사용기간(일)</th>
				<th scope="col">등록일</th>
				<th scope="col">수정/삭제</th>
			</tr>
		</thead>
		<tbody id="cates">
			<c:choose>
				<c:when test="${fn:length(out.list.data) > 0}">
					<c:forEach items="${out.list.data}" var="row">
					<tr>
						<td>${row.NUM_DESC_ORDER }</td>
						<td>
							<c:choose>
								<c:when test='${ row.COUP_SERV_CD eq "ALL" }'>
									전체
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test='${ fn:length( fn:split(row.COUP_SERV_CD,",") ) == 1 }'>
											${ fn:split(row.COUP_SERV_CD,",")[0] }
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value='${ fn:length( fn:split(row.COUP_SERV_CD,",") )  }' type="number" var="coupServCd" />
											${ fn:split(row.COUP_SERV_CD,",")[0] } 외 ${ coupServCd -1  }건
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test='${ row.COUP_CATE_CD eq "ALL" }'>
									전체
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test='${ fn:length( fn:split(row.COUP_CATE_CD,",") ) == 1 }'>
											<c:if test='${fn:length( fn:split(row.COUP_CATE_CD,",")[0] ) > 5 }'>
											${ fn:substring( fn:split(row.COUP_CATE_CD,",")[0], 0, 5 ) } 
											</c:if>	
											<c:if test='${fn:length( fn:split(row.COUP_CATE_CD,",")[0] ) <= 5 }'>
											${ fn:split(row.COUP_CATE_CD,",")[0] }
											</c:if>	
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value='${ fn:length( fn:split(row.COUP_CATE_CD,",") )  }' type="number" var="coupCateCd" />
											<c:if test='${fn:length( fn:split(row.COUP_CATE_CD,",")[0] ) > 5 }'>
											${ fn:substring( fn:split(row.COUP_CATE_CD,",")[0], 0, 5 ) } 외 ${ coupCateCd -1  }건
											</c:if>	
											<c:if test='${fn:length( fn:split(row.COUP_CATE_CD,",")[0] ) <= 5 }'>
											${ fn:split(row.COUP_CATE_CD,",")[0] } 외 ${ coupCateCd -1  }건
											</c:if>
										
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test='${ row.COUP_CATE_CD eq "ALL" }'>
									전체
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test='${ fn:length( fn:split(row.COUP_CATE_CD,",") ) == 1 }'>
											<c:if test='${fn:length( fn:split(row.COUP_CATE_CD,",")[0] ) < 7 }'>
											전체
											</c:if>	
											<c:if test='${fn:length( fn:split(row.COUP_CATE_CD,",")[0] ) >= 7 }'>
											${ fn:split(row.COUP_CATE_CD,",")[0] }
											</c:if>
										</c:when>
										<c:otherwise>
											<c:set var="codeNotParantCateCd" value=""/>
											<c:forEach items='${ fn:split(row.COUP_CATE_CD,",") }' var="vo" varStatus="vs">
												<c:if test="${ fn:length(vo) >= 7 }">
													<c:if test='${codeNotParantCateCd eq ""}'>
													<c:set var="codeNotParantCateCd" value="${vo}"/>
													</c:if>
												</c:if>
											</c:forEach>
											<fmt:formatNumber value='${ fn:length( fn:split(row.COUP_CATE_CD,",") )  }' type="number" var="coupCateCd" />
											${ codeNotParantCateCd } 외 ${ coupCateCd-1 }건
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</td>
						<td class="coupTitle">${ row.COUP_NM } </td>
						<td>${ row.COUP_TYPE } </td>
						<td>
							<c:if test="${ row.COUP_TYPE eq '회원가입쿠폰' }">-</c:if>
							<c:if test="${ row.COUP_TYPE ne '회원가입쿠폰' }">${ row.COUP_ISSU}</c:if>
						 </td>
						<td>
							<c:if test="${ row.COUP_TYPE eq '회원가입쿠폰' }">-</c:if>
							<c:if test="${ row.COUP_TYPE ne '회원가입쿠폰' }">${ row.COUP_CNT }</c:if>
						 </td>
						<td>${row.COUP_STR_DTM}</td>
						<td>${row.COUP_END_DTM }</td>
						<td>${row.COUP_USE_DATE }</td>
						<td>${row.SYS_REG_DTM }</td>
						<td>
							<a href='${unit.move("tab", row.COUP_IDX, "coup", "coup_edit" )}' class="btn btn-md btn_key_color2">수정</a>
							<c:choose>
								<c:when test="${ row.COUP_IDX eq 1 }">
								</c:when>
								<c:otherwise>
									<button onclick="fn_delete(${row.COUP_IDX}, ${ row.COUP_CNT });" class="btn_td2">삭제</button>
								</c:otherwise>							
							</c:choose>
						</td>
					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="15">등록된 내용이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>

	<c:set value="${out.list.paging}"  var="paging" />
	<%@ include file="/WEB-INF/views/shared/mng_paging.jspf" %>
	<div class="col-4 btn_pagination" style="margin: 29px 0 0; float: right"><a href='${unit.move("write", "" )}' class="btn btn-md btn_key_color">등록</a></div> 

<script type="text/javascript">

//////////////////////////////////////////////////////////
// 1. 변수 초기화
//////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////
// 2. 첫 실행 함수
//////////////////////////////////////////////////////////
$(function(){
	fn_SelectOption("","COU","COUP_KIND");

	var coupCates = $('#cates tr');
	
	var parentOption = fn_SelectOption("" , "CAT", "NO_TAG");
	console.log( parentOption );
	coupCates.each(  function( key ){
		var cateCode = $(this).find('td').eq(2).text().split(' 외')[0].trim();
		
		if ( cateCode.length > 5 ) {
			cateCode = cateCode.substring(0,5);
		}
		console.log( cateCode );
		
		$.each( parentOption, function( k, v ){
			if ( cateCode==v.CODE_ID ){
				coupCates.eq(key).find('td').eq(2).text( coupCates.eq(key).find('td').eq(2).text().replace( v.CODE_ID, v.CODE_NM ) );
			}
		});
	});
	
	var allOption = fn_SelectOption("PARANT","CAT", "NO_TAG");
	coupCates.each(  function( key ){
		var cateCode = $(this).find('td').eq(3).text().split(' 외')[0].trim();
		$.each( allOption, function( k, v ){
			
			
			if ( cateCode==v.CODE_ID ){
				coupCates.eq(key).find('td').eq(3).text( coupCates.eq(key).find('td').eq(3).text().replace( v.CODE_ID, v.CODE_NM ) );
			}
		});
	});

	var allOption = fn_SelectAllOption("PRD", "NO_TAG");
	coupCates.each(  function( key ){
		var cateCode = $(this).find('td').eq(1).text().split(' 외')[0].trim();
		$.each( allOption, function( k, v ){
			if ( cateCode==v.CODE_ID ){
				coupCates.eq(key).find('td').eq(1).text( coupCates.eq(key).find('td').eq(1).text().replace( v.CODE_ID, v.CODE_NM ) );
			}
		});
	});


	$('.coupTitle').each(function(){
		$(this).text( fn_LegnthOver( $(this).text(), 15 ) );
	});
	
});

function fn_delete(coup, userCnt){
	
	if ( confirm('정말 삭제하시겠습니까?') ) {
		var params = new Object();
		params.status = "DETAIL";
		params.COUP_IDX = coup;
		params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
		params.query = "selectMngHaveUserCoupCnt";
		
		var result = fn_DataAjax2( params );
		if ( result.out.detail.data[0].COUP_TYPE == 'CPT02' ) {	return alert('회원가입 쿠폰은 삭제할수 없습니다.');	}
		
		if ( result.out.detail.data[0].HAVE_USER_COUP_CNT == 0 ) {
			
			var params = new Object();
			params.status = "DELETE";
			params.query = "deleteMngIndexCoupData";
			params.COUP_IDX = coup;
			params.mngLoginIdx = localStorage.getItem("mngLoginIdx");
			fn_DataAjax( params );
			
			location.reload();
		} else {
			alert('해당 쿠폰에 대상ID '+userCnt+'개 등록되있습니다.\n\n대상ID를 비워주시고 다시 시도하시길 바랍니다.');
		}
	}
}
//////////////////////////////////////////////////////////
//3. 사용자 함수
//////////////////////////////////////////////////////////
	
</script>



