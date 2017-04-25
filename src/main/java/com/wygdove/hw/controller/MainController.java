package com.wygdove.hw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wygdove.hw.common.constant.AttributeConstant;
import com.wygdove.hw.common.constant.UriConstant;
import com.wygdove.hw.common.utils.SessionUtil;
import com.wygdove.hw.mybatis.model.HwUser;

/**
 * @author wygdove
 * @since 2017年2月14日下午5:36:07
 */
@Controller
public class MainController {
	private static final Logger _log=Logger.getLogger(MainController.class);
	
	@RequestMapping("index")
	public String index(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/index");
		HwUser hwuser=(HwUser)request.getSession().getAttribute(AttributeConstant.HWUSER);
		if(hwuser==null) {
			return UriConstant.LOGON_LOGIN;
		}
		else {
			map.addAttribute("hwuser",hwuser);
			return UriConstant.INDEX;
		}
	}
	
	
	@RequestMapping("content")
	public String content(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/content");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return UriConstant.LOGON_LOGIN;
		
		return UriConstant.INDEX_CONTENT;
	}
}
