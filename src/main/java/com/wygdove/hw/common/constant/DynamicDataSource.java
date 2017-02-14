package com.wygdove.hw.common.constant;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

/**
 * @author wygdove
 * @since 2017年2月14日下午4:30:45
 */
public class DynamicDataSource extends AbstractRoutingDataSource {
	@Override
	protected Object determineCurrentLookupKey() {
		return DataSourceContextHolder.getDbType();
	}
}
