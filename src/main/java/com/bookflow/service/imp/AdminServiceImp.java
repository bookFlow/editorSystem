package com.bookflow.service.imp;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;



import com.bookflow.dao.AdminDao;
import com.bookflow.domain.Admin;
import com.bookflow.service.AdminService;

@Service
public class AdminServiceImp implements AdminService{
    @Resource
    private AdminDao adminDao;
    private static final Logger LOGGER = LoggerFactory.getLogger(AdminServiceImp.class);
    @Override
    public boolean canLogin(String passPort, String passWord) {
        // TODO Auto-generated method stub
        try {
            if(adminDao.findAdminorNum(passPort, passWord)<=0)return false;
            else return true;
        } catch (Exception e) {
            // TODO: handle exception
            LOGGER.info("查询账号出错:"+passPort+" "+passWord );
            return false;
        }
    }
    @Override
    public Admin getAdmin(String passPort, String passWord) {
        // TODO Auto-generated method stub
        
        try {
            return adminDao.findAdminor(passPort, passWord);
        } catch (Exception e) {
            // TODO: handle exception
            LOGGER.info("生成admin模型对象出错:"+passPort+" "+passWord );
            return null;
        }
    }

}
