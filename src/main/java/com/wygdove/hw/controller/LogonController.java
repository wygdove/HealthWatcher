package com.wygdove.hw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wygdove.hw.common.constant.AttributeConstant;
import com.wygdove.hw.common.constant.UriConstant;
import com.wygdove.hw.mybatis.model.HwUser;

/**
 * @author wygdove
 * @since 2017年2月16日下午3:47:08
 */
@Controller
@RequestMapping("logon")
public class LogonController {
	private static final Logger _log=Logger.getLogger(LogonController.class);
	
	@RequestMapping("login")
	public String login(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/logon/login");
		return UriConstant.LOGIN;
	}
	
	@RequestMapping("dologin")
	public String dologin(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/logon/dologin");
		HwUser hwuser=new HwUser();
		hwuser.setLoginAccount("666");
		request.getSession().setAttribute(AttributeConstant.HWUSER,hwuser);
		return UriConstant.DOLOGIN;
	}
}
