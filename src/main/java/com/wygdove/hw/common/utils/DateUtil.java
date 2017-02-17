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
}
