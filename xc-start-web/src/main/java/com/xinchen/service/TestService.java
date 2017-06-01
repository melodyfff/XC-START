package com.xinchen.service;

/**
 * Created by xinchen on 2017/5/6.
 */
public interface TestService {
    void exception(Integer id) throws Exception;

    void dao(Integer id) throws Exception;
}
