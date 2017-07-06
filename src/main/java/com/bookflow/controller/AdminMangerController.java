package com.bookflow.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.bookflow.pojo.CheckLoginRes;
import com.bookflow.service.AdminService;

/**
 * 该controller用于人员管理
 * 1.登陆
 * 2.添加管理员
 * 3.删除管理员
 * 4.登出
 * 5.检查账号密码
 * */
@RequestMapping("/admin")
@Controller
public class AdminMangerController {

    @Resource
    private AdminService adminServiceImp;
    
    /**
     * 
     * 登陆
     * */
    @RequestMapping(value ="/login",method = {
            RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public String login(
            @RequestParam("passport") String passPort,
            @RequestParam("password") String passWord,
            
            HttpServletRequest req,
            HttpServletResponse res ){
        //校验账号密码，并最终返回jsp
        if(adminServiceImp.canLogin(passPort, passWord)){
            
            req.getSession().setAttribute("user", adminServiceImp.getAdmin(passPort, passWord));
            return "main"; //进入主页
        
         }else {
             
            return "admin/login";//还是显示登录页面
         }
      
    }
    /**
     * 
     * 检查账号密码是否正确
     * */
    @RequestMapping(value ="/checkLogin",method = {
            RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public JSONObject checkLogin(
            @RequestParam("passport") String passPort,
            @RequestParam("password") String passWord,
            HttpRequest req ){
        //校验账号密码,返回json对象
        CheckLoginRes checkLoginRes=new CheckLoginRes();
        if(!adminServiceImp.canLogin(passPort, passWord)){
        
           checkLoginRes.setDes("账号或密码错误，请重新输入!");
           checkLoginRes.setSucceed(false);
        }else {
            checkLoginRes.setSucceed(true);
        }
        return JSONObject.parseObject(JSONObject.toJSONString(checkLoginRes));
    }
    
}
