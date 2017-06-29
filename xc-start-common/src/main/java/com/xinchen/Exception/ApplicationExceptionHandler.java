package com.xinchen.Exception;

import com.alibaba.fastjson.JSON;
import com.xinchen.utils.ResonseDtail;
import org.apache.shiro.authz.UnauthorizedException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 异常处理器
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/4/30 20:57.
 * @see 2017/4/30 20:57 Created
 ****************************************/
@Component
public class ApplicationExceptionHandler implements HandlerExceptionResolver {
    private Logger logger = LoggerFactory.getLogger(getClass());

    @Override
    public ModelAndView resolveException(HttpServletRequest request,
                                         HttpServletResponse response, Object handler, Exception ex) {

        ResonseDtail resonseDtail = new ResonseDtail();

        if (ex instanceof ApplicationException) {
            resonseDtail.put("code", ((ApplicationException) ex).getCode());
            resonseDtail.put("msg",  ex.getMessage());
        } else if (ex instanceof DuplicateKeyException) {
            resonseDtail = ResonseDtail.error("数据库中已存在该记录");
        } else if (ex instanceof NullPointerException) {
            resonseDtail = ResonseDtail.error("空指针异常" + ex.toString() + " " + ex.getMessage());
        } else if(ex instanceof UnauthorizedException){
            resonseDtail = ResonseDtail.error("403 没有权限");
        }else {
            resonseDtail = ResonseDtail.error("系统错误");
        }

        // 判断是否ajax请求
        if (!(request.getHeader("accept").contains("application/json") || (request
                .getHeader("X-Requested-With") != null && request.getHeader(
                "X-Requested-With").contains("XMLHttpRequest")))) {
            // 不是ajax请求返回页面
            ModelAndView mv = new ModelAndView("error");
            mv.addObject("err", resonseDtail);
            return mv;
        } else {
            // 如果是ajax请求，返回JSON串
            response.setContentType("application/json;charset=utf-8");
            response.setCharacterEncoding("utf-8");
            try {
                PrintWriter writer = response.getWriter();
                writer.write(JSON.toJSONString(resonseDtail));
                writer.flush();
            } catch (IOException e) {
                logger.warn(e.toString());
            }
        }
        return new ModelAndView();
    }
}
