package com.iwonsoft.unit;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserVO {
	
	// SSO 사용자 아이디
	public String SSO_ID = "";
	
	// SSO 사용자 이름
	public String SSO_NM = "";
	
	// SSO 사용자 구분 코드
	public String SSO_CD = "";
	
	// SSO 사용자 권한 그룹 리스트
	public List<String> GRPS = new ArrayList<String>();
	
	// SSO 사용자 전용 데이터
	public Map<String, String> VARS = new HashMap<String, String>();	
	
	
	
	public String getSsoId() {
		return this.SSO_ID;
	}
	
	public String getSsoNm() {
		return this.SSO_NM;
	}
	
	public String getSsoCd() {
		return this.SSO_CD;
	}
	
	public List<String> getGrps(){
		return this.GRPS;
	}
	
	public Map<String, String> getVars(){
		return this.VARS;
	}
	
	
	
	public void setSsoId(String ssoId) {
		this.SSO_ID = ssoId;
	}
	
	public void setSsoNm(String ssoNm) {
		this.SSO_NM = ssoNm;
	}
	
	public void setSsoCd(String ssoCd) {
		this.SSO_CD = ssoCd;
	}
	
	public void setGrps(List<String> grps) {
		this.GRPS = grps;
	}
	
	public void setVars(Map<String, String> vars) {
		this.VARS = vars;
	}
		
}
