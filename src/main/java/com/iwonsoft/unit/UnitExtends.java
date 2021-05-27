package com.iwonsoft.unit;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

public class UnitExtends {

	/**
	 * Normal Exception Handler
	 * @param request
	 * @param response
	 * @param exception
	 * @return
	 */
	@ExceptionHandler(value = Exception.class)
	@ResponseStatus (HttpStatus.INTERNAL_SERVER_ERROR)
	public ModelAndView PageExceptionHandler (HttpServletRequest request, HttpServletResponse response, Exception e) {
		
		e.printStackTrace();        
        System.out.println(e);     
		
		ModelAndView mv = new ModelAndView();
		String statusCode= String.valueOf( HttpStatus.INTERNAL_SERVER_ERROR.value() );
		String statusReason= HttpStatus.INTERNAL_SERVER_ERROR.getReasonPhrase();
		mv.addObject("statusCode", statusCode);
		mv.addObject("statusReason", statusReason);
		return mv;
	}
	
	/**
	 * File IO Exception Handler
	 * @param request
	 * @param response
	 * @param e
	 * @return
	 */
	@ExceptionHandler(value = IOException.class)
	@ResponseStatus (HttpStatus.INTERNAL_SERVER_ERROR)
	public ModelAndView IOExceptionHandler (HttpServletRequest request, HttpServletResponse response, Exception e) {
		e.printStackTrace();        
        System.out.println(e); 
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	/**
	 * RestControll 통신에서 발생한 Exception Handler
	 * @param request
	 * @param response
	 * @param ex
	 * @return
	 */
	@ExceptionHandler(value = UnitException.class)    
	 public @ResponseBody UnitRVO RestExceptionHandler( HttpServletRequest request, HttpServletResponse response, UnitException ex) {
		UnitRVO unitRV = new UnitRVO();
		unitRV.setCode( ex.getCode() );
		unitRV.setMessage( ex.getMessage() );
		unitRV.setTarget( ex.getTarget() );
		unitRV.setVo( ex.getVo() );		
		return unitRV;		
	 }
}
