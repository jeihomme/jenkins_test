package com.iwonsoft.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.format.Colour;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

import org.springframework.web.servlet.view.document.AbstractJExcelView;

public class ExcelUtil extends AbstractJExcelView {
	
	/**
	 * EXCEL Build Info
	 */
	@Override
	@SuppressWarnings("unchecked")
	protected void buildExcelDocument(Map<String, Object> model, WritableWorkbook workbook, HttpServletRequest request, HttpServletResponse response ) throws Exception {
    	String excelFileNm = StringUtil.null2void(model.get("excel_name"), "Undefined");		
		List<Map<String,Object>> excelData = (List<Map<String, Object>>) model.get("excel_data");
    	SimpleDateFormat FileDateFormat = new SimpleDateFormat("yyyyMMdd_HHmmss"); 
    	System.out.println("Excel Start");
    	
    	// 파일 설정
    	String SheetName = FileDateFormat.format(new Date());   
        String ExcelFileName = excelFileNm + "_" + FileDateFormat.format(new Date()) + ".xls"; 
        response.setHeader("Content-Disposition", "attachement; filename=\""+ java.net.URLEncoder.encode(ExcelFileName, "UTF-8") + "\";charset=\"UTF-8\"");
 
        makeExcel(workbook, excelData, SheetName);
    }
		
	/**
	 * EXCEL MAKE
	 * @param ws
	 * @param excelData
	 * @throws RowsExceededException
	 * @throws WriteException
	 */
	private void makeExcel(WritableWorkbook workbook, List<Map<String,Object>> excelData, String SheetName) throws RowsExceededException, WriteException {		
		if ( excelData.size() > 0 ){
			System.out.println("Making Excel");
			WritableSheet writableSheet = workbook.createSheet(SheetName, 0); 
			
			// Title format
		    WritableFont titleFont = new WritableFont(WritableFont.createFont("맑은 고딕"), 10);
		    titleFont.setColour(Colour.BLACK);
		    titleFont.setBoldStyle(WritableFont.BOLD);
		    WritableCellFormat titleFormat = new WritableCellFormat(titleFont);
		    titleFormat.setBackground(Colour.GRAY_25);
		    
		    // Contents format
		    WritableFont contentsFont = new WritableFont(WritableFont.createFont("맑은 고딕"), 10);
		    contentsFont.setColour(Colour.BLACK);
		    WritableCellFormat contentsFormat = new WritableCellFormat(contentsFont);
		    contentsFormat.setBackground(Colour.WHITE);
			
		    // Excel Data
			HashMap<String, Object> excelItems = (HashMap<String, Object>)  excelData.get(0);
			TreeMap<String, Object> excelItem = new TreeMap<String, Object>( excelItems );
			Iterator<String> treeMapIter = null;
			
			// 타이틀
			int ItemCnt = 0;
	        treeMapIter = excelItem.keySet().iterator();	 
	        while( treeMapIter.hasNext()) {	 
	            String Key = treeMapIter.next();
	            writableSheet.addCell( new Label(ItemCnt, 0, Key.substring(2), titleFormat) ); // 제목 앞에 세글자 짤림
//	            writableSheet.addCell( new Label(ItemCnt, 0, Key, titleFormat) );
				ItemCnt++;	 
	        }	        

	        // 컨텐츠
	        for (int index = 1; index < excelData.size()+1; index++) {	        	
	        	ItemCnt = 0;
	        	treeMapIter = excelItem.keySet().iterator();	 
	        	while( treeMapIter.hasNext()) {	 
		            String Key = treeMapIter.next();		           
		            writableSheet.addCell( new Label(ItemCnt, index, excelData.get(index-1).get(Key)+"", contentsFormat) );		
		        	ItemCnt++;
		        }
	        }
		}		
	}
}