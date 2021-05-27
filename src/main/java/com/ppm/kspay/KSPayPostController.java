package com.ppm.kspay;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iwonsoft.unit.UnitSVO;
import com.iwonsoft.unit.UnitVO;
import com.iwonsoft.util.RequestUtil;
import com.ppm.service.QueryService;

@Controller
@RequestMapping(value= {"/front/*/*","/mng/*/*","/cms/*/*"} )
public class KSPayPostController {

	
	@Resource(name="QueryService")
	private QueryService QueryService;
	
	RequestUtil requestUtil;

	
	@RequestMapping(method= RequestMethod.POST, value ="/front/payment/kspay_wh_rcv")
	public UnitSVO kspay_wh_rcv(UnitSVO svo,  HttpServletRequest request) throws Exception{
		// 여기서 db처리 해야함
		UnitVO dataVo = new UnitVO(svo.getIn());
//		System.out.println("kspay_wh_rcv");
//		System.out.println("dataVo :"+dataVo.getParam());
//		System.out.println( request.getParameterMap() );
//		
//		System.out.println( "kspay_wh_rcv 셋션" + request.getSession().getAttribute("LOGIN_IDX"));
		
		svo.setOut("params", dataVo.getParam() );
		return svo;
	}

	@RequestMapping(method= RequestMethod.POST, value ="/front/payment/kspay_wh_result")
	public UnitSVO kspay_wh_result(UnitSVO svo,  HttpServletRequest request) throws Exception{
		// 여기서도 db처리 해야함
		UnitVO dataVo = new UnitVO(svo.getIn());
//		System.out.println("kspay_wh_result");
//		System.out.println("dataVo :"+dataVo.getParam());
//		System.out.println( request.getParameterMap().toString() );

		String userAgent = request.getHeader("User-Agent").toUpperCase();
		
//		System.out.println(  "kspay_wh_result 셋션" + request.getSession().getAttribute("LOGIN_IDX"));
		
		if(userAgent.indexOf("MOBI") > -1)
			request.setAttribute("isMobile", "MOBILE");
		else
			request.setAttribute("isMobile", "PC");
		
		return svo;
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(method= RequestMethod.POST, value ="/front/mypay/mypay_cancel")
	public UnitSVO kspay_mypay_cancel(UnitSVO svo,  HttpServletRequest request) throws Exception{
		UnitVO dataVo = new UnitVO(svo.getIn());
//		System.out.println("mypay_cancel");
		return svo;
	}

	@RequestMapping(method= RequestMethod.POST, value ="/front/mypay/mypay_rcv")
	public UnitSVO kspay_mypay_rcv(UnitSVO svo,  HttpServletRequest request) throws Exception{
		UnitVO dataVo = new UnitVO(svo.getIn());
//		System.out.println("mypay_rcv");
//		System.out.println("dataVo :"+dataVo.getParam());
//		System.out.println( request.getParameterMap().toString() );
//		System.out.println( "mypay_rcv 셋션" +  request.getSession().getAttribute("LOGIN_IDX"));
		return svo;
	}
	
	@RequestMapping(method= RequestMethod.POST, value ="/front/mypay/mypay_result")
	public UnitSVO kspay_mypay_result(UnitSVO svo,  HttpServletRequest request, HttpServletResponse response) throws Exception{
//		request.setCharacterEncoding("EUC-KR");
//		response.setContentType("text/html; charset=euc-kr");
		UnitVO dataVo = new UnitVO(svo.getIn());
//		System.out.println("mypay_result");
//		System.out.println("dataVo :"+dataVo.getParam());
//		System.out.println( request.getParameterMap().toString() );
//		System.out.println("mypay_result 셋션" + request.getSession().getAttribute("LOGIN_IDX"));
		return svo;
	}

	@RequestMapping(method= RequestMethod.POST, value ="/front/mypay/cancelPost")
	public UnitSVO cancelPost(UnitSVO svo,  HttpServletRequest request, HttpServletResponse response) throws Exception{
//		request.setCharacterEncoding("EUC-KR");
//		response.setContentType("text/html; charset=euc-kr");
		UnitVO dataVo = new UnitVO(svo.getIn());
//		System.out.println("mypay_result");
//		System.out.println("dataVo :"+dataVo.getParam());
//		System.out.println( request.getParameterMap().toString() );
		return svo;
	}
	

	@RequestMapping(method= RequestMethod.POST, value ="/front/payment/KSPayCashBillPost")
	public UnitSVO KSPayCashBillPost(UnitSVO svo,  HttpServletRequest request) throws Exception{
		// 여기서 db처리 해야함
		UnitVO dataVo = new UnitVO(svo.getIn());
//		System.out.println("KSPayCashBillPost");
//		System.out.println("dataVo :"+dataVo.getParam());
//		System.out.println( request.getParameterMap() );
		
		svo.setOut("params", dataVo.getParam() );
		return svo;
		
	}

	@RequestMapping(method= RequestMethod.POST, value ="/front/payment/KSPayCancelCashPost")
	public UnitSVO KSPayCancelCashPost(UnitSVO svo,  HttpServletRequest request) throws Exception{
		// 여기서 db처리 해야함
		UnitVO dataVo = new UnitVO(svo.getIn());
//		System.out.println("KSPayCancelCashPost");
//		System.out.println("dataVo :"+dataVo.getParam());
//		System.out.println( request.getParameterMap() );
		
		svo.setOut("params", dataVo.getParam() );
		return svo;
		
	}

	@RequestMapping(method= RequestMethod.POST, value ="/front/payment/KSPayAccountCancelPost")
	public UnitSVO KSPayAccountCancelPost(UnitSVO svo,  HttpServletRequest request) throws Exception{
		// 여기서 db처리 해야함
		UnitVO dataVo = new UnitVO(svo.getIn());
//		System.out.println("KSPayAccountCancelPost");
//		System.out.println("dataVo :"+dataVo.getParam());
//		System.out.println( request.getParameterMap() );
		
		svo.setOut("params", dataVo.getParam() );
		return svo;
		
	}
	
	@RequestMapping(method= RequestMethod.POST, value ="/front/payment/KSPayMobileCancelPost")
	public UnitSVO KSPayMobileCancelPost(UnitSVO svo,  HttpServletRequest request) throws Exception{
		// 여기서 db처리 해야함
		UnitVO dataVo = new UnitVO(svo.getIn());
//		System.out.println("KSPayMobileCancelPost");
//		System.out.println("dataVo :"+dataVo.getParam());
//		System.out.println( request.getParameterMap() );
		
		svo.setOut("params", dataVo.getParam() );
		return svo;
		
	}

	@RequestMapping(method= RequestMethod.POST, value ="/front/payment/KSPayVerCancelPost")
	public UnitSVO KSPayVerCancelPost(UnitSVO svo,  HttpServletRequest request) throws Exception{
		// 여기서 db처리 해야함
		UnitVO dataVo = new UnitVO(svo.getIn());
//		System.out.println("KSPayCancelCashPost");
//		System.out.println("dataVo :"+dataVo.getParam());
//		System.out.println( request.getParameterMap() );
		
		svo.setOut("params", dataVo.getParam() );
		return svo;
		
	}

	@RequestMapping(method= RequestMethod.POST, value ="/front/payment/KSPayAccountCashReceiptPost")
	public UnitSVO KSPayAccountCashReceiptPost(UnitSVO svo,HttpServletRequest request, HttpServletResponse response) throws Exception{
		// 여기서 db처리 해야함
//		System.out.println("KSPayCancelCashPost");
//		System.out.println("dataVo :"+dataVo.getParam());
//		System.out.println( request.getParameterMap() );
		KSPayController ksPayPaymentCancle = new KSPayController();
		UnitVO dataVo = new UnitVO(svo.getIn());
		System.out.println("여기는 ks페이 가상계좌 현금영수증 자동발급 서비스입니다. 무엇을 도와드릴까요?");
		System.out.println( request.getParameter("BUY_NO") );
		dataVo.set("BUY_NO", request.getParameter("BUY_NO"));  
		dataVo.setAll(QueryService.selectDetail( dataVo.getParam() , "mng", "Pay", "selectFrontPaymentRefundInfo")); 
		
		Map<String , Object> map = new HashMap<>();
		System.out.println( dataVo.get("CASH_RECEIPT") );
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
			
			System.out.println( dataVo.get("rStatus") );
			
			if (dataVo.get("rStatus").equals("O")) {
				System.out.println( "O1" );
				QueryService.updateData(dataVo.getParam(), "mng", "Pay", "updateMngPayCashReceiptIssue");
				request.setAttribute("YN", "O");
			}else {
				System.out.println( "NO2" );
				request.setAttribute("YN", "N");
			}
		}else {
			System.out.println( "NO" );
			request.setAttribute("YN", "N");
		}

		return svo;
	}
	
}
