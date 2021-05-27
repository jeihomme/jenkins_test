package com.ppm.controller;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.core.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.iwonsoft.unit.UnitSVO;
import com.iwonsoft.unit.UnitVO;
import com.iwonsoft.util.RequestUtil;
import com.ppm.service.frontChatService;

//@SuppressWarnings("serial")
//@Controller
//@RequestMapping(value={"/front/mypeoplemade/*", "/mng/wait/*"})
public class ChatController extends HttpServlet {
	
//	@Resource(name="frontChatService")
//	private frontChatService frontChatService;
	
//	RequestUtil requestUtil;
	
//	ServletContext sc = this.getServletContext();
	
	
//	/**
//	 * 마이피플 > 1:1 채팅
//	 * @param svo
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping(value="/chat_solution")	
//	public ModelAndView webchat(UnitSVO svo, HttpServletRequest request) throws Exception{		
//		
//		String [] path = request.getServletPath().split("/");
//		String group = path[1];
//
//        ServletContext sc = request.getSession().getServletContext();
//    	
//		if ( request.getServletPath().indexOf("_solution") > -1 ) {
//			if( group.equals("mng") ) {
////				requestUtil.setSession("mngChatIdx",requestUtil.getSession("mngLoginIdx") );
//				sc.setAttribute("mngSessionTest", requestUtil.getSession("mngLoginIdx"));
////		        System.out.println("mngChatIdx requestUtil.getSession() : " + requestUtil.getSession());
//		        System.out.println("mngSessionTest requestUtil.getSession() : " + request.getRemoteAddr() +" _ " + sc.getAttribute("mngSessionTest"));
//			} else {
////				requestUtil.setSession("frontChatIdx",requestUtil.getSession("frontLoginIdx") );
//				sc.setAttribute("frontSessionTest", requestUtil.getSession("frontLoginIdx"));
////		        System.out.println("frontChatIdx requestUtil.getSession() : " + requestUtil.getSession());
//		        System.out.println("frontSessionTest requestUtil.getSession() : " + request.getRemoteAddr() +" _ " + sc.getAttribute("frontSessionTest"));
//			}
//		}
//		
//		return svo.getMV();
//	}
	
//	/**
//	 * 마이피플 > 1:1 채팅(JSON)
//	 * @param svo
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping(value = "/chat_solution.json", method = RequestMethod.POST)
//	public @ResponseBody UnitSVO index_json(UnitSVO svo) throws Exception {
//		UnitVO dataVo = new UnitVO(svo.getIn());
//		if ("list".equals(svo.getFunc())) {			
//			dataVo.setDao( frontChatService.selectFrontChatList(dataVo.getParam()) );
//			svo.setOut("chatList", dataVo.getDao() );			
//		} else if ("text".equals(svo.getFunc())) {
//			System.out.println("@@@"+ dataVo.getParam());
//			frontChatService.insertFrontChatText(dataVo.getParam());			
//		}
//		return svo;
//	}
}
