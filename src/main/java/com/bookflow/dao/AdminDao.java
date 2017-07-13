package com.bookflow.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bookflow.domain.Admin;

@Service
public interface AdminDao {
    public Integer findAdminorNum(String passPort,String passWord);//查找admin表中的管理员
    public Admin findAdminor(String passPort,String passWord);//找到对象
    public List<Admin> findAdminsWithParms(Map<String, Object> map);//分页查询管理员
    public Integer adminNumsWithParms(Map<String, Object> map);//查询符合条件的管理员总数，没有limit限制
    public Integer deleteAdmin(String passPort);//删除admin
    public Integer adminsNumOfPassport(String passPort);//查看某个pp的用户是否存在
    public Integer insertAdmin(String passport,String passpwd,String name,String position);//插入用户
}
