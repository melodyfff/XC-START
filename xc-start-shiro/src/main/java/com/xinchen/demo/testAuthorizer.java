package com.xinchen.demo;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;

import java.util.Arrays;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/5/8 21:27.
 * @see 2017/5/8 21:27 Created
 ****************************************/

public class testAuthorizer {
    public static void main(String[] args) {
        //创建SecurityManager工厂，生成SecurityManager环境（通过shrio的ini文件）
        //通过ini配置文件创建
        Factory<SecurityManager> factory = new IniSecurityManagerFactory("classpath:shrio-permission.ini");

        //创建SecurityManager
        SecurityManager manager= factory.getInstance();

        //将当前环境设为SecurityManager
        SecurityUtils.setSecurityManager(manager);

        //模拟Subject
        Subject subject = SecurityUtils.getSubject();

        //提交认证是说携带的信息储存在　Token　中
        UsernamePasswordToken token = new UsernamePasswordToken("xinchen", "xinchen");

        //模拟登陆
        try{
            subject.login(token);
        }catch (AuthorizationException e) {
            e.printStackTrace();
        }

        //基于角色判断
        //判断已认证用户是否拥有role1角色
        boolean isHasRole = subject.hasRole("role2");
        System.out.println("判断已认证用户是否拥有role2角色 "+isHasRole);

        //也可以判断已认证用户是否有多个角色
        boolean isHasAllRoles = subject.hasAllRoles(Arrays.asList("role1","role2"));
        System.out.println("判断已认证用户是否有多个角色"+isHasAllRoles);

        //基于资源判断
        //判断已认证用户的资源是否拥有对应单个的操作
        boolean isPermitted = subject.isPermitted("user:create");
        System.out.println("判断已认证用户的资源是否拥有对应的单个操作 "+isPermitted);

        //判断已认证用户的资源是否拥有对应的多个操作
        boolean isPermittedAll = subject.isPermittedAll("user:create","user:update");
        System.out.println("判断已认证用户的资源是否拥有对应的多个操作 "+isPermittedAll);
    }
}
