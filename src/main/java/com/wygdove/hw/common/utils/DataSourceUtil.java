package com.wygdove.hw.common.utils;

import com.wygdove.hw.common.constant.DataSourceContextHolder;

/**
 * @author wygdove
 * @since 2017年2月17日上午9:54:11
 */
public class DataSourceUtil {
	public static void getDsHw() {
		DataSourceContextHolder.setDbType("ds1");
	}
}
