package com.bookflow.controller;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@RequestMapping("/admin")
@Controller
public class AdminMangerController {

    
    @RequestMapping(value ="/login",method = {
            RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public String Login(
            @RequestParam("passport") String passPort,
            @RequestParam("password") String password,
            
            HttpRequest req ){
        
        
        return "";
    }
    
}
