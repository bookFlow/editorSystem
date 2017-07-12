package com.bookflow.domain;

import java.io.Serializable;
import java.sql.Timestamp;

import org.springframework.stereotype.Service;
@Service
public class Book implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    private int bookId ; //书编号
    private String userId ; //人编号
    private String bookName ; //书名
    private String userName  ; //人名
    private Timestamp date;//发布时间 
    public int getBookId() {
        return bookId;
    }
    public void setBookId(int bookId) {
        this.bookId = bookId;
    }
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getBookName() {
        return bookName;
    }
    public void setBookName(String bookName) {
        this.bookName = bookName;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    public Timestamp getDate() {
        return date;
    }
    public void setDate(Timestamp date) {
        this.date = date;
    }
    
    

}
