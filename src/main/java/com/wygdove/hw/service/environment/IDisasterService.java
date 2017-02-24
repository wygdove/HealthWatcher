package com.wygdove.hw.service.environment;

import java.util.ArrayList;

import com.wygdove.hw.vo.DisasterVo;
import com.wygdove.hw.vo.EarthquakeVo;

public interface IDisasterService {
	public DisasterVo getDis(String citycode,String cityname);
	public ArrayList<EarthquakeVo> getEqs(String citycode,String count);
}
