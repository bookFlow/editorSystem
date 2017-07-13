package com.bookflow.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bookflow.domain.Record;
import com.bookflow.domain.RecordMix;

@Service
public interface RecordDao {
    public Integer changeRecord(int bid,int status);//取消书的交易 /变成6 
    public List<Record> findRecordsWithParms(Map<String, Object> map);//分页查询交易记录
    public Integer findRecordsNums(Map<String, Object> map);//查看符合条件的交易的数量
    public RecordMix findRecordMixBuyerById(int id,String bid);//根据rid查询交易
    public RecordMix findRecordMixSellerById(int id,String sid);//根据rid查询交易
    public Integer findRecordNum(int bid);//根据书id查找条数
    public Record findRecordBybid(int bid);//根据书id 查找bid
    public Record findRecordByRid(int rid);//根据rid查找条目
    public Integer deleteRecordByRid(int rid) ;// 根据bid删除 条目
    public Integer changeRecordByRid(int rid,int status);//根据rid改变status
  
}
