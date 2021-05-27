package com.ppm.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.iwonsoft.unit.UnitExtends;
import com.iwonsoft.unit.UnitSVO;
import com.iwonsoft.unit.UnitVO;
import com.ppm.gabia.ApiClass;
import com.ppm.gabia.ApiResult;
import com.ppm.service.QueryService;


@Component
public class CronController extends UnitExtends {

	@Resource(name="QueryService")
	private QueryService QueryService;
	
//					초 분 시 일 월 주(년)
	@Scheduled(cron="0 0 1 * * ?")
	public void scheduleRun( ) throws Exception {

		Map<String, Object> mapInit = null;
		UnitVO dataVo = new UnitVO( mapInit );
		String group = "front";
		String subject = "Cron";
		String query = "selectFrontCronCnt";
		
		System.out.println("selectFrontCronCnt : ");
		Map<String, Object> map = QueryService.selectDetail( dataVo.getParam(), group, subject, query );
		
		if ( ! String.valueOf( map.get("CNT") ).equals("0") ) {
			System.out.println("updateFrontUserData : ");
			query = "updateFrontUserData";
			QueryService.updateData( dataVo.getParam(), group, subject, query );
		}
	}

/*
//	초 분 시 일 월 주(년)
//	매일
	@Scheduled(cron="0 * * * * ?")
	public void scheduleWaitingCoach( ) throws Exception {
		Map<String, Object> mapInit = null;
		UnitVO dataVo = new UnitVO( mapInit );
		
		List<Map<String,Object>> selectList = QueryService.selectList(dataVo.getParam(), "front", "Cron", "selectPaySmsList");

		String api_id = "manager";		// sms.gabia.com 이용 ID
		String api_key = "77886d1fe2c61b3f95d5ebc518f113a7";	// 환결설정에서 확인 가능한 SMS API KEY
		String API_SENDER = "07077327105";

		ApiClass api = new ApiClass(api_id, api_key);
		
		for( Map<String,Object> selectDetail : selectList ) {
//			유저에게 보내는 문자
			if( String.valueOf( selectDetail.get("USER_PHONE") ).length() > 0 ) {

				if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("VL") < 0 ) {
					String USER_TITLE = "";
					String USER_MSG = "";
					String API_RECEIVER = "";

					USER_TITLE 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님, 피플메이드입니다.";
					
					if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("EN") > -1) {
						String MAIL_STR_DIFF = String.valueOf( selectDetail.get("MAIL_STR_DIFF") ).split(":")[0] + String.valueOf( selectDetail.get("MAIL_STR_DIFF") ).split(":")[1];
						Integer MAIL_STR = Integer.parseInt( MAIL_STR_DIFF );
						
						if( MAIL_STR == 16800 ) {
							//이메일상담 마감 7일 전
							USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님\r\n\n"
											+ "피플메이드입니다. 사용가능한 1:1이메일코칭 기간이 1주일 남았습니다. \r\n"
											+ "상담하고자 하시는 내용이 있으시다면 계정에 로그인하셔서 이메일상담을 보내보세요.^^\r\n\n"
											+ "피플메이드 드림.";
						} else if( MAIL_STR == 7200 ) {
							//이메일상담 마감 3일 전
							USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님, 피플메이드입니다.\r\n\n"
											+ "피플메이드입니다. 사용가능한 1:1이메일코칭 기간이 3일 남았습니다. \r\n"
											+ "상담하고자 하시는 내용이 있으시다면 계정에 로그인하셔서 이메일상담을 보내보세요.^^\r\n\n"
											+ "피플메이드 드림.";
						}
					} else {
						String TIME_STR_DIFF = String.valueOf( selectDetail.get("TIME_STR_DIFF") ).split(":")[0] + String.valueOf( selectDetail.get("TIME_STR_DIFF") ).split(":")[1];
						Integer TIME_DIFF = Integer.parseInt( TIME_STR_DIFF );
						Integer TIME_DTM_DIFF = Integer.parseInt( String.valueOf( selectDetail.get("TIME_DTM_DIFF") ) );
						
//						if( TIME_DTM_DIFF == 1 && TIME_DIFF == 0 ) {
//							//1:1코칭 
//							USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님,\r\n"
//											+ "내일 " + String.valueOf( selectDetail.get("M_USER_NM") ) +" 마스터님과의 "+ String.valueOf( selectDetail.get("PRDT_TYPE") ) +"이/가 "
//											+ String.valueOf( selectDetail.get("TIME_STR") ) +"에 예약되어있습니다.\r\n"
//											+ "잊지마시고 꼭 챙기시기바랍니다.\r\n\n"
//											+ "감사합니다.\r\n\n"
//											+ "피플메이드 드림.";
//						} else

						String PRDT_TYPE = "";
						if( String.valueOf( selectDetail.get("PRDT_TYPE") ).indexOf("LN") < 0 ) PRDT_TYPE = "1:1 코칭";
						else PRDT_TYPE = "라이브클래스";
						
						if( String.valueOf( selectDetail.get("PRDT_TYPE") ).indexOf("LN") < 0 ) {
							if( TIME_DIFF == 100 ) {
								USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님,\r\n"
												+ "예약하신 " + String.valueOf( selectDetail.get("M_USER_NM") ) +" 마스터님과의 "+ PRDT_TYPE +"이/가 "
												+ String.valueOf( selectDetail.get("TIME_DTM_NM") ) +" "+ String.valueOf( selectDetail.get("TIME_STR") ) + "(24시간표기 기준)에 시작됩니다 ~ !\r\n\n"
												+ "예약하신 코칭은 마이피플에서 확인하실 수 있으며, 구매하신 목록에서 클릭 후 마스터님이 기다리시는 방으로 입장하실 수 있습니다^^ \r\n"
												+ "늦지않게 참석해 주세요~ ! \r\n\n"
												+ "피플메이드 드림.\r\n\n"
												+ "* 부득이하게 시간이 지난 상담에 대하여 취소/환불조치가 불가하오니 마스터님과 약속된 시간을 반드시 지켜주시기 바랍니다. * ";
							} else if( TIME_DIFF == 10 ) {
								USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님,\r\n"
												+ "예약하신 " + String.valueOf( selectDetail.get("M_USER_NM") ) +" 마스터님과의 "+ PRDT_TYPE +"이/가 "
												+ "10분 후 진행될 예정입니다.\r\n\n"
												+ "예약하신 코칭은 마이피플에서 확인하실 수 있으며, 구매하신 목록에서 클릭 후 마스터님이 기다리시는 방으로 입장하실 수 있습니다^^ \r\n"
												+ "늦지않게 참석해 주세요~ ! \r\n\n"
												+ "피플메이드 드림.\r\n\n"
												+ "* 부득이하게 시간이 지난 상담에 대하여 취소/환불조치가 불가하오니 마스터님과 약속된 시간을 반드시 지켜주시기 바랍니다. * ";
							}
						} else {
							if( TIME_DIFF == 2400 ) {
								USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님,\r\n"
												+ "요청하신 " + String.valueOf( selectDetail.get("M_USER_NM") ) +" 마스터님과의 "+ PRDT_TYPE +"이/가 "
												+ String.valueOf( selectDetail.get("TIME_DTM_NM") ) +" "+ String.valueOf( selectDetail.get("TIME_STR") ) + "(24시간표기 기준)에 시작될 예정이오니 잊지말고 참여해주시기 바랍니다~\r\n\n"
												+ "피플메이드 드림.\r\n\n";
							} else if( TIME_DIFF == 10 ) {
								USER_MSG 		= "안녕하세요 "+String.valueOf( selectDetail.get("USER_NM") )+"님,\r\n"
												+ "예약하신 " + String.valueOf( selectDetail.get("M_USER_NM") ) +" 마스터님과의 "+ PRDT_TYPE +"이/가 "
												+ "10분 후 시작 예정입니다.\r\n\n"
												+ "강의실 입장은 마이피플에서 하실 수 있으며, 구매하신 목록에서 클릭 후 마스터님이 기다리시는 방으로 입장하실 수 있습니다^^ \r\n"
												+ "늦지않게 참석해 주세요~ ! \r\n\n"
												+ "피플메이드 드림.\r\n\n"
												+ "* 부득이하게 시간이 지난 상담에 대하여 취소/환불조치가 불가하오니 마스터님과 약속된 시간을 반드시 지켜주시기 바랍니다. * ";
							}
						}
					}
					
					API_RECEIVER 	= String.valueOf( selectDetail.get("USER_PHONE") );

					if( !USER_MSG.equals("") ) {
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
					String USER_TITLE = "";
					String USER_MSG = "";
					String API_RECEIVER = "";
					
					USER_TITLE 		= "안녕하세요 "+String.valueOf( selectDetail.get("M_USER_NM") )+"마스터님, 피플메이드입니다.";

					if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("EN") > -1) {
//						이메일은 상담요청 즉시 알람되도록 설정할 것
					} else {
						String TIME_STR_DIFF = String.valueOf( selectDetail.get("TIME_STR_DIFF") ).split(":")[0] + String.valueOf( selectDetail.get("TIME_STR_DIFF") ).split(":")[1];
						Integer TIME_DIFF = Integer.parseInt( TIME_STR_DIFF );
						
						if( String.valueOf( selectDetail.get("BUY_PRDT_CD") ).indexOf("LN") < 0 ) {
							if( TIME_DIFF == 100 ) {
								USER_MSG 		= String.valueOf( selectDetail.get("M_USER_NM") )+"마스터님\r\n"
												+ String.valueOf( selectDetail.get("USER_NM") )+"님이 신청하신 코칭을 "
												+ String.valueOf( selectDetail.get("TIME_DTM_NM") ) +" "+ String.valueOf( selectDetail.get("TIME_STR") ) + "에 확정 하셨습니다./r/n/n"
												+ "마스터님을 기다리는 " + String.valueOf( selectDetail.get("USER_NM") ) + "님을 위하여 코칭시간 전 방에 입장하여 대기해주시기 바랍니다. /r/n/n"
												+ "오늘도 마스터님의 귀중한 하루를 응원합니다.\r\n\n"
												+ "피플메이드 드림.";
							} else if( TIME_DIFF == 10 ) {
								USER_MSG 		= String.valueOf( selectDetail.get("M_USER_NM") )+"마스터님\r\n"
												+ String.valueOf( selectDetail.get("USER_NM") )+"님이 신청하신 코칭이 잠시 후 10분 뒤 시작 될 예정입니다. /r/n/n"
												+ "마스터님을 기다리는 " + String.valueOf( selectDetail.get("USER_NM") ) + "님을 위하여 코칭시간 전 방에 입장하여 대기해주시기 바랍니다. /r/n/n"
												+ "오늘도 마스터님의 귀중한 하루를 응원합니다.\r\n\n"
												+ "피플메이드 드림.";
							}
						} else {
							if( TIME_DIFF == 2400 ) {
//								라이브클래스 24시간 전
								USER_MSG 		= String.valueOf( selectDetail.get("M_USER_NM") )+"마스터님\r\n"
												+ "라이브클래스 시작 24시간 전 입니다./r/n/n"
												+ "마스터페이지에서 대기중인 상담 확인 후 확정이 안되어 있는 대기자가 있다면 반드시 확정 버튼을 눌러주시기 바랍니다. /r/n/n"
												+ "피플메이드 드림.";
							} else if( TIME_DIFF == 10 ) {
//								라이브클래스 10분 전
								USER_MSG 		= String.valueOf( selectDetail.get("M_USER_NM") )+"마스터님\r\n"
												+ "라이브클래스 시작 10분 전 입니다./r/n/n"
												+ "마스터님을 기다리는 사용자들을 위하여 시간 5분 전 강의실에 먼저 입장하여 대기해주시기 바랍니다. /r/n/n"
												+ "*시작전 라이브강의실 왼쪽 상단의 녹화버튼을 누르시고 시작하여주시고 종료 시 옆에 멈춤 버튼을 눌러 저장하여 주시기 바랍니다. /r/n/n"
												+ "오늘도 마스터님의 귀중한 하루를 응원합니다. /r/n/n"
												+ "피플메이드 드림.";
							}
						}
					}
					
					API_RECEIVER	= String.valueOf( selectDetail.get("M_USER_PHONE") );

					if( !USER_MSG.equals("") ) {
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
			}
		}
	}

*/
	//	초 분 시 일 월 주(년)
	// 매일
	@Scheduled(cron="0 0 0 * * ?")
//	@Scheduled(cron="*/10 * * * * ?")
	public void scheduleUpdateUserStatistics( ) throws Exception {
		
		Map<String, Object> mapInit = null;
		UnitVO dataVo = new UnitVO( mapInit );
		String group = "front";
		String subject = "Cron";
		String query = "insertFrontStatJoinData";
		
		System.out.println("insertFrontStatJoinData : ");
		int i = QueryService.insertData( dataVo.getParam(), group, subject, query );
		if (i > 0) {
			System.out.println( "성공적" );
		}else {
			System.out.println( "실패함" );
		}
		
		scheduleInsertSaleData( dataVo );
		scheduleInsertDashPlatform();
		scheduleInsertDashService();
		scheduleInsertPtdtService( dataVo);
		
	}
	
	private void scheduleInsertSaleData(UnitVO dataVo) throws Exception{
		
		String group = "front";
		String subject = "Cron";
		String query = "selectCateList";
		
		List<Map<String, Object>> listMap = 
				QueryService.selectList(dataVo.getParam(), group, subject, query);
		
		System.out.println( "selectCateList : 실행" );
		
		query = "insertFrontStatSaleData";
		
		for (Map<String, Object> map : listMap) {
			QueryService.insertData(map, group, subject, query);
		}
	}
	
	
	public void scheduleInsertDashPlatform( ) throws Exception {
		
		Map<String, Object> mapInit = null;
		UnitVO dataVo = new UnitVO( mapInit );
		String group = "front";
		String subject = "Cron";
		String query = "deleteDashPlatform";
		
		int i = QueryService.insertData( dataVo.getParam(), group, subject, query );
		
		mapInit = null;
		dataVo = new UnitVO( mapInit );
		group = "front";
		subject = "Cron";
		query = "insertDashPlatform";
		
		i = QueryService.insertData( dataVo.getParam(), group, subject, query );
		if (i > 0) System.out.println( "성공적" );
		else System.out.println( "실패함" );
		
	}
	
	
	public void scheduleInsertDashService( ) throws Exception {
		
		Map<String, Object> mapInit = null;
		UnitVO dataVo = new UnitVO( mapInit );
		String group = "front";
		String subject = "Cron";
		String query = "deleteDashService";
		
		int i = QueryService.insertData( dataVo.getParam(), group, subject, query );
		
		mapInit = null;
		dataVo = new UnitVO( mapInit );
		group = "front";
		subject = "Cron";
		query = "insertDashService";
		
		i = QueryService.insertData( dataVo.getParam(), group, subject, query );
		if (i > 0) System.out.println( "성공적" );
		else System.out.println( "실패함" );
		
	}
	
	
	private void scheduleInsertPtdtService( UnitVO dataVo) throws Exception {
		System.out.println( "상품별 현황관리 데이터를 남깁니다 : 실행" );
		ArrayList<Map<String, Object>> List = (ArrayList<Map<String, Object>>) QueryService.selectList(dataVo.getParam(), "front", "Cron", "selectMngPrdtDATA");
		
		for (Map<String, Object> map : List) {
			dataVo.setAll(map);
			QueryService.insertData(dataVo.getParam(), "front", "Cron", "insertMngPrdtDATA");
		}
		
	}
	
	
}






