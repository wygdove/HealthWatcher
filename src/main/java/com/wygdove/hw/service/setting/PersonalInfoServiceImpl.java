package com.wygdove.hw.service.setting;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wygdove.hw.mybatis.dao.HwUserMapper;
import com.wygdove.hw.mybatis.model.HwUser;

@Service
public class PersonalInfoServiceImpl implements IPersonalInfoService {

	@Resource
	private HwUserMapper hwuserMapper;
	@Resource
	private IEnvicityService envicityService;
	
	@Override
	public String update(HwUser user,String usernickname,String userpassword,String newpassword,String selectcity) {
		String res="";
		if(userpassword!=null&&!user.getPassword().equals(userpassword)) {
			return "密码错误";
		}
		if(usernickname!=null) {
			user.setDisplayName(usernickname);
		}
		if(newpassword!=null) {
			user.setPassword(newpassword);
		}
		if(selectcity!=null) {
			user.setCityCode(selectcity);
			user.setCityName(envicityService.getname(selectcity));
		}
		res=hwuserMapper.updateByPrimaryKey(user)>0?"修改成功":"修改失败";
		return res;
	}

	@Override
	public String updateavatar(HwUser user,String filename) {
		user.setUserAvatar(filename);
		int res=hwuserMapper.updateByPrimaryKey(user);
		return res>0?"success":"error";
	}

}
