package com.xinchen.demo;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import java.util.ArrayList;
import java.util.List;

/**
 * Description:自定义范围
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/5/8 21:39.
 * @see 2017/5/8 21:39 Created
 ****************************************/

public class UserRealm extends AuthorizingRealm {
    //设置realm名，需要继承setName()方法
    @Override
    public void setName(String name) {
        super.setName("userName");
    }
    //认证方法
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //得到token的用户信息
        String userId = (String) token.getPrincipal();
        //模拟数据库返回数据，如果不存在就返回null

        //模拟数据库返回数据，存在就返回一个credentials
        String password = "xinchen";
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(userId, password, this.getName());
        return info;
    }
    //授权方法(依赖于上面的认证信息)
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String userId = (String) principals.getPrimaryPrincipal();
        //模拟从数据库得来的角色信息
        List<String> listPermission = new ArrayList<String>();
        //模拟用户创建权限
        listPermission.add("user:update");
        //这里的info使用的是SimpleAuthorizationInfo
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        //SimpleAuthorizationInfo携带的是数据库返回的信息，数据实现的是collection接口
        info.addStringPermissions(listPermission);
        return info;
    }
}
