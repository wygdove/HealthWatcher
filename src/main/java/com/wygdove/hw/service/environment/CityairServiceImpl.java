package com.wygdove.hw.service.environment;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.exceptions.UnirestException;
import com.wygdove.hw.common.utils.EnvicloudUtil;
import com.wygdove.hw.vo.CityairHistoryTrendVo;
import com.wygdove.hw.vo.CityairHistoryVo;
import com.wygdove.hw.vo.CityairLiveVo;

@Service
public class CityairServiceImpl implements ICityairService {
	private static final Logger _log=Logger.getLogger(CityairServiceImpl.class);
	
	@Override
	public CityairLiveVo getcl(String citycode) {
		CityairLiveVo res=null;
		try {
			JSONObject json=new JsonNode(EnvicloudUtil.getCityairLive(citycode)).getObject();
			if(json.getInt("rcode")==200&&json.getString("rdesc").equals("Success")) {
				res=new CityairLiveVo();
				String stime=json.getString("time");
				String scaltime=stime.substring(0,4)+"/"+stime.substring(4,6)+"/"+stime.substring(6,8)+" "+stime.substring(8,10)+":00";
				res.setCalTime(scaltime);
				res.setCalAqi(json.getString("AQI"));
				res.setCalPrimary(json.getString("primary"));
				res.setCalPm25(json.getString("PM25"));
				res.setCalPm10(json.getString("PM10"));
				res.setCalO3(json.getString("o3"));
				res.setCalCo(json.getString("CO"));
				res.setCalSo2(json.getString("SO2"));
				res.setCalNo2(json.getString("NO2"));
			}
			else {
				_log.error(""+json.getInt("rcode")+"\t"+json.getString("rdesc"));
			}
		} catch (UnirestException | IOException e) {
			_log.error(e.getMessage());
		}
		return res;
	}

	@Override
	public ArrayList<CityairHistoryVo> getchs(String citycode) {
		ArrayList<CityairHistoryVo> reslist=null;
		try{
			JSONObject json=new JsonNode(EnvicloudUtil.getCityairHistory(citycode)).getObject();
			if(json.getInt("rcode")==200&&json.getString("rdesc").equals("Success")) {
				String[] items=new String[]{"AQI","PM25","PM10","o3","CO","SO2","NO2"};
				HashMap<String,Double> samp=new HashMap<String,Double>();
				HashMap<String,Double> simp=new HashMap<String,Double>();
				HashMap<String,Double> snmp=new HashMap<String,Double>();
				Integer latelytime=0;
				JSONArray cahinfo=json.getJSONArray("history");
				for(int i=0;i<cahinfo.length();i++) {
					JSONObject chj=cahinfo.getJSONObject(i);
					String stime=chj.getString("time");
					for(String item:items) {
						System.out.println(chj.getString(item));
						Double xx=Double.parseDouble(chj.getString(item));
						if(i==0) {
							samp.put(item,xx);
							simp.put(item,xx);
							snmp.put(item,xx);
							latelytime=Integer.parseInt(stime);
						}
						else {
							samp.put(item,samp.get(item)>xx?samp.get(item):xx);
							simp.put(item,samp.get(item)<xx?samp.get(item):xx);
							snmp.put(item,latelytime>Integer.parseInt(stime)?samp.get(item):xx);
						}
					}
				}
				reslist=new ArrayList<CityairHistoryVo>();
				for(String item:items) {
					CityairHistoryVo chv=new CityairHistoryVo();
					chv.setCahItemName(item);
					chv.setCahItemNow(snmp.get(item).toString());
					chv.setCahItemMax(samp.get(item).toString());
					chv.setCahItemMin(simp.get(item).toString());
					reslist.add(chv);
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

	@Override
	public ArrayList<CityairHistoryTrendVo> getchts(String citycode) {
		ArrayList<CityairHistoryTrendVo> reslist=null;
		try{
			JSONObject json=new JsonNode(EnvicloudUtil.getCityairHistory(citycode)).getObject();
			if(json.getInt("rcode")==200&&json.getString("rdesc").equals("Success")) {
				reslist=new ArrayList<CityairHistoryTrendVo>();
				JSONArray cahinfo=json.getJSONArray("history");
				for(int i=0;i<cahinfo.length();i++) {
					JSONObject chj=cahinfo.getJSONObject(i);
					CityairHistoryTrendVo chtv=new CityairHistoryTrendVo();
					chtv.setStime(chj.getString("time"));
					chtv.setAQI(chj.getString("AQI"));
					chtv.setPM25(chj.getString("PM25"));
					chtv.setPM10(chj.getString("PM10"));
					chtv.setO3(chj.getString("o3"));
					chtv.setCO(chj.getString("CO"));
					chtv.setSO2(chj.getString("SO2"));
					chtv.setNO2(chj.getString("NO2"));
					reslist.add(chtv);
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

}
