package com.wygdove.hw.common.constant;

/**
 * @author wygdove
 * @since 2017年2月15日下午4:14:34
 */
public class EnvicloudConstant {
	
	public static final String BASE_ACCESSKEY="D3LNZG92ZTE0NJU2MTUXNDC3NTE=";
	public static final String BASE_URL="http://service.envicloud.cn:8082";


	
	public static final String PARAM_ACCESSKEY="{accesskey}";
	public static final String PARAM_CITYNAME="{cityname}";
	public static final String PARAM_CITYCODE="{citycode}";
	public static final String PARAM_NAME="{name}";
	
	public static final String PARAM_TIME="{time}";
	public static final String PARAM_HOUR="{hour}";
	public static final String PARAM_WEEK="{week}";
	public static final String PARAM_YEAR="{year}";
	public static final String PARAM_YEAR_START="{start_year}";
	public static final String PARAM_YEAR_END="{end_year}";
	public static final String PARAM_DATE="{date}";
	public static final String PARAM_DATE_START="{start_date}";
	public static final String PARAM_DATE_END="{end_date}";
	
	public static final String PARAM_FILTER="{filter}";
	public static final String PARAM_COUNT="{count}";
	public static final String PARAM_TYPE="{type}";
	public static final String PARAM_PROVINCE="{province}";
	public static final String PARAM_MIN_MAG="{min_mag}";
	
	/**
	 * start_lng	起始坐标经度(东经)
	 * start_lat	起始坐标纬度(北纬)
	 * end_lng		结束坐标经度(东经)
	 * end_lat		结束坐标纬度(北纬)
	 */
	public static final String PARAM_LOCT_JING_START="{start_lng}";
	public static final String PARAM_LOCT_JING_END="{end_lng}";
	public static final String PARAM_LOCT_WEI_START="{start_lat}";
	public static final String PARAM_LOCT_WEI_END="{end_lat}";
	


	/**
	 * 城市信息查询
	 */
	// 查询所有支持城市的城市编码
	public static final String URL_CITY_ALLCODE="/v2/citycode/{accesskey}";
	// 查询指定城市的城市编码
	public static final String URL_CITY_CODEBYNAME="/v2/citycode/{accesskey}/{cityname}";
	// 查询指定城市的地理位置坐标
	public static final String URL_CITY_LOCATION="/v2/location/{accesskey}/{citycode}";
	// 查询指定坐标范围内覆盖的城市列表
	public static final String URL_CITY_AREA="/v2/area/{accesskey}/{start_lng}/{start_lat}/{end_lng}/{end_lat}";
	
	/**
	 * 灾害预警查询
	 */
	// 查询全国指定省份或城市的实时灾害预警数据
	public static final String URL_ALERT="/v2/alert/{accesskey}/{filter}";

	/**
	 * 天气信息查询
	 */
	// 根据城市编码查询指定城市7天天气预报和生活指数
	public static final String URL_WEATHER_FORECAST="/v2/weatherforecast/{accesskey}/{citycode}";
	// 查询全国海区天气预报
	public static final String URL_WEATHER_FORECAST_MARINE="/v2/marineforecast/{accesskey}";
	// 查询指定城市过去24小时的历史天气
	public static final String URL_WEATHER_HISTORY="/v2/weatherhistory/{accesskey}/{citycode}";
	// 查询指定城市指定日期的历史天气
	public static final String URL_WEATHER_HISTORY_DATE="/v2/weatherhistory/{accesskey}/{citycode}/{date}";
	// 查询指定城市指定小时的历史天气
	public static final String URL_WEATHER_HISTORY_HOUR="/v2/weatherhistory/{accesskey}/{citycode}/{date}/{hour}";
	// 查询指定城市指定年份12个月的月度历史天气
	public static final String URL_WEATHER_MONTHLYMETE="/v2/monthlymete/{accesskey}/{citycode}/{year}/{type}";
	// 查询指定城市指定时段的年度历史天气
	public static final String URL_WEATHER_YEARLYMETE="/v2/yearlymete/{accesskey}/{citycode}/{start_year}/{end_year}/{type}";
	// 查询指定城市的天气实况
	public static final String URL_WEATHER_LIVE="/v2/weatherlive/{accesskey}/{citycode}";
	
	/**
	 * 空气质量查询
	 */
	// 查询指定城市的空气质量实况
	public static final String URL_CITYAIR_LIVE="/v2/cityairlive/{accesskey}/{citycode}/{type}";
	// 查询指定城市过去24小时的空气质量
	public static final String URL_CITYAIR_HISTORY="/v2/cityairhistory/{accesskey}/{citycode}";
	// 查询指定城市指定日期的空气质量
	public static final String URL_CITYAIR_DAILY="/v2/citydailyair/{accesskey}/{citycode}/{date}/{type}";
	// 查询指定城市指定小时的空气质量
	public static final String URL_CITYAIR_HOURLY="/v2/cityhourlyair/{accesskey}/{citycode}/{time}/{type}";
	// 查询指定城市未来5天的空气质量预报
	public static final String URL_CITYAIR_FORECAST="/v2/cityairforecast/{accesskey}/{citycode}";

	/**
	 * 污染排放查询 城市辐射查询
	 */
	// 查询指定年份的全国污染排放
	public static final String URL_POLLUTION_DISCHARGE="/v2/discharge/{accesskey}/{year}/{filter}";
	// 查询指定省份指定时段的历史污染排放年报
	public static final String URL_POLLUTION_DISCHARGE_PERIODIC="/v2/periodicdischarge/{accesskey}/{start_year}/{end_year}/{province}/{filter}";
	// 查询从2011年3月12日到2015年12月20日的全国每日辐射环境数据
	public static final String URL_POLLUTION_RADIATION="GET /v2/radiation/{accesskey}/{date}";
	
	/**
	 * 地震查询
	 */
	// 查询全球发生的最近一次地震
	public static final String URL_EARTHQUAKE_RECENT="/v2/recentearthquake/{accesskey}";
	// 查询指定日期发生的全球地震
	public static final String URL_EARTHQUAKE_DATE="/v2/dailyearthquake/{accesskey}/{date}";
	// 查询指定城市受影响的地震
	public static final String URL_EARTHQUAKE_CITY="/v2/cityearthquake/{accesskey}/{citycode}/{count}";
	// 查询指定时段全球发生的地震
	public static final String URL_EARTHQUAKE_PERIODIC="/v2/periodicearthquake/{accesskey}/{start_date}/{end_date}/{min_mag}";
	
	/**
	 * 水体环境查询 台风查询
	 */
	// 查询指定年份和周数的全国主要水体的水质周报
	public static final String URL_WATER_QUALITY="/v2/waterquality/{accesskey}/{year}/{week}/{filter}";
	// 查询2002到2015年指定年份的台风概要信息
	public static final String URL_TYPHOON_YEAR="/v2/typhoon/{accesskey}/{year}";
	// 查询2002到2015年指定台风的具体路径信息
	public static final String URL_TYPHOON_NAME="/v2/typhoon/{accesskey}/{year}/{name}";
	
	
	
}
