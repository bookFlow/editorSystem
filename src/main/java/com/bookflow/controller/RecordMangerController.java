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
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookflow.domain.Admin;
import com.bookflow.domain.Record;
import com.bookflow.domain.RecordMix;
import com.bookflow.pojo.CommonRes;
import com.bookflow.service.RecordService;
import com.bookflow.util.ContantUtil;

@Controller
@RequestMapping("/record")
public class RecordMangerController {
    @Resource
    private RecordService recordServiceImp;
    private static final Logger LOGGER = LoggerFactory.getLogger(RecordMangerController.class);
    
    
    @RequestMapping(value ="/showRecordList",method = {
            RequestMethod.POST, RequestMethod.GET })
    public String showRecordList(
            HttpServletRequest req,
            HttpServletResponse res 
            ){
        int pageNum=0;
        String sid=req.getParameter("sid");
        String bid = req.getParameter("bid");

        if(StringUtil.isBlank(req.getParameter("pageNum")) || !StringUtil.isNumeric(req.getParameter("pageNum"))){
            pageNum=1;
        }
        else {
            int num=Integer.parseInt(req.getParameter("pageNum"));
            pageNum=num<1?1:num;//页数
        }
        Map<String, Object> map=new HashMap<String, Object>();
        if(!StringUtil.isBlank(sid))map.put("sid", sid);
        if(!StringUtil.isBlank(bid))map.put("uid", bid);
        map.put("start", ContantUtil.ADMIN_PAGE_NUM*(pageNum-1));
        map.put("end",ContantUtil.ADMIN_PAGE_NUM*(pageNum-1)+ContantUtil.ADMIN_PAGE_NUM-1);
        List<Record> list=recordServiceImp.findRecordsWihtParms(map);
        int allPageNums=recordServiceImp.findRecordsPageNumsWihtParms(map);//总页数
        req.setAttribute("list",list );
        req.setAttribute("totalPage", allPageNums);//总页数
        System.out.println("list'size:"+list.size());
        System.out.println("total:"+allPageNums);
        System.out.println("sid:"+sid);
        System.out.println("bid:"+bid);
        System.out.println("pageNum:"+pageNum);
        System.out.println("start:"+ContantUtil.ADMIN_PAGE_NUM*(pageNum-1));
        req.setAttribute("sid", sid); //姓名
        req.setAttribute("bid", bid); //账号
        req.setAttribute("pageNum", pageNum);//当前页数
        Admin admid= (Admin)req.getSession().getAttribute("user");
        req.setAttribute("position", admid.getPosition());//身份
        req.setAttribute("start",ContantUtil.ADMIN_PAGE_NUM*(pageNum-1));//索引，编号的话要+1
        req.setAttribute("end",ContantUtil.ADMIN_PAGE_NUM*(pageNum-1)+ContantUtil.ADMIN_PAGE_NUM-1);//索引，编号的话要+1
        return "record/recordListPage";
    }
    @RequestMapping(value ="/cancelRecord",method = {
            RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public String cancelRecord(
            HttpServletRequest req,
            HttpServletResponse res 
     ){
        try {
            int rid=(int)req.getAttribute("rid");
            RecordMix recordMix=recordServiceImp.findRecordDetail(rid);
            if(recordMix == null)throw new Exception();
            else {
                req.setAttribute("red", recordMix);
                return "record/recordDetail";
            }
            
        } catch (Exception e) {
            // TODO: handle exception
            LOGGER.error(e.getMessage());
            e.printStackTrace();
            CommonRes commonRes=new CommonRes();
            commonRes.setDes("操作失败");
            commonRes.setSucceed(false);
            return "error/error";
        }
        
        
        
        
        
    }
    @RequestMapping(value ="/showdetailRecord",method = {
            RequestMethod.POST, RequestMethod.GET })
    public String showdetailRecord(
            HttpServletRequest req,
            HttpServletResponse res 
     ){
      
        try {
            int rid=(int)req.getAttribute("rid");
            RecordMix recordMix=recordServiceImp.findRecordDetail(rid);
            if(recordMix == null)throw new Exception();
            else {
                req.setAttribute("red", recordMix);
                return "record/recordDetail";
            }
            
        } catch (Exception e) {
            // TODO: handle exception
            LOGGER.error(e.getMessage());
            e.printStackTrace();
            return "error/error";
        }
        
        
        
    }
}   
