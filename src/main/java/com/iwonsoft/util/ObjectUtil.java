package com.iwonsoft.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
 
public class ObjectUtil {
    
	/**
	 * Class Object를 Map<String, Object>형식으로 변환
	 * @param obj 변환대상 Class Object
	 * @return
	 */
    public static Map<String, Object> objectToMap(Object obj){
        Map<String, Object> map = new HashMap<String, Object>();
        Field[] fields = obj.getClass().getDeclaredFields();
        for(int i=0; i <fields.length; i++){
            fields[i].setAccessible(true);
            try{
                map.put(fields[i].getName(), fields[i].get(obj));
            }catch(Exception e){
                e.printStackTrace();
            }
        }        
        return map;
    }
 
    /**
     * Map<String, Object>를 Class Object 형식으로 변환
     * @param map 변환대상 Map Object
     * @param obj 변환목표 Class Object
     * @return
     */
    public static Object mapToObject(Map<String,Object> map, Object obj){
        String keyAttribute = null;
        String setMethodString = "set";
        String methodString = null;
        Iterator<String> itr = map.keySet().iterator();
        
        while(itr.hasNext()){
            keyAttribute = itr.next();
            methodString = setMethodString+keyAttribute.substring(0,1).toUpperCase()+keyAttribute.substring(1);            
            Method[] methods = obj.getClass().getDeclaredMethods();
            for(int i=0;i<methods.length;i++){
                if(methodString.equals(methods[i].getName())){
                    try{
                        methods[i].invoke(obj, map.get(keyAttribute));
                    }catch(Exception e){
                        e.printStackTrace();
                    }
                }
            }
        }
        return obj;
    }
}

