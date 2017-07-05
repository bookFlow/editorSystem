package com.bookflow.service;

import org.springframework.stereotype.Service;

import com.bookflow.domain.Admin;

/**
 * 用于人员管理
 * 
 * 
 * */
@Service
public interface AdminService {
   
    /**
     * 能否登陆
     * 参数：账号 密码
     * */
    public boolean canLogin(String passPort,String passWord);
    /**
     * 找到唯一实体对象
     * 参数：账号 密码
     * */
    public Admin getAdmin(String passPort,String passWord);
    
    
    
    
}
