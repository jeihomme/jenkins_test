package com.iwonsoft.unit;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.iwonsoft.util.DateTimeUtil;
import com.iwonsoft.util.EncryptUtil;
import com.iwonsoft.util.JsonUtil;
import com.iwonsoft.util.RequestUtil;


public class UnitSVO {
	
		private static final Logger logger = LoggerFactory.getLogger(UnitSVO.class);
						
		// [Sequnce] SVO 고유 UUID
		private String UID = "";
	
		// [상태 코드] 응답 코드 (0000:정상)
		private String CODE = "0000";
		
		// [상태 코드] 이슈 메세지
		private String MESSAGE = "";
		
		// [상태 코드] 이슈 대상
		private String TARGET = "";	
	
		// [Request] Context Root
		private String ROOT = "";
		
		// [Request] Request URI
		private String URI = "";	
		
		// [Request] Request URL
		private String URL = "";
		
		// [Request] Request Base URL
		private String BASE_URL = "";
		
		// [입출력] Input Data
		private Map<String, Object> IN = new HashMap<String, Object>();
		
		// [입출력] Output Data
		private Map<String, Object> OUT = new HashMap<String, Object>();
		
		// [입출력] Files Data
		private Map<Integer, Object> FILES = new HashMap<Integer,Object>();
		private String FILES_FLAG = "OFF";
	
		// [IVEWS] Partition 페이지 정보
		private VIEWS VIEW = new VIEWS();
				
		// View Contoller ModelView
		private ModelAndView MV = new ModelAndView();
								
		/**
		 * UnitSVO 진입점
		 */	
		public UnitSVO() {		
			
			RequestUtil.getSession();
			
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder .getRequestAttributes()).getRequest();
			String reqUri = request.getRequestURI();
			if ( request.getAttribute("javax.servlet.forward.request_uri") != null ) { reqUri = String.valueOf( request.getAttribute("javax.servlet.forward.request_uri") ); }
			if ( ! request.getContextPath().isEmpty() ) { reqUri = request.getRequestURI().replace(request.getContextPath(), ""); }
			
			// Default Setting
			this.MV = new ModelAndView( reqUri );
			setUid();												
			setCode("0000");				
			setMessage("");
			setTarget("");			
			setRoot( request.getContextPath() );				// private
			setUri( reqUri );										// private
			setUrl( request );									// private
			setIn( RequestUtil.getParameter(request) );
			setFiles( RequestUtil.getParameter(request) );	// private
			setViews( request );									// private			
						
			// Start Method Message
			String log = "";
			log += "\n"+"┌───────────────────────────────────────────────────────┐";			
			log += "\n"+"│ ["+ request.getMethod() +"] " + reqUri;	
			if ( VIEW.CERT.isEmpty() == false ) {  log += " ( CertKey : "+ VIEW.CERT + ")"; }
			if ( RequestUtil.getParameter(request).containsKey("u") ) {
				String unitKey = EncryptUtil.decode( RequestUtil.getParameter(request).get("u").toString() );
				log += "\n"+"├───────────────────────────────────────────────────────┤";	
				log += "\n"+"│ UNIT CODE : " + unitKey;
				log += "\n"+"│  (1) certKey : " + unitKey.split("\\|")[0];
				log += "\n"+"│  (2) function : " + unitKey.split("\\|")[1];
				log += "\n"+"│  (3) pageCode : " + unitKey.split("\\|")[2];
				log += "\n"+"│  (4) pageNo : " + unitKey.split("\\|")[3];				
			}
			log += "\n"+"├───────────────────────────────────────────────────────┤";				
			if ( this.getIn() != null ) {
				Map<String, Object> getData = this.getIn();
				int rowNum = 1;
				for( String key : getData.keySet() ) {
					log += "\n"+"│	"+ (rowNum++) +"	│	"+ key + "	|	" + getData.get(key);
				}				
			}
			log += "\n"+"└───────────────────────────────────────────────────────┘";	
			logger.warn(log);
		}
		
		/**
		 * (Get) [Sequnce] SVO 고유 UUID
		 * @return
		 */
		public String getUid() {
			return UID;
		}
			
		/**
		 * (Get) [Return] 응답코드
		 * @return
		 */
		public String getCode() {
			return CODE;
		}
		
		/**
		 * (Get) [Return] 이슈 메세지
		 * @return
		 */
		public String getMessage() {
			return MESSAGE;
		}
		
		/**
		 * (Get) [Return] 이슈 대상
		 * @return
		 */
		public String getTarget() {
			return TARGET;
		}		
	
		/**
		 * (Get) Context Root
		 * @return
		 */
		public String getRoot() {
			return this.ROOT;
		}
		
		/**
		 * (Get) Context URI
		 * @return
		 */
		public String getUri() {
			return this.URI;
		}
		
		/**
		 * (Get) Context URL
		 * @return
		 */
		public String getUrl() {
			return this.URL;
		}
		
		/**
		 * (Get) Context Base URL
		 * @return
		 */
		public String getBaseUrl() {
			return this.BASE_URL;
		}
		
		/**
		 * (Get) Input Data Object
		 * @return
		 */
		public Map<String, Object> getIn() {
			return this.IN;
		}
		
		/**
		 * (Get) Output Data Object
		 * @return
		 */
		public Map<String, Object> getOut() {
			return this.OUT;
		}
		
		/**
		 * (Get) Files Data Object
		 * @return
		 */
		public Map<Integer, Object> getFiles(){
			Map<Integer, Object> result = new HashMap<Integer, Object>(this.FILES);
			result.put(99999, this.FILES_FLAG);
			return result;
		}
		
		/**
		 * (Get) [Unit View] View Object
		 * @return
		 */
		private VIEWS getView() {
			return this.VIEW;
		}
		
		/**
		 * (Get) [Unit View] View Parameters
		 * @return
		 */
		public Map<String, Object> getViews() {
			Map<String, Object> view = new HashMap<String, Object>();		
			view.put("func", this.getFunc());
			view.put("pageCd", this.getPageCd());
			view.put("pageNo", this.getPageNo());			
			view.put("params", this.getParams());
			view.put("values", this.getValues());
			view.put("safes", this.getSafes());
			view.put("vars", this.getVars());
			return view;
		}
		
		/**
		 * (Get) [Unit View] Function Name
		 * @return
		 */
		public String getFunc() {
			return this.getView().FUNC;
		}
		
		/**
		 * (Get) [Unit View] Function Name Equals Check
		 * @param funcNm
		 * @return
		 */
		public boolean getFunc(String funcNm) {
			boolean result = false;		
			if ( funcNm.toLowerCase().equals(this.getView().FUNC.toLowerCase()) ) {
				result = true;
			}
			return result;
		}
		
		/**
		 * (Get) [Unit View] Page Code
		 * @return
		 */
		public String getPageCd() {
			return this.getView().PAGE_CD;
		}
		
		/**
		 * (Get) [Unit View] Page Code Matched
		 * @return
		 */
		public boolean getPageCd(String pageCd) {		
			return pageCd.equals(this.getView().PAGE_CD);
		}
		
		/**
		 * (Get) [Unit View] Page Paging Number
		 * @return
		 */
		public int getPageNo() {
			String pageCd = this.getView().PAGE_CD;
			if ( pageCd.isEmpty() ) { pageCd = "EMPTY"; }
			Map<String, Integer> pageNo = this.getView().PAGE_NO;
			if ( pageNo.containsKey(pageCd) ) {
				return pageNo.get(pageCd);
			} else {
				return 1;
			}
		}
		
		/**
		 * (Get) [Unit View] Get Parameters List
		 * @return
		 */
		public List<String> getParams(){
			return this.getView().PARAMS;
		}
		
		/**
		 * (Get) [Unit View] Get Parameter
		 * @return
		 */
		public String getParam(int index) {
			if ( this.getView().PARAMS.size() > index ) {
				return this.getView().PARAMS.get(index);
			} else {
				return "";
			}
		}
		
		/**
		 * (Get) [Unit View] Get Parameters List
		 * @return
		 */
		public int getParamsSize(){
			return this.getView().PARAMS.size();
		}
		
		/**
		 * (Get) [Unit View] Global Parameters List
		 * @return
		 */
		public Map<String, String> getValues(){
			return this.getView().VALUES;
		}
		
		/**
		 * (Get) [Unit View] Global Parameter
		 * @return
		 */
		public String getValue(String key) {
			Map<String, String> values = this.getValues();
			if ( values == null ) {
				return "";
			} else {
				if ( values.containsKey(key) ) {
					return values.get(key);
				} else {
					return "";
				}
			}
		}
		
		/**
		 * (Get) [Unit View] Secure Parameters List
		 * @return
		 */
		public Map<String, String> getSafes(){
			return this.getView().SAFES;
		}
		
		/**
		 * (Get) [Unit View] Secure Parameter
		 * @return
		 */
		public String getSafe(String key) {
			Map<String, String> safes = this.getSafes();
			if ( safes == null ) {
				return "";
			} else {
				if ( safes.containsKey(key) ) {
					return safes.get(key);
				} else {
					return "";
				}
			}
		}
		
		/**
		 * (Get) [Unit View] Page Variables List
		 * @return
		 */
		public List<String> getVars(){
			return this.getView().VARS;
		}
		
		/**
		 * (Get) [Unit View] Page Variable
		 * @return
		 */
		public String getVar(int index) {
			if ( this.getView().VARS.size() > index ) {
				return this.getView().VARS.get(index);
			} else {
				return "";
			}
		}
		
		/**
		 * (Get) [Unit User] User Object
		 * @return
		 */
		private Map<String, Object> getUser() {
			Map<String, Object> result = new HashMap<String, Object>();			
			if ( RequestUtil.getSession("UNIT_USERS") != null ) {
				result = JsonUtil.getMapFromJsonString( EncryptUtil.decode(RequestUtil.getSession("UNIT_USERS").toString()) );				
			}
			return result;			
		}
		
		/**
		 * (Get) [Unit User] Site User Object
		 * @return
		 */
		@SuppressWarnings("unchecked")
		public UserVO getUser(String siteCd){
			UserVO userVo = new UserVO();
			if ( RequestUtil.getSession("UNIT_USERS") != null ) {
				Map<String, Object> unitUsers = JsonUtil.getMapFromJsonString( EncryptUtil.decode(RequestUtil.getSession("UNIT_USERS").toString()) );				            
	            Map<String, Object> userMap = (Map<String, Object>) unitUsers.get(siteCd);
	            userVo.setSsoId(userMap.get("SSO_ID").toString());
	            userVo.setSsoNm(userMap.get("SSO_NM").toString());
	            userVo.setSsoCd(userMap.get("SSO_CD").toString());
	            userVo.setGrps((List<String>) userMap.get("GRPS"));
	            userVo.setVars((Map<String, String>) userMap.get("VARS"));
			}
			return userVo;			
		}
		
		/**
		 * (Get) Controller Model&View
		 * @return
		 */
		public ModelAndView getMV() {	
			return fnMV(MV);
		}
		
		
		
		
		/**
		 * (Set) SVO 고유한 UUID 발급
		 */
		public void setUid() {		
			this.UID = DateTimeUtil.getNowDate() + DateTimeUtil.getNowTime() + String.valueOf( UUID.randomUUID() ).replaceAll("-", "").toUpperCase();
		}
		public void setUid(String uid) {
			if ( uid.isEmpty() == false ) {
				this.UID = uid.toUpperCase();
			}
		}
				
		/**
		 * (Set) [Return] 응답코드
		 * @param code
		 */
		public void setCode(String code) {
			this.CODE = code;
		}
		
		/**
		 * (Set) [Return] 이슈 메세지
		 * @param message
		 */
		public void setMessage(String message) {
			this.MESSAGE = message;
		}
		
		/**
		 * (Set) [Return] 이슈 대상
		 * @param target
		 */
		public void setTarget(String target) {
			this.TARGET = target;
		}
		
		/**
		 * (Set) Context Root
		 * @param root
		 */
		private void setRoot(String root) {
			this.ROOT = root;
		}
		
		/**
		 * (Set) Context URI
		 * @param uri
		 */
		private void setUri(String uri) {
			this.URI = uri;
		}
		
		/**
		 * (Set) Context URL & Base URL
		 * @param request
		 */
		private void setUrl(HttpServletRequest request) {
			String url = request.getRequestURL().toString();
			this.URL = url;
			this.BASE_URL = url.substring(0, url.indexOf(request.getServletPath()) );
		}
		
		/**
		 * (Set) [입출력] Input Data
		 * @param in
		 */
		public void setIn(Map<String, Object> in) {
			if ( in == null ) { in = new HashMap<String, Object>(); }
			if ( in.containsKey("SERVICE_UUID") ) { this.setUid( in.get("SERVICE_UUID").toString() ); }
			this.IN = new HashMap<String, Object>(in);			
		}
		
		/**
		 * (Set) [입출력] Output Data
		 * @param outNm
		 * @param outMap
		 */
		public void setOut(String outNm, Map<String, Object> outMap) {
			if ( outMap != null ) { 
				Map<String, Object> outData = new HashMap<String, Object>(outMap); 
				this.OUT.put(outNm, outData);
			}			
		}		
		public void setOut(String outNm, String outVal) {
			if ( outVal != null ) {
				this.OUT.put(outNm, outVal);
			}
		}
		
		/**
		 * (Set) [입출력] Files Data
		 * @param map
		 */
		private void setFiles(Map<String, Object> files) {
			if ( files == null ) { files = new HashMap<String, Object>(); }			
			int filesCnt = 0;
			for ( Entry<String, Object> item : files.entrySet() ) {
				if ( item.getKey().indexOf("UNIT_FILE[") == 0 ) { filesCnt ++; }
			}
			Map<Integer, Object> result = new HashMap<Integer, Object>();
			for (int index=0; index < filesCnt/6; index++) {
				Map<String, String> fileInfo = new HashMap<String, String>();
				fileInfo.put("FIELD", files.get("UNIT_FILE["+ index +"][field]").toString() );
				fileInfo.put("NAME", files.get("UNIT_FILE["+ index +"][name]").toString() );
				fileInfo.put("TYPE", files.get("UNIT_FILE["+ index +"][type]").toString() );				
				fileInfo.put("SIZE", files.get("UNIT_FILE["+ index +"][size]").toString() );
				fileInfo.put("DATE", files.get("UNIT_FILE["+ index +"][date]").toString() );
				fileInfo.put("EXT", files.get("UNIT_FILE["+ index +"][ext]").toString() );
				result.put(index, fileInfo);		
			}
			this.FILES = result;
			if ( files.containsKey("UNIT_FILE_FLAG") ) {
				this.FILES_FLAG = "ON".equals( files.get("UNIT_FILE_FLAG").toString() ) ? "ON" : "OFF";
			}
		}
		
		/**
		 * (Set) [Unit View] View Object
		 * @param request
		 */
		@SuppressWarnings({ "unchecked" })
		private void setViews(HttpServletRequest request) {
			String certKey = EncryptUtil.md5( this.getUri() ).substring(0, 5);			
			if ( ! request.getParameterMap().containsKey("u") ) {				
				// 넘겨온 "U" 파라메터가 없는 경우 해당 기록을 모두 초기화 함		
				RequestUtil.removeSession("UNIT_VIEWS_"+ certKey);	
			} else {				
				// 입력된 Unit Code를 변수로 등록
				Map<String, Object> reqParam = RequestUtil.getParameter(request);
				String unitCode = EncryptUtil.decode(reqParam.get("u").toString());					
				VIEWS view = new VIEWS();
				List<String> unitKey = new ArrayList<String>();
				if (!"".equals(unitCode) && unitCode.indexOf("|") > 0) {					
					String[] codeSplit = unitCode.split("\\|");
					int rowno = 0;
					for ( String item : codeSplit ) {
						switch(rowno) {
						case 0 : break;
						case 1 : view.FUNC = item; break;
						case 2 : view.PAGE_CD = item; break;
						case 3 :			
							if ( view.PAGE_CD.isEmpty() ) { view.PAGE_CD = "EMPTY"; }						
							view.PAGE_NO.put( view.PAGE_CD, Integer.parseInt(item) );
							break;
						default : unitKey.add(item); break;
						}
						rowno++;
					}
					view.PARAMS = unitKey;
				}
							
				// 만약 Func이 암호화되어 있다면 별도의 처리
				if ( "UNIT".equals( EncryptUtil.decode(view.FUNC) ) ) {
					certKey = view.PARAMS.get(0);
				}
				view.CERT = certKey;				
				
				// Session Params Setting
				Map<String, Object> session = (Map<String, Object>) RequestUtil.getSession();
				if ( session.containsKey("UNIT_VIEWS_"+ view.CERT) ) {	
					String sessionString = String.valueOf( session.get("UNIT_VIEWS_"+ view.CERT) );
					Map<String, Object> sessionObj = JsonUtil.getMapFromJsonString(sessionString);
					if ( sessionObj.containsKey("PAGE_NO") && sessionObj.get("PAGE_NO") != null ) { 						
						view.PAGE_NO = (Map<String, Integer>) sessionObj.get("PAGE_NO");
					}  else {						
						view.PAGE_NO = new HashMap<String, Integer>();
					}					
					if ( sessionObj.containsKey("VALUES") && sessionObj.get("VALUES") != null ) { 			
						view.VALUES = (Map<String, String>) sessionObj.get("VALUES");
					}  else {						
						view.VALUES = new HashMap<String, String>();
					}				
					if ( sessionObj.containsKey("SAFES") && sessionObj.get("SAFES") != null ) { 
						view.SAFES = (Map<String, String>) sessionObj.get("SAFES");
					}  else {
						view.SAFES = new HashMap<String, String>();
					}					
				}
				
				if (!"".equals(unitCode) && unitCode.indexOf("|") > 0) {					
					String[] codeSplit = unitCode.split("\\|");
					int rowno = 0;
					for ( String item : codeSplit ) {
						switch(rowno) {						
						case 3 :			
							if ( view.PAGE_CD.isEmpty() ) { view.PAGE_CD = "EMPTY"; }						
							view.PAGE_NO.put( view.PAGE_CD, Integer.parseInt(item) );
							break;					
						}
						rowno++;
					}					
				}
				this.VIEW = view;
			}
		}		
		
		/**
		 * (Set) [Unit View] Function Name
		 * @return
		 */
		public void setFunc(String func) {
			this.getView().FUNC = func;
		}
		
		/**
		 * (Set) [Unit View] Page Code
		 * @return
		 */
		public void setPageCd(String pageCd) {
			this.getView().PAGE_CD = pageCd;
		}
		
		/**
		 * (Set) [Unit View] Page Paging Number
		 * @return
		 */
		public void setPageNo(int pageNo) {
			String pageCd = this.getView().PAGE_CD;
			if ( pageCd.isEmpty() ) { pageCd = "EMPTY"; }				
			this.getView().PAGE_NO.put(pageCd, pageNo);			
		}
		
		/**
		 * (Set) [Unit View] Get Parameters (ArrayList)
		 * @return
		 */
		public void setParams(List<String> param) {
			this.getView().PARAMS = param;				
		}
		
		/**
		 * (Set) [Unit View] Get Parameters (String Args)
		 * @return
		 */
		public void setParams(String... param) {		
			ArrayList<String> newVars = new ArrayList<String>();			
			for (String item : param) newVars.add(item);				
			this.getView().PARAMS = newVars;
		}
		
		/**
		 * (Set) [Unit View] Get Parameters (Add String)
		 * @return
		 */
		public void addParam(String param) {
			this.getView().PARAMS.add(param);
		}
		
		/**
		 * (Set) [Unit View] Get Parameters (Clear)
		 * @return
		 */
		public void clearParams() {
			this.getView().PARAMS.clear();
		}
		
		/**
		 * (Set) [Unit View] Global Parameters (HashMap)
		 * @return
		 */
		public void setValues(Map<String, String> values) {
			this.getView().VALUES = values;
			fnViews();
		}
				
		/**
		 * (Set) [Unit View] Global Parameters (Add Key & Value)
		 * @return
		 */
		public void setValue(String key, String value) {
			this.getView().VALUES.put(key, value);
			fnViews();
		}
		
		/**
		 * (Set) [Unit View] Global Parameters (Clear)
		 * @return
		 */
		public void clearValues() {
			this.getView().VALUES.clear();
			fnViews();
		}
		
		/**
		 * (Set) [Unit View] Secure Parameters (HashMap)
		 * @return
		 */
		public void setSafes(Map<String, String> values) {
			this.getView().SAFES = values;	
			fnViews();
		}
				
		/**
		 * (Set) [Unit View] Secure Parameters (Add Key & Value)
		 * @return
		 */
		public void setSafe(String key, String value) {
			this.getView().SAFES.put(key, value);
			fnViews();
		}
		
		/**
		 * (Set) [Unit View] Secure Parameters (Clear)
		 * @return
		 */
		public void clearSafes() {
			this.getView().SAFES.clear();
			fnViews();			
		}
		
		/**
		 * (Set) [Unit View] Page Variables (ArrayList)
		 * @return
		 */
		public void setVars(List<String> vars) {
			this.getView().VARS = vars;
		}
		
		/**
		 * (Set) [Unit View] Page Variables (String Args)
		 * @return
		 */
		public void setVars(String... vars) {		
			ArrayList<String> newVars = new ArrayList<String>();			
			for (String item : vars) newVars.add(item);				
			this.getView().VARS = newVars;
		}
		
		/**
		 * (Set) [Unit View] Page Variables (Add String)
		 * @return
		 */
		public void addVar(String var) {
			this.getView().VARS.add(var);
		}
		
		/**
		 * (Set) [Unit View] Page Variables (Clear)
		 * @return
		 */
		public void clearVars() {
			this.getView().VARS.clear();
		}
						
		/**
		 * (Set) [Unit User] User Append
		 * @param siteCd
		 * @param user
		 */
		@SuppressWarnings("unchecked")
		public void setUser(String siteCd, UserVO user) throws Exception {		
			Map<String, Object> unitUsers = new HashMap<String, Object>();
			if ( ((Map<String, Object>)RequestUtil.getSession()).containsKey("UNIT_USERS") ) {
				unitUsers = JsonUtil.getMapFromJsonString( EncryptUtil.decode(RequestUtil.getSession("UNIT_USERS").toString()) );
			}
			Map<String, Object> userMap = new HashMap<String, Object>();
			userMap.put("SSO_ID", user.SSO_ID);
			userMap.put("SSO_NM", user.SSO_NM);
			userMap.put("SSO_CD", user.SSO_CD);
			userMap.put("GRPS", user.GRPS);
			userMap.put("VARS", user.VARS);
			unitUsers.put(siteCd, userMap);
			RequestUtil.setSession("UNIT_USERS", EncryptUtil.encode( JsonUtil.getJsonStringFromMap(unitUsers) ) );	
		}
		
		/**
		 *  (Set) [Unit User] User Remove All
		 */
		public void clearUser() {
			RequestUtil.removeSession("UNIT_USERS");
		}
		@SuppressWarnings("unchecked")
		public void clearUser(String siteCd) {
			Map<String, Object> unitUsers = new HashMap<String, Object>();
			if ( ((Map<String, Object>)RequestUtil.getSession()).containsKey("UNIT_USERS") ) {
				unitUsers = JsonUtil.getMapFromJsonString( EncryptUtil.decode(RequestUtil.getSession("UNIT_USERS").toString()) );
			}
			if ( unitUsers.containsKey(siteCd)) {
				unitUsers.remove(siteCd);
			}			
		}		
		
		/**
		 * (Set) Controller Model&View
		 * @param sourceUri
		 * @return
		 */
		public ModelAndView setMV(String sourceUri) {
			return fnMV(new ModelAndView(sourceUri));
		}
		
		/**
		 * (Set) JSON Model&View
		 * @return
		 */
		public ModelAndView jsonMV() {
			return fnMV(new ModelAndView("jsonView"));
		}
		
		/**
		 * (Set) String Text Model&View (Not Used JSP)
		 * @param tx
		 * @return
		 */
		public ModelAndView stringMV(String tx) {			
			return new ModelAndView("unit", "string", tx);			
		}
		
		/**
		 * (Set) Redirect Model&View
		 * @param targetUrl
		 * @return
		 */
		public ModelAndView redirectMV(String targetUrl) {
			return new ModelAndView("redirect:"+ targetUrl);
		}
		
		/**
		 * (Set) UnitRVO 리턴값
		 * @return
		 */
		public UnitRVO setRV() {			
			UnitRVO rvo = new UnitRVO();
			rvo.setCode( this.getCode() );
			rvo.setMessage( this.getMessage() );
			rvo.setTarget( this.getTarget() );
			rvo.setVo( this.getIn() );
			return rvo;
		}
				
		// (공통) ModelAndView Return
		private ModelAndView fnMV(ModelAndView mv) {
			mv.addObject("uid", this.getUid());
			mv.addObject("code", this.getCode());
			mv.addObject("message", this.getMessage());
			mv.addObject("target", this.getTarget());
			mv.addObject("root", this.getRoot());
			mv.addObject("uri", this.getUri());
			mv.addObject("url", this.getUrl());
			mv.addObject("baseUrl", this.getBaseUrl());
			mv.addObject("in", this.getIn());
			mv.addObject("out", this.getOut());
			mv.addObject("view", this.getViews());
			mv.addObject("user", this.getUser());	
			this.MV = mv;
			return this.MV;
		}
		
		// (공통) Views 데이터를 Session에 저장
		private void fnViews() {			
			Map<String, Object> view = new HashMap<String, Object>();			
			view.put("PAGE_NO", this.getView().PAGE_NO);
			view.put("VALUES", this.getView().VALUES);
			view.put("SAFES", this.getView().SAFES);			
			RequestUtil.setSession("UNIT_VIEWS_"+ this.getView().CERT, JsonUtil.getJsonStringFromMap(view));
		}		
}



/**
 * Unit View
 * @author kwchoi
 *
 */
class VIEWS {
	// 고유키
	public String CERT = "";
	
	// 내부 실행 함수
	public String FUNC = "";
	
	// 내부 호출 페이지코드
	public String PAGE_CD = "";
	
	// 페이지 리스트 페이지 번호
	public Map<String, Integer> PAGE_NO = new HashMap<String, Integer>();		
	
	// 일회성 파라메터 데이터
	public List<String> PARAMS = new ArrayList<String>();
		
	// 파티션 공용 파라메터 데이터
	public Map<String, String> VALUES = new HashMap<String, String>();
	
	// 클래스 전용 파라메터 데이터
	public Map<String, String> SAFES = new HashMap<String, String>();
	
	// 페이지 전용 파라메터 데이터
	public List<String> VARS = new ArrayList<String>();
	
	public VIEWS() {
		this.CERT = "";
		this.FUNC = "";
		this.PAGE_CD = "EMPTY";
		this.PAGE_NO = new HashMap<String, Integer>();
		this.PARAMS = new ArrayList<String>();
		this.VALUES = new HashMap<String, String>();
		this.SAFES = new HashMap<String, String>();
		this.VARS = new ArrayList<String>();
	}
}