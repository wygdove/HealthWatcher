package com.wygdove.hw.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wygdove.hw.mybatis.dao.HwUserMapper;
import com.wygdove.hw.mybatis.model.HwUser;

/**
 * @author wygdove
 * @since 2017年2月14日下午4:54:38
 */
@Service
public class TestServiceImpl implements ITestService {

	@Resource
	private HwUserMapper hwUserMapper;
	
	public String dotest(String s) {
		s+="hahaha<br/>";
		HwUser hwuser=hwUserMapper.selectByPrimaryKey(1);
		s+=hwuser.getDisplayName();
		return s;
	}

}
