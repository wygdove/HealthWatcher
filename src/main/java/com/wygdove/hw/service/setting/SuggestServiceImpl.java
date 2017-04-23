package com.wygdove.hw.service.setting;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wygdove.hw.mybatis.dao.HwSuggestMapper;
import com.wygdove.hw.mybatis.model.HwSuggest;
import com.wygdove.hw.mybatis.model.HwUser;

@Service
public class SuggestServiceImpl implements ISuggestService {

	@Resource
	private HwSuggestMapper hwSuggestMapper;
	
	@Override
	public String addsuggest(HwUser user,String message) {
		String res="";
		HwSuggest record=new HwSuggest();
		record.setUserId(user.getUserId());
		record.setMessage(message);
		hwSuggestMapper.insert(record);
		res="成功提交，感谢您的反馈！";
		return res;
	}

}
