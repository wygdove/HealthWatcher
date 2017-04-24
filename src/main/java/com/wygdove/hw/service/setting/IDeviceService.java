package com.wygdove.hw.service.setting;

import java.util.List;
import java.util.Map;

import com.wygdove.hw.mybatis.model.HwDeviceType;
import com.wygdove.hw.mybatis.model.HwUser;
import com.wygdove.hw.vo.DeviceTableVo;

public interface IDeviceService {
	public List<HwDeviceType> getdtypes();
	public List<DeviceTableVo> getdevices(HwUser user);
	public Map<String,String> adddevice(HwUser user,String devname, String devtype, String devflag, String devisdefault);
	public Map<String,String> updatedevice(HwUser user,String devid,String devname,String devtype,String devflag,String devisdefault);
	public String deletedevice(String devid);
}
