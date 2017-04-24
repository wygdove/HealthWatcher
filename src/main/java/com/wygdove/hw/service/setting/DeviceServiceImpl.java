package com.wygdove.hw.service.setting;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

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
	public Map<String,String> adddevice(HwUser user,String devname,String devtype,String devflag,String devisdefault) {
		Map<String,String> resmap=new TreeMap<String,String>();
		HwDeviceExample example=new HwDeviceExample();
		HwDeviceExample.Criteria criteria=example.createCriteria();
		criteria.andUserIdEqualTo(user.getUserId());
		criteria.andDnameEqualTo(devname);
		List<HwDevice> hdlist=hwDeviceMapper.selectByExample(example);
		for(HwDevice hd:hdlist) {
			if(hd.getDname().equals(devname)) {
				resmap.put("recode","设备名重复");
				return resmap;
			}
		}
		criteria=example.createCriteria();
		criteria.andUserIdEqualTo(user.getUserId());
		criteria.andDtypeEqualTo(Integer.parseInt(devtype));
		criteria.andDflagEqualTo(devflag);
		List<HwDevice> hdlist2=hwDeviceMapper.selectByExample(example);
		for(HwDevice hd:hdlist2) {
			if(hd.getDflag().equals(devflag)) {
				resmap.put("recode","设备号重复");
				return resmap;
			}
		}
		
		HwDevice hd=new HwDevice();
		hd.setDname(devname);
		hd.setDtype(Integer.parseInt(devtype));
		hd.setDflag(devflag);
		hd.setIsdefault(devisdefault.equals("true")?true:false);
		hd.setUserId(user.getUserId());
		if(hwDeviceMapper.insert(hd)>0) {
			criteria=example.createCriteria();
			criteria.andUserIdEqualTo(user.getUserId());
			criteria.andDtypeEqualTo(Integer.parseInt(devtype));
			criteria.andDflagEqualTo(devflag);
			List<HwDevice> hdlist3=hwDeviceMapper.selectByExample(example);
			if(hdlist3!=null&&hdlist3.size()>0) {
				Integer devid=hdlist3.get(0).getDeviceId();
				if(devisdefault.equals("true")) {
					this.updatedefault(user,devid);
				}
				resmap.put("recode","success");
				resmap.put("redtype",this.getdtdes(Integer.parseInt(devtype)));
				resmap.put("redid",""+devid);
				return resmap;
			}
		}
		resmap.put("recode","未知错误");
		return resmap;
	}

	@Override
	public Map<String,String> updatedevice(HwUser user,String devid,String devname,String devtype,String devflag,String devisdefault) {
		if(devtype.equals(""))devtype="1";
		Map<String,String> resmap=new TreeMap<String,String>();
		HwDevice hd=new HwDevice();
		hd.setDeviceId(Integer.parseInt(devid));
		hd.setDname(devname);
		hd.setDtype(Integer.parseInt(devtype));
		hd.setDflag(devflag);
		hd.setIsdefault(devisdefault=="true"?true:false);
		hd.setUserId(user.getUserId());
		if(hwDeviceMapper.updateByPrimaryKey(hd)>0) {
			if(devisdefault.equals("true")) {
				this.updatedefault(user,Integer.parseInt(devid));
			}
			resmap.put("recode","success");
		} else {
			resmap.put("recode","未知错误");
		}
		return resmap;
	}
	
	private void updatedefault(HwUser user,Integer devid) {
		HwDeviceExample example=new HwDeviceExample();
		HwDeviceExample.Criteria criteria=example.createCriteria();
		criteria.andUserIdEqualTo(user.getUserId());
		List<HwDevice> hdlist=hwDeviceMapper.selectByExample(example);
		for(HwDevice hd:hdlist) {
			if(hd.getDeviceId().equals(devid)) {
				hd.setIsdefault(true);
			}
			else {
				hd.setIsdefault(false);
			}
			hwDeviceMapper.updateByPrimaryKey(hd);
		}
		
	}

	@Override
	public String deletedevice(String devid) {
		return hwDeviceMapper.deleteByPrimaryKey(Integer.parseInt(devid))>0?"success":"error";
	}

}
