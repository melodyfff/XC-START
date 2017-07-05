package com.xinchen.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * CORS 跨域请求拦截器
 * Created by xinchen on 2017/7/5.
 */
public class CORSFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        response.setHeader("Access-Control-Allow-Origin", "*");
        filterChain.doFilter(servletRequest, response);
    }

    @Override
    public void destroy() {

    }
}
