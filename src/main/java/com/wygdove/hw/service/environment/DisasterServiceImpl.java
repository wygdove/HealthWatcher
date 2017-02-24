package com.wygdove.hw.service.environment;

import java.io.IOException;
import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.exceptions.UnirestException;
import com.wygdove.hw.common.utils.EnvicloudUtil;
import com.wygdove.hw.vo.DisasterVo;
import com.wygdove.hw.vo.EarthquakeVo;

@Service
public class DisasterServiceImpl implements IDisasterService {
	private static final Logger _log=Logger.getLogger(DisasterServiceImpl.class);
	
	@Override
	public DisasterVo getDis(String citycode,String cityname) {
		DisasterVo res=null;
		try {
			JSONObject aljson=new JsonNode(EnvicloudUtil.getAlert(cityname)).getObject();
			if(aljson.getInt("rcode")==200&&aljson.getString("rdesc").equals("Success")) {
				res=new DisasterVo();
				JSONObject alj=aljson.getJSONArray("info").getJSONObject(0);
				res.setAlTime(alj.getString("time"));
				res.setAlDatasource(alj.getString("datasource"));
				res.setAlStatus(alj.getString("status"));
				res.setAlColor(alj.getString("color"));
				res.setAlDescription(alj.getString("description"));
				res.setAlProvince(alj.getString("province"));
				res.setAlCity(alj.getString("city"));
				res.setAlImagename(alj.getString("imagename"));
			}
			else {
				_log.error(""+aljson.getInt("rcode")+"\t"+aljson.getString("rdesc"));
			}
		}catch(UnirestException | IOException e) {
			_log.error(e.getMessage());
		}
		return res;
	}

	@Override
	public ArrayList<EarthquakeVo> getEqs(String citycode,String count) {
		ArrayList<EarthquakeVo> reslist=null;
		try {
			JSONObject json=new JsonNode(EnvicloudUtil.getCityEarthquake(citycode,count)).getObject();
			if(json.getInt("rcode")==200&&json.getString("rdesc").equals("Success")) {
				reslist=new ArrayList<EarthquakeVo>();
				JSONArray eqs=json.getJSONArray("earthquakes");
				for(int i=0;i<eqs.length();i++) {
					EarthquakeVo ev=new EarthquakeVo();
					JSONObject eq=eqs.getJSONObject(i);
					ev.setEqTime(eq.getString("time"));
					ev.setEqMag(eq.getString("mag"));
					ev.setEqDepth(eq.getString("depth"));
					ev.setEqDistance(eq.getString("distance"));
					ev.setEqLatitude(eq.getString("latitude"));
					ev.setEqLongitude(eq.getString("longitude"));
					ev.setEqPlace(eq.getString("place"));
					reslist.add(ev);
				}
			}
			else {
				_log.error(""+json.getInt("rcode")+"\t"+json.getString("rdesc"));
			}
		}catch(UnirestException | IOException e) {
			_log.error(e.getMessage());
		}
		return reslist;
	}

}
