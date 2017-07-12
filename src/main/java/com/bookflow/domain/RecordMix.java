package com.bookflow.domain;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Service;
@Service
public class RecordMix implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    private String sid ; 
    private String sName ; 
    private String bName ;
    private String bid ;
    private String pName ; //地点名
    private float x;
    private float y;
    private int rid;
    private Timestamp dateOk ; //确定事件
    private Timestamp dateE;//建立时间
    
    public Timestamp getDateE() {
        return dateE;
    }
    public void setDateE(Timestamp dateE) {
        this.dateE = dateE;
    }
    public int getStatus() {
        return status;
    }
    public void setStatus(int status) {
        this.status = status;
    }
    private int status;//交易状态
    public String getSid() {
        return sid;
    }
    public void setSid(String sid) {
        this.sid = sid;
    }
    public String getsName() {
        return sName;
    }
    public void setsName(String sName) {
        this.sName = sName;
    }
    public String getbName() {
        return bName;
    }
    public void setbName(String bName) {
        this.bName = bName;
    }
    public String getBid() {
        return bid;
    }
    public void setBid(String bid) {
        this.bid = bid;
    }
    public String getpName() {
        return pName;
    }
    public void setpName(String pName) {
        this.pName = pName;
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
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    public int getRid() {
        return rid;
    }
    public void setRid(int rid) {
        this.rid = rid;
    }
    public Timestamp getDateOk() {
        return dateOk;
    }
    public void setDateOk(Timestamp dateOk) {
        this.dateOk = dateOk;
    }
    
}
