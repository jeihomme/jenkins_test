package com.ppm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.iwonsoft.unit.PageUtil;
import com.iwonsoft.unit.UnitSVO;
import com.iwonsoft.unit.UnitVO;
import com.iwonsoft.util.RequestUtil;
import com.ppm.service.QueryService;

@Controller
@RequestMapping(value= {"/front/*/*","/mng/*/*","/cms/*/*"} )
public class GetController {

	@Resource(name="QueryService")
	private QueryService QueryService;
	
//	RequestUtil RequestUtil;
	PageUtil pageUtil;
	

//	작성일 : 2021-01-28
//	소속사 : 블루라임 커뮤니케이션즈
//	작성자 : 박재우 사원
//	
//	함수설명
//		1. hub() : GET형태 요청은 모두 이 함수로 진입한다.
//			- FRONT 페이지일 경우, others()로 진입
//			- MANAGER 페이지일 경우
//				- 목록 페이지는 index()로 진입
//				- 상세 페이지는 view()로 진입
//					- 상세 안의 TAB메뉴가 있는 경우에는 others()로 진입
//				- 등록 페이지는 write()로 진입
//				- 수정 페이지는 edit()로 진입
//		2. index()
//			- 목록데이터 [ svo.setOut("list", dataVo.getDao()); ] 반환
//			- 검색데이터 [ svo.setOut("params", dataVo.getParam()); ] 반환
//			- 페이징데이터는 목록데이터에 포함
//			
//		3. view()
//			- JSP에서 unit.move()함수로 이동
//			- unit.move()에서 전달받은 파라미터와 함께, JSP로 진입 후 상세쿼리 호출
//			
//		3. write()
//			- JSP에서 unit.move()함수로 이동
//			- unit.move()에서 전달받은 파라미터와 함께, JSP로 진입
//			
//		4. edit()
//			- JSP에서 unit.move()함수로 이동
//			- unit.move()에서 전달받은 파라미터와 함께, JSP로 진입 후 상세쿼리 호출
//		5. others()
//			- 불특정 다수의 GET형태의 요청을 해당 함수로 진입
//			- 호출 시, URL에 맞는 기능을 직접적인 추가 요구
	
	
	/**
	 * 
	 * @param svo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/{dest}", method=RequestMethod.GET)	
	public ModelAndView hub(UnitSVO svo, HttpServletRequest request, HttpServletResponse response, @PathVariable("dest") String dest, Model model) throws Exception{
		
		UnitVO dataVo = new UnitVO(svo.getIn());
		String [] path = request.getServletPath().split("/");
		String group = path[1];
		String subject = path[2].substring(0,1).toUpperCase() + path[2].substring(1);
		svo.setVars(path[2]);
		dataVo.set("pageCd", svo.getPageCd());
		dataVo.setAll( svo.getValues() );

		if( group.indexOf("mng") > -1 ) if(  subject.indexOf("Login") < 0) if( RequestUtil.getSession("mngLoginIdx") == null ) return svo.redirectMV("/mng/login/login");
			
		if( group.equals("front") ) {
			others(svo, request, response,dest, dataVo, group, subject, model);
		} else {
			if ("index".equals(svo.getPageCd())) index(svo, request, dataVo, group, subject);
			else if ("view".equals(svo.getPageCd())) view(svo, request, dataVo, group, subject);
			else if ("tab".equals(svo.getPageCd())) others(svo, request, response, dest, dataVo, group, subject, model);
			else if ("write".equals(svo.getPageCd())) write(svo, request, dataVo, group, subject);
			else if ("edit".equals(svo.getPageCd())) edit(svo, request, dataVo, group, subject);
			else if (dest.indexOf("index") > -1)  index(svo, request, dataVo, group, subject);
			else others(svo, request, response, dest, dataVo, group, subject, model);
		}
		
		return svo.getMV();
	}

	/**
	 * 
	 * @param svo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("static-access")
	public ModelAndView index(UnitSVO svo, HttpServletRequest request, UnitVO dataVo, String group, String subject) throws Exception {
		dataVo.setAll(svo.getValues());
		dataVo.thisPage(svo.getPageNo());
		dataVo.pageSize(10);

		if( dataVo.get("listCnt") != null ) {
			if( ! dataVo.get("listCnt").equals("") ) {
				int listCnt = Integer.parseInt( dataVo.get("listCnt") );
				dataVo.rowSize( listCnt );
			} else dataVo.rowSize(10);
		} else dataVo.rowSize(10);
		
		String mngLoginIdx = String.valueOf(RequestUtil.getSession("mngLoginIdx")+"");
		String mngLoginType = String.valueOf(RequestUtil.getSession("mngLoginType")+"");
		dataVo.set("mngLoginIdx", mngLoginIdx);
		dataVo.set("mngLoginType", mngLoginType);
		
		String query = "select"+group.substring(0,1).toUpperCase()+group.substring(1)+subject+"ListCnt";
		dataVo.totalCnt(QueryService.selectListCnt( dataVo.getParam(), group, subject, query) );
		query ="select"+group.substring(0,1).toUpperCase()+group.substring(1)+subject+"List";
		
		String isCoach = "";
		String prdtUuidNm = dataVo.get("prdtUuidNm")+"";
		
		if( subject.equals("Wait") ) {
			isCoach = "YES";
			if( prdtUuidNm.equals("A") ) dataVo.set("prdtUuidNm", "");
		}
		
		if( subject.equals("Past") ) {
			isCoach = "YES";
			if( prdtUuidNm.equals("A") ) dataVo.set("prdtUuidNm", "");
		}
		
		List<Map<String, Object>> selectList = QueryService.selectList( dataVo.getParam(), group, subject, query );
		List<Map<String, Object>> selectListConvert = new ArrayList<Map<String, Object>>();

		String url = request.getServletPath().replace(".jsp","");

		if( ! isCoach.equals("YES") ) {
			url = url.replace("index","detail");
			url = url.replace("follow","detail");
			url = url.replace("ajax.json","detail");
			url = url.replace("refund","detail");

			url = url.replace("mypeoplemade","master");
			
			//마스터 홈 경로
			if( url.indexOf("main") > -1 ) url = url.replace("main","master");
			else if( url.indexOf("master") > -1 ) url = url.replace("master","prdt");

			//상품상세 경로
			url = url.replace("mypage","prdt");
		}
		
		String urlType = "detail";
		String userId2 = "";
		
		if(dataVo.get("FRONT_LOGIN_IDX") == null || dataVo.get("FRONT_LOGIN_IDX").equals("") ) userId2 = "free-"+request.getRemoteAddr();
		else userId2 = dataVo.get("FRONT_LOGIN_IDX");
		
		if( selectList.size() > 0 ) {
			if( group.indexOf("front") > -1 || subject.equals("Wait") || subject.equals("Past") ) {
				if( query.indexOf("Bann") < 0 || query.indexOf("Revi") < 0 || query.indexOf("Time") < 0) {
					for( Map<String, Object> selectDetail: selectList) {
						if ( selectDetail.containsKey("INFO_PLAYER") && selectDetail.containsKey("INFO_LINK") ) {
							if ( selectDetail.get("INFO_PLAYER").equals("PLAY03") ) {
								selectDetail.put( "PLAYER_URL" , makeFiveplayerToken(request, userId2, (String) selectDetail.get("INFO_LINK")) );
							}
						}

						String tempUrl = url;
						
						//마이피플 경로
						if( isCoach.equals("YES") ) {

							if( subject.equals("Wait") ) {
								tempUrl = tempUrl.replace("wait","mypeoplemade");
								tempUrl = tempUrl.replace("mng","front");
								
								if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("VL") > -1 ) tempUrl = tempUrl.replace("index","vod_detail");
								else if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("CN") > -1 ) tempUrl = tempUrl.replace("index","chat_solution");
								else if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("EN") > -1 ) tempUrl = tempUrl.replace("index","email_solution");
								else if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("FN") > -1 ) tempUrl = tempUrl.replace("index","face_history_list");
								else if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("LN") > -1 ) tempUrl = tempUrl.replace("index","face_history_list");
							} else if( subject.equals("Past") ) {
								tempUrl = tempUrl.replace("past","mypeoplemade");
								tempUrl = tempUrl.replace("mng","front");
								
								if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("VL") > -1 ) tempUrl = tempUrl.replace("index","vod_detail");
								else if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("CN") > -1 ) tempUrl = tempUrl.replace("index","chat_solution");
								else if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("EN") > -1 ) tempUrl = tempUrl.replace("index","email_solution");
								else if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("FN") > -1 ) tempUrl = tempUrl.replace("index","face_history_list");
								else if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("LN") > -1 ) tempUrl = tempUrl.replace("index","face_history_list");
							} else {
								if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("VL") > -1 ) tempUrl = tempUrl.replace("ajax.json","vod_detail");
								else if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("CN") > -1 ) tempUrl = tempUrl.replace("ajax.json","chat_solution");
								else if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("EN") > -1 ) tempUrl = tempUrl.replace("ajax.json","email_solution");
								else if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("FN") > -1 ) tempUrl = tempUrl.replace("ajax.json","face_history_list");
								else if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("LN") > -1 ) tempUrl = tempUrl.replace("ajax.json","face_history_list");
							}
						}
						
						String[] strArr = new String[10];
						strArr[0] = String.valueOf( selectDetail.get("CATE_IDX") );
						strArr[1] = String.valueOf( selectDetail.get("PRDT_CD") );
						
						if( isCoach != "" ) strArr[3] = String.valueOf( selectDetail.get("BUY_IDX") );
						selectDetail.put("MOVE_URL", pageUtil.url(tempUrl, urlType, strArr ) );

						if ( strArr[1].indexOf("FN") > -1||strArr[1].indexOf("LN") > -1 ) {
							String[] histArr = {String.valueOf( selectDetail.get("CATE_IDX") ), String.valueOf( selectDetail.get("USER_IDX") )};
							tempUrl = tempUrl.replace("ajax.json","face_history_list");
							tempUrl = tempUrl.replace("/front","https://peoplemade.net/front");
							selectDetail.put("HIST_URL", pageUtil.url(tempUrl, urlType, histArr ) );		
						}
						
						selectListConvert.add(selectDetail);
						
					}
				}
				dataVo.setDao( selectListConvert );
			} else {
				
				for( Map<String, Object> selectDetail: selectList) {
					if ( selectDetail.containsKey("INFO_PLAYER") && selectDetail.containsKey("INFO_LINK") ) {
						if ( selectDetail.get("INFO_PLAYER").equals("PLAY03") ) {
							selectDetail.put( "PLAYER_URL" , makeFiveplayerToken(request, userId2, (String) selectDetail.get("INFO_LINK")) );
						}
					}

					String tempUrl = url;
					String[] strArr = new String[10];
					strArr[0] = String.valueOf( selectDetail.get("CATE_IDX") );
					strArr[1] = String.valueOf( selectDetail.get("BUY_PRDT_CD") );
					if( isCoach != "" ) strArr[3] = String.valueOf( selectDetail.get("BUY_IDX") );
					selectDetail.put("MOVE_URL", pageUtil.url(tempUrl, urlType, strArr ) );
					selectListConvert.add(selectDetail);
				}

				dataVo.setDao( selectListConvert );
//				dataVo.setDao( selectList );
			}
		} else dataVo.setDao( selectList );
		
		svo.setOut("params", dataVo.getParam());
		svo.setOut("list", dataVo.getDao());
		
		return svo.setMV( request.getServletPath() );
		
	}

	/**
	 * 
	 * @param svo
	 * @return
	 * @throws Exception
	 */
	public ModelAndView view(UnitSVO svo, HttpServletRequest request, UnitVO dataVo, String group, String subject) throws Exception {
		dataVo.set( svo.getParam(1)+"_IDX", svo.getParam(0) );
		
		if ( request.getHeader("REFERER").indexOf("/mng/masterinfo/index") > -1 ) {
			if (request.getRequestURL().indexOf("/mng/masteropen/index") > -1) {
				dataVo.set( "CATE_IDX", svo.getParam(0) );
			}
		}
		// 상품상세 노출관리 미리보기시 필요한 값
		if ( group.equals("mng") && subject.equals("Prdtopen") ) {	dataVo.set( svo.getParam(3)+"_IDX", svo.getParam(2) ); }
		svo.setOut("params", dataVo.getParam() );

		return svo.setMV( "/"+group+"/"+subject.toLowerCase()+"/view" );
	}
	
	/**
	 * 
	 * @param svo
	 * @return
	 * @throws Exception
	 */
	public ModelAndView write(UnitSVO svo, HttpServletRequest request, UnitVO dataVo, String group, String subject) throws Exception{
		dataVo.set( svo.getParam(1)+"_IDX", svo.getParam(0) );
		svo.setOut("params", dataVo.getParam() );
		
		return svo.setMV( "/"+group+"/"+subject.toLowerCase()+"/write" );
	}
	
	/**
	 * 
	 * @param svo
	 * @return
	 * @throws Exception
	 */
	public ModelAndView edit(UnitSVO svo, HttpServletRequest request, UnitVO dataVo, String group, String subject) throws Exception{
		dataVo.set( svo.getParam(1)+"_IDX", svo.getParam(0) );
		svo.setOut("params", dataVo.getParam() );
		
		return svo.setMV( "/"+group+"/"+subject.toLowerCase()+"/edit" );
	}

	/**
	 * 
	 * @param svo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "static-access" })
	public ModelAndView others(UnitSVO svo, HttpServletRequest request, HttpServletResponse response, String dest, UnitVO dataVo, String group, String subject, Model model) throws Exception {

		if( subject.indexOf("Login") > -1 ) RequestUtil.removeSession("mngLoginIdx");
		
		ServletContext sc = request.getSession().getServletContext();
		
		if( group.indexOf("front") < 0 ) {
			dataVo.set( svo.getParam(1)+"_IDX", svo.getParam(0) );
		} else {
			if ( request.getServletPath().equalsIgnoreCase("/front/mypeoplemade/face_history_list") ) {
				dataVo.set( "CATE_IDX", svo.getParam(0) );
				dataVo.set( "FRONT_LOGIN_IDX", svo.getParam(1) );
			}else	if ( request.getServletPath().equalsIgnoreCase("/front/service/notice_detail") ) {
				dataVo.set( "NOTI_IDX", svo.getParam(0) );
			}else {
				dataVo.set( "CATE_IDX", svo.getParam(0) );
				dataVo.set( "PRDT_CD", svo.getParam(1) );
				dataVo.set( "DATA_IDX", svo.getParam(2) );
				dataVo.set( "BUY_IDX", svo.getParam(3) );
				if ( request.getServletPath().indexOf("/front/master/detail") > -1 ) {
					dataVo.set( "NOREADY", svo.getParam(6) );
				}
			}
		}
		
		dataVo.set( "MASTER_CHK",svo.getParam(2));
		svo.setOut("params", dataVo.getParam() );
		response.setHeader("Access-Control-Allow-Origin", "*");
		// 서비스 토큰 값 
		if ( request.getServletPath().equals("/front/payment/payment2") || request.getServletPath().equals("/front/payment/payment") ||
				request.getServletPath().equals("/front/payment/cart_payment") || request.getServletPath().equals("/front/payment/cart_payment_mobile") ) {
			
			response.setHeader("Access-Control-Allow-Origin", "*");	
			dataVo.set("LOGIN_IDX", request.getSession().getAttribute("LOGIN_IDX"));
			Map<String, Object> map = QueryService.selectDetail( dataVo.getParam() , "front", "Payment", "selectFrontPaymentUserPayToken");
			svo.setOut("kspaySvcTkn",  (String)map.get("KSNET_SVC_TKN") );
		}
		
		if ( request.getServletPath().equals("/mng/yoyo/index") ) {
			String query ="selectMngYoyoDetailList";
			dataVo.setDao( QueryService.selectList( dataVo.getParam(), group, subject, query ) );
			svo.setOut("params", dataVo.getParam());
			svo.setOut("list", dataVo.getDao() );
		}
  	
		if ( request.getServletPath().indexOf("_solution") > -1 ) {

			sc.setAttribute("frontChatIdx", RequestUtil.getSession("frontLoginIdx"));
			sc.setAttribute("frontChatType", RequestUtil.getSession("frontLoginType"));
			sc.setAttribute("mngChatIdx", RequestUtil.getSession("mngLoginIdx"));
			sc.setAttribute("mngChatType", RequestUtil.getSession("mngLoginType"));
	        
			if( sc.getAttribute("frontChatIdx") != null ) RequestUtil.setSession("frontChatIdx", sc.getAttribute("frontChatIdx") );
			if( sc.getAttribute("frontChatType") != null ) RequestUtil.setSession("frontChatType", sc.getAttribute("frontChatType") );
			if( sc.getAttribute("mngChatIdx") != null ) RequestUtil.setSession("mngChatIdx", sc.getAttribute("mngChatIdx") );
			if( sc.getAttribute("mngChatType") != null ) RequestUtil.setSession("mngChatType", sc.getAttribute("mngChatType") );
		}
		
		if ( svo.getPageCd().equalsIgnoreCase("tab") ) return svo.setMV( "/"+group+"/"+subject.toLowerCase()+"/"+svo.getParam(2) );
		else if( svo.getPageCd().equalsIgnoreCase("pay") ) return svo.setMV( "/"+group+"/payment/"+svo.getParam(2) );
		else {
			if( request.getServletPath().indexOf("undefined") > -1 ) return svo.setMV( "/front/main/index" );
			else return svo.setMV( request.getServletPath() );
		}
	}
	
	// http://210.113.36.169:1935/vodservice/_definst_/test/13.mp4/playlist.m3u8 의 재생주소의 uri는 test/13.mp4 입니다.
	// user id와 uri 부분만 token으로 묶어서 open_fiveplayer 스크립트를 사용하여 전달하시면 됩니다. run_keeper 값은 1이어야 합니다.
	public String makeFiveplayerToken(HttpServletRequest request, String userid, String uri){
//		System.out.println("request.getServerName() : "+ request.getServerName() );
		
//		System.out.println( "userid : "+ userid );
//		System.out.println( "uri : "+ uri );
		
		
		String run_keeper = "1";
		String ip = request.getRemoteAddr();					//user-ip
		String agent = request.getHeader("User-Agent");	//user-agent
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date nowDate = new java.util.Date();
		String now	= sf.format(nowDate);			//yyyy-mm-dd HH:ii:ss
		String domain =request.getServerName();				//server name or ip 
		String drm_valid  = sf.format(new java.util.Date(nowDate.getTime() + ((long)86400*30)));	// 다운로드화일은 1달만 재생되게
		String drm_playlimit = "-1";									// 다운로드화일의 재생횟수는 무제한
		String drm_viewtimelimit = "-1";							// 다운로드화일의 재생시간은 무제한
		String seek = "";											// 이어보기를 위한 초기 seek position 값(int)
		String adaptive = "";									// 값 예시 ("1M,2M,700k"), 비어있을경우 일반 스킨 적용;
		String preToken = userid+"|"+"video/peoplemade/"+uri+"|"+run_keeper+"|"+ip+"|"+agent+"|"+now+"|"+domain+"|"+drm_valid+"|"+drm_playlimit+"|"+drm_viewtimelimit+"|"+seek+"|"+adaptive;			
		return Base64.encodeBase64String(preToken.getBytes());
	}
}








