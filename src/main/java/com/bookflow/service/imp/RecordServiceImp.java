package com.bookflow.service.imp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bookflow.dao.RecordDao;
import com.bookflow.domain.Record;
import com.bookflow.domain.RecordMix;
import com.bookflow.pojo.CommonRes;
import com.bookflow.service.RecordService;
import com.bookflow.util.ContantUtil;
@Service
public class RecordServiceImp implements RecordService {
    @Resource
    private RecordDao recordDao;
    private static final Logger LOGGER = LoggerFactory.getLogger(RecordServiceImp.class);
    @Override
    @Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class,timeout=1,isolation=Isolation.DEFAULT) 
    public boolean changeRecordStataus(int rid,int status) {
        // TODO Auto-generated method stub
        
        try {
            
            int num= recordDao.changeRecord(rid, status);
            return num>0?true:false;
         } catch (Exception e) {
             // TODO: handle exception
             LOGGER.error(e.getMessage());
             e.printStackTrace();
             return false;
         }
    }
    @Override
    @Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class,timeout=1,isolation=Isolation.DEFAULT) 
    public boolean deleteRecord(int rid) throws Exception {
        // TODO Auto-generated method stub
        
        try {
            int i  = recordDao.deleteRecordByRid(rid);
            return i>0?true:false;
        } catch (Exception e) {
            // TODO: handle exception
            LOGGER.error(e.getMessage());
            e.printStackTrace();
            return false;
        }
        
        
        
    }
    @Override
    public List<Record> findRecordsWihtParms(Map<String, Object> map) {
        // TODO Auto-generated method stub
      
        try {
            return recordDao.findRecordsWithParms(map);
        } catch (Exception e) {
            // TODO: handle exception
            // TODO: handle exception
            LOGGER.error(e.getMessage());
            e.printStackTrace();
            return new ArrayList<Record>();
        }
    }
    @Override
    public int findRecordsPageNumsWihtParms(Map<String, Object> map) {
        // TODO Auto-generated method stub
      
        
        try {
            int i= recordDao.findRecordsNums(map);
            System.out.println("记录数量:"+i);
            int rest=i % ContantUtil.ADMIN_PAGE_NUM;
            rest=rest>0?1:0;
            int base=(int)(i/ContantUtil.ADMIN_PAGE_NUM);
            return base+rest;
            
        } catch (Exception e) {
            // TODO: handle exception
            LOGGER.error(e.getMessage());
            e.printStackTrace();
            return 0;
        }
        
    }
    @Override
    public RecordMix findRecordDetail(int rid) {
        // TODO Auto-generated method stub
        
        try {
            Record record = recordDao.findRecordByRid(rid);
            RecordMix sRecordMix=recordDao.findRecordMixSellerById(rid, record.getSid());
            RecordMix bRecordMix=recordDao.findRecordMixBuyerById(rid, record.getBid());
            sRecordMix.setBid(bRecordMix.getBid());
            sRecordMix.setbName(bRecordMix.getbName());
            return sRecordMix;
            
            
        } catch (Exception e) {
            // TODO: handle exception
            LOGGER.error(e.getMessage());
            e.printStackTrace();
            return null;
        }
        
    
    }
    @Override
    public CommonRes cancelRecord(int rid) {
        // TODO Auto-generated method stub
        
        
        
        
        return null;
    }
    
}
