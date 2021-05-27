package com.ppm.service;

import java.util.List;
import java.util.Map;

public interface frontChatService {

	// 채팅 > 리스트 조회
	List<Map<String, Object>> selectFrontChatList ( Map<String, Object> map ) throws Exception;
	
	// 채팅 > 텍스트 입력
	public int  insertFrontChatText ( Map<String, Object> map ) throws Exception;
	
	// 채팅 > 이미지 입력
	public int  insertFrontChatPicture ( Map<String, Object> map ) throws Exception;
}