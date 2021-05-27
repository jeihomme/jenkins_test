package com.ppm.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.iwonsoft.unit.UnitSVO;
import com.ppm.service.QueryService;

@Controller
public class RootController {
	
	@Resource(name="QueryService")
	private QueryService QueryService;
	
	/**
	 * [Root] 메인 페이지로 이동
	 * @param svo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/", method=RequestMethod.GET)	
	public ModelAndView root(UnitSVO svo) throws Exception{
		return svo.redirectMV("/front/main/index");
//		return svo.redirectMV("http://peoplemade.co.kr");
	}

	/**
	 * [Root] 관리자 메인
	 * @param svo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/front", method=RequestMethod.GET)	
	public ModelAndView front(UnitSVO svo) throws Exception{	
//		return svo.redirectMV("http://peoplemade.co.kr");
		return svo.redirectMV("/front/main/index");
	}
	
	/**
	 * [Root] 기업회원 메인
	 * @param svo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/cms", method=RequestMethod.GET)	
	public ModelAndView cms(UnitSVO svo) throws Exception{		
		return svo.redirectMV("/cms/login/login");
	}

	/**
	 * [Root] 관리자 메인
	 * @param svo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/mng", method=RequestMethod.GET)	
	public ModelAndView mng(UnitSVO svo) throws Exception{		
		return svo.redirectMV("/mng/login/login");
	}
	
	/**
	 * [Root] 관리자 요청에 의함
	 * @param svo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/test", method=RequestMethod.GET)	
	public ModelAndView test(UnitSVO svo) throws Exception{	
		return svo.redirectMV("/front/main/index");
	}
}




