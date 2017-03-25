package com.wygdove.hw.service.physical;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.wygdove.hw.common.utils.DateUtil;
import com.wygdove.hw.vo.EcgVo;
import com.wygdove.hw.vo.PhysicalCommonVo;

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

	@Override
	public List<PhysicalCommonVo> getdata(String sflag, String stype) {
		List<PhysicalCommonVo> reslist=new ArrayList<PhysicalCommonVo>();
		double[] bt=new double[]{36.8,36.3,36.9,37.2,37.0,37.5,37.6,37.3,37.5,37.2,36.8,36.3,36.9,37.2,37.0,37.5,37.6,37.3,37.5,37.2};
		double[] pulse=new double[]{};
		double[] breathe=new double[]{};
		double[] bloodoxygen=new double[]{};
		double[] ecg=new double[]{-4,-2,0,-4,-6,-4,-2,-4,-6,-6,-4,-4,-6,-6,-2,6,12,8,0,-16,-38,-60,-84,-90,-66,-32,-4,-2,-4,8,12,12, 10,6,6,6,4,0,0,0,0,0,-2,-4,0,0,0,-2,-2,0,0,-2,-2,-2,-2,0};
		double[] values;
		switch(stype) {
			case"bodytemperature":values=bt;break;
			case"pulse":values=pulse;break;
			case"breathe":values=breathe;break;
			case"bloodoxygen":values=bloodoxygen;break;
			case"electrocardiogram":values=ecg;break;
			default:values=new double[]{};
		}
		List<String> phytimes=DateUtil.getRandom(1,values.length);
		for(int i=0;i<values.length;i++) {
			PhysicalCommonVo pcv=new PhysicalCommonVo();
			pcv.setSflag(sflag);
			pcv.setStype(stype);
			pcv.setPhytime(phytimes.get(i));
			pcv.setPhyvalue(""+values[i]);
			reslist.add(pcv);
		}
		
		return reslist;
	}

}
