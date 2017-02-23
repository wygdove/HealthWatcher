package com.wygdove.hw.service.environment;

import java.io.IOException;
import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.json.JSONArray;
import org.json.JSONObject;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.exceptions.UnirestException;
import com.wygdove.hw.common.utils.DateUtil;
import com.wygdove.hw.common.utils.EnvicloudUtil;
import com.wygdove.hw.common.utils.ImageUtil;
import com.wygdove.hw.vo.WeatherForecastLifeVo;
import com.wygdove.hw.vo.WeatherForecastVo;
import com.wygdove.hw.vo.WeatherLiveVo;

/**
 * @author wygdove
 * @since 2017年2月17日下午12:53:35
 */
@Service
public class WeatherServiceImpl implements IWeatherService {
	private static final Logger _log=Logger.getLogger(WeatherServiceImpl.class);

	public WeatherLiveVo getwl(String citycode) {
		WeatherLiveVo res=null;
		try {
			JSONObject json=new JsonNode(EnvicloudUtil.getWeatherLive(citycode)).getObject();
			if(json.getInt("rcode")==200&&json.getString("rdesc").equals("Success")) {
				res=new WeatherLiveVo();
				res.setWlUpdateTime(json.getString("updatetime"));
				res.setWlPhenomena(json.getString("phenomena"));
				res.setWlFeelst(json.getString("feelst"));
				res.setWlTemperature(json.getString("temperature"));
				res.setWlAirPressure(json.getString("airpressure"));
				res.setWlHumidity(json.getString("humidity"));
				res.setWlWindDirect(json.getString("winddirect"));
				res.setWlWindPower(json.getString("windpower"));
				res.setWlRain(json.getString("rain"));
			}
			else {
				_log.error(""+json.getInt("rcode")+"\t"+json.getString("rdesc"));
			}
		} catch (UnirestException | IOException e) {
			_log.error(e.getMessage());
		}
		return res;
	}

	public ArrayList<WeatherForecastVo> getwfs(String citycode) {
		ArrayList<WeatherForecastVo> reslist=null;
		try {
			JSONObject json=new JsonNode(EnvicloudUtil.getWeatherForecast(citycode)).getObject();
			if(json.getInt("rcode")==200&&json.getString("rdesc").equals("Success")) {
				reslist=new ArrayList<WeatherForecastVo>();
				JSONArray forecasts=json.getJSONArray("forecast");
				for(int i=0;i<forecasts.length();i++) {
					WeatherForecastVo wfvo=new WeatherForecastVo();
					JSONObject fj=forecasts.getJSONObject(i);
					String sfjdate=fj.getString("date");
					wfvo.setWfDayWeek(DateUtil.getZhou(sfjdate));
					wfvo.setWfDay(sfjdate.substring(5,7)+"/"+sfjdate.substring(8,10));
					wfvo.setWfCondD(fj.getJSONObject("cond").getString("cond_d"));
					wfvo.setWfCondDImg(ImageUtil.getCondImg(fj.getJSONObject("cond").getString("cond_d"),"d"));
					wfvo.setWfTmpMax(fj.getJSONObject("tmp").getString("max"));
					wfvo.setWfTmpMin(fj.getJSONObject("tmp").getString("min"));
					wfvo.setWfCondN(fj.getJSONObject("cond").getString("cond_n"));
					wfvo.setWfCondNImg(ImageUtil.getCondImg(fj.getJSONObject("cond").getString("cond_n"),"n"));
					wfvo.setWfWindDir(fj.getJSONObject("wind").getString("dir"));
					wfvo.setWfWindPower(fj.getJSONObject("wind").getString("sc"));
					reslist.add(wfvo);
				}
			}
			else {
				_log.error(""+json.getInt("rcode")+"\t"+json.getString("rdesc"));
			}
		} catch (UnirestException | IOException e) {
			_log.error(e.getMessage());
		}
		return reslist;
	}

	public WeatherForecastLifeVo getwfl(String citycode) {
		WeatherForecastLifeVo res=null;
		try {
			JSONObject json=new JsonNode(EnvicloudUtil.getWeatherForecast(citycode)).getObject();
			if(json.getInt("rcode")==200&&json.getString("rdesc").equals("Success")) {
				res=new WeatherForecastLifeVo();
				JSONObject jsugg=json.getJSONObject("suggestion");
				res.setWflAirBrf(jsugg.getJSONObject("air").getString("brf"));
				res.setWflComfBrf(jsugg.getJSONObject("comf").getString("brf"));
				res.setWflCwBrf(jsugg.getJSONObject("cw").getString("brf"));
				res.setWflDrsBrf(jsugg.getJSONObject("drs").getString("brf"));
				res.setWflFluBrf(jsugg.getJSONObject("flu").getString("brf"));
				res.setWflSportBrf(jsugg.getJSONObject("sport").getString("brf"));
				res.setWflTravBrf(jsugg.getJSONObject("trav").getString("brf"));
				res.setWflUvBrf(jsugg.getJSONObject("uv").getString("brf"));
				res.setWflAirTxt(jsugg.getJSONObject("air").getString("txt"));
				res.setWflComfTxt(jsugg.getJSONObject("comf").getString("txt"));
				res.setWflCwTxt(jsugg.getJSONObject("cw").getString("txt"));
				res.setWflDrsTxt(jsugg.getJSONObject("drs").getString("txt"));
				res.setWflFluTxt(jsugg.getJSONObject("flu").getString("txt"));
				res.setWflSportTxt(jsugg.getJSONObject("sport").getString("txt"));
				res.setWflTravTxt(jsugg.getJSONObject("trav").getString("txt"));
				res.setWflUvTxt(jsugg.getJSONObject("uv").getString("txt"));
			}
			else {
				_log.error(""+json.getInt("rcode")+"\t"+json.getString("rdesc"));
			}
		} catch (UnirestException | IOException e) {
			_log.error(e.getMessage());
		}
		
		return res;
	}

}
