package com.wygdove.hw.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wygdove.hw.common.constant.AttributeConstant;
import com.wygdove.hw.common.constant.UriConstant;
import com.wygdove.hw.mybatis.model.HwUser;
import com.wygdove.hw.service.ILogonService;
import com.wygdove.hw.service.LogonServiceImpl;

/**
 * @author wygdove
 * @since 2017年2月16日下午3:47:08
 */
@Controller
@RequestMapping("logon")
public class LogonController {
	private static final Logger _log=Logger.getLogger(LogonController.class);
	
	@Resource
	private ILogonService logonService;
	
	@RequestMapping("login")
	public String login(HttpServletRequest request,HttpServletResponse response) {
		_log.info("controller:/logon/login");
		return UriConstant.LOGON_LOGIN;
	}

	@RequestMapping("register")
	public String register(HttpServletRequest request,HttpServletResponse response) {
		_log.info("controller:/logon/register");
		return UriConstant.LOGON_REGISTER;
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request,HttpServletResponse response) {
		_log.info("controller:/logon/logout");
		request.getSession().setAttribute(AttributeConstant.HWUSER,null);
		return UriConstant.LOGON_LOGIN;
	}

	@RequestMapping("dologin")
	public String dologin(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/logon/dologin");
		String username=request.getParameter("username");
		String userpassword=request.getParameter("userpassword");
		HwUser hwuser=logonService.login(username,userpassword);
		if(hwuser==null) {
			map.addAttribute(AttributeConstant.RES_MESSAGE,"登录失败，请检查用户名密码！");
			return UriConstant.LOGON_LOGIN;		
		}
		else {
			request.getSession().setAttribute(AttributeConstant.HWUSER,hwuser);
			map.addAttribute(AttributeConstant.HWUSER,hwuser);
			return UriConstant.LOGON_DOLOGIN;
		}
	}
	
	@RequestMapping("doregister")
	public String doregister(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/logon/doregister");
		String username=request.getParameter("username");
		String userpassword=request.getParameter("userpassword");
		String res=logonService.register(username,userpassword);
		if(res.equals("success")) {
			return UriConstant.LOGON_LOGIN;
		}
		else {
			map.addAttribute(AttributeConstant.RES_MESSAGE,"注册失败，请重试！"+res);
			return UriConstant.LOGON_REGISTER;
		}
	}
}
