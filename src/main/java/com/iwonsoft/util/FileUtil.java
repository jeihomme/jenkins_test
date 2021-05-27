package com.iwonsoft.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

public class FileUtil {
	
	/***
	 * 파일 생성 및 내용 입력
	 * @param request : HttpServletRequest
	 * @param Path : 파일 경로 (ex. /root/image/text.txt)
	 * @param Text : 입력할 텍스트
	 */
	public static void writeFile( HttpServletRequest request, String Path, String Text ){
		String FileRoot = request.getSession().getServletContext().getRealPath(Path);
		BufferedWriter writer = null; 
		try { 
			writer = new BufferedWriter( new FileWriter( FileRoot )); 
			writer.write( Text ); 
		} 
		catch ( IOException e) { 
			
		} 
		finally { 
			try { 
				if ( writer != null) writer.close( );
			} catch ( IOException e) {
				
			}
		}
	}	
	
	/***
	 * 파일 삭제
	 * @param request : HttpServletRequest
	 * @param Path : 파일 경로 (ex. /root/image/text.txt)
	 */
	public static void deleteFile( HttpServletRequest request, String Path ){
		String FileRoot = request.getSession().getServletContext().getRealPath(Path);
		File FileObj = new File(FileRoot);
		FileObj.delete();
	}	
}
