package com.xinchen.service;

import com.xinchen.Exception.ApplicationException;
import com.xinchen.dao.TestDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by xinchen on 2017/5/6.
 */
@Service("testService")
public class TestServiceImpl implements TestService{
    @Resource
    private TestDao testDao;

    @Override
    public void exception(Integer id) throws Exception {
        switch(id) {
            case 1:
                throw new ApplicationException(11, "service11");
            case 2:
                throw new ApplicationException(21, "service21");
            case 3:
                throw new ApplicationException(31, "service31");
            case 4:
                throw new ApplicationException(41, "service41");
            case 5:
                throw new ApplicationException(51, "service51");
            default:
                throw new ApplicationException("Service Parameter Error");
        }
    }

    @Override
    public void dao(Integer id) throws Exception {
        testDao.exception(id);
    }
}
