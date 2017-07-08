package com.bookflow.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bookflow.domain.Admin;

@Service
public interface AdminDao {
    public int findAdminorNum(String passPort,String passWord);//查找admin表中的管理员
    public Admin findAdminor(String passPort,String passWord);//找到对象
    public List<Admin> findAdminsWithParms(Map<String, Object> map);//分页查询管理员
    public int adminNumsWithParms(Map<String, Object> map);//查询符合条件的管理员总数，没有limit限制
    public int deleteAdmin(String passPort);//删除admin
    
    
}
