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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.bookflow.domain.Admin;
import com.bookflow.domain.Book;
import com.bookflow.domain.BookMix;
import com.bookflow.pojo.CommonRes;
import com.bookflow.service.BookService;
import com.bookflow.service.imp.BookServiceImp;
import com.bookflow.util.ContantUtil;

@Controller
@RequestMapping("/book")
public class BookMangerController {
    @Resource
    private BookService bookServiceImp;
    private static final Logger LOGGER = LoggerFactory.getLogger(BookServiceImp.class);
    
    
    @RequestMapping(value ="/showBookList",method = {
            RequestMethod.POST, RequestMethod.GET })
    public String showBookList(
            HttpServletRequest req,
            HttpServletResponse res )
    {
        //-----抽参数
        int pageNum=0;
        String bname=req.getParameter("bname");
        String uid = req.getParameter("uid");
        String uname =req.getParameter("uname");
        if(StringUtil.isBlank(req.getParameter("pageNum")) || !StringUtil.isNumeric(req.getParameter("pageNum"))){
            pageNum=1;
        }
        else {
            int num=Integer.parseInt(req.getParameter("pageNum"));
            pageNum=num<1?1:num;//页数
        }
        Map<String, Object> map=new HashMap<String, Object>();
        if(!StringUtil.isBlank(bname))map.put("bname", bname);
        if(!StringUtil.isBlank(uid))map.put("uid", uid);
        if(!StringUtil.isBlank(uname))map.put("uname", uname);
        map.put("start", ContantUtil.ADMIN_PAGE_NUM*(pageNum-1));
        map.put("end",ContantUtil.ADMIN_PAGE_NUM*(pageNum-1)+ContantUtil.ADMIN_PAGE_NUM-1);
        List<Book> bookList=bookServiceImp.findBooksWithParm(map);//符合条件的分页列表
        int allPageNums=bookServiceImp.findNumsBooksWithParm(map);//总页数
        
        req.setAttribute("list",bookList );
        req.setAttribute("totalPage", allPageNums);//总页数
        System.out.println("list'size:"+bookList.size());
        System.out.println("total:"+allPageNums);
        System.out.println("bname:"+bname);
        System.out.println("uid:"+uid);
        System.out.println("uname:"+uname);
        System.out.println("pageNum:"+pageNum);
        System.out.println("start:"+ContantUtil.ADMIN_PAGE_NUM*(pageNum-1));
        req.setAttribute("bname", bname); //姓名
        req.setAttribute("uid", uid); //账号
        req.setAttribute("uname", uname); //账号
        req.setAttribute("pageNum", pageNum);//当前页数
        Admin admid= (Admin)req.getSession().getAttribute("user");
        req.setAttribute("position", admid.getPosition());//身份
        req.setAttribute("start",ContantUtil.ADMIN_PAGE_NUM*(pageNum-1));//索引，编号的话要+1
        req.setAttribute("end",ContantUtil.ADMIN_PAGE_NUM*(pageNum-1)+ContantUtil.ADMIN_PAGE_NUM-1);//索引，编号的话要+1
        return "book/bookListPage";
    }   
    
    @RequestMapping(value ="/showBooDetail",method = {
            RequestMethod.POST, RequestMethod.GET })
    public String showBooDetail(
            HttpServletRequest req,
            HttpServletResponse res )
    {
        System.out.println("展示详情");
        //System.out.println(req.getParameter("bid"));
        int bid = 0;
        
        if(StringUtil.isBlank(req.getParameter("bid")) || !StringUtil.isNumeric(req.getParameter("bid"))){
            bid=-1;
        }
        else {
            bid=Integer.parseInt(req.getParameter("bid"));
        }
        BookMix bookMix=bookServiceImp.findBookDetail(bid);
        if(bookMix.getImages().indexOf(";")!=-1)bookMix.setImages(bookMix.getImages().split(";")[0]);
        req.setAttribute("book", bookMix);
        
        return "book/bookDetailPage";
        
    }
    /**
     * 取消发布
     * 
     * */
    @RequestMapping(value ="/deleteBook",method = {
            RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public JSONObject changeBookStatus(
            HttpServletRequest req,
            HttpServletResponse res )
    {
        int bid = 0;
        
        if(StringUtil.isBlank(req.getParameter("bid")) || !StringUtil.isNumeric(req.getParameter("bid"))){
            bid=-1;
        }
        else {
            bid=Integer.parseInt(req.getParameter("bid"));
            
        }
        CommonRes commonRes;
        try {
            commonRes = bookServiceImp.deleteBook(bid);
            if(commonRes == null){
                commonRes = new CommonRes() ;
                commonRes.setSucceed(false);
                commonRes.setDes("删除失败");
                return JSONObject.parseObject(JSONObject.toJSONString(commonRes));
            }else {
                
                return JSONObject.parseObject(JSONObject.toJSONString(commonRes));
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            LOGGER.error(e.getMessage());
            
            e.printStackTrace();
            commonRes = new CommonRes() ;
            commonRes.setSucceed(false);
            commonRes.setDes("删除失败");
            return JSONObject.parseObject(JSONObject.toJSONString(commonRes));
        }
      
        
    }
    
}
