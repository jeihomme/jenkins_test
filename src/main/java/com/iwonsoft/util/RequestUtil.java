package com.iwonsoft.util;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class RequestUtil {
	/**
	 * Request 변수를 MAP으로 맵핑
	 * @param request
	 * @return
	 */
	public static Map<String, Object> getParameter (HttpServletRequest request){
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		Enumeration<?> enums = request.getParameterNames();
		
		while(enums.hasMoreElements()){
			String paramName = (String)enums.nextElement();
			String[] parameters = request.getParameterValues(paramName);
			
			// Parameter가 배열일 경우
			if(parameters.length > 1){
				parameterMap.put(paramName, parameters);				
			// Parameter가 배열이 아닌 경우
			}else{				
				parameterMap.put(paramName, String.valueOf(parameters[0]).replace("?", "&#63;").replace("'", "&#39;") );
			}
		}		
		return parameterMap;
	}
	public static Map<String, Object> getParameter (MultipartHttpServletRequest request){
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		Enumeration<?> enums = request.getParameterNames();		
		
		while(enums.hasMoreElements()){
			String paramName = (String)enums.nextElement();
			String[] parameters = request.getParameterValues(paramName);
			
			// Parameter가 배열일 경우
			if(parameters.length > 1){
				parameterMap.put(paramName, parameters);
			// Parameter가 배열이 아닌 경우
			}else{
				parameterMap.put(paramName, String.valueOf(parameters[0]).replace("?", "&#63;").replace("'", "&#39;") );
			}
		}
		return parameterMap;
	}	
	
	/**
	 * 세션 정보를 불러옴
	 * @param request
	 * @return
	 */
	public static Object getSession() {
		Map<String, Object> result = new HashMap<String, Object>();
		String[] items = RequestContextHolder.getRequestAttributes().getAttributeNames(RequestAttributes.SCOPE_SESSION);		
		for(String item : items) {
			result.put(item, (Object) RequestContextHolder.getRequestAttributes().getAttribute(item, RequestAttributes.SCOPE_SESSION));	
		}
		return result;
	}
	public static Object getSession(String key) {
		return (Object) RequestContextHolder.getRequestAttributes().getAttribute(key, RequestAttributes.SCOPE_SESSION);
	}
	
	/**
	 * 세션 정보를 등록
	 * @param request
	 * @param key
	 * @param value
	 */
	public static void setSession (String key, Object value) {		
		RequestContextHolder.getRequestAttributes().setAttribute(key, value, RequestAttributes.SCOPE_SESSION);
	}
	
	/**
	 * 세션 정보를 삭제
	 * @param request
	 * @param key
	 */
	public static void removeSession (String key) {
		RequestContextHolder.getRequestAttributes().removeAttribute(key, RequestAttributes.SCOPE_SESSION);
	}
	
	/**
	 * 세션 아이디를 조회
	 * @return
	 * @throws Exception
	 */
	public static String getSessionId() {
		return RequestContextHolder.getRequestAttributes().getSessionId();
	}
	
	/**
	 * 쿠키 정보를 불러옴
	 * @param request
	 * @return
	 */
	public static Map<String, Object> getCookie ( HttpServletRequest request ){
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
		    for (Cookie cookie : cookies) {
		    	String paramName = cookie.getName();
				String parameters = String.valueOf(cookie.getValue());
				parameterMap.put(paramName, parameters);		    	
		    }
		}
		return parameterMap;
	}	

	/***
	 * 쿠키 정보 등록
	 * @param key
	 * @param value
	 */
	public static void setCookie (HttpServletResponse response, String key, String value) {	
		
		if ( !StringUtil.isNull(key) ) {
			Cookie cookie = new Cookie(key, value);
		    cookie.setMaxAge(60*60*24*365);
		    cookie.setPath("/");	   
		    response.addCookie(cookie);  
		}
	}
	
	/***
	 * 쿠키 정보 삭제
	 * @param request
	 * @param response
	 * @param key
	 */
	public static void removeCookie (HttpServletRequest request, HttpServletResponse response, String key) {	
		Cookie[] cookies = request.getCookies();
		if ( !StringUtil.isNull(cookies) ) {	
			if ( !StringUtil.isNull(key) ) {			
				for (int i = 0; i < cookies.length; i++) {
					cookies[i].setMaxAge(0);
					cookies[i].setPath("/");
					response.addCookie(cookies[i]);
				}
			} else {		
				for (int i = 0; i < cookies.length; i++) {
					String paramName = cookies[i].getName();
					if (paramName.equals(key)) {
						cookies[i].setMaxAge(0);
						cookies[i].setPath("/");
						response.addCookie(cookies[i]);
					}				
				}
			}
		}
	}
}
