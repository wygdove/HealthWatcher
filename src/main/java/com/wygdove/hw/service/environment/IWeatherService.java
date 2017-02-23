package com.wygdove.hw.service.environment;

import java.util.ArrayList;

import com.wygdove.hw.vo.WeatherForecastLifeVo;
import com.wygdove.hw.vo.WeatherForecastVo;
import com.wygdove.hw.vo.WeatherLiveVo;

/**
 * @author wygdove
 * @since 2017年2月17日下午12:53:21
 */
public interface IWeatherService {
	public WeatherLiveVo getwl(String citycode);
	public ArrayList<WeatherForecastVo> getwfs(String citycode);
	public WeatherForecastLifeVo getwfl(String citycode);
}
