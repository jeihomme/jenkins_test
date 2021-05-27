package com.ppm.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.iwonsoft.unit.DaoExtends;

@Repository("QueryDAO")
public class QueryDAO extends DaoExtends {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectList(Map<String, Object> map, String group, String subject, String query) throws Exception { return selectList(group+subject+"."+query, map); }
	public int selectListCnt(Map<String, Object> map, String group, String subject, String query) throws Exception { return (int) selectOne(group+subject+"."+query, map); }
	@SuppressWarnings("unchecked")
	public  Map<String, Object> selectDetail(Map<String, Object> map, String group, String subject, String query) throws Exception { return (Map<String, Object>) selectOne(group+subject+"."+query, map); }
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCode(Map<String, Object> map, String group, String subject, String query) throws Exception { return selectList("code."+query, map); }
	@SuppressWarnings("unchecked")
	public  Map<String, Object> selectCheck(Map<String, Object> map, String group, String subject, String query) throws Exception { return (Map<String, Object>) selectOne(group+subject+"."+query, map); }
	public int insertData(Map<String, Object> map, String group, String subject, String query) throws Exception { return (Integer) insert(group+subject+"."+query, map); }
	public int updateData(Map<String, Object> map, String group, String subject, String query) throws Exception { return (Integer) update(group+subject+"."+query, map); }
	public int deleteData(Map<String, Object> map, String group, String subject, String query) throws Exception { return (Integer) delete(group+subject+"."+query, map); }
}



