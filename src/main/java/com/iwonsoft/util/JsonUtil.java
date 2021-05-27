package com.iwonsoft.util;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;

public class JsonUtil {

	/**
	 * [JSON] Map To JSON Object
	 * @param map
	 * @return
	 */
	public static JSONObject toJsonObject(Map<String, Object> map) {
		JSONObject result = new JSONObject();
		for ( Entry<String, Object> item : map.entrySet() ) {
			result.put(item.getKey(), item.getValue());		
		}		
		return result;
	}
	
	/**
	 * [JSON] ArrayList Map To JSON Object
	 * @param map
	 * @return
	 */
	public static JSONArray toJsonObject(List<Map<String, Object>> map) {
		JSONArray result = new JSONArray();
		for (Map<String, Object> row : map) {
			JSONObject items = new JSONObject();
			for ( Entry<String, Object> item : row.entrySet() ) {
				items.put(item.getKey(), item.getValue());		
			}
			result.add(items);
        }		
		return result;
	}
	
	/**
	 *  [String] Map To JSON Object
	 * @param map
	 * @return
	 */
	public static String toJsonString(Map<String, Object> map) {
		return String.valueOf(toJsonObject(map));
	}
	
	/**
	 *  [String] ArrayList Map To JSON Object
	 * @param map
	 * @return
	 */
	public static String toJsonString(List<Map<String, Object>> map) {
		return String.valueOf(toJsonObject(map));
	}
	
	
	
	
	
	
	
	
	    /**
	     * Map을 jsonObject 로 변환한다.
	     *
	     * @param map Map<String, Object>.
	     * @return JSONObject.
	     */
	    public static JSONObject getJsonObjectFromMap( Map<String, Object> map )
	    {
	        JSONObject jsonObject = new JSONObject();
	        for( Map.Entry<String, Object> entry : map.entrySet() ) {
	            String key = entry.getKey();
	            Object value = entry.getValue();
	            jsonObject.put(key, value);
	        }	        
	        return jsonObject;
	    }
	    
	    /**
	     * Map을 JsonString으로 변환한다.
	     * @param map Map<String, Object>.
	     * @return String
	     */
	    public static String getJsonStringFromMap( Map<String, Object> map ) {   	
		    JSONObject jsonObject = new JSONObject();
	        for( Map.Entry<String, Object> entry : map.entrySet() ) {
	            String key = entry.getKey();
	            Object value = entry.getValue();
	            jsonObject.put(key, value);
	        }
	        return jsonObject.toJSONString();
	    }
	    
	    /**
	     * List<Map>을 jsonArray로 변환한다.
	     *
	     * @param list List<Map<String, Object>>.
	     * @return JSONArray.
	     */
	    public static JSONArray getJsonArrayFromList( List<Map<String, Object>> list )
	    {
	        JSONArray jsonArray = new JSONArray();
	        for( Map<String, Object> map : list ) {
	            jsonArray.add( getJsonStringFromMap( map ) );
	        }
	        
	        return jsonArray;
	    }
	    
	    /**
	     * List<Map>을 jsonString으로 변환한다.
	     *
	     * @param list List<Map<String, Object>>.
	     * @return String.
	     */
	    public static String getJsonStringFromList( List<Map<String, Object>> list )
	    {
	        String result = "";
	    	JSONArray jsonArray = getJsonArrayFromList( list );
	        if ( jsonArray != null ) {	        	
	        	result =  jsonArray.toJSONString().replace("\\\"", "\"");	        	
	        }	        
	        return result;
	    }
	 
	    /**
	     * JsonObject를 Map<String, Object>으로 변환한다.
	     *
	     * @param jsonObj JSONObject.
	     * @return Map<String, Object>.
	     */
	    @SuppressWarnings("unchecked")
	    public static Map<String, Object> getMapFromJsonObject( JSONObject jsonObj )
	    {
	        Map<String, Object> map = null;	        
	        try {	            
	            map = new ObjectMapper().readValue(jsonObj.toJSONString(), Map.class) ;	            
	        } catch (JsonParseException e) {
	            e.printStackTrace();
	        } catch (JsonMappingException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }	 
	        return map;
	    }
	    
	    /**
	     *  JsonString를 Map<String, Object>으로 변환한다.
	     * @param jsonString
	     * @return
	     */
	    @SuppressWarnings("unchecked")
		public static Map<String, Object> getMapFromJsonString( String jsonString ){
	    	Map<String, Object> map = null;
	        try {	  
	        	ObjectMapper objectMapper = new ObjectMapper();
	        	JSONObject jsonObj = objectMapper.readValue(jsonString, JSONObject.class);
	            map = new ObjectMapper().readValue(jsonObj.toJSONString(), Map.class) ;	            
	        } catch (JsonParseException e) {
	            e.printStackTrace();
	        } catch (JsonMappingException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }	 
	        return map;
	    }
	 
	    /**
	     * JsonArray를 List<Map<String, Object>>으로 변환한다.
	     *
	     * @param jsonArray JSONArray.
	     * @return List<Map<String, Object>>.
	     */
	    public static List<Map<String, Object>> getListMapFromJsonArray( JSONArray jsonArray )
	    {
	        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	        
	        if( jsonArray != null )
	        {
	            int jsonSize = jsonArray.size();
	            for( int i = 0; i < jsonSize; i++ )
	            {
	                Map<String, Object> map = JsonUtil.getMapFromJsonObject( ( JSONObject ) jsonArray.get(i) );
	                list.add( map );
	            }
	        }	        
	        return list;
	    }

}
