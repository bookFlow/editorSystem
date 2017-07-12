package com.bookflow.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bookflow.domain.Record;
import com.bookflow.domain.RecordMix;
import com.bookflow.pojo.CommonRes;

@Service
public interface RecordService {

    /**
     * 更改交易状态
     * 
     * */
    @Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class,timeout=1,isolation=Isolation.DEFAULT) 
    public boolean changeRecordStataus(int rid,int status) throws Exception;
    
    
    /**
     * 删除交易
     * 
     * */
    @Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class,timeout=1,isolation=Isolation.DEFAULT) 
    public boolean deleteRecord(int rid) throws Exception;
    
    
    /**
     * 
     * 查找符合条件的列表
     * 
     * 
     * */
    public List<Record> findRecordsWihtParms(Map<String, Object> map);
    
    /**
     * 
     * 查询数量
     * */
     
    public int findRecordsPageNumsWihtParms(Map<String, Object> map);
    
    /**
     * 展示record详情
     * 
     * 
     * */
     public RecordMix findRecordDetail(int rid);
    
     
     /**
      * 
      * 取消某次交易
      * 
      * */
     public CommonRes cancelRecord(int rid);
     
     
     
}
