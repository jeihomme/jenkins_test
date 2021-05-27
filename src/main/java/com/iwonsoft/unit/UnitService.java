package com.iwonsoft.unit;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.drew.imaging.ImageMetadataReader;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.exif.ExifIFD0Directory;
import com.iwonsoft.dao.UnitFileService;
import com.iwonsoft.util.DateTimeUtil;
import com.iwonsoft.util.EncryptUtil;
import com.iwonsoft.util.JsonUtil;
import com.iwonsoft.util.RequestUtil;
import com.mortennobel.imagescaling.AdvancedResizeOp;
import com.mortennobel.imagescaling.ResampleOp;

@Controller
@RequestMapping(value="/unit.iwonsoft.com/*")
public class UnitService extends UnitExtends {
	
	@Resource(name="UnitFileService")
	private UnitFileService unitFileService;
	
	/**
	 * [Base] Unit Page Script
	 * 인코딩 by (http://dean.edwards.name/packer/)
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/base.js", method=RequestMethod.GET)	
	public ModelAndView base(HttpServletRequest request, HttpServletResponse response) throws Exception{			
		String SERVICE_UUID = DateTimeUtil.getNowDate() + DateTimeUtil.getNowTime() + String.valueOf( UUID.randomUUID() ).replaceAll("-", "").toUpperCase();
		if ( request.getParameter("uid") != null ) {
			if ( request.getParameter("uid").isEmpty() == false ) { SERVICE_UUID = request.getParameter("uid").toLowerCase(); 	}
		}
		String unit_ws_protocol = request.isSecure() == true ? "wss":"ws";
		String tx = "var unit_service_uuid = '"+ SERVICE_UUID +"';";
		tx += "var sysdir = '"+ request.getContextPath() +"/unit.iwonsoft.com';";
		tx += "var unit_ws_url = '"+ unit_ws_protocol +"://"+ request.getServerName() +":"+ request.getServerPort() +"/unit.iwonsoft.com/unit-socket';";
		tx += "function unit_fn_eval(method, obj){ eval(method); }";
		tx += "!function(n){\"use strict\";function t(n,t){var r=(65535&n)+(65535&t);return(n>>16)+(t>>16)+(r>>16)<<16|65535&r}function r(n,r,e,u,o,c){return t((f=t(t(r,n),t(u,c)))<<(i=o)|f>>>32-i,e);var f,i}function e(n,t,e,u,o,c,f){return r(t&e|~t&u,n,t,o,c,f)}function u(n,t,e,u,o,c,f){return r(t&u|e&~u,n,t,o,c,f)}function o(n,t,e,u,o,c,f){return r(t^e^u,n,t,o,c,f)}function c(n,t,e,u,o,c,f){return r(e^(t|~u),n,t,o,c,f)}function f(n,r){n[r>>5]|=128<<r%32,n[14+(r+64>>>9<<4)]=r;var f,i,a,h,g,l=1732584193,d=-271733879,v=-1732584194,C=271733878;for(f=0;f<n.length;f+=16)i=l,a=d,h=v,g=C,l=e(l,d,v,C,n[f],7,-680876936),C=e(C,l,d,v,n[f+1],12,-389564586),v=e(v,C,l,d,n[f+2],17,606105819),d=e(d,v,C,l,n[f+3],22,-1044525330),l=e(l,d,v,C,n[f+4],7,-176418897),C=e(C,l,d,v,n[f+5],12,1200080426),v=e(v,C,l,d,n[f+6],17,-1473231341),d=e(d,v,C,l,n[f+7],22,-45705983),l=e(l,d,v,C,n[f+8],7,1770035416),C=e(C,l,d,v,n[f+9],12,-1958414417),v=e(v,C,l,d,n[f+10],17,-42063),d=e(d,v,C,l,n[f+11],22,-1990404162),l=e(l,d,v,C,n[f+12],7,1804603682),C=e(C,l,d,v,n[f+13],12,-40341101),v=e(v,C,l,d,n[f+14],17,-1502002290),l=u(l,d=e(d,v,C,l,n[f+15],22,1236535329),v,C,n[f+1],5,-165796510),C=u(C,l,d,v,n[f+6],9,-1069501632),v=u(v,C,l,d,n[f+11],14,643717713),d=u(d,v,C,l,n[f],20,-373897302),l=u(l,d,v,C,n[f+5],5,-701558691),C=u(C,l,d,v,n[f+10],9,38016083),v=u(v,C,l,d,n[f+15],14,-660478335),d=u(d,v,C,l,n[f+4],20,-405537848),l=u(l,d,v,C,n[f+9],5,568446438),C=u(C,l,d,v,n[f+14],9,-1019803690),v=u(v,C,l,d,n[f+3],14,-187363961),d=u(d,v,C,l,n[f+8],20,1163531501),l=u(l,d,v,C,n[f+13],5,-1444681467),C=u(C,l,d,v,n[f+2],9,-51403784),v=u(v,C,l,d,n[f+7],14,1735328473),l=o(l,d=u(d,v,C,l,n[f+12],20,-1926607734),v,C,n[f+5],4,-378558),C=o(C,l,d,v,n[f+8],11,-2022574463),v=o(v,C,l,d,n[f+11],16,1839030562),d=o(d,v,C,l,n[f+14],23,-35309556),l=o(l,d,v,C,n[f+1],4,-1530992060),C=o(C,l,d,v,n[f+4],11,1272893353),v=o(v,C,l,d,n[f+7],16,-155497632),d=o(d,v,C,l,n[f+10],23,-1094730640),l=o(l,d,v,C,n[f+13],4,681279174),C=o(C,l,d,v,n[f],11,-358537222),v=o(v,C,l,d,n[f+3],16,-722521979),d=o(d,v,C,l,n[f+6],23,76029189),l=o(l,d,v,C,n[f+9],4,-640364487),C=o(C,l,d,v,n[f+12],11,-421815835),v=o(v,C,l,d,n[f+15],16,530742520),l=c(l,d=o(d,v,C,l,n[f+2],23,-995338651),v,C,n[f],6,-198630844),C=c(C,l,d,v,n[f+7],10,1126891415),v=c(v,C,l,d,n[f+14],15,-1416354905),d=c(d,v,C,l,n[f+5],21,-57434055),l=c(l,d,v,C,n[f+12],6,1700485571),C=c(C,l,d,v,n[f+3],10,-1894986606),v=c(v,C,l,d,n[f+10],15,-1051523),d=c(d,v,C,l,n[f+1],21,-2054922799),l=c(l,d,v,C,n[f+8],6,1873313359),C=c(C,l,d,v,n[f+15],10,-30611744),v=c(v,C,l,d,n[f+6],15,-1560198380),d=c(d,v,C,l,n[f+13],21,1309151649),l=c(l,d,v,C,n[f+4],6,-145523070),C=c(C,l,d,v,n[f+11],10,-1120210379),v=c(v,C,l,d,n[f+2],15,718787259),d=c(d,v,C,l,n[f+9],21,-343485551),l=t(l,i),d=t(d,a),v=t(v,h),C=t(C,g);return[l,d,v,C]}function i(n){var t,r=\"\";for(t=0;t<32*n.length;t+=8)r+=String.fromCharCode(n[t>>5]>>>t%32&255);return r}function a(n){var t,r=[];for(r[(n.length>>2)-1]=void 0,t=0;t<r.length;t+=1)r[t]=0;for(t=0;t<8*n.length;t+=8)r[t>>5]|=(255&n.charCodeAt(t/8))<<t%32;return r}function h(n){var t,r,e=\"\";for(r=0;r<n.length;r+=1)t=n.charCodeAt(r),e+=\"0123456789abcdef\".charAt(t>>>4&15)+\"0123456789abcdef\".charAt(15&t);return e}function g(n){return unescape(encodeURIComponent(n))}function l(n){return function(n){return i(f(a(n),8*n.length))}(g(n))}function d(n,t){return function(n,t){var r,e,u=a(n),o=[],c=[];for(o[15]=c[15]=void 0,u.length>16&&(u=f(u,8*n.length)),r=0;r<16;r+=1)o[r]=909522486^u[r],c[r]=1549556828^u[r];return e=f(o.concat(a(t)),512+8*t.length),i(f(c.concat(e),640))}(g(n),g(t))}n.md5=function(n,t,r){return t?r?d(t,n):h(d(t,n)):r?l(n):h(l(n))}}(\"function\"==typeof jQuery?jQuery:this);";
		tx += "$(function(){$.getScript(\"https://kit.fontawesome.com/35f90b3902.js\")});var unit_loading_flag=false;function setUuid(uuid){if(uuid!=undefined&&uuid!=\"\"){unit_service_uuid=uuid}}function unit_restService(unitURL,jsonParam){var result=new Object();if(unit_loading_flag){alert(\"파일 업로드가 진행중입니다.\\n업로드 완료 후 다시 시도해 주시기 바랍니다.\");return}var sendParam=new Object();if(jsonParam!=undefined){sendParam=jsonParam}$.ajaxSetup({async:false});$.ajax({url:unitURL,type:\"POST\",async:false,cache:false,timeout:3000,data:sendParam,dateType:'json',success:function(returnData){result=returnData},error:function(request,status){var err=\"[Unit Rest Service Error]\";err+=\"\\n- Status : \"+request.status;err+=\"\\n- Message : \"+request.responseText;console.log(err)}}).done(function(){return result});return result}$(function(){$(\"input[type=file][name]\").change(function(){unit_fileSave(this)})});function unit_fileGet(fldName,callBack){var sumSize=0;var sumCount=0;var sendParam=new Object();sendParam.UUID=unit_service_uuid;sendParam.FLD_NAME=fldName;$.ajaxSetup({async:false});$.ajax({url:sysdir+'/unit-load-files',type:\"POST\",async:false,cache:false,timeout:3000,data:sendParam,dateType:'json',success:function(returnData){sumSize=returnData.SUM_SIZE;sumCount=returnData.SUM_COUNT;var callbackEval=callBack+\"(obj);\";unit_fn_eval(callbackEval,returnData)},error:function(request,status){var err=\"[Unit File Load Service Error]\";err+=\"\\n- Status : \"+request.status;err+=\"\\n- Message : \"+request.responseText;console.log(err)}}).done(function(){$(\"input[type='file'][name='\"+fldName+\"']\").attr(\"sumsize\",sumSize);$(\"input[type='file'][name='\"+fldName+\"']\").attr(\"sumcount\",sumCount)})}function unit_fileSet(fldName,callBack,maxSize,totalSize,totalCount){var $fileObj=$(\"input[type=file][name='\"+fldName+\"']\");if($fileObj){$fileObj.attr(\"callback\",callBack);if(maxSize!=undefined){$fileObj.attr(\"maxsize\",maxSize)}else{$fileObj.attr(\"maxsize\",\"99999\")}if(totalSize!=undefined){$fileObj.attr(\"totalsize\",totalSize)}else{$fileObj.attr(\"totalsize\",\"99999\")}if(totalCount!=undefined){$fileObj.attr(\"totalcount\",totalCount)}else{$fileObj.attr(\"totalcount\",\"99999\")}if(totalSize!=undefined||totalCount!=undefined){$fileObj.attr(\"multiple\",\"multiple\")}}}function unit_fileMsg(fldName,maxSizeMsg,totalSizeMsg,totalCountMsg){var $fileObj=$(\"input[type=file][name='\"+fldName+\"']\");if($fileObj){$fileObj.attr(\"maxsize_msg\",maxSizeMsg);$fileObj.attr(\"totalsize_msg\",totalSizeMsg);$fileObj.attr(\"totalcount_msg\",totalCountMsg)}}function unit_fileSave(thisObj){var $this=$(thisObj);if($this.attr(\"callback\")){var failFlag=true;failMsg=\"\";var maxSize=99999;var totalSize=99999;var totalCount=99999;var sumSize=0;var sumCount=0;var callback=$this.attr(\"callback\");var field=$this.attr(\"name\");var multipleYn=\"N\";if($this.attr(\"maxsize\")){maxSize=$this.attr(\"maxsize\")}if($this.attr(\"totalsize\")){totalSize=$this.attr(\"totalsize\")}if($this.attr(\"totalcount\")){totalCount=$this.attr(\"totalcount\")}if($this.attr(\"multiple\")){multipleYn=\"Y\"}var sumSize=0;sumCount=0;if($this.attr(\"sumsize\")){sumSize=parseInt($this.attr(\"sumsize\"))}else{$this.attr(\"sumsize\",\"0\");sumSize=0}if($this.attr(\"sumcount\")){sumCount=parseInt($this.attr(\"sumcount\"))}else{$this.attr(\"sumcount\",\"0\");sumCount=0}$.each(thisObj.files,function(){if((thisObj.files/(1024*1024))>maxSize){failFlag=false;failMsg=$this.attr(\"maxsize_msg\")?$this.attr(\"maxsize_msg\"):\"\";failMsg=failMsg.replace(/###/gi,maxSize).replace(/\\\\n/gi,\"\\\\\");return false}sumSize+=$this.size;sumCount++});if((sumSize/(1024*1024))>totalSize){failFlag=false;failMsg=$this.attr(\"totalsize_msg\")?$this.attr(\"totalsize_msg\"):\"\";failMsg=failMsg.replace(/###/gi,totalSize).replace(/\\\\n/gi,\"\\\\n\")}if(sumCount>totalCount){failFlag=false;failMsg=$this.attr(\"totalcount_msg\")?$this.attr(\"totalcount_msg\"):\"\";failMsg=failMsg.replace(/###/gi,totalCount).replace(/\\\\n/gi,\"\\\\n\")}if(failFlag==false){if($.browser.msie){$this.replaceWith($this.clone(true))}else{$this.val(\"\")}if(failMsg!=\"\"){alert(failMsg.replace(/\\\\n/gi,\"\\n\"))}}else{unit_loading_flag=true;var formData=new FormData();formData.append(\"UUID\",unit_service_uuid);formData.append(\"FIELD\",field);formData.append(\"MULTIPLE\",multipleYn);$.each(thisObj.files,function(index,file){if((thisObj.size/(1024*1024))<=maxSize){formData.append(field+\"|\"+index,file)}});$.ajaxSetup({async:false});$.ajax({type:'POST',url:sysdir+'/unit-upload-files',processData:false,contentType:false,data:formData,timeout:3000,success:function(returnData){if($.type(returnData)==\"object\"){sumSize=returnData.SUM_SIZE;sumCount=returnData.SUM_COUNT;var callbackEval=callback+\"(obj);\";unit_fn_eval(callbackEval,returnData)}},error:function(request,status){var err=\"[Unit Rest File Service Error]\";err+=\"\\n- Status : \"+request.status;err+=\"\\n- Message : \"+request.responseText;console.log(err)}}).done(function(){unit_loading_flag=false;if($.browser.msie){$(\"input[type=file][name='\"+field+\"'][callback]\").replaceWith($(\"input[type=file][name='\"+field+\"'][callback]\").clone(true))}else{$(\"input[type=file][name='\"+field+\"'][callback]\").val(\"\")}$this.attr(\"sumsize\",sumSize);$this.attr(\"sumcount\",sumCount)})}}}function unit_fileDelete(unitUuid,fileUuid,fldName,callBack){var sumSize=0;var sumCount=0;var sendParam=new Object();sendParam.UUID=unitUuid;sendParam.FUID=fileUuid;sendParam.FLD_NAME=fldName;$.ajaxSetup({async:false});$.ajax({url:sysdir+'/unit-delete-files',type:\"POST\",async:false,cache:false,timeout:3000,data:sendParam,dateType:'json',success:function(returnData){sumSize=returnData.SUM_SIZE;sumCount=returnData.SUM_COUNT;var callbackEval=callBack+\"(obj);\";unit_fn_eval(callbackEval,returnData)},error:function(request,status){var err=\"[Unit File Delete Service Error]\";err+=\"\\n- Status : \"+request.status;err+=\"\\n- Message : \"+request.responseText;console.log(err)}}).done(function(){$(\"input[type='file'][name='\"+fldName+\"']\").attr(\"sumsize\",sumSize);$(\"input[type='file'][name='\"+fldName+\"']\").attr(\"sumcount\",sumCount)})}function unit_fileClear(unitUuid,callBack){if(unitUuid==null||unitUuid==\"\"){return}unit_fileDelete(unitUuid,\"\",\"\",callBack)}function unit_fileDel(unitUuid,fldName,callBack){if(unitUuid==null||unitUuid==\"\"){return}if(fldName==null||fldName==\"\"){return}unit_fileDelete(unitUuid,\"\",fldName,callBack)}function unit_fileDel(fileUuid,callBack){if(fileUuid==null||fileUuid==\"\"){return}unit_fileDelete(\"\",fileUuid,\"\",callBack)}function unit_fileImage(fileUuid){if(fileUuid==null||fileUuid==\"\"){return}return sysdir+\"/image?fid=\"+fileUuid}function unit_fileDown(fileUuid){$('<iframe/>',{id:\"unit_download_\"+Math.ceil(Math.random()*10000),src:sysdir+\"/download?fid=\"+fileUuid,onload:\"this.remove()\"}).appendTo('body')}function unit_getValue(unitURL){var resultObj=unit_restService(unitURL);if($.type(resultObj)==\"object\"){if(resultObj.code==\"0000\"){return resultObj.out.unitValue.data[0]}}return null}function unit_setValue(unitURL,jsonParam){var resultObj=unit_restService(unitURL,jsonParam);unit_isComplete(resultObj)}function unit_getParams(ObjId){var params=new Object();params[\"SERVICE_UUID\"]=unit_service_uuid;$(\"#\"+ObjId).find(\"input[type=text][name], input[type=password][name], input[type=hidden][name], textarea[name], select[name]\").each(function(){var thisName=$(this).attr(\"name\");if(params[thisName]==undefined){if($(\"#\"+ObjId).find(\"[name='\"+thisName+\"']\").length>1){var thisValue=new Array;$(\"#\"+ObjId).find(\"[name='\"+thisName+\"']\").each(function(){thisValue.push($(this).val())});params[thisName]=thisValue}else{var thisValue=$(this).val();params[thisName]=thisValue}}});$(\"#\"+ObjId).find(\"input[type=checkbox][name]\").each(function(){var thisName=$(this).attr(\"name\");var objCnt=$(\"#\"+ObjId).find(\"input[type=checkbox][name='\"+thisName+\"']\").length;if(objCnt==1){if($(\"#\"+ObjId).find(\"input[type=checkbox][name='\"+thisName+\"']\").prop(\"checked\")){var thisValue=$(this).val()}}else{var thisValue=new Array;$(\"#\"+ObjId).find(\"input[type=checkbox][name='\"+thisName+\"']:checked\").each(function(){thisValue.push($(this).val())})}params[thisName]=thisValue});$(\"#\"+ObjId).find(\"input[type=radio][name]:checked\").each(function(){var thisName=$(this).attr(\"name\");var thisValue=$(this).val();params[thisName]=thisValue});return params};function unit_isComplete(resultObj){if($.type(resultObj)==\"object\"){if(resultObj.code==\"0000\"){if($.trim(resultObj.message)!=\"\"){alert(resultObj.message)}return true}else if(resultObj.code==\"0001\"){if($.trim(resultObj.message)!=\"\"){alert(resultObj.message)}location.reload()}else if(resultObj.code==\"0002\"){if($.trim(resultObj.message)!=\"\"){alert(resultObj.message)}location.href=resultObj.target}else{if(resultObj.code!=undefined){$(\"[name='\"+resultObj.target+\"']\").focus();var err=\"[Unit Rest Service Vo]\";err+=\"\\n\"+resultObj.param_vo;console.log(err)}if($.trim(resultObj.message)!=\"\"){alert(resultObj.message)}}}return false};function unit_log(resultObj){var msg=\"[ Unit Developer Log ]\";msg+=\"\\n1. Type : \";msg+=$.type(resultObj);msg+=\"\\n2. Length : \";if($.type(resultObj)==\"null\"||$.type(resultObj)==\"undefined\"){msg+=\"0\"}else if($.type(resultObj)==\"object\"){msg+=JSON.stringify(resultObj).length}else{msg+=resultObj.length}msg+=\"\\n3. Data :\";msg+=\"\\n\";msg+=($.type(resultObj)==\"object\"||$.type(resultObj)==\"array\")?JSON.stringify(resultObj):resultObj;console.log(msg);alert(msg)};$(function(){setTimeout(function(){$(\"input[type=radio][val]\").each(function(){if($(this).attr(\"val\")==$(this).attr(\"value\")){$(this).prop(\"checked\",true);$(this).trigger(\"change\")}});$(\"select[val]\").each(function(){if($(this).attr(\"val\")!=\"\"){$(this).val($(this).attr(\"val\"));$(this).trigger(\"change\")}})},100)});function dateFormat(date){var tdate=new Date(date);return fillZero(tdate.getFullYear(),4)+fillZero(tdate.getMonth()+1,2)+fillZero(tdate.getDate(),2)+fillZero(tdate.getHours(),2)+fillZero(tdate.getMinutes(),2)+fillZero(tdate.getSeconds(),2)}function fillZero(n,digits){var zero='';n=n.toString();if(n.length<digits){for(i=0;i<digits-n.length;i++){zero+='0'}}return zero+n}function cvKbyte(num,digits){var numKByte=parseInt(num);var numMbyte=numKByte/1024;var digitsPow=Math.pow(10,digits);var numFloor=Math.floor(numMbyte*digitsPow);return numFloor/digitsPow}function cvMbyte(num,digits){var numKByte=parseInt(num);var numMbyte=numKByte/(1024*1024);var digitsPow=Math.pow(10,digits);var numFloor=Math.floor(numMbyte*digitsPow);return numFloor/digitsPow}jQuery.browser={};(function(){jQuery.browser.msie=false;jQuery.browser.version=0;if(navigator.userAgent.match(/MSIE([0-9]+)\\./)){jQuery.browser.msie=true;jQuery.browser.version=ReExp.$1}})();var unit_ws_object;var unit_ws_group;var unit_ws_callback;function unit_wsOpen(groupNm,callbackNm){if($.trim(groupNm)==\"\"){return}if(unit_ws_object!==undefined&&unit_ws_object.readyState!==WebSocket.CLOSED){return}unit_ws_object=new WebSocket(unit_ws_url);unit_ws_object.onopen=function(event){if(event.data===undefined){return}};unit_ws_object.onmessage=function(event){eval(callbackNm+\"(event)\")};unit_ws_object.onclose=function(event){}}function unit_wsClose(){unit_ws_object.close()}function unit_wsSend(){var sendMsg=unit_ws_group;unit_ws_object.send(sendMsg)}$(function(){$(document).unload(function(){unit_wsClose()})});";				
		return new ModelAndView("unit", "string", tx);
	}
		
	/**
	 * 세션저장 메소드
	 * @param svo
	 * @return 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/unit-set-value.json", method=RequestMethod.POST)
	public @ResponseBody UnitSVO setValue(UnitSVO svo) throws Exception{		
		if ( "unit-set-value".equals(svo.getFunc()) ) {
			for ( Entry<String, Object> item : svo.getIn().entrySet() ) {
				if ( !"u".equals( item.getKey() ) ) {				
					svo.setValue(item.getKey(), String.valueOf(item.getValue()));
				}
			}
			String certKey = EncryptUtil.md5( svo.getParam(0) ).substring(0, 5);		
			Map<String, Object> view = new HashMap<String, Object>();
			if ( ((Map<String, Object>)RequestUtil.getSession()).containsKey("UNIT_VIEWS_"+ certKey)) {
				view = (Map<String, Object>) JsonUtil.getMapFromJsonString(RequestUtil.getSession("UNIT_VIEWS_"+ certKey).toString());
			}
			if ( svo.getViews().containsKey("values") ) {				
				view.put("VALUES", svo.getValues());				
				RequestUtil.setSession("UNIT_VIEWS_"+ certKey , JsonUtil.getJsonStringFromMap(view));
			}
		}
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder .getRequestAttributes()).getRequest();
		new UnitVO().move(request.getContextPath() + svo.getParam(0), svo.getPageCd(), "", "");
		return svo;
	}
	
	/**
	 * 첨부파일 저장 메소드
	 * @param svo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/unit-upload-files", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> uploadFiles(MultipartHttpServletRequest request) throws Exception{		
		Map<String, Object> params = new HashMap<String, Object>();
		String fldName = "";
		String uploadPath = "";
		String uploadFullPath = "";
		String Uuid = request.getParameter("UUID");
		String Field = request.getParameter("FIELD");
		String MultipleYn = request.getParameter("MULTIPLE");
		
		// Single File : Another file Delete
		if ( "N".equals(MultipleYn) ) {
			// 파일 업로드 > 리스트
			params = new HashMap<String, Object>();
			params.put( "unitUuid", Uuid );
			params.put( "fldName", Field );
			List<Map<String, Object>> fileFieldList = unitFileService.selectFileField(params);		
			for(Map<String, Object> fileData : fileFieldList) {
				String FileUuid = fileData.get("FILE_UUID").toString();			
				
				// 파일 삭제하기
				String filePath = request.getSession().getServletContext().getRealPath("/FILES-INF/"+ FileUuid.substring(0, 8)+"/"+FileUuid);		
				File file = new File(filePath);
				if ( file.exists() ) { file.delete();	}
				
				// 파일 업로드 > 삭제하기
				params = new HashMap<String, Object>();
				params.put( "fileUuid", FileUuid );			
				unitFileService.deleteFileData(params);
			}
		}		
		
		Iterator<String> upfileList =  request.getFileNames();
		while (upfileList.hasNext()) {
			MultipartFile upfile = request.getFile((String)upfileList.next());			
			if (upfile.getSize() > 0) {
			
				String FileUuid = DateTimeUtil.getNowDate() + DateTimeUtil.getNowTime() + String.valueOf( UUID.randomUUID() ).replaceAll("-", "").toUpperCase();
				String FieldName = upfile.getName().split("\\|")[0];
				String FieldOrder = upfile.getName().split("\\|")[1];
				String OriginalFilename = upfile.getOriginalFilename();
				String OriginalFileExtend ="";
				if ( OriginalFilename.indexOf(".") > -1 ) { OriginalFileExtend = OriginalFilename.substring( OriginalFilename.lastIndexOf(".")+1 ).toUpperCase(); }
				String ContentType = upfile.getContentType();				
				long Size = upfile.getSize();				
				String SafeName = URLEncoder.encode(OriginalFilename, "UTF-8").replace("+", "%20");				
				fldName = FieldName;
				
				params = new HashMap<String, Object>();
				params.put("unitUuid", Uuid);
				params.put("fileUuid", FileUuid);
				params.put("fldName", FieldName);
				params.put("fldOrder", FieldOrder);				
				params.put("fileName", OriginalFilename);
				params.put("fileExtension", OriginalFileExtend);
				params.put("fileType", ContentType);
				params.put("fileSize", Size);
				params.put("fileSafeName", SafeName);				
				params.put("sysRegDtm", DateTimeUtil.getNowDate() + DateTimeUtil.getNowTime());				
				
				// 파일 업로드 > 등록하기
				unitFileService.insertFileData(params);
				
				// 파일 저장하기
				uploadPath = request.getSession().getServletContext().getRealPath("/FILES-INF/"+ FileUuid.substring(0, 8)+"/");
				uploadFullPath = request.getSession().getServletContext().getRealPath("/FILES-INF/"+ FileUuid.substring(0, 8)+"/"+ FileUuid);
				File directory = new File(uploadPath);
				if ( directory.exists() == false ) { directory.mkdirs(); }
				
				if( ContentType.indexOf("PDF")  > -1 || ContentType.indexOf("pdf")  > -1 || ContentType.indexOf("application/pdf") > -1 ) {
//					upfile.transferTo(new File(uploadFullPath));
				    
				} else if( ContentType.indexOf("jpg") > -1 || ContentType.indexOf("jpeg") > -1 ) { //|| ContentType.indexOf("png") > -1
					
					byte[] imgBytes = upfile.getBytes();
					BufferedInputStream bufferedIS = new BufferedInputStream(new ByteArrayInputStream(imgBytes));
					ByteArrayInputStream byteIS = new ByteArrayInputStream(imgBytes);
					BufferedImage buffredI = rotateImageForMobile(byteIS, getOrientation(bufferedIS));
					
					File convFile = new File(uploadFullPath);
				    ImageIO.write(buffredI, OriginalFileExtend, convFile);
					makeJPG(buffredI, convFile);
				}

				upfile.transferTo(new File(uploadFullPath));	
			}
		}
		
		// 파일 업로드 > 리스트
		params = new HashMap<String, Object>();
		params.put( "unitUuid", request.getParameter("UUID") );	
		params.put( "fldName", fldName );
		List<Map<String, Object>> fileFieldList = unitFileService.selectFileField(params);
		List<Map<String, Object>> newFileFieldList = new ArrayList<Map<String, Object>>();
		
		int sumSize = 0; int sumCount = 0;
		for(Map<String, Object> fileData : fileFieldList) {
			String FUuid = fileData.get("FILE_UUID").toString();			
			if ( (new File(request.getSession().getServletContext().getRealPath("/FILES-INF/"+ FUuid.substring(0, 8)+"/"+FUuid))).exists() ) { fileData.put("FILE_EXISTS", "Y"); } else { fileData.put("FILE_EXISTS", "N"); }			
			if ( fileData.get("FILE_TYPE").toString().startsWith("image/") && "Y".equals( fileData.get("FILE_EXISTS").toString()) ) { fileData.put("IMAGE_YN", "Y"); } else { fileData.put("IMAGE_YN", "N"); }
			newFileFieldList.add(fileData);
			sumSize += Integer.parseInt( fileData.get("FILE_SIZE").toString() );
			sumCount++;
		}
		
		Map<String, Object> result = new HashMap<String, Object>();	
		result.put("UNIT_UUID", request.getParameter("UUID") );	
		result.put("FLD_NAME", fldName );
		result.put("SUM_COUNT", sumCount);		
		result.put("SUM_SIZE", sumSize);
		result.put("FILES", newFileFieldList );		
		return result;	
	}
	
	 public int getOrientation(BufferedInputStream is) throws IOException {
		 int orientation = 1;
	      try {
	            Metadata metadata = ImageMetadataReader.readMetadata(is, true);
	            Directory directory = metadata.getDirectory(ExifIFD0Directory.class);
	             
	            orientation = directory.getInt(ExifIFD0Directory. TAG_ORIENTATION);
	             
	      } catch (Exception e) {
	             e.printStackTrace();
	      }
	      
      return orientation;
}
	 
	  public BufferedImage rotateImageForMobile(InputStream is,int orientation) throws IOException {
         BufferedImage bi = ImageIO. read(is);
          if(orientation == 6){ //정위치
                 return rotateImage(bi, 90);
         } else if (orientation == 1){ //왼쪽으로 눞였을때
                 return bi;
         } else if (orientation == 3){//오른쪽으로 눞였을때
                 return rotateImage(bi, 180);
         } else if (orientation == 8){//180도
                 return rotateImage(bi, 270);      
         } else{
                 return bi;
         }       
  }

   public BufferedImage rotateImage(BufferedImage orgImage,int radians) {
         BufferedImage newImage;
          if(radians==90 || radians==270){
                newImage = new BufferedImage(orgImage.getHeight(),orgImage.getWidth(),orgImage.getType());
         } else if (radians==180){
                newImage = new BufferedImage(orgImage.getWidth(),orgImage.getHeight(),orgImage.getType());
         } else{
                 return orgImage;
         }
         Graphics2D graphics = (Graphics2D) newImage.getGraphics();
         graphics.rotate(Math. toRadians(radians), newImage.getWidth() / 2, newImage.getHeight() / 2);
         graphics.translate((newImage.getWidth() - orgImage.getWidth()) / 2, (newImage.getHeight() - orgImage.getHeight()) / 2);
         graphics.drawImage(orgImage, 0, 0, orgImage.getWidth(), orgImage.getHeight(), null );
         
          return newImage;
  }
   
   public void makeJPG(BufferedImage orgImage, File destFile) throws IOException {
       ResampleOp resampleOp = new ResampleOp(orgImage.getWidth(), orgImage.getHeight());
       resampleOp.setUnsharpenMask(AdvancedResizeOp.UnsharpenMask. None);
       BufferedImage rescaleadImage = resampleOp.filter(orgImage, null);
       ImageIO. write(rescaleadImage, "jpg", destFile);
}
	
	/**
	 * 파일 업로드 > 조회하기
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/unit-load-files", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> loadFiles(HttpServletRequest request) throws Exception{		
		Map<String, Object> params = new HashMap<String, Object>();
		
		// 파일 업로드 > 리스트
		params = new HashMap<String, Object>();
		params.put( "unitUuid", request.getParameter("UUID") );
		params.put( "fldName", request.getParameter("FLD_NAME") );
		List<Map<String, Object>> fileFieldList = unitFileService.selectFileField(params);
		List<Map<String, Object>> newFileFieldList = new ArrayList<Map<String, Object>>();
		
		int sumSize = 0; int sumCount = 0;
		for(Map<String, Object> fileData : fileFieldList) {
			String FUuid = fileData.get("FILE_UUID").toString();			
			if ( (new File(request.getSession().getServletContext().getRealPath("/FILES-INF/"+ FUuid.substring(0, 8)+"/"+FUuid))).exists() ) { fileData.put("FILE_EXISTS", "Y"); } else { fileData.put("FILE_EXISTS", "N"); }			
			if ( fileData.get("FILE_TYPE").toString().startsWith("image/") && "Y".equals( fileData.get("FILE_EXISTS").toString()) ) { fileData.put("IMAGE_YN", "Y"); } else { fileData.put("IMAGE_YN", "N"); }
			newFileFieldList.add(fileData);
			sumSize += Integer.parseInt( fileData.get("FILE_SIZE").toString() );
			sumCount++;
		}
				
		Map<String, Object> result = new HashMap<String, Object>();	
		result.put("UNIT_UUID", request.getParameter("UUID") );			
		result.put("SUM_COUNT", sumCount);		
		result.put("SUM_SIZE", sumSize);
		result.put("FILES", newFileFieldList );		
		return result;		
	}
	
	/**
	 * 파일 업로드 > 삭제하기
	 * @param request
	 * @return
	 * @throws Exception
	 */	
	@RequestMapping(value="/unit-delete-files", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteFiles(HttpServletRequest request) throws Exception{		
		Map<String, Object> params = new HashMap<String, Object>();
		String UnitUuid = request.getParameter("UUID");
		String FileUuid = request.getParameter("FUID");
		String fldName = request.getParameter("FLD_NAME");
		
		if ( UnitUuid.isEmpty() == false && fldName.isEmpty() == true ) {
			
			// 전체 삭제
			params = new HashMap<String, Object>();
			params.put( "unitUuid", UnitUuid );		
			List<Map<String, Object>> fileList = unitFileService.selectFileAll(params);
			for(Map<String, Object> fileData : fileList) {
				String fileUuid = fileData.get("FILE_UUID").toString();
				deleteFile(request, fileUuid);
			}
			
		} else if ( UnitUuid.isEmpty() == false && fldName.isEmpty() == false ) {
			
			// 필드 지정 삭제
			params = new HashMap<String, Object>();
			params.put( "unitUuid", UnitUuid );
			params.put( "fldName", fldName );
			List<Map<String, Object>> fileList = unitFileService.selectFileField(params);
			for(Map<String, Object> fileData : fileList) {
				String fileUuid = fileData.get("FILE_UUID").toString();
				deleteFile(request, fileUuid);
			}
			
		} else if ( UnitUuid.isEmpty() == true && FileUuid.isEmpty() == false ) {
			
			// 개별 삭제
			params = new HashMap<String, Object>();
			params.put( "fileUuid", FileUuid );			
			Map<String, Object> fileData = unitFileService.selectFileDetail(params);	
			if (fileData != null) {
				UnitUuid = fileData.get("UNIT_UUID").toString();
				fldName = fileData.get("FLD_NAME").toString();
				deleteFile(request, FileUuid);
			}
			
		}
		
		int sumSize = 0; int sumCount = 0;
		List<Map<String, Object>> newFileFieldList = new ArrayList<Map<String, Object>>();
		
		if ( fldName.isEmpty() == false ) {
			// 파일 업로드 > 리스트
			params = new HashMap<String, Object>();
			params.put( "unitUuid", UnitUuid );
			params.put( "fldName", fldName );
			List<Map<String, Object>> fileFieldList = unitFileService.selectFileField(params);
			
			for(Map<String, Object> fileData : fileFieldList) {
				String FUuid = fileData.get("FILE_UUID").toString();			
				if ( (new File(request.getSession().getServletContext().getRealPath("/FILES-INF/"+ FUuid.substring(0, 8)+"/"+FUuid))).exists() ) { fileData.put("FILE_EXISTS", "Y"); } else { fileData.put("FILE_EXISTS", "N"); }			
				if ( fileData.get("FILE_TYPE").toString().startsWith("image/") && "Y".equals( fileData.get("FILE_EXISTS").toString()) ) { fileData.put("IMAGE_YN", "Y"); } else { fileData.put("IMAGE_YN", "N"); }
				newFileFieldList.add(fileData);
				sumSize += Integer.parseInt( fileData.get("FILE_SIZE").toString() );
				sumCount++;
			}
		}
				
		Map<String, Object> result = new HashMap<String, Object>();	
		result.put("UNIT_UUID", UnitUuid );			
		result.put("SUM_COUNT", sumCount);		
		result.put("SUM_SIZE", sumSize);
		result.put("FILES", newFileFieldList );
		
		return result;		
	}
	private void deleteFile(HttpServletRequest request, String FileUuid) throws Exception{
		// 파일 삭제하기
		String filePath = request.getSession().getServletContext().getRealPath("/FILES-INF/"+ FileUuid.substring(0, 8)+"/"+FileUuid);		
		File file = new File(filePath);
		if ( file.exists() ) { file.delete();	}
		
		// 파일 업로드 > 삭제하기
		Map<String, Object> params = new HashMap<String, Object>();
		params.put( "fileUuid", FileUuid );			
		unitFileService.deleteFileData(params);
	}
		
	/**
	 * 첨부파일 이미지로 불러오기
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/image", method=RequestMethod.GET)	
	public ModelAndView image (@RequestParam(value="fid") String fileUuid,  HttpServletRequest request, HttpServletResponse response) throws Exception{			
		// 파일 정보 상세 조회
		Map<String, Object> params = new HashMap<String, Object>();
		params.put( "fileUuid", fileUuid );		
		Map<String, Object> fileDetail = unitFileService.selectFileDetail(params);
//		return new ModelAndView("image", "FileDetail", fileDetail);	
		return new ModelAndView("unit", "image", fileDetail);
		
	}
	
	/**
	 * 첨부파일 다운로드 파일로 불러오기
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/download", method=RequestMethod.GET)	
	public ModelAndView download (@RequestParam(value="fid") String fileUuid,  HttpServletRequest request, HttpServletResponse response) throws Exception{		
		// 파일 정보 상세 조회
		Map<String, Object> params = new HashMap<String, Object>();
		params.put( "fileUuid", fileUuid );		
		Map<String, Object> fileDetail = unitFileService.selectFileDetail(params);
//		return new ModelAndView("download", "FileDetail", fileDetail);		
		return new ModelAndView("unit", "download", fileDetail);
	}
			
}


/*
 * Script 원본 내용 ( last edit : 2019-07-31 )
 * 인코딩 by (  http://dean.edwards.name/packer/  )

<script type="text/javascript">

$(function(){
	$.getScript("https://kit.fontawesome.com/35f90b3902.js");
});
		
var unit_loading_flag = false;
function setUuid(uuid){
	if (uuid != undefined && uuid != ""){
		unit_service_uuid = uuid;
	}
}

function unit_restService( unitURL, jsonParam ){
	var result = new Object();
	if ( unit_loading_flag ){	
		alert("파일 업로드가 진행중입니다.\n업로드 완료 후 다시 시도해 주시기 바랍니다.");
		return;
	} 
	var sendParam = new Object();
	if ( jsonParam != undefined ){ sendParam = jsonParam; }	
	$.ajaxSetup({ async:false });
	$.ajax({
		url : unitURL,
		type: "POST",
		async : false,
	    cache: false,	
	    timeout : 3000,
		data : sendParam,  
		dateType : 'json',
        success: function(returnData) {        	
        	result = returnData;	
        },
        error: function(request, status){ 
        	var err = "[Unit Rest Service Error]";        
        	err += "\n- Status : "+ request.status;
        	err += "\n- Message : "+ request.responseText;    
        	console.log(err);        	
        }        
	}).done(function() { 
		return result;
	});
	return result;
}

$(function(){
	$("input[type=file][name]").change(function(){		
		unit_fileSave( this );
	});
});
function unit_fileGet(fldName, callBack){
	var sumSize = 0; 
	var sumCount = 0;
	var sendParam = new Object();
	sendParam.UUID = unit_service_uuid;	
	sendParam.FLD_NAME = fldName;
	$.ajaxSetup({ async:false });
	$.ajax({
		url : sysdir+'/unit-load-files',
		type: "POST",
		async : false,
	    cache: false,	
	    timeout : 3000,
		data : sendParam,  
		dateType : 'json',
        success: function(returnData) {
        	sumSize = returnData.SUM_SIZE;
		    sumCount = returnData.SUM_COUNT;
        	var callbackEval = callBack +"(obj);";
			unit_fn_eval(callbackEval, returnData);		        	
        },
        error: function(request, status){ 
        	var err = "[Unit File Load Service Error]";        
        	err += "\n- Status : "+ request.status;
        	err += "\n- Message : "+ request.responseText;    
        	console.log(err);
        }        
	}).done(function() { 
        $("input[type='file'][name='"+fldName+"']").attr("sumsize", sumSize);
	    $("input[type='file'][name='"+fldName+"']").attr("sumcount", sumCount);
	});
}

function unit_fileSet(fldName, callBack, maxSize, totalSize, totalCount){
	var $fileObj = $("input[type=file][name='"+fldName+"']");	
	if ( $fileObj ){
		$fileObj.attr("callback", callBack);
		if( maxSize != undefined ){ $fileObj.attr("maxsize", maxSize); } else { $fileObj.attr("maxsize", "99999"); }
		if( totalSize != undefined ){ $fileObj.attr("totalsize", totalSize); } else { $fileObj.attr("totalsize", "99999"); }
		if( totalCount != undefined ){ $fileObj.attr("totalcount", totalCount); } else { $fileObj.attr("totalcount", "99999"); }
		if( totalSize != undefined || totalCount != undefined ){ $fileObj.attr("multiple","multiple"); }			
	}
}

function unit_fileMsg(fldName, maxSizeMsg, totalSizeMsg, totalCountMsg){
	var $fileObj = $("input[type=file][name='"+fldName+"']");
	if ( $fileObj ){
		$fileObj.attr("maxsize_msg", maxSizeMsg);
		$fileObj.attr("totalsize_msg", totalSizeMsg);
		$fileObj.attr("totalcount_msg", totalCountMsg);
	}
}

function unit_fileSave(thisObj){	
	var $this = $(thisObj);
	if( $this.attr("callback") ){		
		var failFlag = true; failMsg = "";	
		var maxSize = 99999;
		var totalSize = 99999;
		var totalCount = 99999;
		var sumSize = 0;
		var sumCount = 0;
		var callback = $this.attr("callback");
		var field = $this.attr("name");
		var multipleYn = "N";
		
		if ( $this.attr("maxsize") ){ maxSize = $this.attr("maxsize"); }
		if ( $this.attr("totalsize") ){ totalSize = $this.attr("totalsize"); }
		if ( $this.attr("totalcount") ){ totalCount = $this.attr("totalcount"); }
		if ( $this.attr("multiple") ){ multipleYn = "Y"; }
		
		var sumSize = 0; sumCount = 0;
		if ( $this.attr("sumsize") ){ sumSize = parseInt( $this.attr("sumsize") ); } else { $this.attr("sumsize", "0"); sumSize = 0; }
		if ( $this.attr("sumcount") ){ sumCount = parseInt( $this.attr("sumcount") ); } else { $this.attr("sumcount", "0"); sumCount = 0; }
		
		$.each(thisObj.files, function(){ 			
			if ( (thisObj.files/(1024*1024)) > maxSize ) { 
				failFlag = false; 
				failMsg = $this.attr("maxsize_msg") ? $this.attr("maxsize_msg") : ""; 
				failMsg = failMsg.replace(/###/gi, maxSize).replace(/\\n/gi,"\\"); 
				return false; 
			}
			sumSize += $this.size;	sumCount++; 
		});		
		if ( (sumSize/(1024*1024)) > totalSize ) { 
			failFlag = false; 
			failMsg = $this.attr("totalsize_msg") ? $this.attr("totalsize_msg") : ""; 
			failMsg = failMsg.replace(/###/gi, totalSize).replace(/\\n/gi,"\\n"); 
		}
		if ( sumCount > totalCount ) { 
			failFlag = false; 
			failMsg = $this.attr("totalcount_msg") ? $this.attr("totalcount_msg") : "";  
			failMsg = failMsg.replace(/###/gi, totalCount).replace(/\\n/gi,"\\n"); 
		}
		
		if ( failFlag == false ){
			if ( $.browser.msie ){ $this.replaceWith( $this.clone(true) ); } else { $this.val(""); }
			if ( failMsg != "" ){ alert( failMsg.replace(/\\n/gi, "\n") ); }			
		} else {
			unit_loading_flag = true;
			var formData = new FormData();
			formData.append("UUID", unit_service_uuid);
			formData.append("FIELD", field);
			formData.append("MULTIPLE", multipleYn);
			$.each(thisObj.files, function(index, file){
				if ( (thisObj.size/(1024*1024)) <= maxSize ){					
					formData.append(field+"|"+index, file);				
				}
			});
			$.ajaxSetup({ async:false });
			$.ajax({
			 	type: 'POST',
			 	url: sysdir+'/unit-upload-files',
				processData: false,
				contentType: false,
				data: formData,
				timeout : 3000,
		        success: function(returnData) {
		        	if ($.type(returnData) == "object"){		
		        		sumSize = returnData.SUM_SIZE;
		        		sumCount = returnData.SUM_COUNT;			        	
			        	var callbackEval = callback +"(obj);";
			        	unit_fn_eval(callbackEval, returnData);
		        	}				        	
		        },
		        error: function(request, status){ 		        	
		        	var err = "[Unit Rest File Service Error]";  
		        	err += "\n- Status : "+ request.status;
		        	err += "\n- Message : "+ request.responseText;    
		        	console.log(err);
		        }
			}).done(function() {  
				unit_loading_flag = false;
				if ( $.browser.msie ){ $("input[type=file][name='"+field+"'][callback]").replaceWith( $("input[type=file][name='"+field+"'][callback]").clone(true) ); } else { $("input[type=file][name='"+field+"'][callback]").val(""); }
		        $this.attr("sumsize", sumSize);
			    $this.attr("sumcount", sumCount);
			});
		}
	}
}

function unit_fileDelete(unitUuid, fileUuid, fldName, callBack){
	var sumSize = 0; 
	var sumCount = 0;
	var sendParam = new Object();
	sendParam.UUID = unitUuid;
	sendParam.FUID = fileUuid;
	sendParam.FLD_NAME = fldName;
	$.ajaxSetup({ async:false });
	$.ajax({
		url : sysdir+'/unit-delete-files',
		type: "POST",
		async : false,
	    cache: false,	
	    timeout : 3000,
		data : sendParam,  
		dateType : 'json',
        success: function(returnData) {
        	sumSize = returnData.SUM_SIZE;
		    sumCount = returnData.SUM_COUNT;
        	var callbackEval = callBack +"(obj);";
			unit_fn_eval(callbackEval, returnData);		        	
        },
        error: function(request, status){ 
        	var err = "[Unit File Delete Service Error]";        
        	err += "\n- Status : "+ request.status;
        	err += "\n- Message : "+ request.responseText;    
        	console.log(err);
        }        
	}).done(function() { 
        $("input[type='file'][name='"+fldName+"']").attr("sumsize", sumSize);
	    $("input[type='file'][name='"+fldName+"']").attr("sumcount", sumCount);
	});
}

function unit_fileClear(unitUuid, callBack){
	if( unitUuid == null || unitUuid == "" ){ return; }
	unit_fileDelete(unitUuid, "", "", callBack);
}

function unit_fileDel(unitUuid, fldName, callBack){
	if( unitUuid == null || unitUuid == "" ){ return; }
	if( fldName == null || fldName == "" ){ return; }
	unit_fileDelete(unitUuid, "", fldName, callBack);
}

function unit_fileDel(fileUuid, callBack){
	if( fileUuid == null || fileUuid == "" ){ return; }
	unit_fileDelete("", fileUuid, "", callBack);
}

function unit_fileImage( fileUuid ){
	if( fileUuid == null || fileUuid == "" ){ return; }
	return sysdir+"/image?fid="+ fileUuid;
}

function unit_fileDown( fileUuid ){
	$('<iframe/>', {
		id: "unit_download_"+ Math.ceil( Math.random()*10000 ),
		src: sysdir+"/download?fid="+ fileUuid,
		onload: "this.remove()"
	}).appendTo('body');	
}

function unit_getValue ( unitURL ){
	var resultObj = unit_restService( unitURL );
	if ( $.type(resultObj) == "object" ){
		if ( resultObj.code == "0000" ){
			return resultObj.out.unitValue.data[0];
		}
	}
	return null;	
}

function unit_setValue ( unitURL, jsonParam ){
	var resultObj = unit_restService( unitURL, jsonParam );
	unit_isComplete(resultObj);
}

function unit_getParams(ObjId){			
	var params = new Object();
	params["SERVICE_UUID"] = unit_service_uuid;
	$("#"+ ObjId).find("input[type=text][name], input[type=password][name], input[type=hidden][name], textarea[name], select[name]").each(function(){
		var thisName = $(this).attr("name");
		if ( params[thisName] == undefined ){
			if ( $("#"+ ObjId).find("[name='"+thisName+"']").length > 1 ) {
				var thisValue = new Array;
				$("#"+ ObjId).find("[name='"+thisName+"']").each(function(){
					thisValue.push($(this).val());
				});
				params[thisName] = thisValue;
			} else { 
				var thisValue = $(this).val();
				params[thisName] = thisValue;
			}
		}
	});			
	$("#"+ ObjId).find("input[type=checkbox][name]").each(function(){	
		var thisName = $(this).attr("name");
		var objCnt = $("#"+ ObjId).find("input[type=checkbox][name='"+ thisName +"']").length;
		if ( objCnt == 1){
			if ( $("#"+ ObjId).find("input[type=checkbox][name='"+ thisName +"']").prop("checked") ){
				var thisValue = $(this).val();
			}			
		} else {
		var thisValue = new Array;
			$("#"+ ObjId).find("input[type=checkbox][name='"+ thisName +"']:checked").each(function(){
				thisValue.push($(this).val());
			});		
		}		
		params[thisName] = thisValue;		
	});
	$("#"+ ObjId).find("input[type=radio][name]:checked").each(function(){				
		var thisName = $(this).attr("name");
		var thisValue = $(this).val();
		params[thisName] = thisValue;
	});	
	return params;			
};

function unit_isComplete(resultObj){	
	if ( $.type(resultObj) == "object" ){
		if ( resultObj.code == "0000" ){
			if ( $.trim(resultObj.message) != "" ){ alert( resultObj.message ); }
			return true;
		} else if ( resultObj.code == "0001" ){
			if ( $.trim(resultObj.message) != "" ){ alert( resultObj.message ); }
			location.reload();	
		} else if ( resultObj.code == "0002" ){
			if ( $.trim(resultObj.message) != "" ){ alert( resultObj.message ); }
			location.href = resultObj.target;
		} else {			
			if ( resultObj.code != undefined ){
				$("[name='"+resultObj.target+"']").focus();
				var err = "[Unit Rest Service Vo]";        
	        	err += "\n" + resultObj.param_vo;	       
				console.log(err);				
			}
			if ( $.trim(resultObj.message) != "" ){ alert( resultObj.message ); }
		}				
	}
	return false;
};
		
function unit_log( resultObj ){
	var msg = "[ Unit Developer Log ]";
	msg += "\n1. Type : ";
	msg += $.type( resultObj );
	msg += "\n2. Length : ";			
	if ( $.type(resultObj) == "null" || $.type(resultObj) == "undefined" ){ msg += "0"; }
	else if ( $.type(resultObj) == "object") { msg += JSON.stringify(resultObj).length; }
	else { msg += resultObj.length; }
	msg += "\n3. Data :";
	msg += "\n";
	msg += ($.type(resultObj) == "object" || $.type(resultObj) == "array") ? JSON.stringify(resultObj) : resultObj;
	console.log(msg);
	alert(msg);
};

$(function(){
	setTimeout(function(){
		$("input[type=radio][val]").each(function(){
			if ( $(this).attr("val") == $(this).attr("value") ){ $(this).prop("checked", true); $(this).trigger("change"); }		
		});
		$("select[val]").each(function(){
			if ( $(this).attr("val") != "" ){
				$(this).val( $(this).attr("val") ); $(this).trigger("change");
			}
		});
	}, 100);
});

function dateFormat(date) {
	var tdate = new Date(date);
	return fillZero(tdate.getFullYear(), 4)+fillZero(tdate.getMonth() + 1, 2)+fillZero(tdate.getDate(), 2)+fillZero(tdate.getHours(), 2)+fillZero(tdate.getMinutes(), 2)+fillZero(tdate.getSeconds(), 2);
}

function fillZero(n, digits) {
	var zero = '';
	n = n.toString();
	if (n.length < digits) { for (i = 0; i < digits - n.length; i++) { zero += '0'; } }
	return zero + n;
}

function cvKbyte( num , digits ) {
	var numKByte = parseInt(num);
	var numMbyte = numKByte / 1024;
	var digitsPow = Math.pow(10, digits);	
	var numFloor = Math.floor( numMbyte * digitsPow);
	return numFloor / digitsPow;
}

function cvMbyte( num , digits ) {
	var numKByte = parseInt(num);
	var numMbyte = numKByte / (1024*1024);
	var digitsPow = Math.pow(10, digits);	
	var numFloor = Math.floor( numMbyte * digitsPow);
	return numFloor / digitsPow;
}

jQuery.browser = {};
(function(){
	jQuery.browser.msie = false;
	jQuery.browser.version = 0;
	if ( navigator.userAgent.match(/MSIE([0-9]+)\./)){
		jQuery.browser.msie = true;
		jQuery.browser.version = ReExp.$1;
	}
})();

var unit_ws_object;
var unit_ws_group;
var unit_ws_callback;
function unit_wsOpen(groupNm, callbackNm){
	if ($.trim(groupNm) == ""){ return; }
	if (unit_ws_object !== undefined && unit_ws_object.readyState !== WebSocket.CLOSED ){ return; }
     unit_ws_object = new WebSocket(unit_ws_url);     
     unit_ws_object.onopen = function(event){
         if(event.data === undefined){ return; }       
     };     
     unit_ws_object.onmessage = function(event){            
    	 eval(callbackNm+"("+event+")");    ;
     };    
     unit_ws_object.onclose = function(event){ }
}
function unit_wsClose(){
	unit_ws_object.close();
}
function unit_wsSend(){
     var sendMsg = unit_ws_group;
     unit_ws_object.send(sendMsg);    
 }
$(function(){	
	$(document).unload(function(){ unit_wsClose(); });
});

</script>

*/