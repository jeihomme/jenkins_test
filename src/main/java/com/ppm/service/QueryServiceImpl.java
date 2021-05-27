package com.ppm.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ppm.dao.QueryDAO;

@Service("QueryService")
public class QueryServiceImpl implements QueryService {

	@Resource(name="QueryDAO")
	private QueryDAO QueryDAO;

	@Override
	public List<Map<String, Object>> selectList(Map<String, Object> map, String group, String subject, String query) throws Exception { return QueryDAO.selectList(map, group, subject, query); }
	@Override
	public int selectListCnt(Map<String, Object> map, String group, String subject, String query) throws Exception { return QueryDAO.selectListCnt(map, group, subject, query); }
	@Override
	public Map<String, Object> selectDetail(Map<String, Object> map, String group, String subject, String query) throws Exception { return QueryDAO.selectDetail(map, group, subject, query); }
	@Override
	public List<Map<String, Object>> selectCode(Map<String, Object> map, String group, String subject, String query) throws Exception { return QueryDAO.selectCode(map, group, subject, query); }
	@Override
	public Map<String, Object> selectCheck(Map<String, Object> map, String group, String subject, String query) throws Exception { return QueryDAO.selectCheck(map, group, subject, query); }
	@Override
	public int insertData(Map<String, Object> map, String group, String subject, String query) throws Exception { return QueryDAO.insertData(map, group, subject, query); }
	@Override
	public int updateData(Map<String, Object> map, String group, String subject, String query) throws Exception {return QueryDAO.updateData(map, group, subject, query); }
	@Override
	public int deleteData(Map<String, Object> map, String group, String subject, String query) throws Exception {return QueryDAO.deleteData(map, group, subject, query); }
}
