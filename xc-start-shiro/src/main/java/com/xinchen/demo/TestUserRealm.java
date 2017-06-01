package com.xinchen.demo;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;

/**
 * Description:测试自定义userRealm
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/5/8 21:50.
 * @see 2017/5/8 21:50 Created
 ****************************************/

public class TestUserRealm {
    public static void main(String[] args) {
        //创建SecurityManager工厂，生成SecurityManager环境（通过shrio的ini文件)
        Factory<SecurityManager> factory = new IniSecurityManagerFactory("classpath:shiro.ini");
        //创建SecurityManager
        SecurityManager manager = factory.getInstance();
        //将当前环境设为SecurityManager
        SecurityUtils.setSecurityManager(manager);
        //模拟Subject
        Subject subject = SecurityUtils.getSubject();
        //提交认证是说携带的信息储存在 token 中
        UsernamePasswordToken token = new UsernamePasswordToken("xinchen", "xinchen");
        try{
            subject.login(token);
        }catch (AuthorizationException e){
            e.printStackTrace();
        }
        //基于资源判断
        //判断已认证用户的资源是否拥有对应的操作
        boolean isPermitted = subject.isPermitted("user:update");
        System.out.println("判断已认证用户的资源是否拥有对应的操作 "+isPermitted);
        //使用check方法进行授权，如果不通过则抛出异常
        subject.checkPermission("item:add");//这是需要添加的，基于角色就不需要测试了
    }
}
