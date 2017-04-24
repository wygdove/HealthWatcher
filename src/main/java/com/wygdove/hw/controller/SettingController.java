package com.wygdove.hw.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.wygdove.hw.common.constant.UriConstant;
import com.wygdove.hw.common.utils.DateUtil;
import com.wygdove.hw.common.utils.SessionUtil;
import com.wygdove.hw.mybatis.model.HwUser;
import com.wygdove.hw.service.setting.IDeviceService;
import com.wygdove.hw.service.setting.IEnvicityService;
import com.wygdove.hw.service.setting.IPersonalInfoService;
import com.wygdove.hw.service.setting.ISuggestService;
import com.wygdove.hw.vo.DeviceTableVo;
import com.wygdove.hw.vo.EnvicityVo;

@Controller
@RequestMapping("setting")
public class SettingController {
	private static final Logger _log=Logger.getLogger(SettingController.class);
	
	@Resource
	private IPersonalInfoService personalInfoService;
	@Resource
	private IEnvicityService envicityService;
	@Resource
	private ISuggestService suggestService;
	@Resource
	private IDeviceService deviceService;
	
	@RequestMapping(value="addsuggest",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String addsuggest(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/setting/addsuggest");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return "";
		
		String message=request.getParameter("message");
		String res=suggestService.addsuggest(hwuser,message);
		String script="<script>alert('"+res+"');</script>";
		return script;
	}
	

	@RequestMapping("suggest")
	public String suggest(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/setting/suggest");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return "";
		
		return UriConstant.SETTING_SUGGEST;
	}
	
	@RequestMapping("personal")
	public String personalinfo(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/setting/personal");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return UriConstant.LOGON_LOGIN;
		
		EnvicityVo ecprocince=envicityService.getprovince(hwuser.getCityCode());
		map.addAttribute("hwuser",hwuser);
		map.addAttribute("hwuprovince",ecprocince);
		map.addAttribute("ecprovinces",envicityService.getplist());
		map.addAttribute("eccitys",envicityService.getlist(ecprocince.getEccode()));
		return UriConstant.SETTING_PERSONAL;
	}
	
	@RequestMapping(value="geteclist",produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<EnvicityVo> geteclist(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/setting/geteclist");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return null;
		
		String proven=request.getParameter("proven");
		return envicityService.getlist(proven);
	}
	
	@RequestMapping(value="personalupdate",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String personalupdate(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/setting/personalupdate");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return "";
		
		String usernickname=request.getParameter("usernickname");
		String userpassword=request.getParameter("userpassword");
		String newpassword=request.getParameter("newpassword");
		String selectcity=request.getParameter("select_city");
		
		String res=personalInfoService.update(hwuser,usernickname,userpassword,newpassword,selectcity);
		String script="<script>alert('"+res+"');</script>";
//		return "success";
		return script;
	}
	
	@RequestMapping("updateavatar")
	@ResponseBody
	public String updateavatar(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/setting/updateavatar");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return "";
		
		String avatarfile=request.getParameter("avatarfile");
		return personalInfoService.updateavatar(hwuser,avatarfile);
	}
	
	@RequestMapping(value="uploadfile",produces="application/json;charset=UTF-8")
	@ResponseBody
	public String uploadfile(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/setting/uploadfile");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return "";
		
		String aratarpath=request.getServletContext().getRealPath("/")+"resources\\img\\useravatar\\";
		_log.info("aratarpath:"+aratarpath);
		
		String fname="";
		CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
				request.getSession().getServletContext());
		if(multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
			MultipartFile file=multiRequest.getFile("imgfile");
			if(file!=null) {
				fname=DateUtil.getNowTimestamp()+"_"+file.getOriginalFilename();
				File localFile=new File(aratarpath,fname);
				try {
					file.transferTo(localFile);
				}catch(IllegalStateException|IOException e) {
					_log.error(e.getMessage());
				}
			}
		}
		return fname;
	}
	
	@RequestMapping("device")
	public String device(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/setting/device");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return UriConstant.LOGON_LOGIN;
		
		map.addAttribute("devicetypes",deviceService.getdtypes());
		return UriConstant.SETTING_DEVICE;
	}
	
	@RequestMapping(value="getdevicelist",produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<DeviceTableVo> getdevicelist(HttpServletRequest request,HttpServletResponse response) {
		_log.info("controller:/setting/getdevicelist");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return null;
		
		return deviceService.getdevices(hwuser);
	}
	@RequestMapping(value="savedevice",produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String,String> savedevice(HttpServletRequest request,HttpServletResponse response) {
		_log.info("controller:/setting/savedevice");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return null;
		
		String operate=request.getParameter("operate");
		String devid=request.getParameter("devid");
		String devname=request.getParameter("devname");
		String devtype=request.getParameter("devtype");
		String devflag=request.getParameter("devflag");
		String devisdefault=request.getParameter("devisdefault");
		
		Map<String,String> resmap=new TreeMap<String,String>();
		if(operate.equals("add")) {
			resmap=deviceService.adddevice(hwuser,devname,devtype,devflag,devisdefault);
		}else if(operate.equals("update")) {
			resmap=deviceService.updatedevice(hwuser,devid,devname,devtype,devflag,devisdefault);
		}
		return resmap;
	}
	@RequestMapping(value="deletedevice",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String deletedevice(HttpServletRequest request,HttpServletResponse response) {
		_log.info("controller:/setting/deletedevice");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return null;
		
		String deviceid=request.getParameter("deviceid");
		return deviceService.deletedevice(deviceid);
	}
}