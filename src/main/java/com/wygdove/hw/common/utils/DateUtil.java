package com.wygdove.hw.common.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @author wygdove
 * @since 2017年2月15日下午5:09:46
 */
public class DateUtil {
	private static final SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	
	public static String getNow() {
		return sdf.format(Calendar.getInstance().getTime());
	}
	
	public static Date getNowDate() {
		return Calendar.getInstance().getTime();
	}
	
	public static String getZhou(String date) {
//		 date="2017-02-23";
		String res="";
		Calendar calendar=Calendar.getInstance();
		calendar.set(Integer.parseInt(date.substring(0,4)),Integer.parseInt(date.substring(5,7)),Integer.parseInt(date.substring(8,10)),0,0,0);
		String weekx=calendar.getTime().toString().substring(0,3);
		switch(weekx) {
			case "Mon":res="周一";break;
			case "Tue":res="周二";break;
			case "Wed":res="周三";break;
			case "Thu":res="周四";break;
			case "Fri":res="周五";break;
			case "Sat":res="周六";break;
			case "Sun":res="周日";break;
		}
		return res;
	}
}
