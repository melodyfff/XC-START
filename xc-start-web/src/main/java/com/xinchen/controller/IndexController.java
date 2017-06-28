package com.xinchen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by xinchen on 2017/5/3.
 */
@Controller
public class IndexController {
    @RequestMapping(value = "/{system}/{index}",method = RequestMethod.GET)
    public String index(@PathVariable("system") String system,
                        @PathVariable("index") String index){
        return system+"/"+index;
    }
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String formain(){
        return "index";
    }
}
