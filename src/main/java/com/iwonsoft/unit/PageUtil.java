package com.iwonsoft.unit;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.iwonsoft.util.EncryptUtil;
import com.iwonsoft.util.RequestUtil;

public class PageUtil {
		
	private String unit_root = "";
	private String unit_Url = "";
	private String unit_Uri = "";
	private String unit_CertKey = "";
	private String unit_FuncCd = "";
	private String unit_ViewCd = "";
	private String unit_PageNo = "";
	private List<String> unit_Params = new ArrayList<String>();

	/**
	 * PageUtil 진입점
	 */
	public PageUtil() {
		setUnitCode();
	}
	
	/**
	 * Unit View 페이지 이동 함수
	 * @param viewCode : 이동할 페이지 View 코드
	 * @param params : 전송할 Unit Param Values
	 * @return Unit URL
	 */
	public static String move(String viewCode, String... params) {
		PageUtil page = new PageUtil();
		page.unit_ViewCd = viewCode;
		if ( params != null) { 
			page.unit_Params = Arrays.asList(params); 
		} else {
			page.unit_Params = null;
		}
		String unitCode = page.getUnitCode();
		String unitUrl = page.getUrlParam(page.unit_Url).get("URL");		
		return unitUrl.replace("{unitcode}", unitCode);
	}
	
	/**
	 * Unit View 이동을 다른 URI로 이동하는 함수
	 * @param targetURL : 목적지 URL주소
	 * @param viewCode : 이동할 페이지 View 코드
	 * @param params : 전송할 Unit Param Values
	 * @return Unit URL
	 */
	public static String url(String targetURL, String viewCode, String... params) {
		PageUtil page = new PageUtil();
		Map<String, String> unitURL = page.getUrlParam(targetURL);
		page.unit_CertKey = EncryptUtil.md5( unitURL.get("URI") ).substring(0, 5);
		page.unit_ViewCd = viewCode;
		page.unit_PageNo = "1";
		if ( params != null) { 
			page.unit_Params = Arrays.asList(params); 
		} else {
			page.unit_Params = null;
		}
		String unitCode = page.getUnitCode();		
		String unitUrl = unitURL.get("URL");		
		return unitUrl.replace("{unitcode}", unitCode);
	}
	
	/**
	 * Unit Function(Rest API) 호출 함수
	 * @param funcCode : 호출 Function Code
	 * @param jsonObjectName : 함께 보낼 Json Object 변수명
	 * @return javascript:unit_callRestService();
	 */
	public static String ajax(String funcCode, String jsonObjectName) {
		PageUtil page = new PageUtil();
		page.unit_FuncCd = funcCode;
		String unitCode = page.getUnitCode();
		return "unit_restService('"+ page.unit_Uri +".json?u="+ unitCode +"', "+ jsonObjectName +");";
	}
	
	/**
	 * Unit Function(Rest API) 호출 함수
	 * @param targetURL : 호출 URL
	 * @param funcCode : 호출 Function Code
	 * @param jsonObjectName : 함께 보낼 Json Object 변수명
	 * @return javascript:unit_callRestService();
	 */
	public static String ajax(String targetURL, String funcCode, String jsonObjectName) {
		PageUtil page = new PageUtil();
		page.unit_FuncCd = funcCode;
		String unitCode = page.getUnitCode();
		return "unit_restService('"+ targetURL +".json?u="+ unitCode +"', "+ jsonObjectName +")";
	}
	
	/**
	 * Unit Function(Rest API) 호출 함수
	 * @param targetURL : 호출 URL
	 * @param funcCode : 호출 Function Code
	 * @param jsonObjectName : 함께 보낼 Json Object 변수명
	 * @return javascript:unit_callRestService();
	 */
	public static String ajax(String targetURL, String funcCode, String jsonObjectName, String test) {
		PageUtil page = new PageUtil();
		page.unit_FuncCd = funcCode;
		String unitCode = page.getUnitCode();
		return "unit_restService('"+ targetURL +".json?u="+ unitCode +"', "+ jsonObjectName +")";
	}
	
	
	/**
	 * Unit Function(NewLine To BR Tag) 변환 함수
	 * @param text
	 * @return
	 */
	public static String br(String text) {
		if ( text == null || text.isEmpty() ) { return ""; }		
		return text.replaceAll("(\r\n|\n)", "<br />");
	}
	
	/**
	 * Unit Session Value를 등록하는 함수
	 * @param targetURL : 저장하는 기준의 URL 주소 (미입력시 현재 URI)
	 * @param jsonObjectName : 함께 보낼 Json Object 변수명
	 * @return javascript:unit_setValue();
	 */
	public static String setValue(String targetURL, String jsonObjectName) {			
		PageUtil page = new PageUtil();
		if ( targetURL == null || targetURL.isEmpty() ) { targetURL = page.unit_Url; }		
		String certKey = EncryptUtil.md5( targetURL ).substring(0, 5);
		page.unit_CertKey = certKey;
		page.unit_FuncCd = "unit-set-value";
		page.unit_Params.add(targetURL);
		String unitCode = page.getUnitCode();
		String modulUri = page.unit_root + "/unit.iwonsoft.com/unit-set-value";
		return "unit_setValue('"+ modulUri +".json?u="+ unitCode +"', "+ jsonObjectName +");";
	}
	
	/**
	 * Unit Paging 이동 함수
	 * @param pageNo : 전달할 페이징 번호
	 * @return Unit URL
	 */
	public static String page(String pageNo) {
		PageUtil page = new PageUtil();
		page.unit_FuncCd = "";		
		page.unit_PageNo = pageNo;	
		String unitCode = page.getUnitCode();
		String unitUrl = page.getUrlParam(page.unit_Url).get("URL");		
		return unitUrl.replace("{unitcode}", unitCode);
	}
		
	/**
	 * Unit Paging 이동 함수
	 * @param viewCode : View Code
	 * @param pageNo : 전달할 페이징 번호
	 * @return Unit URL
	 */
	public static String page(String viewCode, String pageNo) {
		PageUtil page = new PageUtil();
		page.unit_FuncCd = "";
		page.unit_ViewCd = viewCode;
		page.unit_PageNo = pageNo;			
		String unitCode = page.getUnitCode();
		String unitUrl = page.getUrlParam(page.unit_Url).get("URL");		
		return unitUrl.replace("{unitcode}", unitCode);
	}
	
	/**
	 * Unit 현재 URL Code를 새 것으로 갱신하는 함수
	 * @return Unit URL
	 */
	public static String reload() {
		PageUtil page = new PageUtil();		
		String unitCode = page.getUnitCode();
		String unitUrl = page.getUrlParam(page.unit_Url).get("URL");		
		return unitUrl.replace("{unitcode}", unitCode);
	}
	
	/**
	 * Form Selectbox Options
	 * @param listData
	 * @param fldName
	 * @param fldValue
	 * @param selectedValue
	 * @return
	 */
	public static String selectOption(List<Map<String, Object>> listData, String fldValue, String fldName, String selectedValue) {
		String result = "";
		if ( listData != null ) {
			for(Map<String, Object> data : listData) {
				String optName = "";
				String optValue = "";				
				if ( data.containsKey(fldName) ) { optName = data.get(fldName).toString(); }
				if ( data.containsKey(fldValue) ) { optValue = data.get(fldValue).toString(); }					
				result += "\n"+ "<option value=\""+ optValue +"\""+ selected(optValue, selectedValue) +">"+ optName +"</option>";							
			}
		}
		return result;		
	}
	
	/**
	 * Form Selectbox Options Selected
	 * @param optVal
	 * @param thisVal
	 * @return
	 */
	public static String selected(String optVal, String thisVal) {	
		if ( optVal.trim().equals(thisVal.trim()) ) {	return " selected"; }
		return "";
	}	
	
	/**
	 * Form Checkbox Checked
	 * @param chkVal
	 * @param thisVal
	 * @return
	 */
	public static String checked(String chkVal, String thisVal) {	
		if ( chkVal.trim().equals(thisVal.trim()) ) {	return " checked"; }
		return "";
	}
	
	/**
	 * Get Unit Code
	 * @return Unit Code
	 */
	private String getUnitCode() {
		List<String> unitDec = new ArrayList<String>();
		unitDec.add(unit_CertKey);
		unitDec.add(unit_FuncCd);
		unitDec.add(unit_ViewCd);
		unitDec.add(unit_PageNo);
		unitDec.addAll(unit_Params);
		return EncryptUtil.encode( String.join("|", unitDec) );
	}
	
	/**
	 * Set Unit Code
	 */
	private void setUnitCode() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		this.unit_root = request.getContextPath();
		String certkey = EncryptUtil.md5( String.valueOf(request.getAttribute("javax.servlet.forward.request_uri")) ).substring(0, 5);
		List<String> unitKey = new ArrayList<String>();
		Map<String, Object> reqParam = RequestUtil.getParameter(request);
		if ( reqParam.keySet().size() > 0 ) {
			for ( String key : reqParam.keySet() ) {
				if ( "u".equals(key.toLowerCase()) ) {				
					for ( String item : EncryptUtil.decode(reqParam.get(key).toString()).split("\\|") ) { unitKey.add(item); }		
				}
			}
		} 
		if ( unitKey.size() == 0 ) {
			unitKey.add(certkey);	// 인증키
			unitKey.add("");			// Function Code
			unitKey.add("");			// View Code
			unitKey.add("1");			// Page No
		}		
		this.unit_Uri = request.getRequestURI();
		if ( request.getAttribute("javax.servlet.forward.request_uri") != null ) { this.unit_Uri = String.valueOf( request.getAttribute("javax.servlet.forward.request_uri") ); }
				
		this.unit_Url = this.unit_Uri;
		if ( request.getQueryString() != null && !request.getQueryString().isEmpty() ) { this.unit_Url += "?"+ request.getQueryString(); }
		
		int row = 0;
		for (String unit : unitKey) {
			switch(row) {
			case 0 : this.unit_CertKey = unit; break;
			case 1 : this.unit_FuncCd = unit; break;
			case 2 : this.unit_ViewCd = unit; break;
			case 3 : this.unit_PageNo = unit; break;
			default : this.unit_Params.add(unit); break;
			}
			row++;
		}
	}
	
	/**
	 * URL 정보에서 필요한 URI, QueryString을 분리해서 조회
	 * @return
	 */
	private Map<String, String> getUrlParam(String URL){
		if ( URL.isEmpty() ) { return null; }
		Map<String, String> params = new HashMap<String, String>();
		String paramUri = "";
		String paramUrl = "";
		String paramQsUnit = "";
		String paramQsOther = "";		
		
		if ( URL.indexOf("?") > 0 ) {
			paramUri = URL.substring(0, URL.indexOf("?"));
			String paramQs = URL.substring(URL.indexOf("?")+1);
			List<String> newQs = new ArrayList<String>();
			for (String Qs : paramQs.split("&")) {			
				if(Qs.indexOf("=")>0) {
					String[] keyVal = Qs.split("=");
					if ( keyVal.length == 2) {
						String key = keyVal[0].trim();
						String value = keyVal[1].trim();
						if ("u".equals(key.toLowerCase())) {
							paramQsUnit = value;
						} else {
							newQs.add(key +"="+ value);
						}
					}
				}
			}
			
			paramUrl = paramUri +"?u={unitcode}";
			if ( newQs != null ) {
				paramQsOther = String.join("&", newQs);
				paramUrl += "&"+ paramQsOther;
			}
			
		} else {
			paramUri = URL;
			paramUrl = URL +"?u={unitcode}";
		}		
		params.put("URI", paramUri);
		params.put("URL", paramUrl);
		params.put("QS_UNIT", paramQsUnit);
		params.put("QS_OTHER", paramQsOther);		
		return params;
	}
	
}
