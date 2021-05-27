package com.ppm.service;

import java.util.List;
import java.util.Map;

public interface QueryService {

	List<Map<String, Object>> selectList ( Map<String, Object> map, String group, String subject, String query ) throws Exception;
	int selectListCnt ( Map<String, Object> map, String group, String subject, String query ) throws Exception;
	Map<String, Object> selectDetail ( Map<String, Object> map, String group, String subject, String query ) throws Exception;
	List<Map<String, Object>> selectCode ( Map<String, Object> map, String group, String subject, String query ) throws Exception;
	Map<String, Object> selectCheck ( Map<String, Object> map, String group, String subject, String query ) throws Exception;
	public int  insertData ( Map<String, Object> map, String group, String subject, String query ) throws Exception;
	public int updateData ( Map<String, Object> map, String group, String subject, String query ) throws Exception;
	public int deleteData(Map<String, Object> map, String group, String subject, String query ) throws Exception;
}
