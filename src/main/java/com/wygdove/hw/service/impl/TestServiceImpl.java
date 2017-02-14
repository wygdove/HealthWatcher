package com.wygdove.hw.service.impl;

import org.springframework.stereotype.Service;

import com.wygdove.hw.service.ITestService;

/**
 * @author wygdove
 * @since 2017年2月14日下午4:54:38
 */
@Service
public class TestServiceImpl implements ITestService {

	public String dotest(String s) {
		s+="hahaha";
		return s;
	}

}
