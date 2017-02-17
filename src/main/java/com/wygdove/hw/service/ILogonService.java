package com.wygdove.hw.service;

import com.wygdove.hw.mybatis.model.HwUser;

/**
 * @author wygdove
 * @since 2017年2月16日下午6:41:57
 */
public interface ILogonService {
	public HwUser login(String username,String userpassword);
	public String register(String username,String userpassword);	
}
