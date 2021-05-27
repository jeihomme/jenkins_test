package com.iwonsoft.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.iwonsoft.unit.DaoExtends;

@Repository("UnitFileDAO")
public class UnitFileDAO extends DaoExtends {

	// 파일 업로드 > 전체 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileAll(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("unitFile.selectFileAll", map); 
	}
	
	// 파일 업로드 > 필드 리스트	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileField(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("unitFile.selectFileField", map); 
	}
	
	// 파일 업로드 > 파일 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFileDetail(Map<String, Object> map) throws Exception{
		return(Map<String, Object>)selectOne("unitFile.selectFileDetail", map);
	}
	
	// 파일 업로드 > 등록하기
	public void insertFileData(Map<String, Object> map) throws Exception{
		insert("unitFile.insertFileData", map); 
	}
	
	// 파일 업로드 > 삭제하기	
	public void deleteFileData(Map<String, Object> map) throws Exception{
		delete("unitFile.deleteFileData", map); 
	}
	
	// 파일 업로드 > 전체 삭제하기
	public void deleteFileAllData(Map<String, Object> map) throws Exception{
		delete("unitFile.deleteFileAllData", map); 
	}
}
