package com.wygdove.hw.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wygdove.hw.service.ITestService;

/**
 * @author wygdove
 * @since 2017年2月14日下午4:26:26
 */
@Controller
public class TestController {
	private static final Logger _log = Logger.getLogger(TestController.class);
	
	@Resource
	private ITestService testService;
	
	@RequestMapping("test")
	public String index(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/test");
		String str=request.getParameter("str");
		str+="lalala";
		str=testService.dotest(str);
		map.addAttribute("str",str);
		return "test";
	}

}