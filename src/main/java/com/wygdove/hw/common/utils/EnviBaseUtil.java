package com.wygdove.hw.common.utils;

import java.io.IOException;
import java.util.HashMap;

import org.apache.log4j.Logger;

import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import com.wygdove.hw.common.constant.EnvicloudConstant;

public class EnviBaseUtil {
	private static final Logger _log=Logger.getLogger(EnviBaseUtil.class);
	
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
	
	public static String getData(String apiurl,HashMap<String,String> map) throws UnirestException, IOException {
		return getHttpData(getUrl(apiurl,map));
	}
}
