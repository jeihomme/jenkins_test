package com.ppm.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ppm.dao.frontChatDAO;

@Service("frontChatService")
public class frontChatServiceImpl implements frontChatService {

	@Resource(name="frontChatDAO")
	private frontChatDAO frontChatDAO;
	
	// 채팅 > 리스트 조회
	@Override
	public List<Map<String, Object>> selectFrontChatList(Map<String, Object> map) throws Exception {	
		return frontChatDAO.selectFrontChatList(map);
	}
	
	// 채팅 > 텍스트 입력
	@Override
	public int insertFrontChatText(Map<String, Object> map) throws Exception {		
		return frontChatDAO.insertFrontChatText(map);
	}
	
	// 채팅 > 이미지 입력
	@Override
	public int insertFrontChatPicture(Map<String, Object> map) throws Exception {		
		return frontChatDAO.insertFrontChatPicture(map);
	}

}