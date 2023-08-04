package com.jiazhielec.framework.security.context;

import io.netty.util.concurrent.FastThreadLocal;
import org.springframework.security.core.Authentication;

/**
 * 身份验证信息
 * 
 * @author ruoyi
 */
public class AuthenticationContextHolder
{
    private static final FastThreadLocal<Authentication> contextHolder = new FastThreadLocal<>();

    public static Authentication getContext()
    {
        return contextHolder.get();
    }

    public static void setContext(Authentication context)
    {
        contextHolder.set(context);
    }

    public static void clearContext()
    {
        contextHolder.remove();
    }
}
