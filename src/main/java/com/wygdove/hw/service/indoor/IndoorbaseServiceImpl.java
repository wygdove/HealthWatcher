package com.wygdove.hw.service.indoor;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.exceptions.UnirestException;
import com.wygdove.hw.common.utils.DateUtil;
import com.wygdove.hw.common.utils.SenserDataUtil;
import com.wygdove.hw.vo.WenshiduVo;

@Service
public class IndoorbaseServiceImpl implements IIndoorbaseService {
	private static final Logger _log=Logger.getLogger(IndoorbaseServiceImpl.class);
	
	@Override
	public List<WenshiduVo> getWsd(String sflag,String num) {
		List<WenshiduVo> reslist=null;
		try {
			JSONObject json=new JsonNode(SenserDataUtil.getWenshiduData(sflag, num)).getObject();
			JSONArray wsdResults=json.getJSONArray("getWsdDataResult");
			reslist=new ArrayList<WenshiduVo>();
			for(int i=0;i<wsdResults.length();i++) {
				JSONObject jwsd=wsdResults.getJSONObject(i);
				WenshiduVo wsv=new WenshiduVo();
				wsv.setSflag(sflag);
//				wsv.setDtime(jwsd.getString("time"));
				wsv.setDtime(DateUtil.getWsdTime(jwsd.get("time").toString()));
				wsv.setWendu(jwsd.get("wendu").toString());
				wsv.setShidu(jwsd.get("shidu").toString());
				reslist.add(wsv);
			}
		} catch (UnirestException e) {
			_log.error(e.getMessage());
		}
		return reslist;
	}

	@Override
	public String getgz(String sflag) {
		String dtime=DateUtil.getNow();
		int gzvalue=(new Random()).nextInt(100);
		return dtime+" "+gzvalue;
	}

}
