package com.bookflow.domain;

import java.io.Serializable;
import java.sql.Timestamp;

import org.springframework.stereotype.Service;
@Service
public class Record implements Serializable{


    private static final long serialVersionUID = 1L;
    private String sid ; 
    private String bid ;
    private int status;
    private int rid;
    private Timestamp dateE;
    public String getSid() {
        return sid;
    }
    public void setSid(String sid) {
        this.sid = sid;
    }
    public String getBid() {
        return bid;
    }
    public void setBid(String bid) {
        this.bid = bid;
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
    public int getStatus() {
        return status;
    }
    public void setStatus(int status) {
        this.status = status;
    }
    public Timestamp getDateE() {
        return dateE;
    }
    public void setDateE(Timestamp dateE) {
        this.dateE = dateE;
    }
}
