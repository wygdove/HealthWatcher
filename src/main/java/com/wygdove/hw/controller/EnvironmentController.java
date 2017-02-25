package com.wygdove.hw.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
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
import com.wygdove.hw.service.environment.ICityairService;
import com.wygdove.hw.service.environment.IDisasterService;
import com.wygdove.hw.service.environment.IWeatherService;
import com.wygdove.hw.vo.WeatherForecastLifeVo;
import com.wygdove.hw.vo.WeatherForecastVo;
import com.wygdove.hw.vo.WeatherLiveVo;

/**
 * @author wygdove
 * @since 2017年2月17日下午12:31:20
 */
@Controller
@RequestMapping("environment")
public class EnvironmentController {
	private static final Logger _log=Logger.getLogger(EnvironmentController.class);
	
	@Resource
	private IWeatherService weatherService;
	@Resource
	private IDisasterService disasterService;
	@Resource
	private ICityairService cityairService;
	
	@RequestMapping("weather")
	public String weather(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/environment/weather");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return UriConstant.LOGON_LOGIN;
		
		WeatherLiveVo weatherLiveVo=weatherService.getwl(hwuser.getCityCode());
		ArrayList<WeatherForecastVo> weatherForecastVoList=weatherService.getwfs(hwuser.getCityCode());
		WeatherForecastLifeVo weatherForecastLifeVo=weatherService.getwfl(hwuser.getCityCode());
		map.addAttribute(AttributeConstant.WEATHERLIVEVO,weatherLiveVo);
		map.addAttribute(AttributeConstant.WEATHERFORECASTVOS,weatherForecastVoList);
		map.addAttribute(AttributeConstant.WEATHERFORECASTLIFEVO,weatherForecastLifeVo);
		return UriConstant.ENVIRONMENT_WEATHER;
	}

	@RequestMapping("cityair")
	public String cityair(HttpServletRequest request,HttpServletResponse response,ModelMap map) {
		_log.info("controller:/environment/cityair");
		HwUser hwuser=SessionUtil.getLoginUser(request);
		if(hwuser==null) return UriConstant.LOGON_LOGIN;
		
		map.addAttribute(AttributeConstant.CITYAIRLIVEVO,
				cityairService.getcl(hwuser.getCityCode()));
		map.addAttribute(AttributeConstant.CITYAIRHISTORYVOS,
				cityairService.getchs(hwuser.getCityCode()));
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
		
		map.addAttribute(AttributeConstant.DISASTERVO,
				disasterService.getDis(hwuser.getCityCode(),hwuser.getCityName()));
		map.addAttribute(AttributeConstant.EARTHQUAKESVOS,
				disasterService.getEqs(hwuser.getCityCode(),"5"));
		return UriConstant.ENVIRONMENT_DISASTER;
	}

}
