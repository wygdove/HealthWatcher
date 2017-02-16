package com.wygdove.hw.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.filter.OncePerRequestFilter;

import com.wygdove.hw.common.constant.AttributeConstant;
import com.wygdove.hw.common.constant.ProjectConstant;
import com.wygdove.hw.common.constant.UriConstant;

/**
 * @author wygdove
 * @since 2017年2月16日下午3:33:45
 */
public class SessionFilter extends OncePerRequestFilter {
	private static final Logger _log=Logger.getLogger(SessionFilter.class);
	
	@Override
	protected void doFilterInternal(HttpServletRequest request,HttpServletResponse response,FilterChain filterChain) throws ServletException,IOException {
		String uri=request.getRequestURI();
		_log.debug("SessionFilter: filter uri: "+uri);
		if(checkuri(uri)) {
			Object object=request.getSession().getAttribute(AttributeConstant.HWUSER);
			if(object==null) {
				_log.debug("SessionFilter: There is no user.");
				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("UTF-8");
				request.getRequestDispatcher(UriConstant.LOGIN).forward(request,response);
			}
			else {
				_log.debug("SessionFilter: filter passed.");
				filterChain.doFilter(request,response);
			}
		}
		else {
			filterChain.doFilter(request,response);
		}
	}
	
	private boolean checkuri(String uri) {
		boolean res=true;
		for(String s:ProjectConstant.NO_SESSION_FILTER) {
			if(uri.endsWith(s)) {
				res=false;
				break;
			}
		}
		return res;
	}

}
