package com.wygdove.hw.service.setting;

import java.util.List;

import com.wygdove.hw.vo.EnvicityVo;

public interface IEnvicityService {
	public String getname(String citycode);
	public List<EnvicityVo> getplist();
	public List<EnvicityVo> getlist(String province);
	public EnvicityVo getprovince(String cityCode);
}
