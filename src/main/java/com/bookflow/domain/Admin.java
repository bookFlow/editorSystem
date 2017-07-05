package com.bookflow.domain;

import java.io.Serializable;

import org.springframework.stereotype.Service;
@Service
public class Admin implements Serializable{
    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    private String passport;
    private String password;
    private String position;
    private String name;
    public String getPassport() {
        return passport;
    }
    public void setPassport(String passport) {
        this.passport = passport;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getPosition() {
        return position;
    }
    public void setPosition(String position) {
        this.position = position;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

}
