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
	private static final Logger _log=Logger.getLogger(EnvicloudUtil.class);
	
	private static String getUrl(String apiurl,HashMap<String,String> map) {
		apiurl=apiurl.replace(EnvicloudConstant.PARAM_ACCESSKEY,EnvicloudConstant.BASE_ACCESSKEY);
		for(String key:map.keySet()) {
			apiurl=apiurl.replace(key,map.get(key));
		}
		return EnvicloudConstant.BASE_URL+apiurl;
	}
	
	private static String getHttpData(String url) throws UnirestException, IOException {
		_log.debug("EnvicloudUtil: "+url);
		String json=Unirest.get(url).asJson().getBody().toString();
		_log.debug("EnvicloudUtil: "+json);
		return json;
	}
	
	public static String getCitycode(String cityname) throws UnirestException, IOException {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put(EnvicloudConstant.PARAM_CITYNAME,cityname);
		return getHttpData(getUrl(EnvicloudConstant.URL_CITY_CODEBYNAME,map));
	}
	
	public static String getWeatherLive(String citycode) throws UnirestException, IOException {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put(EnvicloudConstant.PARAM_CITYCODE,citycode);
		return getHttpData(getUrl(EnvicloudConstant.URL_WEATHER_LIVE,map));
	}
	public static String getWeatherForecast(String citycode) throws UnirestException, IOException {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put(EnvicloudConstant.PARAM_CITYCODE,citycode);
		return getHttpData(getUrl(EnvicloudConstant.URL_WEATHER_FORECAST,map));
	}
}
