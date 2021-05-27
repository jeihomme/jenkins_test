package com.iwonsoft.unit;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component
public class UnitMV extends AbstractView {

	@Override	
	@SuppressWarnings("unchecked")	
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {	
		
		if ( model.containsKey("string") ) {
			String viewData = String.valueOf( model.get("string") );	
			this.viewString(viewData, request, response);
		} else if  ( model.containsKey("image") ) {
			Map<String, Object> viewData = (Map<String, Object>) model.get("image");
			this.viewImage(viewData, request, response);
		} else if  ( model.containsKey("download") ) {
			Map<String, Object> viewData = (Map<String, Object>) model.get("download");
			this.viewDownload(viewData, request, response);
		} else if  ( model.containsKey("css") ) {
			String viewData = String.valueOf( model.get("css") );	
			this.viewCss(viewData, request, response);
		} else if  ( model.containsKey("js") ) {
			String viewData = String.valueOf( model.get("js") );	
			this.viewJs(viewData, request, response);
		}
			
	}
	
	/**
	 * [VIEW] String
	 * @param model
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	protected void viewString (String viewData, HttpServletRequest request,
			HttpServletResponse response) throws Exception {		
		try {
			//this.setResponseContentType(request, response);		
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
            PrintWriter writer = response.getWriter();            
            writer.print(viewData);
            writer.flush();	
            if (writer != null) { writer.close(); }            
        } catch (Exception e) {
            throw e;
        }
	}
	
	/**
	 * [VIEW] Image
	 * @param model
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	protected void viewImage (Map<String, Object> viewData, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// File Information		
		String fileUuid = viewData.get("FILE_UUID").toString();		
		String fileSafeNm = viewData.get("FILE_SAFE_NAME").toString();
		String fileType = viewData.get("FILE_TYPE").toString();
		String filePath = request.getSession().getServletContext().getRealPath("/FILES-INF/"+ fileUuid.substring(0, 8)+"/"+ fileUuid);
		File file = new File(filePath);
		
		if ( file.exists() ) {			
	        int size = (int) file.length();
	        InputStream in = new FileInputStream(filePath);
	        
	        response.setContentType(fileType);
	        response.setContentLength(size);
	        response.setHeader("Content-Disposition", "filename=\""+ fileSafeNm + "\";charset=\"UTF-8\"");
	        response.setHeader("Content-Transfer-Encoding", "binary");
	        
	        byte[] bytes = new byte[1024];
	        OutputStream os = response.getOutputStream();
	        while(true) {
	            int red = in.read(bytes, 0, bytes.length);	 
	            if(red < 0) {
	                break;
	            }
	            os.write(bytes, 0, red);
	        }	 
	        os.flush();
	        os.close();
	        in.close();
		}
	}
	
	/**
	 * [VIEW] Download
	 * @param model
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	protected void viewDownload (Map<String, Object> viewData, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// File Information		
		String fileUuid = viewData.get("FILE_UUID").toString();		
		String fileSafeNm = viewData.get("FILE_SAFE_NAME").toString();
		String filePath = request.getSession().getServletContext().getRealPath("/FILES-INF/"+ fileUuid.substring(0, 8)+"/"+ fileUuid);
		File file = new File(filePath);
		
		if ( file.exists() ) {			
			// File Content Type
			setContentType("application/download; charset=utf-8");        
	        response.setContentType(getContentType());
	        response.setContentLength((int) file.length()); 
	        
	        // Set Header
	        response.setHeader("Content-type", "application/octet-stream");			
	        response.setHeader("Content-Disposition", "attachment; filename=\""+ fileSafeNm + "\";charset=\"UTF-8\"");
			response.setHeader("Content-Transfer-Encoding", "binary");
			response.setHeader("Cache-Control", "max-age=0");
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Expires", "0");
			
			// Output Stream
	        OutputStream out = response.getOutputStream();
	        FileInputStream fis = null;	        
	        try {
	            fis = new FileInputStream(file);            
	            FileCopyUtils.copy(fis, out);
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            if (fis != null) {
	                try {
	                    fis.close();
	                } catch (IOException ioe) {
	                    ioe.printStackTrace();
	                }
	            }            
	            out.flush();
	        }		
		}
	}
	
	/**
	 * [VIEW] CSS : StyleSheet
	 * @param viewData
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	protected void viewCss (String viewData, HttpServletRequest request,
			HttpServletResponse response) throws Exception {		
        
		try {
			viewData = viewData.replace("&#39;", "'");
			viewData = viewData.replace("&#63;", "?");
			
			setContentType("text/css; charset=utf-8");        
	        response.setContentType(getContentType());
            PrintWriter writer = response.getWriter();
            writer.print(viewData);
            writer.flush();	
            if (writer != null) { writer.close(); }
            
        } catch (Exception e) {
            throw e;
        }
	}
	
	/**
	 * [VIEW] JS : Javascript
	 * @param viewData
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	protected void viewJs (String viewData, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		try {	      
			viewData = viewData.replace("&#39;", "'");
			viewData = viewData.replace("&#63;", "?");
			
			setContentType("text/javascript; charset=utf-8");        
	        response.setContentType(getContentType());	     
            PrintWriter writer = response.getWriter();
            writer.print(viewData);
            writer.flush();	
            if (writer != null) { writer.close(); }
            
        } catch (Exception e) {
            throw e;
        }
	}
}