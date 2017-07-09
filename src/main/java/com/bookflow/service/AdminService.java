package com.bookflow.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bookflow.domain.Admin;
import com.bookflow.pojo.CommonRes;

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
    
    /**
     * 
     * 查询管理员
     * 参数：map
     * */
    public List<Admin> findAdminsWithParms(Map<String, Object> map);
    /**
     * 
     * 查询管理员数量一共占多少页
     * 参数：map
     * */
    public int adminsNumWithParms(Map<String, Object> map);
    
    /**
     * 
     * 删除一个管理员
     * 参数：执行删除操作的passPort,被删的pp
     * */
    public CommonRes deleteAdmin(Admin admin,String p2);
    
    /**
     * 查看某个账号是否已经注册
     * 参数:passport
     * 
     * */
    public CommonRes hasAdmin(String passport);
    /**
     * 查看某个账号是否已经注册
     * 参数:passport
     * 
     * */
    public CommonRes addAdmin(String passport,String password,String name,String position);
    
    
}
