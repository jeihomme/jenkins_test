package com.iwonsoft.unit;

import java.util.HashMap;
import java.util.Map;

public class UnitRVO {

	// [상태 코드] 응답 코드 (0000:정상)
	private String CODE = "0000";
	
	// [상태 코드] 응답 메세지
	private String MESSAGE = "";
	
	// [상태 코드] 응답 대상
	private String TARGET = "";
	
	// [상태 코드] UnitVO 데이터
	private Map<String, Object> VO = new HashMap<String, Object>();
	
	
	
	
	
	// Get Method
	public String getCode() {
		return CODE;
	}
	public String getMessage() {
		return MESSAGE;
	}
	public String getTarget() {
		return TARGET;
	}
	public Map<String, Object> getVo() {
		return VO;
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
}
