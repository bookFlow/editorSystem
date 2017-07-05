package com.bookflow.util;

import java.io.IOException;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;
import org.jsoup.Connection;
import org.jsoup.Connection.Method;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Service;

@Service
public class HttpClient {
    //用来发送post/get请求

   //超时时间
    public static final int MAX_TIMEOUT=15000;
    
    //原子post方法
    public static String  POST(Map<String, String> headerMap,Map<String, String> formMap,String url) throws IOException {
        
        Connection connection=Jsoup.connect(url);//
        //connection=connection.cookies(Constant.COOKIES);
        Set<Entry<String , String>> set=headerMap.entrySet();
        for(Entry<String, String> entry:set){
            
            connection.header(entry.getKey(), entry.getValue());//设置头
        }
        
        connection.data(formMap);//设置请求数据
        try {
            Response res=connection.ignoreContentType(true).timeout(HttpClient.MAX_TIMEOUT).method(Method.POST).execute();
            return res.body();
        } catch (IOException e) {
            // TODO Auto-generated catch block
 
            System.out.println("url:"+url);
            System.out.println("curstart:"+formMap.get("curstart"));

            throw e;

        }
        
    }
    //原子get方法
    public static String  GET(Map<String, String> headerMap,String url) {
        Connection connection=Jsoup.connect(url);//
        //connection=connection.cookies(Constant.COOKIES);
        Set<Entry<String , String>> set=headerMap.entrySet();
        for(Entry<String, String> entry:set){
            connection.header(entry.getKey(), entry.getValue());//设置头
        }
      
        try {
            Response res=connection.timeout(HttpClient.MAX_TIMEOUT).method(Method.GET).execute();
            return res.body();
        } catch (IOException e) {
            // TODO Auto-generated catch block
          
            e.printStackTrace();
            return "";
            
            
        }
        
        
      
    }
    //原子post方法,DOCUMENT
    public static Document  POST_DOCUMENT(Map<String, String> headerMap,Map<String, String> formMap,String url) {
        Connection connection=Jsoup.connect(url);//
        //connection=connection.cookies(Constant.COOKIES);
        Set<Entry<String , String>> set=headerMap.entrySet();
        for(Entry<String, String> entry:set){
            connection.header(entry.getKey(), entry.getValue());//设置头
        }
        connection.data(formMap);//设置请求数据
        try {
            Response res=connection.timeout(HttpClient.MAX_TIMEOUT).method(Method.POST).execute();
            return Jsoup.parse(res.body());
        } catch (IOException e) {
            // TODO Auto-generated catch block
     
            e.printStackTrace();
            //切换节点
     
            return null;
            
            
        }
       
    }
    
    //原子get方法,DOCUMENT
    public static Document  GET_DOCUMENT(Map<String, String> headerMap,String url) {
        Connection connection=Jsoup.connect(url);//
        //connection=connection.cookies(Constant.COOKIES);
        Set<Entry<String , String>> set=headerMap.entrySet();
        for(Entry<String, String> entry:set){
            connection.header(entry.getKey(), entry.getValue());//设置头
        }
     
        try {
            Response res=connection.timeout(HttpClient.MAX_TIMEOUT).method(Method.GET).execute();
            
            return Jsoup.parse(res.body());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            System.out.println("GET url:"+url);
            
            e.printStackTrace();
            return null;
            
            
        }
    }
  
   
 
}
