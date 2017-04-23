package com.wygdove.hw.service.setting;

import java.util.List;

import com.wygdove.hw.mybatis.model.HwDeviceType;
import com.wygdove.hw.mybatis.model.HwUser;
import com.wygdove.hw.vo.DeviceTableVo;

public interface IDeviceService {
	public List<HwDeviceType> getdtypes();
	public List<DeviceTableVo> getdevices(HwUser user);
	public String updatedevice(int deviceid);
	public String adddevice();
}
