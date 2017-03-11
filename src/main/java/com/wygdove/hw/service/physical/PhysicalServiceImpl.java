package com.wygdove.hw.service.physical;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.wygdove.hw.common.utils.DateUtil;
import com.wygdove.hw.vo.EcgVo;

@Service
public class PhysicalServiceImpl implements IPhysicalService {

	@Override
	public List<EcgVo> getEcgdata(String sflag) {
		List<EcgVo> reslist=new ArrayList<EcgVo>();
		int[] ecg=new int[]{-4,-2,0,-4,-6,-4,-2,-4,-6,-6,-4,-4,-6,-6,-2,6,12,8,0,-16,-38,-60,-84,-90,-66,-32,-4,-2,-4,8,12,12, 10,6,6,6,4,0,0,0,0,0,-2,-4,0,0,0,-2,-2,0,0,-2,-2,-2,-2,0};
		for(int i=0;i<ecg.length;i++) {
			EcgVo ev=new EcgVo();
			ev.setSflag(sflag);
			ev.setDtime(DateUtil.getPmioTime(i));
			ev.setEcgvalue(""+ecg[i]);
			reslist.add(ev);
		}
		return reslist;
	}

}
