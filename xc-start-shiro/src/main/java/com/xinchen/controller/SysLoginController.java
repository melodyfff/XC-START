package com.xinchen.controller;

import com.xinchen.utils.ResonseDtail;
import com.xinchen.utils.ShiroUtils;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
import org.apache.shiro.authc.*;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

/**
 * 登录相关
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年11月10日 下午1:15:31
 */
@Controller
public class SysLoginController {

	@Autowired
	private CacheManager cacheManager;

	/**
	 * 登录
	 */
	@RequestMapping(value = "/sys/login", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView login(String username, String password)throws IOException {
//		try{
			Subject subject = ShiroUtils.getSubject();
			//sha256加密
			Element putGreeting = new Element("test", "Hello, World!");
			cacheManager.getCache("userCache").put(putGreeting);
			password = new Sha256Hash(password).toHex();
			UsernamePasswordToken token = new UsernamePasswordToken(username, password);
			subject.login(token);
//		}catch (UnknownAccountException e) {
//			return ResonseDtail.error(e.getMessage());
//		}catch (IncorrectCredentialsException e) {
//			return ResonseDtail.error(e.getMessage());
//		}catch (LockedAccountException e) {
//			return ResonseDtail.error(e.getMessage());
//		}catch (AuthenticationException e) {
//			return ResonseDtail.error("账户验证失败");
//		}

//		return ResonseDtail.success("登录成功");
		return new ModelAndView("/test/test");
	}

	/**
	 * 退出
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout() {
		ShiroUtils.logout();
		return "redirect:login";
	}

}
