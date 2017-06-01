package com.xinchen.demo;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;

/**
 * Description:shiro  demo
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/5/8 21:13.
 * @see 2017/5/8 21:13 Created
 ****************************************/

public class demo1 {
    public static void main(String[] args) {
        //创建SecurityManager工厂，生成SecurityManager环境（通过shrio的ini文件)
        Factory<SecurityManager> factory = new IniSecurityManagerFactory("classpath:shiro-demo.ini");
        //创建SecurityManager
        SecurityManager manager = factory.getInstance();
        //将当前环境设为SecurityManager
        SecurityUtils.setSecurityManager(manager);
        //模拟Subject
        Subject subject = SecurityUtils.getSubject();
        //提交认证是说携带的信息储存在 token 中
        UsernamePasswordToken token = new UsernamePasswordToken("xinchen", "xinchen");
        try {
            //模拟获取登陆
             subject.login(token);
        } catch (AuthenticationException e) {
            e.printStackTrace();
        }

        //判断是否认证通过
        boolean isOk = subject.isAuthenticated();
        System.out.println("用户是否登录：" + isOk);

        //模拟用户退出登陆
        subject.logout();
        isOk = subject.isAuthenticated();
        System.out.println("用户是否登录：" + isOk);
    }
}
