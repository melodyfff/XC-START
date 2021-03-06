package com.xinchen.controller;

import com.xinchen.Exception.ApplicationException;
import com.xinchen.service.TestService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by xinchen on 2017/5/6.
 */
@Controller
@RequestMapping("test")
public class TestController extends AbstractController{
    @Resource
    private TestService testService;

    @RequestMapping(value = "/controller", method = RequestMethod.GET)
    @RequiresPermissions("sys:menu:list")
    public void controller(HttpServletResponse response, Integer id) throws Exception {
        switch(id) {
            case 1:
                throw new ApplicationException(10, "controller10");
            case 2:
                throw new ApplicationException(20, "controller20");
            case 3:
                throw new ApplicationException(30, "controller30");
            case 4:
                throw new ApplicationException(40, "controller40");
            case 5:
                throw new ApplicationException(50, "controller50");
            default:
                throw new ApplicationException("Controller Parameter Error");
        }
    }

    @RequestMapping(value = "/service", method = RequestMethod.GET)
    public void service(HttpServletResponse response, Integer id) throws Exception {
        testService.exception(id);
    }

    @RequestMapping(value = "/dao")
    @RequiresPermissions("abcs")
    public void dao(HttpServletResponse response, Integer id) throws Exception {
        testService.dao(id);
    }
}
