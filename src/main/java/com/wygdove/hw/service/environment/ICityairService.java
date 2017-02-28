package com.wygdove.hw.service.environment;

import java.util.ArrayList;

import com.wygdove.hw.vo.CityairHistoryTrendVo;
import com.wygdove.hw.vo.CityairHistoryVo;
import com.wygdove.hw.vo.CityairLiveVo;

public interface ICityairService {
	public CityairLiveVo getcl(String citycode);
	public ArrayList<CityairHistoryVo> getchs(String citycode);
	public ArrayList<CityairHistoryTrendVo> getchts(String citycode);
}
