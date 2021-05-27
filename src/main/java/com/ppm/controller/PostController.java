package com.ppm.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.codec.binary.Base64;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iwonsoft.unit.PageUtil;
import com.iwonsoft.unit.UnitSVO;
import com.iwonsoft.unit.UnitVO;
import com.iwonsoft.util.RequestUtil;
import com.ppm.gabia.ApiClass;
import com.ppm.gabia.ApiResult;
import com.ppm.kspay.KSPayController;
import com.ppm.service.QueryService;

@SuppressWarnings("unused")
@Controller
@RequestMapping(value= {"/front/*/*","/mng/*/*","/cms/*/*"} )
public class PostController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Resource(name="QueryService")
	private QueryService QueryService;
	
	PageUtil pageUtil;
	
	/**
	 * 
	 * @param svo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="ajax.json", method=RequestMethod.POST)	
	public @ResponseBody UnitSVO ajax_json(UnitSVO svo, HttpServletRequest request, HttpServletResponse response) throws Exception{
		UnitVO dataVo = new UnitVO(svo.getIn());
		String [] path = request.getServletPath().split("/");
		String group = path[1];
		String subject = path[2].substring(0,1).toUpperCase() + path[2].substring(1);
		String query = dataVo.get("query");
		
		if( dataVo.get("status").equals("CHECK") ) 					fn_Check(dataVo, request, response, group, subject, query );
else	if( dataVo.get("status").equals("LIST") ) 					dataVo.setDao( fn_List(dataVo, request, response, group, subject, query ) );
else	if( dataVo.get("status").equals("DETAIL") ) 				dataVo.setDao( fn_Detail(dataVo, request, response, group, subject, query ) );
else	if( dataVo.get("status").equals("PAGE") ) 					fn_Page(dataVo, request, response, group, subject, query, svo );
else	if( dataVo.get("status").equals("CODE") ) 					dataVo.setDao( QueryService.selectCode( dataVo.getParam(), group, subject, query ) );
else	if( dataVo.get("status").equals("WRITE") ) 					svo.setOut("resultCnt" , fn_Write(dataVo, request, response, group, subject, query ) );
else	if( dataVo.get("status").equals("EDIT") ) 					svo.setOut("resultCnt" , fn_Edit(dataVo, request, response, group, subject, query ) );
else	if( dataVo.get("status").equals("DELETE") ) 				svo.setOut("resultCnt" , String.valueOf( QueryService.deleteData( dataVo.getParam(), group, subject, query ) ) );

else	if( dataVo.get("status").equals("EDIT_MAIL") ) 				fn_EditMail(dataVo, request, response, group, subject, query, svo );
else	if( dataVo.get("status").equals("JOIN_MAIL") ) 				fn_EditJoin(dataVo, request, response, group, subject, query, svo );
		
else	if( dataVo.get("status").equals("REISSUANCEID") ) 			request.getSession().setAttribute("LOGIN_IDX",dataVo.get("USER_IDX") );
else	if( dataVo.get("status").equals("JJIM") ) 					fn_Jjim(dataVo, request, response, group, subject, query, svo );
		
else	if( dataVo.get("status").equals("PAYMENT_WRITE") ) 			fn_PaymentWrite(dataVo, request, response, group, subject, query, svo );
else	if( dataVo.get("status").equals("PAY_CANCLE") ) 			fn_PayCancel(dataVo, request, response, group, subject, query, svo );
else	if( dataVo.get("status").equals("CASH_RECEIPT_ISSUE") ) 	fn_CashReceiptIssue(dataVo, request, response, group, subject, query, svo );

else	if( dataVo.get("status").equals("EDIT_SMS") ) 				fn_EditSms(dataVo, request, response, group, subject, query, svo );

else	if( dataVo.get("status").equals("TODAY_SALE") ) 				fn_updateFrontTodayStatSaleData(dataVo, query);
else	if( dataVo.get("status").equals("NPAYPOINT") ) 				fn_NpayPointCashReceipt(svo, dataVo, request, response);
else	if( dataVo.get("status").equals("TODAY_PRDT") ) 				fn_todaty_site_stat_prdt(svo, dataVo, request);
//		System.out.println(  dataVo.getDao().get("data") );
		svo.setOut( "detail", dataVo.getDao() );
		
		return svo;
	}
	


	public String fn_Write( UnitVO dataVo, HttpServletRequest request, HttpServletResponse response, String group, String subject, String query  )throws Exception{
		ServletContext sc = request.getSession().getServletContext();

		sc.setAttribute("frontChatIdx", RequestUtil.getSession("frontLoginIdx"));
		sc.setAttribute("frontChatType", RequestUtil.getSession("frontLoginType"));
		sc.setAttribute("mngChatIdx", RequestUtil.getSession("mngLoginIdx"));
		sc.setAttribute("mngChatType", RequestUtil.getSession("mngLoginType"));

		if( sc.getAttribute("frontChatIdx") != null ) RequestUtil.setSession("frontChatIdx", sc.getAttribute("frontChatIdx") );
		if( sc.getAttribute("frontChatType") != null ) RequestUtil.setSession("frontChatType", sc.getAttribute("frontChatType") );
		if( sc.getAttribute("mngChatIdx") != null ) RequestUtil.setSession("mngChatIdx", sc.getAttribute("mngChatIdx") );
		if( sc.getAttribute("mngChatType") != null ) RequestUtil.setSession("mngChatType", sc.getAttribute("mngChatType") );
		
		return String.valueOf( QueryService.insertData( dataVo.getParam(), group, subject, query ) );
	}
	
	@SuppressWarnings("static-access")
	public void fn_Check( UnitVO dataVo, HttpServletRequest request, HttpServletResponse response, String group, String subject, String query  )throws Exception{
		
		Map<String, Object> selectCheck = QueryService.selectCheck( dataVo.getParam(), group, subject, query );
		
		if ( selectCheck != null ) {
		
			if ( query.equals("selectFrontLoginCheck") ) {
				QueryService.updateData( dataVo.getParam(), group, "Account", "updateFrontLoginDtm" );
				request.getSession().setAttribute("LOGIN_IDX",selectCheck.get("USER_IDX") );
				
				RequestUtil.setSession("frontLoginType",selectCheck.get("USER_TYPE"));
				RequestUtil.setSession("frontLoginIdx",selectCheck.get("USER_IDX"));
			} else if (query.equals("selectMngLoginCheck")) {
				RequestUtil.setSession("mngLoginType",selectCheck.get("USER_TYPE"));
				RequestUtil.setSession("mngLoginIdx",selectCheck.get("MNG_IDX"));
			}
		}else {
			if ( query.equals("selectFrontLoginCheck") ) {
				RequestUtil.removeSession("frontLoginIdx");
			} else if (query.equals("selectMngLoginCheck")) {
				RequestUtil.removeSession("mngLoginIdx");
			}
		}
		
		dataVo.setDao( selectCheck );
	}
	
	@SuppressWarnings({ "static-access" })
	public List<Map<String, Object>> fn_List( UnitVO dataVo, HttpServletRequest request, HttpServletResponse response, String group, String subject, String query  )throws Exception{
        
		String isCoach = "";
		String prdtUuidNm = dataVo.get("prdtUuidNm")+"";
		String isVOD = "";
		String isMail = "";
		
		if( ! prdtUuidNm.equals("") ) {
			isCoach = "YES";
			if( prdtUuidNm.equals("A") ) dataVo.set("prdtUuidNm", "");
			if( prdtUuidNm.equals("VL") ) isVOD = "YES";
			if( prdtUuidNm.equals("EN") ) isMail = "YES";
		}
		
		List<Map<String, Object>> selectList = QueryService.selectList( dataVo.getParam(), group, subject, query );
		List<Map<String, Object>> selectListConvert = new ArrayList<Map<String, Object>>();

		String url = request.getServletPath().replace(".jsp","");

		if( isCoach.equals("YES") == false ) {
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
		if( selectList.size() > 0 ) {
//			if( group.indexOf("front") > -1 ) {
				if( query.indexOf("Bann") < 0 || query.indexOf("Revi") < 0 || query.indexOf("Time") < 0) {
					for( Map<String, Object> selectDetail: selectList) {

						String[] strArr = new String[10];
						strArr[0] = String.valueOf( selectDetail.get("CATE_IDX") );
						strArr[1] = String.valueOf( selectDetail.get("PRDT_CD") );
						strArr[3] = String.valueOf( selectDetail.get("BUY_IDX") );
						
						if ( selectDetail.containsKey("INFO_PLAYER") && selectDetail.containsKey("INFO_LINK") ) {
							if ( selectDetail.get("INFO_PLAYER").equals("PLAY03") ) {
								if( dataVo.get("FRONT_LOGIN_IDX") != null )
									selectDetail.put( "PLAYER_URL" , makeFiveplayerToken(request, "0,0,0,0,free-"+request.getRemoteAddr()+",0", (String) selectDetail.get("INFO_LINK")) );
								else
									selectDetail.put( "PLAYER_URL" , makeFiveplayerToken(request, "0,0,0,0,"+dataVo.get("FRONT_LOGIN_IDX")+",0", (String) selectDetail.get("INFO_LINK")) );
							}
						}

						String tempUrl = url;

						//메인, 마스터카드, 
						selectDetail.put("MAIN_PRDT_BTN_URL", pageUtil.url(tempUrl, urlType, strArr ) );
						
						//마이피플 경로
						if( isCoach.equals("YES") == true ) {
							if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("VL") > -1 ) {
								System.out.println( "VL : " + String.valueOf( selectDetail.get("PRDT_CD") ) );
								if( isVOD.equals("YES") == true ) {
									strArr[4] = String.valueOf( dataVo.get("frontLoginIdx") );
									strArr[5] = String.valueOf( "0" );
									tempUrl = tempUrl.replace("ajax.json","vod_detail");

								} else {
									strArr[2] = String.valueOf( selectDetail.get("DATA_IDX") );
									tempUrl = tempUrl.replace("ajax.json","vod_player");
									selectDetail.put( "PLAYER_URL" , makeFiveplayerToken(request, strArr[0]+","+strArr[1]+","+strArr[2]+","+strArr[3]+","+dataVo.get("frontLoginIdx")+","+ String.valueOf( selectDetail.get("PROG_TIME") ), (String) selectDetail.get("DATA_PC_URL")) );
									
								}
							}
							else if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("CN") > -1 ) tempUrl = tempUrl.replace("ajax.json","chat_solution");
							else if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("EN") > -1 ) {
								System.out.println( "EN : " + String.valueOf( selectDetail.get("PRDT_CD") ) );
								strArr[2] = String.valueOf( selectDetail.get("MAIL_IDX") );
								tempUrl = tempUrl.replace("ajax.json","email_solution");
							}
							else if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("FN") > -1 ) tempUrl = tempUrl.replace("ajax.json","face_history_list");
							else if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("LN") > -1 ) tempUrl = tempUrl.replace("ajax.json","face_history_list");
						}
						
						selectDetail.put("MOVE_URL", pageUtil.url(tempUrl, urlType, strArr ) );	
						
						if ( query.equals("selectFrontMainList") ) { // 메인 페이지에서 준비중인 마스터를 눌렀을경우 마스터 홈에서 상품 준비중 처리하기위한 컬럼
							strArr[6] = "NOREADY";
							selectDetail.put("NOREADY_URL", pageUtil.url(tempUrl, urlType, strArr ) );	
						}
						if ( strArr[1].indexOf("FN") > -1||strArr[1].indexOf("LN") > -1 ) {
							String[] histArr = {String.valueOf( selectDetail.get("CATE_IDX") ), String.valueOf( selectDetail.get("USER_IDX") )};
							System.out.println( Arrays.toString( histArr ) );
							selectDetail.put("HIST_URL", pageUtil.url(tempUrl, urlType, histArr ) );
						}
						
						if ( group.equalsIgnoreCase("mng") ) {
							String[] ptdtArr = { String.valueOf( selectDetail.get("PRDT_IDX") ), String.valueOf( selectDetail.get("PRDT_CATE") )  };
							System.out.println( Arrays.toString( ptdtArr ) );
							selectDetail.put("PRDT_URL", pageUtil.url(tempUrl.replace("/prdtopen/detail", "/"+String.valueOf( selectDetail.get("PRDT_CATE")).toLowerCase()+"/index"), "edit", ptdtArr ) );
						}
						
						if ( strArr[1].indexOf("CN") > -1|| strArr[1].indexOf("FN") > -1||strArr[1].indexOf("LN") > -1 ) {
							strArr[1] = "COACHING" + strArr[0];
						}
						
						selectDetail.put("DETAIL_URL", pageUtil.url(tempUrl, urlType, strArr ) );
						selectDetail.put("MNG_MASTER_URL", pageUtil.url( tempUrl, "view", strArr ) );
							
						selectListConvert.add(selectDetail);
					}
				}
				return selectListConvert;
//			} else return selectList;
		} else {
			return selectList;
		}
	}
	
	public Map<String, Object> fn_Detail( UnitVO dataVo, HttpServletRequest request, HttpServletResponse response, String group, String subject, String query  )throws Exception{
		Map<String, Object> selectDetail = null;
		
		if (query.equalsIgnoreCase("selectFrontUserHasSecession")) {
			selectDetail = QueryService.selectDetail( dataVo.getParam(), "front", "Main", query );
		}else {
			selectDetail = QueryService.selectDetail( dataVo.getParam(), group, subject, query );
		}
		
		if( subject.indexOf("Bann") > -1 || subject.indexOf("Main") > -1 ) {
			dataVo.set("BANN_LINK", String.valueOf( dataVo.get("BANN_LINK") ).replaceAll("&amp;","&"));
			dataVo.set("BANN_LINK", String.valueOf( dataVo.get("BANN_LINK") ).replaceAll("&lt;","<"));
			dataVo.set("BANN_LINK", String.valueOf( dataVo.get("BANN_LINK") ).replaceAll("&gt;",">"));
			dataVo.set("BANN_LINK", String.valueOf( dataVo.get("BANN_LINK") ).replaceAll("&quot;","\""));
			dataVo.set("BANN_LINK", String.valueOf( dataVo.get("BANN_LINK") ).replaceAll("&#39;","\'"));
			dataVo.set("BANN_LINK", String.valueOf( dataVo.get("BANN_LINK") ).replaceAll("<br \\/>","\n"));
			dataVo.set("BANN_LINK", String.valueOf( dataVo.get("BANN_LINK") ).replaceAll("&#63;","?"));
		}

		String url = request.getRequestURI().replace(".jsp","");
		url = url.replace("index","detail");
		url = url.replace("follow","detail");
		url = url.replace("ajax.json","detail");
		
		//마스터 홈 경로
		url = url.replace("main","master");
		url = url.replace("mypeoplemade","master");

		//상품상세 경로
		url = url.replace("mypage","prdt");
		
//		String urlType = "detail";
		
//		if( group.indexOf("front") > -1 ) {
//			if( query.indexOf("Bann") < 0 || query.indexOf("Revi") < 0) {
//				String[] strArr = new String[10];
//				strArr[0] = String.valueOf( selectDetail.get("CATE_IDX") );
//				strArr[1] = String.valueOf( selectDetail.get("PRDT_CD") );
//				selectDetail.put("MOVE_URL", pageUtil.url(url, urlType, strArr ) );
//			}
//		}
		
		return selectDetail;
	}
	
	public String fn_Edit( UnitVO dataVo, HttpServletRequest request, HttpServletResponse response, String group, String subject, String query  )throws Exception{

		if( subject.indexOf("Bann") > -1 ) {
			dataVo.set("BANN_LINK", String.valueOf( dataVo.get("BANN_LINK") ).replaceAll("&amp;","&"));
			dataVo.set("BANN_LINK", String.valueOf( dataVo.get("BANN_LINK") ).replaceAll("&lt;","<"));
			dataVo.set("BANN_LINK", String.valueOf( dataVo.get("BANN_LINK") ).replaceAll("&gt;",">"));
			dataVo.set("BANN_LINK", String.valueOf( dataVo.get("BANN_LINK") ).replaceAll("&quot;","\""));
			dataVo.set("BANN_LINK", String.valueOf( dataVo.get("BANN_LINK") ).replaceAll("&#39;","\'"));
			dataVo.set("BANN_LINK", String.valueOf( dataVo.get("BANN_LINK") ).replaceAll("<br \\/>","\n"));
			dataVo.set("BANN_LINK", String.valueOf( dataVo.get("BANN_LINK") ).replaceAll("&#63;","?"));
		}
		
		return String.valueOf( QueryService.updateData( dataVo.getParam(), group, subject, query ) );
	}
	
	public void fn_Jjim( UnitVO dataVo, HttpServletRequest request, HttpServletResponse response, String group, String subject, String query, UnitSVO svo  )throws Exception{

		// 찜 또는 장바구니 추가를 눌렀을때 화면을 깜빡이지 않고 데이터를 갱신해 주기 위함
		svo.setOut("resultCnt" , String.valueOf( QueryService.insertData( dataVo.getParam(), group, subject, query ) ) );
		dataVo.setDao(QueryService.selectDetail( dataVo.getParam(), group, subject, "selectFrontUserBaskOther" ));
		svo.setOut( "otherBaskData" , dataVo.getDao() );
	}
	
	public void fn_PaymentWrite( UnitVO dataVo, HttpServletRequest request, HttpServletResponse response, String group, String subject, String query, UnitSVO svo  )throws Exception{
		// 결제 값 입력
		Map<String, Object> map = QueryService.selectDetail( dataVo.getParam(), group, subject, "selectFrontUserPaymentData" );
		if ( Integer.parseInt( String.valueOf( map.get("CNT") ) ) > 0 && Integer.parseInt( String.valueOf( dataVo.get("PRDT_CNT")) ) <= Integer.parseInt( String.valueOf( map.get("CNT") ) ) )
			svo.setOut("resultCnt" , String.valueOf( QueryService.updateData( dataVo.getParam(), group, subject, "updateFrontUserPaymentCashData" ) ) );
		else
			svo.setOut("resultCnt" , String.valueOf( QueryService.insertData( dataVo.getParam(), group, subject, query ) ) );
	}
	
	@SuppressWarnings("static-access")
	public void fn_Page( UnitVO dataVo, HttpServletRequest request, HttpServletResponse response, String group, String subject, String query, UnitSVO svo  )throws Exception{

		String isCoach = "";
		String prdtUuidNm = dataVo.get("prdtUuidNm")+"";
		String isVOD = "";
		String isMail = "";
		
		if( ! prdtUuidNm.equals("") ) {
			isCoach = "YES";
			if( prdtUuidNm.equals("A") ) dataVo.set("prdtUuidNm", "");
			if( prdtUuidNm.equals("VL") ) isVOD = "YES";
			if( prdtUuidNm.equals("EN") ) isMail = "YES";
		}
		
		dataVo.setAll(svo.getValues());
		dataVo.thisPage(Integer.parseInt( dataVo.get("thisPage") ));
		dataVo.pageSize(10);

		if( dataVo.get("listCnt") != null ) {
			if( ! dataVo.get("listCnt").equals("") ) {
				int listCnt = Integer.parseInt( dataVo.get("listCnt") );
				dataVo.rowSize( listCnt );
			} else dataVo.rowSize(10);
		} else dataVo.rowSize(10);
		
		dataVo.totalCnt( QueryService.selectListCnt( dataVo.getParam(), group, subject, query+"Cnt" ) );
		
		List<Map<String, Object>> selectList = QueryService.selectList( dataVo.getParam(), group, subject, query );
		List<Map<String, Object>> selectListConvert = new ArrayList<Map<String, Object>>();

		String url = request.getServletPath().replace(".jsp","");

		if( isCoach.equals("YES") == false ) {
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
		
//		System.out.println("url : " + url);
		String urlType = "detail";
		
		if( selectList.size() > 0 ) {
//			if( group.indexOf("front") > -1 ) {
				if( query.indexOf("Bann") < 0 || query.indexOf("Revi") < 0 || query.indexOf("Time") < 0) {
					for( Map<String, Object> selectDetail: selectList) {

						String[] strArr = new String[10];
						strArr[0] = String.valueOf( selectDetail.get("CATE_IDX") );
						strArr[1] = String.valueOf( selectDetail.get("PRDT_CD") );
						strArr[3] = String.valueOf( selectDetail.get("BUY_IDX") );
						
						if ( selectDetail.containsKey("INFO_PLAYER") && selectDetail.containsKey("INFO_LINK") ) {
//							System.out.println("INFO_PLAYER && INFO_LINK");
							if ( selectDetail.get("INFO_PLAYER").equals("PLAY03") ) {
								selectDetail.put( "PLAYER_URL" , makeFiveplayerToken(request, dataVo.get("FRONT_LOGIN_IDX"), (String) selectDetail.get("INFO_LINK")) );
							}
						}

						String tempUrl = url;
						
						//마이피플 경로
						if( isCoach.equals("YES") == true ) {
							if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("VL") > -1 ) {
								System.out.println( "VL : " + String.valueOf( selectDetail.get("PRDT_CD") ) );
								if( isVOD.equals("YES") == true ) {
									strArr[4] = String.valueOf( dataVo.get("frontLoginIdx") );
									strArr[5] = String.valueOf( "0" );
									tempUrl = tempUrl.replace("ajax.json","vod_detail");
								} else {
									strArr[2] = String.valueOf( selectDetail.get("DATA_IDX") );
									tempUrl = tempUrl.replace("ajax.json","vod_player");
//									selectDetail.put( "PLAYER_URL" , makeFiveplayerToken(request, dataVo.get("FRONT_LOGIN_IDX"), (String) selectDetail.get("INFO_LINK")) );
									selectDetail.put( "PLAYER_URL" , makeFiveplayerToken(request, strArr[0]+","+strArr[1]+","+strArr[2]+","+strArr[3]+","+dataVo.get("frontLoginIdx")+","+ String.valueOf( selectDetail.get("PROG_TIME") ), (String) selectDetail.get("DATA_PC_URL")) );
								}
							}
							else if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("CN") > -1 ) tempUrl = tempUrl.replace("ajax.json","chat_solution");
							else if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("EN") > -1 ) {
								System.out.println( "EN : " + String.valueOf( selectDetail.get("PRDT_CD") ) );
								System.out.println( "MAIL_IDX : " + String.valueOf( selectDetail.get("MAIL_IDX") ) );
								strArr[2] = String.valueOf( selectDetail.get("MAIL_IDX") );
								tempUrl = tempUrl.replace("ajax.json","email_solution");
							}
							else if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("FN") > -1 ) tempUrl = tempUrl.replace("ajax.json","face_history_list");
							else if( String.valueOf( selectDetail.get("PRDT_CD") ).indexOf("LN") > -1 ) tempUrl = tempUrl.replace("ajax.json","face_history_list");
						}
						
						System.out.println("strArr 이란 무엇인고 : "+ Arrays.toString(strArr) );
						
						selectDetail.put("MOVE_URL", pageUtil.url(tempUrl, urlType, strArr ) );		
					
						if ( strArr[1].indexOf("CN") > -1|| strArr[1].indexOf("FN") > -1||strArr[1].indexOf("LN") > -1 ) {
							strArr[1] = "COACHING" + strArr[0];
						}
						selectDetail.put("DETAIL_URL", pageUtil.url(tempUrl, urlType, strArr ) );
						
						if ( query.equalsIgnoreCase("selectFrontNotiList") ) {
							String[] NotiArr = { String.valueOf( selectDetail.get("NOTI_IDX") ) };
							System.out.println( Arrays.toString( NotiArr ) );
							selectDetail.put("NOTI_URL", pageUtil.url("/front/service/notice_detail", "view", NotiArr ) );
						}
						
						selectListConvert.add(selectDetail);
						
					}
				}
				dataVo.setDao( selectListConvert );
//			} else dataVo.setDao( selectList );
		} else dataVo.setDao( selectList );
			svo.setOut("totalCnt", String.valueOf( QueryService.selectListCnt( dataVo.getParam(), group, subject, query+"Cnt" ) ) );
			svo.setOut("params", dataVo.getParam());
	}
	
	public void fn_EditMail( UnitVO dataVo, HttpServletRequest request, HttpServletResponse response, String group, String subject, String query, UnitSVO svo  )throws Exception{
		
		Map<String, Object> targetEmail = new HashMap<String, Object>();
		
		svo.setOut("resultCnt" , String.valueOf( QueryService.updateData( dataVo.getParam(), group, subject, query ) ) );
		if( dataVo.get("query").indexOf("insertMailSolution") > -1 ) targetEmail = QueryService.selectDetail(dataVo.getParam(), group, subject, "selectFrontMypeoplemadeEmail");
		else targetEmail.put("TARGET_EMAIL", dataVo.get("PW_USER_EMAIL"));
		
	    String setfrom = "bluelime1175@naver.com";
//	    String setfrom = "no-reply@peoplemade.net";
	    
	    String tomail = dataVo.get("email");
	    String title = "[피플메이드] 안녕하세요. 피플메이드에서 알려드립니다.";
	    String content = "";
	    String contentTop = "";
	    contentTop += "<div style='text-align:center;'>";
	    contentTop += "<div style='text-align:center;'>";
	    contentTop += "<div style='text-align:center;background-image: url(https://peoplemade.net/resources/images/mail/mail_header.png);height: 45px;width: 668px;margin: auto;'>";
	    contentTop += "</div>";
	    contentTop += "<div style='text-align:-webkit-center;margin: 0 auto;width:1148px;'>";
	    contentTop += "<table style='text-align:center;'>";
	    contentTop += "<thead >";
	    contentTop += "<tr>";
	    
	    String contentBottom = "";
	    contentBottom += "<tfoot>";
	    contentBottom += "<tr>";
    	
	    contentBottom += "<td style='text-align:center;width:1130px;'>";
	    contentBottom += "<br>보다나은 서비스를 위하여 최선을 다하겠습니다.<br><br><br>";
	    contentBottom += "<div style='background-color: #26f1d4;color: white;border: none;width: 280px;border-radius: 5px;margin: auto;font-size: 15px;'><a href='https://peoplemade.net/' style='color: black;text-decoration: auto;'>피플메이드 홈페이지 바로가기</a></div><br>";
	    contentBottom += "</td>";
    	
	    contentBottom += "</tr>";
	    contentBottom += "</tfoot>";
	    contentBottom += "</table>";
	    contentBottom += "</div>";
	    contentBottom += "<div style='text-align:center;'>본 메일은 발신전용 입니다. 궁금하신 점이나 불편한 사항은 피플메이드 <a href='https://peoplemade.net/front/account/login'>1:1문의</a>를 통해 문의해 주시기 바랍니다.</div>";
	    contentBottom += "<div style='text-align:center;background-image: url(https://peoplemade.net/resources/images/mail/mail_footer.png);    height: 100px;width: 668px;margin: auto;'>";
	    contentBottom += "</div>";
	    contentBottom += "</div>";
	    
	    if( dataVo.get("query").indexOf("MngRevi") > -1 ) {
	    	content += "<td style='text-align:center;width:1130px;border-bottom: 1px solid grey;'>";
	    	content += "안녕하세요. 피플메이드에서 알려드립니다.<br><br>";
	    	content += "후기 비공개 알림<br><br>";
	    	content += ""+dataVo.get("MAST_INFO")+" 수업에 등록하신 후기가<br>";
	    	content += "아래의 사유로 비공개 처리되었습니다.<br>";
	    	content += "</td>";
	    	
	    	content += "</tr>";
	    	content += "</thead>";
	    	content += "<tbody>";
	    	content += "<tr>";
	    	
	    	content += "<td style='text-align:center;width:1130px;border-bottom: 1px solid grey;'>";
	    	content += ""+dataVo.get("REVI_REPO_CNTN")+"<br><br>";
	    	content += "</td>";
	    	
	    	content += "</tr>";
	    	content += "</tbody> ";
	    	
	    } else if( dataVo.get("query").indexOf("Alar") > -1 ) {
	    	content += "<td style='text-align:center;width:1130px;border-bottom: 1px solid grey;'>";
	    	content += "안녕하세요. 피플메이드에서 알려드립니다.<br>";
	    	content += "</td>";
	    	
	    	content += "</tr>";
	    	content += "</thead>";
	    	content += "<tbody>";
	    	content += "<tr>";
	    	content += "<td style='text-align:center;width:1130px;border-bottom: 1px solid grey;'>";
	    	content += "상담알람<br>";
	    	content += "보다나은 서비스를 위하여 최선을 다하겠습니다.<br>";
	    	content += "</td>";
	    	content += "";
	    	content += "</tr>";
	    	content += "</tbody> ";
	    	
	    } else if( dataVo.get("query").indexOf("FindPw") > -1 ) {
	    	content += "<td style='text-align:center;width:1130px;border-bottom: 1px solid grey;'>";
	    	content += "안녕하세요. 피플메이드에서 알려드립니다.<br>";
	    	content += "</td>";
	    	
	    	content += "</tr>";
	    	content += "</thead>";
	    	content += "<tbody>";
	    	content += "<tr>";
	    	content += "<td style='text-align:center;width:1130px;border-bottom: 1px solid grey;'>";
	    	content += "임시비밀번호<br>";
	    	content += "보다나은 서비스를 위하여 최선을 다하겠습니다.<br>";
	    	content += "</td>";
	    	content += "";
	    	content += "</tr>";
	    	content += "</tbody> ";
	    	
	    } else if( dataVo.get("query").indexOf("insertMailSolution") > -1 ) {
	    	content += "<td style='text-align:center;width:1130px;'>";
	    	content += "안녕하세요. 피플메이드에서 알려드립니다.<br><br>";
	    	content += "</td>";
	    	
	    	content += "</tr>";
	    	content += "</thead>";
	    	content += "<tbody>";
	    	content += "<tr>";
	    	
	    	content += "<td style='text-align:center;width:1130px;'>";
	    	if ( dataVo.get("masterChk").isEmpty() ) {
	    		content += "피플메이드 마스터님께 상담신청 내용이 접수되었습니다.<br><br>";
	    		content += "<a href='https://peoplemade.net/mng/wait/index'>지금 답변하기</a></td>";
	    	}else {
	    		content += "피플메이드 마스터님의 답변이 등록되었습니다.<br><br>";
	    		content += "<a href='https://peoplemade.net/front/mypeoplemade/coaching?2'>지금 확인하기</a></td>";
	    	}
	    	
	    	content += "</tr>";
	    	content += "</tbody> ";
	    	
	    	tomail = String.valueOf( targetEmail.get("TARGET_EMAIL") );
//	    	title = dataVo.get("HIST_SUBJECT");
	    	
	    } else if( dataVo.get("query").indexOf("updateFrontAccountData") > -1 ) {
	    	content += "<td style='text-align:center;width:1130px;'>";
	    	content += "안녕하세요. 피플메이드에서 알려드립니다.<br><br>";
	    	content += "</td>";
	    	
	    	content += "</tr>";
	    	content += "</thead>";
	    	content += "<tbody>";
	    	content += "<tr>";
	    	
	    	content += "<td style='text-align:center;width:1130px;'>";
    		content += "임시 비밀번호는 ["+dataVo.get("USER_PW")+"] 입니다.<br><br>";
    		content += "<a href='"+dataVo.get("LINK_URL")+"'>로그인 페이지로 이동</a></td>";
    		
	    	content += "</tr>";
	    	content += "</tbody> ";;
	    	
	    	tomail = String.valueOf( targetEmail.get("TARGET_EMAIL") );
	    	title = dataVo.get("HIST_SUBJECT");
	    }
	    
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message,	true, "UTF-8");
		
		messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
		messageHelper.setTo(tomail); // 받는사람 이메일
		messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		messageHelper.setText(contentTop + content + contentBottom, true); // 메일 내용
		mailSender.send(message);	
	}
	
	public void fn_EditJoin( UnitVO dataVo, HttpServletRequest request, HttpServletResponse response, String group, String subject, String query, UnitSVO svo  )throws Exception{
		String setfrom = "bluelime1175@naver.com";
	    
	    String tomail = dataVo.get("USER_PARENT_EMAIL");
	    String title = "[피플메이드] 안녕하세요."+dataVo.get("USER_PARENT_NM")+"님 피플메이드에서 알려드립니다.";
	    
	    String contentTop = "";
	    contentTop += "<div style='text-align:center;'>";
	    contentTop += "<div style='text-align:center;'>";
	    contentTop += "<div style='text-align:center;background-image: url(https://peoplemade.net/resources/images/mail/mail_header.png);height: 45px;width: 668px;margin: auto;'>";
	    contentTop += "</div>";
	    contentTop += "<div style='text-align:-webkit-center;margin: 0 auto;width:1148px;'>";
	    contentTop += "<table style='text-align:center;'>";
	    contentTop += "<thead >";
	    contentTop += "<tr>";

	    String content = "";
	    content += "<td style='text-align:center;width:1130px;border-bottom: 1px solid grey;'>";
    	content += "안녕하세요. 피플메이드에서 알려드립니다.<br>";
    	content += "</td>";
    	
    	content += "</tr>";
    	content += "</thead>";
    	content += "<tbody>";
    	content += "<tr>";
    	content += "<td style='text-align:center;width:1130px;padding: 30px;'>";
    	content += "법정대리인 동의에 필요한 이메일 코드<br><br>";
    	content += dataVo.get("CODE");
//    	content += "<br><br>보다나은 서비스를 위하여 최선을 다하겠습니다.<br>";
    	content += "</td>";
    	content += "";
    	content += "</tr>";
    	content += "</tbody> ";

	    String contentBottom = "";
	    contentBottom += "<tfoot>";
	    contentBottom += "<tr>";
 	
	    contentBottom += "<td style='text-align:center;width:1130px;'>";
	    contentBottom += "<br>보다나은 서비스를 위하여 최선을 다하겠습니다.<br><br><br>";
	    contentBottom += "<div style='background-color: #26f1d4;color: white;border: none;width: 280px;border-radius: 5px;margin: auto;font-size: 15px;'><a href='https://peoplemade.net/' style='color: black;text-decoration: auto;'>피플메이드 홈페이지 바로가기</a></div><br>";
	    contentBottom += "</td>";
 	
	    contentBottom += "</tr>";
	    contentBottom += "</tfoot>";
	    contentBottom += "</table>";
	    contentBottom += "</div>";
	    contentBottom += "<div style='text-align:center;'>본 메일은 발신전용 입니다. 궁금하신 점이나 불편한 사항은 피플메이드 <a href='https://peoplemade.net/front/account/login'>1:1문의</a>를 통해 문의해 주시기 바랍니다.</div>";
	    contentBottom += "<div style='text-align:center;background-image: url(https://peoplemade.net/resources/images/mail/mail_footer.png);    height: 100px;width: 668px;margin: auto;'>";
	    contentBottom += "</div>";
	    contentBottom += "</div>";
	    
	    MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message,	true, "UTF-8");
		
		messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
		messageHelper.setTo(tomail); // 받는사람 이메일
		messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		messageHelper.setText(contentTop + content + contentBottom, true); // 메일 내용
		mailSender.send(message);	
	}
	
	public void fn_EditSms( UnitVO dataVo, HttpServletRequest request, HttpServletResponse response, String group, String subject, String query, UnitSVO svo  )throws Exception{

		List<Map<String,Object>> selectList = QueryService.selectList(dataVo.getParam(), group, subject, query);

		String api_id = "manager";		// sms.gabia.com 이용 ID
		String api_key = "77886d1fe2c61b3f95d5ebc518f113a7";	// 환결설정에서 확인 가능한 SMS API KEY
		String API_SENDER = "07077327105";
		String urlPath = group+subject;
		
		ApiClass api = new ApiClass(api_id, api_key);
		
		for( Map<String,Object> selectDetail : selectList ) {
//			유저에게 보내는 문자
			if( String.valueOf( selectDetail.get("USER_PHONE") ).length() > 0 ) {

				if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("VL") < 0 ) {
					String USER_TITLE = "";
					String USER_MSG = "";
					String API_RECEIVER = "";
					
					USER_TITLE 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님, 피플메이드입니다.";
					
					if( urlPath.indexOf("mngPay") > - 1 ) {
						//상담 구매 시 알람
						if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("EN") > -1) {
							USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님\r\n"
											+ String.valueOf( selectDetail.get("M_USER_NM") ) +" 마스터님과의 1:1이메일코칭을/를 구매해주셔서 감사합니다.\r\n"
											+ "이메일 상담기간은 "+ String.valueOf( selectDetail.get("PRDT_TERM") ) +"까지이오니 "
											+ "기간 내 언제든 상담을 받으시면 됩니다.\r\n"
											+ "감사합니다.\r\n\n"
											+ "피플메이드 드림.";
						} else {
							USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님, 피플메이드입니다.\r\n\n"
											+ String.valueOf( selectDetail.get("M_USER_NM") ) +" 마스터님과 "+ String.valueOf( selectDetail.get("PRDT_TYPE") ) +"이/가\r\n"
//											+ String.valueOf( selectDetail.get("TIME_DTM_NM") ) +" "+ String.valueOf( selectDetail.get("TIME_STR") ) +"에 "
											+ "구매되셨습니다.\r\n"
											+ "감사합니다.\r\n\n"
											+ "피플메이드 드림.";
						}
					} else if( urlPath.indexOf("frontMypeoplemade") > - 1 ) {
						String PRDT_TYPE = "";
						if( String.valueOf( selectDetail.get("PRDT_TYPE") ).indexOf("LN") < 0 ) PRDT_TYPE = "1:1 코칭";
						else PRDT_TYPE = "라이브클래스";
						
						if( dataVo.get("mngLoginIdx").length() > 0 ) {
							//이메일상담 답변 도착 시 알람
							if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("EN") > -1) {
								if( String.valueOf( selectDetail.get("MAIL_REST_CNT") ).equals("0") == true ) {
									USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님,\r\n\n"
													+ String.valueOf( selectDetail.get("M_USER_NM") ) +"마스터님으로 부터 1:1이메일 상담 답변이 도착하였습니다. 상담 답변내용을 확인해주시기 바랍니다.\r\n\n"
													+ "상담확인 후에 오늘 상담에 대해 다른 회원들의 상담 선택과 진행에 도움이 될 수 있는 리뷰 작성도 잊지마세요^^\r\n\n"
													+ "(리뷰를 작성해주시는 분들께는 서비스이용 할인쿠폰을 제공해드리고 있사오니 작성하시고 이후에도 많은 이용부탁드립니다.)\r\n\n"
													+ "피플메이드 드림.";
								} else {
									USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님,\r\n\n"
													+ String.valueOf( selectDetail.get("M_USER_NM") ) +"마스터님으로 부터 1:1이메일 상담 답변이 도착하였습니다. 상담 답변내용을 확인해주시기 바랍니다.\r\n\n"
													+ "피플메이드 드림.";
								}
							}
						} else {
							
							if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("LN") > -1) {
//								if( String.valueOf( selectDetail.get("LIVE_ACAD_YN") ).indexOf("N") > -1) {
									USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님, " + String.valueOf( selectDetail.get("LIVE_NM") ) + "라이브클래스에 참여해주셔서 감사드립니다~!\r\n\n"
													+ String.valueOf( selectDetail.get("USER_NM") ) +"님께서 참여하시는 라이브클래스는 "
													+ String.valueOf( selectDetail.get("TIME_DTM_NM") ) +" "+ String.valueOf( selectDetail.get("TIME_STR") ) +"(24시간표기 기준)으로 "
													+ "시작 될 예정이오니 잊지말고 참여해주시기 바랍니다.\r\n\n"
													+ "피플메이드 드림.";
//								}
//								else if( String.valueOf( selectDetail.get("LIVE_ACAD_YN") ).indexOf("Y") > -1) {
//									USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님!, 피플메이드입니다.\r\n\n"
//													+ "요청하신 " + String.valueOf( selectDetail.get("M_USER_NM") ) +" 마스터님과 " + PRDT_TYPE +"이/가\r\n"
//													+ String.valueOf( selectDetail.get("TIME_DTM_NM") ) +" "+ String.valueOf( selectDetail.get("TIME_STR") ) +"(24시간표기 기준)으로 "
//													+ "예약 되었습니다.\r\n\n"
//													+ String.valueOf( selectDetail.get("M_USER_NM") ) +" 마스터님께서 예약을 확인하신 후에 다시 한번 알림 드리도록 하겠습니다^^ \r\n\n"
//													+ "피플메이드 드림.";
//								}
							} else {
								USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님!, 피플메이드입니다.\r\n\n"
												+ "요청하신 " + String.valueOf( selectDetail.get("M_USER_NM") ) +" 마스터님과 " + PRDT_TYPE +"이/가\r\n"
												+ String.valueOf( selectDetail.get("TIME_DTM_NM") ) +" "+ String.valueOf( selectDetail.get("TIME_STR") ) +"(24시간표기 기준)으로 "
												+ "예약 되었습니다.\r\n\n"
												+ String.valueOf( selectDetail.get("M_USER_NM") ) +" 마스터님께서 예약을 확인하신 후에 다시 한번 알림 드리도록 하겠습니다^^ \r\n\n"
												+ "피플메이드 드림.";
							}
						}
					} else if( urlPath.indexOf("mngWait") > - 1 ) {
						if(  dataVo.get("mngLoginIdx").length() > 0 ) {
							String PRDT_TYPE = "";
							if( String.valueOf( selectDetail.get("PRDT_TYPE") ).indexOf("LN") < 0 ) PRDT_TYPE = "1:1 코칭";
							else PRDT_TYPE = "라이브클래스";
							
							//상담 확정 시 알람
							if( String.valueOf( dataVo.get("PrdtConfirm") ).length() > 0 ) {
								if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("EN") > -1) {
									USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님, 피플메이드입니다.\r\n\n"
											+ String.valueOf( selectDetail.get("M_USER_NM") ) +"마스터님과의 "+ String.valueOf( selectDetail.get("PRDT_TYPE") ) +"이\r\n"
											+ " 확정되었습니다.\r\n\n"
											+ "피플메이드 드림.";
								} else	if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("VL") > -1) {
										USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님, 피플메이드입니다.\r\n\n"
												+ String.valueOf( selectDetail.get("M_USER_NM") ) +"마스터님과의 "+ String.valueOf( selectDetail.get("PRDT_TYPE") ) +"이\r\n"
														+ " 확정되었습니다.\r\n\n"
												+ "피플메이드 드림.";
								} else {
									USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님,\r\n\n"
													+ "예약하신 " + String.valueOf( selectDetail.get("M_USER_NM") ) + "마스터님과의 "+ PRDT_TYPE +"이/가\r\n"
													+ String.valueOf( selectDetail.get("TIME_DTM_NM") ) +" "+ String.valueOf( selectDetail.get("TIME_STR") ) + "(24시간표기 기준)에 시작됩니다~!\r\n\n"
													+ "예약하신 코칭은 마이피플에서 확인하실 수 있으며, 구매하신 목록에서 클릭 후 마스터님이 기다리시는 방으로 입장하실 수 있습니다^^ \r\n\n"
													+ "늦지않게 참석해 주세요~ !\r\n\n"
													+ "피플메이드 드림.\r\n\n"
													+ "* 부득이하게 시간이 지난 상담에 대하여 취소/환불조치가 불가하오니 마스터님과 약속된 시간을 반드시 지켜주시기 바랍니다. * \r\n\n";
								}
							} else {
								//종료 시 알람
								if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("CN") > -1) {
									//채팅상담 종료 시 알람
									USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님, "+ String.valueOf( selectDetail.get("M_USER_NM") ) +" 마스터님과의 유익한 시간 되셨나요?\r\n\n"
													+ "오늘" + String.valueOf( selectDetail.get("M_USER_NM") ) + "마스터님과 함께 진행된 코칭의 내용은 24시간 내에 히스토리에서 다시 보실 수 있도록 정리하여 다시 보실 수 있도록 \r\n"
													+ String.valueOf( selectDetail.get("M_USER_NM") )+"마스터님이 정성드려 적어주실 예정입니다.\r\n\n"
													+ "오늘의 상담이 마음에 드셨다면 후기 작성 꼭 부탁드립니다 ~ \r\n\n"
													+ "피플메이드 드림.";
								} else if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("FN") > -1) {
									//화상상담 종료 시 알람
									USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님, "+ String.valueOf( selectDetail.get("M_USER_NM") ) +" 마스터님과의 유익한 시간 되셨나요?\r\n\n"
													+ "오늘" + String.valueOf( selectDetail.get("M_USER_NM") ) + "마스터님과 함께 진행된 코칭의 내용은 24시간 내에 히스토리에서 다시 보실 수 있도록 정리하여 다시 보실 수 있도록 \r\n"
													+ String.valueOf( selectDetail.get("M_USER_NM") )+"마스터님이 정성드려 적어주실 예정입니다.\r\n\n"
													+ "오늘의 상담이 마음에 드셨다면 후기 작성 꼭 부탁드립니다 ~ \r\n\n"
													+ "피플메이드 드림.";
//								} else if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("LN") > -1) {
									//화상상담 종료 시 알람
								}
							}
						}
					}
					
					API_RECEIVER 	= String.valueOf( selectDetail.get("USER_PHONE") );

					 //LMS 발송 테스트 - 한번에 여러건 발송
					String arr[] = new String[7];
					arr[0] = "multi_lms";	// LMS 발송
					arr[1] = "_UNIQUE_KEY_";			// 결과 확인을 위한 KEY ( 중복되지 않도록 생성하여 전달해 주시기 바랍니다. )
					arr[2] = USER_TITLE;						//  LMS 발송시 제목으로 사용 SMS 발송시는 수신자에게 내용이 보이지 않음.
					arr[3] = USER_MSG;				// 본문 (80byte 제한)
					arr[4] = API_SENDER;		// 발신 번호
					arr[5] = API_RECEIVER;					// 수신 번호
					arr[6] = "0";								//예약 일자 "2013-07-30 12:00:00" 또는 "0" 0또는 빈값(null)은 즉시 발송 
					
					String responseXml = api.send(arr);
					ApiResult res = api.getResult( responseXml );
					String resultXml = "";
					
					if( res.getCode().compareTo("0000") == 0 ) resultXml = api.getResultXml(responseXml);
				}
			}
			
//			마스터에게 보내는 문자
			if( String.valueOf( selectDetail.get("M_USER_NM") ).length() > 0 ) {

				if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("VL") < 0 ) {
					String USER_TITLE = "";
					String USER_MSG = "";
					String API_RECEIVER = "";
					
					USER_TITLE 		= "안녕하세요 "+String.valueOf( selectDetail.get("M_USER_NM") )+"마스터님, 피플메이드입니다.";

					if( urlPath.indexOf("mngPay") > - 1 ) {
//						가상계좌로 구매하였을 때
						if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("EN") > -1) {
							USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("M_USER_NM") )+"마스터님, 피플메이드입니다.\r\n\n"
											+ String.valueOf( selectDetail.get("USER_NM") ) +"님이 "+ String.valueOf( selectDetail.get("PRDT_TYPE") ) +"을/를\r\n"
											+ "구매하셨습니다.\r\n\n"
											+ "계정으로 로그인 후 대기중인 상담으로 가셔서\r\n"
											+ "확정버튼을 클릭해 주시기 바랍니다.\r\n\n"
											+ "이메일 상담요청이 등록되면 별도의 메시지를 발송드리오니\r\n"
											+ "24시간 내 답변을 작성해주시면 됩니다.\r\n\n"
											+ "피플메이드 드림.";
						} else {
							if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("LN") > -1) {

								if( String.valueOf( selectDetail.get("LIVE_ACAD_YN") ).indexOf("Y") > -1) {
									USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("M_USER_NM") )+"마스터님, 피플메이드입니다.\r\n\n"
													+ String.valueOf( selectDetail.get("USER_NM") ) +"님으로부터 "+ String.valueOf( selectDetail.get("PRDT_TYPE") ) +"이\r\n"
//													+ String.valueOf( selectDetail.get("TIME_DTM_NM") ) +" "+ String.valueOf( selectDetail.get("TIME_STR") ) +"에 "
													+ "예약되었습니다.\r\n\n"
													+ "계정으로 로그인 후 대기중인 상담으로 가셔서\r\n"
													+ "확정버튼을 클릭해 주시기 바라며,\r\n"
													+ "해당 일시 코칭 5분전까지\r\n"
													+ "해당 상담방을 개설하신 후 대기해 주시기 바랍니다.\r\n\n"
													+ "피플메이드 드림.";
								}
							}
						}
					} else if( urlPath.indexOf("frontMypeoplemade") > - 1 ) {
						if(  dataVo.get("frontLoginIdx").length() > 0 ) {
							String PRDT_TYPE = "";
							if( String.valueOf( selectDetail.get("PRDT_TYPE") ).indexOf("LN") < 0 ) PRDT_TYPE = "1:1(화상/채팅) 코칭";
							else PRDT_TYPE = "라이브클래스";
							
							if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("EN") > -1) {
//								회원이 이메일 상담요청 했을 때

								if( String.valueOf( selectDetail.get("MAIL_REST_CNT") ).equals("0") == true ) {
									USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("M_USER_NM") )+"마스터님 수고하셨습니다.\r\n"
													+ "계정에 로그인후에 상담관리>지난상담에 들어가셔서 오늘 상담내용을 간략하게 정리해주시면 " + String.valueOf( selectDetail.get("USER_NM") ) + "님께 좀더 유익한 상담이 되리라 믿습니다. \r\n\n"
													+ "상담내역 작성은 24시간이내에 작성해주시면 됩니다.\r\n"
													+ "수고하셨습니다.\r\n\n"
													+ "피플메이드 드림.";
								} else {
									USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("M_USER_NM") )+"마스터님\r\n"
													+ String.valueOf( selectDetail.get("USER_NM") ) +"님으로 부터 1:1이메일 상담이 요청되었습니다.\r\n\n"
													+ "계정으로 로그인 후 대기중인 상담으로 가셔서 상담시작 버튼을 클릭하여 상담내용을 확인하시고 상담메일을 작성해주시기 바랍니다. \r\n\n"
													+ "답변은 24시간내에 진행해주시기 바랍니다.\r\n"
													+ "그럼 마스터님의 정성어린 답변 부탁드리겠습니다.\r\n\n"
													+ "피플메이드 드림.";
								}
							} else if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("LN") > -1) {
								USER_MSG 		= String.valueOf( selectDetail.get("M_USER_NM") )+"님, 라이브클래스 신규 참여자가 " + String.valueOf( selectDetail.get("LIVE_CNT") ) + "명 확정을 기다리고 있습니다.\r\n\n"
												+ "마스터님 페이지에서 직접 확정을 눌러주셔야 최종 참여가 가능하오니 빠른 시간내에 확정 버튼을 눌러주시기 바랍니다. \r\n\n"
												+ "피플메이드 드림.";
							}
						} else if(  dataVo.get("mngLoginIdx").length() > 0 ) {
							if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("EN") > -1) {
//								이메일 상담 횟수가 완료되었을 때
								if( String.valueOf( dataVo.get("prdtOver") ).length() > 0 ) {
									USER_MSG 		= String.valueOf( selectDetail.get("M_USER_NM") )+"마스터님, 수고하셨습니다.\r\n\n"
													+ "계정에 로그인후에 상담관리>지난상담에 들어가셔서 오늘 상담내용을 간략하게 정리해주시면"
													+ String.valueOf( selectDetail.get("USER_NM") ) +"님께 좀더유익한 상담이 되리라 믿습니다.\r\n\n"
													+ "상담내역 작성은 24시간이내에 작성해주시면 됩니다.\r\n\n"
													+ "수고하셨습니다.\r\n\n"
													+ "피플메이드 드림.";
								}
							}
						}
					} else if( urlPath.indexOf("mngWait") > - 1 ) {
						if(  dataVo.get("mngLoginIdx").length() > 0 ) {
							//상담 확정 시 알람
							if( String.valueOf( dataVo.get("PrdtConfirm") ).length() > 0 ) {
//								if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("EN") < 0) {
//									USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("M_USER_NM") )+"마스터님, 피플메이드입니다.\r\n\n"
//													+ String.valueOf( selectDetail.get("USER_NM") ) +"님과의 "+ String.valueOf( selectDetail.get("PRDT_TYPE") ) +"이\r\n"
//													+ String.valueOf( selectDetail.get("TIME_DTM_NM") ) +" "+ String.valueOf( selectDetail.get("TIME_STR") ) +"에 "
//															+ "확정되었습니다.\r\n\n"
//													+ "피플메이드 드림.";
//								} else {
									String PRDT_TYPE = "";
									if( String.valueOf( selectDetail.get("PRDT_TYPE") ).indexOf("LN") < 0 ) PRDT_TYPE = "1:1 코칭";
									else PRDT_TYPE = "라이브클래스";
									
									USER_MSG 		= String.valueOf( selectDetail.get("M_USER_NM") ) +"마스터님,\r\n\n"
													+ String.valueOf( selectDetail.get("USER_NM") ) +"님이 신청하신 "+ PRDT_TYPE +"을/를\r\n"
													+ String.valueOf( selectDetail.get("TIME_DTM_NM") ) +" "+ String.valueOf( selectDetail.get("TIME_STR") ) + "(24시간표기 기준)에 확정 하셨습니다.\r\n\n"
													+ "마스터님을 기다리는 "+ String.valueOf( selectDetail.get("USER_NM") ) +"님을 위하여 코칭시간 전 방에 입장하여 대기해주시기 바랍니다. \r\n\n"
													+ "오늘도 마스터님의 귀중한 하루를 응원합니다. \r\n\n"
													+ "피플메이드 드림.";
//								}
							} else {
								if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("CN") > -1) {
									//채팅상담 종료 시 알람
									USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("M_USER_NM") )+"마스터님, "+ String.valueOf( selectDetail.get("USER_NM") ) +"님과의 1:1코칭이 종료되었습니다.\r\n\n"
													+ "상담관리>지난상담에 들어가셔서 오늘 상담내용을 간략하게 정리해주시면 "
													+ String.valueOf( selectDetail.get("USER_NM") ) +"님께 좀더 유익한 상담이 되리라 믿습니다. \r\n\n"
													+ "상담내역 작성은 24시간이내에 작성해주시면 됩니다.\r\n\n"
													+ "수고하셨습니다.\r\n\n"
													+ "피플메이드 드림.";
								} else if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("FN") > -1) {
									//화상상담 종료 시 알람
									USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("M_USER_NM") )+"마스터님, "+ String.valueOf( selectDetail.get("USER_NM") ) +"님과의 1:1코칭이 종료되었습니다.\r\n\n"
													+ "상담관리>지난상담에 들어가셔서 오늘 상담내용을 간략하게 정리해주시면 "
													+ String.valueOf( selectDetail.get("USER_NM") ) +"님께 좀더 유익한 상담이 되리라 믿습니다. \r\n\n"
													+ "상담내역 작성은 24시간이내에 작성해주시면 됩니다.\r\n\n"
													+ "수고하셨습니다.\r\n\n"
													+ "피플메이드 드림.";
//								} else if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("LN") > -1) {
									//라이브클래스 종료 시 알람
								}
							}
						}
					}
					
					API_RECEIVER	= String.valueOf( selectDetail.get("M_USER_PHONE") );

					String arr[] = new String[7];
					arr[0] = "multi_lms";	// LMS 발송
					arr[1] = "_UNIQUE_KEY_";			// 결과 확인을 위한 KEY ( 중복되지 않도록 생성하여 전달해 주시기 바랍니다. )
					arr[2] = USER_TITLE;						//  LMS 발송시 제목으로 사용 SMS 발송시는 수신자에게 내용이 보이지 않음.
					arr[3] = USER_MSG;				// 본문 (80byte 제한)
					arr[4] = API_SENDER;		// 발신 번호
					arr[5] = API_RECEIVER;					// 수신 번호
					arr[6] = "0";								//예약 일자 "2013-07-30 12:00:00" 또는 "0" 0또는 빈값(null)은 즉시 발송 
					
					String responseXml = api.send(arr);
					ApiResult res = api.getResult( responseXml );
					String resultXml = "";
					if( res.getCode().compareTo("0000") == 0 ) resultXml = api.getResultXml(responseXml);
				}
			}
		}
	}
	
	public void fn_PayCancel( UnitVO dataVo, HttpServletRequest request, HttpServletResponse response, String group, String subject, String query, UnitSVO svo  )throws Exception{
		
		KSPayController ksPayPaymentCancle = new KSPayController();

//String storeid = dataVo.get("sndStoreid") ;
//String trno    = dataVo.get("sndTrno") ;    // 거래번호 취소
//String cordno  = dataVo.get("sndOrdno") ;   // 주문번호 취소( 거래번호 미입력시 필수 )
//String ctoken  = dataVo.get("sndCtoken") ;
//		BUY_IDX
		dataVo.setAll(QueryService.selectDetail( dataVo.getParam() , "front", "Mypage", "selectFrontMypageRefundInfoOne")); 
		
		Map<String , Object> map = new HashMap<>();
		
		if( !dataVo.get("COUP_IDX").equals("0") ) {
			double parseInt = Integer.parseInt(dataVo.get("PRDT_PRIC_REAL") ); 
			int disc = Integer.parseInt( dataVo.get("DISC") );
			if( dataVo.get("DISC_CD").equals("DIS01") ) {
				double divide = parseInt / disc;
				double divi = parseInt % disc;
				double round = divide + divi;
				
				int BUY_PRIC = (int) Math.round(parseInt - round);
				
				dataVo.set("BUY_PRIC",  BUY_PRIC);
//				System.out.println("쿠폰으로 나누기 [BUY_PRIC]"+(BUY_PRIC));
				
			}else {
//				System.out.println("쿠폰으로 빼기 [BUY_PRIC]"+(parseInt - disc));
				dataVo.set("BUY_PRIC",parseInt - disc);
			}
		}

		
		if ( dataVo.get("BUY_TYPE").equals("피플메이드통장") || dataVo.get("BUY_TYPE").equals("피플메이드카드")  ) {
//			System.out.println("mypay");
			dataVo.set("loginIdx", dataVo.get("USER_IDX"));
			map = QueryService.selectDetail( dataVo.getParam() , "front", "Payment", "selectFrontPaymentUserPayToken");
			dataVo.set("sndCtoken", (String)map.get("KSNET_SVC_TKN"));
			
			dataVo.setAll( ksPayPaymentCancle.KSPayMyPayEutilBean(dataVo, request, response).getAll() );
			map.clear();
			
			map.put("authyn", dataVo.get("authyn" )); // 상태	O,X,S (은행타임아웃거래의경우 S상태로 정상 여부 확인이 필요합니다. )
			map.put("trddt", dataVo.get("trddt" )); // 거래일자
			map.put("trdtm", dataVo.get("trdtm" )); // 거래시간
			map.put("amt", dataVo.get("amt" )); // 금액
			map.put("msg1", dataVo.get("msg1" )); // 메시지1 
			map.put("msg2", dataVo.get("msg2" ));  // 메시지2
			map.put("result", dataVo.get("result" )); // 결제수단 B101 (마이통장) , 1001 (마이카드)
			map.put("resultcd", dataVo.get("resultcd" )); // 응답코드	정상: 0000 , 실패시 거절코드
			
			System.out.println(" 마이페이 취소 ");
			// 마이페이 통장일때 현금영수증 처리 생각할 것
			if ( dataVo.get("authyn" ).equals("O") ) {
				System.out.println(" 마이페이 현금영수증 취소 ");
				dataVo.set("cashCancleApprovalType", "H010");
				map.put( "CancleCashReciept" , ksPayPaymentCancle.CancleCashRecieptNCoupon(dataVo, request, response, QueryService));
			}
			
		}else {
//			System.out.println("kspay");
			if ( dataVo.get("BUY_TYPE").equals("휴대폰결제") ) {
//				System.out.println("휴대폰결제");
				
				dataVo.setAll( ksPayPaymentCancle.KSPayMobileCanclePost(dataVo, request, response).getAll() );
				map.clear();
				
				map.put("rApprovalType", dataVo.get("rApprovalType" )); // 승인구분 코드         
				map.put("rTransactionNo", dataVo.get("rTransactionNo" )); // 거래번호 
				map.put("rStatus", dataVo.get("rStatus" ));  // 거래성공여부  O:승인,  X:거절
				map.put("rTradeDate", dataVo.get("rTradeDate" )); // 거래일자
				map.put("rTradeTime", dataVo.get("rTradeTime" )); // 거래시간
				map.put("rBalAmount", dataVo.get("rBalAmount" )); // 잔액
				map.put("rRespCode", dataVo.get("rRespCode" )); // 응답코드
				map.put("rRespMsg", dataVo.get("rRespMsg" )); // 응답메시지
				map.put("rBypassMsg", dataVo.get("rBypassMsg" )); // Echo 필드
				map.put("rCompCode", dataVo.get("rCompCode" ));  // 기관코드
				map.put("rFiller", dataVo.get("rFiller" ));  // 예비
				
				if ( dataVo.get("rStatus" ).equals("O") ) {
					map.put( "CancleCashReciept" , ksPayPaymentCancle.CancleCashRecieptNCoupon(dataVo, request, response, QueryService));
				}
				
			}else if ( dataVo.get("BUY_TYPE").equals("계좌이체") ) {
//				System.out.println("계좌이체");
				
				dataVo.setAll( ksPayPaymentCancle.KSPayAccountCanclePost(dataVo, request, response).getAll() );
				map.clear();
				
				map.put("rApprovalType", dataVo.get("rApprovalType") ); // 승인구분
				map.put("rACTransactionNo", dataVo.get("rACTransactionNo") ); // 거래번호
				map.put("rACStatus", dataVo.get("rACStatus") );  // 오류구분 :승인 X:거절 O:승인,  X:거절, S:은행에서응답없음(취소확인요망)
				map.put("rACTradeDate", dataVo.get("rACTradeDate") ); // 거래 개시 일자(YYYYMMDD)
				map.put("rACTradeTime", dataVo.get("rACTradeTime") );// 거래 개시 시간(HHMMSS)
				map.put("rACAcctSele", dataVo.get("rACAcctSele") ); // 계좌이체 구분 -	1:Dacom, 2:Pop Banking,	3:실시간계좌이체 4: 승인형계좌이체
				map.put("rACFeeSele", dataVo.get("rACFeeSele") ); // 선/후불제구분 -	1:선불,	2:후불
				map.put("rACInjaName", dataVo.get("rACInjaName") );  // 인자명(통장인쇄메세지-상점명)
				map.put("rACPareBankCode", dataVo.get("rACPareBankCode") ); // 입금모계좌코드
				map.put("rACPareAcctNo", dataVo.get("rACPareAcctNo") );  // 입금모계좌번호
				map.put("rACCustBankCode", dataVo.get("rACCustBankCode") );  // 출금모계좌코드
				map.put("rACCustAcctNo", dataVo.get("rACCustAcctNo") );  // 출금모계좌번호
				map.put("rACAmount", dataVo.get("rACAmount") ); // 금액	(결제대상금액)
				map.put("rACBankTransactionNo", dataVo.get("rACBankTransactionNo") );  // 은행거래번호
				map.put("rACIpgumNm", dataVo.get("rACIpgumNm") ); // 입금자명
				map.put("rACBankFee", dataVo.get("rACBankFee") ); // 계좌이체 수수료
				map.put("rACBankAmount", dataVo.get("rACBankAmount") ); // 총결제금액(결제대상금액+ 수수료
				map.put("rACBankRespCode", dataVo.get("rACBankRespCode") );  // 오류코드
				map.put("rACMessage1", dataVo.get("rACMessage1") ); // 오류 message 1
				map.put("rACMessage2", dataVo.get("rACMessage2") ); // 오류 message 2
				map.put("rACFiller", dataVo.get("rACFiller") ); // 예비
				 
				if ( dataVo.get("rACStatus" ).equals("O") ) {
					dataVo.set("cashCancleApprovalType", "H210");
//					System.out.println( dataVo.getParam().get("buyNo" ) );
//					System.out.println( dataVo.getParam().get("buyOrderNumber" ) );
//					System.out.println( dataVo.getParam().get("userNick" ) );
//					System.out.println("dataVo.getParams() : " + dataVo.getParam());
					map.put( "CancleCashReciept" , ksPayPaymentCancle.CancleCashRecieptNCoupon(dataVo, request, response, QueryService));
				}
				
			}else if ( dataVo.get("BUY_TYPE").equals("신용카드") ) {
//				System.out.println("신용카드");
				
				List<Map<String, Object>> refundInfo = QueryService.selectList(dataVo.getParam(), "front", "Mypage", "selectFrontMypageRefundInfo");
				Map<String, Object> refundInfoAllCnt = QueryService.selectDetail(dataVo.getParam(), "front", "Mypage", "selectFrontMypageRefundInfoAllCnt");
				
				System.out.println(refundInfo);
				
				boolean cancleOnes = false;
				
				for (Map<String, Object> map2 : refundInfo) {
//					System.out.println("for문 실행중");
					if (cancleOnes) {
//						System.out.println("멈춤");
						break;
					}
					
					dataVo.set("Canc_seq","");
					dataVo.set("Canc_type","0");
					
					if (!map2.get("COUP_IDX").equals("0")) {
						if( map2.get("DISC_CD").equals("DIS01")) {
							map2.put("PRDT_PAY_PRIC_REAL", (int)( Double.parseDouble( String.valueOf( Integer.parseInt( String.valueOf( map2.get("PRDT_PRIC_REAL") ) ) * (1 - ( Integer.parseInt( String.valueOf( map2.get("DISC") ) )*0.01 ) ) ) ) ) );
				 		} else {
				 			map2.put("PRDT_PAY_PRIC_REAL", String.valueOf( Integer.parseInt( String.valueOf( map2.get("PRDT_PRIC_REAL") ) ) - Integer.parseInt( String.valueOf( map2.get("DISC") ) ) ) );
				 		}
					}else {
						map2.put( "PRDT_PAY_PRIC_REAL" , map2.get("PRDT_PRIC_REAL") );
					}
					
//					if (dataVo.get("BUY_IDX_LIST").split(",").length == Integer.parseInt( String.valueOf( refundInfoAllCnt.get("CNT") ) ) ) {
//						System.out.println("전체취소");
						dataVo.set("Canc_seq","");
						dataVo.set("Canc_type","0");
						cancleOnes = true;
//					}else {
//						
//						if ( map2.get("PRDT_PRIC_REAL").equals(map2.get("PRDT_PRIC_REAL_ALL") ) ) {
//							System.out.println("전체취소-2");
//							//단일상품
//							
//							dataVo.set("Canc_seq","");
//							dataVo.set("Canc_type","0");
//							cancleOnes = true;
//						}else {
//							System.out.println("부분취소");
//							//여러개 상품중 하나
//							dataVo.set("BUY_PRIC",map2.get("PRDT_PAY_PRIC_REAL"));
//							dataVo.set("Canc_seq",map2.get("PRDT_CANC_CNT"));
//							dataVo.set("Canc_type","3");
//						}
//						
//					}
					
					
					dataVo.setAll( ksPayPaymentCancle.KSPayCardCanclePost(dataVo, request, response).getAll() );
					map.clear();
					
					map.put("rApprovalType",dataVo.get("rApprovalType") );
					map.put("rTransactionNo",dataVo.get("rTransactionNo") );
					map.put("rStatus",dataVo.get("rStatus") );
					map.put("rTradeDate",dataVo.get("rTradeDate") );
					map.put("rTradeTime",dataVo.get("rTradeTime") );
					map.put("rIssCode",dataVo.get("rIssCode") );
					map.put("rAquCode",dataVo.get("rAquCode") );
					map.put("rAuthNo",dataVo.get("rAuthNo") );
					map.put("rMessage1",dataVo.get("rMessage1") );
					map.put("rMessage2",dataVo.get("rMessage2") );
					map.put("rCardNo",dataVo.get("rCardNo") );
					map.put("rExpDate",dataVo.get("rExpDate") );
					map.put("rInstallment",dataVo.get("rInstallment") );
					map.put("rAmount",dataVo.get("rAmount") );
					map.put("rMerchantNo",dataVo.get("rMerchantNo") );
					map.put("rAuthSendType",dataVo.get("rAuthSendType") );
					map.put("rApprovalSendType",dataVo.get("rApprovalSendType") );
					map.put("rPoint1",dataVo.get("rPoint1") );
					map.put("rPoint2",dataVo.get("rPoint2") );
					map.put("rPoint3",dataVo.get("rPoint3") );
					map.put("rPoint4",dataVo.get("rPoint4") );
					map.put("rVanTransactionNo",dataVo.get("rVanTransactionNo") );
					map.put("rFiller",dataVo.get("rFiller") );
					map.put("rAuthType",dataVo.get("rAuthType") );
					map.put("rMPIPositionType",dataVo.get("rMPIPositionType") );
					map.put("rMPIReUseType",dataVo.get("rMPIReUseType") );
					map.put("rEncData",dataVo.get("rEncData") );
					
//					System.out.println(dataVo.getParam());
					
					if ( dataVo.get("rStatus" ).equals("O") ) {
						// 네이버페이일경우 현금영수증 취소
//						System.out.println("현금영수증 취소 들어감");
						dataVo.set("cashCancleApprovalType", "H010");
						map.put( "CancleCashReciept" , ksPayPaymentCancle.CancleCashRecieptNCoupon(dataVo, request, response, QueryService));
					}
					
				}

			}else if ( dataVo.get("BUY_TYPE").equals("가상계좌") ) {
				// 현금영수증 취소
				dataVo.set("cashCancleApprovalType", "H610");
//				System.out.println("dataVo.getParams() : " + dataVo.getParam());
				map.put( "CancleCashReciept" , ksPayPaymentCancle.CancleCashRecieptNCoupon(dataVo, request, response, QueryService));
			}
		}
		svo.setOut("CamcleResult", map);
	}
	

	
	public void fn_CashReceiptIssue( UnitVO dataVo, HttpServletRequest request, HttpServletResponse response, String group, String subject, String query, UnitSVO svo  )throws Exception{
		KSPayController ksPayPaymentCancle = new KSPayController();
		
		Map<String , Object> map = new HashMap<>();

//		System.out.println("현금영수증 발급");
		
		dataVo.setAll(QueryService.selectDetail( dataVo.getParam() , group, subject, "selectFrontPaymentRefundInfo")); 
		
		
//		System.out.println( dataVo.getParam() );
//		System.out.println("시작");
		if ( dataVo.get("CASH_RECEIPT").equals("1") ) {
			
			dataVo = ksPayPaymentCancle.KSPayCashRecieptPost(dataVo, request, response);

			map.put("rApprovalType",dataVo.get("rApprovalType") );
			map.put("rTransactionNo",dataVo.get("rTransactionNo"));
			map.put("rStatus",dataVo.get("rStatus"));
			map.put("rTradeDate",dataVo.get("rTradeDate"));
			map.put("rTradeTime",dataVo.get("rTradeTime"));
			map.put("rCashTransactionNo",dataVo.get("rCashTransactionNo"));
			map.put("rIncomeType",dataVo.get("rIncomeType"));
			map.put("rMessage1",dataVo.get("rMessage1"));
			map.put("rMessage2",dataVo.get("rMessage2"));
			map.put("rCashMessage1",dataVo.get("rCashMessage1"));
			map.put("rCashMessage2",dataVo.get("rCashMessage2"));
			map.put("rFiller",dataVo.get("rFiller"));
			
			if (dataVo.get("rStatus").equals("O")) {
				QueryService.updateData(dataVo.getParam(), group, subject, "updateMngPayCashReceiptIssue");
			}
		}else {
			// 현금영수증 신청 안함
			map.put("rStatus","NO");
		}
			svo.setOut("receiptResult", map);
			
	}
	
	
	@RequestMapping(method= RequestMethod.POST, value ="/mng/login/login2")
	public UnitSVO login2(UnitSVO svo,  HttpServletRequest request) throws Exception{
		// 여기서 db처리 해야함
		UnitVO dataVo = new UnitVO(svo.getIn());
//		System.out.println("dataVo :"+dataVo.getParam());
//		System.out.println( request.getParameterMap() );
		//진행시간
		String [] params = request.getParameter("userid").split(",");
		//CATE_IDX,PRDT_CD,DATA_IDX,BUY_IDX
		dataVo.set("CATE_IDX",params[0]);
		dataVo.set("PRDT_CD",params[1]);
		dataVo.set("DATA_IDX",params[2]);
		dataVo.set("BUY_IDX",params[3]);
		dataVo.set("frontLoginIdx",params[4]);
		dataVo.set("PROG_TIME",request.getParameter("position"));
		float position = Float.parseFloat(request.getParameter("position"));
		float duration = Float.parseFloat(request.getParameter("duration"));
		if( (position / duration)*100 >= 50 ) dataVo.set("PROG_YN","Y");
		else dataVo.set("PROG_YN","N");
//		System.out.println( "position : " + position );
//		System.out.println( "duration : " + duration );
//		System.out.println( "(position / duration) : " + (position / duration)*100 ); 
//		System.out.println( "user : " + Arrays.toString( params ) );
//		System.out.println( "[userid] " + request.getParameter("userid") );
//		System.out.println( "[position] " + request.getParameter("position") );
		//전체시간
//		System.out.println( "[duration] " + request.getParameter("duration") );
//		System.out.println( "[uri] " + request.getParameter("uri") );
//		System.out.println( "[ip] " + request.getParameter("ip") );
//		System.out.println( "[device] " + request.getParameter("device") );
		QueryService.insertData( dataVo.getParam(), "front", "Mypeoplemade", "insertFrontVodPlayerProgData" );
		
		svo.setOut("params", dataVo.getParam() );
		return svo;
	}
	
	// http://210.113.36.169:1935/vodservice/_definst_/test/13.mp4/playlist.m3u8 의 재생주소의 uri는 test/13.mp4 입니다.
	// user id와 uri 부분만 token으로 묶어서 open_fiveplayer 스크립트를 사용하여 전달하시면 됩니다. run_keeper 값은 1이어야 합니다.
	public String makeFiveplayerToken(HttpServletRequest request, String userid, String uri){
//		System.out.println("request.getServerName() : "+ request.getServerName() );
		
//		System.out.println( "userid : "+ userid );
//		System.out.println( "uri : "+ uri );
		
		String userId2 = userid;
		if( userId2 == null ) userId2 = "free-"+request.getRemoteAddr();
		
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
		if( userid != null ) seek = userid.split(",")[5];
		else seek = "";
		String adaptive = "";									// 값 예시 ("1M,2M,700k"), 비어있을경우 일반 스킨 적용;
		String preToken = userid+"|"+"video/peoplemade/"+uri+"|"+run_keeper+"|"+ip+"|"+agent+"|"+now+"|"+domain+"|"+drm_valid+"|"+drm_playlimit+"|"+drm_viewtimelimit+"|"+seek+"|"+adaptive;			
		return Base64.encodeBase64String(preToken.getBytes());
	}
	
	private void fn_updateFrontTodayStatSaleData( UnitVO dataVo, String query ) throws Exception {
		

		List<Map<String, Object>> listMap = 
			QueryService.selectList(dataVo.getParam(), "front", "Cron", "selectCateList");

		for (Map<String, Object> map : listMap) {
			QueryService.insertData(map, "mng", "Sale", query);
		}
		
		
		
		
//		주석된 소스는
//		날짜별 데이터 삽입 기능
//		** 쿼리에서도 NOW() 대신 #{TEST_DATE}로 변환필수 **
//		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		Date date = null;
//		date = dateFormat.parse("2021-02-01");
//		Calendar cal = Calendar.getInstance();
//		cal.setTime(date);
//		
//		List<Map<String, Object>> listMap = 
//			QueryService.selectList(dataVo.getParam(), "front", "Cron", "selectCateList");
//		
//		for( int a = 0; a < 105; a++ ) {
//			if( a > 0 ) cal.add(Calendar.DATE, 1);
//			String strDate = dateFormat.format(cal.getTime());
//			
//			System.out.println( "strDate : " + strDate );
//			
//			for (Map<String, Object> map : listMap) {
//				map.put("TEST_DATE", strDate);
//
//				
//				
//				QueryService.insertData(map, "mng", "Sale", query);
//			}
//		}
		
		
		
		
	}
	
	@ResponseBody
	private UnitSVO fn_NpayPointCashReceipt(UnitSVO svo, UnitVO dataVo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println( "fn_NpayPointCashReceipt" );
		System.out.println( dataVo.getParam() );
		
		String line = null;
		InputStream in = null;
		BufferedReader reader = null;
		String result = "";
		
		URL url = new URL("https://kspay.ksnet.to/store/PAY_PROXY/api002/npoint/cashbill_post.jsp");
		HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
		
		connection.setRequestMethod("POST");
		connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		connection.setRequestProperty("Charset", "utf-8");
		connection.setUseCaches(false);
		connection.setDoInput(true);
		connection.setDoOutput(true);
		connection.setConnectTimeout(10000);
		
		String comp_dtm	= dataVo.get("COMP_DTM");
		String buy_idx	= dataVo.get("BUY_IDX");
		String buy_no	= dataVo.get("BUY_NO");
		String token	= dataVo.get("TOKEN");
		String req_type = dataVo.get("REQ_TYPE");
		
		String trantype = dataVo.get("tranType");
		String userInfoType = dataVo.get("userInfoType");
		String userInfo = dataVo.get("userInfo");
		
		StringBuffer sb = new StringBuffer();
		sb.append("charset").append("=").append("utf8").append("&");
		sb.append("mid").append("=").append("2001106623").append("&");
		sb.append("msalt").append("=").append("MA01").append("&");
		sb.append("etoken").append("=").append(token).append("&");
		sb.append("tid").append("=").append( buy_no ).append("&");
		sb.append("apprTradeDate").append("=").append(comp_dtm).append("&");
		if (req_type.equals("1")) {
			sb.append("trantype").append("=").append(trantype).append("&");
			sb.append("userInfoType").append("=").append( userInfoType ).append("&");
			sb.append("userInfo").append("=").append(userInfo).append("&");
		}
		sb.append("reqType").append("=").append(req_type);
		
		PrintWriter pw = new PrintWriter(new OutputStreamWriter(connection.getOutputStream(), "UTF-8") );
		pw.write( sb.toString() );
		pw.flush();	
		System.out.println( sb.toString() );
		int responseCode = connection.getResponseCode();
		System.out.println("응답코드 : " + responseCode);
		System.out.println("응답메세지 : " + connection.getResponseMessage());
		
		if ( responseCode == 200 ) {
			in = connection.getInputStream();
			
		}else {
			in = connection.getErrorStream();
		}
		
		reader = new BufferedReader(new InputStreamReader(in));
		List<String> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		while ((line = reader.readLine()) != null) {
			System.out.println( line );
			list.add(line);
			result += line; 
		} 
		JSONObject jsonObject = new JSONObject( result ); 
		
		JSONArray jArray = new JSONArray();
		jArray.put(jsonObject);
		
		map.put("NpayResult", list);
		reader.close();
		
		if (reader != null) { reader.close(); }
		if (connection != null) { connection.disconnect(); }
		svo.setOut("data", map);
		return svo;
	}
	
	
	
	//////////////////////////////////////////////////
	// 상품별 현황 통계 당일건을 처리하기 위한 컨트롤러 이며
	private void fn_todaty_site_stat_prdt(UnitSVO svo, UnitVO dataVo, HttpServletRequest request) throws Exception {
		
		
		ArrayList<Map<String, Object>> List = (ArrayList<Map<String, Object>>) QueryService.selectList(dataVo.getParam(), "mng", "Prdt", "selectMngPrdtDATA");
		
		for (Map<String, Object> map : List) {
			dataVo.setAll(map);
//			System.out.println(map.toString());
			QueryService.insertData(dataVo.getParam(), "mng", "Prdt", "insertMngPrdtDATA");
		}
		
	}
	
	
	
	
	
}




