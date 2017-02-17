package com.wygdove.hw.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wygdove.hw.common.utils.DateUtil;
import com.wygdove.hw.mybatis.dao.HwUserMapper;
import com.wygdove.hw.mybatis.model.HwUser;
import com.wygdove.hw.mybatis.model.HwUserExample;
import com.wygdove.hw.mybatis.model.HwUserExample.Criteria;

/**
 * @author wygdove
 * @since 2017年2月16日下午6:42:50
 */
@Service
public class LogonServiceImpl implements ILogonService {

	@Resource 
	private HwUserMapper hwUserMapper;
	
	public HwUser login(String username,String userpassword) {
		HwUser res=null;
		HwUserExample example=new HwUserExample();
		Criteria criteria=example.createCriteria();
		criteria.andLoginAccountEqualTo(username);
		criteria.andPasswordEqualTo(userpassword);
		List<HwUser> list=hwUserMapper.selectByExample(example);
		if(list!=null&&list.size()>0) {
			res=list.get(0);
		}
		return res;
	}

	public String register(String username,String userpassword) {
		HwUserExample example=new HwUserExample();
		Criteria criteria=example.createCriteria();
		criteria.andLoginAccountEqualTo(username);
		List<HwUser> list=hwUserMapper.selectByExample(example);
		if(list!=null&&list.size()>0) {
			return "<br />用户名已存在！";
		}
		
		HwUser hwuser=new HwUser();
		hwuser.setLoginAccount(username);
		hwuser.setDisplayName(username);
		hwuser.setPassword(userpassword);
		hwuser.setCreatedAt(DateUtil.getNowDate());
		hwuser.setUpdatedAt(DateUtil.getNowDate());
		hwuser.setStatus("enable");
		hwuser.setAccountType("user");
		hwuser.setCityCode("101010100");
		hwuser.setCityName("北京");
		return (hwUserMapper.insert(hwuser))>0?"success":"";
	}

}
