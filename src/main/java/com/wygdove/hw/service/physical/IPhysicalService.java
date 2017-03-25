package com.wygdove.hw.service.physical;

import java.util.List;

import com.wygdove.hw.vo.EcgVo;
import com.wygdove.hw.vo.PhysicalCommonVo;

public interface IPhysicalService {
	public List<EcgVo> getEcgdata(String sflag);

	public List<PhysicalCommonVo> getdata(String sflag,String stype);
}
