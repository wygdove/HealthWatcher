package EnvicloudFactory;

public class EnvicloudFactory {

	public static final String BASEURL="http://service.envicloud.cn:8082/api";
	public static final String ACCESSID="D3LNZG92ZTE0NJU2MTUXNDC3NTE=";
	public static String CITYCODE="";
	
	public static String envicloudFactory(String operation,String city,String others) {
		String res=null;
		CITYCODE=GetCitycode.getCitycodeGetRsp(BASEURL,ACCESSID,city);
		switch(operation) {
			case "GetWeatherForecast": {
				res=GetWeatherForecast.getWeatherForecastGetRsp(BASEURL,ACCESSID,CITYCODE);
				break;
			}
			case "GetWeatherHistoryByHour": {
				String querytime=others;
				res=GetWeatherHistoryByHour.getWeatherHistoryGetRsp(BASEURL,ACCESSID,querytime,CITYCODE);
				break;
			}
			case "GetWeatherHistoryByDate": {
				String querydate=others;
				res=GetWeatherHistoryByDate.getWeatherHistoryByDateGetRsp(BASEURL,ACCESSID,querydate,CITYCODE);
				break;
			}
			case "GetWeatherCurrent": {
				res=GetWeatherCurrent.getWeatherCurrentGetRsp(BASEURL,ACCESSID,CITYCODE);
				break;
			}
			case "GetRealtimeAir": {
				res=GetRealtimeAir.getRealtimeAirInfoGetRsp(BASEURL,ACCESSID,CITYCODE);
				break;
			}
			case "GetMostRecentEarthquake": {
				res=GetMostRecentEarthquake.getEarthquakesRspJson(BASEURL,ACCESSID);
				break;
			}
			case "GetEarthquakesByCitycode": {
				res=GetEarthquakesByCitycode.getEarthquakesBycitycodeRspJson(BASEURL,ACCESSID,CITYCODE);
				break;
			}
		}
		return res;
	}
}
