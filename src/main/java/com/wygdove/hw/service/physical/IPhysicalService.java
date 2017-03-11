package com.wygdove.hw.service.physical;

import java.util.List;

import com.wygdove.hw.vo.EcgVo;

public interface IPhysicalService {
	public List<EcgVo> getEcgdata(String sflag);

}
