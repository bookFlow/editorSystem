package com.bookflow.service.imp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.jsoup.helper.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;




import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bookflow.dao.AdminDao;
import com.bookflow.domain.Admin;
import com.bookflow.pojo.CommonRes;
import com.bookflow.service.AdminService;
import com.bookflow.util.ContantUtil;

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
    
    /**
     * 
     * 根据条件查询管理人员的列表
     * 
     * */
    @Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class,timeout=1,isolation=Isolation.DEFAULT)
    @Override
    public List<Admin> findAdminsWithParms(Map<String, Object> map) {
        // TODO Auto-generated method stub
        
        try {
            
            return adminDao.findAdminsWithParms(map);
            
        } catch (Exception e) {
            // TODO: handle exception'
            LOGGER.error("条件查询出错!");
            e.printStackTrace();
            return new ArrayList<Admin>();
        }
        
        
       
    }
    @Override
    public int adminsNumWithParms(Map<String, Object> map) {
        // TODO Auto-generated method stub
        try {
            
            int i= adminDao.adminNumsWithParms(map);
            System.out.println("人员数:"+i);
            int rest=i % ContantUtil.ADMIN_PAGE_NUM;
            rest=rest>0?1:0;
            int base=(int)(i/ContantUtil.ADMIN_PAGE_NUM);
            return base+rest;//一共页数
        } catch (Exception e) {
            // TODO: handle exception
            LOGGER.error(e.getMessage());
            return 0;
        }
    }
    @Override
    public  CommonRes deleteAdmin(Admin admin, String p2) {
        // TODO Auto-generated method stub
        CommonRes commonRes=new CommonRes();
        if(admin == null ){
            
            commonRes.setSucceed(false);
            commonRes.setDes("管理员账号为空");
            return commonRes;
            
        }
        String p1=admin.getPassport();

        if(StringUtil.isBlank(p1) || StringUtil.isBlank(p2)){
           
            commonRes.setSucceed(false);
            commonRes.setDes("管理员账号为空");
            
        }else {
            if(p1.equals(p2)){
                commonRes.setSucceed(false);
                commonRes.setDes("无法删除自身");
                
            }else {
                int i=adminDao.deleteAdmin(p2);
                if(i<1){
                    commonRes.setSucceed(false);
                    commonRes.setDes("删除失败!");
                    
                }else {
                    commonRes.setSucceed(true);
                    commonRes.setDes("删除成功!");
                }
            }
        }
        return commonRes;
    }
    @Override
    public CommonRes hasAdmin(String passport) {
        // TODO Auto-generated method stub
        CommonRes commonRes=new CommonRes();
        if(adminDao.adminsNumOfPassport(passport) <= 0){
            
            commonRes.setSucceed(false);
            
        }
        else {
            
            commonRes.setSucceed(true);
            
        }
        return commonRes;
    }
    @Override
    public CommonRes addAdmin(String passport, String password, String name,String position) {
         CommonRes commonRes=new CommonRes();
         int nums=adminDao.insertAdmin(passport, password, name,position);       
         if(nums <=0){commonRes.setSucceed(false);}
         else {commonRes.setSucceed(true);}
        return commonRes;
    }
    
    
    
}
