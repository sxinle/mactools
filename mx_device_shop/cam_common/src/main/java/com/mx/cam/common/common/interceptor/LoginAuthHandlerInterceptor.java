package com.mx.cam.common.common.interceptor;

import com.mx.cam.common.common.MustLogin;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginAuthHandlerInterceptor extends HandlerInterceptorAdapter {

	private MustLogin getRequestAuthSetting(Object handler) {
		if (handler instanceof HandlerMethod) {
			HandlerMethod method = ((HandlerMethod) handler);
			MustLogin mustLogin = method.getBeanType().getAnnotation(MustLogin.class);
			if (null == mustLogin) {
				mustLogin = ((HandlerMethod) handler).getMethodAnnotation(MustLogin.class);
			}
			return mustLogin;
		} else {
			return null;
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		MustLogin mustLogin = getRequestAuthSetting(handler);
		if (mustLogin == null) {
			return true;
		} else {
			if (mustLogin.check()) {
				try {
					if (!hasPermition(request)) {
                        throw new IllegalArgumentException();
					}
				} catch (IllegalArgumentException e) {
                    throw e;
				}
			}
		}
		return true;
	}

	boolean hasPermition(HttpServletRequest req) {
        // TODO 暂时只校验是否登陆
        return req.getSession().getAttribute("user") != null;
	}

}
