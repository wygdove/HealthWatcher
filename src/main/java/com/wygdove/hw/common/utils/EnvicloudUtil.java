package com.wygdove.hw.common.utils;

import java.io.IOException;
import java.util.HashMap;

import org.apache.log4j.Logger;

import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import com.wygdove.hw.common.constant.EnvicloudConstant;

/**
 * @author wygdove
 * @since 2017年2月15日下午5:09:57
 */
public class EnvicloudUtil {
	
	public static String getTest(String citycode) throws UnirestException, IOException {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put(EnvicloudConstant.PARAM_CITYCODE,citycode);
		return EnviBaseUtil.getData(EnvicloudConstant.URL_CITY_ALLCODE,map);
	}
	
	public static String getCitycode(String cityname) throws UnirestException, IOException {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put(EnvicloudConstant.PARAM_CITYNAME,cityname);
		return EnviBaseUtil.getData(EnvicloudConstant.URL_CITY_CODEBYNAME,map);
	}
	
	public static String getAllCitycode() throws UnirestException, IOException {
		HashMap<String,String> map=new HashMap<String,String>();
		return EnviBaseUtil.getData(EnvicloudConstant.URL_CITY_ALLCODE,map);
	}
	
	public static String getCityLocation(String citycode) throws UnirestException, IOException {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put(EnvicloudConstant.PARAM_CITYCODE,citycode);
		return EnviBaseUtil.getData(EnvicloudConstant.URL_CITY_LOCATION,map);
	}
	
	public static String getWeatherLive(String citycode) throws UnirestException, IOException {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put(EnvicloudConstant.PARAM_CITYCODE,citycode);
		return EnviBaseUtil.getData(EnvicloudConstant.URL_WEATHER_LIVE,map);
	}
	public static String getWeatherForecast(String citycode) throws UnirestException, IOException {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put(EnvicloudConstant.PARAM_CITYCODE,citycode);
		return EnviBaseUtil.getData(EnvicloudConstant.URL_WEATHER_FORECAST,map);
	}
	
	public static String getAlert(String cityname) throws UnirestException, IOException {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put(EnvicloudConstant.PARAM_FILTER,cityname);
		return EnviBaseUtil.getData(EnvicloudConstant.URL_ALERT,map);
	}
	
	public static String getCityEarthquake(String citycode,String num) throws UnirestException, IOException {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put(EnvicloudConstant.PARAM_CITYCODE,citycode);
		map.put(EnvicloudConstant.PARAM_COUNT,num);
		return EnviBaseUtil.getData(EnvicloudConstant.URL_EARTHQUAKE_CITY,map);
	}

	public static String getCityairLive(String citycode) throws UnirestException, IOException {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put(EnvicloudConstant.PARAM_CITYCODE,citycode);
		return EnviBaseUtil.getData(EnvicloudConstant.URL_CITYAIR_LIVE,map);
	}
	public static String getCityairLiveAQI(String citycode) throws UnirestException, IOException {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put(EnvicloudConstant.PARAM_CITYCODE,citycode);
		map.put(EnvicloudConstant.PARAM_TYPE,"AQI");
		return EnviBaseUtil.getData(EnvicloudConstant.URL_CITYAIR_LIVE_TYPE,map);
	}
	public static String getCityairHistory(String citycode) throws UnirestException, IOException {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put(EnvicloudConstant.PARAM_CITYCODE,citycode);
		return EnviBaseUtil.getData(EnvicloudConstant.URL_CITYAIR_HISTORY,map);
	}
	
	
	
	
}
