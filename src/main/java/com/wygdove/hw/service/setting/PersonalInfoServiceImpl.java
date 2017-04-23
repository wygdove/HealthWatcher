package com.wygdove.hw.service.setting;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wygdove.hw.mybatis.dao.HwUserMapper;
import com.wygdove.hw.mybatis.model.HwUser;

@Service
public class PersonalInfoServiceImpl implements IPersonalInfoService {

	@Resource
	private HwUserMapper hwuserMapper;
	
	@Override
	public String update(HwUser user) {
		int res=hwuserMapper.updateByPrimaryKey(user);
		return res>0?"success":"error";
	}

	@Override
	public String updateavatar(HwUser user,String filename) {
		user.setUserAvatar(filename);
		int res=hwuserMapper.updateByPrimaryKey(user);
		return res>0?"success":"error";
	}

}
