package com.iwonsoft.dao;

import java.util.List;
import java.util.Map;

public interface UnitFsoService {

	// [Start] Start Instance
	public void getInstance(String unitUuid) throws Exception;
	
	// [Get] All File List
	public List<Map<String, Object>> getFiles() throws Exception;	

	// [Get] Field File List
	public List<Map<String, Object>> getFiles(String fldName) throws Exception;	
	
	// [Copy] Multi File Copy
	public void copyFiles(String fldName, String targetPath)  throws Exception;	
	
	// [Copy] Single File Copy
	public void copyFile(String fileUuid, String targetPath)  throws Exception;	
	
	// [Delete] All Files Delete
	public void deleteAll()  throws Exception;	
	
	// [Delete] Multi File Delete
	public void deleteFiles(String fldName)  throws Exception;	
	
	// [Delete] Single File Delete
	public void deleteFile(String fileUuid)  throws Exception;	
	
	// [Delete] Folder Delete
	public void deleteFolder(String targetPath) throws Exception;
	
}
