package com.xinchen.dao;

import com.xinchen.Exception.ApplicationException;
import org.springframework.stereotype.Repository;

/**
 * Created by xinchen on 2017/5/6.
 */
@Repository("testDao")
public class TestDao {
    public void exception(Integer id) throws Exception {
        switch(id) {
            case 1:
                throw new ApplicationException(12, "dao12");
            case 2:
                throw new ApplicationException(22, "dao22");
            case 3:
                throw new ApplicationException(32, "dao32");
            case 4:
                throw new ApplicationException(42, "dao42");
            case 5:
                throw new ApplicationException(52, "dao52");
            default:
                throw new ApplicationException("Dao Parameter Error");
        }
    }
}
