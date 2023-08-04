package com.jiazhielec.framework.config;

import com.jiazhielec.framework.config.properties.CasProperties;
import com.jiazhielec.framework.security.handle.CasAuthenticationSuccessHandler;
import com.jiazhielec.framework.web.service.CasUserDetailsServiceImpl;
import org.jasig.cas.client.session.SingleSignOutFilter;
import org.jasig.cas.client.validation.Cas20ServiceTicketValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.cas.ServiceProperties;
import org.springframework.security.cas.authentication.CasAuthenticationProvider;
import org.springframework.security.cas.web.CasAuthenticationEntryPoint;
import org.springframework.security.cas.web.CasAuthenticationFilter;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.logout.LogoutFilter;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.filter.CorsFilter;
import com.jiazhielec.framework.config.properties.PermitAllUrlProperties;
import com.jiazhielec.framework.security.filter.JwtAuthenticationTokenFilter;
import com.jiazhielec.framework.security.handle.AuthenticationEntryPointImpl;
import com.jiazhielec.framework.security.handle.LogoutSuccessHandlerImpl;

/**
 * spring security配置
 *
 * @author ruoyi
 */
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter
{
    @Autowired
    private CasProperties casProperties;

    @Autowired
    private CasUserDetailsServiceImpl customUserDetailsService;

    @Autowired
    private CasAuthenticationSuccessHandler casAuthenticationSuccessHandler;

    /**
     * 自定义用户认证逻辑
     */
    @Autowired
    private UserDetailsService userDetailsService;

    /**
     * 认证失败处理类
     */
    @Autowired
    private AuthenticationEntryPointImpl unauthorizedHandler;

    /**
     * 退出处理类
     */
    @Autowired
    private LogoutSuccessHandlerImpl logoutSuccessHandler;

    /**
     * token认证过滤器
     */
    @Autowired
    private JwtAuthenticationTokenFilter authenticationTokenFilter;

    /**
     * 跨域过滤器
     */
    @Autowired
    private CorsFilter corsFilter;

    /**
     * 允许匿名访问的地址
     */
    @Autowired
    private PermitAllUrlProperties permitAllUrl;

    /**
     * 解决 无法直接注入 AuthenticationManager
     */
    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception
    {
        return super.authenticationManagerBean();
    }

    /**
     * anyRequest          |   匹配所有请求路径
     * access              |   SpringEl表达式结果为true时可以访问
     * anonymous           |   匿名可以访问
     * denyAll             |   用户不能访问
     * fullyAuthenticated  |   用户完全认证可以访问（非remember-me下自动登录）
     * hasAnyAuthority     |   如果有参数，参数表示权限，则其中任何一个权限可以访问
     * hasAnyRole          |   如果有参数，参数表示角色，则其中任何一个角色可以访问
     * hasAuthority        |   如果有参数，参数表示权限，则其权限可以访问
     * hasIpAddress        |   如果有参数，参数表示IP地址，如果用户IP和参数匹配，则可以访问
     * hasRole             |   如果有参数，参数表示角色，则其角色可以访问
     * permitAll           |   用户可以任意访问
     * rememberMe          |   允许通过remember-me登录的用户访问
     * authenticated       |   用户登录后可访问
     */
    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception{
        ExpressionUrlAuthorizationConfigurer<HttpSecurity>.ExpressionInterceptUrlRegistry registry = httpSecurity.authorizeRequests();
        if (!casProperties.isCasEnable()) {
            // 注解标记允许匿名访问的url
            permitAllUrl.getUrls().forEach(url -> registry.antMatchers(url).permitAll());
            httpSecurity
                    // CSRF禁用，因为不使用session
                    .csrf().disable()
                    // 禁用HTTP响应标头
                    .headers().cacheControl().disable().and()
                    // 认证失败处理类
                    .exceptionHandling().authenticationEntryPoint(unauthorizedHandler).and()
                    // 基于token，所以不需要session
                    .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
                    // 过滤请求
                    .authorizeRequests()
                    // 对于登录login 注册register 验证码captchaImage 允许匿名访问
                    .antMatchers("/login", "/register", "/captchaImage").permitAll()
                    // 静态资源，可匿名访问
                    .antMatchers(HttpMethod.GET, "/", "/*.html", "/**/*.html", "/**/*.css", "/**/*.js", "/profile/**").permitAll()
                    .antMatchers("/swagger-ui.html", "/swagger-resources/**", "/webjars/**", "/*/api-docs", "/druid/**").permitAll()
                    .antMatchers("/websocket/**").permitAll()
                    .antMatchers("/magic/web/**").anonymous()
                    // 除上面外的所有请求全部需要鉴权认证
                    .anyRequest().authenticated()
                    .and()
                    .headers().frameOptions().disable();
            // 添加Logout filter
            httpSecurity.logout().logoutUrl("/logout").logoutSuccessHandler(logoutSuccessHandler);
            // 添加JWT filter
            httpSecurity.addFilterBefore(authenticationTokenFilter, UsernamePasswordAuthenticationFilter.class);
            // 添加CORS filter
            httpSecurity.addFilterBefore(corsFilter, JwtAuthenticationTokenFilter.class);
            httpSecurity.addFilterBefore(corsFilter, LogoutFilter.class);
        }else {
            // 注解标记允许匿名访问的url
            permitAllUrl.getUrls().forEach(url -> registry.antMatchers(url).permitAll());
            httpSecurity
                    // CSRF禁用，因为不使用session
                    .csrf().disable()
                    // 基于token，所以不需要session
                    .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
                    // 过滤请求
                    .authorizeRequests()
                    // 静态资源，可匿名访问
                    .antMatchers(HttpMethod.GET, "/", "/*.html", "/**/*.html", "/**/*.css", "/**/*.js", "/profile/**").permitAll()
                    .antMatchers("/swagger-ui.html", "/swagger-resources/**", "/webjars/**", "/*/api-docs", "/druid/**").permitAll()
                    .antMatchers("/websocket/**").permitAll()
                    .antMatchers("/magic/web/**").anonymous()
                    // 除上面外的所有请求全部需要鉴权认证
                    .anyRequest().authenticated()
                    .and()
                    .headers().frameOptions().disable();
            //单点登录登出
            httpSecurity.logout().permitAll().logoutSuccessHandler(logoutSuccessHandler);
            // Custom JWT based security filter
            httpSecurity.addFilter(casAuthenticationFilter())
                    .addFilterBefore(authenticationTokenFilter, CasAuthenticationFilter.class)
                    .addFilterBefore(singleSignOutFilter(), CasAuthenticationFilter.class).exceptionHandling()
                    //认证失败
                    .authenticationEntryPoint(casAuthenticationEntryPoint());
            // 添加CORS filter
            httpSecurity.addFilterBefore(corsFilter, JwtAuthenticationTokenFilter.class);
            httpSecurity.addFilterBefore(corsFilter, LogoutFilter.class);
            // disable page caching
            httpSecurity.headers().cacheControl();
        }
    }

    /**
     * 强散列哈希加密实现
     */
    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder()
    {
        return new BCryptPasswordEncoder();
    }

    /**
     * 身份认证接口
     */
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception
    {
        if (!casProperties.isCasEnable()) {
            auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
        }
        // cas
        if (casProperties.isCasEnable()) {
            super.configure(auth);
            auth.authenticationProvider(casAuthenticationProvider());
        }
    }

    /**
     * 认证的入口
     */
    @Bean
    public CasAuthenticationEntryPoint casAuthenticationEntryPoint() {
        CasAuthenticationEntryPoint casAuthenticationEntryPoint = new CasAuthenticationEntryPoint();
        casAuthenticationEntryPoint.setLoginUrl(casProperties.getCasServerLoginUrl());
        casAuthenticationEntryPoint.setServiceProperties(serviceProperties());
        return casAuthenticationEntryPoint;
    }

    /**
     * 指定service相关信息
     */
    @Bean
    public ServiceProperties serviceProperties() {
        ServiceProperties serviceProperties = new ServiceProperties();
        serviceProperties.setService(casProperties.getAppServerUrl() + casProperties.getAppLoginUrl());
        serviceProperties.setAuthenticateAllArtifacts(true);
        return serviceProperties;
    }

    /**
     * CAS认证过滤器
     */
    @Bean
    public CasAuthenticationFilter casAuthenticationFilter() throws Exception {
        CasAuthenticationFilter casAuthenticationFilter = new CasAuthenticationFilter();
        casAuthenticationFilter.setAuthenticationManager(authenticationManager());
        casAuthenticationFilter.setFilterProcessesUrl(casProperties.getAppLoginUrl());
        casAuthenticationFilter.setAuthenticationSuccessHandler(casAuthenticationSuccessHandler);
        return casAuthenticationFilter;
    }

    /**
     * cas 认证 Provider
     */
    @Bean
    public CasAuthenticationProvider casAuthenticationProvider() {
        CasAuthenticationProvider casAuthenticationProvider = new CasAuthenticationProvider();
        casAuthenticationProvider.setAuthenticationUserDetailsService(customUserDetailsService);
        casAuthenticationProvider.setServiceProperties(serviceProperties());
        casAuthenticationProvider.setTicketValidator(cas20ServiceTicketValidator());
        casAuthenticationProvider.setKey("casAuthenticationProviderKey");
        return casAuthenticationProvider;
    }

    @Bean
    public Cas20ServiceTicketValidator cas20ServiceTicketValidator() {
        return new Cas20ServiceTicketValidator(casProperties.getCasServerUrl());
    }

    /**
     * 单点登出过滤器
     */
    @Bean
    public SingleSignOutFilter singleSignOutFilter() {
        SingleSignOutFilter singleSignOutFilter = new SingleSignOutFilter();
        //可设可不设
        singleSignOutFilter.setLogoutCallbackPath(casProperties.getCasServerUrl());
        singleSignOutFilter.setIgnoreInitConfiguration(true);
        return singleSignOutFilter;
    }

    /**
     * 请求单点退出过滤器
     */
    @Bean
    public LogoutFilter casLogoutFilter() {
        LogoutFilter logoutFilter = new LogoutFilter(casProperties.getCasServerLogoutUrl(), new SecurityContextLogoutHandler());
        logoutFilter.setFilterProcessesUrl(casProperties.getAppLogoutUrl());
        return logoutFilter;
    }
}