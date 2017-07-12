package com.bookflow.domain;

import java.io.Serializable;
import java.sql.Timestamp;

import org.springframework.stereotype.Service;
@Service
public class BookMix implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    private float x; //经度
    private float y; //纬度
    private String bookName ; 
    private String userName ; 
    private String userId ;
    private int bookId ;
    
    
    
    private String pName ;  //地点名
    private Timestamp time ; //时间
    private int dealStatus;//联合查询
    private String productor ; //发布者 
    private String des ;  //描述
    private String images; //图片
    private String company ;//出版社
    private float price;//钱

    
    public String getProductor() {
        return productor;
    }
    public void setProductor(String productor) {
        this.productor = productor;
    }
    public String getDes() {
        return des;
    }
    public void setDes(String des) {
        this.des = des;
    }
    public String getImages() {
        return images;
    }
    public void setImages(String images) {
        this.images = images;
    }
    public String getCompany() {
        return company;
    }
    public void setCompany(String company) {
        this.company = company;
    }
    public float getPrice() {
        return price;
    }
    public void setPrice(float price) {
        this.price = price;
    }
    public float getX() {
        return x;
    }
    public void setX(float x) {
        this.x = x;
    }
    public float getY() {
        return y;
    }
    public void setY(float y) {
        this.y = y;
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
    public String getpName() {
        return pName;
    }
    public void setpName(String pName) {
        this.pName = pName;
    }
    public int getBookId() {
        return bookId;
    }
    public void setBookId(int bookId) {
        this.bookId = bookId;
    }
    public Timestamp getTime() {
        return time;
    }
    public void setTime(Timestamp time) {
        this.time = time;
    }
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    public int getDealStatus() {
        return dealStatus;
    }
    public void setDealStatus(int dealStatus) {
        this.dealStatus = dealStatus;
    }
  
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    
}
