package com.jiazhielec.framework.interceptor;

import com.jiazhielec.common.utils.PageUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author ze.chen
 * @description 防止分页ThreadLocal共享线程参数复用拦截器
 * @date 2022/8/25
 **/
@Component
public class PageLocalWebInterceptor implements HandlerInterceptor {

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        PageUtils.clearPage();
    }
}
