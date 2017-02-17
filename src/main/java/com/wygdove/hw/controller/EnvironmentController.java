package com.wygdove.hw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wygdove.hw.common.constant.UriConstant;
import com.wygdove.hw.common.utils.SessionUtil;
import com.wygdove.hw.mybatis.model.HwUser;

/**
 * @author wygdove
 * @since 2017年2月17日下午12:31:20
 */
@Controller
@RequestMapping("environment")
public class EnvironmentController {
	private static final Logger _log=Logger.getLogger(EnvironmentController.class);
	
	@RequestMapping("weather")
	public String weather(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/environment/weather");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return UriConstant.LOGON_LOGIN;
		
		
		
		return UriConstant.ENVIRONMENT_WEATHER;
	}

	@RequestMapping("cityair")
	public String cityair(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/environment/cityair");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return UriConstant.LOGON_LOGIN;
		
		
		
		return UriConstant.ENVIRONMENT_CITYAIR;
	}

	@RequestMapping("pollution")
	public String pollution(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/environment/pollution");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return UriConstant.LOGON_LOGIN;
		
		
		
		return UriConstant.ENVIRONMENT_POLLUTION;
	}

	@RequestMapping("disaster")
	public String disaster(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/environment/disaster");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return UriConstant.LOGON_LOGIN;
		
		
		
		return UriConstant.ENVIRONMENT_DISASTER;
	}

}
