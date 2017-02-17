package com.wygdove.hw.common.utils;

import javax.servlet.http.HttpServletRequest;

import com.wygdove.hw.common.constant.AttributeConstant;
import com.wygdove.hw.mybatis.model.HwUser;

/**
 * @author wygdove
 * @since 2017年2月17日下午12:35:55
 */
public class SessionUtil {
	public static HwUser getLoginUser(HttpServletRequest request) {
		Object object=request.getSession().getAttribute(AttributeConstant.HWUSER);
		if(object instanceof HwUser) {
			return (HwUser)object;
		}
		else {
			return null;
		}
	}
}
