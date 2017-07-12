package com.bookflow.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bookflow.controller.AdminMangerController;
import com.bookflow.domain.Book;
import com.bookflow.domain.BookMix;
import com.bookflow.pojo.CommonRes;
@Service
public interface BookService {
    /**
     * 
     * 查询图书列表
     * 
     * 参数:参数map
     * */
    
    public List<Book> findBooksWithParm(Map<String,Object> map);//查询结果
    
    /**
     * 
     * 查询图书数量
     * 
     * 参数:参数map
     * */
    public int findNumsBooksWithParm(Map<String,Object> map);//查询结果
    
    /**
     * 
     * 查询图书数量
     * 
     * 参数:参数map
     * */
    public BookMix findBookDetail(int bid);
    
    /**
     * 
     * 删除某本图书/还有交易记录，如果存在的话
     * 
     * 参数:参数map
     * */
    @Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class,timeout=1,isolation=Isolation.DEFAULT) 
    public CommonRes deleteBook(int bid) throws Exception;
    
    
    
    
}
