package com.bookflow.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bookflow.domain.Admin;
import com.bookflow.domain.Book;
import com.bookflow.domain.BookMix;
@Service
public interface BookDao {
    public List<Book> findBooksWithParms(Map<String, Object> map);//分页查询书
    public int findNumOfBooks(Map<String, Object> map);//查看书的数量
    public BookMix findBookDetailById(int bid);//根据书编号查询书的详细信息
    public int deleteBookWithId(int id);//根据编号删除书
    public int  deleteBookDetailWithId(int id);//删除书详情 ，根据Bid
    
    
}
