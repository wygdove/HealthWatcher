package com.wygdove.hw.controller;

import java.io.File;
import java.io.IOException;

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

@Controller
@RequestMapping("setting")
public class SettingController {
	private static final Logger _log=Logger.getLogger(SettingController.class);
	
	@RequestMapping("suggest")
	@ResponseBody
	public String suggest(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/setting/suggest");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return "";
		
		String message=request.getParameter("message");
		_log.info("message:"+message);
		return "success";
	}
	
	@RequestMapping("personal")
	public String personalinfo(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/setting/personal");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return UriConstant.LOGON_LOGIN;
		
		map.addAttribute("hwuser",hwuser);
		return UriConstant.SETTING_PERSONAL;
	}
	
	@RequestMapping("personalupdate")
	@ResponseBody
	public String personalupdate(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/setting/personalupdate");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return "";
		
		String usernickname=request.getParameter("usernickname");
		String selectcity=request.getParameter("select_city");
		_log.info("username:"+usernickname);
		_log.info("selectcity:"+selectcity);
		String script="<script>alert('"+usernickname+"');</script>";
//		return "success";
		return script;
	}
	
	@RequestMapping(value="uploadfile",produces="application/json;charset=UTF-8")
	@ResponseBody
	public String uploadfile(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/setting/uploadfile");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return "";
		
		String avatorpath=request.getServletContext().getRealPath("/")+"resources\\img\\useravatar\\";
		_log.info("avatorpath:"+avatorpath);
		
		String fname="";
		CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
				request.getSession().getServletContext());
		if(multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
			MultipartFile file=multiRequest.getFile("imgfile");
			if(file!=null) {
				fname=DateUtil.getNowTimestamp()+"_"+file.getOriginalFilename();
				File localFile=new File(avatorpath,fname);
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
		
		map.addAttribute("hwuser",hwuser);
		return UriConstant.SETTING_DEVICE;
	}
	
}