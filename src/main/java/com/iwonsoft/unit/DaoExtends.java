package com.iwonsoft.unit;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class DaoExtends {
	protected Log log = LogFactory.getLog(getClass());
    
    @Autowired
    private SqlSessionTemplate sqlSession;
     
    protected void printQueryInfo(String queryId, Object params) {
    	if ( log.isInfoEnabled() ) {
    		log.info( queryId +"\n\t- Params : "+ params);    	
    	}    	
    }
    
    public Object insert(String queryId, Object params){
    	printQueryInfo(queryId, params);
        return sqlSession.insert(queryId, params);
    }
     
    public Object update(String queryId, Object params){
    	printQueryInfo(queryId, params);
        return sqlSession.update(queryId, params);
    }
    
    /* 2019-12-18 업데이트 형식을 int형식으로 받기위해 추가함.*/
    public int update2(String queryId, Object params){
    	printQueryInfo(queryId, params);
        return sqlSession.update(queryId, params);
    }
     
    public Object delete(String queryId, Object params){
    	printQueryInfo(queryId, params);
        return sqlSession.delete(queryId, params);
    }
     
    public Object selectOne(String queryId){
    	printQueryInfo(queryId, null);
        return sqlSession.selectOne(queryId);
    }
     
    public Object selectOne(String queryId, Object params){
    	printQueryInfo(queryId, params);
        return sqlSession.selectOne(queryId, params);
    }
     
    @SuppressWarnings("rawtypes")
    public List selectList(String queryId){
    	printQueryInfo(queryId, null);
        return sqlSession.selectList(queryId);
    }
     
    @SuppressWarnings("rawtypes")
    public List selectList(String queryId, Object params){
    	printQueryInfo(queryId, params);
        return sqlSession.selectList(queryId,params);
    }
}
