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
import com.wygdove.hw.service.physical.IPhysicalService;
import com.wygdove.hw.vo.EcgVo;
import com.wygdove.hw.vo.PhysicalCommonVo;

@Controller
@RequestMapping("physical")
public class PhysicalController {
	private static final Logger _log=Logger.getLogger(PhysicalController.class);

	@Resource
	private IPhysicalService physicalService;
	
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
	
	@RequestMapping("chart/ecg")
	@ResponseBody
	public List<EcgVo> ecgchart(HttpServletRequest request,HttpServletResponse response) {
		_log.info("controller:/physical/chart/ecg");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return null;
		
		return physicalService.getEcgdata("");
	}
	
	@RequestMapping("chart/bodytemperature")
	@ResponseBody
	public List<EcgVo> bodytemperaturechart(HttpServletRequest request,HttpServletResponse response) {
		_log.info("controller:/physical/chart/bodytemperature");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return null;
		
		return physicalService.getEcgdata("");
	}
	
	@RequestMapping("chart/common")
	@ResponseBody
	public List<PhysicalCommonVo> commonchart(HttpServletRequest request,HttpServletResponse response) {
		_log.info("controller:/physical/chart/common");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return null;
		
		String sflag="";
		String stype=request.getParameter("sensertype");
		return physicalService.getdata(sflag,stype);
	}
	
}
