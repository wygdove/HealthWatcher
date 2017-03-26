package com.wygdove.hw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wygdove.hw.common.constant.UriConstant;
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
	
	@RequestMapping("personalinfo")
	public String personalinfo(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/setting/personalinfo");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return UriConstant.LOGON_LOGIN;
		
		map.addAttribute("hwuser",hwuser);
		return UriConstant.SETTING_PERSONALINFO;
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
	
}