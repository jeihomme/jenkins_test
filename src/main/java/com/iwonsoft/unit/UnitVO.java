package com.iwonsoft.unit;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.iwonsoft.util.ObjectUtil;

/**
 * UnitVO I/O함수
 * @author iwonsoft
 * @기능 Convert, Validation
 */
public class UnitVO {
	
	// Input Object
	private Map<String, Object> IN_VO = new HashMap<String, Object>();	
	
	// Output Object
	private List<Map<String, Object>> OUT_VO = new ArrayList<Map<String, Object>>();
	
	// Output 페이징
	private PAGES OUT_PAGE = new PAGES();
	
		
	
	/**
	 * Unit VO 진입점
	 */
	public UnitVO () {
		this.IN_VO = new HashMap<String, Object>();
	}
	
	/**
	 * Unit VO 진입점
	 * @param map
	 */
	public UnitVO (Map<String, Object> map) {		
		if ( map == null ) { return; }		
		for( String key : map.keySet() ){			
			this.set( key.trim(), map.get(key) );	
        }		
	}

	
	/**
	 * [Get] Input Value 
	 * @param key
	 * @return
	 */
	public String get(String key) {
		if ( key == null ) { return ""; }
		if ( key.trim() == "" ) { return ""; }		
		return IN_VO.get(key) == null ? "" : String.valueOf(IN_VO.get(key)).trim();
	}
	
	/**
	 *  [Get] Input List Value 
	 * @param key
	 * @return
	 */	
	public List<String> getList(String key){
		List<String> result = new ArrayList<String>();
		if ( key == null ) { return null; }
		if ( key.trim() == "" ) { return null; }		
		if ( IN_VO.containsKey(key+"[]") ) {
			for ( String itemVal : (String[])IN_VO.get(key+"[]") ) {
				result.add(itemVal);
			}			
		}		
		return result;
	}
	
	/**
	 * [Get] All Input Value 
	 * @return
	 */
	public Map<String, Object> getAll() {
		return IN_VO;
	}
	
	/**
	 * [Get] All Input Params
	 * @return
	 */
	public Map<String, Object> getParam() {
		this.getPaging();
		Map<String, Object> result = new HashMap<String, Object>();
		for( String key : this.IN_VO.keySet() ){
			result.put( fnParam( key.trim() ), IN_VO.get(key).toString() );	
        }
		return result;
	}
	
	/**
	 * [Get] All Output Value
	 * @return
	 */
	public Map<String, Object> getDao() {
		Map<String, Object> outMap = new HashMap<String, Object>();
		outMap.put("paging", this.getPaging());
		outMap.put("data", this.OUT_VO);
		return outMap;
	}
	
	/**
	 * [Get] Single Output Values
	 * @param index
	 * @return
	 */
	public Map<String, Object> getDao(int index){
		Map<String, Object> result = new HashMap<String, Object>();
		if ( this.OUT_VO != null ) {
			if ( this.OUT_VO.size() > index ) {
				result = this.OUT_VO.get(index);
			}
		}		
		return result;
	}
	
	/**
	 * [Get] Single Output Value
	 * @param index
	 * @param key
	 * @return
	 */
	public String getDao(int index, String key) {
		String result = "";
		Map<String, Object> getData = this.getDao(index);
		if ( getData != null ) {
			if ( getData.containsKey(key) ) {
				result = getData.get(key).toString();
			}
		}
		return result;
	}
	
	/**
	 *  [Get] List Output Value
	 * @return
	 */
	public List<Map<String, Object>> getDaoList(){
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		if ( this.OUT_VO != null ) {			
			result = this.OUT_VO;		
		}
		return result;
	}
	
	/**
	 * [Get] List Output Size
	 * @return
	 */
	public int getDaoSize() {
		int result = 0;
		if ( this.OUT_VO != null ) {		
			result = this.OUT_VO.size();
		} else {
			result = 0;
		}
		return result;
	}
	
	/**
	 * [Get Paging] Paging Data
	 * @return
	 */
	public Map<String, Object> getPaging(){
		this.fnPaging();
		return ObjectUtil.objectToMap(OUT_PAGE);
	}
	
	/**
	 * [Get Paging] Total Count
	 * @return
	 */
	public int totalCnt() {
		return this.OUT_PAGE.totalCnt;
	}
	
	/**
	 * [Get Paging] This Page No
	 * @return
	 */
	public int thisPage() {
		return this.OUT_PAGE.thisPage;
	}
	
	/**
	 * [Get Paging] List RowLine Size
	 * @return
	 */
	public int rowSize() {
		return this.OUT_PAGE.rowSize;		
	}
	
	/**
	 * [Get Paging] Paging Count Size
	 * @return
	 */
	public int pageSize() {
		return this.OUT_PAGE.pageSize;
	}
	
	
	
	
	
	/**
	 * [Set] Input Value 
	 * @param key
	 * @param value
	 */
	public void set(String key, Object value) {
		if ( key == null || value == null ) { return; }
		if ( key.trim() == "" ) { return; }			
		this.IN_VO.put( key.trim(), value );
	}
	
	/**
	 * [Set] All Input Value 
	 * @param map
	 */
	public void setAll(Map<String, ?> map) {
		if ( map == null ) { return; }
		for( String key : map.keySet() ){
			this.set( key.trim(), map.get(key) );
        }
	}
	
	/**
	 * [Set] Output Data
	 * @param map
	 */
	public void setDao(Map<String, Object> map) {
		this.fnPaging();
		if ( map != null ) {
			List<Map<String, Object>> listMap = new ArrayList<Map<String, Object>>();
			listMap.add(map);
			this.OUT_VO = listMap;
		}
	}
	/**
	 * [Set] Output Data
	 * @param listMap
	 */
	public void setDao(List<Map<String, Object>> listMap) {
		this.fnPaging();
		this.OUT_VO = listMap;
	}	
		
	/**
	 * [Set Paging] Total Count
	 * @return
	 */
	public void totalCnt(int totalCnt) {
		this.OUT_PAGE.totalCnt = totalCnt;
		this.fnPaging();
	}
	
	/**
	 * [Set Paging] This Page No
	 * @return
	 */
	public void thisPage(int thisPage) {
		this.OUT_PAGE.thisPage = thisPage;
		this.fnPaging();
	}
	
	/**
	 * [Set Paging] List RowLine Size
	 * @return
	 */
	public void rowSize(int rowSize) {
		this.OUT_PAGE.rowSize = rowSize;
		this.fnPaging();
	}
	
	/**
	 * [Set Paging] Paging Count Size
	 * @return
	 */
	public void pageSize(int pageSize) {
		this.OUT_PAGE.pageSize = pageSize;
		this.fnPaging();
	}
	
	/**
	 * [Set Paging] All Data Rows
	 */
	public void rowAll() {
		this.OUT_PAGE.thisPage = 1;		
		this.OUT_PAGE.pageSize = 1;
		this.OUT_PAGE.rowSize = 99999;
		this.OUT_PAGE.totalCnt = 99999;
		this.fnPaging();
	}
	
	
	
	/**
	 * [String] Trim
	 * @param key
	 */
	public void trim(String key) {
		if ( key == null ) { return; }
		if ( key.trim() == "" ) { return; }		
		String value = this.get(key).trim();
		this.IN_VO.put( key.trim(), value );
	}
	
	/**
	 * [String] Replace
	 * @param key
	 * @param oriTxt
	 * @param repTxt
	 */
	public void replace(String key, String oriTxt, String repTxt) {
		String value = this.get(key).trim();
		if ( ! value.trim().equals("") ){
			this.set(key, value.replaceAll(oriTxt, repTxt));
		}	
	}
	
	
	
	
	
	/**
	 * [Convert] Number Only
	 * @param key
	 */
	public void cvNumber(String key) {
		if ( key == null ) { return; }
		if ( key.trim() == "" ) { return; }		
		String value = this.get(key).replaceAll("[^0-9]", "");
		this.IN_VO.put( key.trim(), value );
	}
	
	/**
	 * [Convert] Equal Text Replace
	 * @param key
	 * @param oriTxt
	 * @param repTxt
	 */
	public void cvEq(String key, String oriTxt, String repTxt) {
		String value = this.get(key).trim().toUpperCase();		
		if ( value.trim().equals(oriTxt.toUpperCase()) ){
			this.set(key, repTxt);
		}
	}
	
	/**
	 * [Convert] Not Equal Text Replace
	 * @param key
	 * @param oriTxt
	 * @param repTxt
	 */
	public void cvNe(String key, String oriTxt, String repTxt) {
		String value = this.get(key).trim().toUpperCase();	
		if ( ! value.trim().equals(oriTxt.toUpperCase()) ){
			this.set(key, repTxt);
		}
	}
	
	/**
	 * [Convert] String toLowerCase
	 * @param key
	 */
	public void cvLCase(String key) {
		this.set(key, this.get(key).trim().toLowerCase() );
	}
	
	/**
	 * [Convert] String toUpperCase
	 * @param key
	 */
	public void cvUCase(String key) {
		this.set(key, this.get(key).trim().toUpperCase() );
	}
	
	
	
	/**
	 * [Exception :: Custom] Move URL
	 * @param targetURL
	 * @param viewCode
	 * @param msg
	 * @param params
	 */
	public void move (String targetURL, String viewCode, String msg, String... params) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder .getRequestAttributes()).getRequest();
		if ( !targetURL.startsWith(request.getContextPath()) ) {
			targetURL = request.getContextPath() + targetURL;
		}		
		String moveUrl = PageUtil.url(targetURL, viewCode, params);
		throw new UnitException("0002", msg, moveUrl, this.getAll());
	}
		
	
	
	
	
	/**
	 * [Exception :: Custom] Custom Exception
	 * @param msg
	 */
	public void message (String msg) {		
		this.message (msg, "");
	}
	/**
	 * [Exception :: Custom] Custom Exception
	 * @param msg
	 * @param target
	 */
	public void message (String msg, String target) {
		throw new UnitException("1000", msg, target, this.getAll());	
	}
	
	
	
	
	
	/**
	 * [Exception :: Check] Empty Check
	 * @param key
	 * @param msg
	 */
	public void isEmpty(String key, String msg) {	
		this.isEmpty(key, msg, key);
	}
	/**
	 * [Exception :: Check] Empty Check
	 * @param key
	 * @param msg
	 * @param target
	 */
	public void isEmpty(String key, String msg, String target) {	
		String value = this.get(key).trim();
		if ( value.trim().equals("") ){
			throw new UnitException("1110", msg, target, this.getAll());		
		}	
	}
	
	/**
	 * [Exception :: Check] Value Equals Check
	 * @param key
	 * @param val
	 * @param msg
	 * @param target
	 */
	public void isEq(String key, String val, String msg) {
		this.isEq(key, val, msg, key);
	}
	/**
	 * [Exception :: Check] Value Equals Check
	 * @param key
	 * @param val
	 * @param msg
	 */
	public void isEq(String key, String val, String msg, String target) {
		String value = this.get(key).trim().toUpperCase();
		if ( value.equals(val.toUpperCase()) ) {
			throw new UnitException("1111", msg, key, this.getAll());
		}
	}
	
	/**
	 * [Exception :: Check] Value Not Equals Check
	 * @param key
	 * @param val
	 * @param msg
	 */
	public void isNe(String key, String val, String msg) {
		this.isNe(key, val, msg, key);
	}
	/**
	 * [Exception :: Check] Value Not Equals Check
	 * @param key
	 * @param val
	 * @param msg
	 * @param target
	 */
	public void isNe(String key, String val, String msg, String target) {
		String value = this.get(key).trim().toUpperCase();
		if ( !value.equals(val.toUpperCase()) ) {
			throw new UnitException("1112", msg, key, this.getAll());
		}
	}
	
	/**
	 * [Exception :: Check] Two Values Equals Check
	 * @param key1
	 * @param key2
	 * @param msg
	 */
	public void isEquals(String key1, String key2, String msg) {
		this.isEquals(key1, key2, msg, key2);
	}
	/**
	 * [Exception :: Check] Two Values Equals Check
	 * @param key1
	 * @param key2
	 * @param msg
	 * @param target
	 */
	public void isEquals(String key1, String key2, String msg, String target) {
		String value1 = this.get(key1).trim();
		String value2 = this.get(key2).trim();
		if ( !value1.equals(value2) ) {
			throw new UnitException("1113", msg, target, this.getAll());	
		}
	}
	
	/**
	 * [Exception :: Check] Password Type Check
	 * @param key
	 * @param msg
	 */
	public void  isPassword (String key, String msg) {
		this.isPassword(key, msg, key);
	}
	/**
	 * [Exception :: Check] Password Type Check
	 * @param key
	 * @param msg
	 * @param target
	 */
	public void  isPassword (String key, String msg, String target) {
		String value = this.get(key).trim();
		String expPattern = "([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])";		
		Matcher matcher = Pattern.compile(expPattern).matcher(value);
		if(!matcher.matches()){
			throw new UnitException("1114", msg, target, this.getAll());	
		}		
	}
	
	/**
	 * [Exception :: Check] Hangle Type Check
	 * @param key
	 * @param msg
	 */
	public void  isHangle (String key, String msg) {	
		this.isHangle(key, msg, key);
	}
	/**
	 * [Exception :: Check] Hangle Type Check
	 * @param key
	 * @param msg
	 * @param target
	 */
	public void  isHangle (String key, String msg, String target) {	
		String value = this.get(key).trim();
		String expPattern = "(^[가-힣]*$)";		
		Matcher matcher = Pattern.compile(expPattern).matcher(value);
		if(!matcher.matches()){
			throw new UnitException("1115", msg, target, this.getAll());	
		}
	}
	
	/**
	 * [Exception :: Check] Email Type Check
	 * @param key
	 * @param msg
	 */
	public void isEmail (String key, String msg) {
		this.isEmail(key, msg, key);
	}
	/**
	 * [Exception :: Check] Email Type Check
	 * @param key
	 * @param msg
	 * @param target
	 */
	public void isEmail (String key, String msg, String target) {
		String value = this.get(key).trim();
		String expPattern = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
		Matcher matcher = Pattern.compile(expPattern).matcher(value);
		if(!matcher.matches()){
			throw new UnitException("1116", msg, target, this.getAll());	
		}		
	}
	
	/**
	 * [Exception :: Check] HTML Tag Type Check
	 * @param key
	 * @param msg
	 */
	public void isTag (String key, String msg) {
		this.isTag(key, msg, key);
	}
	/**
	 * [Exception :: Check] HTML Tag Type Check
	 * @param key
	 * @param msg
	 * @param target
	 */
	public void isTag (String key, String msg, String target) {
		String value = this.get(key).trim();		
		String expPattern = "<[^>]*>";
		Matcher matcher = Pattern.compile(expPattern).matcher(value);
		if(matcher.matches()){
			throw new UnitException("1117", msg, target, this.getAll());	
		}
	}
		
	
	
	
	/**
	 * [Exception :: Length] String Length Check (Fixed Length)
	 * @param key
	 * @param len
	 * @param msg
	 */
	public void fixLength(String key, Integer len, String msg) {
		this.fixLength(key, len, msg, key);
	}
	/**
	 * [Exception :: Length] String Length Check (Fixed Length)
	 * @param key
	 * @param len
	 * @param msg
	 * @param target
	 */
	public void fixLength(String key, Integer len, String msg, String target) {
		String value = this.get(key).trim();
		if ( value.trim().length() != len ){	
			throw new UnitException("1121", msg, target, this.getAll());	
		}
	}
	
	/**
	 * [Exception :: Length] String Length Check (Minimun Length)
	 * @param key
	 * @param len
	 * @param msg
	 */
	public void minLength(String key, Integer len, String msg) {
		this.minLength(key, len, msg, key);
	}
	/**
	 * [Exception :: Length] String Length Check (Minimun Length)
	 * @param key
	 * @param len
	 * @param msg
	 * @param target
	 */
	public void minLength(String key, Integer len, String msg, String target) {
		String value = this.get(key).trim();
		if ( value.trim().length() < len ){	
			throw new UnitException("1122", msg, target, this.getAll());	
		}
	}
	
	/**
	 * [Exception :: Length] String Length Check (Maximum Length)
	 * @param key
	 * @param len
	 * @param msg
	 */
	public void maxLength(String key, Integer len, String msg) {
		this.maxLength(key, len, msg, key);
	}
	/**
	 * [Exception :: Length] String Length Check (Maximum Length)
	 * @param key
	 * @param len
	 * @param msg
	 * @param target
	 */
	public void maxLength(String key, Integer len, String msg, String target) {
		String value = this.get(key).trim();
		if ( value.trim().length() > len ){	
			throw new UnitException("1123", msg, target, this.getAll());	
		}
	}
	


	
	/**
	 * [Exception :: Number] Number Value Check (Number Equals)
	 * @param key
	 * @param Num
	 * @param msg
	 */
	public void fixNumber(String key, Integer Num, String msg) {
		this.fixNumber(key, Num, msg, key);
	}
	/**
	 * [Exception :: Number] Number Value Check (Number Equals)
	 * @param key
	 * @param Num
	 * @param msg
	 * @param target
	 */
	public void fixNumber(String key, Integer Num, String msg, String target) {
		String value = this.get(key).trim();
		if ( Integer.parseInt(value) != Num ){
			throw new UnitException("1131", msg, target, this.getAll());	
		}
	}
	
	/**
	 * [Exception :: Number] Number Value Check (Number Min Round)
	 * @param key
	 * @param Num
	 * @param msg
	 */
	public void minNumber(String key, Integer Num, String msg) {
		this.minNumber(key, Num, msg, key);
	}
	/**
	 * [Exception :: Number] Number Value Check (Number Min Round)
	 * @param key
	 * @param Num
	 * @param msg
	 * @param target
	 */
	public void minNumber(String key, Integer Num, String msg, String target) {
		String value = this.get(key).trim();
		if ( Integer.parseInt(value) < Num ){	
			throw new UnitException("1132", msg, target, this.getAll());	
		}
	}
	
	/**
	 * [Exception :: Number] Number Value Check (Number Max Round)
	 * @param key
	 * @param Num
	 * @param msg
	 */
	public void maxNumber(String key, Integer Num, String msg) {
		this.maxNumber(key, Num, msg, key);
	}
	/**
	 * [Exception :: Number] Number Value Check (Number Max Round)
	 * @param key
	 * @param Num
	 * @param msg
	 * @param target
	 */
	public void maxNumber(String key, Integer Num, String msg, String target) {
		String value = this.get(key).trim();
		if ( Integer.parseInt(value) > Num ){	
			throw new UnitException("1133", msg, target, this.getAll());	
		}
	}
		


	
	
	/**
	 * [Exception :: Count] Array Values Count Check (Count Fixed)
	 * @param key
	 * @param Cnt
	 * @param msg
	 */
	public void fixCount(String key, Integer Cnt, String msg) {
		this.fixCount(key, Cnt, msg, key);
	}
	/**
	 * [Exception :: Count] Array Values Count Check (Count Fixed)
	 * @param key
	 * @param Cnt
	 * @param msg
	 * @param target
	 */
	public void fixCount(String key, Integer Cnt, String msg, String target) {
		if ( key == null ) { return; }
		if ( key.trim() == "" ) { return; }
		int valCnt = 0;
		if ( IN_VO.get(key) instanceof String[] ){	
			valCnt = ( (String[])IN_VO.get(key) ).length;
		} else if ( IN_VO.get(key) instanceof String ){	
			valCnt = 1;
		}
		if ( valCnt != Cnt ) {
			throw new UnitException("1141", msg, target, this.getAll());	
		}		
	}
	
	/**
	 * [Exception :: Count] Array Values Count Check (Count Minimum)
	 * @param key
	 * @param Cnt
	 * @param msg
	 */
	public void minCount(String key, Integer Cnt, String msg) {
		this.minCount(key, Cnt, msg, key);
	}
	/**
	 * [Exception :: Count] Array Values Count Check (Count Minimum)
	 * @param key
	 * @param Cnt
	 * @param msg
	 * @param target
	 */
	public void minCount(String key, Integer Cnt, String msg, String target) {
		if ( key == null ) { return; }
		if ( key.trim() == "" ) { return; }
		int valCnt = 0;
		if ( IN_VO.get(key) instanceof String[] ){	
			valCnt = ( (String[])IN_VO.get(key) ).length;
		} else if ( IN_VO.get(key) instanceof String ){	
			valCnt = 1;
		}
		if ( valCnt < Cnt ) {
			throw new UnitException("1142", msg, target, this.getAll());	
		}		
	}
	
	/**
	 * [Exception :: Count] Array Values Count Check (Count Maximum)
	 * @param key
	 * @param Cnt
	 * @param msg
	 */
	public void maxCount(String key, Integer Cnt, String msg) {
		this.maxCount(key, Cnt, msg, key);
	}
	/**
	 * [Exception :: Count] Array Values Count Check (Count Maximum)
	 * @param key
	 * @param Cnt
	 * @param msg
	 * @param target
	 */
	public void maxCount(String key, Integer Cnt, String msg, String target) {
		if ( key == null ) { return; }
		if ( key.trim() == "" ) { return; }
		int valCnt = 0;
		if ( IN_VO.get(key) instanceof String[] ){	
			valCnt = ( (String[])IN_VO.get(key) ).length;
		} else if ( IN_VO.get(key) instanceof String ){	
			valCnt = 1;
		}
		if ( valCnt > Cnt ) {
			throw new UnitException("1143", msg, target, this.getAll());	
		}		
	}	
	
	
	
	
	
	// [Function] DAO에 사용하는 변수명
	private String fnParam(String key) {
		if ( key == null ) { return ""; }
		if ( "".equals(key) ) { return ""; }
		String result = "";
		if ( key.indexOf("_") > 0 ) {			
			String[] keyArr = key.split("_");
			for( String item : keyArr ) {
				if ( item.length() == 1 ) {
					result += item.toUpperCase();
				} else if ( item.length() > 1 ) {
					result += item.substring(0,1).toUpperCase() + item.substring(1).toLowerCase();
				}
			}
			result = result.substring(0, 1).toLowerCase() + result.substring(1);
		} else {		
			if ( key.toUpperCase().equals(key) ) {
				result = key.toLowerCase();
			} else {
				result = key;
			}			
		}		
		return result;
	}	
	
	// [Function] OUT_PAGE Setting
	private void fnPaging() {
		// 데이터가 없으면 기본값으로 리턴
		if ( this.OUT_PAGE.totalCnt == 0 ) { 
			this.IN_VO.put("startRow", this.OUT_PAGE.startRow );
			this.IN_VO.put("endRow", this.OUT_PAGE.endRow );
			return;			
		}
		// 마지막 페이지
		this.OUT_PAGE.lastPage = (this.OUT_PAGE.totalCnt + (this.OUT_PAGE.rowSize - 1)) / this.OUT_PAGE.rowSize;		
		// 현재 페이지가 1보다 작거나 마지막 페이지 보다 큰 경우
		if (this.OUT_PAGE.thisPage < 1){ this.OUT_PAGE.thisPage = 1; }
		if (this.OUT_PAGE.thisPage > this.OUT_PAGE.lastPage) { this.OUT_PAGE.thisPage = this.OUT_PAGE.lastPage; }		
		// 쿼리에서 사용되는 데이터 로우 계산
		this.OUT_PAGE.endRow = this.OUT_PAGE.thisPage * this.OUT_PAGE.rowSize;
		this.OUT_PAGE.startRow = ((this.OUT_PAGE.thisPage - 1) * this.OUT_PAGE.rowSize) + 1;		
		// 페이징 시작 및 종료 
		this.OUT_PAGE.startPage = ((this.OUT_PAGE.thisPage - 1) / this.OUT_PAGE.pageSize) * this.OUT_PAGE.pageSize + 1;
		this.OUT_PAGE.endPage = (this.OUT_PAGE.startPage + this.OUT_PAGE.pageSize) - 1;
		if ( this.OUT_PAGE.endPage > this.OUT_PAGE.lastPage ){ this.OUT_PAGE.endPage = this.OUT_PAGE.lastPage; }		
		// 이전 페이지
		if ( this.OUT_PAGE.thisPage > 1 ) {
			this.OUT_PAGE.prevPage = this.OUT_PAGE.thisPage - 1;
		} else {
			this.OUT_PAGE.prevPage = 1;
		}		
		// 다음 페이지
		if ( this.OUT_PAGE.thisPage < this.OUT_PAGE.lastPage ) {			
			this.OUT_PAGE.nextPage = this.OUT_PAGE.thisPage + 1;
		} else {
			this.OUT_PAGE.nextPage = this.OUT_PAGE.lastPage;
		}
		// 이전 단위 페이지
		if ( this.OUT_PAGE.thisPage - this.OUT_PAGE.pageSize < 1 ){
			this.OUT_PAGE.prevStep = 1;
		} else {
			this.OUT_PAGE.prevStep = this.OUT_PAGE.startPage - this.OUT_PAGE.pageSize;
		}		
		// 다음 단위 페이지
		if ( this.OUT_PAGE.thisPage + this.OUT_PAGE.pageSize > this.OUT_PAGE.lastPage ){
			this.OUT_PAGE.nextStep = this.OUT_PAGE.lastPage;
		} else {
			this.OUT_PAGE.nextStep = this.OUT_PAGE.startPage + this.OUT_PAGE.pageSize;
		}
		this.IN_VO.put("startRow", this.OUT_PAGE.startRow );
		this.IN_VO.put("endRow", this.OUT_PAGE.endRow );
	}
	
}

class PAGES {
	public int totalCnt = 0;		// 조회된 데이터 총 갯수
	public int thisPage = 1;		// 현재 페이지 번호
	public int rowSize = 10;		// 한 페이지에 표시되는 줄 수
	public int pageSize = 10;		// 페이징 번호에 표시되는 갯수	
	public int firstPage = 1;		// 처음 페이지
	public int lastPage = 1;		// 마지막 페이지
	public int prevPage = 1;		// 이전 페이지
	public int nextPage = 1;		// 다음 페이지
	public int prevStep = 1;		// 이전 단위 페이지
	public int nextStep = 1;		// 다음 단위 페이지
	public int startPage = 1;		// 반복 시작 페이지
	public int endPage = 1;		// 반복 종료 페이지
	public int startRow = 1;		// 쿼리에서 사용되는 데이터 로우 시작번호
	public int endRow = 1;		// 쿼리에서 사용되는 데이터 로우 종료번호
}