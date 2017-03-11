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

@Controller
@RequestMapping("physical")
public class PhysicalController {
	private static final Logger _log=Logger.getLogger(PhysicalController.class);

	@RequestMapping("bodytemperature")
	public String bodytemperature(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/physical/bodytemperature");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return UriConstant.LOGON_LOGIN;

		return UriConstant.PHYSICAL_BODYTEMPERATURE;
	}
	
	@RequestMapping("pulse")
	public String pulse(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/physical/pulse");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return UriConstant.LOGON_LOGIN;

		return UriConstant.PHYSICAL_PULSE;
	}
	
	@RequestMapping("breathe")
	public String breathe(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/physical/breathe");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return UriConstant.LOGON_LOGIN;

		return UriConstant.PHYSICAL_BREATHE;
	}
	
	@RequestMapping("bloodoxygen")
	public String bloodoxygen(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/physical/bloodoxygen");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return UriConstant.LOGON_LOGIN;

		return UriConstant.PHYSICAL_BLOODOXYGEN;
	}
	
	@RequestMapping("electrocardiogram")
	public String electrocardiogram(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/physical/electrocardiogram");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return UriConstant.LOGON_LOGIN;

		return UriConstant.PHYSICAL_ELECTROCARDIOGRAM;
	}
	
}
