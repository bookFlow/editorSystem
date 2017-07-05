package com.bookflow.dao;

import org.springframework.stereotype.Service;

import com.bookflow.domain.Admin;

@Service
public interface AdminDao {
    public int findAdminorNum(String passPort,String passWord);//查找admin表中的管理员
    public Admin findAdminor(String passPort,String passWord);//找到对象
    
}
