package com.wygdove.hw.service.setting;

import com.wygdove.hw.mybatis.model.HwUser;

public interface ISuggestService {
	public String addsuggest(HwUser user,String message);
}
