package com.wygdove.hw.common.utils;

import org.apache.log4j.Logger;

import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;

public class SenserDataUtil {
	private static final Logger _log=Logger.getLogger(SenserDataUtil.class);
	private static final String URL_SENSERDATA_BASE="http://139.199.197.134:8017/webGetService1.svc/web/";
	
	public static String getWenshiduData(String sflag,String num) throws UnirestException {
		String url=URL_SENSERDATA_BASE+"getWsdData?flag="+sflag+"&num="+num;
		return getHttpData(url);
	}
	
	private static String getHttpData(String url) throws UnirestException {
		_log.debug("SenserDataUtil: "+url);
		String json=Unirest.get(url).asJson().getBody().toString();
		_log.debug("SenserDataUtil: "+json);
		return json;
	}
}
