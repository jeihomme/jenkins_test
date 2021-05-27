package com.iwonsoft.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("UnitFileService")
public class UnitFileServiceImpl implements UnitFileService {

	@Resource(name="UnitFileDAO")
	private UnitFileDAO unitFileDAO;
	
	// 파일 업로드 > 전체 리스트	
	@Override	
	public List<Map<String, Object>> selectFileAll(Map<String, Object> map) throws Exception {
		return unitFileDAO.selectFileAll(map);
	}

	// 파일 업로드 > 필드 리스트
	@Override
	public List<Map<String, Object>> selectFileField(Map<String, Object> map) throws Exception {
		return unitFileDAO.selectFileField(map);
	}
	
	// 파일 업로드 > 파일 상세보기
	@Override
	public Map<String, Object> selectFileDetail(Map<String, Object> map) throws Exception {
		return unitFileDAO.selectFileDetail(map);
	}

	// 파일 업로드 > 등록하기
	@Override
	public void insertFileData(Map<String, Object> map) throws Exception {
		unitFileDAO.insertFileData(map);
	}

	// 파일 업로드 > 삭제하기
	@Override
	public void deleteFileData(Map<String, Object> map) throws Exception {
		unitFileDAO.deleteFileData(map);
	}

	// 파일 업로드 > 전체 삭제하기	
	@Override
	public void deleteFileAllData(Map<String, Object> map) throws Exception {
		unitFileDAO.deleteFileAllData(map);
	}

}
