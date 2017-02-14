package com.wygdove.hw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

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
		return "index";
	}
}
