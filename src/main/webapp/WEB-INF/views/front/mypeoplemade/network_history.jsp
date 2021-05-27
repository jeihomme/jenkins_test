<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[0]}/${fn:split(requestScope['javax.servlet.forward.servlet_path'],'/')[1] }/ajax" />

<style>

@media screen and (max-width: 960px){
.lnb_item:first-child {
    padding-left: 0px;
}
}
.mhi_name{color: white!important;}
.mhi_cate { display: inline-block!important; margin-right: 10px; }
.mhi_title {display: inline-block; font-size: 16px; }
.date{margin-left: 10px;}
.mhi_text {margin-bottom: 10px;}
</style>

    <div id="container">
        <div class="sub-inner">
            <div class="profile">
                <div class="img-area">
                    <img src="" alt="profile img">
                </div>
                <div class="text-area">
                    <strong></strong>
                    <div class="btn-box">
                       <button type="button" class="" onclick="location.href='/front/mypeoplemade/myinfo' ">프로필 편집</button>
                        <div class="btn-profile-more">
                            <button type="button" class="btn-more"><i class="ico-profile-more"></i></button>
                            <ul class="more-menu">
                                <li>
                                    <a href="/front/mypage/payment">결제내역</a>
                                </li>
                                <li>
                                    <a href="/front/mypage/mycoupon">내 쿠폰</a>
                                </li>
                                <li>
                                    <a href="/front/mypage/refund">취소/환불내역</a>
                                </li>
                                <li>
                                    <a href="/front/mypeoplemade/myinfo">내정보관리</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <p class="profile-info">
                    </p>
                </div>
            </div>
            
            <div class="lnb" style="margin-top:20px;">
                <ul class="vod-nav">
                    <li class="lnb_item is-active" style="    display: inline-flex;"><a href="/front/mypeoplemade/network" style="    margin-right: 0;">내인맥</a><a href="/front/mypeoplemade/network_list" style="    padding-top: 2px;"><span class="text-point text-point-small"><span>0</span>명</span></a></li>
                    <li class="lnb_item"><a href="/front/mypeoplemade/coaching?1">VOD<span class="text-point text-point-small"><span>0</span>개</span></a></li>
                    <li class="lnb_item"><span class="hm_mail_alarm hm_mail_alarm_mypeople"></span><a href="/front/mypeoplemade/coaching?2">1:1코칭<span class="text-point text-point-small"><span>0</span>개</span></a></li>
                    <li class="lnb_item"><a href="/front/mypeoplemade/coaching?3">LIVE CLASS<span class="text-point text-point-small"><span>0</span>개</span></a></li>
                    <li class="lnb_item "><a href="/front/mypeoplemade/follow">팔로잉<span class="text-point text-point-small"><span>0</span>개</span></a></li>
                    <li class="lnb_item "><a href="/front/mypeoplemade/myinfo">내 정보관리<span class="text-point"></span></a></li>
                </ul>
            </div>
           	
            <div class="list-title">
                <ul class="sub-nav">
                	<span style="color:white;font-size:14px;">
                		<a style="cursor:context-menu;">전체 히스토리</a>
                		> 
                		<a id="masterNm" style="cursor:context-menu;"></a>
                	</span>
                </ul> 
                <div class="select" data-role="selectBox">
                    <span date-value="optValue" class="selected-option"><!-- 선택된 옵션 값이 출력되는 부분 --></span>
                    <!-- 옵션 영역 -->
                    <ul class="hide">
                        <li style="cursor:pointer;" onclick="changeHist(this.innerText)"><a >전체</a></li>
                        <li style="cursor:pointer;" onclick="changeHist(this.innerText)"><a >VOD</a></li>
                        <li style="cursor:pointer;" onclick="changeHist(this.innerText)"><a >1:1 화상</a></li>
                        <li style="cursor:pointer;" onclick="changeHist(this.innerText)"><a >1:1 채팅</a></li>
                        <li style="cursor:pointer;" onclick="changeHist(this.innerText)"><a >1:1 이메일</a></li>
                        <li style="cursor:pointer;" onclick="changeHist(this.innerText)"><a >LIVE CLASS</a></li>
                    </ul>
                </div>
            </div>
            <div class="my_network_box" >
	            <div class="my_network_box">
	            

		            <div class="list-title" style="margin-bottom:20px;">
			           	<span style="color:#26f1d4;font-size:14px;">
			           		익스플로러를 사용하시는 회원님께서는 크롬이나 엣지 브라우저를 사용하시면 이전 수업 다시보기가 가능하십니다.
			           	</span>
		            </div>
            
	                <div class="my_history_box">
	                </div><!-- //.my_history_box  -->
	            </div>
            </div>
        </div>

        
        
        
    </div><!-- // #container -->

<script type="text/javascript">

var body = document.querySelector('body');
var select = document.querySelector('[data-role="selectBox"]');
var values = select.querySelector('[date-value="optValue"]');
var option = select.querySelector('ul');
var opts = option.querySelectorAll('li');

/* 셀렉트영역 클릭 시 옵션 숨기기, 보이기 */
function selects(e){
    e.stopPropagation();
    if(option.classList.contains('hide')){
        option.classList.remove('hide');
        option.classList.add('show');
    }else{
        option.classList.add('hide');
        option.classList.remove('show');
    }
    selectOpt();
}

/* 옵션선택 */
function selectOpt(){
	$.each(opts, function(key,val){
		const innerValue = opt.innerHTML;
		function changeValue(){
            values.innerHTML = innerValue;
        }
        opt.addEventListener('click',changeValue)
	});
	
//     opts.forEach(opt=>{
//         const innerValue = opt.innerHTML;
//         function changeValue(){
//             values.innerHTML = innerValue;
//         }
//         opt.addEventListener('click',changeValue)
//     });
}

/* 렌더링 시 옵션의 첫번째 항목 기본 선택 */
function selectFirst(){
    const firstValue = opts[0].innerHTML;
    values.innerHTML = firstValue;
}

/* 옵션밖의 영역(=바디) 클릭 시 옵션 숨김 */
function hideSelect(){
    if(option.classList.contains('show')){
        option.classList.add('hide');
        option.classList.remove('show');
    }
}

selectFirst();
select.addEventListener('click',selects);
body.addEventListener('click',hideSelect);

var histCateIdx = '';

$(function(){
	var params = new Object();
	params.status = "DETAIL";
	params.query = "selectFrontMypeoplemadePrdtCnt";
	params.frontLoginIdx = localStorage.getItem("frontLoginIdx");
	var result = ${unit.ajax( ajaxUrl, "ajax", "params")};
	var prdtCntData = result.out.detail.data[0];
	$('.text-point-small span').eq(0).text( prdtCntData.NET_CNT );
	$('.text-point-small span').eq(1).text( prdtCntData.VOD_CNT );
	$('.text-point-small span').eq(2).text( prdtCntData.COACH_CNT );
	$('.text-point-small span').eq(3).text( prdtCntData.LIVE_CNT );
	$('.text-point-small span').eq(4).text( prdtCntData.FOLL_CNT );
	
	histCateIdx = '${ out.params.cateIdx }';
	
	var params = new Object();
	params.query = 'selectFrontNetworkHistList';
	params.status = "LIST";
	params.CATE_IDX = histCateIdx;
	params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
	
	var resultList = fn_DataAjax2( params );
	
	var networkHistList = resultList.out.detail.data;
	
	if ( networkHistList.length > 0 ) {
		var html = '';
		$.each(networkHistList, function( k, v ){
			
			$('#masterNm').text( v.USER_NM );
			
			setUuid( v.USER_UUID );
			unit_fileGet( 'USER_UUID_FILE' , "fn_fileUpload");
			
			html += '<div class="my_history_item">';
	        html += '    <div class="mhi_thumb" style="background-image: url('+$('#imgTag').val()+')"></div>';
	        html += '    <div class="mhi_info">';
	        html += '        <span class="mhi_cate" style="max-width:unset;">'+ ( (v.BUY_PRDT_TYPE.indexOf('1:1') > -1) ? v.BUY_PRDT_TYPE+'상담': ( ( v.LIVE_ACAD_YN == 'Y' )? 'LIVE ACADEMY':v.BUY_PRDT_TYPE) )+'</span>';
	        if( v.BUY_PRDT_CD.indexOf('LN') > -1 )
	        	html += '        <span class="mhi_title"><a style="cursor:context-menu;">'+ v.BUY_TITL+'</a></span>';
	        else 
	        	html += '        <span class="mhi_title"><a onclick=\'window.open("'+changeURL( v.MOVE_URL, v.BUY_PRDT_CD )+'","_blank","width=1440px, height=814px, scrollbars=no, resizable=no, toolbars=no, menubar=no")\' >'+ v.BUY_TITL+'</a></span>'; 
	        
	        html += '        <span class="mhi_name">'+ v.P_CODE_NM +' · '+v.USER_NM+'';

			if ( v.F_STR == undefined ) {
				html += '            <span class="date"></span>';
			}else{
				html += '            <span class="date">'+v.F_STR+'</span>';
			}
	        
	        html += '        </span>';
	        
	        var fileArr = [];
			if( fileArr.length > 0 ){
			
			html += '        <div class="mhi_img_box">';
			$.each( fileArr, function( fileK, fileV ){
		        html += '            <div class="mhi_img">';
		        html += '                <img src="'+fileV+'" alt="">';
		        html += '            </div>';
			});
	        html += '        </div>';
			
			}
	        if ( v.REVI_CNTN != 'NO' ) {
		        html += '        <span class="mhi_text">'+v.REVI_CNTN;
		        html += '        </span>';
		        html += '        <span class="sysregdate"> 작성일 : '+ v.SYS_REG_DTM +'</span>';
			}
	        
	        if ( v.LIVE_ACAD_YN == 'Y' ) {
				html += getLiveAcad(v);				
			}

	        html += '    </div>';
	        html += '</div>';
			
	        // 이미지 초기화
	        $('#imgTag').val('');
		});
		
		$('.my_history_box').empty();
		$('.my_history_box').append( html );
		
	}else{
		alert('히스토리가없습니다.');
		history.back(-1);
	}
	
	$( '#now_loading' ).hide();
	
});

function fn_cacul_before_date( DATE_BEFORE, SYS_REG_DTM ){
	if ( DATE_BEFORE > 30 ) {
		if ( DATE_BEFORE > 60 ) {
			return '<span>'+SYS_REG_DTM+'</span>개월 전'
		}else{
			return '<span>'+Math.floor(DATE_BEFORE/30)+'</span>개월 전'
		}
	}else{
		return '<span>'+DATE_BEFORE+'</span>일 전'
	}
}

function changeHist( html ){
	var change = html;
	if ( change.indexOf('1:1') > -1  ) 	change += '상담';
	
	$('.my_history_box > .my_history_item').each(function( k, v ){
		console.log( $(this).find('.mhi_cate').text() );
		if( change == '전체' ) $(this).show();
		else if( $(this).find('.mhi_cate').text() == change ) $(this).show();
		else $(this).hide();
	});
}

function changeURL( url, prdt_cd ){
	var returnUrl = "";
	if ( prdt_cd.indexOf('VL') > -1 ) {
		returnUrl = url.replace('/front/prdt/detail','/front/mypeoplemade/vod_detail');
	}else if ( prdt_cd.indexOf('CN') > -1 ) {
		returnUrl = url.replace('/front/prdt/detail','/front/mypeoplemade/chat_review');
	}else if ( prdt_cd.indexOf('EN') > -1 ) {
		returnUrl = url.replace('/front/prdt/detail','/front/mypeoplemade/email_solution');
	}else{
		returnUrl = "";
	}
	return returnUrl;
}

function getLiveAcad( data ){
	var params = new Object();
	params.status = 'LIST';
	params.query = 'selectLiveAcadList';
	params.BUY_IDX=data.BUY_IDX;
	params.FRONT_LOGIN_IDX = localStorage.getItem('frontLoginIdx');
	
	var result = fn_DataAjax2( params );
	
	result = result.out.detail.data;
	var html = '';
	var agent = navigator.userAgent.toLowerCase();
	
	if ( result.length > 0 ) {
		html += '<div style="margin:20px;">'; 
			html += '<ul>'; 
			$.each(result, function( k,v ){
				
				//익스플로러
				if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) )
					html += '<li>저장된동영상'+(k+1)+'<span style="margin: 0 7px;">'+v.SYS_REG_DTM+'</span> <a style="text-decoration: underline;" onclick="fn_ReplayAlarm();">다시보기</a></li>';
				//타 플랫폼
				else
					html += '<li>저장된동영상'+(k+1)+'<span style="margin: 0 7px;">'+v.SYS_REG_DTM+'</span> <a href="'+v.HIST_VOD_ADDR+'" target="_blank" style="text-decoration: underline;">다시보기</a></li>';
			});
			html += '</ul>'; 
		html += '</div>'; 
		return html;
	} else {
		return '';
	}
	
}

function fn_ReplayAlarm(){
	alert('Internet Explorer에서는 점검중입니다.\n Google Chrome이나 Microsoft Edge 등 타 브라우저를 사용하시길 바랍니다.');
}

</script>
