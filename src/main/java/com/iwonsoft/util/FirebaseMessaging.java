package com.iwonsoft.util;

import java.io.File;
import java.io.FileInputStream;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.filefilter.TrueFileFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;

import net.minidev.json.JSONObject;

public class FirebaseMessaging {
	
	private static final Logger logger = LoggerFactory.getLogger(FirebaseMessaging.class);
	
	// 인증키 JSON파일 경로
	private String KeyFilePath = "";	
	
	// FMC 프로젝트 ID (인증키 JSON 파일 이름으로 열람)
	private String ProjectId = "";
	
	/***
	 * 코드 진입점
	 */
	public FirebaseMessaging() {	
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder .getRequestAttributes()).getRequest();
		String keyDir = request.getSession().getServletContext().getRealPath("/WEB-INF/classes/google/");
		for (File file : FileUtils.listFiles(new File(keyDir), TrueFileFilter.INSTANCE, TrueFileFilter.INSTANCE)) {
			if ( file.getName().indexOf(".json") > 0 ) {
				this.KeyFilePath =request.getSession().getServletContext().getRealPath("/WEB-INF/classes/google/"+file.getName());
				this.ProjectId = file.getName().substring(0, file.getName().indexOf("-firebase-adminsdk"));
			}			
        }		
	}
	
	/***
	 * FMC 발송하기
	 * @param MsgTitle : 발송 메세지 타이틀(선택)
	 * @param MsgBody : 발송 메세지(필수)
	 * @param DiviceToken : 사용자 디바이스 토큰(필수)
	 * @throws Exception
	 */
	public void send(String MsgTitle, String MsgBody, String DiviceToken) throws Exception {
		boolean valid = true;
		String validRsn = "";
		
		System.out.println("@@@ FMC Message :: Call Firebase Send()" );
		
		if ( StringUtil.isNull(this.ProjectId) ) { valid = false; validRsn = "fmc error : Project ID undefined"; }
		if ( StringUtil.isNull(MsgBody) ) { valid = false; validRsn = "fmc error : Message undefined"; }
		if ( StringUtil.isNull(DiviceToken) ) { valid = false; validRsn = "fmc error : User Device Token undefined"; }
		if ( StringUtil.null2void(DiviceToken).length() < 100 ) { valid = false; validRsn = "fmc error : User Device Token Too many Shorted"; }
		
		if ( valid ) {
	        try {
	            String MESSAGING_SCOPE = "https://www.googleapis.com/auth/firebase.messaging";
	            String[] SCOPES = { MESSAGING_SCOPE };
	            
	            GoogleCredential googleCredential = GoogleCredential
	                                .fromStream(new FileInputStream(this.KeyFilePath))
	                                .createScoped(Arrays.asList(SCOPES));
	            googleCredential.refreshToken();
	            
	            HttpHeaders headers = new HttpHeaders();
	            headers.add("content-type" , MediaType.APPLICATION_JSON_VALUE );
	            headers.add("Authorization", "Bearer " + googleCredential.getAccessToken());
	            
	            JSONObject notification = new JSONObject();
	            notification.put("title", MsgTitle);
	            notification.put("body", MsgBody);            
	            
	            JSONObject message = new JSONObject();
	            message.put("token", DiviceToken);
	            message.put("notification", notification);
	            
	            JSONObject jsonParams = new JSONObject();
	            jsonParams.put("message", message);
	            
	            HttpEntity<JSONObject> httpEntity = new HttpEntity<JSONObject>(jsonParams, headers);
	            RestTemplate rt = new RestTemplate(); 
	            
	            ResponseEntity<String> res = rt.exchange("https://fcm.googleapis.com/v1/projects/"+ this.ProjectId +"/messages:send"
	                    , HttpMethod.POST
	                    , httpEntity
	                    , String.class);
	        
	            if (res.getStatusCode() != HttpStatus.OK) {
	            	logger.debug("FCM-Exception");
	            	logger.debug(res.getStatusCode().toString());
	            	logger.debug(res.getHeaders().toString());
	            	logger.debug(res.getBody().toString());
	            	
	            	System.out.println("------------------------------------------------------------------------");
	            	System.out.println("| Firebase Messaging Clude Service :: Failure");
	            	System.out.println("------------------------------------------------------------------------");
	            	System.out.println(res.getStatusCode().toString());
	            	System.out.println(res.getHeaders().toString());
	            	System.out.println(res.getBody().toLowerCase()); 
	            	System.out.println("------------------------------------------------------------------------");
	                
	            } else {
	            	logger.debug(res.getStatusCode().toString());
	            	logger.debug(res.getHeaders().toString());
	            	logger.debug(res.getBody().toLowerCase()); 
	            	
	            	System.out.println("------------------------------------------------------------------------");
	            	System.out.println("| Firebase Messaging Clude Service :: Success");
	            	System.out.println("------------------------------------------------------------------------");
	            	System.out.println(res.getStatusCode().toString());
	            	System.out.println(res.getHeaders().toString());
	            	System.out.println(res.getBody().toLowerCase()); 
	            	System.out.println("------------------------------------------------------------------------");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		} else {
			logger.debug(validRsn);
			System.out.println("FMC Error : "+ validRsn);
		}
    }
}
