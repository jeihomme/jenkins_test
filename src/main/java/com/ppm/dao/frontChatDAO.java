package com.ppm.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.iwonsoft.unit.DaoExtends;

@Repository("frontChatDAO")
public class frontChatDAO extends DaoExtends {
	
	// 채팅 > 리스트 조회
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFrontChatList(Map<String, Object> map) throws Exception {
		return selectList("frontChat.selectFrontChatList", map);
	}
	
	// 채팅 > 텍스트 입력
	public int insertFrontChatText(Map<String, Object> map) throws Exception{
		return (Integer)insert("frontChat.insertFrontChatText", map); 
	}
	
	// 채팅 > 이미지 입력
	public int insertFrontChatPicture(Map<String, Object> map) throws Exception{
		return (Integer)insert("frontChat.insertFrontChatPicture", map); 
	}	
}
