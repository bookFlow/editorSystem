package com.bookflow.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class RedirectionFilter implements Filter{
    public static Map<String, String> map=new HashMap<String, String>(){{
        put("login","");
        put("checkLogin","");
        
    }};
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res,
            FilterChain chain) throws IOException, ServletException {
        // TODO Auto-generated method stub
        HttpServletRequest request=(HttpServletRequest)(req);
        HttpServletResponse response=(HttpServletResponse)(res);
        HttpSession session=request.getSession();
        
        
        
    }

    @Override
    public void destroy() {
        // TODO Auto-generated method stub
        
    }

}
