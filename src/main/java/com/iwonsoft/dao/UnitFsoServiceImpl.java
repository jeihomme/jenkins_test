package com.iwonsoft.dao;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.iwonsoft.unit.UnitException;

@Service("UnitFsoService")
public class UnitFsoServiceImpl implements UnitFsoService {
	
	@Resource(name="UnitFileDAO")
	private UnitFileDAO unitFileDAO;
	
	private List<Map<String, Object>> FILE_LIST = new ArrayList<Map<String, Object>>();
	
	/**
	 * [Start] Start Instance
	 */
	@Override
	public void getInstance(String unitUuid) throws Exception {
		if ( unitUuid.isEmpty() ) { throw new UnitException("1000", "Service UUID Defined", "", null); }
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("unitUuid", unitUuid);	
		this.FILE_LIST = unitFileDAO.selectFileAll(params);
	}

	/**
	 * [Get] All File List
	 * @return
	 */
	@Override
	public List<Map<String, Object>> getFiles() throws Exception {
		if ( this.FILE_LIST.size() == 0 ) { return null; }
		return this.FILE_LIST;		
	}

	/**
	 * [Get] Field File List
	 * @param fldName
	 * @return
	 */
	@Override
	public List<Map<String, Object>> getFiles(String fldName) throws Exception {
		if ( this.FILE_LIST.size() == 0 ) { return null; }
		List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();
		for( Map<String, Object> FILE : this.FILE_LIST) {
			if ( fldName.equals( FILE.get("FLD_NAME").toString() ) ) {
				fileList.add(FILE);
			}
		}
		return fileList;
	}

	/**
	 * [Copy] Multi File Copy
	 * @param fldName
	 * @param targetPath : (ex) /resources/path/{FLD_NAME}
	 */
	@Override
	public void copyFiles(String fldName, String targetPath) throws Exception {
		if ( this.FILE_LIST.size() > 0 ) {
			for( Map<String, Object> FILE : this.FILE_LIST) {				
				if ( fldName.equals( FILE.get("FLD_NAME").toString() ) ) {					
					this.copyFile(FILE.get("FILE_UUID").toString(), targetPath);
				}
			}
		}
	}

	/**
	 * [Copy] Single File Copy
	 * @param fileUuid
	 * @param targetPath : (ex) /resources/path/{FLD_NAME}
	 */
	@Override
	public void copyFile(String fileUuid, String targetPath) throws ServletException, Exception {	
		if ( this.FILE_LIST.size() > 0 ) {
			for( Map<String, Object> FILE : this.FILE_LIST) {
				if ( fileUuid.equals( FILE.get("FILE_UUID").toString() ) ) {				
					for(String key : FILE.keySet()) {
						targetPath = targetPath.replaceAll("\\{"+key+"\\}", FILE.get(key).toString());
					}					
					try{
						File originPath = new File(this.getRealPath("/FILES-INF/"+ fileUuid.substring(0, 8)+"/"+fileUuid));
						if ( originPath.exists()) {
							File fileFolder = new File(this.getRealPath(targetPath.substring(0, targetPath.lastIndexOf("/")+1)));
							File filePath = new File(this.getRealPath(targetPath));
							if(!fileFolder.exists()) fileFolder.mkdirs();
							FileCopyUtils.copy(originPath, filePath);
						}
					} catch (IOException e){		
						e.printStackTrace();	
					}catch(Exception e2){		
						e2.printStackTrace();	
					}
				}
			}
		}
	}

	/**
	 * [Delete] All Files Delete
	 */
	@Override
	public void deleteAll() throws Exception {
		if ( this.FILE_LIST.size() > 0 ) {
			for( Map<String, Object> FILE : this.FILE_LIST) {
				this.deleteFile(FILE.get("FILE_UUID").toString());
			}
		}
	}

	/**
	 * [Delete] Multi File Delete
	 * @param fldName
	 */
	@Override
	public void deleteFiles(String fldName) throws Exception {
		if ( this.FILE_LIST.size() > 0 ) {
			for( Map<String, Object> FILE : this.FILE_LIST) {
				if ( fldName.equals( FILE.get("FLD_NAME").toString() ) ) {
					this.deleteFile(FILE.get("FILE_UUID").toString());
				}
			}
		}		
	}

	/**
	 * [Delete] Single File Delete
	 * @param fileUuid
	 */
	@Override
	public void deleteFile(String fileUuid) throws Exception {
		if ( this.FILE_LIST.size() > 0 ) {
			String filePath = this.getRealPath("/FILES-INF/"+ fileUuid.substring(0, 8)+"/"+fileUuid);		
			File file = new File(filePath);
			if ( file.exists() ) { file.delete();	}

			Map<String, Object> params = new HashMap<String, Object>();
			params.put( "fileUuid", fileUuid );			
			unitFileDAO.deleteFileData(params);
		}		
	}
	
	/**
	 * [Delete] Folder Delete
	 * @param targetPath
	 * @throws Exception
	 */
	@Override
	public void deleteFolder(String targetPath) throws Exception {	
		File folder = new File(this.getRealPath(targetPath));
		if(folder.exists()){		
			File[] deleteFolderList = folder.listFiles();			
			for (int i = 0; i < deleteFolderList.length; i++) {
				if(deleteFolderList[i].isFile()) {
					deleteFolderList[i].delete();
				}else {					
					deleteFolder(deleteFolderList[i].getPath());
				}
				deleteFolderList[i].delete(); 
			}
			folder.delete();
		}
	}	
	
	/**
	 * [Find] Real Path
	 * @param path
	 * @return
	 */
	private String getRealPath(String path) {
		String result = "";
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder .getRequestAttributes()).getRequest();	
		result = request.getSession().getServletContext().getRealPath(path);		
		return result;
	}


}
