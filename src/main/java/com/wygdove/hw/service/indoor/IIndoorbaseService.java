package com.wygdove.hw.service.indoor;

import java.util.List;

import com.wygdove.hw.vo.PmInoutdoorVo;
import com.wygdove.hw.vo.WenshiduVo;

public interface IIndoorbaseService {
	public List<WenshiduVo> getWsd(String sflag,String num);
	public String getgz(String sflag);
	public List<PmInoutdoorVo> getpm25io(String sflag); 
}
