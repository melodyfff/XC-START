package com.xinchen.controller;

import com.xinchen.entity.SysUserEntity;
import com.xinchen.service.SysUserService;
import com.xinchen.utils.ResonseDtail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@RequestMapping("api")
@Controller
public class SysUserController {

    @Autowired
    private SysUserService userService;

    @RequestMapping(value = "/user/{username}",method = RequestMethod.GET)
    @ResponseBody
    public ResonseDtail getUserList(@PathVariable("username") String username){
        ResonseDtail resonseDtail = new ResonseDtail();
        SysUserEntity userEntity = userService.queryByUserName(username);

        return  resonseDtail.put(userEntity);
    }
}
