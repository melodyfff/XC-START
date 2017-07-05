package com.xinchen.controller;

import com.sun.deploy.net.HttpResponse;
import com.xinchen.utils.ResonseDtail;
import com.xinchen.utils.ShiroUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

	/**
	 * 登录
	 */
	@RequestMapping(value = "/sys/login", method = RequestMethod.POST)
	@ResponseBody
	public ResonseDtail login(String username, String password)throws IOException {
		try{
			Subject subject = ShiroUtils.getSubject();
			//sha256加密
			password = new Sha256Hash(password).toHex();
			UsernamePasswordToken token = new UsernamePasswordToken(username, password);
			subject.login(token);
		}catch (UnknownAccountException e) {
			return ResonseDtail.error(e.getMessage());
		}catch (IncorrectCredentialsException e) {
			return ResonseDtail.error(e.getMessage());
		}catch (LockedAccountException e) {
			return ResonseDtail.error(e.getMessage());
		}catch (AuthenticationException e) {
			return ResonseDtail.error("账户验证失败");
		}

		return ResonseDtail.success("登录成功");
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
