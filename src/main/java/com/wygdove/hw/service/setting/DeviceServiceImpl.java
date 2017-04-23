package com.wygdove.hw.service.setting;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wygdove.hw.mybatis.dao.HwDeviceMapper;
import com.wygdove.hw.mybatis.dao.HwDeviceTypeMapper;
import com.wygdove.hw.mybatis.model.HwDevice;
import com.wygdove.hw.mybatis.model.HwDeviceExample;
import com.wygdove.hw.mybatis.model.HwDeviceType;
import com.wygdove.hw.mybatis.model.HwDeviceTypeExample;
import com.wygdove.hw.mybatis.model.HwDeviceTypeExample.Criteria;
import com.wygdove.hw.mybatis.model.HwUser;
import com.wygdove.hw.vo.DeviceTableVo;

@Service
public class DeviceServiceImpl implements IDeviceService {

	@Resource
	private HwDeviceTypeMapper hwDeviceTypeMapper;
	@Resource
	private HwDeviceMapper hwDeviceMapper;
	
	@Override
	public List<HwDeviceType> getdtypes() {
		HwDeviceTypeExample example=new HwDeviceTypeExample();
		Criteria criteria=example.createCriteria();
		criteria.andIsvalidEqualTo(true);
		List<HwDeviceType> reslist=hwDeviceTypeMapper.selectByExample(example);
		return reslist;
	}
	
	private String getdtdes(Integer dtypeid) {
		String res="未知类型";
		HwDeviceTypeExample example=new HwDeviceTypeExample();
		Criteria criteria=example.createCriteria();
		criteria.andIsvalidEqualTo(true);
		criteria.andDeviceTypeIdEqualTo(dtypeid);
		List<HwDeviceType> hdtlist=hwDeviceTypeMapper.selectByExample(example);
		if(hdtlist!=null&&hdtlist.size()>0) {
			res=hdtlist.get(0).getDeviceTypeDescription();
		}
		return res;
	}

	@Override
	public List<DeviceTableVo> getdevices(HwUser user) {
		List<DeviceTableVo> reslist=new ArrayList<DeviceTableVo>();
		HwDeviceExample example=new HwDeviceExample();
		HwDeviceExample.Criteria criteria=example.createCriteria();
		criteria.andUserIdEqualTo(user.getUserId());
		List<HwDevice> hdlist=hwDeviceMapper.selectByExample(example);
		for(HwDevice hd:hdlist) {
			DeviceTableVo dtv=new DeviceTableVo();
			dtv.setDeviceid(hd.getDeviceId());
			dtv.setDname(hd.getDname());
			dtv.setDflag(hd.getDflag());
			dtv.setDtype(this.getdtdes(hd.getDtype()));
			dtv.setIsdefault(hd.getIsdefault());
			reslist.add(dtv);
		}
		return reslist;
	}

	@Override
	public String updatedevice(int deviceid) {
		return null;
	}

	@Override
	public String adddevice() {
		return null;
	}

}
