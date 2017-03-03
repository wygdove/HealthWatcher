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
@RequestMapping("indoor")
public class IndoorController {
	private static final Logger _log = Logger.getLogger(TestController.class);

	@RequestMapping("indoorbase")
	public String indoorbase(HttpServletRequest request, HttpServletResponse response, ModelMap map) {
		_log.info("controller:/indoor/indoorbase");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return UriConstant.LOGON_LOGIN;
		
		return UriConstant.INDOOR_BASE;
	}

}