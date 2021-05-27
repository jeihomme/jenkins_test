package com.ppm.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.iwonsoft.unit.UnitSVO;
import com.iwonsoft.unit.UnitVO;
import com.iwonsoft.util.ExcelRead;
import com.iwonsoft.util.ExcelReadOption;
import com.iwonsoft.util.ExcelUtil;
import com.iwonsoft.util.RequestUtil;
import com.ppm.service.QueryService;

@Controller
@RequestMapping(value= {"/front/*/*","/mng/*/*","/cms/*/*"} )
public class ExcelController {

	@Resource(name="QueryService")
	private QueryService QueryService;
	
	RequestUtil requestUtil;
	
	/**
	 * 
	 * @param svo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("static-access")
	@RequestMapping(value="/excel", method=RequestMethod.GET)	
	private ModelAndView makeExcel(UnitSVO svo, HttpServletRequest request) throws Exception {
		UnitVO dataVo = new UnitVO(svo.getIn());
		String [] path = request.getServletPath().split("/");
		String group = path[1];
		String subject = path[2].substring(0,1).toUpperCase() + path[2].substring(1);
		svo.setVars(path[2]);
		dataVo.setAll( svo.getValues() );
		dataVo.thisPage(svo.getPageNo());
		
		if( dataVo.get("listCnt") != null ) {
			if( ! dataVo.get("listCnt").equals("") ) {
				int listCnt = Integer.parseInt( dataVo.get("listCnt") );
				dataVo.rowSize( listCnt );
			} else dataVo.rowSize(10);
		} else dataVo.rowSize(10);
		
		dataVo.pageSize(10);
		dataVo.rowSize(  Integer.parseInt( dataVo.get("rowSize") )  );
		
		String mngLoginIdx = String.valueOf(requestUtil.getSession("mngLoginIdx")+"");
		String mngLoginType = String.valueOf(requestUtil.getSession("mngLoginType")+"");
		
		dataVo.set("mngLoginIdx", mngLoginIdx);
		dataVo.set("mngLoginType", mngLoginType);
		
		dataVo.totalCnt( QueryService.selectListCnt( dataVo.getParam() , group, subject, dataVo.get("query")+"Cnt" ) );

		List<Map<String, Object>> excelList = QueryService.selectList( dataVo.getParam() , group, subject, dataVo.get("query")+"_Excel" );
	    
		int a = 0;
	    for(Map<String, Object> excelData: excelList){
	    	if( excelData.get("ㄴ_제목") != null ) excelList.get(a).put("ㄴ_제목", String.valueOf( excelData.get("ㄴ_제목") ).replaceAll("&amp;","&"));
	    	if( excelData.get("ㄴ_제목") != null ) excelList.get(a).put("ㄴ_제목", String.valueOf( excelData.get("ㄴ_제목") ).replaceAll("&lt;","<"));
	    	if( excelData.get("ㄴ_제목") != null ) excelList.get(a).put("ㄴ_제목", String.valueOf( excelData.get("ㄴ_제목") ).replaceAll("&gt;",">"));
	    	if( excelData.get("ㄴ_제목") != null ) excelList.get(a).put("ㄴ_제목", String.valueOf( excelData.get("ㄴ_제목") ).replaceAll("&quot;","\""));
	    	if( excelData.get("ㄴ_제목") != null ) excelList.get(a).put("ㄴ_제목", String.valueOf( excelData.get("ㄴ_제목") ).replaceAll("&#39;","\'"));
	    	if( excelData.get("ㄴ_제목") != null ) excelList.get(a).put("ㄴ_제목", String.valueOf( excelData.get("ㄴ_제목") ).replaceAll("<br \\/>","\n"));
	    	if( excelData.get("ㄴ_제목") != null ) excelList.get(a).put("ㄴ_제목", String.valueOf( excelData.get("ㄴ_제목") ).replaceAll("&#63;","?"));

//	    	if( excelData.get("ㄹ_내용") != null ) excelList.get(a).put("ㄹ_내용", String.valueOf( excelData.get("ㄹ_내용") ).replaceAll("&amp;","&"));
//	    	if( excelData.get("ㄹ_내용") != null ) excelList.get(a).put("ㄹ_내용", String.valueOf( excelData.get("ㄹ_내용") ).replaceAll("&lt;","<"));
//	    	if( excelData.get("ㄹ_내용") != null ) excelList.get(a).put("ㄹ_내용", String.valueOf( excelData.get("ㄹ_내용") ).replaceAll("&gt;",">"));
//	    	if( excelData.get("ㄹ_내용") != null ) excelList.get(a).put("ㄹ_내용", String.valueOf( excelData.get("ㄹ_내용") ).replaceAll("&quot;","\""));
//	    	if( excelData.get("ㄹ_내용") != null ) excelList.get(a).put("ㄹ_내용", String.valueOf( excelData.get("ㄹ_내용") ).replaceAll("&#39;","\'"));
//	    	if( excelData.get("ㄹ_내용") != null ) excelList.get(a).put("ㄹ_내용", String.valueOf( excelData.get("ㄹ_내용") ).replaceAll("<br \\/>","\n"));
//	    	if( excelData.get("ㄹ_내용") != null ) excelList.get(a).put("ㄹ_내용", String.valueOf( excelData.get("ㄹ_내용") ).replaceAll("&#63;","?"));
	    	a++;
	    }
		
		Map<String , Object> excelMap = new HashMap<>();
		excelMap.put("excelList", excelList);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("excel_name", "PPMEXCEL_"+tmp_mng_menu(subject) );
		mav.addObject("excel_data", excelList);		
		mav.setView( new ExcelUtil() );

		return mav;
	}
	
	
	/**
	 * 
	 * @param svo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/mng/coup/ajax2", method=RequestMethod.POST, produces = "application/json; charset=utf8")	
	@ResponseBody
	public UnitSVO excel_json(UnitSVO svo,  MultipartHttpServletRequest excel) throws Exception{
		UnitVO dataVo = new UnitVO(svo.getIn());
		String [] path = excel.getServletPath().split("/");
		String group = path[1];
		String subject = path[2].substring(0,1).toUpperCase() + path[2].substring(1);
		MultipartFile file =  excel.getFile("COUP_TARGET_EXCEL");
		String rootPath = excel.getSession().getServletContext().getRealPath("/");
		File destFile = new File(rootPath+ "resources/down/"+ file.getOriginalFilename());
//		File destFile = new File("C:/Users/ChoiWooseong/Desktop/"+ file.getOriginalFilename());
		if(!destFile.exists()) destFile.mkdirs();
		file.transferTo(destFile);
		
		ExcelReadOption excelReadOption = new ExcelReadOption();
	    excelReadOption.setFilePath(destFile.getAbsolutePath());
	    excelReadOption.setOutputColumns("A");
	    excelReadOption.setStartRow(2);
	    List<Map<String, String>>excelContent = ExcelRead.read(excelReadOption);
	    String idxList = "";
	    String nmList = "";
	    int cnt = 0;
	    
	    for(Map<String, String> excelData: excelContent){
    	    dataVo.set("USER_EMAIL",  excelData.get("A"));
    	    List<Map<String, Object>> userList = QueryService.selectList( dataVo.getParam(), group, subject, "selectMngCoupUserData");
    	    if( userList.size() > 0 ) {
    	    	Map<String, Object> user = userList.get(0);
        	    idxList += user.get("USER_IDX")+",";
        	    nmList += user.get("USER_NM")+",";
        		cnt++;
    	    }
	    }
	    
	    idxList = idxList.substring(0, idxList.length()-1);
	    nmList = nmList.substring(0, nmList.length()-1);
	    
	    dataVo.set("COUP_IDX",  excel.getParameter("COUP_IDX"));
	    dataVo.set("idxList", idxList);
	    dataVo.set("nmList", nmList);
	    dataVo.set("cnt", cnt);
	    List<Map<String, Object>> coupList = QueryService.selectList( dataVo.getParam(), group, subject, "selectMngCoupData");
	    dataVo.setDao( coupList );
		svo.setOut( "detail", dataVo.getDao() );
			
		return svo;
	}
	
	
	private String tmp_mng_menu ( String subject ) {
		
		String txt1 = "";
		String txt2 = "";
		
		switch(subject.toLowerCase()){
			case "member": txt1="회원관리"; break;
	
			case "masterinfo": txt1="마스터관리"; break;
			case "masteropen": txt1="마스터관리"; break;
			case "masterappl": txt1="마스터관리"; break;
			case "masterfaq": txt1="마스터관리"; break;
			case "revi": txt1="마스터관리"; break;
	
			case "vod": txt1="상품관리"; break;
			case "lect": txt1="상품관리"; break;
			case "live": txt1="상품관리"; break;
			case "face": txt1="상품관리"; break;
			case "chat": txt1="상품관리"; break;
			case "mail": txt1="상품관리"; break;
			case "coup": txt1="상품관리"; break;
			case "stor": txt1="상품관리"; break;
			case "prdtopen": txt1="상품관리"; break;
	
			case "wait": txt1="상담관리"; break;
			case "past": txt1="상담관리"; break;
			
			case "orde": txt1="주문/배송관리"; break;
			case "deli": txt1="주문/배송관리"; break;
			case "pay": txt1="주문/배송관리"; break;
			case "refu": txt1="주문/배송관리"; break;
			case "cuse": txt1="주문/배송관리"; break;
			
			case "bann": txt1="사이트관리"; break;
			case "faq": txt1="사이트관리"; break;
			case "qna": txt1="사이트관리"; break;
			case "noti": txt1="사이트관리"; break;
			case "bannprdt": txt1="사이트관리"; break;
			case "cate": txt1="사이트관리"; break;
			case "mainopen": txt1="사이트관리"; break;
	
			case "join": txt1="통계"; break;
			case "sale": txt1="통계"; break;
			case "prdt": txt1="통계"; break;
			
			case "admin": txt1="기본설정"; break;
			case "prev": txt1="기본설정"; break;
			
			case "main": txt1="메인"; break;
			
			default : txt1=subject; break;
			
		}
		
		switch(subject.toLowerCase()) {
			case "member": txt2="회원정보"; break;
	
			case "masterinfo": txt2="마스터정보"; break;
			case "masteropen": txt2="마스터노출정보"; break;
			case "masterappl": txt2="마스터신청관리"; break;
			case "masterfaq": txt2="마스터FAQ관리"; break;
			case "revi": txt2="후기관리"; break;
	
			case "vod": txt2="영상등록"; break;
			case "lect": txt2="VOD강좌"; break;
			case "live": txt2="라이브클래스"; break;
			case "face": txt2="1:1화상상담"; break;
			case "chat": txt2="1:1채팅상담"; break;
			case "mail": txt2="1:1이메일상담"; break;
			case "coup": txt2="쿠폰관리"; break;
			case "stor": txt2="스토어상품"; break;
			case "prdtopen": txt2="상품상세노출관리"; break;
	
			case "wait": txt2="대기중인상담"; break;
			case "past": txt2="지난상담"; break;
			
			case "orde": txt2="주문관리"; break;
			case "deli": txt2="상품준비/발송관리"; break;
			case "pay": txt2="결제내역"; break;
			case "refu": txt2="취소/환불내역"; break;
			case "cuse": txt2="쿠폰사용내역"; break;
			
			case "bann": txt2="메인페이지배너관리"; break;
			case "faq": txt2="FAQ관리"; break;
			case "qna": txt2="1:1문의관리"; break;
			case "noti": txt2="공지사항관리"; break;
			case "bannprdt": txt2="상품배너관리"; break;
			case "cate": txt2="카테고리관리"; break;
			case "mainopen": txt2="메인마스터노출관리"; break;
	
			case "join": txt2="가입"; break;
			case "sale": txt2="매출"; break;
			case "prdt": txt2="상품별현황관리"; break;
			
			case "admin": txt2="관리자관리"; break;
			case "prev": txt2="권한관리"; break;
			
			case "main": txt2="메인"; break;
			
			default : txt2=subject; break;
		}
		
			return txt1+"_"+txt2+"목록";
	}
	
	
}








