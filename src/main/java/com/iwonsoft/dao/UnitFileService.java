package com.iwonsoft.dao;

import java.util.List;
import java.util.Map;

public interface UnitFileService {
	
	// 파일 업로드 > 전체 리스트	
    public List<Map<String, Object>> selectFileAll( Map<String, Object> map ) throws Exception;	
	
	// 파일 업로드 > 필드 리스트	
    public List<Map<String, Object>> selectFileField( Map<String, Object> map ) throws Exception;
    
    // 파일 업로드 > 파일 상세보기
    public Map<String, Object> selectFileDetail( Map<String, Object> map ) throws Exception;
 
	// 파일 업로드 > 등록하기
    public void insertFileData( Map<String, Object> map ) throws Exception;
 
	// 파일 업로드 > 삭제하기	
    public void deleteFileData( Map<String, Object> map ) throws Exception;
	
	// 파일 업로드 > 전체 삭제하기
    public void deleteFileAllData( Map<String, Object> map ) throws Exception;

}
