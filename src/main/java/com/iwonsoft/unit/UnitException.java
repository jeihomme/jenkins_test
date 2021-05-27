package com.iwonsoft.unit;

import java.util.HashMap;
import java.util.Map;

public class UnitException extends RuntimeException {
	
		private static final long serialVersionUID = 1L;

		
		// [상태 코드] 응답 코드 (0000:정상)
		private String CODE = "0000";
		
		// [상태 코드] 응답 메세지
		private String MESSAGE = "";
		
		// [상태 코드] 응답 대상
		private String TARGET = "";
		
		// [상태 코드] UnitVO 데이터
		private Map<String, Object> VO = new HashMap<String, Object>();
		
		// [서버 코드] 서버 상태 코드
		private int HTTP_STATUS = 200;
		
		// [서버 코드] 서버 상태 메세지
		private String HTTP_REASON = "";
		
		
		// Get Method
		public String getCode() {
			return CODE;
		}
		@Override
		public String getMessage() {
			return MESSAGE;
		}
		public String getTarget() {
			return TARGET;
		}
		public Map<String, Object> getVo() {
			return VO;
		}
		public int getHttpStatus() {
			return HTTP_STATUS;
		}
		public String getHttpReason() {
			return HTTP_REASON;
		}
		
				
		// Set Method
		public void setCode(String code) {
			this.CODE = code;
		}
		public void setMessage(String message) {
			this.MESSAGE = message;
		}
		public void setTarget(String target) {
			this.TARGET = target;
		}
		public void setVo(Map<String, Object> vo) {
			this.VO = vo;
		}
		public void setHttpStatus(int httpStatus) {
			this.HTTP_STATUS = httpStatus;
		}
		public void setHttpReason(String httpReason) {
			this.HTTP_REASON = httpReason;
		}
		
				
		// Setting Method
		public UnitException(String code, String message, String target, Map<String, Object> vo) {
			this.CODE = code;
			this.MESSAGE = message;
			this.TARGET = target;
			if ( vo != null ) {
				this.VO = new HashMap<String, Object>(vo);
			}
		}
}
