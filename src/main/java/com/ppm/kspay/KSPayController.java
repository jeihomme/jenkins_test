package com.ppm.kspay;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iwonsoft.unit.UnitVO;
import com.iwonsoft.util.RequestUtil;
import com.ppm.kspay.mypay.KSPayMyPayEutilBean;
import com.ppm.service.QueryService;

//@Controller
//@RequestMapping(value= {"/front/*/*","/mng/*/*","/cms/*/*"} )
public class KSPayController {

//	@Resource(name="QueryService")
//	private QueryService QueryService;
	
	RequestUtil requestUtil;
	
//	static String	MYPAY_LOG_HOME_DIR		= "C:/Users/ChoiWooseong/Desktop/myPaylog/";
//	static String	KSPAY_LOG_HOME_DIR		= "C:/Users/ChoiWooseong/Desktop/loog/";
	static String	MYPAY_LOG_HOME_DIR		= "C:/myPaylog/";
	static String	KSPAY_LOG_HOME_DIR		= "C:/ksPaylog/";
	static String 	STOREID = "2001106623";
//	static String 	STOREID = "2999199999";
	
	// 현금영수증 밎 쿠폰 발급 취소
	public UnitVO CancleCashRecieptNCoupon( UnitVO dataVo, HttpServletRequest request, HttpServletResponse response,QueryService QueryService  )throws Exception{
		if (dataVo.get("CASH_RECEIPT").equals("1")) {
//			System.out.println("dataVO : " + dataVo.getParam() );
//			System.out.println(dataVo.get("cashReceNo") );
//			System.out.println(dataVo.getParam().get("cashReceNo") );
			dataVo.setAll( KSPayCashReshiptCanclePost(dataVo, request, response).getAll() );
			if ( dataVo.get("rHStatus").equals("O") ) {
				dataVo.set("CASH_RECEIPT_CANCLE", "현금영수증 취소 완료");
			}else {
				dataVo.set("CASH_RECEIPT_CANCLE", "현금영수증 취소 거절 : 사유 ["+dataVo.get("rHCashMessage1")+"]");
			}
			
		}
		
		if (dataVo.get("BUY_TYPE").equals("피플메이드카드") || dataVo.get("BUY_TYPE").equals("신용카드") ) {
			dataVo.set("CANCLE_BUY_STAT",	 "취소완료");
		}else {
			dataVo.set("CANCLE_BUY_STAT",	 "환불완료");
		}
//		System.out.println("[updateFrontMypageRefundData] "+dataVo.getParam());
		QueryService.updateData(dataVo.getParam(), "front", "Mypage", "updateFrontMypageRefundData");
		
		
		
//		if ( !dataVo.get("COUP_IDX").equals("") ) {
//			System.out.println("쿠폰 살아난다");
//			QueryService.updateData(dataVo.getParam(), "front", "Mypage", "updateCancleCoupData");
//		}

		
		return dataVo;
	}



	
	public UnitVO KSPayCashReshiptCanclePost( UnitVO dataVo, HttpServletRequest request, HttpServletResponse response  )throws Exception{
//		System.out.println("현금 영수증 발급 취소");
		request.setCharacterEncoding("EUC-KR");
		
		
	// Default(수정항목이 아님)-------------------------------------------------------
		String EncType       = "0";                                      // 0: 암화안함, 1:openssl, 2: seed
		String Version       = "0210";                                   // 전문버전
		String Type          = "00";                                     // 구분
		String Resend        = "0";                                      // 전송구분 : 0 : 처음,  2: 재전송
		String RequestDate   = new SimpleDateFormat("yyyyMMddhhmmss").format(new java.util.Date()); // 요청일자 : yyyymmddhhmmss
		String KeyInType     = "K";                                      // KeyInType 여부 : S : Swap, K: KeyInType
		String LineType      = "1";                                      // lineType 0 : offline, 1:internet, 2:Mobile
		String ApprovalCount = "1";                                      // 복합승인갯수
		String GoodType      = "0";                                      // 제품구분 0 : 실물, 1 : 디지털
		String HeadFiller    = "";                                       // 예비
	//-------------------------------------------------------------------------------
		
	// Header (입력값 (*) 필수항목)--------------------------------------------------
		String StoreId       = STOREID;          // *상점아이디
		String OrderNumber   = (String) dataVo.getParam().get("buyOrderNumber");             // 주문번호
		String UserName      = (String) dataVo.getParam().get("userNick");        // *주문자명
		String IdNum         = "";                                       // 주민번호 or 사업자번호
		String Email         = "";                                       // *email
		String GoodName      = "";                                       // *제품명
		String PhoneNo       = "";                                       // *휴대폰번호
	// Header end -------------------------------------------------------------------
		
	// Data Default(수정항목이 아님)-------------------------------------------------
		String ApprovalType  = (String) dataVo.getParam().get("cashCancleApprovalType");           // 승인구분
		String TrNo          = (String) dataVo.getParam().get("cashReceNo");             // 거래번호
		String Refundcheck   = "1";   // 취소구분(1.거래취소, 2.오류발급취소, 3.기타) 
	// Data Default end -------------------------------------------------------------
		
	// 승인거절 응답
	// Server로 부터 응답이 없을시 자체응답
		String rApprovalType        = "H011"; 
		String rHTransactionNo      = "";                // 거래번호
		String rHStatus             = "X";               // 상태 O : 승인, X : 거절
		String rHCashTransactionNo  = "";                // 현금현수증 거래확인번호
		String rHIncomeType         = "";                // 소득비소득 구분
		String rHTradeDate          = "";                // 거래일자
		String rHTradeTime	        = "";                // 거래시간
		String rHMessage1           = "취소거절";        // 메시지1
		String rHMessage2           = "C잠시후재시도";   // 메시지2
		String rHCashMessage1       = "";
		String rHCashMessage2       = "";

		try
		{
			KSPayApprovalCancelBean ipg = new KSPayApprovalCancelBean("localhost", 29991); 
			
			ipg.HeadMessage(EncType, Version, Type, Resend, RequestDate, StoreId, OrderNumber, UserName, IdNum, Email, 
							GoodType, GoodName, KeyInType, LineType, PhoneNo, ApprovalCount, HeadFiller);
			
	//<현금영수증 취소변경> 
			ipg.CancelDataMessage(ApprovalType, "0", TrNo, "", OrderNumber, "",Refundcheck,"");
			
			if(ipg.SendSocket("1")) {
				rApprovalType       = ipg.ApprovalType[0];
				rHTransactionNo     = ipg.HTransactionNo[0];         // 거래번호
				rHStatus            = ipg.HStatus[0];                // 상태 O : 승인, X : 거절
				rHCashTransactionNo = ipg.HCashTransactionNo[0];     // 거래일자
				rHIncomeType        = ipg.HIncomeType[0];            // 거래시간
				rHTradeDate         = ipg.HTradeDate[0];             // 발급사코드
				rHTradeTime         = ipg.HTradeTime[0];             // 매입사코드
				rHMessage1          = ipg.HMessage1[0];              // 승인번호 or 거절시 오류코드
				rHMessage2          = ipg.HMessage2[0];              // 메시지1
				rHCashMessage1      = ipg.HCashMessage1[0];          // 메시지2
				rHCashMessage2      = ipg.HCashMessage2[0];          // 카드번호
			}
		}
		catch(Exception e) {
			rHMessage2 = "P잠시후재시도("+e.toString()+")";     // 메시지2
		} // end of catch
		
		
//		System.out.println("현금영수증 취소요청 결과 [ rApprovalType "+rApprovalType+" ] ");
//		System.out.println("현금영수증 취소요청 결과 [ rHTransactionNo "+rHTransactionNo+" ] ");
//		System.out.println("현금영수증 취소요청 결과 [ rHStatus "+rHStatus+" ] ");
//		System.out.println("현금영수증 취소요청 결과 [ rHCashTransactionNo "+rHCashTransactionNo+" ] ");
//		System.out.println("현금영수증 취소요청 결과 [ rHIncomeType "+rHIncomeType+" ] ");
//		System.out.println("현금영수증 취소요청 결과 [ rHTradeDate "+rHTradeDate+" ] ");
//		System.out.println("현금영수증 취소요청 결과 [ rHTradeTime "+rHTradeTime+" ] ");
//		System.out.println("현금영수증 취소요청 결과 [ rHMessage1 "+rHMessage1+" ] ");
//		System.out.println("현금영수증 취소요청 결과 [ rHMessage2 "+rHMessage2+" ] ");
//		System.out.println("현금영수증 취소요청 결과 [ rHCashMessage1 "+rHCashMessage1+" ] ");
//		System.out.println("현금영수증 취소요청 결과 [ rHCashMessage2 "+rHCashMessage2+" ] ");
		
		dataVo.set("rApprovalType",rApprovalType);
		dataVo.set("rHTransactionNo",rHTransactionNo);
		dataVo.set("rHStatus",rHStatus);
		dataVo.set("rHCashTransactionNo",rHCashTransactionNo);
		dataVo.set("rHIncomeType",rHIncomeType);
		dataVo.set("rHTradeDate",rHTradeDate);
		dataVo.set("rHTradeTime",rHTradeTime);
		dataVo.set("rHMessage1",rHMessage1);
		dataVo.set("rHMessage2",rHMessage2);
		dataVo.set("rHCashMessage1",rHCashMessage1);
		dataVo.set("rHCashMessage2",rHCashMessage2);
		
		StringBuffer sb = new StringBuffer();
		sb.append("rApprovalType").append("=").append(rApprovalType);
		sb.append("rHTransactionNo").append("=").append(rHTransactionNo);
		sb.append("rHStatus").append("=").append(rHStatus);
		sb.append("rHCashTransactionNo").append("=").append(rHCashTransactionNo);
		sb.append("rHIncomeType").append("=").append(rHIncomeType);
		sb.append("rHTradeDate").append("=").append(rHTradeDate);
		sb.append("rHTradeTime").append("=").append(rHTradeTime);
		sb.append("rHMessage1").append("=").append(rHMessage1);
		sb.append("rHMessage2").append("=").append(rHMessage2);
		sb.append("rHCashMessage1").append("=").append(rHCashMessage1);
		sb.append("rHCashMessage2").append("=").append(rHCashMessage2);
		
		write_log("INFO :send_url CashReciept ("+rHTransactionNo+","+ApprovalType+","+OrderNumber+") msg=["+sb.toString()+"]",KSPAY_LOG_HOME_DIR);
		
		
		return dataVo;
	}
	
	// KSPay 현금영수증 발급 모듈 // 심사완료후 테스트 가능
	public UnitVO KSPayCashRecieptPost( UnitVO dataVo, HttpServletRequest request, HttpServletResponse response  )throws Exception{
		
//		System.out.println("현금 영수증 발급");
		request.setCharacterEncoding("EUC-KR");
		
		// Default(수정항목이 아님)-------------------------------------------------------
		String EncType       = "2";                                    // 0: 암화안함, 1:openssl, 2: seed
		String	Version      = "0412";                                 // 전문버전: 현금영수증은 전문버전을 0311이전으로 하면 안됩니다.
		String Type          = "00";                                   // 구분
		String Resend        = "0";                                    // 전송구분 : 0 : 처음,  2: 재전송
		String RequestDate   = new SimpleDateFormat("yyyyMMddhhmmss").format(new java.util.Date()); // 요청일자 : yyyymmddhhmmss
		String KeyInType     = "K";                                    // KeyInType 여부 : S : Swap, K: KeyInType
		String LineType      = "1";                                    // lineType 0 : offline, 1:internet, 2:Mobile
		String ApprovalCount = "1";                                    // 복합승인갯수
		String GoodType      = "0";                                    // 제품구분 0 : 실물, 1 : 디지털
		String HeadFiller    = "";                                     // 예비
	//-------------------------------------------------------------------------------
		
	// Header (입력값 (*) 필수항목)--------------------------------------------------
		String StoreId       = STOREID;   // 상점아이디
		String OrderNumber   = dataVo.get("BUY_ORDER_NUMBER");    // 주문번호
		String UserName      = dataVo.get("USER_NICK");    // 주문자명
		String IdNum         = dataVo.get("CASH_RECE_SID")      ;    // 주민번호 or 사업자번호
		String Email         = dataVo.get("USER_EMAIL")      ;    // email
		String GoodName      = ""   ;    // 제품명
		String PhoneNo       = ""                                 ;    // 휴대폰번호
	// Header end -------------------------------------------------------------------
		
	// Data Default(수정항목이 아님)-------------------------------------------------
		String CallCode      = "0";                                    //통화코드  (0: 원화, 1: 미화)
		String Filler        = "0";                                    //예비
	// Data Default end -------------------------------------------------------------

		String CASH_RECE_KIND = "";
		String CASH_RECE_WHY = "";
		
		if (dataVo.get("CASH_RECE_KIND").equals("휴대폰번호")) {
			CASH_RECE_KIND = "3";
		}else if (dataVo.get("CASH_RECE_KIND").equals("주민등록번호")) {
			CASH_RECE_KIND = "0";
		}else if (dataVo.get("CASH_RECE_KIND").equals("사업자등록번호")) {
			CASH_RECE_KIND = "1";
		}
		
		int supplyAmt = (int) Math.round( (Double.parseDouble( dataVo.get("BUY_PRIC") ) / 1.1) );
//		System.out.println("supplyAmt : " +  supplyAmt );
		int taxAmt  = Integer.parseInt( dataVo.get("BUY_PRIC") ) - supplyAmt;
//		System.out.println("taxAmt : "+ taxAmt );
		
		
		if (dataVo.get("CASH_RECE_WHY").equals("소득공제용")) {
			CASH_RECE_WHY = "0";
		}else if (dataVo.get("CASH_RECE_WHY").equals("지출증빙용")) {
			CASH_RECE_WHY = "1";
		}
		
	// Data (입력값 (*) 필수항목)----------------------------------------------------
		String ApprovalType  = "H600";         //H000:일반발급, H200:계좌이체, H600:가상계좌
		String IssuSele      = "1";                                    //0:일반발급(PG원거래번호 중복체크), 1:단독발급(주문번호 중복체크 : PG원거래 없음), 2:강제발급(중복체크 안함)
		String TransactionNo = dataVo.get("BUY_NO");  //입금완료된 계좌이체, 가상계좌 거래번호
		String UserInfo      = IdNum;                                  //주민등록번호, 사업자번호, 카드번호, 휴대폰번호, 기타
		String SupplyAmt     = String.valueOf(supplyAmt);      //공급가액
		String TaxAmt        = String.valueOf(taxAmt);         //세금
		String SvcAmt        = "0";         //봉사료
		String TotAmt        = String.valueOf( (supplyAmt + taxAmt) );         //현금영수증 발급금액
		String UserInfoSele  = CASH_RECE_KIND;                                     //0:주민등록번호, 1:사업자번호, 2:카드번호, 3:휴대폰번호, 4:기타
		String TranSele      = CASH_RECE_WHY;       //발행구분 0: 소득공제용(개인), 1: 지출증빙용(사업자)
		
		//중복체크전문 오류방지를 위해서 구분값 체크 및 변경
		if (IssuSele.substring(0,1) != "2" && !ApprovalType.substring(0,2).equals("H0"))
		{
			IssuSele = "0";     //가상계좌, 계좌이체요청이므로 0으로 세팅
		}
		else if (!IssuSele.substring(0,1).equals("2"))
		{
			IssuSele = "1";     //일반요청이므로 이므로 1로 세팅
		}
		else
		{
			IssuSele = "2";     //강제발급으로 세팅
		}
		
		if (IdNum.length() == 10 && IdNum.substring(0,1) != "0")   // 사업자번호
		{
			UserInfoSele = "1";
		}
		else if (IdNum.length() == 13)     // 주민등록번호
		{
			UserInfoSele = "0";
		}
		else                               // 휴대폰번호
		{
			UserInfoSele = "3";
		}
	// Data end ---------------------------------------------------------------------

	// 승인거절 응답
	// Server로 부터 응답이 없을시 자체응답

		String rApprovalType        = (ApprovalType != null && ApprovalType.length() == 4) ? ApprovalType.substring(0,3) + "1" : "H000";
		String rTransactionNo       = "";
		String rStatus              = "X";
		String rCashTransactionNo   = "";
		String rIncomeType          = "";
		String rTradeDate           = "";
		String rTradeTime           = "";
		String rMessage1            = "발급거절";
		String rMessage2            = "B잠시후재시도";
		String rCashMessage1        = "";
		String rCashMessage2        = "";
		String rFiller              = "";
		
		try 
		{
			com.ppm.kspay.KSPayApprovalCancelBean ipg = new com.ppm.kspay.KSPayApprovalCancelBean("localhost", 29991);
			
			ipg.HeadMessage(EncType, Version, Type, Resend, RequestDate, StoreId, OrderNumber, UserName, IdNum, Email, 
							GoodType, GoodName, KeyInType, LineType, PhoneNo, ApprovalCount, HeadFiller);
			
			ipg.CashBillDataMessage(ApprovalType, TransactionNo, IssuSele, UserInfoSele, UserInfo, TranSele, CallCode, SupplyAmt
										, TaxAmt, SvcAmt, TotAmt, Filler);
			
			if(ipg.SendSocket("1")) {
				rApprovalType        = ipg.ApprovalType      [0];/* 승인구분 코드          */
				rTransactionNo       = ipg.HTransactionNo    [0];/* 거래번호               */
				rStatus              = ipg.HStatus           [0];/* 오류구분 O:정상 X:거절 */
				rCashTransactionNo   = ipg.HCashTransactionNo[0];/* 현금영수증 거래번호    */
				rIncomeType          = ipg.HIncomeType       [0];/* 0: 소득      1: 비소득 */
				rTradeDate           = ipg.HTradeDate        [0];/* 거래 개시 일자         */
				rTradeTime           = ipg.HTradeTime        [0];/* 거래 개시 시간         */
				rMessage1            = ipg.HMessage1         [0];/* 응답 message1          */
				rMessage2            = ipg.HMessage2         [0];/* 응답 message2          */
				rCashMessage1        = ipg.HCashMessage1     [0];/* 국세청 메시지 1        */
				rCashMessage2        = ipg.HCashMessage2     [0];/* 국세청 메시지 2        */
				rFiller              = ipg.HFiller           [0];/* 예비                   */
			}
		}
		catch(Exception e) {
			rStatus                  = "X";
			rMessage1                = "발급거절";         // 메시지1
			rMessage2                = "잠시후재시도";     // 메시지2
		} // end of catch
		
//		System.out.println("현금영수증 발급요청 결과 [ rApprovalType "+rApprovalType+" ] ");
//		System.out.println("현금영수증 발급요청 결과 [ rTransactionNo "+rTransactionNo+" ] ");
//		System.out.println("현금영수증 발급요청 결과 [ rStatus "+rStatus+" ] ");
//		System.out.println("현금영수증 발급요청 결과 [ rTradeDate "+rTradeDate+" ] ");
//		System.out.println("현금영수증 발급요청 결과 [ rTradeTime "+rTradeTime+" ] ");
//		System.out.println("현금영수증 발급요청 결과 [ rCashTransactionNo "+rCashTransactionNo+" ] ");
//		System.out.println("현금영수증 발급요청 결과 [ rAquCode "+rIncomeType+" ] ");
//		System.out.println("현금영수증 발급요청 결과 [ rMessage1 "+rMessage1+" ] ");
//		System.out.println("현금영수증 발급요청 결과 [ rMessage2 "+rMessage2+" ] ");
//		System.out.println("현금영수증 발급요청 결과 [ rCashMessage1 "+rCashMessage1+" ] ");
//		System.out.println("현금영수증 발급요청 결과 [ rCashMessage2 "+rCashMessage2+" ] ");
//		System.out.println("현금영수증 발급요청 결과 [ rFiller "+rFiller+" ] ");
		
		dataVo.set("rApprovalType",rApprovalType);
		dataVo.set("rTransactionNo",rTransactionNo);
		dataVo.set("rStatus",rStatus);
		dataVo.set("rTradeDate",rTradeDate);
		dataVo.set("rTradeTime",rTradeTime);
		dataVo.set("rCashTransactionNo",rCashTransactionNo);
		dataVo.set("rIncomeType",rIncomeType);
		dataVo.set("rMessage1",rMessage1);
		dataVo.set("rMessage2",rMessage2);
		dataVo.set("rCashMessage1",rCashMessage1);
		dataVo.set("rCashMessage2",rCashMessage2);
		dataVo.set("rFiller",rFiller);
		
		StringBuffer sb = new StringBuffer();
		sb.append("rApprovalType").append("=").append(rApprovalType);
		sb.append("rTransactionNo").append("=").append(rTransactionNo);
		sb.append("rStatus").append("=").append(rStatus);
		sb.append("rTradeDate").append("=").append(rTradeDate);
		sb.append("rTradeTime").append("=").append(rTradeTime);
		sb.append("rCashTransactionNo").append("=").append(rCashTransactionNo);
		sb.append("rMessage1").append("=").append(rMessage1);
		sb.append("rMessage2").append("=").append(rMessage2);
		sb.append("rCashMessage1").append("=").append(rCashMessage1);
		sb.append("rCashMessage2").append("=").append(rCashMessage2);
		sb.append("rFiller").append("=").append(rFiller);
		
		write_log("INFO :send_url CashReciept ("+rTransactionNo+","+ApprovalType+","+OrderNumber+") msg=["+sb.toString()+"]",KSPAY_LOG_HOME_DIR);
		
		return dataVo;
	}
	
	// KSPay 카드결제 취소모듈 
	public UnitVO KSPayCardCanclePost(  UnitVO dataVo, HttpServletRequest request, HttpServletResponse response  )throws Exception{
		request.setCharacterEncoding("EUC-KR");
		
		// Default(수정항목이 아님)-------------------------------------------------------
		String	EncType       = "2";					// 0: 암화안함, 1:openssl, 2: seed
		String	Version       = "0603";				    // 전문버전
		String	Type          = "00";					// 구분
		String	Resend        = "0";					// 전송구분 : 0 : 처음,  2: 재전송
		String	RequestDate   = new SimpleDateFormat("yyyyMMddhhmmss").format(new java.util.Date()); // 요청일자 : yyyymmddhhmmss
		String	KeyInType     = "K";					// KeyInType 여부 : S : Swap, K: KeyInType
		String	LineType      = "1";			        // lineType 0 : offline, 1:internet, 2:Mobile
		String	ApprovalCount = "1";				    // 복합승인갯수
		String 	GoodType      = "0";	                // 제품구분 0 : 실물, 1 : 디지털
		String	HeadFiller    = "";				        // 예비
	//-------------------------------------------------------------------------------

	// Header (입력값 (*) 필수항목)--------------------------------------------------
		String	StoreId		= STOREID;		// *상점아이디
		String	OrderNumber	= dataVo.get("BUY_ORDER_NUMBER");									// 주문번호
		String	UserName    = dataVo.get("USER_NICK");									// *주문자명
		String	IdNum       = "";									// 주민번호 or 사업자번호
		String	Email       = "";									// *email
		String 	GoodName    = "";									// *제품명
		String	PhoneNo     = "";									// *휴대폰번호                                              
	// Header end -------------------------------------------------------------------

	// Data Default(수정항목이 아님)-------------------------------------------------
		String ApprovalType	  = "1010";		// 승인구분
		String TrNo   		  = dataVo.get("BUY_NO");		// 거래번호
		String Canc_amt		  = dataVo.get("BUY_PRIC");	// 취소금액
		String Canc_seq		  = dataVo.get("Canc_seq");	// 취소일련번호 // 부분취소일시 로직 태워줘야함
		String Canc_type	  = dataVo.get("Canc_type");	// 취소유형 0 :거래번호취소 1: 주문번호취소 3:부분취소 // 부분취소일시 로직 태워줘야함
	// Data Default end -------------------------------------------------------------

	// Server로 부터 응답이 없을시 자체응답
		String rApprovalType	   = "1011"; 
		String rTransactionNo      = "";			// 거래번호
		String rStatus             = "X";			// 상태 O : 승인, X : 거절
		String rTradeDate          = ""; 			// 거래일자
		String rTradeTime          = ""; 			// 거래시간
		String rIssCode            = "00"; 			// 발급사코드
		String rAquCode			       = "00"; 			// 매입사코드
		String rAuthNo             = "9999"; 		// 승인번호 or 거절시 오류코드
		String rMessage1           = "취소거절"; 	// 메시지1
		String rMessage2           = "C잠시후재시도";// 메시지2
		String rCardNo             = ""; 			// 카드번호
		String rExpDate            = ""; 			// 유효기간
		String rInstallment        = ""; 			// 할부
		String rAmount             = ""; 			// 금액
		String rMerchantNo         = ""; 			// 가맹점번호
		String rAuthSendType       = "N"; 			// 전송구분
		String rApprovalSendType   = "N"; 			// 전송구분(0 : 거절, 1 : 승인, 2: 원카드)
		String rPoint1             = "000000000000";// Point1
		String rPoint2             = "000000000000";// Point2
		String rPoint3             = "000000000000";// Point3
		String rPoint4             = "000000000000";// Point4
		String rVanTransactionNo   = "";
		String rFiller             = ""; 			// 예비
		String rAuthType	 	   = ""; 			// ISP : ISP거래, MP1, MP2 : MPI거래, SPACE : 일반거래
		String rMPIPositionType	   = ""; 			// K : KSNET, R : Remote, C : 제3기관, SPACE : 일반거래
		String rMPIReUseType	   = ""; 			// Y : 재사용, N : 재사용아님
		String rEncData			   = ""; 			// MPI, ISP 데이터

		try 
		{
			KSPayApprovalCancelBean ipg = new KSPayApprovalCancelBean("localhost", 29991); 

			ipg.HeadMessage(EncType, Version, Type, Resend, RequestDate, StoreId, OrderNumber, UserName, IdNum, Email, 
							GoodType, GoodName, KeyInType, LineType, PhoneNo, ApprovalCount, HeadFiller);

			if (Canc_type.equals("3"))
				ipg.CancelDataMessage(ApprovalType, Canc_type, TrNo, "", "", ipg.format(Canc_amt,9,'9')+ipg.format(Canc_seq,2,'9'),"","");
			else 
				ipg.CancelDataMessage(ApprovalType, "0", TrNo, "", "", "","","");
			
			if(ipg.SendSocket("1")) {
				rApprovalType		= ipg.ApprovalType[0];	    
				rTransactionNo		= ipg.TransactionNo[0];	  		// 거래번호
				rStatus				= ipg.Status[0];		  		// 상태 O : 승인, X : 거절
				rTradeDate			= ipg.TradeDate[0];		  		// 거래일자
				rTradeTime			= ipg.TradeTime[0];		  		// 거래시간
				rIssCode			= ipg.IssCode[0];		  		// 발급사코드
				rAquCode			= ipg.AquCode[0];		  		// 매입사코드
				rAuthNo				= ipg.AuthNo[0];		  		// 승인번호 or 거절시 오류코드
				rMessage1			= ipg.Message1[0];		  		// 메시지1
				rMessage2			= ipg.Message2[0];		  		// 메시지2
				rCardNo				= ipg.CardNo[0];		  		// 카드번호
				rExpDate			= ipg.ExpDate[0];		  		// 유효기간
				rInstallment		= ipg.Installment[0];	  		// 할부
				rAmount				= ipg.Amount[0];		  		// 금액
				rMerchantNo			= ipg.MerchantNo[0];	  		// 가맹점번호
				rAuthSendType		= ipg.AuthSendType[0];	  		// 전송구분= new String(this.read(2));
				rApprovalSendType	= ipg.ApprovalSendType[0];		// 전송구분(0 : 거절, 1 : 승인, 2: 원카드)
				rPoint1				= ipg.Point1[0];		  		// Point1
				rPoint2				= ipg.Point2[0];		  		// Point2
				rPoint3				= ipg.Point3[0];		  		// Point3
				rPoint4				= ipg.Point4[0];		  		// Point4
				rVanTransactionNo   = ipg.VanTransactionNo[0];      // Van거래번호
				rFiller				= ipg.Filler[0];		  		// 예비
				rAuthType			= ipg.AuthType[0];		  		// ISP : ISP거래, MP1, MP2 : MPI거래, SPACE : 일반거래
				rMPIPositionType	= ipg.MPIPositionType[0]; 		// K : KSNET, R : Remote, C : 제3기관, SPACE : 일반거래
				rMPIReUseType		= ipg.MPIReUseType[0];			// Y : 재사용, N : 재사용아님
				rEncData			= ipg.EncData[0];		  		// MPI, ISP 데이터
			}
		}
		catch(Exception e) {
			rMessage2			= "P잠시후재시도("+e.toString()+")";	// 메시지2
		} // end of catch
		
//		System.out.println("신용카드 취소요청 결과 [ rApprovalType "+rApprovalType+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rTransactionNo "+rTransactionNo+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rStatus "+rStatus+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rTradeDate "+rTradeDate+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rTradeTime "+rTradeTime+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rIssCode "+rIssCode+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rAquCode "+rAquCode+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rAuthNo "+rAuthNo+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rMessage1 "+rMessage1+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rMessage2 "+rMessage2+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rCardNo "+rCardNo+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rExpDate "+rExpDate+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rInstallment "+rInstallment+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rAmount "+rAmount+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rMerchantNo "+rMerchantNo+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rAuthSendType "+rAuthSendType+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rApprovalSendType "+rApprovalSendType+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rPoint1 "+rPoint1+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rPoint2 "+rPoint2+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rPoint3 "+rPoint3+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rPoint4 "+rPoint4+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rVanTransactionNo "+rVanTransactionNo+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rFiller "+rFiller+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rAuthType "+rAuthType+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rMPIPositionType "+rMPIPositionType+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rMPIReUseType "+rMPIReUseType+" ] ");
//		System.out.println("신용카드 취소요청 결과 [ rEncData "+rEncData+" ] ");
		
		dataVo.set("rApprovalType",rApprovalType);
		dataVo.set("rTransactionNo",rTransactionNo);
		dataVo.set("rStatus",rStatus);
		dataVo.set("rTradeDate",rTradeDate);
		dataVo.set("rTradeTime",rTradeTime);
		dataVo.set("rIssCode",rIssCode);
		dataVo.set("rAquCode",rAquCode);
		dataVo.set("rAuthNo",rAuthNo);
		dataVo.set("rMessage1",rMessage1);
		dataVo.set("rMessage2",rMessage2);
		dataVo.set("rCardNo",rCardNo);
		dataVo.set("rExpDate",rExpDate);
		dataVo.set("rInstallment",rInstallment);
		dataVo.set("rAmount",rAmount);
		dataVo.set("rMerchantNo",rMerchantNo);
		dataVo.set("rAuthSendType",rAuthSendType);
		dataVo.set("rApprovalSendType",rApprovalSendType);
		dataVo.set("rPoint1",rPoint1);
		dataVo.set("rPoint2",rPoint2);
		dataVo.set("rPoint3",rPoint3);
		dataVo.set("rPoint4",rPoint4);
		dataVo.set("rVanTransactionNo",rVanTransactionNo);
		dataVo.set("rFiller",rFiller);
		dataVo.set("rAuthType",rAuthType);
		dataVo.set("rMPIPositionType",rMPIPositionType);
		dataVo.set("rMPIReUseType",rMPIReUseType);
		dataVo.set("rEncData",rEncData);
		
		StringBuffer sb = new StringBuffer();
		sb.append("rApprovalType").append("=").append(rApprovalType);
		sb.append("rTransactionNo").append("=").append(rTransactionNo);
		sb.append("rStatus").append("=").append(rStatus);
		sb.append("rTradeDate").append("=").append(rTradeDate);
		sb.append("rTradeTime").append("=").append(rTradeTime);
		sb.append("rIssCode").append("=").append(rIssCode);
		sb.append("rAquCode").append("=").append(rAquCode);
		sb.append("rAuthNo").append("=").append(rAuthNo);
		sb.append("rMessage1").append("=").append(rMessage1);
		sb.append("rMessage2").append("=").append(rMessage2);
		sb.append("rCardNo").append("=").append(rCardNo);
		sb.append("rExpDate").append("=").append(rExpDate);
		sb.append("rInstallment").append("=").append(rInstallment);
		sb.append("rAmount").append("=").append(rAmount);
		sb.append("rMerchantNo").append("=").append(rMerchantNo);
		sb.append("rAuthSendType").append("=").append(rAuthSendType);
		sb.append("rApprovalSendType").append("=").append(rApprovalSendType);
		sb.append("rPoint1").append("=").append(rPoint1);
		sb.append("rPoint2").append("=").append(rPoint2);
		sb.append("rPoint3").append("=").append(rPoint3);
		sb.append("rPoint4").append("=").append(rPoint4);
		sb.append("rVanTransactionNo").append("=").append(rVanTransactionNo);
		sb.append("rFiller").append("=").append(rFiller);
		sb.append("rAuthType").append("=").append(rAuthType);
		sb.append("rMPIPositionType").append("=").append(rMPIPositionType);
		sb.append("rMPIReUseType").append("=").append(rMPIReUseType);
		sb.append("rEncData").append("=").append(rEncData);
		
		write_log("INFO :send_url CardCancle ("+TrNo+","+ApprovalType+","+OrderNumber+","+Canc_amt+","+Canc_seq+") msg=["+sb.toString()+"]",KSPAY_LOG_HOME_DIR);
		
		return dataVo;
	}
	
	
	// KSPay 계좌이체 취소모듈 // 당일에 한해서만 취소가능
	public UnitVO KSPayAccountCanclePost( UnitVO dataVo, HttpServletRequest request, HttpServletResponse response )throws Exception{
		request.setCharacterEncoding("EUC-KR");
		//Header부 Data --------------------------------------------------
		String EncType              = "2" ;                                 // 0: 암화안함, 1:ssl, 2: seed
		String Version              = "0603" ;                              // 전문버전
		String Type                 = "00" ;                                // 구분
		String Resend               = "0" ;                                 // 전송구분 : 0 : 처음,  2: 재전송
		String RequestDate          = new SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()); // 요청일자 :
		String KeyInType            = "K" ;                                 // KeyInType 여부 : S : Swap, K: KeyInType
		String LineType             = "1" ;                                 // lineType 0 : offline, 1:internet, 2:Mobile
		String ApprovalCount        = "1" ;                                 // 복합승인갯수
		String GoodType             = "0" ;                                 // 제품구분 0 : 실물, 1 : 디지털
		String HeadFiller           = "" ;                                  // 예비
		
	// Header (입력값 (*) 필수항목)--------------------------------------------------
		String StoreId              = STOREID;     // *상점아이디
		String OrderNumber          = dataVo.get("BUY_ORDER_NUMBER");   // 주문번호
		String UserName             = dataVo.get("USER_NICK");   // 주문자명
		String IdNum                = "";                                   // 주민번호 or 사업자번호
		String Email                = dataVo.get("USER_EMAIL");          // email
		String GoodName             = "";                                   // 제품명
		String PhoneNo              = "";                                   // 휴대폰번호
	//Header end -------------------------------------------------------------------
		
	//Data Default------------------------------------------------------------------
		String ApprovalType         = "2010";      // 승인구분 코드
		String TrNo                 = dataVo.get("BUY_NO") ;        // 거래번호
		
	// Server로 부터 응답이 없을시 자체응답
		String rApprovalType        = "2011"                     ; // 승인구분
		String rACTransactionNo     = TrNo                       ; // 거래번호
		String rACStatus            = "X"                        ; // 오류구분 :승인 X:거절
		String rACTradeDate         = RequestDate.substring(0,8) ; // 거래 개시 일자(YYYYMMDD)
		String rACTradeTime         = RequestDate.substring(8,14); // 거래 개시 시간(HHMMSS)
		String rACAcctSele          = ""                         ; // 계좌이체 구분 -	1:Dacom, 2:Pop Banking,	3:실시간계좌이체 4: 승인형계좌이체
		String rACFeeSele           = ""                         ; // 선/후불제구분 -	1:선불,	2:후불
		String rACInjaName          = ""                         ; // 인자명(통장인쇄메세지-상점명)
		String rACPareBankCode      = ""                         ; // 입금모계좌코드
		String rACPareAcctNo        = ""                         ; // 입금모계좌번호
		String rACCustBankCode      = ""                         ; // 출금모계좌코드
		String rACCustAcctNo        = ""                         ; // 출금모계좌번호
		String rACAmount            = ""                         ; // 금액	(결제대상금액)
		String rACBankTransactionNo = ""                         ; // 은행거래번호
		String rACIpgumNm           = ""                         ; // 입금자명
		String rACBankFee           = "0"                        ; // 계좌이체 수수료
		String rACBankAmount        = ""                         ; // 총결제금액(결제대상금액+ 수수료
		String rACBankRespCode      = "9999"                     ; // 오류코드
		String rACMessage1          = "취소거절"                 ; // 오류 message 1
		String rACMessage2          = "C잠시후재시도"            ; // 오류 message 2
		String rACFiller            = ""                         ; // 예비
		
		try
		{
			KSPayApprovalCancelBean ipg = new KSPayApprovalCancelBean("localhost", 29991); 
			
			ipg.HeadMessage(EncType, Version, Type, Resend, RequestDate, StoreId, OrderNumber, UserName, IdNum, Email, 
				GoodType, GoodName, KeyInType, LineType, PhoneNo, ApprovalCount, HeadFiller);
			
			ipg.CancelDataMessage(ApprovalType, "0", TrNo, "", "", "","","");
			
			if(ipg.SendSocket("1")) {
				rApprovalType        = ipg.ApprovalType[0];
				rACTransactionNo     = ipg.ACTransactionNo[0];       // 거래번호
				rACStatus            = ipg.ACStatus[0];              // 오류구분 :승인 X:거절
				rACTradeDate         = ipg.ACTradeDate[0];           // 거래 개시 일자(YYYYMMDD)
				rACTradeTime         = ipg.ACTradeTime[0];           // 거래 개시 시간(HHMMSS)
				rACAcctSele          = ipg.ACAcctSele[0];            // 계좌이체 구분 -	5:금결원계좌이체    
				rACFeeSele           = ipg.ACFeeSele[0];             // 선/후불제구분 -	1:선불,	2:후불
				rACInjaName          = ipg.ACInjaName[0];            // 인자명(통장인쇄메세지-상점명)
				rACPareBankCode      = ipg.ACPareBankCode[0];        // 입금모계좌코드
				rACPareAcctNo        = ipg.ACPareAcctNo[0];          // 입금모계좌번호
				rACCustBankCode      = ipg.ACCustBankCode[0];        // 출금모계좌코드
				rACCustAcctNo        = ipg.ACCustAcctNo[0];          // 출금모계좌번호
				rACAmount            = ipg.ACAmount[0];              // 금액	(결제대상금액)
				rACBankTransactionNo = ipg.ACBankTransactionNo[0];   // 은행거래번호
				rACIpgumNm           = ipg.ACIpgumNm[0];             // 입금자명
				rACBankFee           = ipg.ACBankFee[0];             // 계좌이체 수수료
				rACBankAmount        = ipg.ACBankAmount[0];          // 총결제금액(결제대상금액+ 수수료
				rACBankRespCode      = ipg.ACBankRespCode[0];        // 오류코드
				rACMessage1          = ipg.ACMessage1[0];            // 오류 message 1
				rACMessage2          = ipg.ACMessage2[0];            // 오류 message 2
				rACFiller            = ipg.ACFiller[0];              // 예비
			}
		}
		catch(Exception e) {
			rACMessage2 = "P잠시후재시도("+e.toString()+")";         // 메시지2
		} // end of catch
		
//		System.out.println("계좌이체 취소요청 결과 rApprovalType [ "+ rApprovalType +" ]");
//		System.out.println("계좌이체 취소요청 결과 rACTransactionNo [ "+ rACTransactionNo +" ]");
//		System.out.println("계좌이체 취소요청 결과 rACStatus [ "+ rACStatus +" ]");
//		System.out.println("계좌이체 취소요청 결과 rACTradeDate [ "+ rACTradeDate +" ]");
//		System.out.println("계좌이체 취소요청 결과 rACTradeTime [ "+ rACTradeTime +" ]");
//		System.out.println("계좌이체 취소요청 결과 rACAcctSele [ "+ rACAcctSele +" ]");
//		System.out.println("계좌이체 취소요청 결과 rACFeeSele [ "+ rACFeeSele +" ]");
//		System.out.println("계좌이체 취소요청 결과 rACInjaName [ "+ rACInjaName +" ]");
//		System.out.println("계좌이체 취소요청 결과 rACPareBankCode [ "+ rACPareBankCode +" ]");
//		System.out.println("계좌이체 취소요청 결과 rACPareAcctNo [ "+ rACPareAcctNo +" ]");
//		System.out.println("계좌이체 취소요청 결과 rACCustBankCode [ "+ rACCustBankCode +" ]");
//		System.out.println("계좌이체 취소요청 결과 rACCustAcctNo [ "+ rACCustAcctNo +" ]");
//		System.out.println("계좌이체 취소요청 결과 rACAmount [ "+ rACAmount +" ]");
//		System.out.println("계좌이체 취소요청 결과 rACBankTransactionNo [ "+ rACBankTransactionNo +" ]");
//		System.out.println("계좌이체 취소요청 결과 rACIpgumNm [ "+ rACIpgumNm +" ]");
//		System.out.println("계좌이체 취소요청 결과 rACBankFee [ "+ rACBankFee +" ]");
//		System.out.println("계좌이체 취소요청 결과 rACBankAmount [ "+ rACBankAmount +" ]");
//		System.out.println("계좌이체 취소요청 결과 rACBankRespCode [ "+ rACBankRespCode +" ]");
//		System.out.println("계좌이체 취소요청 결과 rACMessage1 [ "+ rACMessage1 +" ]");
//		System.out.println("계좌이체 취소요청 결과 rACMessage2 [ "+ rACMessage2 +" ]");
//		System.out.println("계좌이체 취소요청 결과 rACFiller [ "+ rACFiller +" ]");
		
		
		dataVo.set("rApprovalType", rApprovalType);
		dataVo.set("rACTransactionNo", rACTransactionNo);
		dataVo.set("rACStatus", rACStatus);
		dataVo.set("rACTradeDate", rACTradeDate);
		dataVo.set("rACTradeTime", rACTradeTime);
		dataVo.set("rACAcctSele", rACAcctSele);
		dataVo.set("rACFeeSele", rACFeeSele);
		dataVo.set("rACInjaName", rACInjaName);
		dataVo.set("rACPareBankCode", rACPareBankCode);
		dataVo.set("rACPareAcctNo", rACPareAcctNo);
		dataVo.set("rACCustBankCode", rACCustBankCode);
		dataVo.set("rACCustAcctNo", rACCustAcctNo);
		dataVo.set("rACAmount", rACAmount);
		dataVo.set("rACBankTransactionNo", rACBankTransactionNo);
		dataVo.set("rACIpgumNm", rACIpgumNm);
		dataVo.set("rACBankFee", rACBankFee);
		dataVo.set("rACBankAmount", rACBankAmount);
		dataVo.set("rACBankRespCode", rACBankRespCode);
		dataVo.set("rACMessage1", rACMessage1);
		dataVo.set("rACMessage2", rACMessage2);
		dataVo.set("rACFiller", rACFiller);
		
		StringBuffer sb = new StringBuffer();
		sb.append("rApprovalType").append("=").append(rApprovalType);
		sb.append("rACTransactionNo").append("=").append(rACTransactionNo);
		sb.append("rACStatus").append("=").append(rACStatus);
		sb.append("rACTradeDate").append("=").append(rACTradeDate);
		sb.append("rACTradeTime").append("=").append(rACTradeTime);
		sb.append("rACAcctSele").append("=").append(rACAcctSele);
		sb.append("rACFeeSele").append("=").append(rACFeeSele);
		sb.append("rACInjaName").append("=").append(rACInjaName);
		sb.append("rACPareBankCode").append("=").append(rACPareBankCode);
		sb.append("rACPareAcctNo").append("=").append(rACPareAcctNo);
		sb.append("rACCustBankCode").append("=").append(rACCustBankCode);
		sb.append("rACCustAcctNo").append("=").append(rACCustAcctNo);
		sb.append("rACAmount").append("=").append(rACAmount);
		sb.append("rACBankTransactionNo").append("=").append(rACBankTransactionNo);
		sb.append("rACIpgumNm").append("=").append(rACIpgumNm);
		sb.append("rACBankFee").append("=").append(rACBankFee);
		sb.append("rACBankAmount").append("=").append(rACBankAmount);
		sb.append("rACBankRespCode").append("=").append(rACBankRespCode);
		sb.append("rACMessage1").append("=").append(rACMessage1);
		sb.append("rACMessage2").append("=").append(rACMessage2);
		sb.append("rACFiller").append("=").append(rACFiller);
		
		write_log("INFO :send_url AccountCancle ("+TrNo+","+ApprovalType+","+OrderNumber+") msg=["+sb.toString()+"]",KSPAY_LOG_HOME_DIR);
		
		return dataVo;
	}
	
	// 모바일 결제 취소 소켓 통신
	public UnitVO KSPayMobileCanclePost( UnitVO dataVo, HttpServletRequest request, HttpServletResponse response )throws Exception {
		request.setCharacterEncoding("EUC-KR");
		
		// Default(수정항목이 아님)-------------------------------------------------------
		String EncType       = "2";                                 // 0: 암화안함, 1:openssl, 2: seed
		String Version       = "0210";                              // 전문버전
		String Type          = "00";                                // 구분
		String Resend        = "0";                                 // 전송구분 : 0 : 처음,  2: 재전송
		String RequestDate   = new SimpleDateFormat("yyyyMMddhhmmss").format(new java.util.Date()); // 요청일자 : yyyymmddhhmmss
		String KeyInType     = "K";                                 // KeyInType 여부 : S : Swap, K: KeyInType
		String LineType      = "1";                                 // lineType 0 : offline, 1:internet, 2:Mobile
		String ApprovalCount = "1";                                 // 복합승인갯수
		String GoodType      = "0";                                 // 제품구분 0 : 실물, 1 : 디지털
		String HeadFiller    = "";                                  // 예비
	//-------------------------------------------------------------------------------

	// Header (입력값 (*) 필수항목)--------------------------------------------------
		String StoreId       = STOREID;     // *상점아이디
		String OrderNumber   = dataVo.get("BUY_ORDER_NUMBER");                                  // 주문번호
		String UserName      = dataVo.get("USER_NICK");                                       // 주문자명
		String IdNum         = "";                                  // 주민번호 or 사업자번호
		String Email         =  dataVo.get("USER_EMAIL");             // email
		String GoodName      =  "";                                // 제품명
		String PhoneNo       = "";                                  // 휴대폰번호
	// Header end -------------------------------------------------------------------

	// Data Default(수정항목이 아님)-------------------------------------------------
		String ApprovalType  = "M110";      // 승인구분
		String TrNo          = dataVo.get("BUY_NO");        // 거래번호
	// Data Default end -------------------------------------------------------------

	// 승인거절 응답
	// Server로 부터 응답이 없을시 자체응답
		String rApprovalType  = "M111";
		String rTransactionNo = "";                                 //거래번호
		String rStatus        = "X";                                //상태 O : 승인, X : 거절
		String rTradeDate     = "";                                 //거래일자
		String rTradeTime     = "";                                 //거래시간
		String rBalAmount     = "";                                 //잔액
		String rRespCode      = "PM09";                             //응답코드
		String rRespMsg       = "C잠시후 재시도";                   //응답메시지
		String rBypassMsg     = "";                                 //Echo항목
		String rCompCode      = "";                                 //서비스업체구분
		String rFiller        = "";
		
		try 
		{
			KSPayApprovalCancelBean ipg = new KSPayApprovalCancelBean("localhost", 29991); 
			
			ipg.HeadMessage(EncType, Version, Type, Resend, RequestDate, StoreId, OrderNumber, UserName, IdNum, Email, 
							GoodType, GoodName, KeyInType, LineType, PhoneNo, ApprovalCount, HeadFiller);
			
			ipg.CancelDataMessage(ApprovalType, "0", TrNo, "", "", "","","");
			
			if(ipg.SendSocket("1")) {
				rApprovalType    = ipg.ApprovalType[0];       // 승인구분 코드          
				rTransactionNo   = ipg.MTransactionNo[0];     // 거래번호 
				rStatus          = ipg.MStatus[0];            // 거래성공여부 
				rTradeDate       = ipg.MTradeDate[0];         // 거래일자
				rTradeTime       = ipg.MTradeTime[0];         // 거래시간
				rBalAmount       = ipg.MBalAmount[0];         // 잔액
				rRespCode        = ipg.MRespCode[0];          // 응답코드
				rRespMsg         = ipg.MRespMsg[0];           // 응답메시지
				rBypassMsg       = ipg.MBypassMsg[0];         // Echo 필드
				rCompCode        = ipg.MCompCode[0];          // 기관코드
				rFiller          = ipg.MFiller[0];            // 예비
			}
			
			if (rStatus.substring(0,1).equals("X")) // 취소거절의 경우 한번 더 전송한다.
			{
				if(ipg.SendSocket("1")) {
					rApprovalType    = ipg.ApprovalType[0];   // 승인구분 코드          
			 		rTransactionNo   = ipg.MTransactionNo[0]; // 거래번호 
			 		rStatus          = ipg.MStatus[0];        // 거래성공여부 
					rTradeDate       = ipg.MTradeDate[0];     // 거래일자
					rTradeTime       = ipg.MTradeTime[0];     // 거래시간
					rBalAmount       = ipg.MBalAmount[0];     // 잔액
					rRespCode        = ipg.MRespCode[0];      // 응답코드
					rRespMsg         = ipg.MRespMsg[0];       // 응답메시지
					rBypassMsg       = ipg.MBypassMsg[0];     // Echo 필드
					rCompCode        = ipg.MCompCode[0];      // 기관코드
			 		rFiller          = ipg.MFiller[0];        // 예비
				}
			}
			
			
//			System.out.println("모바일 결제취소결과 rApprovalType [ "+rApprovalType+" ]");
//			System.out.println("모바일 결제취소결과 rTransactionNo [ "+rTransactionNo+" ]");
//			System.out.println("모바일 결제취소결과 rStatus [ "+rStatus+" ]");
//			System.out.println("모바일 결제취소결과 rTradeDate [ "+rTradeDate+" ]");
//			System.out.println("모바일 결제취소결과 rTradeTime [ "+rTradeTime+" ]");
//			System.out.println("모바일 결제취소결과 rBalAmount [ "+rBalAmount+" ]");
//			System.out.println("모바일 결제취소결과 rRespCode [ "+rRespCode+" ]");
//			System.out.println("모바일 결제취소결과 rRespMsg [ "+rRespMsg+" ]");
//			System.out.println("모바일 결제취소결과 rBypassMsg [ "+rBypassMsg+" ]");
//			System.out.println("모바일 결제취소결과 rCompCode [ "+rCompCode+" ]");
//			System.out.println("모바일 결제취소결과 rFiller [ "+rFiller+" ]");
			
		}
		catch(Exception e) {
				rStatus             = "X";
				rRespCode           = "9999";          // 응답코드
				rRespMsg            = "C취소거절";     // 응답메시지
		} // end of catch
		
		dataVo.set("rApprovalType", rApprovalType);
		dataVo.set("rTransactionNo", rTransactionNo);
		dataVo.set("rStatus", rStatus);
		dataVo.set("rTradeDate", rTradeDate);
		dataVo.set("rTradeTime", rTradeTime);
		dataVo.set("rBalAmount", rBalAmount);
		dataVo.set("rRespCode", rRespCode);
		dataVo.set("rRespMsg", rRespMsg);
		dataVo.set("rBypassMsg", rBypassMsg);
		dataVo.set("rCompCode", rCompCode);
		dataVo.set("rFiller", rFiller);
		
		StringBuffer sb = new StringBuffer();
		sb.append("rApprovalType").append("=").append(rApprovalType);
		sb.append("rTransactionNo").append("=").append(rTransactionNo);
		sb.append("rStatus").append("=").append(rStatus);
		sb.append("rTradeDate").append("=").append(rTradeDate);
		sb.append("rTradeTime").append("=").append(rTradeTime);
		sb.append("rBalAmount").append("=").append(rBalAmount);
		sb.append("rRespCode").append("=").append(rRespCode);
		sb.append("rRespMsg").append("=").append(rRespMsg);
		sb.append("rBypassMsg").append("=").append(rBypassMsg);
		sb.append("rCompCode").append("=").append(rCompCode);
		sb.append("rFiller").append("=").append(rFiller);
		
		write_log("INFO :send_url MoblieCancle ("+TrNo+","+ApprovalType+","+OrderNumber+") msg=["+sb.toString()+"]",KSPAY_LOG_HOME_DIR);
		
		return dataVo;
	}
	
	// 마이페이 결제 취소
	public UnitVO KSPayMyPayEutilBean ( UnitVO dataVo, HttpServletRequest request, HttpServletResponse response ) throws Exception{
		
		request.setCharacterEncoding("EUC-KR");
		
//		response.setContentType("text/html;charset=EUC-KR");
		KSPayMyPayEutilBean eutil = new KSPayMyPayEutilBean();
		
//		String MYPAY_WEBHOST_SRCH_URL = "http://210.181.28.134/store/PAY_PROXY/mypay/mypay_jcanc_tot.jsp"; // 취소url 운영: kspay.ksnet.to , 개발 : 210.181.28.134
		String MYPAY_WEBHOST_SRCH_URL = "https://kspay.ksnet.to/store/PAY_PROXY/mypay/mypay_jcanc_tot.jsp"; // 취소url 운영: kspay.ksnet.to , 개발 : 210.181.28.134
		
		String DEFAULT_RPARAMS	= "authyn`trno`trddt`trdtm`amt`msg1`msg2`result`resultcd`storeid`username`email`goodname`mobile";
		
		// 마이페이는 다른 ID 값을 사용함
		String storeid =   "2001106672"; //dataVo.get("sndStoreid") ; // 운영 : 2001106623 , 개발 : 2999199997
		String trno    = dataVo.get("BUY_NO") ;    // 거래번호 취소
		String cordno  = dataVo.get("BUY_ORDER_NUMBER") ;   // 주문번호 취소( 거래번호 미입력시 필수 )
		String ctoken  =  "SLu8EA9A-03S0Ce0Q3fj7k2jG76pVg"; //dataVo.get("sndCtoken") ;
		
		System.out.println( ctoken );
		
		String camt   = "";
		String ccnt   = "";
		String cbnkcd = "";
		String cacno  = "";
		  
//		String mhkey        = "FF7BC0A83DC4E6B6114522CBD70A958C" ;    
//		String mekey        = "549E98CA59A3691088CA0A52DC4BA66E";       
//		String msalt        = "MA01";                                         
//		String mpaymsalt    = "Qy5H10I3k4";
		 
		String mhkey = "01F129202238E959E469496410570781" ; 
		String msalt = "MA01";
		String curr_date_14 = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());
		String etoken = eutil.get_etoken(mhkey, curr_date_14, "");
	
		String authyn   = ""; // 상태  O,X,S (은행타임아웃거래의경우 S상태로 정상 여부 확인이 필요합니다. )
		String trddt    = "";
		String trdtm    = ""; // 거래일자
		String amt      = ""; // 금액
		String msg1     = "";
		String msg2     = "";
		String ordno    = "";
		String result   = ""; // 주문번호
		String resultcd = "B101"; // 결제수단	 B101 (마이통장) , 1001 (마이카드)
	
		StringBuffer sb = new StringBuffer();
	
		sb.append("sndStoreid" ).append('=').append(storeid).append('&');
		sb.append("sndTrno" ).append('=').append(trno).append('&');
		sb.append("sndOrdno" ).append('=').append(cordno).append('&');
		sb.append("sndCtoken" ).append('=').append(ctoken).append('&');
		sb.append("sndCancAmount" ).append('=').append(camt).append('&');
		sb.append("sndCancCnt" ).append('=').append(ccnt).append('&');
		sb.append("sndBnkcd" ).append('=').append(cbnkcd).append('&');
		sb.append("sndAcno" ).append('=').append(cacno).append('&');
		sb.append("sndMsalt" ).append('=').append(msalt).append('&');
		sb.append("sndEtoken" ).append('=').append(etoken).append('&');
		sb.append("sndRpyParams").append('=').append(URLEncoder.encode(DEFAULT_RPARAMS,"euc-kr")   ).append('&');
		sb.append("sndCharSet").append('=').append("euc-kr") ;
			
		String send_msg = sb.toString();
		String recv_msg  = eutil.call_web_api(MYPAY_WEBHOST_SRCH_URL ,send_msg , "euc-kr");
//		System.out.println("recv_msg["+recv_msg+"]");
			
		LinkedHashMap param_hash = new LinkedHashMap();
			
		boolean ret = eutil.parseJson(recv_msg, param_hash); 
			
		authyn   = (String)param_hash.get("authyn" );
		trddt    = (String)param_hash.get("trddt" );
		trdtm    = (String)param_hash.get("trdtm" ); 
		amt      = (String)param_hash.get("amt" );
		msg1     = (String)param_hash.get("msg1" );
		msg2     = (String)param_hash.get("msg2" );
		result   = (String)param_hash.get("result" );
		resultcd = (String)param_hash.get("resultcd" ); 

		dataVo.set("authyn", (String)param_hash.get("authyn" ));
		dataVo.set("trddt", (String)param_hash.get("trddt" ));
		dataVo.set("trdtm", (String)param_hash.get("trdtm" ));
		dataVo.set("amt", (String)param_hash.get("amt" ));
		dataVo.set("msg1", (String)param_hash.get("msg1" ));
		dataVo.set("msg2", (String)param_hash.get("msg2" ));
		dataVo.set("result", (String)param_hash.get("result" ));
		dataVo.set("resultcd", (String)param_hash.get("resultcd" ));
		
//		System.out.println("마이페이 취소 결과 : [storeid "+storeid);
//		System.out.println("마이페이 취소 결과 : [trno     "+trno     );
//		System.out.println("마이페이 취소 결과 : [cordno   "+cordno   );
//		System.out.println("마이페이 취소 결과 : [ctoken   "+ctoken   );
//		System.out.println("마이페이 취소 결과 : [camt 	  "+camt 	 );
//		System.out.println("마이페이 취소 결과 : [ccnt 	  "+ccnt 	 );
//		System.out.println("마이페이 취소 결과 : [cbnkcd	 "+cbnkcd	);
//		System.out.println("마이페이 취소 결과 : [cacno	  "+cacno	 	);
//		System.out.println("마이페이 취소 결과 : [mhkey		 "+mhkey		);
//		System.out.println("마이페이 취소 결과 : [msalt		 "+msalt		);
//		System.out.println("마이페이 취소 결과 : [authyn   "+authyn  );
//		System.out.println("마이페이 취소 결과 : [trddt    "+trddt   	);
//		System.out.println("마이페이 취소 결과 : [trdtm    "+trdtm   );
//		System.out.println("마이페이 취소 결과 : [amt      "+amt     	);
//		System.out.println("마이페이 취소 결과 : [msg1     "+msg1    );
//		System.out.println("마이페이 취소 결과 : [msg2     "+msg2    );
//		System.out.println("마이페이 취소 결과 : [ordno    "+ordno   );
//		System.out.println("마이페이 취소 결과 : [result   "+result  	);
//		System.out.println("마이페이 취소 결과 : [resultcd "+resultcd);
		
		sb.append("] ").append("recv_msg[ ").append(recv_msg).append(" ]");
		
		write_log("INFO :send_url("+trno+","+cordno+","+DEFAULT_RPARAMS+") msg=["+sb.toString()+"]",MYPAY_LOG_HOME_DIR);
		
		return dataVo;
	}
	
	
	public static void write_log(Object pstr,String logDir)
	{
		String curr_date =  KSPayWebHostBean.getCurrDate();

		File log_dir = null;
		if (logDir != null && logDir.endsWith("/")) log_dir = new File(logDir);
		if (log_dir == null || !log_dir.exists())
		{
			log_dir.mkdir();
			System.out.println("폴더가 없습니다.\n폴더를 생성하였습니다.");
			write_log(System.out, pstr, curr_date);
//			return;
		}

		StringBuffer sb = new StringBuffer();

		if ( logDir.indexOf("myPaylog") > -1 ) {
			sb.append("mypay_").append(curr_date.substring(0,8)).append(".log");
		}else {
			sb.append("kspay_").append(curr_date.substring(0,8)).append(".log");
		}
		

		File openFile = new File(log_dir, sb.toString());
		PrintStream pout = null;

		try{
			if(openFile.exists()){
				pout = new PrintStream(new FileOutputStream(openFile, true), true);
			}else{
				pout = new PrintStream(new FileOutputStream(openFile), true);
			}
			write_log(pout, pstr, curr_date);
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally
		{
			try{if (pout != null) pout.close(); }catch(Exception e){}
			pout     = null;
		}
	}

	private static void write_log(PrintStream pout, Object pstr, String curr_date)
	{
		StringBuffer sb = new StringBuffer();

		sb.append("[");
		sb.append(curr_date.substring(8,10)).append(":").append(curr_date.substring(10,12)).append(":").append(curr_date.substring(12,14));
		sb.append("] " );
		if (pstr instanceof Throwable)
		{
			pout.println(sb.toString());

			Throwable tw = (Throwable)pstr;
			tw.printStackTrace(pout);
			pout.println();
		}else
		{
			sb.append(pstr);

			pout.println(sb.toString());
		}
		pout.flush();
	}
	
}
