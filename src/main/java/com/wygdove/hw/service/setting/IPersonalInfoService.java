package com.wygdove.hw.service.setting;

import com.wygdove.hw.mybatis.model.HwUser;

public interface IPersonalInfoService {
	public String update(HwUser user,String usernickname,String userpassword,String newpassword,String selectcity);
	public String updateavatar(HwUser user,String filename);
}
