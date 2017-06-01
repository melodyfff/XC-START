package com.xinchen.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * 返回数据
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/4/30 20:57.
 * @see 2017/4/30 20:57 Created
 ****************************************/
public class ResonseDtail extends HashMap<String, Object> {
	private static final long serialVersionUID = 1L;
	
	public ResonseDtail() {
		put("code", 0);
	}
	
	public static ResonseDtail error() {
		return error(500, "未知异常，请联系管理员");
	}
	
	public static ResonseDtail error(String msg) {
		return error(500, msg);
	}
	
	public static ResonseDtail error(int code, String msg) {
		ResonseDtail resonseDtail = new ResonseDtail();
		resonseDtail.put("code", code);
		resonseDtail.put("msg", msg);
		return resonseDtail;
	}

	public static ResonseDtail success(String msg) {
		ResonseDtail resonseDtail = new ResonseDtail();
		resonseDtail.put("msg", msg);
		return resonseDtail;
	}
	
	public static ResonseDtail success(Map<String, Object> map) {
		ResonseDtail resonseDtail = new ResonseDtail();
		resonseDtail.putAll(map);
		return resonseDtail;
	}
	
	public static ResonseDtail success() {
		return new ResonseDtail();
	}

	public ResonseDtail put(String key, Object value) {
		super.put(key, value);
		return this;
	}
}
