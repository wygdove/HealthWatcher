package com.wygdove.hw.controller;

import java.util.List;

import javax.annotation.Resource;
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
import com.wygdove.hw.service.indoor.IIndoorbaseService;
import com.wygdove.hw.vo.PmInoutdoorVo;
import com.wygdove.hw.vo.WenshiduVo;

@Controller
@RequestMapping("indoor")
public class IndoorController {
	private static final Logger _log = Logger.getLogger(IndoorController.class);

	@Resource
	private IIndoorbaseService indoorbaseService;
	
	@RequestMapping("pmio")
	public String pmio(HttpServletRequest request, HttpServletResponse response, ModelMap map) {
		_log.info("controller:/indoor/pmio");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return UriConstant.LOGON_LOGIN;
		
		return UriConstant.INDOOR_PMIO;
	}
	
	@RequestMapping("wenshidu")
	public String wenshidu(HttpServletRequest request, HttpServletResponse response, ModelMap map) {
		_log.info("controller:/indoor/wenshidu");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return UriConstant.LOGON_LOGIN;
		
		return UriConstant.INDOOR_WENSHIDU;
	}
	
	@RequestMapping("chart/wenshidu")
	@ResponseBody
	public List<WenshiduVo> wenshiduchart(HttpServletRequest request,HttpServletResponse response) {
		_log.info("controller:/indoor/chart/wenshidu");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return null;
		
		String sflag="55";
		String snum="20";
		return indoorbaseService.getWsd(sflag,snum);
	}
	
	@RequestMapping("chart/guangzhao")
	@ResponseBody
	public String guangzhaochart(HttpServletRequest request,HttpServletResponse response) {
		_log.info("controller:/indoor/chart/guangzhao");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return null;
		
		String sflag="55";
		return indoorbaseService.getgz(sflag);
	}
	
	@RequestMapping("chart/pmio")
	@ResponseBody
	public List<PmInoutdoorVo> pmiochart(HttpServletRequest request,HttpServletResponse response) {
		_log.info("controller:/indoor/chart/pmio");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return null;
		
		String sflag="55";
		return indoorbaseService.getpm25io(sflag);
	}

}