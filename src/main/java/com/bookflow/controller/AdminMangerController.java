package com.bookflow.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.helper.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.bookflow.domain.Admin;
import com.bookflow.pojo.CommonRes;
import com.bookflow.service.AdminService;
import com.bookflow.service.imp.AdminServiceImp;
import com.bookflow.util.ContantUtil;

/**
 * 该controller用于人员管理
 * 1.登陆
 * 2.添加管理员
 * 3.删除管理员
 * 4.登出
 * 5.检查账号密码
 * */

@Controller
@RequestMapping("/admin")
public class AdminMangerController {

    @Resource
    private AdminService adminServiceImp;
    private static final Logger LOGGER = LoggerFactory.getLogger(AdminMangerController.class);
    /**
     * 
     * 登陆
     * */
    @RequestMapping(value ="/login",method = {
            RequestMethod.POST, RequestMethod.GET })
    public String login(

            HttpServletRequest req,
            HttpServletResponse res ){
        //校验账号密码，并最终返回jsp
        System.out.println("登陆！");
        String passPort=req.getParameter("passport");
        String passWord=req.getParameter("password");
        if( 
             req.getSession().getAttribute("user")!=null      //只要不等于null
       ||  ( 
             !StringUtil.isBlank(passWord) && 
             !StringUtil.isBlank(passPort) &&  
             adminServiceImp.canLogin(passPort, passWord)
           )
                //账号密码都不为空且能够登陆
          ){
           
            return "main"; //进入主页
        
         }else {
            LOGGER.info("账号密码验证失败");
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
            HttpServletRequest req,
            HttpServletResponse res ){
        //校验账号密码,返回json对象
        CommonRes checkLoginRes=new CommonRes();
        if(!adminServiceImp.canLogin(passPort, passWord)){
        
           checkLoginRes.setDes("账号或密码错误，请重新输入!");
           checkLoginRes.setSucceed(false);
        }else {
            Admin admin=adminServiceImp.getAdmin(passPort, passWord);
            req.getSession().setAttribute("user",admin);
            req.setAttribute("user", admin);
            checkLoginRes.setSucceed(true);
        }
        return JSONObject.parseObject(JSONObject.toJSONString(checkLoginRes));
    }
    /**
     * 
     * 登出
     * 
     * 
     * */
    @RequestMapping(value ="/logOut",method = {
            RequestMethod.POST, RequestMethod.GET })
    public String logOut(
            HttpServletRequest req,
            HttpServletResponse res ){
        //校验账号密码,返回json对象
        
        req.getSession().removeAttribute("user");//清除
        return "redirect:login";
    }
    
    /**
     * 
     * 展示列表页面
     * 
     * 
     * */
    @RequestMapping(value ="/showUserList",method = {
            RequestMethod.POST, RequestMethod.GET })
    public String showUserList(
            HttpServletRequest req,
            HttpServletResponse res )
    {
        //-----抽参数
        int pageNum=0;
        String name=req.getParameter("name");
        String passport = req.getParameter("passport");
        if(StringUtil.isBlank(req.getParameter("pageNum")) || !StringUtil.isNumeric(req.getParameter("pageNum"))){
            pageNum=1;
        }
        else {
            int num=Integer.parseInt(req.getParameter("pageNum"));
            pageNum=num<1?1:num;//页数
        }
        Map<String, Object> map=new HashMap<String, Object>();
        if(!StringUtil.isBlank(name))map.put("name", name);
        if(!StringUtil.isBlank(passport))map.put("passport", passport);
        map.put("start", ContantUtil.ADMIN_PAGE_NUM*(pageNum-1));
        map.put("end",ContantUtil.ADMIN_PAGE_NUM*(pageNum-1)+ContantUtil.ADMIN_PAGE_NUM-1);
        List<Admin> admins=adminServiceImp.findAdminsWithParms(map);//符合条件的分页列表
        int allPageNums=adminServiceImp.adminsNumWithParms(map);//总页数
        
        req.setAttribute("adminList",admins );
        req.setAttribute("totalPage", allPageNums);//总页数
        System.out.println("list'size:"+admins.size());
        System.out.println("total:"+allPageNums);
        System.out.println("name:"+name);
        System.out.println("passPort:"+passport);
        System.out.println("pageNum:"+pageNum);
        System.out.println("start:"+ContantUtil.ADMIN_PAGE_NUM*(pageNum-1));
        req.setAttribute("name", name); //姓名
        req.setAttribute("passPort", passport); //账号
        req.setAttribute("pageNum", pageNum);//当前页数
        Admin admid= (Admin)req.getSession().getAttribute("user");
        req.setAttribute("position", admid.getPosition());//身份
        req.setAttribute("start",ContantUtil.ADMIN_PAGE_NUM*(pageNum-1));//索引，编号的话要+1
        req.setAttribute("end",ContantUtil.ADMIN_PAGE_NUM*(pageNum-1)+ContantUtil.ADMIN_PAGE_NUM-1);//索引，编号的话要+1
        return "admin/userListPage";
    }
    /**
     * 
     * 删除用户
     * 
     * */
    @RequestMapping(value ="/deleteAdmin",method = {
            RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public JSONObject deleteAdmin(
            HttpServletRequest req,
            HttpServletResponse res ){
         String passPort=req.getParameter("passport");
         Admin admin=(Admin)req.getSession().getAttribute("user");
         CommonRes commonRes = adminServiceImp.deleteAdmin(admin, passPort);
         return JSONObject.parseObject(JSONObject.toJSONString(commonRes));
        
        
    }
    /**
     * 查看某个账号是否存在
     * 
     * */
    @RequestMapping(value ="/hasAdmin",method = {
            RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public JSONObject hasAdmin(
            HttpServletRequest req,
            HttpServletResponse res ){
         String passPort=req.getParameter("passport");
         CommonRes commonRes = adminServiceImp.hasAdmin(passPort);
         return JSONObject.parseObject(JSONObject.toJSONString(commonRes));
        
        
    }
    /**
     * 插入用户
     * 
     * */
    @RequestMapping(value ="/addAdmin",method = {
            RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public JSONObject addAdmin(
            HttpServletRequest req,
            HttpServletResponse res ){
         String passPort=req.getParameter("passport");
         String name=req.getParameter("name");
         String passWord=req.getParameter("password"); 
         String position=req.getParameter("position");
         CommonRes commonRes = adminServiceImp.addAdmin(passPort, passWord, name,position);
         
         return JSONObject.parseObject(JSONObject.toJSONString(commonRes));
        
        
    }
    
    
}
