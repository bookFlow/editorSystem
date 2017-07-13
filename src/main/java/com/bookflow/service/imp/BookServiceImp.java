package com.bookflow.service.imp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;





import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bookflow.dao.BookDao;
import com.bookflow.dao.RecordDao;
import com.bookflow.domain.Book;
import com.bookflow.domain.BookMix;
import com.bookflow.domain.Record;
import com.bookflow.pojo.CommonRes;
import com.bookflow.service.BookService;
import com.bookflow.util.ContantUtil;
@Service
public class BookServiceImp implements BookService{
    
    private static final Logger LOGGER = LoggerFactory.getLogger(BookServiceImp.class);
    @Resource
    private BookDao bookDao;
    @Resource
    private RecordDao recordDao;
    @Override
    public List<Book> findBooksWithParm(Map<String, Object> map) {
        // TODO Auto-generated method stub
        try {
            return bookDao.findBooksWithParms(map);
        } catch (Exception e) {
            // TODO: handle exception
            LOGGER.error(e.getMessage());
            e.printStackTrace();
            return new ArrayList<Book>();
        }
    }
    @Override
    public int findNumsBooksWithParm(Map<String, Object> map) {
            try {
            
            int i= bookDao.findNumOfBooks(map);
            System.out.println("书数量:"+i);
            int rest=i % ContantUtil.ADMIN_PAGE_NUM;
            rest=rest>0?1:0;
            int base=(int)(i/ContantUtil.ADMIN_PAGE_NUM);
            return base+rest;//一共页数
        } catch (Exception e) {
            // TODO: handle exception
            LOGGER.error(e.getMessage());
            e.printStackTrace();
            return 0;
        }

    }
    @Override
    public BookMix findBookDetail(int bid) {
        // TODO Auto-generated method stub
        try {
             
           return bookDao.findBookDetailById(bid);
            
        } catch (Exception e) {
            // TODO: handle exception
            LOGGER.error(e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    @Override
    @Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class,timeout=1,isolation=Isolation.DEFAULT) 
    public CommonRes deleteBook(int bid) throws Exception {
    	CommonRes commonRes=new CommonRes();
        // TODO Auto-generated method stub
        try {
           
            int i=-1;
            int num= recordDao.findRecordNum(bid);
            if(num> 0 ){
                Record record = recordDao.findRecordBybid(bid); 
                i=recordDao.deleteRecordByRid(record.getRid());
            }
            num = bookDao.selectNumsDetail(bid);
            if(num > 0) {
            	bookDao.deleteBookDetail(bid);
            	
            }
            
            int num1= bookDao.deleteBookWithId(bid);
            if(num1 < 1 ){
                commonRes.setSucceed(false);
                commonRes.setDes("删除失败");
                return commonRes;
            }else {
            	 
            	commonRes.setSucceed(true);
                commonRes.setDes("删除成功");
                return commonRes;
            	
            }
         } catch (Exception e) {
             // TODO: handle exception
             LOGGER.error(e.getMessage());
             e.printStackTrace();
             throw new Exception();
             
         }
        
    }

}
