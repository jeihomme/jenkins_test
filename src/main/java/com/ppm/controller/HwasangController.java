package com.ppm.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iwonsoft.unit.PageUtil;
import com.iwonsoft.unit.UnitSVO;
import com.iwonsoft.unit.UnitVO;
import com.ppm.gabia.ApiClass;
import com.ppm.gabia.ApiResult;
import com.ppm.service.QueryService;

@Controller
@RequestMapping(value= {"/prdt/*"} )
public class HwasangController {
	
	@Resource(name="QueryService")
	private QueryService QueryService;
	
	PageUtil pageUtil;

	@RequestMapping(method= RequestMethod.GET, value = "over")
	public void overget(UnitSVO svo,HttpServletRequest request, String masterid, String endtime, String buyIdx) throws Exception {
		
		UnitVO dataVo = new UnitVO(svo.getIn());
		String[] masterUserInfo = null;
//		if ( masterid.indexOf(",") > -1 ) {
//		 	masterUserInfo = masterid.split(",");
//		}
		
//		if (masterUserInfo != null)
//			dataVo.set("buyIdx",  masterUserInfo[0] ); 
//		else
//			dataVo.set("buyIdx",  masterid );

		dataVo.set("buyIdx",  buyIdx ); 
		dataVo.set("histEndTime",  endtime ); 
		
		System.out.println( "masterid:  " + masterid );
		System.out.println( "endtime:  " + endtime );
		
		System.out.println( "masterid getParameter:  " +  request.getParameter("masterid") );
		System.out.println( "endtime getParameter:  " +  request.getParameter("endtime") );
		
		QueryService.insertData(dataVo.getParam(), "front", "EMeetPlus", "insertFrontChatPicture");
		
		

		List<Map<String,Object>> selectList = QueryService.selectList(dataVo.getParam(), "front", "EMeetPlus", "selectPaySmsList");

		String api_id = "manager";		// sms.gabia.com 이용 ID
		String api_key = "77886d1fe2c61b3f95d5ebc518f113a7";	// 환결설정에서 확인 가능한 SMS API KEY
		String API_SENDER = "07077327105";
		
		ApiClass api = new ApiClass(api_id, api_key);
		
		for( Map<String,Object> selectDetail : selectList ) {
//			유저에게 보내는 문자
			if( String.valueOf( selectDetail.get("USER_PHONE") ).length() > 0 ) {

				if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("VL") < 0 ) {

					if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("EN") > -1) {
						
					} else {
						String USER_TITLE = "";
						String USER_MSG = "";
						String API_RECEIVER = "";
						
						USER_TITLE 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님, 피플메이드입니다.";

						USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님\r\n"
										+ "오늘도 알찬 강의 잘 마무리 하셨나요? 오늘 수강하셨던 강의는 24시간 내에 마스터님께서 히스토리에 요약하여 내용을 올려주실 예정입니다.\r\n\n"
										+ "피플메이드 드림.";
						
//						USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님, 상담은 잘 마무리되셨는지요?\r\n\n"
//										+ "상담내용은 마이피플에서 7일간 다시확인하실 수 있으며,\r\n"
//										+ String.valueOf( selectDetail.get("M_USER_NM") )+"님께서 24시간이내에 오늘 상담하셨던 내용을 간략하게 정리해드릴 예정입니다.\r\n\n"
//										+ "오늘 상담에 대해 다른 회원들의 상담선택과 진행에 도움이 될 수 있는 리뷰 작성도 잊지마세요^^\r\n\n"
//										+ "피플메이드 드림.";
						
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
//						System.out.println("response xml : \n" + responseXml);
//						System.out.println( "code = [" + res.getCode() + "] mesg=[" + res.getMesg() + "]" );

						String resultXml = "";
						if( res.getCode().compareTo("0000") == 0 ) resultXml = api.getResultXml(responseXml);
//						System.out.println("result xml : \n" + resultXml);
					}
				}
			}
			
//			마스터에게 보내는 문자
			if( String.valueOf( selectDetail.get("M_USER_NM") ).length() > 0 ) {

				if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("VL") < 0 ) {

					if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("EN") > -1) {
						
					} else {
						String USER_TITLE = "";
						String USER_MSG = "";
						String API_RECEIVER = "";
						
						USER_TITLE 		= "안녕하세요 "+String.valueOf( selectDetail.get("M_USER_NM") )+"마스터님, 피플메이드입니다.";


						USER_MSG 		= String.valueOf( selectDetail.get("M_USER_NM") )+"마스터님 라이브코칭이 종료되었습니다.\r\n"
										+ "상담관리>지난상담에 들어가셔서 오늘 상담내용을 간략하게 정리해주시면 "+ String.valueOf( selectDetail.get("USER_NM") ) +"님께 좀더 유익한 상담이 되리라 믿습니다. \r\n\n"
										+ "상담내역 작성은 24시간이내에 작성해주시면 됩니다.\r\n\n"
										+ "수고하셨습니다.\r\n\n"
										+ "피플메이드 드림.";
						
//						USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("M_USER_NM") )+"마스터님, 수고하셨습니다.\r\n\n"
//										+ "관리페이지에 로그인후에 상담관리 > 지난상담에 들어가셔서 오늘 상담내용을 간략하게 마스터후기로 작성해주시면\r\n"
//										+ String.valueOf( selectDetail.get("USER_NM") ) +"님께 좀더유익한 상담이 되리라 믿습니다.\r\n\n"
//										+ "상담내역 작성은 24시간이내에 작성해주시면 됩니다.\r\n\n"
//										+ "피플메이드 드림.";
						
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
		
		
	}
	
	@RequestMapping(method= RequestMethod.GET, value = "record")
	public void recordget(UnitSVO svo, HttpServletRequest request, String recordUrl, String buyIdx) throws Exception {
		
		UnitVO dataVo = new UnitVO(svo.getIn());
//		String[] masterUserInfo = null;
//		String[] masterIdxInfo = null;

//		masterUserInfo = recordUrl.split(",");
		
//		masterIdxInfo = masterUserInfo[0].split("/");
		System.out.println("buyIdx : " +  buyIdx );
		System.out.println("recordUrl : " +  recordUrl );
		
//		dataVo.set("BUY_IDX",  masterIdxInfo[ masterIdxInfo.length -1 ] );
		dataVo.set("BUY_IDX",  buyIdx );
		
		
		dataVo.set("HIST_VOD_ADDR",  recordUrl ); 
		
		System.out.println( "recordUrl :: " + recordUrl );
		
		
		System.out.println( "recordUrl getParameter :: " +  request.getParameter("recordUrl") );
		
		QueryService.insertData(dataVo.getParam(), "front", "EMeetPlus", "insertFrontChatPicture");
		
	}

	
}




