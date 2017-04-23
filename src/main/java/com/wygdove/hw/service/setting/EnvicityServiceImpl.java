package com.wygdove.hw.service.setting;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wygdove.hw.mybatis.dao.EnviCitycodeMapper;
import com.wygdove.hw.mybatis.model.EnviCitycode;
import com.wygdove.hw.mybatis.model.EnviCitycodeExample;
import com.wygdove.hw.mybatis.model.EnviCitycodeExample.Criteria;
import com.wygdove.hw.mybatis.model.EnviCitycodeProvince;
import com.wygdove.hw.vo.EnvicityVo;

@Service
public class EnvicityServiceImpl implements IEnvicityService {
	
	@Resource
	private EnviCitycodeMapper enviCitycodeMapper;

	@Override
	public String getname(String citycode) {
		String res="";
		EnviCitycode ectemp=enviCitycodeMapper.selectByPrimaryKey(citycode);
		if(ectemp!=null) {
			res=ectemp.getNamecn();
		}
		return res;
	}

	@Override
	public List<EnvicityVo> getplist() {
		List<EnvicityVo> reslist=new ArrayList<EnvicityVo>();
		List<EnviCitycodeProvince> eclist=enviCitycodeMapper.selectDistinctProvince();
		for(EnviCitycodeProvince ec:eclist) {
			EnvicityVo ecv=new EnvicityVo();
			ecv.setEccode(ec.getProven());
			ecv.setEcname(ec.getProvcn());
			reslist.add(ecv);
		}
		return reslist;
	}

	@Override
	public List<EnvicityVo> getlist(String province) {
		List<EnvicityVo> reslist=new ArrayList<EnvicityVo>();
		EnviCitycodeExample example=new EnviCitycodeExample();
		Criteria criteria=example.createCriteria();
		criteria.andProvenEqualTo(province);
		List<EnviCitycode> eclist=enviCitycodeMapper.selectByExample(example);
		for(EnviCitycode ec:eclist) {
			EnvicityVo ecv=new EnvicityVo();
			ecv.setEccode(ec.getAreaid());
			ecv.setEcname(ec.getNamecn());
			reslist.add(ecv);
		}
		return reslist;
	}

	@Override
	public EnvicityVo getprovince(String cityCode) {
		EnvicityVo res=null;
		EnviCitycodeExample example=new EnviCitycodeExample();
		Criteria criteria=example.createCriteria();
		criteria.andAreaidEqualTo(cityCode);
		List<EnviCitycode> eclist=enviCitycodeMapper.selectByExample(example);
		if(eclist!=null&&eclist.size()>0) {
			EnviCitycode ectemp=eclist.get(0);
			res=new EnvicityVo();
			res.setEccode(ectemp.getProven());
			res.setEcname(ectemp.getProvcn());
		}
		return res;
	}
	
}
